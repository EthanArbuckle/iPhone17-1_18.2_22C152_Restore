@interface TestModeMetadata
- (NSDictionary)testSpecificValidationData;
- (TestModeMetadata)initWithMode:(unint64_t)a3 testSpecificValidationData:(id)a4;
- (unint64_t)mode;
@end

@implementation TestModeMetadata

- (TestModeMetadata)initWithMode:(unint64_t)a3 testSpecificValidationData:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TestModeMetadata;
  v8 = [(TestModeMetadata *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_mode = a3;
    objc_storeStrong((id *)&v8->_testSpecificValidationData, a4);
  }

  return v9;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSDictionary)testSpecificValidationData
{
  return self->_testSpecificValidationData;
}

- (void).cxx_destruct
{
}

@end