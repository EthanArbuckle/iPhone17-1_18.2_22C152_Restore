@interface AFSetSettingsRequest
+ (BOOL)supportsSecureCoding;
- (AFSetSettingsRequest)initWithCoder:(id)a3;
- (BOOL)applyChanges;
- (NSArray)settings;
- (id)createResponse;
- (id)createResponseWithSettingChanges:(id)a3;
- (void)_setApplyChanges:(BOOL)a3;
- (void)_setSettings:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSetSettingsRequest

- (void).cxx_destruct
{
}

- (void)_setApplyChanges:(BOOL)a3
{
  self->_applyChanges = a3;
}

- (BOOL)applyChanges
{
  return self->_applyChanges;
}

- (void)_setSettings:(id)a3
{
}

- (NSArray)settings
{
  return self->_settings;
}

- (AFSetSettingsRequest)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSetSettingsRequest;
  v5 = [(AFSiriRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_settings"];
    settings = v5->_settings;
    v5->_settings = (NSArray *)v9;

    v5->_applyChanges = [v4 decodeBoolForKey:@"_applyChanges"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFSetSettingsRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_settings, @"_settings", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_applyChanges forKey:@"_applyChanges"];
}

- (id)createResponseWithSettingChanges:(id)a3
{
  id v4 = a3;
  id v5 = [[AFSetSettingsResponse alloc] _initWithRequest:self settingChanges:v4];

  return v5;
}

- (id)createResponse
{
  id v2 = [(AFSiriResponse *)[AFSiriRequestSucceededResponse alloc] _initWithRequest:self];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end