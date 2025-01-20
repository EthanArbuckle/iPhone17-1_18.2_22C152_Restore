@interface SGContactMatch
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContactMatch:(id)a3;
- (NSArray)matchTokens;
- (SGContact)contact;
- (SGContactMatch)initWithCoder:(id)a3;
- (SGContactMatch)initWithContact:(id)a3 matchTokens:(id)a4 matchInfo:(id)a5;
- (SGContactMatch)initWithContact:(id)a3 matchingEmailAddressRecordId:(id)a4;
- (SGContactMatch)initWithContact:(id)a3 matchingEmailAddressRecordId:(id)a4 matchTokens:(id)a5;
- (SGContactMatch)initWithContact:(id)a3 matchingFieldRecordId:(id)a4 matchTokens:(id)a5;
- (SGContactMatch)initWithContact:(id)a3 matchingNameRecordId:(id)a4;
- (SGContactMatch)initWithContact:(id)a3 matchingNameRecordId:(id)a4 matchTokens:(id)a5;
- (SGContactMatch)initWithContact:(id)a3 matchingPhoneRecordId:(id)a4 matchTokens:(id)a5;
- (SGContactMatch)initWithContact:(id)a3 matchingRecordId:(id)a4 matchType:(int64_t)a5 matchTokens:(id)a6;
- (SGMatchedDetails)matchedDetails;
- (SGObject)matchingField;
- (id)description;
- (int64_t)matchingFieldType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGContactMatch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedDetails, 0);
  objc_storeStrong((id *)&self->_matchTokens, 0);
  objc_storeStrong((id *)&self->_contact, 0);

  objc_storeStrong((id *)&self->_matchingFieldRecordId, 0);
}

- (SGMatchedDetails)matchedDetails
{
  return self->_matchedDetails;
}

- (NSArray)matchTokens
{
  return self->_matchTokens;
}

- (int64_t)matchingFieldType
{
  return self->_matchingFieldType;
}

- (SGContact)contact
{
  return self->_contact;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGContactMatch contact=%@ matchingFieldRecordId=%@ tokens=%@ type=%lld matchesDetails=%@>", self->_contact, self->_matchingFieldRecordId, self->_matchTokens, self->_matchingFieldType, self->_matchedDetails];

  return v2;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SGContact *)self->_contact hash];
  return [(SGRecordId *)self->_matchingFieldRecordId hash] - v3 + 32 * v3;
}

- (SGObject)matchingField
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  switch(self->_matchingFieldType)
  {
    case 1:
      unint64_t v3 = [(SGContact *)self->_contact name];
      v4 = [v3 recordId];
      int v5 = [v4 isEqualToRecordId:self->_matchingFieldRecordId];

      if (!v5) {
        goto LABEL_4;
      }
      id v6 = [(SGContact *)self->_contact name];
      id v7 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_19;
    case 2:
      v8 = [(SGContact *)self->_contact phones];
      goto LABEL_9;
    case 3:
      v8 = [(SGContact *)self->_contact emailAddresses];
      goto LABEL_9;
    case 4:
      v8 = [(SGContact *)self->_contact postalAddresses];
      goto LABEL_9;
    case 5:
      v8 = [(SGContact *)self->_contact socialProfiles];
      goto LABEL_9;
    default:
LABEL_4:
      v8 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_9:
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = v8;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (!v9) {
        goto LABEL_17;
      }
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      break;
  }
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(v7);
      }
      v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      v14 = objc_msgSend(v13, "recordId", (void)v17);
      char v15 = [v14 isEqualToRecordId:self->_matchingFieldRecordId];

      if (v15)
      {
        id v6 = v13;

        goto LABEL_19;
      }
    }
    uint64_t v10 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_17:

  id v6 = 0;
LABEL_19:

  return (SGObject *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGContactMatch *)a3;
  int v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGContactMatch *)self isEqualToContactMatch:v5];

  return v6;
}

- (BOOL)isEqualToContactMatch:(id)a3
{
  v4 = (id *)a3;
  int v5 = v4;
  if (!v4) {
    goto LABEL_15;
  }
  matchingFieldRecordId = self->_matchingFieldRecordId;
  id v7 = (SGRecordId *)v4[1];
  if (matchingFieldRecordId == v7)
  {
  }
  else
  {
    v8 = v7;
    uint64_t v9 = matchingFieldRecordId;
    BOOL v10 = [(SGRecordId *)v9 isEqual:v8];

    if (!v10)
    {
LABEL_15:
      char v21 = 0;
      goto LABEL_16;
    }
  }
  contact = self->_contact;
  v12 = (SGContact *)v5[3];
  if (contact == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = contact;
    BOOL v15 = [(SGContact *)v14 isEqual:v13];

    if (!v15) {
      goto LABEL_15;
    }
  }
  if (self->_matchingFieldType != v5[2]) {
    goto LABEL_15;
  }
  matchTokens = self->_matchTokens;
  if (matchTokens != v5[4] && !-[NSArray isEqual:](matchTokens, "isEqual:")) {
    goto LABEL_15;
  }
  matchedDetails = self->_matchedDetails;
  long long v18 = [v5 matchedDetails];
  if (matchedDetails == v18)
  {
    char v21 = 1;
  }
  else
  {
    long long v19 = self->_matchedDetails;
    long long v20 = [v5 matchedDetails];
    char v21 = [(SGMatchedDetails *)v19 isEqual:v20];
  }
LABEL_16:

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  contact = self->_contact;
  id v5 = a3;
  [v5 encodeObject:contact forKey:@"contact"];
  [v5 encodeObject:self->_matchingFieldRecordId forKey:@"matchingFieldRecordId"];
  [v5 encodeInt64:self->_matchingFieldType forKey:@"matchingFieldType"];
  [v5 encodeObject:self->_matchTokens forKey:@"matchTokens"];
  [v5 encodeObject:self->_matchedDetails forKey:@"matchedDetails"];
}

- (SGContactMatch)initWithCoder:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SGContactMatch;
  BOOL v6 = [(SGContactMatch *)&v23 init];
  if (v6)
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v8 = [v5 decodeObjectOfClasses:v7 forKey:@"contact"];

    if (v8)
    {
      uint64_t v9 = v8;
      contact = v6->_contact;
      v6->_contact = v9;
    }
    else
    {
      contact = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(contact, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGContactMatch.m", 119, @"nonnull property %s *%s was null when decoded", "SGContact", "contact");
    }

    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v12 = [v5 decodeObjectOfClasses:v11 forKey:@"matchingFieldRecordId"];
    matchingFieldRecordId = v6->_matchingFieldRecordId;
    v6->_matchingFieldRecordId = (SGRecordId *)v12;

    v6->_matchingFieldType = [v5 decodeInt64ForKey:@"matchingFieldType"];
    id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "initWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v5 decodeObjectOfClasses:v16 forKey:@"matchTokens"];
    matchTokens = v6->_matchTokens;
    v6->_matchTokens = (NSArray *)v17;

    long long v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v20 = [v5 decodeObjectOfClasses:v19 forKey:@"matchedDetails"];
    matchedDetails = v6->_matchedDetails;
    v6->_matchedDetails = (SGMatchedDetails *)v20;
  }
  return v6;
}

- (SGContactMatch)initWithContact:(id)a3 matchingRecordId:(id)a4 matchType:(int64_t)a5 matchTokens:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGContactMatch.m", 106, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"SGContactMatch.m", 107, @"Invalid parameter not satisfying: %@", @"matchingRecordId" object file lineNumber description];

LABEL_3:
  id v14 = [(SGContactMatch *)self initWithContact:v11 matchingFieldRecordId:v12 matchTokens:v13];
  uint64_t v15 = v14;
  if (v14) {
    v14->_matchingFieldType = a5;
  }

  return v15;
}

- (SGContactMatch)initWithContact:(id)a3 matchingPhoneRecordId:(id)a4 matchTokens:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGContactMatch.m", 92, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"SGContactMatch.m", 93, @"Invalid parameter not satisfying: %@", @"matchingPhoneRecordId" object file lineNumber description];

LABEL_3:
  id v12 = [(SGContactMatch *)self initWithContact:v9 matchingFieldRecordId:v10 matchTokens:v11];
  id v13 = v12;
  if (v12) {
    v12->_matchingFieldType = 2;
  }

  return v13;
}

- (SGContactMatch)initWithContact:(id)a3 matchingEmailAddressRecordId:(id)a4 matchTokens:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGContactMatch.m", 81, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"SGContactMatch.m", 82, @"Invalid parameter not satisfying: %@", @"matchingEmailAddressRecordId" object file lineNumber description];

LABEL_3:
  id v12 = [(SGContactMatch *)self initWithContact:v9 matchingFieldRecordId:v10 matchTokens:v11];
  id v13 = v12;
  if (v12) {
    v12->_matchingFieldType = 3;
  }

  return v13;
}

- (SGContactMatch)initWithContact:(id)a3 matchingNameRecordId:(id)a4 matchTokens:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGContactMatch.m", 70, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"SGContactMatch.m", 71, @"Invalid parameter not satisfying: %@", @"matchingNameRecordId" object file lineNumber description];

LABEL_3:
  id v12 = [(SGContactMatch *)self initWithContact:v9 matchingFieldRecordId:v10 matchTokens:v11];
  id v13 = v12;
  if (v12) {
    v12->_matchingFieldType = 1;
  }

  return v13;
}

- (SGContactMatch)initWithContact:(id)a3 matchingNameRecordId:(id)a4
{
  return [(SGContactMatch *)self initWithContact:a3 matchingNameRecordId:a4 matchTokens:0];
}

- (SGContactMatch)initWithContact:(id)a3 matchingEmailAddressRecordId:(id)a4
{
  return [(SGContactMatch *)self initWithContact:a3 matchingEmailAddressRecordId:a4 matchTokens:0];
}

- (SGContactMatch)initWithContact:(id)a3 matchingFieldRecordId:(id)a4 matchTokens:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SGContactMatch.m", 47, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  char v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SGContactMatch.m", 48, @"Invalid parameter not satisfying: %@", @"matchingFieldRecordId" object file lineNumber description];

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)SGContactMatch;
  id v12 = [(SGContactMatch *)&v22 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    contact = v12->_contact;
    v12->_contact = (SGContact *)v13;

    uint64_t v15 = [v10 copy];
    matchingFieldRecordId = v12->_matchingFieldRecordId;
    v12->_matchingFieldRecordId = (SGRecordId *)v15;

    uint64_t v17 = [v11 copy];
    matchTokens = v12->_matchTokens;
    v12->_matchTokens = (NSArray *)v17;
  }
  return v12;
}

- (SGContactMatch)initWithContact:(id)a3 matchTokens:(id)a4 matchInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    char v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SGContactMatch.m", 34, @"Invalid parameter not satisfying: %@", @"tokens" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"SGContactMatch.m", 33, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  objc_super v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"SGContactMatch.m", 35, @"Invalid parameter not satisfying: %@", @"matchinfoData" object file lineNumber description];

LABEL_4:
  v23.receiver = self;
  v23.super_class = (Class)SGContactMatch;
  id v12 = [(SGContactMatch *)&v23 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    contact = v12->_contact;
    v12->_contact = (SGContact *)v13;

    uint64_t v15 = +[SGFn simpleDedupe:v10];
    matchTokens = v12->_matchTokens;
    v12->_matchTokens = (NSArray *)v15;

    uint64_t v17 = +[SGMatchedDetails matchedDetailsWithContact:v9 matchinfoData:v11 tokens:v10];
    matchedDetails = v12->_matchedDetails;
    v12->_matchedDetails = (SGMatchedDetails *)v17;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end