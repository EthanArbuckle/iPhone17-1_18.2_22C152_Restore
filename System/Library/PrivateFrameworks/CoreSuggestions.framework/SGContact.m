@interface SGContact
+ (BOOL)supportsSecureCoding;
+ (SGContact)contactWithId:(id)a3 name:(id)a4 emailAddresses:(id)a5 phones:(id)a6 postalAddresses:(id)a7;
+ (SGContact)contactWithId:(id)a3 name:(id)a4 emailAddresses:(id)a5 phones:(id)a6 postalAddresses:(id)a7 socialProfiles:(id)a8;
+ (SGContact)contactWithId:(id)a3 name:(id)a4 emailAddresses:(id)a5 phones:(id)a6 postalAddresses:(id)a7 socialProfiles:(id)a8 birthday:(id)a9 photoPath:(id)a10;
- (BOOL)containsDetailSuggestions;
- (BOOL)containsSuggestions;
- (BOOL)hasNonTrivialInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContact:(id)a3;
- (NSArray)emailAddresses;
- (NSArray)phones;
- (NSArray)postalAddresses;
- (NSArray)socialProfiles;
- (NSString)photoPath;
- (SGContact)initWithCoder:(id)a3;
- (SGContact)initWithId:(id)a3 name:(id)a4 emailAddresses:(id)a5 phones:(id)a6 postalAddresses:(id)a7 socialProfiles:(id)a8 birthday:(id)a9 photoPath:(id)a10;
- (SGDateComponents)birthday;
- (SGName)name;
- (SGRecordId)recordId;
- (id)addresses;
- (id)cnContact;
- (id)description;
- (id)detailForRecordId:(id)a3;
- (int)updatedFields;
- (unint64_t)hash;
- (unint64_t)richness;
- (unint64_t)significance;
- (unint64_t)significanceOrigin;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateDetailsWithBlock:(id)a3;
- (void)setBirthday:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setName:(id)a3;
- (void)setPhones:(id)a3;
- (void)setPostalAddresses:(id)a3;
- (void)setSignificance:(unint64_t)a3;
- (void)setSignificanceOrigin:(unint64_t)a3;
- (void)setSocialProfiles:(id)a3;
- (void)setUpdatedFields:(int)a3;
@end

@implementation SGContact

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoPath, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_phones, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_recordId, 0);

  objc_storeStrong((id *)&self->_cachedDetailForRecordIdMap, 0);
}

- (void)setUpdatedFields:(int)a3
{
  self->_updatedFields = a3;
}

- (int)updatedFields
{
  return self->_updatedFields;
}

- (void)setSignificanceOrigin:(unint64_t)a3
{
  self->_significanceOrigin = a3;
}

- (unint64_t)significanceOrigin
{
  return self->_significanceOrigin;
}

- (void)setSignificance:(unint64_t)a3
{
  self->_significance = a3;
}

- (unint64_t)significance
{
  return self->_significance;
}

- (NSString)photoPath
{
  return self->_photoPath;
}

- (void)setBirthday:(id)a3
{
}

- (SGDateComponents)birthday
{
  return self->_birthday;
}

- (void)setSocialProfiles:(id)a3
{
}

- (NSArray)socialProfiles
{
  return self->_socialProfiles;
}

- (void)setPostalAddresses:(id)a3
{
}

- (NSArray)postalAddresses
{
  return self->_postalAddresses;
}

- (void)setPhones:(id)a3
{
}

- (NSArray)phones
{
  return self->_phones;
}

- (void)setEmailAddresses:(id)a3
{
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setName:(id)a3
{
}

- (SGName)name
{
  return self->_name;
}

- (SGRecordId)recordId
{
  return self->_recordId;
}

- (id)cnContact
{
  return 0;
}

- (BOOL)hasNonTrivialInfo
{
  v3 = [(SGContact *)self name];
  v4 = [v3 fullName];
  if ([v4 length])
  {
    v5 = [(SGContact *)self phones];
    if ([v5 count])
    {
      BOOL v6 = 1;
    }
    else
    {
      v7 = [(SGContact *)self postalAddresses];
      BOOL v6 = [v7 count] != 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)enumerateDetailsWithBlock:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  context = (void *)MEMORY[0x1A6265250]();
  socialProfiles = (NSArray *)MEMORY[0x1E4F1CBF0];
  emailAddresses = self->_emailAddresses;
  phones = self->_phones;
  if (!phones) {
    phones = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  if (!emailAddresses) {
    emailAddresses = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  v33[0] = phones;
  v33[1] = emailAddresses;
  postalAddresses = self->_postalAddresses;
  v19 = self;
  if (!postalAddresses) {
    postalAddresses = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  if (self->_socialProfiles) {
    socialProfiles = self->_socialProfiles;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v33[2] = postalAddresses;
  v33[3] = socialProfiles;
  obuint64_t j = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
  uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1A6265250]();
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v12 = v10;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * j);
              v18 = (void *)MEMORY[0x1A6265250]();
              v4[2](v4, v17);
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v14);
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v23);
  }

  if (v19->_birthday) {
    ((void (*)(void (**)(id, void)))v4[2])(v4);
  }
}

- (id)detailForRecordId:(id)a3
{
  cachedDetailForRecordIdMap = self->_cachedDetailForRecordIdMap;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__SGContact_detailForRecordId___block_invoke;
  v8[3] = &unk_1E5B90500;
  v8[4] = self;
  id v4 = a3;
  v5 = [(_PASCachedResult *)cachedDetailForRecordIdMap resultNonnullWithBlock:v8];
  BOOL v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

id __31__SGContact_detailForRecordId___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1A6265250]();
  v3 = objc_opt_new();
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__SGContact_detailForRecordId___block_invoke_2;
  v8[3] = &unk_1E5B904D8;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateDetailsWithBlock:v8];
  BOOL v6 = (void *)[v5 copy];

  return v6;
}

void __31__SGContact_detailForRecordId___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 recordId];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (BOOL)containsDetailSuggestions
{
  id v3 = [(SGContact *)self emailAddresses];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(SGContact *)self phones];
    if ([v5 count])
    {
      BOOL v4 = 1;
    }
    else
    {
      BOOL v6 = [(SGContact *)self postalAddresses];
      if ([v6 count])
      {
        BOOL v4 = 1;
      }
      else
      {
        v7 = [(SGContact *)self birthday];
        if (v7)
        {
          BOOL v4 = 1;
        }
        else
        {
          v8 = [(SGContact *)self photoPath];
          if (v8)
          {
            BOOL v4 = 1;
          }
          else
          {
            id v9 = [(SGContact *)self socialProfiles];
            BOOL v4 = [v9 count] != 0;
          }
        }
      }
    }
  }
  return v4;
}

- (BOOL)containsSuggestions
{
  id v3 = [(SGContact *)self name];
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(SGContact *)self containsDetailSuggestions];
  }

  return v4;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGContact recordId:%@\n name='%@'\n  emails: %@\n  phones: %@\n  postal addresses: %@\n  social profiles: %@\n  birthday: %@\n  photo: %@\n significance: %lu\n>", self->_recordId, self->_name, self->_emailAddresses, self->_phones, self->_postalAddresses, self->_socialProfiles, self->_birthday, self->_photoPath, self->_significance];

  return v2;
}

- (unint64_t)richness
{
  name = self->_name;
  NSUInteger v4 = [(NSArray *)self->_emailAddresses count];
  if (name) {
    uint64_t v5 = (v4 != 0) + 1;
  }
  else {
    uint64_t v5 = v4 != 0;
  }
  if ([(NSArray *)self->_phones count]) {
    unint64_t v6 = v5 + 1;
  }
  else {
    unint64_t v6 = v5;
  }
  if (self->_birthday) {
    unint64_t v7 = v6 + 1;
  }
  else {
    unint64_t v7 = v6;
  }
  if ([(NSArray *)self->_postalAddresses count]) {
    return v7 + 1;
  }
  else {
    return v7;
  }
}

- (id)addresses
{
  return self->_postalAddresses;
}

- (unint64_t)hash
{
  return [(SGRecordId *)self->_recordId hash];
}

- (BOOL)isEqualToContact:(id)a3
{
  NSUInteger v4 = (id *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_32;
  }
  recordId = self->_recordId;
  unint64_t v7 = (SGRecordId *)v4[3];
  if (recordId == v7)
  {
  }
  else
  {
    v8 = v7;
    id v9 = recordId;
    BOOL v10 = [(SGRecordId *)v9 isEqual:v8];

    if (!v10) {
      goto LABEL_32;
    }
  }
  name = self->_name;
  id v12 = (SGName *)v5[4];
  if (name == v12)
  {
  }
  else
  {
    uint64_t v13 = v12;
    uint64_t v14 = name;
    BOOL v15 = [(SGName *)v14 isEqual:v13];

    if (!v15) {
      goto LABEL_32;
    }
  }
  emailAddresses = self->_emailAddresses;
  uint64_t v17 = (NSArray *)v5[5];
  if (emailAddresses == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = emailAddresses;
    char v20 = [(NSArray *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_32;
    }
  }
  phones = self->_phones;
  uint64_t v22 = (NSArray *)v5[6];
  if (phones == v22)
  {
  }
  else
  {
    uint64_t v23 = v22;
    long long v24 = phones;
    char v25 = [(NSArray *)v24 isEqual:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_32;
    }
  }
  postalAddresses = self->_postalAddresses;
  long long v27 = (NSArray *)v5[7];
  if (postalAddresses == v27)
  {
  }
  else
  {
    long long v28 = v27;
    long long v29 = postalAddresses;
    char v30 = [(NSArray *)v29 isEqual:v28];

    if ((v30 & 1) == 0) {
      goto LABEL_32;
    }
  }
  socialProfiles = self->_socialProfiles;
  v32 = (NSArray *)v5[8];
  if (socialProfiles == v32)
  {
  }
  else
  {
    v33 = v32;
    v34 = socialProfiles;
    char v35 = [(NSArray *)v34 isEqual:v33];

    if ((v35 & 1) == 0) {
      goto LABEL_32;
    }
  }
  birthday = self->_birthday;
  v37 = (SGDateComponents *)v5[9];
  if (birthday == v37)
  {
  }
  else
  {
    v38 = v37;
    v39 = birthday;
    BOOL v40 = [(SGDateComponents *)v39 isEqual:v38];

    if (!v40) {
      goto LABEL_32;
    }
  }
  photoPath = self->_photoPath;
  v42 = (NSString *)v5[10];
  if (photoPath == v42)
  {

    goto LABEL_35;
  }
  v43 = v42;
  v44 = photoPath;
  char v45 = [(NSString *)v44 isEqual:v43];

  if (v45)
  {
LABEL_35:
    unint64_t significance = self->_significance;
    BOOL v46 = significance == [v5 significance];
    goto LABEL_33;
  }
LABEL_32:
  BOOL v46 = 0;
LABEL_33:

  return v46;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (SGContact *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGContact *)self isEqualToContact:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  recordId = self->_recordId;
  id v5 = a3;
  [v5 encodeObject:recordId forKey:@"recordId"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_emailAddresses forKey:@"emailAddresses"];
  [v5 encodeObject:self->_phones forKey:@"phones"];
  [v5 encodeObject:self->_postalAddresses forKey:@"postalAddresses"];
  [v5 encodeObject:self->_socialProfiles forKey:@"socialProfiles"];
  [v5 encodeObject:self->_birthday forKey:@"birthday"];
  [v5 encodeObject:self->_photoPath forKey:@"photoPath"];
  [v5 encodeInt64:self->_significance forKey:@"significance"];
}

- (SGContact)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordId"];
  long long v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  BOOL v6 = (void *)MEMORY[0x1A6265250]();
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  char v30 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v30 forKey:@"emailAddresses"];
  BOOL v10 = (void *)MEMORY[0x1A6265250]();
  id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v12 = objc_opt_class();
  long long v28 = objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
  uint64_t v13 = [v4 decodeObjectOfClasses:v28 forKey:@"phones"];
  uint64_t v14 = (void *)MEMORY[0x1A6265250]();
  id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v16 = objc_opt_class();
  long long v27 = objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  long long v26 = [v4 decodeObjectOfClasses:v27 forKey:@"postalAddresses"];
  uint64_t v17 = (void *)MEMORY[0x1A6265250]();
  id v18 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v19 = objc_opt_class();
  char v25 = objc_msgSend(v18, "initWithObjects:", v19, objc_opt_class(), 0);
  char v20 = [v4 decodeObjectOfClasses:v25 forKey:@"socialProfiles"];
  v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"birthday"];
  uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photoPath"];
  uint64_t v23 = [(SGContact *)self initWithId:v5 name:v29 emailAddresses:v9 phones:v13 postalAddresses:v26 socialProfiles:v20 birthday:v21 photoPath:v22];

  if (v23) {
    v23->_unint64_t significance = [v4 decodeInt64ForKey:@"significance"];
  }

  return v23;
}

- (SGContact)initWithId:(id)a3 name:(id)a4 emailAddresses:(id)a5 phones:(id)a6 postalAddresses:(id)a7 socialProfiles:(id)a8 birthday:(id)a9 photoPath:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v51 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v52.receiver = self;
  v52.super_class = (Class)SGContact;
  uint64_t v23 = [(SGContact *)&v52 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    recordId = v23->_recordId;
    v23->_recordId = (SGRecordId *)v24;

    uint64_t v26 = [v17 copy];
    name = v23->_name;
    v23->_name = (SGName *)v26;

    uint64_t v28 = [v18 copy];
    id v29 = v18;
    id v30 = v17;
    id v31 = v16;
    v32 = (void *)v28;
    v33 = (void *)MEMORY[0x1E4F1CBF0];
    if (v28) {
      v34 = (void *)v28;
    }
    else {
      v34 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v23->_emailAddresses, v34);

    uint64_t v35 = [v51 copy];
    v36 = (void *)v35;
    if (v35) {
      v37 = (void *)v35;
    }
    else {
      v37 = v33;
    }
    objc_storeStrong((id *)&v23->_phones, v37);

    uint64_t v38 = [v19 copy];
    v39 = (void *)v38;
    if (v38) {
      BOOL v40 = (void *)v38;
    }
    else {
      BOOL v40 = v33;
    }
    objc_storeStrong((id *)&v23->_postalAddresses, v40);

    uint64_t v41 = [v21 copy];
    birthday = v23->_birthday;
    v23->_birthday = (SGDateComponents *)v41;

    uint64_t v43 = [v20 copy];
    v44 = (void *)v43;
    if (v43) {
      char v45 = (void *)v43;
    }
    else {
      char v45 = v33;
    }
    objc_storeStrong((id *)&v23->_socialProfiles, v45);

    id v16 = v31;
    id v17 = v30;
    id v18 = v29;
    v23->_unint64_t significance = 0;
    uint64_t v46 = [v22 copy];
    photoPath = v23->_photoPath;
    v23->_photoPath = (NSString *)v46;

    uint64_t v48 = objc_opt_new();
    cachedDetailForRecordIdMap = v23->_cachedDetailForRecordIdMap;
    v23->_cachedDetailForRecordIdMap = (_PASCachedResult *)v48;
  }
  return v23;
}

+ (SGContact)contactWithId:(id)a3 name:(id)a4 emailAddresses:(id)a5 phones:(id)a6 postalAddresses:(id)a7
{
  return (SGContact *)[a1 contactWithId:a3 name:a4 emailAddresses:a5 phones:a6 postalAddresses:a7 socialProfiles:MEMORY[0x1E4F1CBF0]];
}

+ (SGContact)contactWithId:(id)a3 name:(id)a4 emailAddresses:(id)a5 phones:(id)a6 postalAddresses:(id)a7 socialProfiles:(id)a8 birthday:(id)a9 photoPath:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  uint64_t v24 = [[SGContact alloc] initWithId:v23 name:v22 emailAddresses:v21 phones:v20 postalAddresses:v19 socialProfiles:v18 birthday:v17 photoPath:v16];

  return v24;
}

+ (SGContact)contactWithId:(id)a3 name:(id)a4 emailAddresses:(id)a5 phones:(id)a6 postalAddresses:(id)a7 socialProfiles:(id)a8
{
  return (SGContact *)[a1 contactWithId:a3 name:a4 emailAddresses:a5 phones:a6 postalAddresses:a7 socialProfiles:a8 birthday:0 photoPath:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end