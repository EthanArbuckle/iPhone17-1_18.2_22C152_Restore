@interface FFFeatureSetIdentifier
+ (id)identifierFromString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (FFFeatureSetIdentifier)initWithGroup:(id)a3 set:(id)a4;
- (NSString)featureGroupName;
- (NSString)featureSetName;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation FFFeatureSetIdentifier

- (FFFeatureSetIdentifier)initWithGroup:(id)a3 set:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FFFeatureSetIdentifier;
  v9 = [(FFFeatureSetIdentifier *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureGroupName, a3);
    objc_storeStrong((id *)&v10->_featureSetName, a4);
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
    v9 = [FFFeatureSetIdentifier alloc];
    v10 = [v3 objectAtIndexedSubscript:0];
    v11 = [v3 objectAtIndexedSubscript:1];
    v6 = [(FFFeatureSetIdentifier *)v9 initWithGroup:v10 set:v11];
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
  NSUInteger v3 = [(NSString *)self->_featureGroupName hash];
  return [(NSString *)self->_featureSetName hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    featureGroupName = self->_featureGroupName;
    v9 = [v7 featureGroupName];
    if ([(NSString *)featureGroupName isEqualToString:v9])
    {
      featureSetName = self->_featureSetName;
      v11 = [v7 featureSetName];
      BOOL v6 = [(NSString *)featureSetName isEqualToString:v11];
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
  id v4 = +[FFFeatureSetIdentifier allocWithZone:a3];
  featureGroupName = self->_featureGroupName;
  featureSetName = self->_featureSetName;
  return [(FFFeatureSetIdentifier *)v4 initWithGroup:featureGroupName set:featureSetName];
}

- (NSString)featureGroupName
{
  return self->_featureGroupName;
}

- (NSString)featureSetName
{
  return self->_featureSetName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureSetName, 0);
  objc_storeStrong((id *)&self->_featureGroupName, 0);
}

@end