@interface ASCLockupFeatureAppDistributionInstall
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureAppDistributionInstall)initWithCoder:(id)a3;
- (ASCLockupFeatureAppDistributionInstall)initWithDeveloperId:(id)a3 webDistributionDomains:(id)a4 supportUrl:(id)a5 contentRatingsBySystem:(id)a6 isDistributor:(BOOL)a7;
- (BOOL)isDistributor;
- (BOOL)isEqual:(id)a3;
- (NSArray)webDistributionDomains;
- (NSDictionary)contentRatingsBySystem;
- (NSString)description;
- (NSString)developerId;
- (NSString)supportUrl;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureAppDistributionInstall

- (ASCLockupFeatureAppDistributionInstall)initWithDeveloperId:(id)a3 webDistributionDomains:(id)a4 supportUrl:(id)a5 contentRatingsBySystem:(id)a6 isDistributor:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)ASCLockupFeatureAppDistributionInstall;
  v16 = [(ASCLockupFeatureAppDistributionInstall *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    developerId = v16->_developerId;
    v16->_developerId = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    webDistributionDomains = v16->_webDistributionDomains;
    v16->_webDistributionDomains = (NSArray *)v19;

    uint64_t v21 = [v14 copy];
    supportUrl = v16->_supportUrl;
    v16->_supportUrl = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    contentRatingsBySystem = v16->_contentRatingsBySystem;
    v16->_contentRatingsBySystem = (NSDictionary *)v23;

    v16->_isDistributor = a7;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureAppDistributionInstall)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"developerId"];
  v5 = [v3 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"webDistributionDomains"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"supportUrl"];
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v7, "initWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
  id v13 = [v3 decodeObjectOfClasses:v12 forKey:@"contentRatingsBySystem"];
  uint64_t v14 = [v3 decodeBoolForKey:@"isDistributor"];

  id v15 = [(ASCLockupFeatureAppDistributionInstall *)self initWithDeveloperId:v4 webDistributionDomains:v5 supportUrl:v6 contentRatingsBySystem:v13 isDistributor:v14];
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(ASCLockupFeatureAppDistributionInstall *)self developerId];
  [v8 encodeObject:v4 forKey:@"developerId"];

  v5 = [(ASCLockupFeatureAppDistributionInstall *)self webDistributionDomains];
  [v8 encodeObject:v5 forKey:@"webDistributionDomains"];

  v6 = [(ASCLockupFeatureAppDistributionInstall *)self supportUrl];
  [v8 encodeObject:v6 forKey:@"supportUrl"];

  id v7 = [(ASCLockupFeatureAppDistributionInstall *)self contentRatingsBySystem];
  [v8 encodeObject:v7 forKey:@"contentRatingsBySystem"];

  objc_msgSend(v8, "encodeBool:forKey:", -[ASCLockupFeatureAppDistributionInstall isDistributor](self, "isDistributor"), @"isDistributor");
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(ASCHasher);
  v4 = [(ASCLockupFeatureAppDistributionInstall *)self developerId];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCLockupFeatureAppDistributionInstall *)self webDistributionDomains];
  [(ASCHasher *)v3 combineObject:v5];

  v6 = [(ASCLockupFeatureAppDistributionInstall *)self supportUrl];
  [(ASCHasher *)v3 combineObject:v6];

  id v7 = [(ASCLockupFeatureAppDistributionInstall *)self contentRatingsBySystem];
  [(ASCHasher *)v3 combineObject:v7];

  [(ASCHasher *)v3 combineBool:[(ASCLockupFeatureAppDistributionInstall *)self isDistributor]];
  unint64_t v8 = [(ASCHasher *)v3 finalizeHash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ASCLockupFeatureAppDistributionInstall *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
    }
    else
    {
      v6 = 0;
    }
    unint64_t v8 = v6;

    if (!v8)
    {
      char v7 = 0;
LABEL_35:

      goto LABEL_36;
    }
    uint64_t v9 = [(ASCLockupFeatureAppDistributionInstall *)self developerId];
    uint64_t v10 = [(ASCLockupFeatureAppDistributionInstall *)v8 developerId];
    uint64_t v11 = (void *)v10;
    if (v9 && v10)
    {
      if ([v9 isEqual:v10])
      {
LABEL_12:
        id v12 = [(ASCLockupFeatureAppDistributionInstall *)self webDistributionDomains];
        uint64_t v13 = [(ASCLockupFeatureAppDistributionInstall *)v8 webDistributionDomains];
        uint64_t v14 = (void *)v13;
        if (v12 && v13)
        {
          if ([v12 isEqual:v13])
          {
LABEL_15:
            id v15 = [(ASCLockupFeatureAppDistributionInstall *)self supportUrl];
            uint64_t v16 = [(ASCLockupFeatureAppDistributionInstall *)v8 supportUrl];
            uint64_t v17 = (void *)v16;
            if (v15 && v16)
            {
              if ([v15 isEqual:v16])
              {
LABEL_18:
                uint64_t v18 = [(ASCLockupFeatureAppDistributionInstall *)self contentRatingsBySystem];
                uint64_t v19 = [(ASCLockupFeatureAppDistributionInstall *)v8 contentRatingsBySystem];
                v20 = (void *)v19;
                v27 = (void *)v18;
                if (v18 && v19)
                {
                  uint64_t v21 = (void *)v19;
                  int v22 = [v27 isEqual:v19];
                  v20 = v21;
                  if (v22)
                  {
LABEL_21:
                    uint64_t v23 = v20;
                    BOOL v24 = [(ASCLockupFeatureAppDistributionInstall *)self isDistributor];
                    BOOL v25 = [(ASCLockupFeatureAppDistributionInstall *)v8 isDistributor];
                    v20 = v23;
                    char v7 = v24 ^ v25 ^ 1;
LABEL_31:

                    goto LABEL_32;
                  }
                }
                else if (v18 == v19)
                {
                  goto LABEL_21;
                }
                char v7 = 0;
                goto LABEL_31;
              }
            }
            else if (v15 == (void *)v16)
            {
              goto LABEL_18;
            }
            char v7 = 0;
LABEL_32:

            goto LABEL_33;
          }
        }
        else if (v12 == (void *)v13)
        {
          goto LABEL_15;
        }
        char v7 = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    else if (v9 == (void *)v10)
    {
      goto LABEL_12;
    }
    char v7 = 0;
LABEL_34:

    goto LABEL_35;
  }
  char v7 = 1;
LABEL_36:

  return v7;
}

- (NSString)description
{
  id v3 = [[ASCDescriber alloc] initWithObject:self];
  v4 = [(ASCLockupFeatureAppDistributionInstall *)self developerId];
  [(ASCDescriber *)v3 addObject:v4 withName:@"developerId"];

  v5 = [(ASCLockupFeatureAppDistributionInstall *)self webDistributionDomains];
  [(ASCDescriber *)v3 addObject:v5 withName:@"webDistributionDomains"];

  v6 = [(ASCLockupFeatureAppDistributionInstall *)self supportUrl];
  [(ASCDescriber *)v3 addObject:v6 withName:@"supportUrl"];

  char v7 = [(ASCLockupFeatureAppDistributionInstall *)self contentRatingsBySystem];
  [(ASCDescriber *)v3 addObject:v7 withName:@"contentRatingsBySystem"];

  [(ASCDescriber *)v3 addBool:[(ASCLockupFeatureAppDistributionInstall *)self isDistributor] withName:@"isDistributor"];
  unint64_t v8 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v8;
}

- (NSString)developerId
{
  return self->_developerId;
}

- (NSArray)webDistributionDomains
{
  return self->_webDistributionDomains;
}

- (NSString)supportUrl
{
  return self->_supportUrl;
}

- (NSDictionary)contentRatingsBySystem
{
  return self->_contentRatingsBySystem;
}

- (BOOL)isDistributor
{
  return self->_isDistributor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRatingsBySystem, 0);
  objc_storeStrong((id *)&self->_supportUrl, 0);
  objc_storeStrong((id *)&self->_webDistributionDomains, 0);

  objc_storeStrong((id *)&self->_developerId, 0);
}

@end