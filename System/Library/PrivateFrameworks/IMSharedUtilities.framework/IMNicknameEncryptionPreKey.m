@interface IMNicknameEncryptionPreKey
+ (id)generatePreKeyWithError:(id *)a3;
+ (id)preKeyWithDataRepresentation:(id)a3 error:(id *)a4;
- (IMNicknameEncryptionPreKey)initWithGeneratedData:(id)a3 derivedData:(id)a4;
- (IMNicknameFieldEncryptionKey)fieldEncryptionKey;
- (IMNicknameFieldTaggingKey)fieldTaggingKey;
- (IMNicknameRecordTaggingKey)recordTaggingKey;
- (NSData)derivedData;
- (NSData)generatedData;
- (id)_subDerivedKeyDataAtIndex:(unint64_t)a3;
- (id)dataRepresentation;
- (void)setDerivedData:(id)a3;
- (void)setGeneratedData:(id)a3;
@end

@implementation IMNicknameEncryptionPreKey

+ (id)generatePreKeyWithError:(id *)a3
{
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Generating new IMNicknameEncryptionPreKey", v9, 2u);
    }
  }
  v6 = +[IMNicknameEncryptionHelpers _randomBytesWithLength:16 error:a3];
  if (v6)
  {
    v7 = [a1 preKeyWithDataRepresentation:v6 error:a3];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)preKeyWithDataRepresentation:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CA58] dataWithLength:48];
  if (CCKDFParametersCreateHkdf())
  {
    if (a4)
    {
      v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28228];
      v26[0] = @"Failed to create key derivation parameters";
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      *a4 = [v8 errorWithDomain:@"IMNicknameEncryptionHelpersErrorDomain" code:-2000 userInfo:v9];
    }
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = *a4;
        *(_DWORD *)buf = 138412290;
        id v24 = v11;
        _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Failed to create derivation parameters {error: %@}", buf, 0xCu);
      }
    }
LABEL_15:
    v19 = 0;
    goto LABEL_16;
  }
  id v12 = v6;
  [v12 bytes];
  [v12 length];
  id v13 = v7;
  [v13 mutableBytes];
  [v13 length];
  int v14 = CCDeriveKey();
  CCKDFParametersDestroy();
  if (v14)
  {
    if (a4)
    {
      v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28228];
      v22 = @"Failed to derive encryption/signing keys";
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      *a4 = [v15 errorWithDomain:@"IMNicknameEncryptionHelpersErrorDomain" code:-2000 userInfo:v16];
    }
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = *a4;
        *(_DWORD *)buf = 138412290;
        id v24 = v18;
        _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "Failed to create preKey from data representation {error: %@}", buf, 0xCu);
      }
    }
    goto LABEL_15;
  }
  v19 = (void *)[objc_alloc((Class)a1) initWithGeneratedData:v12 derivedData:v13];
LABEL_16:

  return v19;
}

- (IMNicknameEncryptionPreKey)initWithGeneratedData:(id)a3 derivedData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMNicknameEncryptionPreKey;
  v9 = [(IMNicknameEncryptionPreKey *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_generatedData, a3);
    objc_storeStrong((id *)&v10->_derivedData, a4);
  }

  return v10;
}

- (id)dataRepresentation
{
  return self->_generatedData;
}

- (IMNicknameFieldEncryptionKey)fieldEncryptionKey
{
  v2 = [(IMNicknameEncryptionPreKey *)self _subDerivedKeyDataAtIndex:0];
  v3 = [(IMNicknameEncryptionKey *)[IMNicknameFieldEncryptionKey alloc] initWithData:v2];

  return v3;
}

- (IMNicknameFieldTaggingKey)fieldTaggingKey
{
  v2 = [(IMNicknameEncryptionPreKey *)self _subDerivedKeyDataAtIndex:1];
  v3 = [(IMNicknameEncryptionKey *)[IMNicknameFieldTaggingKey alloc] initWithData:v2];

  return v3;
}

- (IMNicknameRecordTaggingKey)recordTaggingKey
{
  v2 = [(IMNicknameEncryptionPreKey *)self _subDerivedKeyDataAtIndex:2];
  v3 = [(IMNicknameEncryptionKey *)[IMNicknameRecordTaggingKey alloc] initWithData:v2];

  return v3;
}

- (id)_subDerivedKeyDataAtIndex:(unint64_t)a3
{
  return -[NSData subdataWithRange:](self->_derivedData, "subdataWithRange:", 16 * a3, 16);
}

- (NSData)generatedData
{
  return self->_generatedData;
}

- (void)setGeneratedData:(id)a3
{
}

- (NSData)derivedData
{
  return self->_derivedData;
}

- (void)setDerivedData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivedData, 0);

  objc_storeStrong((id *)&self->_generatedData, 0);
}

@end