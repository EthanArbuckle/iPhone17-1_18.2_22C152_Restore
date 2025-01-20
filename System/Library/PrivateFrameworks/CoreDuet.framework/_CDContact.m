@interface _CDContact
+ (BOOL)supportsSecureCoding;
+ (_CDContact)contactWithIdentifier:(id)a3 identifierType:(id)a4;
+ (_CDContact)contactWithIdentifier:(id)a3 identifierType:(id)a4 displayName:(id)a5 personId:(id)a6 personIdType:(unint64_t)a7;
+ (_CDContact)contactWithIdentifier:(id)a3 identifierType:(id)a4 personId:(id)a5 personIdType:(unint64_t)a6;
+ (_CDContact)contactWithIdentifier:(id)a3 type:(unint64_t)a4 displayName:(id)a5 personId:(id)a6 personIdType:(unint64_t)a7;
+ (id)_CDValueForContactProperty:(id)a3;
+ (id)_contactPropertiesForContacts:(id)a3 mechanismHints:(id)a4;
+ (id)contactPropertiesForContacts:(id)a3;
+ (id)contactPropertiesForContacts:(id)a3 mechanismHints:(id)a4;
+ (id)normalizedStringKey:(id)a3;
+ (id)predicateForContact:(id)a3;
+ (id)predicateForContactWithContactIdType:(int64_t *)a3;
+ (id)predicateForContactWithDisplayName:(id)a3;
+ (id)predicateForContactWithIdentifier:(id)a3;
+ (id)predicateForContactWithPersonId:(id)a3 personIdType:(unint64_t)a4;
+ (id)predicateForContactWithType:(unint64_t)a3;
+ (id)typeAsCNContactPropertyKey:(unint64_t)a3;
+ (unint64_t)typeFromString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)mayContainPrefix:(id)a3;
- (BOOL)mayRepresentSamePersonAs:(id)a3;
- (NSString)customIdentifier;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)identifierType;
- (NSString)personId;
- (NSURL)displayImageURL;
- (_CDContact)initWithCoder:(id)a3;
- (_CDContact)initWithContactProperty:(id)a3;
- (_CDContact)initWithINPerson:(id)a3;
- (_CDContact)initWithIdentifier:(id)a3 type:(unint64_t)a4 customIdentifier:(id)a5 displayName:(id)a6 displayType:(unint64_t)a7 personId:(id)a8 personIdType:(unint64_t)a9;
- (_CDContact)initWithIdentifier:(id)a3 type:(unint64_t)a4 customIdentifier:(id)a5 displayName:(id)a6 displayType:(unint64_t)a7 personId:(id)a8 personIdType:(unint64_t)a9 displayImageURL:(id)a10;
- (_CDContact)initWithIdentifier:(id)a3 type:(unint64_t)a4 customIdentifier:(id)a5 displayName:(id)a6 displayType:(unint64_t)a7 personId:(id)a8 personIdType:(unint64_t)a9 displayImageURL:(id)a10 participantStatus:(int64_t)a11;
- (_CDContact)initWithIdentifier:(id)a3 type:(unint64_t)a4 customIdentifier:(id)a5 displayName:(id)a6 displayType:(unint64_t)a7 personId:(id)a8 personIdType:(unint64_t)a9 displayImageURL:(id)a10 participantStatus:(int64_t)a11 contactIdType:(int64_t)a12;
- (_CDContact)initWithIdentifier:(id)a3 type:(unint64_t)a4 displayName:(id)a5 personId:(id)a6 personIdType:(unint64_t)a7;
- (_CDContactStatistics)statistics;
- (id)contactProperty;
- (id)contactPropertyWithMechanismHint:(int64_t)a3;
- (id)contactPropertyWithOptionalMechanismHint:(int64_t *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)contactIdType;
- (int64_t)participantStatus;
- (unint64_t)displayType;
- (unint64_t)hash;
- (unint64_t)personIdType;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)mergeWithContact:(id)a3;
- (void)setContactIdType:(int64_t)a3;
- (void)setCustomIdentifier:(id)a3;
- (void)setDisplayImageURL:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplayType:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentifierType:(id)a3;
- (void)setParticipantStatus:(int64_t)a3;
- (void)setPersonId:(id)a3;
- (void)setPersonIdType:(unint64_t)a3;
- (void)setStatistics:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation _CDContact

- (_CDContact)initWithINPerson:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 personHandle];

    if (v6)
    {
      v7 = [v5 personHandle];
      v8 = [v7 value];
      uint64_t v9 = [v8 length];

      if (!v9) {
        goto LABEL_5;
      }
      v10 = [v5 personHandle];
      v11 = [v10 value];
      v12 = +[_CDContactResolver resolveContactIfPossibleFromContactIdentifierString:v11];

      uint64_t v13 = [v12 identifier];

      if (!v13)
      {
LABEL_5:
        v14 = [v5 contactIdentifier];
        uint64_t v15 = [v14 length];

        if (v15)
        {
          uint64_t v13 = [v5 contactIdentifier];
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      v16 = [v5 personHandle];
      v17 = [v16 value];
      v18 = +[_CDContactResolver normalizedStringFromContactString:v17];

      v33 = [v18 _stripFZIDPrefix];

      v19 = [v5 image];
      v20 = [v19 _uri];

      v34 = (void *)v13;
      if (v20)
      {
        v21 = [v19 _uri];
      }
      else
      {
        v21 = [v19 _identifier];

        if (v21)
        {
          v22 = (void *)MEMORY[0x1E4F1CB10];
          v23 = [v19 _identifier];
          v21 = [v22 URLWithString:v23];
        }
      }
      v24 = [v5 personHandle];
      uint64_t v25 = [v24 type];
      self;
      if (v25 == 1) {
        uint64_t v26 = 2;
      }
      else {
        uint64_t v26 = v25 == 2;
      }
      v27 = [v5 customIdentifier];
      v28 = [v5 displayName];
      uint64_t v29 = [v5 suggestionType];
      self;
      if (v29 == 1) {
        uint64_t v30 = 1;
      }
      else {
        uint64_t v30 = 2 * (v29 == 2);
      }
      uint64_t v31 = 3;
      if (!v34) {
        uint64_t v31 = 0;
      }
      self = [(_CDContact *)self initWithIdentifier:v33 type:v26 customIdentifier:v27 displayName:v28 displayType:v30 personId:v34 personIdType:v31 displayImageURL:v21];

      v6 = self;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (_CDContact)contactWithIdentifier:(id)a3 type:(unint64_t)a4 displayName:(id)a5 personId:(id)a6 personIdType:(unint64_t)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  v14 = [[_CDContact alloc] initWithIdentifier:v13 type:a4 displayName:v12 personId:v11 personIdType:a7];

  return v14;
}

- (_CDContact)initWithIdentifier:(id)a3 type:(unint64_t)a4 displayName:(id)a5 personId:(id)a6 personIdType:(unint64_t)a7
{
  return [(_CDContact *)self initWithIdentifier:a3 type:a4 customIdentifier:0 displayName:a5 displayType:0 personId:a6 personIdType:a7];
}

- (_CDContact)initWithIdentifier:(id)a3 type:(unint64_t)a4 customIdentifier:(id)a5 displayName:(id)a6 displayType:(unint64_t)a7 personId:(id)a8 personIdType:(unint64_t)a9
{
  return [(_CDContact *)self initWithIdentifier:a3 type:a4 customIdentifier:a5 displayName:a6 displayType:a7 personId:a8 personIdType:a9 displayImageURL:0];
}

- (_CDContact)initWithIdentifier:(id)a3 type:(unint64_t)a4 customIdentifier:(id)a5 displayName:(id)a6 displayType:(unint64_t)a7 personId:(id)a8 personIdType:(unint64_t)a9 displayImageURL:(id)a10 participantStatus:(int64_t)a11
{
  return [(_CDContact *)self initWithIdentifier:a3 type:a4 customIdentifier:a5 displayName:a6 displayType:a7 personId:a8 personIdType:a9 displayImageURL:0 participantStatus:a11 contactIdType:2];
}

- (_CDContact)initWithIdentifier:(id)a3 type:(unint64_t)a4 customIdentifier:(id)a5 displayName:(id)a6 displayType:(unint64_t)a7 personId:(id)a8 personIdType:(unint64_t)a9 displayImageURL:(id)a10
{
  return [(_CDContact *)self initWithIdentifier:a3 type:a4 customIdentifier:a5 displayName:a6 displayType:a7 personId:a8 personIdType:a9 displayImageURL:a10 participantStatus:0];
}

- (_CDContact)initWithIdentifier:(id)a3 type:(unint64_t)a4 customIdentifier:(id)a5 displayName:(id)a6 displayType:(unint64_t)a7 personId:(id)a8 personIdType:(unint64_t)a9 displayImageURL:(id)a10 participantStatus:(int64_t)a11 contactIdType:(int64_t)a12
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v26 = a8;
  id v20 = a10;
  v27.receiver = self;
  v27.super_class = (Class)_CDContact;
  v21 = [(_CDContact *)&v27 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_identifier, a3);
    objc_storeStrong((id *)&v22->_customIdentifier, a5);
    v22->_type = a4;
    objc_storeStrong((id *)&v22->_displayName, a6);
    v22->_displayType = a7;
    objc_storeStrong((id *)&v22->_personId, a8);
    v22->_personIdType = a9;
    objc_storeStrong((id *)&v22->_displayImageURL, a10);
    v22->_participantStatus = a11;
    v22->_contactIdType = a12;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CDContact)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_CDContact;
  v5 = [(_CDContact *)&v26 init];
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"customIdentifier"];
    customIdentifier = v5->_customIdentifier;
    v5->_customIdentifier = (NSString *)v10;

    v5->_type = [v4 decodeInt64ForKey:@"type"];
    id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"personId"];
    personId = v5->_personId;
    v5->_personId = (NSString *)v13;

    v5->_personIdType = [v4 decodeInt64ForKey:@"personIdType"];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v16;

    v5->_displayType = [v4 decodeInt64ForKey:@"displayType"];
    id v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"statistics"];
    statistics = v5->_statistics;
    v5->_statistics = (_CDContactStatistics *)v19;

    v5->_participantStatus = [v4 decodeInt64ForKey:@"participantStatus"];
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"displayImageURL"];
    displayImageURL = v5->_displayImageURL;
    v5->_displayImageURL = (NSURL *)v22;

    v5->_contactIdType = [v4 decodeInt64ForKey:@"contactIdType"];
    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_customIdentifier forKey:@"customIdentifier"];
  [v5 encodeInt64:self->_type forKey:@"type"];
  [v5 encodeObject:self->_personId forKey:@"personId"];
  [v5 encodeInt64:self->_personIdType forKey:@"personIdType"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeInt64:self->_displayType forKey:@"displayType"];
  [v5 encodeObject:self->_statistics forKey:@"statistics"];
  [v5 encodeObject:self->_displayImageURL forKey:@"displayImageURL"];
  [v5 encodeInt64:self->_participantStatus forKey:@"participantStatus"];
  [v5 encodeInt64:self->_contactIdType forKey:@"contactIdType"];
}

- (id)description
{
  v3 = self->_identifier;
  if (self->_type)
  {
    id v4 = [NSString alloc];
    id v5 = +[_CDContact typeAsCNContactPropertyKey:self->_type];
    uint64_t v6 = [v4 initWithFormat:@"%@=%@", v5, self->_identifier];

    v3 = (NSString *)v6;
  }
  id v7 = [NSString alloc];
  displayName = (__CFString *)self->_displayName;
  uint64_t v9 = &stru_1EDDE58B8;
  if (!displayName) {
    displayName = &stru_1EDDE58B8;
  }
  uint64_t v10 = (void *)[v7 initWithFormat:@"'%@'", displayName];
  unint64_t v11 = self->_personIdType - 1;
  if (v11 <= 2) {
    uint64_t v9 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", off_1E560E888[v11], self->_personId);
  }
  id v12 = [NSString alloc];
  unint64_t participantStatus = self->_participantStatus;
  if (participantStatus > 7) {
    v14 = @"Pending";
  }
  else {
    v14 = off_1E560E8A0[participantStatus];
  }
  uint64_t v15 = (void *)[v12 initWithFormat:@"ParticipantStatus=%@", v14];
  id v16 = [NSString alloc];
  int64_t contactIdType = self->_contactIdType;
  id v18 = @"Person";
  if (contactIdType == 1) {
    id v18 = @"Organization";
  }
  if (contactIdType == 2) {
    uint64_t v19 = @"None";
  }
  else {
    uint64_t v19 = v18;
  }
  id v20 = (void *)[v16 initWithFormat:@"ContactIdType=%@", v19];
  id v21 = [NSString alloc];
  uint64_t v22 = [(NSURL *)self->_displayImageURL absoluteString];
  v23 = objc_msgSend(v21, "initWithFormat:", @"%@; %@; %@; %@; displayImageURL=%@; %@",
                  v3,
                  v10,
                  v9,
                  v15,
                  v22,
                  v20);

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_CDContact allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_identifier, self->_identifier);
  objc_storeStrong((id *)&v4->_customIdentifier, self->_customIdentifier);
  v4->_type = self->_type;
  objc_storeStrong((id *)&v4->_personId, self->_personId);
  v4->_personIdType = self->_personIdType;
  objc_storeStrong((id *)&v4->_displayName, self->_displayName);
  v4->_displayType = self->_displayType;
  objc_storeStrong((id *)&v4->_displayImageURL, self->_displayImageURL);
  v4->_unint64_t participantStatus = self->_participantStatus;
  v4->_int64_t contactIdType = self->_contactIdType;
  return v4;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  unint64_t v4 = self->_type - v3 + 32 * v3;
  return self->_personIdType - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (_CDContact *)a3;
  if (self == v4)
  {
    char v12 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v12 = 0;
    goto LABEL_11;
  }
  id v5 = v4;
  uint64_t v6 = v5;
  if (self->_type != v5->_type || self->_personIdType != v5->_personIdType) {
    goto LABEL_7;
  }
  identifier = self->_identifier;
  v8 = v5->_identifier;
  if (identifier == v8)
  {

LABEL_13:
    displayName = self->_displayName;
    if ((displayName != 0) == (v6->_displayName == 0))
    {
      char v12 = 1;
    }
    else
    {
      uint64_t v15 = displayName;
      id v16 = v15;
      if (v15 == v6->_displayName) {
        char v12 = 1;
      }
      else {
        char v12 = -[NSString isEqual:](v15, "isEqual:");
      }
    }
    goto LABEL_8;
  }
  uint64_t v9 = v8;
  uint64_t v10 = identifier;
  char v11 = [(NSString *)v10 isEqual:v9];

  if (v11) {
    goto LABEL_13;
  }
LABEL_7:
  char v12 = 0;
LABEL_8:

LABEL_11:
  return v12;
}

- (BOOL)mayRepresentSamePersonAs:(id)a3
{
  id v4 = a3;
  unint64_t personIdType = self->_personIdType;
  uint64_t v6 = [v4 personIdType];
  unint64_t v7 = self->_personIdType;
  if (personIdType == v6)
  {
    if (v7)
    {
      if (!self->_personId)
      {
        LOBYTE(personId) = 0;
        goto LABEL_15;
      }
      v8 = [v4 personId];
      if (v8)
      {
        personId = self->_personId;
        uint64_t v9 = [v4 personId];
        LOBYTE(personId) = [(NSString *)personId isEqualToString:v9];
      }
      else
      {
        LOBYTE(personId) = 0;
      }
      goto LABEL_14;
    }
  }
  else if (v7)
  {
    goto LABEL_9;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    v8 = [v4 identifier];
    char v12 = identifier;
LABEL_12:
    uint64_t v13 = v8;
LABEL_13:
    LOBYTE(personId) = [v12 isEqualToString:v13];
LABEL_14:

    goto LABEL_15;
  }
LABEL_9:
  if (![v4 personIdType])
  {
    uint64_t v15 = [v4 identifier];

    if (v15)
    {
      char v12 = [v4 identifier];
      v8 = (NSString *)v12;
      uint64_t v13 = self->_identifier;
      goto LABEL_13;
    }
  }
  personId = self->_displayName;
  if (personId)
  {
    v8 = [v4 displayName];
    char v12 = personId;
    goto LABEL_12;
  }
LABEL_15:

  return (char)personId;
}

- (int64_t)compare:(id)a3
{
  return [(NSString *)self->_identifier compare:*((void *)a3 + 2) options:2];
}

- (void)mergeWithContact:(id)a3
{
  id v33 = a3;
  id v4 = [v33 identifier];
  id v5 = [(_CDContact *)self identifier];
  int v6 = [v4 isEqualToString:v5];

  if (!v6) {
    goto LABEL_27;
  }
  uint64_t v7 = [(_CDContact *)self displayName];
  if (!v7) {
    goto LABEL_35;
  }
  v8 = (void *)v7;
  uint64_t v9 = [(_CDContact *)self identifier];
  uint64_t v10 = [(_CDContact *)self displayName];
  int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
LABEL_35:
    uint64_t v12 = [v33 displayName];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      v14 = [v33 identifier];
      uint64_t v15 = [v33 displayName];
      char v16 = [v14 isEqualToString:v15];

      if ((v16 & 1) == 0)
      {
        id v17 = [v33 displayName];
        [(_CDContact *)self setDisplayName:v17];
      }
    }
  }
  id v18 = [(_CDContact *)self personId];
  if (v18)
  {
  }
  else
  {
    uint64_t v29 = [v33 personId];
    if (v29)
    {
      uint64_t v30 = (void *)v29;
      uint64_t v31 = [v33 personIdType];

      if (v31)
      {
        v32 = [v33 personId];
        [(_CDContact *)self setPersonId:v32];

        -[_CDContact setPersonIdType:](self, "setPersonIdType:", [v33 personIdType]);
      }
    }
  }
  if (![(_CDContact *)self displayType])
  {
    uint64_t v19 = [v33 displayType];
    if (v19 != [(_CDContact *)self displayType]) {
      -[_CDContact setDisplayType:](self, "setDisplayType:", [v33 displayType]);
    }
  }
  id v20 = [(_CDContact *)self customIdentifier];
  if (v20) {
    goto LABEL_15;
  }
  id v21 = [v33 customIdentifier];

  if (v21)
  {
    id v20 = [v33 customIdentifier];
    [(_CDContact *)self setCustomIdentifier:v20];
LABEL_15:
  }
  uint64_t v22 = [(_CDContact *)self statistics];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [v33 statistics];

    if (v24)
    {
      uint64_t v25 = [(_CDContact *)self statistics];
      objc_super v26 = [v33 statistics];
      [v25 updateWithStatistics:v26];
LABEL_22:

      goto LABEL_23;
    }
  }
  uint64_t v25 = [(_CDContact *)self statistics];
  if (v25)
  {
LABEL_23:

    goto LABEL_24;
  }
  objc_super v27 = [v33 statistics];

  if (v27)
  {
    uint64_t v25 = [v33 statistics];
    objc_super v26 = (void *)[v25 copy];
    [(_CDContact *)self setStatistics:v26];
    goto LABEL_22;
  }
LABEL_24:
  int64_t v28 = [(_CDContact *)self contactIdType];
  if (v28 != [v33 contactIdType] && objc_msgSend(v33, "contactIdType") != 2) {
    -[_CDContact setContactIdType:](self, "setContactIdType:", [v33 contactIdType]);
  }
LABEL_27:
}

- (BOOL)mayContainPrefix:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  int v6 = [(_CDContact *)self identifier];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    v8 = [(_CDContact *)self identifier];
    [v5 addObject:v8];
  }
  uint64_t v9 = [(_CDContact *)self displayName];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    int v11 = [(_CDContact *)self displayName];
    uint64_t v12 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v13 = [v11 componentsSeparatedByCharactersInSet:v12];
    [v5 addObjectsFromArray:v13];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
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
        id v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        unint64_t v19 = objc_msgSend(v18, "length", (void)v23);
        if (v19 >= [v4 length])
        {
          id v20 = objc_msgSend(v18, "substringToIndex:", objc_msgSend(v4, "length"));
          uint64_t v21 = [v20 compare:v4 options:129];

          if (!v21)
          {
            LOBYTE(v15) = 1;
            goto LABEL_16;
          }
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v15;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)customIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCustomIdentifier:(id)a3
{
}

- (NSString)personId
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPersonId:(id)a3
{
}

- (unint64_t)personIdType
{
  return self->_personIdType;
}

- (void)setPersonIdType:(unint64_t)a3
{
  self->_unint64_t personIdType = a3;
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(unint64_t)a3
{
  self->_displayType = a3;
}

- (int64_t)participantStatus
{
  return self->_participantStatus;
}

- (void)setParticipantStatus:(int64_t)a3
{
  self->_unint64_t participantStatus = a3;
}

- (NSURL)displayImageURL
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDisplayImageURL:(id)a3
{
}

- (int64_t)contactIdType
{
  return self->_contactIdType;
}

- (void)setContactIdType:(int64_t)a3
{
  self->_int64_t contactIdType = a3;
}

- (_CDContactStatistics)statistics
{
  return (_CDContactStatistics *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStatistics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_displayImageURL, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_personId, 0);
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)predicateForContactWithType:(unint64_t)a3
{
  NSUInteger v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [v3 predicateWithFormat:@"type == %@", v4];

  return v5;
}

+ (id)predicateForContactWithIdentifier:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier == %@", a3];
}

+ (id)predicateForContactWithDisplayName:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"displayName == %@", a3];
}

+ (id)predicateForContactWithPersonId:(id)a3 personIdType:(unint64_t)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a4];
  v8 = [v6 predicateWithFormat:@"personIdType == %@", v7];

  if (a4)
  {
    uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"personId == %@", v5];
    uint64_t v10 = (void *)MEMORY[0x1E4F28BA0];
    v14[0] = v8;
    v14[1] = v9;
    int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    uint64_t v12 = [v10 andPredicateWithSubpredicates:v11];

    v8 = (void *)v12;
  }

  return v8;
}

+ (id)predicateForContact:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  int v6 = objc_msgSend(a1, "predicateForContactWithType:", objc_msgSend(v4, "type"));
  [v5 addObject:v6];

  uint64_t v7 = [v4 personId];
  v8 = objc_msgSend(a1, "predicateForContactWithPersonId:personIdType:", v7, objc_msgSend(v4, "personIdType"));
  [v5 addObject:v8];

  uint64_t v9 = [v4 identifier];
  uint64_t v10 = [a1 predicateForContactWithIdentifier:v9];
  [v5 addObject:v10];

  int v11 = [v4 displayName];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    uint64_t v13 = [v4 displayName];
    id v14 = [a1 predicateForContactWithDisplayName:v13];
    [v5 addObject:v14];
  }
  uint64_t v15 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v5];

  return v15;
}

+ (id)predicateForContactWithContactIdType:(int64_t *)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"contactIdType == %@", a3];
}

- (_CDContact)initWithContactProperty:(id)a3
{
  return 0;
}

- (id)contactProperty
{
  return 0;
}

- (id)contactPropertyWithMechanismHint:(int64_t)a3
{
  return 0;
}

- (id)contactPropertyWithOptionalMechanismHint:(int64_t *)a3
{
  return 0;
}

+ (id)contactPropertiesForContacts:(id)a3
{
  return 0;
}

+ (id)contactPropertiesForContacts:(id)a3 mechanismHints:(id)a4
{
  return 0;
}

+ (id)_contactPropertiesForContacts:(id)a3 mechanismHints:(id)a4
{
  return 0;
}

+ (id)_CDValueForContactProperty:(id)a3
{
  return 0;
}

+ (_CDContact)contactWithIdentifier:(id)a3 identifierType:(id)a4
{
  return +[_CDContact contactWithIdentifier:a3 identifierType:a4 personId:0 personIdType:0];
}

+ (_CDContact)contactWithIdentifier:(id)a3 identifierType:(id)a4 personId:(id)a5 personIdType:(unint64_t)a6
{
  return +[_CDContact contactWithIdentifier:a3 identifierType:a4 displayName:0 personId:a5 personIdType:a6];
}

+ (_CDContact)contactWithIdentifier:(id)a3 identifierType:(id)a4 displayName:(id)a5 personId:(id)a6 personIdType:(unint64_t)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = +[_CDContact contactWithIdentifier:type:displayName:personId:personIdType:](_CDContact, "contactWithIdentifier:type:displayName:personId:personIdType:", v13, +[_CDContact typeFromString:a4], v12, v11, a7);

  return (_CDContact *)v14;
}

- (NSString)identifierType
{
  unint64_t v2 = [(_CDContact *)self type];
  return (NSString *)+[_CDContact typeAsCNContactPropertyKey:v2];
}

- (void)setIdentifierType:(id)a3
{
  unint64_t v4 = +[_CDContact typeFromString:a3];
  [(_CDContact *)self setType:v4];
}

+ (id)normalizedStringKey:(id)a3
{
  NSUInteger v3 = [a3 lowercaseString];
  if (!v3) {
    NSUInteger v3 = @"<NIL>";
  }
  return v3;
}

+ (unint64_t)typeFromString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52___CDContact_BackwardCompatability__typeFromString___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (typeFromString__onceToken != -1) {
      dispatch_once(&typeFromString__onceToken, block);
    }
    id v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    int v6 = [v4 stringByTrimmingCharactersInSet:v5];
    uint64_t v7 = [a1 normalizedStringKey:v6];

    v8 = [(id)typeFromString__lookup objectForKeyedSubscript:v7];
    uint64_t v9 = v8;
    if (v8) {
      unint64_t v10 = [v8 unsignedIntegerValue];
    }
    else {
      unint64_t v10 = 0;
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

+ (id)typeAsCNContactPropertyKey:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      id v4 = getCNContactPhoneNumbersKey();
      goto LABEL_12;
    case 2uLL:
      id v4 = getCNContactEmailAddressesKey();
      goto LABEL_12;
    case 3uLL:
      id v4 = getCNContactInstantMessageAddressesKey();
      goto LABEL_12;
    case 4uLL:
      id v4 = getCNContactGivenNameKey();
      goto LABEL_12;
    case 5uLL:
      id v4 = getCNContactSocialProfilesKey();
      goto LABEL_12;
    case 6uLL:
      id v4 = getCNContactUrlAddressesKey();
      goto LABEL_12;
    case 7uLL:
      id v4 = getCNContactPostalAddressesKey();
LABEL_12:
      break;
    default:
      id v4 = 0;
      break;
  }
  return v4;
}

@end