@interface IMNicknameEncryptionHelpers
+ (id)_decryptAndVerifyCipherFields:(id)a3 withPreKey:(id)a4 recordTagToVerify:(id)a5 error:(id *)a6;
+ (id)_decryptCipherField:(id)a3 withFieldEncryptionKey:(id)a4 fieldTaggingKey:(id)a5 error:(id *)a6;
+ (id)_decryptCipherFields:(id)a3 withFieldEncryptionKey:(id)a4 fieldTaggingKey:(id)a5 error:(id *)a6;
+ (id)_encryptAndTagPlainFields:(id)a3 withPreKey:(id)a4 returningRecordTag:(id *)a5 error:(id *)a6;
+ (id)_encryptPlainField:(id)a3 withFieldEncryptionKey:(id)a4 fieldTaggingKey:(id)a5 error:(id *)a6;
+ (id)_encryptPlainFields:(id)a3 withFieldEncryptionKey:(id)a4 fieldTaggingKey:(id)a5 error:(id *)a6;
+ (id)_fieldTagForFieldName:(id)a3 cipherData:(id)a4 IV:(id)a5 fieldTaggingKey:(id)a6 error:(id *)a7;
+ (id)_hmacForData:(id)a3 key:(id)a4;
+ (id)_performOperation:(unsigned int)a3 onData:(id)a4 withFieldEncryptionKey:(id)a5 iv:(id)a6 error:(id *)a7;
+ (id)_randomBytesWithLength:(unint64_t)a3 error:(id *)a4;
+ (id)_recordTagForCipherFields:(id)a3 recordTaggingKey:(id)a4 error:(id *)a5;
+ (id)_tagForData:(id)a3 key:(id)a4 error:(id *)a5;
+ (id)decryptAndVerifyCipherFields:(id)a3 withPreKey:(id)a4 recordTagToVerify:(id)a5 error:(id *)a6;
+ (id)encryptAndTagPlainField:(id)a3 withPreKey:(id)a4 returningFieldTag:(id *)a5 error:(id *)a6;
+ (id)encryptAndTagPlainFields:(id)a3 withPreKey:(id)a4 returningRecordTag:(id *)a5 error:(id *)a6;
@end

@implementation IMNicknameEncryptionHelpers

+ (id)encryptAndTagPlainFields:(id)a3 withPreKey:(id)a4 returningRecordTag:(id *)a5 error:(id *)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v28 = a4;
  if (!a6)
  {
    uint64_t v35 = 0;
    a6 = (id *)&v35;
  }
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = [v10 allKeys];
      *(_DWORD *)buf = 138412290;
      id v37 = v12;
      _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Encrypting nickname fields {plainFieldsMap.keys: %@}", buf, 0xCu);
    }
  }
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1A07A54E8;
  v33[3] = &unk_1E5A101D8;
  id v14 = v13;
  id v34 = v14;
  [v10 enumerateKeysAndObjectsUsingBlock:v33];
  v15 = [a1 _encryptAndTagPlainFields:v14 withPreKey:v28 returningRecordTag:a5 error:a6];
  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v17);
        }
        v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v22 = [v21 dataRepresentationWithError:a6];
        if (!v22)
        {

          if (IMOSLoggingEnabled())
          {
            v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              id v26 = *a6;
              *(_DWORD *)buf = 138412546;
              id v37 = v26;
              __int16 v38 = 2112;
              id v39 = v10;
              _os_log_impl(&dword_1A0772000, v25, OS_LOG_TYPE_INFO, "Failed to encrypt nickname record {error: %@, plainFieldsMap: %@}", buf, 0x16u);
            }
          }
          id v24 = 0;
          goto LABEL_21;
        }
        v23 = [v21 fieldName];
        [v16 setObject:v22 forKey:v23];
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v40 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }

  id v24 = v16;
LABEL_21:

  return v24;
}

+ (id)decryptAndVerifyCipherFields:(id)a3 withPreKey:(id)a4 recordTagToVerify:(id)a5 error:(id *)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v33 = a4;
  id v34 = a5;
  if (!a6)
  {
    uint64_t v43 = 0;
    a6 = (id *)&v43;
  }
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v11 = [v9 allKeys];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        v16 = [v9 objectForKey:v15];
        id v17 = +[IMNicknameEncryptionCipherRecordField cipherRecordFieldWithFieldName:v15 dataRepresentation:v16 error:a6];
        if (!v17)
        {

          if (IMOSLoggingEnabled())
          {
            v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              id v28 = *a6;
              *(_DWORD *)buf = 138412802;
              id v46 = v28;
              __int16 v47 = 2112;
              id v48 = v9;
              __int16 v49 = 2112;
              id v50 = v34;
              _os_log_impl(&dword_1A0772000, v27, OS_LOG_TYPE_INFO, "Failed to create cipherFields from dictionary {error: %@, cipherfieldsMap: %@, tagToVerify: %@}", buf, 0x20u);
            }
          }
          uint64_t v19 = 0;
          goto LABEL_31;
        }
        [v10 addObject:v17];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v51 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  uint64_t v18 = [a1 _decryptAndVerifyCipherFields:v10 withPreKey:v33 recordTagToVerify:v34 error:a6];
  if (v18)
  {
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v18, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(v20);
          }
          id v24 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          v25 = [v24 plainData];
          id v26 = [v24 fieldName];
          [v19 setObject:v25 forKey:v26];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v21);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        id v30 = *a6;
        *(_DWORD *)buf = 138412802;
        id v46 = v30;
        __int16 v47 = 2112;
        id v48 = v9;
        __int16 v49 = 2112;
        id v50 = v34;
        _os_log_impl(&dword_1A0772000, v29, OS_LOG_TYPE_INFO, "Failed to decrypt cipher fields {error: %@, cipherfieldsMap: %@, tagToVerify: %@}", buf, 0x20u);
      }
    }
    uint64_t v19 = 0;
  }

LABEL_31:

  return v19;
}

+ (id)_encryptAndTagPlainFields:(id)a3 withPreKey:(id)a4 returningRecordTag:(id *)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v10 fieldEncryptionKey];
  uint64_t v13 = [v10 fieldTaggingKey];
  id v14 = [a1 _encryptPlainFields:v11 withFieldEncryptionKey:v12 fieldTaggingKey:v13 error:a6];

  if (v14)
  {
    uint64_t v15 = [v10 recordTaggingKey];
    *a5 = [a1 _recordTagForCipherFields:v14 recordTaggingKey:v15 error:a6];
  }

  return v14;
}

+ (id)encryptAndTagPlainField:(id)a3 withPreKey:(id)a4 returningFieldTag:(id *)a5 error:(id *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v20 = a3;
    id v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = a4;
    id v12 = a3;
    uint64_t v13 = [v10 arrayWithObjects:&v20 count:1];

    id v14 = objc_msgSend(v11, "fieldEncryptionKey", v20, v21);
    uint64_t v15 = [v11 fieldTaggingKey];

    v16 = [a1 _encryptPlainFields:v13 withFieldEncryptionKey:v14 fieldTaggingKey:v15 error:a6];

    if (v16 && [v16 count])
    {
      id v17 = [v16 firstObject];
      *a5 = [v17 fieldTag];

      uint64_t v18 = [v16 firstObject];
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

+ (id)_decryptAndVerifyCipherFields:(id)a3 withPreKey:(id)a4 recordTagToVerify:(id)a5 error:(id *)a6
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    uint64_t v13 = [v11 recordTaggingKey];
    id v14 = [a1 _recordTagForCipherFields:v10 recordTaggingKey:v13 error:a6];

    if (v14)
    {
      if ([v14 isEqualToTag:v12 error:a6])
      {
        uint64_t v15 = [v11 fieldEncryptionKey];
        v16 = [v11 fieldTaggingKey];
        id v17 = [a1 _decryptCipherFields:v10 withFieldEncryptionKey:v15 fieldTaggingKey:v16 error:a6];

LABEL_20:
        goto LABEL_21;
      }
      if (IMOSLoggingEnabled())
      {
        id v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          id v22 = *a6;
          int v24 = 138412802;
          id v25 = v22;
          __int16 v26 = 2112;
          id v27 = v14;
          __int16 v28 = 2112;
          id v29 = v12;
          _os_log_impl(&dword_1A0772000, v20, OS_LOG_TYPE_INFO, "Tag mismatch -- record decryption failed {error: %@, tag: %@, recordTagToVerify: %@}", (uint8_t *)&v24, 0x20u);
        }
LABEL_18:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = *a6;
        int v24 = 138412546;
        id v25 = v21;
        __int16 v26 = 2112;
        id v27 = v10;
        _os_log_impl(&dword_1A0772000, v20, OS_LOG_TYPE_INFO, "Failed to compute record tag -- nickname decryption failed {error: %@, cipherFields: %@}", (uint8_t *)&v24, 0x16u);
      }
      goto LABEL_18;
    }
    id v17 = 0;
    goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      id v25 = v10;
      _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "Missing tag to verify -- Nickname decryption failed {cipherFields: %@}", (uint8_t *)&v24, 0xCu);
    }
  }
  if (a6)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28228];
    v31[0] = @"Missing recordTagToVerify";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    [v19 errorWithDomain:@"IMNicknameEncryptionHelpersErrorDomain" code:-1000 userInfo:v14];
    id v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  id v17 = 0;
LABEL_21:

  return v17;
}

+ (id)_encryptPlainFields:(id)a3 withFieldEncryptionKey:(id)a4 fieldTaggingKey:(id)a5 error:(id *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = objc_msgSend(a1, "_encryptPlainField:withFieldEncryptionKey:fieldTaggingKey:error:", *(void *)(*((void *)&v23 + 1) + 8 * i), v11, v12, a6, (void)v23);
        if (!v19)
        {

          id v21 = 0;
          goto LABEL_11;
        }
        id v20 = (void *)v19;
        [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  id v21 = v13;
LABEL_11:

  return v21;
}

+ (id)_recordTagForCipherFields:(id)a3 recordTaggingKey:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [a3 sortedArrayUsingComparator:&unk_1EF2BF0E0];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "fieldTag", (void)v24);
        uint64_t v17 = [v16 dataRepresentation];
        [v10 appendData:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  uint64_t v18 = [v8 data];
  uint64_t v19 = [a1 _tagForData:v10 key:v18 error:a5];

  id v20 = +[IMNicknameEncryptionRecordTag tagWithDataRepresentation:v19 error:a5];
  id v21 = v20;
  if (v20) {
    id v22 = v20;
  }

  return v21;
}

+ (id)_encryptPlainField:(id)a3 withFieldEncryptionKey:(id)a4 fieldTaggingKey:(id)a5 error:(id *)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [a1 _randomBytesWithLength:16 error:a6];
  if (v13)
  {
    uint64_t v14 = [v10 plainData];
    uint64_t v15 = [a1 _performOperation:0 onData:v14 withFieldEncryptionKey:v11 iv:v13 error:a6];

    if (v15)
    {
      uint64_t v16 = [v10 fieldName];
      uint64_t v17 = [a1 _fieldTagForFieldName:v16 cipherData:v15 IV:v13 fieldTaggingKey:v12 error:a6];

      if (v17)
      {
        uint64_t v18 = [IMNicknameEncryptionCipherRecordField alloc];
        uint64_t v19 = [v10 fieldName];
        a6 = [(IMNicknameEncryptionCipherRecordField *)v18 initWithFieldName:v19 cipherData:v15 IV:v13 tag:v17];
      }
      else if (a6)
      {
        if (IMOSLoggingEnabled())
        {
          long long v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            id v25 = *a6;
            int v27 = 138412546;
            id v28 = v25;
            __int16 v29 = 2112;
            id v30 = v10;
            _os_log_impl(&dword_1A0772000, v24, OS_LOG_TYPE_INFO, "Failed to compute tag -- nickname encryption failed {error: %@, plainField: %@}", (uint8_t *)&v27, 0x16u);
          }
        }
        a6 = 0;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          id v23 = *a6;
          int v27 = 138412546;
          id v28 = v23;
          __int16 v29 = 2112;
          id v30 = v10;
          _os_log_impl(&dword_1A0772000, v22, OS_LOG_TYPE_INFO, "Failed to encrypt data -- nickname encryption failed {error: %@, plainField: %@}", (uint8_t *)&v27, 0x16u);
        }
      }
      a6 = 0;
    }
  }
  else if (a6)
  {
    if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = *a6;
        int v27 = 138412546;
        id v28 = v21;
        __int16 v29 = 2112;
        id v30 = v10;
        _os_log_impl(&dword_1A0772000, v20, OS_LOG_TYPE_INFO, "Failed to generate IV -- nickname encryption failed {error: %@, plainField: %@}", (uint8_t *)&v27, 0x16u);
      }
    }
    a6 = 0;
  }

  return a6;
}

+ (id)_decryptCipherFields:(id)a3 withFieldEncryptionKey:(id)a4 fieldTaggingKey:(id)a5 error:(id *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = objc_msgSend(a1, "_decryptCipherField:withFieldEncryptionKey:fieldTaggingKey:error:", *(void *)(*((void *)&v23 + 1) + 8 * i), v11, v12, a6, (void)v23);
        if (!v18)
        {
          if (IMOSLoggingEnabled())
          {
            id v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              id v21 = *a6;
              *(_DWORD *)buf = 138412546;
              id v28 = v21;
              __int16 v29 = 2112;
              id v30 = v14;
              _os_log_impl(&dword_1A0772000, v20, OS_LOG_TYPE_INFO, "Failed to decrypt cipher field {error: %@, cipherField: %@}", buf, 0x16u);
            }
          }
          id v19 = 0;
          goto LABEL_15;
        }
        [v13 addObject:v18];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  id v19 = v13;
LABEL_15:

  return v19;
}

+ (id)_decryptCipherField:(id)a3 withFieldEncryptionKey:(id)a4 fieldTaggingKey:(id)a5 error:(id *)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v10 fieldName];
  id v14 = [v10 cipherData];
  uint64_t v15 = [v10 IV];
  uint64_t v16 = [a1 _fieldTagForFieldName:v13 cipherData:v14 IV:v15 fieldTaggingKey:v12 error:a6];

  if (!v16)
  {
    if (IMOSLoggingEnabled())
    {
      long long v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = *a6;
        int v32 = 138412546;
        id v33 = v26;
        __int16 v34 = 2112;
        id v35 = v10;
        _os_log_impl(&dword_1A0772000, v25, OS_LOG_TYPE_INFO, "Failed to calculate field tag -- nickname decryption failed {error: %@, cipherField: %@}", (uint8_t *)&v32, 0x16u);
      }
      goto LABEL_12;
    }
LABEL_13:
    long long v24 = 0;
    goto LABEL_20;
  }
  uint64_t v17 = [v10 fieldTag];
  char v18 = [v16 isEqualToTag:v17 error:a6];

  if ((v18 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      long long v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v27 = *a6;
        int v32 = 138412802;
        id v33 = v27;
        __int16 v34 = 2112;
        id v35 = v16;
        __int16 v36 = 2112;
        id v37 = v10;
        _os_log_impl(&dword_1A0772000, v25, OS_LOG_TYPE_INFO, "Field tag mismatch -- nickname decryption failed {error: %@, tag: %@, cipherField: %@}", (uint8_t *)&v32, 0x20u);
      }
LABEL_12:

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  id v19 = [v10 cipherData];
  id v20 = [v10 IV];
  id v21 = [a1 _performOperation:1 onData:v19 withFieldEncryptionKey:v11 iv:v20 error:a6];

  if (v21)
  {
    id v22 = [IMNicknameEncryptionPlainRecordField alloc];
    long long v23 = [v10 fieldName];
    long long v24 = [(IMNicknameEncryptionPlainRecordField *)v22 initWithFieldName:v23 plainData:v21];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v29 = *a6;
        id v30 = [v10 IV];
        int v32 = 138412802;
        id v33 = v29;
        __int16 v34 = 2112;
        id v35 = v10;
        __int16 v36 = 2112;
        id v37 = v30;
        _os_log_impl(&dword_1A0772000, v28, OS_LOG_TYPE_INFO, "Decryption operation failed -- nickname decryption failed {error: %@, cipherField: %@, cipherField.IV: %@}", (uint8_t *)&v32, 0x20u);
      }
    }
    long long v24 = 0;
  }

LABEL_20:

  return v24;
}

+ (id)_performOperation:(unsigned int)a3 onData:(id)a4 withFieldEncryptionKey:(id)a5 iv:(id)a6 error:(id *)a7
{
  uint64_t v10 = *(void *)&a3;
  v51[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  CCCryptorRef cryptorRef = 0;
  if ((unint64_t)[v13 length] <= 0xF)
  {
    id v14 = [NSString stringWithFormat:@"IV too short {IV: %@}", v13];
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = *MEMORY[0x1E4F28228];
    v51[0] = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
    uint64_t v17 = [v15 errorWithDomain:@"IMNicknameEncryptionHelpersErrorDomain" code:-1000 userInfo:v16];

    if (IMOSLoggingEnabled())
    {
      char v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v43 = v17;
        __int16 v44 = 1024;
        int v45 = v10;
        _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "IV too short -- Failed to perform nickname crypto operation {error: %@, operation: %d}", buf, 0x12u);
      }
    }
    if (a7) {
      *a7 = v17;
    }

    goto LABEL_9;
  }
  id v20 = (const void *)[v13 bytes];
  id v21 = v12;
  uint64_t v22 = CCCryptorCreateWithMode(v10, 4u, 0, 0, v20, (const void *)[v21 bytes], objc_msgSend(v21, "length"), 0, 0, 0, 2u, &cryptorRef);
  if (!v22)
  {
    id v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", CCCryptorGetOutputLength(cryptorRef, objc_msgSend(v11, "length"), 1));
    size_t dataOutMoved = 0;
    id v28 = cryptorRef;
    id v29 = v11;
    id v30 = (const void *)[v29 bytes];
    size_t v31 = [v29 length];
    id v14 = v27;
    uint64_t v32 = CCCryptorUpdate(v28, v30, v31, (void *)[v14 mutableBytes], objc_msgSend(v14, "length"), &dataOutMoved);
    [v14 setLength:dataOutMoved];
    if (cryptorRef) {
      CCCryptorRelease(cryptorRef);
    }
    if (!v32)
    {
      a7 = (id *)v14;
      goto LABEL_10;
    }
    id v33 = [NSString stringWithFormat:@"Crypto operation failed {operation: %u, retval: %d}", v10, v32];
    __int16 v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = *MEMORY[0x1E4F28228];
    long long v41 = v33;
    id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    __int16 v36 = [v34 errorWithDomain:@"IMNicknameEncryptionHelpersErrorDomain" code:-2000 userInfo:v35];

    if (IMOSLoggingEnabled())
    {
      id v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v43 = v36;
        __int16 v44 = 1024;
        int v45 = v32;
        __int16 v46 = 1024;
        int v47 = v10;
        _os_log_impl(&dword_1A0772000, v37, OS_LOG_TYPE_INFO, "Failed to update cypher -- Failed to perform nickname crypto operation {error: %@, retval: %d, operation: %d}", buf, 0x18u);
      }
    }
    if (a7) {
      *a7 = v36;
    }

LABEL_9:
    a7 = 0;
LABEL_10:

    goto LABEL_11;
  }
  if (a7)
  {
    id v14 = [NSString stringWithFormat:@"Failed to create Crytpor {operation: %u, retval: %d}", v10, v22];
    long long v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v48 = *MEMORY[0x1E4F28228];
    id v49 = v14;
    long long v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    *a7 = [v23 errorWithDomain:@"IMNicknameEncryptionHelpersErrorDomain" code:-2000 userInfo:v24];

    if (IMOSLoggingEnabled())
    {
      long long v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = *a7;
        *(_DWORD *)buf = 138412802;
        id v43 = v26;
        __int16 v44 = 1024;
        int v45 = v22;
        __int16 v46 = 1024;
        int v47 = v10;
        _os_log_impl(&dword_1A0772000, v25, OS_LOG_TYPE_INFO, "Failed to create cypher -- Failed to perform nickname crypto operation  {error: %@, retval: %d, operation: %d}", buf, 0x18u);
      }
    }
    goto LABEL_9;
  }
LABEL_11:

  return a7;
}

+ (id)_fieldTagForFieldName:(id)a3 cipherData:(id)a4 IV:(id)a5 fieldTaggingKey:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  uint64_t v15 = [a3 dataUsingEncoding:4];
  uint64_t v16 = (void *)[v15 mutableCopy];

  [v16 appendData:v13];
  [v16 appendData:v14];

  uint64_t v17 = [v12 data];

  char v18 = [a1 _tagForData:v16 key:v17 error:a7];

  id v19 = +[IMNicknameEncryptionFieldTag tagWithDataRepresentation:v18 error:a7];

  return v19;
}

+ (id)_tagForData:(id)a3 key:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 length];
  if (a5 && !v10)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28228];
    v16[0] = @"Passed empty data to tag calculation";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *a5 = [v11 errorWithDomain:@"IMNicknameEncryptionHelpersErrorDomain" code:-1000 userInfo:v12];
  }
  id v13 = [a1 _hmacForData:v8 key:v9];

  return v13;
}

+ (id)_hmacForData:(id)a3 key:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1CA58];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithLength:32];
  id v9 = v6;
  uint64_t v10 = (const void *)[v9 bytes];
  size_t v11 = [v9 length];

  id v12 = v7;
  id v13 = (const void *)[v12 bytes];
  size_t v14 = [v12 length];

  id v15 = v8;
  CCHmac(2u, v10, v11, v13, v14, (void *)[v15 mutableBytes]);

  return v15;
}

+ (id)_randomBytesWithLength:(unint64_t)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:");
  id v6 = objc_claimAutoreleasedReturnValue();
  uint64_t Bytes = CCRandomGenerateBytes((void *)[v6 mutableBytes], a3);
  if (Bytes)
  {
    id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Call to CCRandomGenerateBytes faield {status: %d}", Bytes);
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28228];
    v15[0] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    size_t v11 = [v9 errorWithDomain:@"IMNicknameEncryptionHelpersErrorDomain" code:-2000 userInfo:v10];

    if (a4) {
      *a4 = v11;
    }

    id v12 = 0;
  }
  else
  {
    id v12 = v6;
  }

  return v12;
}

@end