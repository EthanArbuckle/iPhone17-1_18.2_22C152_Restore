@interface AFSetSettingsResponse
+ (BOOL)supportsSecureCoding;
- (AFSetSettingsResponse)initWithCoder:(id)a3;
- (id)_initWithRequest:(id)a3 settingChanges:(id)a4;
- (id)settingChanges;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSetSettingsResponse

- (void).cxx_destruct
{
}

- (AFSetSettingsResponse)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSetSettingsResponse;
  v5 = [(AFSiriResponse *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_settingChanges"];
    settingChanges = v5->_settingChanges;
    v5->_settingChanges = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFSetSettingsResponse;
  id v4 = a3;
  [(AFSiriResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_settingChanges, @"_settingChanges", v5.receiver, v5.super_class);
}

- (id)settingChanges
{
  return self->_settingChanges;
}

- (id)_initWithRequest:(id)a3 settingChanges:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AFSetSettingsResponse;
  v7 = [(AFSiriResponse *)&v11 _initWithRequest:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    uint64_t v9 = (void *)v7[2];
    v7[2] = v8;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end