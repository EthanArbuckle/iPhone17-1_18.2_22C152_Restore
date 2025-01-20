@interface AFShowSettingRequest
+ (BOOL)supportsSecureCoding;
- (AFShowSettingRequest)initWithCoder:(id)a3;
- (id)_initWithSettingType:(int64_t)a3;
- (id)createResponse;
- (int64_t)settingType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFShowSettingRequest

- (AFShowSettingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AFShowSettingRequest;
  v5 = [(AFSiriRequest *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_settingType = [v4 decodeIntegerForKey:@"_settingType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFShowSettingRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_settingType, @"_settingType", v5.receiver, v5.super_class);
}

- (id)createResponse
{
  id v2 = [(AFSiriResponse *)[AFSiriRequestSucceededResponse alloc] _initWithRequest:self];
  return v2;
}

- (int64_t)settingType
{
  return self->_settingType;
}

- (id)_initWithSettingType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFShowSettingRequest;
  id result = [(AFSiriRequest *)&v5 init];
  if (result) {
    *((void *)result + 5) = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end