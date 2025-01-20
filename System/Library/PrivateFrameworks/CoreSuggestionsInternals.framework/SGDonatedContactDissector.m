@interface SGDonatedContactDissector
- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5;
@end

@implementation SGDonatedContactDissector

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isSent] & 1) == 0)
  {
    v8 = [v6 author];
    v9 = [v8 contactIdentifier];
    if (v9)
    {
      v10 = sgLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v9;
        _os_log_debug_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEBUG, "Dissecting a donated contact identifier: %@", buf, 0xCu);
      }

      v11 = +[SGIdentityKey keyForPersonHandle:v8];
      if (v11)
      {
        uint64_t v12 = *MEMORY[0x1E4F1AEE0];
        v27[0] = *MEMORY[0x1E4F1ADC8];
        v27[1] = v12;
        uint64_t v13 = *MEMORY[0x1E4F1ADE0];
        v27[2] = *MEMORY[0x1E4F1ADF0];
        v27[3] = v13;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
        v15 = +[SGContactStoreFactory contactStore];
        id v26 = 0;
        v16 = [v15 unifiedContactWithIdentifier:v9 keysToFetch:v14 error:&v26];
        id v17 = v26;
        if (v16)
        {
          id v18 = [NSString alloc];
          [v16 givenName];
          v19 = id v24 = v17;
          [v16 familyName];
          v20 = v25 = v14;
          v21 = [v18 initWithFormat:@"%@ %@", v19, v20];

          v22 = [[SGPipelineEnrichment alloc] initWithPseudoContactWithKey:v11 parent:v7 name:v21];
          v23 = [MEMORY[0x1E4F5DA20] extractionInfoWithExtractionType:128 modelVersion:0 confidence:0];
          [(SGEntity *)v22 setExtractionInfo:v23];

          id v17 = v24;
          [v7 addEnrichment:v22];
          [v7 setContactInformationExtracted:1];

          v14 = v25;
        }
        else
        {
          v21 = sgLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v9;
            _os_log_debug_impl(&dword_1CA650000, v21, OS_LOG_TYPE_DEBUG, "Received a donated contact identifier: %@, but contact store returned nil", buf, 0xCu);
          }
        }
      }
    }
  }
}

@end