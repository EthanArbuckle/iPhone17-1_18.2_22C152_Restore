@interface LCFFetureValueNameType
- (NSString)featureName;
- (id)init:(id)a3 featureValueType:(int64_t)a4;
- (int64_t)featureValueType;
@end

@implementation LCFFetureValueNameType

- (id)init:(id)a3 featureValueType:(int64_t)a4
{
  id v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LCFFetureValueNameType;
  v8 = [(LCFFetureValueNameType *)&v10 init];
  if (v8)
  {
    LCFLoggingUtilsInit();
    objc_storeStrong((id *)&v8->_featureName, a3);
    v8->_featureValueType = a4;
  }

  return v8;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (int64_t)featureValueType
{
  return self->_featureValueType;
}

- (void).cxx_destruct
{
}

@end