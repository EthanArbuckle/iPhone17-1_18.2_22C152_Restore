@interface LNQueryRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNPropertyQuery)propertyQuery;
- (LNQueryRequest)initWithCoder:(id)a3;
- (LNQueryRequest)initWithIdentifiers:(id)a3 entityMangledTypeName:(id)a4;
- (LNQueryRequest)initWithIdentifiers:(id)a3 entityType:(id)a4;
- (LNQueryRequest)initWithPropertyQuery:(id)a3 maximumResultCount:(id)a4 entityType:(id)a5 intentMangledTypeNames:(id)a6 sortingOptions:(id)a7;
- (LNQueryRequest)initWithPropertyQuery:(id)a3 maximumResultCount:(id)a4 queryMangledTypeName:(id)a5 sortingOptions:(id)a6;
- (LNQueryRequest)initWithPropertyQuery:(id)a3 maximumResultCount:(id)a4 queryType:(id)a5 sortingOptions:(id)a6;
- (LNQueryRequest)initWithRequestType:(int64_t)a3 identifiersToMatch:(id)a4 stringToMatch:(id)a5 propertyQuery:(id)a6 maximumResultCount:(id)a7 entityIdentifier:(id)a8 entityMangledTypeName:(id)a9 queryIdentifier:(id)a10 queryMangledTypeName:(id)a11 intentMangledTypeNames:(id)a12 sortingOptions:(id)a13;
- (LNQueryRequest)initWithString:(id)a3 entityMangledTypeName:(id)a4;
- (LNQueryRequest)initWithString:(id)a3 entityType:(id)a4;
- (LNQueryRequest)initWithUniqueEntityMangledTypeName:(id)a3;
- (NSArray)identifiersToMatch;
- (NSArray)intentMangledTypeNames;
- (NSArray)sortingOptions;
- (NSNumber)maximumResultCount;
- (NSString)entityIdentifier;
- (NSString)entityMangledTypeName;
- (NSString)queryIdentifier;
- (NSString)queryMangledTypeName;
- (NSString)stringToMatch;
- (int64_t)requestType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNQueryRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMangledTypeNames, 0);
  objc_storeStrong((id *)&self->_queryMangledTypeName, 0);
  objc_storeStrong((id *)&self->_queryIdentifier, 0);
  objc_storeStrong((id *)&self->_entityMangledTypeName, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_maximumResultCount, 0);
  objc_storeStrong((id *)&self->_sortingOptions, 0);
  objc_storeStrong((id *)&self->_propertyQuery, 0);
  objc_storeStrong((id *)&self->_stringToMatch, 0);
  objc_storeStrong((id *)&self->_identifiersToMatch, 0);
}

- (NSArray)intentMangledTypeNames
{
  return self->_intentMangledTypeNames;
}

- (NSString)queryMangledTypeName
{
  return self->_queryMangledTypeName;
}

- (NSString)queryIdentifier
{
  return self->_queryIdentifier;
}

- (NSString)entityMangledTypeName
{
  return self->_entityMangledTypeName;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSNumber)maximumResultCount
{
  return self->_maximumResultCount;
}

- (NSArray)sortingOptions
{
  return self->_sortingOptions;
}

- (LNPropertyQuery)propertyQuery
{
  return self->_propertyQuery;
}

- (NSString)stringToMatch
{
  return self->_stringToMatch;
}

- (NSArray)identifiersToMatch
{
  return self->_identifiersToMatch;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNQueryRequest *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t v7 = [(LNQueryRequest *)self requestType];
        if (v7 != [(LNQueryRequest *)v6 requestType])
        {
          LOBYTE(v13) = 0;
LABEL_89:

          goto LABEL_90;
        }
        v8 = [(LNQueryRequest *)self entityIdentifier];
        v9 = [(LNQueryRequest *)v6 entityIdentifier];
        v10 = v8;
        v11 = v9;
        v12 = v11;
        if (v10 == v11)
        {
        }
        else
        {
          LOBYTE(v13) = 0;
          v14 = v11;
          v15 = v10;
          if (!v10 || !v11) {
            goto LABEL_86;
          }
          int v16 = [(LNQueryRequest *)v10 isEqualToString:v11];

          if (!v16)
          {
            LOBYTE(v13) = 0;
LABEL_87:

            goto LABEL_88;
          }
        }
        v17 = [(LNQueryRequest *)self entityMangledTypeName];
        v18 = [(LNQueryRequest *)v6 entityMangledTypeName];
        v15 = v17;
        v19 = v18;
        v14 = v19;
        if (v15 == v19)
        {
        }
        else
        {
          LOBYTE(v13) = 0;
          v20 = v19;
          v21 = v15;
          if (!v15 || !v19) {
            goto LABEL_85;
          }
          int v22 = [(LNQueryRequest *)v15 isEqualToString:v19];

          if (!v22)
          {
            LOBYTE(v13) = 0;
LABEL_86:

            goto LABEL_87;
          }
        }
        v23 = [(LNQueryRequest *)self identifiersToMatch];
        v24 = [(LNQueryRequest *)v6 identifiersToMatch];
        v21 = v23;
        v25 = v24;
        v20 = v25;
        v81 = v21;
        if (v21 == v25)
        {
        }
        else
        {
          LOBYTE(v13) = 0;
          v26 = v25;
          if (!v21 || !v25) {
            goto LABEL_84;
          }
          int v13 = [(LNQueryRequest *)v21 isEqual:v25];

          if (!v13) {
            goto LABEL_85;
          }
        }
        v80 = v20;
        v27 = [(LNQueryRequest *)self maximumResultCount];
        v28 = [(LNQueryRequest *)v6 maximumResultCount];
        v29 = v27;
        v30 = v28;
        v78 = v30;
        v79 = v29;
        if (v29 == v30)
        {
        }
        else
        {
          LOBYTE(v13) = 0;
          if (!v29)
          {
            v31 = v30;
            v20 = v80;
            goto LABEL_82;
          }
          v31 = v30;
          v20 = v80;
          if (!v30)
          {
LABEL_82:

            goto LABEL_83;
          }
          BOOL v32 = [(LNQueryRequest *)v29 isEqual:v30];

          if (!v32)
          {
            LOBYTE(v13) = 0;
            v20 = v80;
LABEL_83:
            v26 = v78;
            v21 = v79;
LABEL_84:

            v21 = v81;
LABEL_85:

            goto LABEL_86;
          }
        }
        v33 = [(LNQueryRequest *)self propertyQuery];
        v34 = [(LNQueryRequest *)v6 propertyQuery];
        v29 = v33;
        v35 = v34;
        v76 = v29;
        v77 = v35;
        if (v29 != v35)
        {
          LOBYTE(v13) = 0;
          if (v29)
          {
            v36 = v35;
            v20 = v80;
            if (v35)
            {
              BOOL v37 = [(LNQueryRequest *)v29 isEqual:v35];

              if (!v37)
              {
                LOBYTE(v13) = 0;
                v20 = v80;
                v31 = v77;
                goto LABEL_82;
              }
LABEL_39:
              v38 = [(LNQueryRequest *)self queryIdentifier];
              v39 = [(LNQueryRequest *)v6 queryIdentifier];
              v40 = v38;
              v41 = v39;
              v74 = v41;
              v75 = v40;
              if (v40 == v41)
              {
              }
              else
              {
                LOBYTE(v13) = 0;
                if (!v40)
                {
                  v42 = v41;
                  v20 = v80;
                  goto LABEL_79;
                }
                v42 = v41;
                v20 = v80;
                if (!v41)
                {
LABEL_79:

                  goto LABEL_80;
                }
                int v43 = [(LNQueryRequest *)v40 isEqualToString:v41];

                if (!v43)
                {
                  LOBYTE(v13) = 0;
                  v20 = v80;
LABEL_80:
                  v36 = (LNQueryRequest *)v74;
                  v29 = v75;
                  goto LABEL_81;
                }
              }
              v44 = [(LNQueryRequest *)self queryMangledTypeName];
              v45 = [(LNQueryRequest *)v6 queryMangledTypeName];
              v40 = v44;
              v46 = v45;
              v72 = v40;
              v73 = v46;
              if (v40 != v46)
              {
                LOBYTE(v13) = 0;
                if (v40)
                {
                  v47 = v46;
                  v20 = v80;
                  if (v46)
                  {
                    int v48 = [(LNQueryRequest *)v40 isEqualToString:v46];

                    if (!v48)
                    {
                      LOBYTE(v13) = 0;
                      v20 = v80;
                      v42 = v73;
                      goto LABEL_79;
                    }
LABEL_53:
                    v49 = [(LNQueryRequest *)self stringToMatch];
                    v50 = [(LNQueryRequest *)v6 stringToMatch];
                    id v51 = v49;
                    id v52 = v50;
                    v70 = v52;
                    v71 = v51;
                    if (v51 == v52)
                    {
                    }
                    else
                    {
                      LOBYTE(v13) = 0;
                      if (!v51)
                      {
                        v53 = v52;
                        v20 = v80;
                        goto LABEL_76;
                      }
                      v53 = v52;
                      v20 = v80;
                      if (!v52)
                      {
LABEL_76:

                        goto LABEL_77;
                      }
                      int v54 = [v51 isEqualToString:v52];

                      if (!v54)
                      {
                        LOBYTE(v13) = 0;
                        v20 = v80;
LABEL_77:
                        v47 = v70;
                        v40 = (LNQueryRequest *)v71;
                        goto LABEL_78;
                      }
                    }
                    v55 = [(LNQueryRequest *)self sortingOptions];
                    v56 = [(LNQueryRequest *)v6 sortingOptions];
                    id v51 = v55;
                    id v57 = v56;
                    id v68 = v51;
                    v69 = v57;
                    if (v51 != v57)
                    {
                      LOBYTE(v13) = 0;
                      if (v51)
                      {
                        v58 = v57;
                        v20 = v80;
                        if (v57)
                        {
                          int v59 = [v51 isEqual:v57];

                          if (!v59)
                          {
                            LOBYTE(v13) = 0;
                            v20 = v80;
                            v53 = v69;
                            goto LABEL_76;
                          }
                          goto LABEL_67;
                        }
                      }
                      else
                      {
                        v58 = v57;
                        v20 = v80;
                      }
LABEL_75:

                      id v51 = v68;
                      v53 = v69;
                      goto LABEL_76;
                    }

LABEL_67:
                    v60 = [(LNQueryRequest *)self intentMangledTypeNames];
                    v61 = [(LNQueryRequest *)v6 intentMangledTypeNames];
                    id v62 = v60;
                    id v63 = v61;
                    v64 = v62;
                    BOOL v65 = v62 == v63;
                    v66 = v63;
                    if (v65)
                    {
                      LOBYTE(v13) = 1;
                      v20 = v80;
                    }
                    else
                    {
                      LOBYTE(v13) = 0;
                      v20 = v80;
                      if (v64 && v63) {
                        LOBYTE(v13) = [v64 isEqual:v63];
                      }
                    }

                    v58 = v66;
                    id v51 = v64;
                    goto LABEL_75;
                  }
                }
                else
                {
                  v47 = v46;
                  v20 = v80;
                }
LABEL_78:

                v40 = (LNQueryRequest *)v72;
                v42 = v73;
                goto LABEL_79;
              }

              goto LABEL_53;
            }
          }
          else
          {
            v36 = v35;
            v20 = v80;
          }
LABEL_81:

          v29 = v76;
          v31 = v77;
          goto LABEL_82;
        }

        goto LABEL_39;
      }
      LOBYTE(v13) = 0;
      v10 = v6;
      v6 = 0;
    }
    else
    {
      v10 = 0;
      LOBYTE(v13) = 0;
    }
LABEL_88:

    goto LABEL_89;
  }
  LOBYTE(v13) = 1;
LABEL_90:

  return v13;
}

- (unint64_t)hash
{
  int64_t v3 = [(LNQueryRequest *)self requestType];
  v24 = [(LNQueryRequest *)self entityIdentifier];
  uint64_t v4 = [v24 hash] + v3;
  v23 = [(LNQueryRequest *)self identifiersToMatch];
  uint64_t v5 = [v23 hash];
  v6 = [(LNQueryRequest *)self maximumResultCount];
  uint64_t v7 = v5 ^ [v6 hash] ^ v4;
  v8 = [(LNQueryRequest *)self propertyQuery];
  uint64_t v9 = [v8 hash];
  v10 = [(LNQueryRequest *)self queryIdentifier];
  uint64_t v11 = v9 ^ [v10 hash];
  v12 = [(LNQueryRequest *)self stringToMatch];
  uint64_t v13 = v7 ^ v11 ^ [v12 hash];
  v14 = [(LNQueryRequest *)self intentMangledTypeNames];
  uint64_t v15 = [v14 hash];
  int v16 = [(LNQueryRequest *)self sortingOptions];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(LNQueryRequest *)self entityMangledTypeName];
  uint64_t v19 = v17 ^ [v18 hash];
  v20 = [(LNQueryRequest *)self queryMangledTypeName];
  unint64_t v21 = v13 ^ v19 ^ [v20 hash];

  return v21;
}

- (LNQueryRequest)initWithCoder:(id)a3
{
  id v3 = a3;
  v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"entityIdentifier"];
  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"entityMangledTypeName"];
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  uint64_t v7 = [v3 decodeObjectOfClasses:v6 forKey:@"intentMangledTypeNames"];

  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  uint64_t v11 = [v3 decodeObjectOfClasses:v10 forKey:@"identifiersToMatch"];

  int v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"maximumResultCount"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"propertyQuery"];
  uint64_t v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"queryIdentifier"];
  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"queryMangledTypeName"];
  uint64_t v15 = [v3 decodeIntegerForKey:@"requestType"];
  int v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"stringToMatch"];
  uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v20 = [v3 decodeObjectOfClasses:v19 forKey:@"sortingOptions"];

  v26 = [(LNQueryRequest *)self initWithRequestType:v15 identifiersToMatch:v11 stringToMatch:v16 propertyQuery:v12 maximumResultCount:v22 entityIdentifier:v24 entityMangledTypeName:v23 queryIdentifier:v13 queryMangledTypeName:v14 intentMangledTypeNames:v7 sortingOptions:v20];
  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(LNQueryRequest *)self entityIdentifier];
  [v4 encodeObject:v5 forKey:@"entityIdentifier"];

  v6 = [(LNQueryRequest *)self entityMangledTypeName];
  [v4 encodeObject:v6 forKey:@"entityMangledTypeName"];

  uint64_t v7 = [(LNQueryRequest *)self intentMangledTypeNames];
  [v4 encodeObject:v7 forKey:@"intentMangledTypeNames"];

  v8 = [(LNQueryRequest *)self identifiersToMatch];
  [v4 encodeObject:v8 forKey:@"identifiersToMatch"];

  uint64_t v9 = [(LNQueryRequest *)self maximumResultCount];
  [v4 encodeObject:v9 forKey:@"maximumResultCount"];

  v10 = [(LNQueryRequest *)self propertyQuery];
  [v4 encodeObject:v10 forKey:@"propertyQuery"];

  uint64_t v11 = [(LNQueryRequest *)self queryIdentifier];
  [v4 encodeObject:v11 forKey:@"queryIdentifier"];

  v12 = [(LNQueryRequest *)self queryMangledTypeName];
  [v4 encodeObject:v12 forKey:@"queryMangledTypeName"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNQueryRequest requestType](self, "requestType"), @"requestType");
  uint64_t v13 = [(LNQueryRequest *)self stringToMatch];
  [v4 encodeObject:v13 forKey:@"stringToMatch"];

  id v14 = [(LNQueryRequest *)self sortingOptions];
  [v4 encodeObject:v14 forKey:@"sortingOptions"];
}

- (LNQueryRequest)initWithRequestType:(int64_t)a3 identifiersToMatch:(id)a4 stringToMatch:(id)a5 propertyQuery:(id)a6 maximumResultCount:(id)a7 entityIdentifier:(id)a8 entityMangledTypeName:(id)a9 queryIdentifier:(id)a10 queryMangledTypeName:(id)a11 intentMangledTypeNames:(id)a12 sortingOptions:(id)a13
{
  id v17 = a4;
  id v18 = a5;
  id obj = a6;
  id v49 = a6;
  id v46 = a7;
  id v48 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  v23 = v18;
  id v24 = a12;
  id v25 = a13;
  v50.receiver = self;
  v50.super_class = (Class)LNQueryRequest;
  v26 = [(LNQueryRequest *)&v50 init];
  v27 = v26;
  if (v26)
  {
    v26->_requestType = a3;
    uint64_t v28 = [v17 copy];
    identifiersToMatch = v27->_identifiersToMatch;
    v27->_identifiersToMatch = (NSArray *)v28;

    uint64_t v30 = [v23 copy];
    stringToMatch = v27->_stringToMatch;
    v27->_stringToMatch = (NSString *)v30;

    objc_storeStrong((id *)&v27->_propertyQuery, obj);
    objc_storeStrong((id *)&v27->_maximumResultCount, v46);
    uint64_t v32 = [v19 copy];
    entityIdentifier = v27->_entityIdentifier;
    v27->_entityIdentifier = (NSString *)v32;

    uint64_t v34 = [v20 copy];
    entityMangledTypeName = v27->_entityMangledTypeName;
    v27->_entityMangledTypeName = (NSString *)v34;

    uint64_t v36 = [v21 copy];
    queryIdentifier = v27->_queryIdentifier;
    v27->_queryIdentifier = (NSString *)v36;

    uint64_t v38 = [v22 copy];
    queryMangledTypeName = v27->_queryMangledTypeName;
    v27->_queryMangledTypeName = (NSString *)v38;

    uint64_t v40 = [v24 copy];
    intentMangledTypeNames = v27->_intentMangledTypeNames;
    v27->_intentMangledTypeNames = (NSArray *)v40;

    objc_storeStrong((id *)&v27->_sortingOptions, a13);
    v42 = v27;
  }

  return v27;
}

- (LNQueryRequest)initWithUniqueEntityMangledTypeName:(id)a3
{
  return [(LNQueryRequest *)self initWithRequestType:3 identifiersToMatch:0 stringToMatch:0 propertyQuery:0 maximumResultCount:0 entityIdentifier:0 entityMangledTypeName:a3 queryIdentifier:0 queryMangledTypeName:0 intentMangledTypeNames:0 sortingOptions:0];
}

- (LNQueryRequest)initWithPropertyQuery:(id)a3 maximumResultCount:(id)a4 queryMangledTypeName:(id)a5 sortingOptions:(id)a6
{
  return [(LNQueryRequest *)self initWithRequestType:2 identifiersToMatch:0 stringToMatch:0 propertyQuery:a3 maximumResultCount:a4 entityIdentifier:0 entityMangledTypeName:0 queryIdentifier:0 queryMangledTypeName:a5 intentMangledTypeNames:0 sortingOptions:a6];
}

- (LNQueryRequest)initWithString:(id)a3 entityMangledTypeName:(id)a4
{
  return [(LNQueryRequest *)self initWithRequestType:1 identifiersToMatch:0 stringToMatch:a3 propertyQuery:0 maximumResultCount:0 entityIdentifier:0 entityMangledTypeName:a4 queryIdentifier:0 queryMangledTypeName:0 intentMangledTypeNames:0 sortingOptions:0];
}

- (LNQueryRequest)initWithIdentifiers:(id)a3 entityMangledTypeName:(id)a4
{
  return [(LNQueryRequest *)self initWithRequestType:0 identifiersToMatch:a3 stringToMatch:0 propertyQuery:0 maximumResultCount:0 entityIdentifier:0 entityMangledTypeName:a4 queryIdentifier:0 queryMangledTypeName:0 intentMangledTypeNames:0 sortingOptions:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNQueryRequest)initWithPropertyQuery:(id)a3 maximumResultCount:(id)a4 entityType:(id)a5 intentMangledTypeNames:(id)a6 sortingOptions:(id)a7
{
  return [(LNQueryRequest *)self initWithRequestType:2 identifiersToMatch:0 stringToMatch:0 propertyQuery:a3 maximumResultCount:a4 entityIdentifier:a5 entityMangledTypeName:0 queryIdentifier:0 queryMangledTypeName:0 intentMangledTypeNames:a6 sortingOptions:a7];
}

- (LNQueryRequest)initWithPropertyQuery:(id)a3 maximumResultCount:(id)a4 queryType:(id)a5 sortingOptions:(id)a6
{
  return [(LNQueryRequest *)self initWithRequestType:2 identifiersToMatch:0 stringToMatch:0 propertyQuery:a3 maximumResultCount:a4 entityIdentifier:0 entityMangledTypeName:0 queryIdentifier:a5 queryMangledTypeName:0 intentMangledTypeNames:0 sortingOptions:a6];
}

- (LNQueryRequest)initWithString:(id)a3 entityType:(id)a4
{
  return [(LNQueryRequest *)self initWithRequestType:1 identifiersToMatch:0 stringToMatch:a3 propertyQuery:0 maximumResultCount:0 entityIdentifier:0 entityMangledTypeName:a4 queryIdentifier:0 queryMangledTypeName:0 intentMangledTypeNames:0 sortingOptions:0];
}

- (LNQueryRequest)initWithIdentifiers:(id)a3 entityType:(id)a4
{
  return [(LNQueryRequest *)self initWithRequestType:0 identifiersToMatch:a3 stringToMatch:0 propertyQuery:0 maximumResultCount:0 entityIdentifier:0 entityMangledTypeName:a4 queryIdentifier:0 queryMangledTypeName:0 intentMangledTypeNames:0 sortingOptions:0];
}

@end