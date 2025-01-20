@interface AEPreference
- (AEPreference)initWithKey:(id)a3 preferencesPrimitives:(id)a4 systemNotificationPrimitives:(id)a5 defaultValue:(id)a6;
- (AEPreferencePrimitives)preferencePrimitives;
- (AESystemNotificationPrimitives)systemNotificationPrimitives;
- (BOOL)isOverridden;
- (NSString)key;
- (id)defaultValue;
- (id)preferenceValue;
- (id)value;
- (void)preferenceDidUpdate;
- (void)setPreferenceValue:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation AEPreference

- (AEPreference)initWithKey:(id)a3 preferencesPrimitives:(id)a4 systemNotificationPrimitives:(id)a5 defaultValue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)AEPreference;
  v14 = [(AEPreference *)&v21 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    key = v14->_key;
    v14->_key = (NSString *)v15;

    objc_storeStrong((id *)&v14->_preferencePrimitives, a4);
    objc_storeStrong((id *)&v14->_systemNotificationPrimitives, a5);
    objc_storeStrong(&v14->_defaultValue, a6);
    v17 = [(AEPreference *)v14 preferenceValue];
    v14->_overridden = v17 != 0;
    if ([(AEPreference *)v14 isOverridden])
    {
      id v18 = v17;
    }
    else
    {
      id v18 = [(AEPreference *)v14 defaultValue];
    }
    id value = v14->_value;
    v14->_id value = v18;
  }
  return v14;
}

- (void)setValue:(id)a3
{
  id v12 = a3;
  v5 = [(AEPreference *)self preferenceValue];
  if (v12
    && ([(AEPreference *)self defaultValue],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqual:v12],
        v6,
        !v7))
  {
    self->_overridden = 1;
    objc_storeStrong(&self->_value, a3);
    if ([v5 isEqual:v12]) {
      goto LABEL_8;
    }
    id v10 = self;
    id v11 = v12;
  }
  else
  {
    self->_overridden = 0;
    v8 = [(AEPreference *)self defaultValue];
    id value = self->_value;
    self->_id value = v8;

    if (!v5) {
      goto LABEL_8;
    }
    id v10 = self;
    id v11 = 0;
  }
  [(AEPreference *)v10 setPreferenceValue:v11];
LABEL_8:
}

- (void)setPreferenceValue:(id)a3
{
  id v10 = a3;
  v5 = [(AEPreference *)self preferencePrimitives];

  if (v5)
  {
    if (v10 && ([MEMORY[0x263F08AC0] propertyList:v10 isValidForFormat:100] & 1) == 0)
    {
      v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"AEPreference.m" lineNumber:75 description:@"Value should be PropertyListType"];
    }
    v6 = [(AEPreference *)self preferencePrimitives];
    int v7 = [(AEPreference *)self key];
    [v6 setObject:v10 forKey:v7];

    v8 = [(AEPreference *)self systemNotificationPrimitives];
    [v8 postSystemNotificationWithName:@"com.apple.assessmentmode.preferencesDidChangeNotification"];
  }
}

- (id)preferenceValue
{
  v3 = [(AEPreference *)self preferencePrimitives];
  v4 = [(AEPreference *)self key];
  v5 = [v3 objectForKey:v4];

  return v5;
}

- (void)preferenceDidUpdate
{
  id v5 = [(AEPreference *)self preferenceValue];
  v3 = [(AEPreference *)self value];
  char v4 = [v3 isEqual:v5];

  if ((v4 & 1) == 0) {
    [(AEPreference *)self setValue:v5];
  }
}

- (id)value
{
  return self->_value;
}

- (BOOL)isOverridden
{
  return self->_overridden;
}

- (NSString)key
{
  return self->_key;
}

- (AEPreferencePrimitives)preferencePrimitives
{
  return self->_preferencePrimitives;
}

- (AESystemNotificationPrimitives)systemNotificationPrimitives
{
  return self->_systemNotificationPrimitives;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_systemNotificationPrimitives, 0);
  objc_storeStrong((id *)&self->_preferencePrimitives, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong(&self->_value, 0);
}

@end