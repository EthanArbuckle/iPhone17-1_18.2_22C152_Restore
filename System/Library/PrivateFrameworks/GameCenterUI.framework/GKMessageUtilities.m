@interface GKMessageUtilities
+ (id)contactFromEmailOrPhoneNumber:(id)a3 fromContactStore:(id)a4;
+ (id)messagesRecipientHandleForContact:(id)a3;
+ (id)playerWithPhoneNumberOrEmail:(id)a3;
+ (id)playerWithPhoneNumberOrEmail:(id)a3 givenName:(id)a4;
+ (id)predicateWithPhoneNumberOrEmail:(id)a3;
+ (void)linkMetadataWithPlayerRange:(_NSRange)a3 shareURL:(id)a4 completionHandler:(id)a5;
@end

@implementation GKMessageUtilities

+ (id)messagesRecipientHandleForContact:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1CA60];
  v5 = [v3 phoneNumbers];
  v44 = objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v42 = v3;
  v6 = [v3 phoneNumbers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v51;
    uint64_t v10 = *MEMORY[0x1E4F1B710];
    uint64_t v11 = *MEMORY[0x1E4F1B750];
    uint64_t v12 = *MEMORY[0x1E4F1B730];
    uint64_t v45 = *MEMORY[0x1E4F1B738];
    uint64_t v43 = *MEMORY[0x1E4F1B730];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v51 != v9) {
          objc_enumerationMutation(v6);
        }
        v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v15 = [v14 label];
        if (([v15 isEqualToString:v10] & 1) == 0
          && ([v15 isEqualToString:v11] & 1) == 0
          && ([v15 isEqualToString:v12] & 1) == 0
          && ([v15 isEqualToString:v45] & 1) == 0)
        {
          v16 = [v14 label];

          if (v16)
          {
            v17 = [v14 value];
            v18 = [v17 stringValue];
            v19 = [v14 label];
            [v44 setObject:v18 forKeyedSubscript:v19];

            uint64_t v12 = v43;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v8);
  }

  v20 = v44;
  v21 = [v44 objectForKeyedSubscript:*MEMORY[0x1E4F1B758]];
  if (!v21)
  {
    v21 = [v44 objectForKeyedSubscript:*MEMORY[0x1E4F1B728]];
    if (!v21)
    {
      v21 = [v44 objectForKeyedSubscript:*MEMORY[0x1E4F1B720]];
      if (!v21)
      {
        v22 = [v42 phoneNumbers];
        v23 = [v22 firstObject];
        v24 = [v23 value];
        v21 = [v24 stringValue];

        if (!v21)
        {
          v25 = (void *)MEMORY[0x1E4F1CA60];
          v26 = [v42 emailAddresses];
          v27 = objc_msgSend(v25, "dictionaryWithCapacity:", objc_msgSend(v26, "count"));

          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          v28 = [v42 emailAddresses];
          uint64_t v29 = [v28 countByEnumeratingWithState:&v46 objects:v54 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v47;
            do
            {
              for (uint64_t j = 0; j != v30; ++j)
              {
                if (*(void *)v47 != v31) {
                  objc_enumerationMutation(v28);
                }
                v33 = *(void **)(*((void *)&v46 + 1) + 8 * j);
                uint64_t v34 = [v33 label];
                if (v34)
                {
                  v35 = (void *)v34;
                  v36 = [v33 value];

                  if (v36)
                  {
                    v37 = [v33 value];
                    v38 = [v33 label];
                    [v27 setObject:v37 forKeyedSubscript:v38];
                  }
                }
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v46 objects:v54 count:16];
            }
            while (v30);
          }

          v21 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F1B6F0]];
          if (!v21)
          {
            v21 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F1B6F8]];
            if (!v21)
            {
              v39 = [v42 emailAddresses];
              v40 = [v39 firstObject];
              v21 = [v40 value];
            }
          }

          v20 = v44;
        }
      }
    }
  }

  return v21;
}

+ (void)linkMetadataWithPlayerRange:(_NSRange)a3 shareURL:(id)a4 completionHandler:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1E4F636D8];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMessageUtilities.m", 76, "+[GKMessageUtilities linkMetadataWithPlayerRange:shareURL:completionHandler:]");
  uint64_t v12 = [v10 dispatchGroupWithName:v11];

  v13 = [MEMORY[0x1E4F636F0] currentGame];
  v14 = [v13 bundleIdentifier];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __77__GKMessageUtilities_linkMetadataWithPlayerRange_shareURL_completionHandler___block_invoke;
  v29[3] = &unk_1E5F63008;
  id v30 = v14;
  id v15 = v12;
  id v31 = v15;
  id v16 = v13;
  id v32 = v16;
  id v17 = v14;
  [v15 perform:v29];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __77__GKMessageUtilities_linkMetadataWithPlayerRange_shareURL_completionHandler___block_invoke_4;
  v22[3] = &unk_1E5F63030;
  id v23 = v16;
  id v24 = v15;
  NSUInteger v27 = location;
  NSUInteger v28 = length;
  id v25 = v8;
  id v26 = v9;
  id v18 = v9;
  id v19 = v8;
  id v20 = v15;
  id v21 = v16;
  [v20 notifyOnMainQueueWithBlock:v22];
}

void __77__GKMessageUtilities_linkMetadataWithPlayerRange_shareURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
  v5 = [v4 bulletinServicePrivate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__GKMessageUtilities_linkMetadataWithPlayerRange_shareURL_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5F62FE0;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v11 = v3;
  id v10 = *(id *)(a1 + 48);
  id v7 = v3;
  [v5 fetchMessageImageForBundleID:v6 handler:v8];
}

void __77__GKMessageUtilities_linkMetadataWithPlayerRange_shareURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithData:v3 MIMEType:@"image/png"];
    [*(id *)(a1 + 32) setResult:v4];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__GKMessageUtilities_linkMetadataWithPlayerRange_shareURL_completionHandler___block_invoke_3;
    v7[3] = &unk_1E5F62FB8;
    v5 = *(void **)(a1 + 40);
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    id v6 = (id)[v5 loadIconForStyle:9 withCompletionHandler:v7];
  }
}

uint64_t __77__GKMessageUtilities_linkMetadataWithPlayerRange_shareURL_completionHandler___block_invoke_3(uint64_t a1, UIImage *image)
{
  if (image)
  {
    id v3 = UIImagePNGRepresentation(image);
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithData:v3 MIMEType:@"image/png"];
    [*(id *)(a1 + 32) setResult:v4];
  }
  else
  {
    v5 = GKGameCenterUIFrameworkBundle();
    id v3 = [v5 _gkPathForMessageImage];

    v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithData:v4 MIMEType:@"image/png"];
    [*(id *)(a1 + 32) setResult:v6];
  }
  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

void __77__GKMessageUtilities_linkMetadataWithPlayerRange_shareURL_completionHandler___block_invoke_4(uint64_t a1)
{
  id v11 = objc_alloc_init(MEMORY[0x1E4F30A30]);
  v2 = [*(id *)(a1 + 32) name];
  [v11 setGame:v2];

  id v3 = [*(id *)(a1 + 40) result];
  [v11 setImage:v3];

  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = v4 + *(void *)(a1 + 64);
  if (v4)
  {
    objc_msgSend(v11, "setMinimumNumberOfPlayers:");
    [v11 setMaximumNumberOfPlayers:v5];
  }
  else
  {
    [v11 setNumberOfPlayers:v5];
  }
  id v6 = GKGameCenterUIFrameworkBundle();
  id v7 = [v6 _gkPathForMessageImage];

  id v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v7];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithData:v8 MIMEType:@"image/png"];
  [v11 setIcon:v9];

  id v10 = objc_alloc_init(MEMORY[0x1E4F30A78]);
  [v10 setOriginalURL:*(void *)(a1 + 48)];
  [v10 setSpecialization:v11];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (id)playerWithPhoneNumberOrEmail:(id)a3
{
  return (id)[a1 playerWithPhoneNumberOrEmail:a3 givenName:0];
}

+ (id)playerWithPhoneNumberOrEmail:(id)a3 givenName:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  if ([v5 containsString:@"@"])
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1BA20]) initWithLabel:&stru_1F07B2408 value:v5];
    v14[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v7 setEmailAddresses:v9];
  }
  else
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:v5];
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1BA20]) initWithLabel:&stru_1F07B2408 value:v8];
    v13 = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    [v7 setPhoneNumbers:v10];
  }
  if ([v6 length]) {
    [v7 setGivenName:v6];
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F63788]) initWithContact:v7];

  return v11;
}

+ (id)predicateWithPhoneNumberOrEmail:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_6;
  }
  if (IMStringIsEmail())
  {
    uint64_t v4 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v3];
    goto LABEL_7;
  }
  if (MEMORY[0x1B3E83580](v3))
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:v3];
    uint64_t v4 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v5];
  }
  else
  {
LABEL_6:
    uint64_t v4 = 0;
  }
LABEL_7:

  return v4;
}

+ (id)contactFromEmailOrPhoneNumber:(id)a3 fromContactStore:(id)a4
{
  v30[14] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[GKMessageUtilities predicateWithPhoneNumberOrEmail:v5];
  if (v7)
  {
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000;
    NSUInteger v27 = __Block_byref_object_copy_;
    NSUInteger v28 = __Block_byref_object_dispose_;
    id v29 = 0;
    id v8 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    uint64_t v9 = *MEMORY[0x1E4F1AE08];
    v30[0] = v8;
    v30[1] = v9;
    uint64_t v10 = *MEMORY[0x1E4F1AEE0];
    v30[2] = *MEMORY[0x1E4F1ADC8];
    v30[3] = v10;
    uint64_t v11 = *MEMORY[0x1E4F1ADF0];
    v30[4] = *MEMORY[0x1E4F1AEB0];
    v30[5] = v11;
    uint64_t v12 = *MEMORY[0x1E4F1ADE0];
    v30[6] = *MEMORY[0x1E4F1AEA0];
    v30[7] = v12;
    uint64_t v13 = *MEMORY[0x1E4F1AEB8];
    v30[8] = *MEMORY[0x1E4F1AF30];
    v30[9] = v13;
    uint64_t v14 = *MEMORY[0x1E4F1AFA8];
    v30[10] = *MEMORY[0x1E4F1AEC0];
    v30[11] = v14;
    uint64_t v15 = *MEMORY[0x1E4F1AF98];
    v30[12] = *MEMORY[0x1E4F1AE28];
    v30[13] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:14];

    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v16];
    [v17 setPredicate:v7];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__GKMessageUtilities_contactFromEmailOrPhoneNumber_fromContactStore___block_invoke;
    v23[3] = &unk_1E5F63058;
    v23[4] = &v24;
    [v6 enumerateContactsWithFetchRequest:v17 error:0 usingBlock:v23];
    id v18 = (id)v25[5];

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v19 = (NSObject **)MEMORY[0x1E4F63860];
    id v20 = *MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860])
    {
      id v21 = (id)GKOSLoggers();
      id v20 = *v19;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      +[GKMessageUtilities contactFromEmailOrPhoneNumber:fromContactStore:]((uint64_t)v5, v20);
    }
    id v18 = 0;
  }

  return v18;
}

uint64_t __69__GKMessageUtilities_contactFromEmailOrPhoneNumber_fromContactStore___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v15 = a2;
  if (![v15 contactType])
  {
    id v7 = [v15 givenName];
    uint64_t v8 = [v7 length];
    uint64_t v9 = v15;
    uint64_t v10 = v8;
    if (!v8)
    {
      id v3 = [v15 familyName];
      if (![v3 length])
      {

        goto LABEL_13;
      }
      uint64_t v9 = v15;
    }
    uint64_t v11 = [v9 emailAddresses];
    if ([v11 count])
    {

      if (!v10) {
LABEL_12:
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      *a3 = 1;
      goto LABEL_13;
    }
    uint64_t v12 = [v15 phoneNumbers];
    uint64_t v13 = [v12 count];

    if (!v10) {
    if (v13)
    }
      goto LABEL_12;
  }
LABEL_13:

  return MEMORY[0x1F41817F8]();
}

+ (void)contactFromEmailOrPhoneNumber:(uint64_t)a1 fromContactStore:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AF250000, a2, OS_LOG_TYPE_DEBUG, "Could not create predicate for handle: %@", (uint8_t *)&v2, 0xCu);
}

@end