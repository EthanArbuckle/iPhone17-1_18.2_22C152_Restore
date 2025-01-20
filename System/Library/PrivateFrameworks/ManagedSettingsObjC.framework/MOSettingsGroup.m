@interface MOSettingsGroup
+ (NSString)groupName;
- (MOSettingsGroup)initWithReader:(id)a3 writer:(id)a4;
- (MOSettingsReader)settingsReader;
- (MOSettingsWriter)settingsWriter;
- (id)metadataForSetting:(id)a3;
- (id)valueForSetting:(id)a3;
- (void)setSettingsReader:(id)a3;
- (void)setSettingsWriter:(id)a3;
- (void)setValue:(id)a3 forSetting:(id)a4;
@end

@implementation MOSettingsGroup

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settingsWriter);
  objc_destroyWeak((id *)&self->_settingsReader);
}

- (id)valueForSetting:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() groupName];
  p_settingsReader = &self->_settingsReader;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsReader);

  if (WeakRetained
    && ([(MOSettingsGroup *)self metadataForSetting:v4],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    id v10 = objc_loadWeakRetained((id *)p_settingsReader);
    v11 = [v10 valueForSetting:v4 inGroup:v5];

    v12 = [v9 valueFromPersistableValue:v11];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)metadataForSetting:(id)a3
{
  v3 = [NSString stringWithFormat:@"%@%@", a3, @"Metadata"];
  objc_opt_class();
  NSSelectorFromString(v3);
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(id)objc_opt_class() valueForKey:v3];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  id v4 = 0;
LABEL_5:

  return v4;
}

- (MOSettingsGroup)initWithReader:(id)a3 writer:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MOSettingsGroup;
  id v5 = a4;
  id v6 = a3;
  v7 = [(MOSettingsGroup *)&v9 init];
  objc_storeWeak((id *)&v7->_settingsReader, v6);

  objc_storeWeak((id *)&v7->_settingsWriter, v5);
  return v7;
}

- (void)setValue:(id)a3 forSetting:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = [(id)objc_opt_class() groupName];
  p_settingsWriter = &self->_settingsWriter;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsWriter);

  if (WeakRetained)
  {
    id v10 = [(MOSettingsGroup *)self metadataForSetting:v6];
    v11 = v10;
    if (v10)
    {
      if (v14)
      {
        v12 = objc_msgSend(v10, "persistableValueFromValue:");
        id v13 = objc_loadWeakRetained((id *)p_settingsWriter);
        [v13 setValue:v12 forSetting:v6 inGroup:v7];
      }
      else
      {
        v12 = objc_loadWeakRetained((id *)p_settingsWriter);
        [v12 removeValueForSetting:v6 inGroup:v7];
      }
    }
  }
}

- (MOSettingsReader)settingsReader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsReader);
  return (MOSettingsReader *)WeakRetained;
}

- (void)setSettingsReader:(id)a3
{
}

- (MOSettingsWriter)settingsWriter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsWriter);
  return (MOSettingsWriter *)WeakRetained;
}

- (void)setSettingsWriter:(id)a3
{
}

+ (NSString)groupName
{
  return (NSString *)&stru_1F12B3AD0;
}

@end