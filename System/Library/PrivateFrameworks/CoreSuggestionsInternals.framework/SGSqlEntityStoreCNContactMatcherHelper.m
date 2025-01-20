@interface SGSqlEntityStoreCNContactMatcherHelper
- (BOOL)isMe;
- (NSArray)addressTags;
- (NSArray)emailTags;
- (NSArray)phoneTags;
- (NSArray)socialProfileTags;
- (NSArray)strongNamePatterns;
- (NSArray)weakNamePatterns;
- (NSString)interactionContactIdentifier;
- (NSString)prefilterNameMatchTerms;
- (SGSqlEntityStoreCNContactMatcherHelper)initWithCNContact:(id)a3;
@end

@implementation SGSqlEntityStoreCNContactMatcherHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nicks, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

- (BOOL)isMe
{
  v3 = +[SGContactStoreFactory contactStore];
  v4 = +[SGCuratedContactMatcher fetchMeContactFromContactStore:v3];
  LOBYTE(self) = [v4 isSameAsOrUnifiedWithContact:self->_contact];

  return (char)self;
}

- (NSString)interactionContactIdentifier
{
  v2 = (void *)MEMORY[0x1E4F5D9F0];
  v3 = [(CNContact *)self->_contact identifier];
  v4 = [v2 interactionContactIdentifier:v3];
  v5 = [v4 name];

  return (NSString *)v5;
}

- (NSArray)addressTags
{
  v2 = [(CNContact *)self->_contact postalAddresses];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SGSqlEntityStoreCNContactMatcherHelper_addressTags__block_invoke_2;
  v5[3] = &unk_1E65BA020;
  id v6 = &__block_literal_global_44_24223;
  v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", v5);

  return (NSArray *)v3;
}

id __53__SGSqlEntityStoreCNContactMatcherHelper_addressTags__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [a2 value];
  v4 = (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  v5 = SGNormalizeCNAddress(v4);

  id v6 = [MEMORY[0x1E4F5D9F0] contactDetail:v5];
  v7 = [v6 name];

  return v7;
}

id __53__SGSqlEntityStoreCNContactMatcherHelper_addressTags__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_new();
  uint64_t v4 = [v2 street];
  if (v4
    && (v5 = (void *)v4,
        [v2 street],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 length],
        v6,
        v5,
        v7))
  {
    v8 = [v2 street];
    [v3 setStreet:v8];
  }
  else
  {
    [v3 setStreet:@"#NOSTREET#"];
  }
  uint64_t v9 = [v2 city];
  if (v9
    && (v10 = (void *)v9,
        [v2 city],
        v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 length],
        v11,
        v10,
        v12))
  {
    v13 = [v2 city];
    [v3 setCity:v13];
  }
  else
  {
    [v3 setCity:@"#NOCITY#"];
  }

  return v3;
}

- (NSArray)socialProfileTags
{
  id v2 = [(CNContact *)self->_contact socialProfiles];
  v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_40_24234);

  return (NSArray *)v3;
}

id __59__SGSqlEntityStoreCNContactMatcherHelper_socialProfileTags__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [SGSocialProfileDetails alloc];
  uint64_t v4 = [v2 value];

  v5 = [(SGSocialProfileDetails *)v3 initWithCNSocialProfile:v4];
  id v6 = (void *)MEMORY[0x1E4F5D9F0];
  uint64_t v7 = [(SGSocialProfileDetails *)v5 preferredUniqueIdentifier];
  SGNormalizeSocialProfile(v7);
  objc_claimAutoreleasedReturnValue();
  v8 = [v6 contactDetail:v7];
  uint64_t v9 = [v8 name];

  return v9;
}

- (NSArray)phoneTags
{
  id v2 = [(CNContact *)self->_contact phoneNumbers];
  v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_38);

  return (NSArray *)v3;
}

id __51__SGSqlEntityStoreCNContactMatcherHelper_phoneTags__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 value];
  v3 = [v2 stringValue];
  uint64_t v4 = SGDataDetectorsScanForPhoneLessCarefully(v3);
  v5 = SGNormalizePhoneNumber();

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F5D9F0] contactDetail:v5];
    uint64_t v7 = [v6 name];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSArray)emailTags
{
  id v2 = [(CNContact *)self->_contact emailAddresses];
  v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_35);

  return (NSArray *)v3;
}

id __51__SGSqlEntityStoreCNContactMatcherHelper_emailTags__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F5D9F0];
  v3 = [a2 value];
  uint64_t v4 = SGNormalizeEmailAddress();
  v5 = [v2 contactDetail:v4];
  id v6 = [v5 name];

  return v6;
}

- (NSArray)strongNamePatterns
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v31 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v3 = self->_nicks;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v9 = (void *)MEMORY[0x1CB79B230]();
        if ([v8 length])
        {
          id v10 = [NSString alloc];
          v11 = [(CNContact *)self->_contact familyName];
          uint64_t v12 = (void *)[v10 initWithFormat:@"%@ %@", v8, v11];
          [v31 addObject:v12];
        }
        else
        {
          v11 = sgLogHandle();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_11;
          }
          uint64_t v12 = [(CNContact *)self->_contact givenName];
          *(_DWORD *)buf = 138412290;
          v37 = v12;
          _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "empty string found in nickname data for: %@", buf, 0xCu);
        }

LABEL_11:
      }
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v5);
  }

  v13 = [(CNContact *)self->_contact familyName];
  if ([v13 length])
  {
    v14 = [(CNContact *)self->_contact givenName];
    uint64_t v15 = [v14 length];

    if (v15)
    {
      v16 = (void *)MEMORY[0x1CB79B230]();
      id v17 = [NSString alloc];
      v18 = [(CNContact *)self->_contact givenName];
      v19 = [(CNContact *)self->_contact familyName];
      v20 = (void *)[v17 initWithFormat:@"%@ %@", v18, v19];
      [v31 addObject:v20];
    }
  }
  else
  {
  }
  v21 = [(CNContact *)self->_contact givenName];
  if ([v21 length])
  {
    v22 = [(CNContact *)self->_contact middleName];
    uint64_t v23 = [v22 length];

    if (v23)
    {
      v24 = (void *)MEMORY[0x1CB79B230]();
      id v25 = [NSString alloc];
      v26 = [(CNContact *)self->_contact givenName];
      v27 = [(CNContact *)self->_contact middleName];
      v28 = (void *)[v25 initWithFormat:@"%@ %@", v26, v27];
      [v31 addObject:v28];
    }
  }
  else
  {
  }
  v29 = [v31 allObjects];

  return (NSArray *)v29;
}

- (NSArray)weakNamePatterns
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1CB79B230](self, a2);
  v44 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v3 = self->_nicks;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v46 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v9 = (void *)MEMORY[0x1CB79B230]();
        if ([v8 length])
        {
          id v10 = [NSString alloc];
          v11 = [(CNContact *)self->_contact familyName];
          uint64_t v12 = (void *)[v10 initWithFormat:@"%@%%%@%%", v8, v11];
          [v44 addObject:v12];
        }
        else
        {
          v11 = sgLogHandle();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_11;
          }
          uint64_t v12 = [(CNContact *)self->_contact givenName];
          *(_DWORD *)buf = 138412290;
          v50 = v12;
          _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "empty string found in nickname data for: %@", buf, 0xCu);
        }

LABEL_11:
      }
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v5);
  }

  v13 = [(CNContact *)self->_contact familyName];
  if ([v13 length])
  {
    v14 = [(CNContact *)self->_contact givenName];
    uint64_t v15 = [v14 length];

    if (v15)
    {
      v16 = (void *)MEMORY[0x1CB79B230]();
      id v17 = [NSString alloc];
      v18 = [(CNContact *)self->_contact givenName];
      v19 = [(CNContact *)self->_contact familyName];
      v20 = (void *)[v17 initWithFormat:@"%@%%%@", v18, v19];
      [v44 addObject:v20];

      id v21 = [NSString alloc];
      v22 = [(CNContact *)self->_contact familyName];
      uint64_t v23 = [(CNContact *)self->_contact givenName];
      v24 = (void *)[v21 initWithFormat:@"%@%%%@", v22, v23];
      [v44 addObject:v24];

      id v25 = [(CNContact *)self->_contact givenName];
      v26 = [v25 substringToIndex:1];

      id v27 = [NSString alloc];
      v28 = [(CNContact *)self->_contact familyName];
      v29 = (void *)[v27 initWithFormat:@"%@ %@", v26, v28];
      [v44 addObject:v29];

      id v30 = [NSString alloc];
      v31 = [(CNContact *)self->_contact familyName];
      long long v32 = (void *)[v30 initWithFormat:@"%@. %@", v26, v31];
      [v44 addObject:v32];
    }
  }
  else
  {
  }
  long long v33 = [(CNContact *)self->_contact givenName];
  if ([v33 length])
  {
    long long v34 = [(CNContact *)self->_contact middleName];
    uint64_t v35 = [v34 length];

    if (v35)
    {
      v36 = (void *)MEMORY[0x1CB79B230]();
      id v37 = [NSString alloc];
      v38 = [(CNContact *)self->_contact givenName];
      uint64_t v39 = [(CNContact *)self->_contact middleName];
      v40 = (void *)[v37 initWithFormat:@"%@%%%@", v38, v39];
      [v44 addObject:v40];
    }
  }
  else
  {
  }
  v41 = (void *)[v44 copy];

  return (NSArray *)v41;
}

- (NSString)prefilterNameMatchTerms
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1CB79B230](self, a2);
  v3 = objc_opt_new();
  uint64_t v4 = [(CNContact *)self->_contact familyName];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [(CNContact *)self->_contact familyName];
    uint64_t v7 = +[SGTokenizer ftsTokenize:v6];

    [v3 addObjectsFromArray:v7];
    v8 = [(CNContact *)self->_contact familyName];
    uint64_t v9 = [v8 length];

    if (v9 == 1)
    {
      id v10 = sgMap();
      [v3 addObjectsFromArray:v10];
    }
  }
  v11 = [(CNContact *)self->_contact givenName];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    v13 = [(CNContact *)self->_contact givenName];
    v14 = +[SGTokenizer ftsTokenize:v13];

    [v3 addObjectsFromArray:v14];
    uint64_t v15 = [(CNContact *)self->_contact givenName];
    uint64_t v16 = [v15 length];

    if (v16 == 1)
    {
      id v17 = sgMap();
      [v3 addObjectsFromArray:v17];
    }
  }
  v18 = [(CNContact *)self->_contact middleName];
  uint64_t v19 = [v18 length];

  if (v19)
  {
    v20 = [(CNContact *)self->_contact middleName];
    id v21 = +[SGTokenizer ftsTokenize:v20];
    [v3 addObjectsFromArray:v21];
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v22 = self->_nicks;
  uint64_t v23 = [(NSSet *)v22 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v28 = (void *)MEMORY[0x1CB79B230]();
        if ([v27 length])
        {
          v29 = +[SGTokenizer ftsTokenize:v27];
          [v3 addObjectsFromArray:v29];
        }
        else
        {
          v29 = sgLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            id v30 = [(CNContact *)self->_contact givenName];
            *(_DWORD *)buf = 138412290;
            v41 = v30;
            _os_log_impl(&dword_1CA650000, v29, OS_LOG_TYPE_DEFAULT, "empty string found in nickname data for: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v24 = [(NSSet *)v22 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v24);
  }

  v31 = [v3 allObjects];
  long long v32 = objc_msgSend(v31, "_pas_mappedArrayWithTransform:", &__block_literal_global_6_24257);

  long long v33 = objc_msgSend(v32, "_pas_componentsJoinedByString:", @" OR ");

  return (NSString *)v33;
}

id __65__SGSqlEntityStoreCNContactMatcherHelper_prefilterNameMatchTerms__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 lengthOfBytesUsingEncoding:4])
  {
    id v3 = [NSString alloc];
    uint64_t v4 = [v2 stringByReplacingOccurrencesOfString:@"\" withString:@"\"\"];
    uint64_t v5 = (void *)[v3 initWithFormat:@"\"%@\"", v4];
  }
  else
  {
    uint64_t v6 = [v2 dataUsingEncoding:2483028224];
    uint64_t v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      [v6 bytes];
      [v6 length];
      v8 = _PASBytesToHex();
      *(_DWORD *)buf = 138477827;
      v11 = v8;
      _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "dropping query token that cannot be encoded as utf-8 (utf-16 LE repr: %{private}@)", buf, 0xCu);
    }
    uint64_t v5 = 0;
  }

  return v5;
}

id __65__SGSqlEntityStoreCNContactMatcherHelper_prefilterNameMatchTerms__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v4 = [v2 stringByAppendingString:@"*"];

  return v4;
}

- (SGSqlEntityStoreCNContactMatcherHelper)initWithCNContact:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SGSqlEntityStoreCNContactMatcherHelper;
  uint64_t v6 = [(SGSqlEntityStoreCNContactMatcherHelper *)&v14 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contact, a3);
    v8 = [v5 givenName];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      id v10 = [v5 givenName];
      uint64_t v11 = +[SGNicknames nicknamesForName:v10];
      nicks = v7->_nicks;
      v7->_nicks = (NSSet *)v11;
    }
  }

  return v7;
}

@end