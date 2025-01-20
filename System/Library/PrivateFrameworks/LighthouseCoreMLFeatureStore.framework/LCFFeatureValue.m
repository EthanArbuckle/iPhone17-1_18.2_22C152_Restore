@interface LCFFeatureValue
- (BOOL)isNullValue;
- (LCFFeatureValue)initWithBoolValue:(id)a3;
- (LCFFeatureValue)initWithDoubleArray:(id)a3;
- (LCFFeatureValue)initWithDoubleValue:(id)a3;
- (LCFFeatureValue)initWithIntValue:(id)a3;
- (LCFFeatureValue)initWithStringValue:(id)a3;
- (LCFFeatureValue)initWithTimeBucketValue:(id)a3;
- (NSArray)doubleArray;
- (NSNumber)BOOLValue;
- (NSNumber)doubleValue;
- (NSNumber)intValue;
- (NSNumber)timeBucketValue;
- (NSString)stringValue;
- (NSString)valueInString;
- (id)getTypeDBString;
- (id)initEmpty;
- (int64_t)type;
@end

@implementation LCFFeatureValue

- (id)initEmpty
{
  v3.receiver = self;
  v3.super_class = (Class)LCFFeatureValue;
  id result = [(LCFFeatureValue *)&v3 init];
  if (result) {
    *((void *)result + 1) = -1;
  }
  return result;
}

- (LCFFeatureValue)initWithIntValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LCFFeatureValue;
  v6 = [(LCFFeatureValue *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_storeStrong((id *)&v6->_intValue, a3);
  }

  return v7;
}

- (LCFFeatureValue)initWithDoubleValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LCFFeatureValue;
  v6 = [(LCFFeatureValue *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 2;
    objc_storeStrong((id *)&v6->_doubleValue, a3);
  }

  return v7;
}

- (LCFFeatureValue)initWithStringValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LCFFeatureValue;
  v6 = [(LCFFeatureValue *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 3;
    objc_storeStrong((id *)&v6->_stringValue, a3);
  }

  return v7;
}

- (LCFFeatureValue)initWithBoolValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LCFFeatureValue;
  v6 = [(LCFFeatureValue *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 4;
    objc_storeStrong((id *)&v6->_BOOLValue, a3);
  }

  return v7;
}

- (LCFFeatureValue)initWithTimeBucketValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LCFFeatureValue;
  v6 = [(LCFFeatureValue *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 5;
    objc_storeStrong((id *)&v6->_timeBucketValue, a3);
  }

  return v7;
}

- (LCFFeatureValue)initWithDoubleArray:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LCFFeatureValue;
  v6 = [(LCFFeatureValue *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 6;
    objc_storeStrong((id *)&v6->_doubleArray, a3);
  }

  return v7;
}

- (NSString)valueInString
{
  switch(self->_type)
  {
    case 1:
      intValue = self->_intValue;
      goto LABEL_7;
    case 2:
      intValue = self->_doubleValue;
      goto LABEL_7;
    case 3:
      uint64_t v3 = [NSString stringWithFormat:@"'%@'", self->_stringValue];
      goto LABEL_8;
    case 4:
      intValue = self->_BOOLValue;
      goto LABEL_7;
    case 5:
      intValue = self->_timeBucketValue;
LABEL_7:
      uint64_t v3 = [(NSNumber *)intValue stringValue];
LABEL_8:
      v4 = (void *)v3;
      break;
    case 6:
      doubleArray = self->_doubleArray;
      if (!doubleArray) {
        goto LABEL_11;
      }
      uint64_t v9 = 0;
      v6 = [MEMORY[0x263F08900] dataWithJSONObject:doubleArray options:0 error:&v9];
      v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
      v4 = [NSString stringWithFormat:@"'%@'", v7];

      break;
    default:
LABEL_11:
      v4 = 0;
      break;
  }
  return (NSString *)v4;
}

- (id)getTypeDBString
{
  unint64_t v2 = self->_type - 1;
  if (v2 > 5) {
    return 0;
  }
  else {
    return off_2653AFF48[v2];
  }
}

- (BOOL)isNullValue
{
  unint64_t v2 = self->_type - 1;
  return v2 > 5 || (&self->_intValue)[v2] == 0;
}

- (int64_t)type
{
  return self->_type;
}

- (NSNumber)intValue
{
  return self->_intValue;
}

- (NSNumber)doubleValue
{
  return self->_doubleValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSNumber)BOOLValue
{
  return self->_BOOLValue;
}

- (NSNumber)timeBucketValue
{
  return self->_timeBucketValue;
}

- (NSArray)doubleArray
{
  return self->_doubleArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleArray, 0);
  objc_storeStrong((id *)&self->_timeBucketValue, 0);
  objc_storeStrong((id *)&self->_BOOLValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_doubleValue, 0);
  objc_storeStrong((id *)&self->_intValue, 0);
}

@end