@interface FFFeatureIdentifier
+ (id)identifierFromString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (FFFeatureIdentifier)initWithDomain:(id)a3 feature:(id)a4;
- (NSString)domainName;
- (NSString)featureName;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation FFFeatureIdentifier

- (FFFeatureIdentifier)initWithDomain:(id)a3 feature:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FFFeatureIdentifier;
  v9 = [(FFFeatureIdentifier *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_domainName, a3);
    objc_storeStrong((id *)&v10->_featureName, a4);
  }

  return v10;
}

+ (id)identifierFromString:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@"/"];
  if ([v3 count] != 2) {
    goto LABEL_5;
  }
  v4 = [v3 objectAtIndexedSubscript:0];
  BOOL v5 = +[FFConfiguration isValidName:v4];

  v6 = 0;
  if (!v5) {
    goto LABEL_6;
  }
  id v7 = [v3 objectAtIndexedSubscript:1];
  BOOL v8 = +[FFConfiguration isValidName:v7];

  if (v8)
  {
    v9 = [FFFeatureIdentifier alloc];
    v10 = [v3 objectAtIndexedSubscript:0];
    v11 = [v3 objectAtIndexedSubscript:1];
    v6 = [(FFFeatureIdentifier *)v9 initWithDomain:v10 feature:v11];
  }
  else
  {
LABEL_5:
    v6 = 0;
  }
LABEL_6:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domainName hash];
  return [(NSString *)self->_featureName hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    domainName = self->_domainName;
    v9 = [v7 domainName];
    if ([(NSString *)domainName isEqualToString:v9])
    {
      featureName = self->_featureName;
      v11 = [v7 featureName];
      BOOL v6 = [(NSString *)featureName isEqualToString:v11];
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[FFFeatureIdentifier allocWithZone:a3];
  domainName = self->_domainName;
  featureName = self->_featureName;
  return [(FFFeatureIdentifier *)v4 initWithDomain:domainName feature:featureName];
}

- (NSString)domainName
{
  return self->_domainName;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
}

@end