@interface HKFeatureIdentifierAndContext
- (BOOL)isEqual:(id)a3;
- (HKFeatureIdentifierAndContext)initWithFeatureIdentifier:(id)a3 context:(id)a4;
- (NSString)context;
- (NSString)featureIdentifier;
- (id)description;
- (unint64_t)hash;
@end

@implementation HKFeatureIdentifierAndContext

- (HKFeatureIdentifierAndContext)initWithFeatureIdentifier:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKFeatureIdentifierAndContext;
  v9 = [(HKFeatureIdentifierAndContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureIdentifier, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    if ([(NSString *)self->_featureIdentifier isEqualToString:v5[1]]) {
      BOOL v6 = [(NSString *)self->_context isEqualToString:v5[2]];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_featureIdentifier hash];
  return [(NSString *)self->_context hash] ^ v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"(%@, %@)", self->_featureIdentifier, self->_context];
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSString)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end