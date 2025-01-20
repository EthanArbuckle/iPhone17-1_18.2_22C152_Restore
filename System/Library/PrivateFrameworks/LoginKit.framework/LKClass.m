@interface LKClass
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLKClass:(id)a3;
- (LKClass)initWithClassDictionary:(id)a3 usersByUserIdentifier:(id)a4;
- (LKClass)initWithCoder:(id)a3;
- (LKClass)initWithStudents:(id)a3 instructors:(id)a4 className:(id)a5 classID:(id)a6;
- (NSArray)instructors;
- (NSArray)students;
- (NSMutableDictionary)avatarNameSimilarityDictionary;
- (NSMutableDictionary)givenNameSimilarityDictionary;
- (NSNumber)classID;
- (NSString)classDescription;
- (NSString)classImageURL;
- (NSString)className;
- (id)sortUsers:(id)a3;
- (unint64_t)hash;
- (void)_updateNamingSimilarityInfoForUser:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAvatarNameSimilarityDictionary:(id)a3;
- (void)setClassDescription:(id)a3;
- (void)setClassID:(id)a3;
- (void)setClassImageURL:(id)a3;
- (void)setClassName:(id)a3;
- (void)setGivenNameSimilarityDictionary:(id)a3;
- (void)setInstructors:(id)a3;
- (void)setStudents:(id)a3;
@end

@implementation LKClass

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LKClass)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)LKClass;
  v5 = [(LKClass *)&v28 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v9, v10, 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"students"];
    students = v5->_students;
    v5->_students = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClasses:v11 forKey:@"instructors"];
    instructors = v5->_instructors;
    v5->_instructors = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:v6 forKey:@"classDescription"];
    classDescription = v5->_classDescription;
    v5->_classDescription = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:v6 forKey:@"className"];
    className = v5->_className;
    v5->_className = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:v8 forKey:@"classID"];
    classID = v5->_classID;
    v5->_classID = (NSNumber *)v20;

    v22 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v7, v6, v10, 0);

    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"_avatarNameSimilarityDictionary"];
    avatarNameSimilarityDictionary = v5->_avatarNameSimilarityDictionary;
    v5->_avatarNameSimilarityDictionary = (NSMutableDictionary *)v23;

    uint64_t v25 = [v4 decodeObjectOfClasses:v22 forKey:@"_givenNameSimilarityDictionary"];
    givenNameSimilarityDictionary = v5->_givenNameSimilarityDictionary;
    v5->_givenNameSimilarityDictionary = (NSMutableDictionary *)v25;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  students = self->_students;
  id v5 = a3;
  [v5 encodeObject:students forKey:@"students"];
  [v5 encodeObject:self->_instructors forKey:@"instructors"];
  [v5 encodeObject:self->_classDescription forKey:@"classDescription"];
  [v5 encodeObject:self->_className forKey:@"className"];
  [v5 encodeObject:self->_classID forKey:@"classID"];
  [v5 encodeObject:self->_avatarNameSimilarityDictionary forKey:@"_avatarNameSimilarityDictionary"];
  [v5 encodeObject:self->_givenNameSimilarityDictionary forKey:@"_givenNameSimilarityDictionary"];
}

- (unint64_t)hash
{
  v2 = [(LKClass *)self classID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LKClass *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(LKClass *)self isEqualToLKClass:v5];

  return v6;
}

- (BOOL)isEqualToLKClass:(id)a3
{
  id v4 = a3;
  id v5 = [(LKClass *)self classID];
  BOOL v6 = [v4 classID];
  int v7 = [v5 isEqualToNumber:v6];

  if (v7)
  {
    uint64_t v8 = [(LKClass *)self className];
    uint64_t v9 = [v4 className];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      v11 = [(LKClass *)self classDescription];
      uint64_t v12 = [v4 classDescription];
      int v13 = [v11 isEqualToString:v12];

      if (v13)
      {
        uint64_t v14 = [(LKClass *)self students];
        if (!v14)
        {
          uint64_t v12 = [v4 students];
          if (!v12)
          {
LABEL_8:
            uint64_t v20 = [(LKClass *)self instructors];
            if (v20 || ([v4 instructors], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v21 = [(LKClass *)self instructors];
              v22 = [(LKClass *)self sortUsers:v21];
              uint64_t v23 = [v4 instructors];
              v24 = [(LKClass *)self sortUsers:v23];
              int v25 = [v22 isEqualToArray:v24] ^ 1;

              if (v20)
              {
LABEL_17:

                char v26 = v25 ^ 1;
                goto LABEL_14;
              }
            }
            else
            {
              LOBYTE(v25) = 0;
            }

            goto LABEL_17;
          }
        }
        v15 = [(LKClass *)self students];
        uint64_t v16 = [(LKClass *)self sortUsers:v15];
        v17 = [v4 students];
        uint64_t v18 = [(LKClass *)self sortUsers:v17];
        int v19 = [v16 isEqualToArray:v18];

        if (v14)
        {

          if (v19) {
            goto LABEL_8;
          }
        }
        else
        {

          if (v19) {
            goto LABEL_8;
          }
        }
      }
    }
  }
  char v26 = 0;
LABEL_14:

  return v26;
}

- (id)sortUsers:(id)a3
{
  if (a3)
  {
    unint64_t v3 = (objc_class *)MEMORY[0x263F08B30];
    id v4 = a3;
    id v5 = (void *)[[v3 alloc] initWithKey:@"identifier" ascending:1];
    BOOL v6 = [MEMORY[0x263EFF8C0] arrayWithObject:v5];
    int v7 = [v4 sortedArrayUsingDescriptors:v6];
  }
  else
  {
    int v7 = 0;
  }
  return v7;
}

- (LKClass)initWithStudents:(id)a3 instructors:(id)a4 className:(id)a5 classID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)LKClass;
  v15 = [(LKClass *)&v22 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_students, a3);
    objc_storeStrong((id *)&v16->_instructors, a4);
    objc_storeStrong((id *)&v16->_className, a5);
    objc_storeStrong((id *)&v16->_classID, a6);
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    givenNameSimilarityDictionary = v16->_givenNameSimilarityDictionary;
    v16->_givenNameSimilarityDictionary = v17;

    int v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    avatarNameSimilarityDictionary = v16->_avatarNameSimilarityDictionary;
    v16->_avatarNameSimilarityDictionary = v19;
  }
  return v16;
}

- (LKClass)initWithClassDictionary:(id)a3 usersByUserIdentifier:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)LKClass;
  uint64_t v8 = [(LKClass *)&v45 init];
  if (v8)
  {
    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    givenNameSimilarityDictionary = v8->_givenNameSimilarityDictionary;
    v8->_givenNameSimilarityDictionary = v9;

    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    avatarNameSimilarityDictionary = v8->_avatarNameSimilarityDictionary;
    v8->_avatarNameSimilarityDictionary = v11;

    uint64_t v13 = [v6 objectForKeyedSubscript:@"Description"];
    classDescription = v8->_classDescription;
    v8->_classDescription = (NSString *)v13;

    uint64_t v15 = [v6 objectForKeyedSubscript:@"Name"];
    className = v8->_className;
    v8->_className = (NSString *)v15;

    uint64_t v17 = [v6 objectForKeyedSubscript:@"BeaconID"];
    classID = v8->_classID;
    v8->_classID = (NSNumber *)v17;

    int v19 = objc_opt_new();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v20 = [v6 objectForKeyedSubscript:@"LeaderIdentifiers"];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v42;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v42 != v23) {
            objc_enumerationMutation(v20);
          }
          int v25 = [v7 objectForKey:*(void *)(*((void *)&v41 + 1) + 8 * v24)];
          if (v25) {
            [v19 addObject:v25];
          }

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v22);
    }

    objc_storeStrong((id *)&v8->_instructors, v19);
    char v26 = (NSArray *)objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v36 = v6;
    v27 = [v6 objectForKeyedSubscript:@"MemberIdentifiers"];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v38;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = [v7 objectForKey:*(void *)(*((void *)&v37 + 1) + 8 * v31)];
          v33 = [v32 username];

          if (v33)
          {
            [(NSArray *)v26 addObject:v32];
            [(LKClass *)v8 _updateNamingSimilarityInfoForUser:v32];
          }

          ++v31;
        }
        while (v29 != v31);
        uint64_t v29 = [v27 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v29);
    }

    students = v8->_students;
    v8->_students = v26;

    id v6 = v36;
  }

  return v8;
}

- (void)_updateNamingSimilarityInfoForUser:(id)a3
{
  id v39 = a3;
  id v4 = objc_opt_new();
  id v5 = [v39 givenName];
  [v4 setGivenName:v5];

  id v6 = [v39 familyName];
  [v4 setFamilyName:v6];

  id v7 = [v4 givenName];

  if (v7)
  {
    givenNameSimilarityDictionary = self->_givenNameSimilarityDictionary;
    uint64_t v9 = [v4 givenName];
    int v10 = [(NSMutableDictionary *)givenNameSimilarityDictionary objectForKeyedSubscript:v9];

    if (v10)
    {
      id v11 = [v39 namingSimilarityInfoByClassID];
      id v12 = +[LKNamingSimilarity namingSimilarityWithSimilarity:1];
      [v11 setObject:v12 forKey:self->_classID];

      uint64_t v13 = self->_givenNameSimilarityDictionary;
      id v14 = [v4 givenName];
      uint64_t v15 = [(NSMutableDictionary *)v13 objectForKeyedSubscript:v14];
      uint64_t v16 = [v15 namingSimilarityInfoByClassID];
      uint64_t v17 = [v16 objectForKey:self->_classID];
      uint64_t v18 = [v17 similarity];
      int v19 = +[LKNamingSimilarity namingSimilarityWithSimilarity:0];
      uint64_t v20 = [v19 similarity];

      if (v18 == v20) {
        goto LABEL_7;
      }
      uint64_t v21 = +[LKNamingSimilarity namingSimilarityWithSimilarity:1];
      uint64_t v22 = self->_givenNameSimilarityDictionary;
      uint64_t v23 = [v4 givenName];
      uint64_t v24 = [(NSMutableDictionary *)v22 objectForKeyedSubscript:v23];
      int v25 = [v24 namingSimilarityInfoByClassID];
      [v25 setObject:v21 forKeyedSubscript:self->_classID];
    }
    else
    {
      char v26 = self->_givenNameSimilarityDictionary;
      v27 = [v4 givenName];
      [(NSMutableDictionary *)v26 setObject:v39 forKeyedSubscript:v27];

      uint64_t v21 = [v39 namingSimilarityInfoByClassID];
      uint64_t v23 = +[LKNamingSimilarity namingSimilarityWithSimilarity:2];
      [v21 setObject:v23 forKey:self->_classID];
    }
  }
LABEL_7:
  uint64_t v28 = [MEMORY[0x263F08A78] _localizedShortNameForComponents:v4 withStyle:1 options:0];
  if (!v28) {
    goto LABEL_12;
  }
  uint64_t v29 = [(NSMutableDictionary *)self->_avatarNameSimilarityDictionary objectForKeyedSubscript:v28];

  if (v29)
  {
    uint64_t v30 = [v39 namingSimilarityInfoByClassID];
    uint64_t v31 = +[LKNamingSimilarity namingSimilarityWithSimilarity:0];
    [v30 setObject:v31 forKey:self->_classID];

    avatarNameSimilarityDictionary = self->_avatarNameSimilarityDictionary;
    v33 = [v4 givenName];
    v34 = [(NSMutableDictionary *)avatarNameSimilarityDictionary objectForKeyedSubscript:v33];
    v35 = [v34 namingSimilarityInfoByClassID];
    id v36 = +[LKNamingSimilarity namingSimilarityWithSimilarity:0];
    [v35 setObject:v36 forKey:self->_classID];

LABEL_10:
    goto LABEL_12;
  }
  [(NSMutableDictionary *)self->_avatarNameSimilarityDictionary setObject:v39 forKeyedSubscript:v28];
  long long v37 = [v39 namingSimilarityInfoByClassID];
  long long v38 = [v37 objectForKeyedSubscript:self->_classID];

  if (!v38)
  {
    v33 = [v39 namingSimilarityInfoByClassID];
    v34 = +[LKNamingSimilarity namingSimilarityWithSimilarity:2];
    [v33 setObject:v34 forKey:self->_classID];
    goto LABEL_10;
  }
LABEL_12:
}

- (NSArray)students
{
  return self->_students;
}

- (void)setStudents:(id)a3
{
}

- (NSString)classDescription
{
  return self->_classDescription;
}

- (void)setClassDescription:(id)a3
{
}

- (NSString)className
{
  return self->_className;
}

- (void)setClassName:(id)a3
{
}

- (NSString)classImageURL
{
  return self->_classImageURL;
}

- (void)setClassImageURL:(id)a3
{
}

- (NSNumber)classID
{
  return self->_classID;
}

- (void)setClassID:(id)a3
{
}

- (NSArray)instructors
{
  return self->_instructors;
}

- (void)setInstructors:(id)a3
{
}

- (NSMutableDictionary)avatarNameSimilarityDictionary
{
  return self->_avatarNameSimilarityDictionary;
}

- (void)setAvatarNameSimilarityDictionary:(id)a3
{
}

- (NSMutableDictionary)givenNameSimilarityDictionary
{
  return self->_givenNameSimilarityDictionary;
}

- (void)setGivenNameSimilarityDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_givenNameSimilarityDictionary, 0);
  objc_storeStrong((id *)&self->_avatarNameSimilarityDictionary, 0);
  objc_storeStrong((id *)&self->_instructors, 0);
  objc_storeStrong((id *)&self->_classID, 0);
  objc_storeStrong((id *)&self->_classImageURL, 0);
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_classDescription, 0);
  objc_storeStrong((id *)&self->_students, 0);
}

@end