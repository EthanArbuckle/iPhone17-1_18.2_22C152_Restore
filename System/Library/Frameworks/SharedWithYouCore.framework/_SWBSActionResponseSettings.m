@interface _SWBSActionResponseSettings
- (BSMutableSettings)mutableSettings;
- (_SWBSActionResponseSettings)init;
- (id)bsSettings;
- (void)setFlag:(BOOL)a3 forSetting:(unint64_t)a4;
- (void)setMutableSettings:(id)a3;
- (void)setObject:(id)a3 forSetting:(unint64_t)a4;
@end

@implementation _SWBSActionResponseSettings

- (_SWBSActionResponseSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)_SWBSActionResponseSettings;
  v2 = [(_SWBSActionResponseSettings *)&v6 init];
  if (v2)
  {
    v3 = (BSMutableSettings *)objc_alloc_init(MEMORY[0x1E4F4F7A0]);
    mutableSettings = v2->_mutableSettings;
    v2->_mutableSettings = v3;
  }
  return v2;
}

- (id)bsSettings
{
  v2 = [(_SWBSActionResponseSettings *)self mutableSettings];
  v3 = (void *)[v2 copy];

  return v3;
}

- (void)setObject:(id)a3 forSetting:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(_SWBSActionResponseSettings *)self mutableSettings];
  [v7 setObject:v6 forSetting:a4];
}

- (void)setFlag:(BOOL)a3 forSetting:(unint64_t)a4
{
  id v5 = [(_SWBSActionResponseSettings *)self mutableSettings];
  [v5 setFlag:BSSettingFlagForBool() forSetting:a4];
}

- (BSMutableSettings)mutableSettings
{
  return self->_mutableSettings;
}

- (void)setMutableSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end