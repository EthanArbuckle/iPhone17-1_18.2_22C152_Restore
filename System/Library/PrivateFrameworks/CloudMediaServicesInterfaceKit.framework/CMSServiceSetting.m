@interface CMSServiceSetting
+ (BOOL)supportsSecureCoding;
+ (id)settingDictionaryFromData:(id)a3;
- (BOOL)allowExplicitContent;
- (BOOL)isEqual:(id)a3;
- (BOOL)updateListeningHistory;
- (CMSServiceSetting)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowExplicitContent:(BOOL)a3;
- (void)setUpdateListeningHistory:(BOOL)a3;
@end

@implementation CMSServiceSetting

- (id)description
{
  v2 = @"YES";
  if (self->_updateListeningHistory) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  if (!self->_allowExplicitContent) {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"CMSServiceSetting <UpdateListeningHistory: %@, ExplicitContentSetting: %@>", v3, v2];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CMSServiceSetting *)a3;
  if (v4 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(CMSServiceSetting *)v5 updateListeningHistory];
      if (v6 == [(CMSServiceSetting *)self updateListeningHistory])
      {
        BOOL v8 = [(CMSServiceSetting *)v5 allowExplicitContent];
        int v7 = v8 ^ [(CMSServiceSetting *)self allowExplicitContent] ^ 1;
      }
      else
      {
        LOBYTE(v7) = 0;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

+ (id)settingDictionaryFromData:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x263F08928];
    v4 = (void *)MEMORY[0x263EFFA08];
    id v5 = a3;
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
    id v16 = 0;
    v11 = [v3 unarchivedObjectOfClasses:v10 fromData:v5 error:&v16];

    id v12 = v16;
    if (v12)
    {
      v13 = _CMSILogingFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[CMSServiceSetting settingDictionaryFromData:]((uint64_t)v12, v13);
      }

      id v14 = 0;
    }
    else
    {
      id v14 = v11;
    }
  }
  else
  {
    id v14 = 0;
  }
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setUpdateListeningHistory:self->_updateListeningHistory];
  [v4 setAllowExplicitContent:self->_allowExplicitContent];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSServiceSetting)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CMSServiceSetting;
  id v5 = [(CMSServiceSetting *)&v7 init];
  if (v5)
  {
    v5->_updateListeningHistory = [v4 decodeBoolForKey:@"AGSettingUpdateListeningHistoryEnodedKey"];
    v5->_allowExplicitContent = [v4 decodeBoolForKey:@"CMSSettingExplicitContentSettingEncodedKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL updateListeningHistory = self->_updateListeningHistory;
  id v5 = a3;
  [v5 encodeBool:updateListeningHistory forKey:@"AGSettingUpdateListeningHistoryEnodedKey"];
  [v5 encodeBool:self->_allowExplicitContent forKey:@"CMSSettingExplicitContentSettingEncodedKey"];
}

- (BOOL)updateListeningHistory
{
  return self->_updateListeningHistory;
}

- (void)setUpdateListeningHistory:(BOOL)a3
{
  self->_BOOL updateListeningHistory = a3;
}

- (BOOL)allowExplicitContent
{
  return self->_allowExplicitContent;
}

- (void)setAllowExplicitContent:(BOOL)a3
{
  self->_allowExplicitContent = a3;
}

+ (void)settingDictionaryFromData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22B0FF000, a2, OS_LOG_TYPE_ERROR, "Error unarchiving service setting dictionary %@", (uint8_t *)&v2, 0xCu);
}

@end