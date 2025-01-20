@interface _HDAggregationStateKey
+ (void)keyForCollector:(void *)a3 device:(void *)a4 aggregator:;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation _HDAggregationStateKey

+ (void)keyForCollector:(void *)a3 device:(void *)a4 aggregator:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  v9 = objc_alloc_init((Class)self);
  v10 = [v8 identifierForDataAggregator:v6];

  uint64_t v11 = [v10 copy];
  v12 = (void *)v9[1];
  v9[1] = v11;

  uint64_t v13 = [v7 copy];
  v14 = (void *)v9[2];
  v9[2] = v13;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(NSString *)self->_collectorIdentifier isEqualToString:v4[1]])
  {
    char v5 = [(HKDevice *)self->_device isEqual:v4[2]];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_collectorIdentifier hash];
  return [(HKDevice *)self->_device hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_collectorIdentifier, 0);
}

@end