@interface FARecommendedFamilyMember
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNContact)contact;
- (FARecommendedFamilyMember)initWithCoder:(id)a3;
- (FARecommendedFamilyMember)initWithDisplayName:(id)a3 handle:(id)a4 iMessageHandle:(id)a5 contact:(id)a6;
- (FARecommendedFamilyMember)initWithMegadomeRecommendation:(id)a3;
- (FARecommendedFamilyMember)initWithPeopleSuggesterRecommendation:(id)a3;
- (NSString)displayName;
- (NSString)handle;
- (NSString)iMessageHandle;
- (id)_safeClasses;
- (id)contactFromRecommendationWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContact:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHandle:(id)a3;
- (void)setIMessageHandle:(id)a3;
@end

@implementation FARecommendedFamilyMember

- (FARecommendedFamilyMember)initWithDisplayName:(id)a3 handle:(id)a4 iMessageHandle:(id)a5 contact:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FARecommendedFamilyMember;
  v15 = [(FARecommendedFamilyMember *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_displayName, a3);
    objc_storeStrong((id *)&v16->_handle, a4);
    objc_storeStrong((id *)&v16->_contact, a6);
    objc_storeStrong((id *)&v16->_iMessageHandle, a5);
  }

  return v16;
}

- (FARecommendedFamilyMember)initWithMegadomeRecommendation:(id)a3
{
  id v4 = a3;
  v5 = [v4 names];
  v6 = [v5 firstObject];
  v7 = [v4 emails];
  v8 = [v7 firstObject];
  v9 = v8;
  if (!v8)
  {
    v15 = [v4 phoneNumbers];
    v9 = [v15 firstObject];
  }
  v10 = [v4 contactIdentifiers];
  id v11 = [v10 firstObject];
  id v12 = [(FARecommendedFamilyMember *)self contactFromRecommendationWithIdentifier:v11];
  id v13 = [(FARecommendedFamilyMember *)self initWithDisplayName:v6 handle:v9 iMessageHandle:0 contact:v12];

  if (!v8)
  {
  }
  return v13;
}

- (FARecommendedFamilyMember)initWithPeopleSuggesterRecommendation:(id)a3
{
  id v4 = a3;
  v5 = [v4 displayName];
  v6 = [v4 handle];
  v7 = [v4 contact];

  v8 = [v7 identifier];
  v9 = [(FARecommendedFamilyMember *)self contactFromRecommendationWithIdentifier:v8];
  v10 = [(FARecommendedFamilyMember *)self initWithDisplayName:v5 handle:v6 iMessageHandle:0 contact:v9];

  return v10;
}

- (id)contactFromRecommendationWithIdentifier:(id)a3
{
  v24[19] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = *MEMORY[0x1E4F1ADF0];
    v24[0] = *MEMORY[0x1E4F1AEB0];
    v24[1] = v4;
    uint64_t v5 = *MEMORY[0x1E4F1ADE0];
    v24[2] = *MEMORY[0x1E4F1AEA0];
    v24[3] = v5;
    uint64_t v6 = *MEMORY[0x1E4F1AEB8];
    v24[4] = *MEMORY[0x1E4F1AF30];
    v24[5] = v6;
    uint64_t v7 = *MEMORY[0x1E4F1AED8];
    v24[6] = *MEMORY[0x1E4F1AEC0];
    v24[7] = v7;
    uint64_t v8 = *MEMORY[0x1E4F1AE78];
    v24[8] = *MEMORY[0x1E4F1ADB8];
    v24[9] = v8;
    uint64_t v9 = *MEMORY[0x1E4F1AF00];
    v24[10] = *MEMORY[0x1E4F1AEF8];
    v24[11] = v9;
    uint64_t v10 = *MEMORY[0x1E4F1AF08];
    v24[12] = *MEMORY[0x1E4F1AEF0];
    v24[13] = v10;
    uint64_t v11 = *MEMORY[0x1E4F1AEE0];
    v24[14] = *MEMORY[0x1E4F1AFA8];
    v24[15] = v11;
    uint64_t v12 = *MEMORY[0x1E4F1AF98];
    v24[16] = *MEMORY[0x1E4F1ADC8];
    v24[17] = v12;
    v24[18] = *MEMORY[0x1E4F1AF50];
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:19];
    id v14 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    v15 = [v13 arrayByAddingObject:v14];

    id v16 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    v17 = (void *)MEMORY[0x1E4F1B8F8];
    id v23 = v3;
    objc_super v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    v19 = [v17 predicateForContactsWithIdentifiers:v18];

    v20 = [v16 unifiedContactsMatchingPredicate:v19 keysToFetch:v15 error:0];
    v21 = [v20 firstObject];
  }
  else
  {
    v15 = _FALogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FARecommendedFamilyMember contactFromRecommendationWithIdentifier:](v15);
    }
    v21 = 0;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  displayName = self->_displayName;
  id v5 = a3;
  [v5 encodeObject:displayName forKey:@"_displayName"];
  [v5 encodeObject:self->_handle forKey:@"_handle"];
  [v5 encodeObject:self->_contact forKey:@"_contact"];
  [v5 encodeObject:self->_contact forKey:@"_iMessageHandle"];
}

- (id)_safeClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

- (FARecommendedFamilyMember)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FARecommendedFamilyMember;
  id v5 = [(FARecommendedFamilyMember *)&v20 init];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(FARecommendedFamilyMember *)v5 _safeClasses];
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"_displayName"];
    displayName = v6->_displayName;
    v6->_displayName = (NSString *)v8;

    uint64_t v10 = [(FARecommendedFamilyMember *)v6 _safeClasses];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_handle"];
    handle = v6->_handle;
    v6->_handle = (NSString *)v11;

    id v13 = [(FARecommendedFamilyMember *)v6 _safeClasses];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"_contact"];
    contact = v6->_contact;
    v6->_contact = (CNContact *)v14;

    id v16 = [(FARecommendedFamilyMember *)v6 _safeClasses];
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"_iMessageHandle"];
    iMessageHandle = v6->_iMessageHandle;
    v6->_iMessageHandle = (NSString *)v17;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FARecommendedFamilyMember *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      displayName = self->_displayName;
      uint64_t v6 = [(FARecommendedFamilyMember *)v4 displayName];
      if (displayName != v6)
      {
        uint64_t v7 = self->_displayName;
        uint64_t v8 = [(FARecommendedFamilyMember *)v4 displayName];
        if (![(NSString *)v7 isEqualToString:v8])
        {
          char v9 = 0;
          goto LABEL_25;
        }
        v27 = v8;
      }
      handle = self->_handle;
      uint64_t v11 = [(FARecommendedFamilyMember *)v4 handle];
      if (handle != v11)
      {
        uint64_t v12 = self->_handle;
        id v13 = [(FARecommendedFamilyMember *)v4 handle];
        if (![(NSString *)v12 isEqualToString:v13])
        {
          char v9 = 0;
LABEL_23:

LABEL_24:
          uint64_t v8 = v27;
          if (displayName == v6)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_25:

          goto LABEL_26;
        }
        v26 = v13;
      }
      contact = self->_contact;
      v15 = [(FARecommendedFamilyMember *)v4 contact];
      if (contact != v15)
      {
        id v16 = self->_contact;
        uint64_t v17 = [(FARecommendedFamilyMember *)v4 contact];
        if (![(CNContact *)v16 isEqualIgnoringIdentifiers:v17])
        {
          char v9 = 0;
          id v13 = v26;
          goto LABEL_21;
        }
        v25 = v17;
      }
      iMessageHandle = self->_iMessageHandle;
      uint64_t v19 = [(FARecommendedFamilyMember *)v4 iMessageHandle];
      if (iMessageHandle == (NSString *)v19)
      {

        char v9 = 1;
      }
      else
      {
        objc_super v20 = (void *)v19;
        v21 = self->_iMessageHandle;
        v22 = [(FARecommendedFamilyMember *)v4 iMessageHandle];
        char v9 = [(NSString *)v21 isEqualToString:v22];
      }
      BOOL v23 = contact == v15;
      uint64_t v17 = v25;
      id v13 = v26;
      if (v23)
      {
LABEL_22:

        if (handle == v11) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
LABEL_21:

      goto LABEL_22;
    }
    char v9 = 0;
  }
LABEL_27:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[FARecommendedFamilyMember allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_contact, self->_contact);
  objc_storeStrong((id *)&v4->_displayName, self->_displayName);
  objc_storeStrong((id *)&v4->_handle, self->_handle);
  objc_storeStrong((id *)&v4->_iMessageHandle, self->_iMessageHandle);
  return v4;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (NSString)iMessageHandle
{
  return self->_iMessageHandle;
}

- (void)setIMessageHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iMessageHandle, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

- (void)contactFromRecommendationWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D252C000, log, OS_LOG_TYPE_ERROR, "Identifier for contact was nil. Bailing on getting contact from recommendation.", v1, 2u);
}

@end