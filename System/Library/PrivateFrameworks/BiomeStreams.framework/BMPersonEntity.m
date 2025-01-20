@interface BMPersonEntity
- (BMPersonEntity)initWithNames:(id)a3 customId:(id)a4 contactId:(id)a5 emailAddresses:(id)a6 addresses:(id)a7 phoneNumbers:(id)a8 socialMediaHandles:(id)a9 attributes:(id)a10;
- (BMPersonEntity)initWithProto:(id)a3;
- (BMPersonEntity)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)addresses;
- (NSArray)emailAddresses;
- (NSArray)names;
- (NSArray)phoneNumbers;
- (NSArray)socialMediaHandles;
- (NSDictionary)attributes;
- (NSString)contactId;
- (NSString)customId;
- (id)encodeAsProto;
- (id)proto;
@end

@implementation BMPersonEntity

- (BMPersonEntity)initWithNames:(id)a3 customId:(id)a4 contactId:(id)a5 emailAddresses:(id)a6 addresses:(id)a7 phoneNumbers:(id)a8 socialMediaHandles:(id)a9 attributes:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)BMPersonEntity;
  v18 = [(BMPersonEntity *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_names, a3);
    objc_storeStrong((id *)&v19->_customId, a4);
    objc_storeStrong((id *)&v19->_contactId, a5);
    objc_storeStrong((id *)&v19->_emailAddresses, a6);
    objc_storeStrong((id *)&v19->_addresses, a7);
    objc_storeStrong((id *)&v19->_phoneNumbers, a8);
    objc_storeStrong((id *)&v19->_socialMediaHandles, a9);
    objc_storeStrong((id *)&v19->_attributes, a10);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    customId = self->_customId;
    v7 = [v5 customId];
    if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:customId target:v7])
    {
      contactId = self->_contactId;
      v9 = [v5 contactId];
      if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:contactId target:v9])
      {
        names = self->_names;
        v11 = [v5 names];
        if (+[BMEntityRelationshipEventUtilities checkNullableArrayEqualityForSource:names target:v11])
        {
          emailAddresses = self->_emailAddresses;
          v13 = [v5 emailAddresses];
          if (+[BMEntityRelationshipEventUtilities checkNullableArrayEqualityForSource:emailAddresses target:v13])
          {
            phoneNumbers = self->_phoneNumbers;
            uint64_t v15 = [v5 phoneNumbers];
            v16 = phoneNumbers;
            id v17 = (void *)v15;
            if (+[BMEntityRelationshipEventUtilities checkNullableArrayEqualityForSource:v16 target:v15])
            {
              id v27 = v17;
              socialMediaHandles = self->_socialMediaHandles;
              id v26 = [v5 socialMediaHandles];
              if (+[BMEntityRelationshipEventUtilities checkNullableArrayEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableArrayEqualityForSource:target:", socialMediaHandles))
              {
                addresses = self->_addresses;
                v20 = [v5 addresses];
                BOOL v21 = +[BMEntityRelationshipEventUtilities checkNullableArrayEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableArrayEqualityForSource:target:", addresses);
                id v17 = v27;
                if (v21)
                {
                  attributes = self->_attributes;
                  id v23 = [v5 attributes];
                  BOOL v24 = +[BMEntityRelationshipEventUtilities checkNullableDictionaryEqualityForSource:attributes target:v23];
                }
                else
                {
                  BOOL v24 = 0;
                }
              }
              else
              {
                BOOL v24 = 0;
              }
            }
            else
            {
              BOOL v24 = 0;
            }
          }
          else
          {
            BOOL v24 = 0;
          }
        }
        else
        {
          BOOL v24 = 0;
        }
      }
      else
      {
        BOOL v24 = 0;
      }
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (id)encodeAsProto
{
  v2 = [(BMPersonEntity *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMPersonEntity)initWithProto:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v46 = self;
    id v47 = v4;
    id v5 = v4;
    if ([v5 namesCount])
    {
      v6 = objc_opt_new();
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      v7 = [v5 names];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v57 objects:v63 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v58 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v57 + 1) + 8 * i);
            v13 = (void *)MEMORY[0x192FB0D60]();
            v14 = [[BMPersonName alloc] initWithProto:v12];
            if (v14) {
              [v6 addObject:v14];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v57 objects:v63 count:16];
        }
        while (v9);
      }
    }
    else
    {
      v6 = 0;
    }
    if ([v5 socialMediaHandlesCount])
    {
      v16 = objc_opt_new();
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v17 = [v5 socialMediaHandles];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v53 objects:v62 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v54;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v54 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v53 + 1) + 8 * j);
            id v23 = (void *)MEMORY[0x192FB0D60]();
            BOOL v24 = [[BMSocialMediaHandle alloc] initWithProto:v22];
            if (v24) {
              [v16 addObject:v24];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v53 objects:v62 count:16];
        }
        while (v19);
      }
    }
    else
    {
      v16 = 0;
    }
    id v25 = [v5 attributes];

    if (v25)
    {
      id v25 = objc_opt_new();
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v26 = v5;
      id v27 = [v5 attributes];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v49 objects:v61 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v50;
        do
        {
          for (uint64_t k = 0; k != v29; ++k)
          {
            if (*(void *)v50 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(void **)(*((void *)&v49 + 1) + 8 * k);
            v33 = [v32 value];
            v34 = [v32 key];
            [v25 setValue:v33 forKey:v34];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v49 objects:v61 count:16];
        }
        while (v29);
      }

      id v5 = v26;
    }
    v48 = (void *)[v6 copy];
    v44 = [v5 customId];
    [v5 contactId];
    v36 = v35 = v5;
    [v35 emailAddresses];
    v37 = v45 = v35;
    uint64_t v38 = [v35 addresses];
    v39 = [v35 phoneNumbers];
    v40 = (void *)[v16 copy];
    v41 = (void *)[v25 copy];
    v42 = (void *)v38;
    self = [(BMPersonEntity *)v46 initWithNames:v48 customId:v44 contactId:v36 emailAddresses:v37 addresses:v38 phoneNumbers:v39 socialMediaHandles:v40 attributes:v41];

    uint64_t v15 = self;
    id v4 = v47;
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (BMPersonEntity)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBPersonEntity alloc] initWithData:v4];

    self = [(BMPersonEntity *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(BMPersonEntity *)self names];

  if (v4)
  {
    id v5 = objc_opt_new();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v6 = [(BMPersonEntity *)self names];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v55 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v54 + 1) + 8 * i) proto];
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v54 objects:v60 count:16];
      }
      while (v8);
    }

    uint64_t v12 = (void *)[v5 copy];
    [v3 setNames:v12];
  }
  v13 = [(BMPersonEntity *)self socialMediaHandles];

  if (v13)
  {
    v14 = objc_opt_new();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v15 = [(BMPersonEntity *)self socialMediaHandles];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v51 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [*(id *)(*((void *)&v50 + 1) + 8 * j) proto];
          [v14 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v50 objects:v59 count:16];
      }
      while (v17);
    }

    BOOL v21 = (void *)[v14 copy];
    [v3 setSocialMediaHandles:v21];
  }
  uint64_t v22 = [(BMPersonEntity *)self attributes];

  if (v22)
  {
    v44 = v3;
    id v23 = objc_opt_new();
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    obuint64_t j = [(BMPersonEntity *)self attributes];
    uint64_t v24 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v47;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v47 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v46 + 1) + 8 * k);
          uint64_t v29 = (void *)MEMORY[0x192FB0D60]();
          uint64_t v30 = objc_opt_new();
          [v30 setKey:v28];
          [(BMPersonEntity *)self attributes];
          v32 = v31 = self;
          v33 = [v32 objectForKeyedSubscript:v28];
          [v30 setValue:v33];

          self = v31;
          [v23 addObject:v30];
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
      }
      while (v25);
    }

    v34 = (void *)[v23 copy];
    v3 = v44;
    [v44 setAttributes:v34];
  }
  v35 = [(BMPersonEntity *)self customId];
  [v3 setCustomId:v35];

  v36 = [(BMPersonEntity *)self contactId];
  [v3 setContactId:v36];

  v37 = [(BMPersonEntity *)self emailAddresses];
  uint64_t v38 = (void *)[v37 mutableCopy];
  [v3 setEmailAddresses:v38];

  v39 = [(BMPersonEntity *)self addresses];
  v40 = (void *)[v39 mutableCopy];
  [v3 setAddresses:v40];

  v41 = [(BMPersonEntity *)self phoneNumbers];
  v42 = (void *)[v41 mutableCopy];
  [v3 setPhoneNumbers:v42];

  return v3;
}

- (NSArray)names
{
  return self->_names;
}

- (NSString)customId
{
  return self->_customId;
}

- (NSString)contactId
{
  return self->_contactId;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)socialMediaHandles
{
  return self->_socialMediaHandles;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_socialMediaHandles, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_contactId, 0);
  objc_storeStrong((id *)&self->_customId, 0);

  objc_storeStrong((id *)&self->_names, 0);
}

@end