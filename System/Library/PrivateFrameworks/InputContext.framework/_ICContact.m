@interface _ICContact
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContact:(id)a3;
- (NSArray)cities;
- (NSArray)relations;
- (NSArray)streets;
- (NSString)firstName;
- (NSString)jobTitle;
- (NSString)lastName;
- (NSString)middleName;
- (NSString)nickname;
- (NSString)organizationName;
- (NSString)phoneticFirstName;
- (NSString)phoneticLastName;
- (NSString)phoneticMiddleName;
- (_ICContact)initWithFirstName:(id)a3 phoneticFirstName:(id)a4 middleName:(id)a5 phoneticMiddleName:(id)a6 lastName:(id)a7 phoneticLastName:(id)a8 organizationName:(id)a9 jobTitle:(id)a10 nickname:(id)a11 relations:(id)a12 streets:(id)a13 cities:(id)a14 score:(double)a15;
- (double)score;
- (id)description;
- (id)flatten;
- (unint64_t)hash;
@end

@implementation _ICContact

- (_ICContact)initWithFirstName:(id)a3 phoneticFirstName:(id)a4 middleName:(id)a5 phoneticMiddleName:(id)a6 lastName:(id)a7 phoneticLastName:(id)a8 organizationName:(id)a9 jobTitle:(id)a10 nickname:(id)a11 relations:(id)a12 streets:(id)a13 cities:(id)a14 score:(double)a15
{
  id v45 = a3;
  id v44 = a4;
  id v35 = a5;
  id v43 = a5;
  id v42 = a6;
  id v36 = a7;
  id v41 = a7;
  id v40 = a8;
  id v39 = a9;
  id v38 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  id v24 = a14;
  v46.receiver = self;
  v46.super_class = (Class)_ICContact;
  v25 = [(_ICContact *)&v46 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_firstName, a3);
    objc_storeStrong((id *)&v26->_phoneticFirstName, a4);
    objc_storeStrong((id *)&v26->_middleName, v35);
    objc_storeStrong((id *)&v26->_phoneticMiddleName, a6);
    objc_storeStrong((id *)&v26->_lastName, v36);
    objc_storeStrong((id *)&v26->_phoneticLastName, a8);
    objc_storeStrong((id *)&v26->_organizationName, a9);
    objc_storeStrong((id *)&v26->_jobTitle, a10);
    objc_storeStrong((id *)&v26->_nickname, a11);
    uint64_t v27 = [v22 copy];
    relations = v26->_relations;
    v26->_relations = (NSArray *)v27;

    uint64_t v29 = [v23 copy];
    streets = v26->_streets;
    v26->_streets = (NSArray *)v29;

    uint64_t v31 = [v24 copy];
    cities = v26->_cities;
    v26->_cities = (NSArray *)v31;

    v26->_score = a15;
  }

  return v26;
}

- (id)flatten
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@" ,:;"];
  v4 = [MEMORY[0x263EFF9C0] set];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __21___ICContact_flatten__block_invoke;
  v38[3] = &unk_264C560E8;
  id v5 = v3;
  id v39 = v5;
  id v6 = v4;
  id v40 = v6;
  v7 = (void (**)(void, void))MEMORY[0x237DDFA40](v38);
  v8 = [(_ICContact *)self lastName];
  ((void (**)(void, void *))v7)[2](v7, v8);

  v9 = [(_ICContact *)self firstName];
  ((void (**)(void, void *))v7)[2](v7, v9);

  v10 = [(_ICContact *)self middleName];
  ((void (**)(void, void *))v7)[2](v7, v10);

  v11 = [(_ICContact *)self organizationName];
  ((void (**)(void, void *))v7)[2](v7, v11);

  v12 = [(_ICContact *)self jobTitle];
  ((void (**)(void, void *))v7)[2](v7, v12);

  v13 = [(_ICContact *)self nickname];
  ((void (**)(void, void *))v7)[2](v7, v13);

  v14 = [(_ICContact *)self relations];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v16 = [(_ICContact *)self relations];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v16);
          }
          v7[2](v7, *(void *)(*((void *)&v34 + 1) + 8 * v20++));
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v18);
    }
  }
  id v21 = [(_ICContact *)self cities];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v23 = [(_ICContact *)self cities];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v41 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v23);
          }
          v7[2](v7, *(void *)(*((void *)&v30 + 1) + 8 * v27++));
        }
        while (v25 != v27);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v30 objects:v41 count:16];
      }
      while (v25);
    }
  }
  id v28 = v6;

  return v28;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<_ICContact n:'%@ %@ %@' j:%@ o:%@ s:%f>", self->_firstName, self->_middleName, self->_lastName, self->_jobTitle, self->_organizationName, *(void *)&self->_score];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_firstName hash];
  NSUInteger v4 = [(NSString *)self->_phoneticFirstName hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_middleName hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_phoneticMiddleName hash] - v5 + 32 * v5;
  NSUInteger v7 = [(NSString *)self->_lastName hash] - v6 + 32 * v6;
  NSUInteger v8 = [(NSString *)self->_phoneticLastName hash] - v7 + 32 * v7;
  NSUInteger v9 = [(NSString *)self->_organizationName hash] - v8 + 32 * v8;
  NSUInteger v10 = [(NSString *)self->_jobTitle hash] - v9 + 32 * v9;
  NSUInteger v11 = [(NSString *)self->_nickname hash] - v10 + 32 * v10;
  uint64_t v12 = [(NSArray *)self->_relations hash] - v11 + 32 * v11;
  uint64_t v13 = [(NSArray *)self->_streets hash] - v12 + 32 * v12;
  return (unint64_t)(self->_score
                          + (double)(unint64_t)(31 * ([(NSArray *)self->_cities hash] - v13 + 32 * v13)));
}

- (BOOL)isEqualToContact:(id)a3
{
  NSUInteger v4 = (double *)a3;
  BOOL v5 = [(NSString *)self->_firstName isEqualToString:*((void *)v4 + 1)]
    && [(NSString *)self->_phoneticFirstName isEqualToString:self->_phoneticFirstName]
    && [(NSString *)self->_middleName isEqualToString:*((void *)v4 + 3)]
    && [(NSString *)self->_phoneticMiddleName isEqualToString:*((void *)v4 + 4)]
    && [(NSString *)self->_lastName isEqualToString:*((void *)v4 + 5)]
    && [(NSString *)self->_phoneticLastName isEqualToString:*((void *)v4 + 6)]
    && [(NSString *)self->_organizationName isEqualToString:*((void *)v4 + 7)]
    && [(NSString *)self->_jobTitle isEqualToString:*((void *)v4 + 8)]
    && [(NSString *)self->_nickname isEqualToString:*((void *)v4 + 9)]
    && [(NSArray *)self->_relations isEqualToArray:*((void *)v4 + 10)]
    && [(NSArray *)self->_streets isEqualToArray:*((void *)v4 + 11)]
    && [(NSArray *)self->_cities isEqualToArray:*((void *)v4 + 12)]
    && self->_score == v4[13];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (_ICContact *)a3;
  BOOL v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_ICContact *)self isEqualToContact:v5];

  return v6;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)phoneticFirstName
{
  return self->_phoneticFirstName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)phoneticMiddleName
{
  return self->_phoneticMiddleName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)phoneticLastName
{
  return self->_phoneticLastName;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (NSString)jobTitle
{
  return self->_jobTitle;
}

- (NSString)nickname
{
  return self->_nickname;
}

- (NSArray)relations
{
  return self->_relations;
}

- (NSArray)streets
{
  return self->_streets;
}

- (NSArray)cities
{
  return self->_cities;
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cities, 0);
  objc_storeStrong((id *)&self->_streets, 0);
  objc_storeStrong((id *)&self->_relations, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_phoneticLastName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_phoneticFirstName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end