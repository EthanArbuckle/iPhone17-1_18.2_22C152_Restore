@interface FeatureHash
- (FeatureHash)initWithValues:(id)a3;
- (NSMutableArray)values;
- (NSString)hashID;
- (void)setHashID:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation FeatureHash

- (FeatureHash)initWithValues:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FeatureHash;
  v5 = [(FeatureHash *)&v9 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F08C38]);
    v7 = [v6 UUIDString];
    [(FeatureHash *)v5 setHashID:v7];

    [(FeatureHash *)v5 setValues:v4];
  }

  return v5;
}

- (NSMutableArray)values
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setValues:(id)a3
{
}

- (NSString)hashID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHashID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashID, 0);

  objc_storeStrong((id *)&self->_values, 0);
}

@end