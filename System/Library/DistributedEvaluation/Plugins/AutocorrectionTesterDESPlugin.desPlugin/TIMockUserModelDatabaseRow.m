@interface TIMockUserModelDatabaseRow
- (BOOL)isMatchForKey:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5;
- (BOOL)isMatchForKeyPrefix:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5;
- (BOOL)isMatchForKeyPrefix:(id)a3 forInputMode:(id)a4 weeklyKeySuffixes:(id)a5 endDate:(id)a6;
- (BOOL)isMatchSinceDate:(id)a3;
- (NSData)properties;
- (NSDate)creationDate;
- (NSDate)lastUpdateDate;
- (NSNumber)realValue;
- (NSNumber)secondaryValue;
- (NSNumber)value;
- (NSString)inputMode;
- (NSString)key;
- (TIMockUserModelDatabaseRow)initWithKey:(id)a3 inputMode:(id)a4 value:(id)a5 secondaryValue:(id)a6 realValue:(id)a7 properties:(id)a8 creationDate:(id)a9 lastUpdateDate:(id)a10;
- (void)setCreationDate:(id)a3;
- (void)setInputMode:(id)a3;
- (void)setKey:(id)a3;
- (void)setLastUpdateDate:(id)a3;
- (void)setProperties:(id)a3;
- (void)setRealValue:(id)a3;
- (void)setSecondaryValue:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation TIMockUserModelDatabaseRow

- (TIMockUserModelDatabaseRow)initWithKey:(id)a3 inputMode:(id)a4 value:(id)a5 secondaryValue:(id)a6 realValue:(id)a7 properties:(id)a8 creationDate:(id)a9 lastUpdateDate:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)TIMockUserModelDatabaseRow;
  v18 = [(TIMockUserModelDatabaseRow *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_inputMode, a4);
    objc_storeStrong((id *)&v19->_key, a3);
    objc_storeStrong((id *)&v19->_value, a5);
    objc_storeStrong((id *)&v19->_secondaryValue, a6);
    objc_storeStrong((id *)&v19->_realValue, a7);
    objc_storeStrong((id *)&v19->_properties, a8);
    objc_storeStrong((id *)&v19->_creationDate, a9);
    objc_storeStrong((id *)&v19->_lastUpdateDate, a10);
  }

  return v19;
}

- (BOOL)isMatchSinceDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = !v4 || (char *)[(NSDate *)self->_lastUpdateDate compare:v4] == (char *)&def_3B118 + 1;

  return v5;
}

- (BOOL)isMatchForKey:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([a3 isEqualToString:self->_key]
    && (!v8 || [v8 isEqualToString:self->_inputMode]))
  {
    BOOL v10 = [(TIMockUserModelDatabaseRow *)self isMatchSinceDate:v9];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isMatchForKeyPrefix:(id)a3 forInputMode:(id)a4 weeklyKeySuffixes:(id)a5 endDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(NSString *)self->_key hasPrefix:v10]
    && (!v11 || [v11 isEqualToString:self->_inputMode]))
  {
    v14 = -[NSString substringFromIndex:](self->_key, "substringFromIndex:", [v10 length]);
    unsigned int v15 = [v12 containsObject:v14];
    v16 = (unint64_t *)&kFeatureUsageQueryTimeFrame;
    if (!v15) {
      v16 = (unint64_t *)&kCommonMetricQueryTimeFrame;
    }
    id v17 = +[NSDate dateWithTimeInterval:v13 sinceDate:-((double)kSecondsPerDay * (double)*v16)];
    if ([(TIMockUserModelDatabaseRow *)self isMatchSinceDate:v17]) {
      unsigned int v18 = ![(TIMockUserModelDatabaseRow *)self isMatchSinceDate:v13];
    }
    else {
      LOBYTE(v18) = 0;
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)isMatchForKeyPrefix:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(NSString *)self->_key hasPrefix:a3]
    && (!v8 || [v8 isEqualToString:self->_inputMode]))
  {
    BOOL v10 = [(TIMockUserModelDatabaseRow *)self isMatchSinceDate:v9];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (NSString)inputMode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInputMode:(id)a3
{
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKey:(id)a3
{
}

- (NSNumber)value
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setValue:(id)a3
{
}

- (NSNumber)secondaryValue
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSecondaryValue:(id)a3
{
}

- (NSNumber)realValue
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRealValue:(id)a3
{
}

- (NSData)properties
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProperties:(id)a3
{
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)lastUpdateDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastUpdateDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_realValue, 0);
  objc_storeStrong((id *)&self->_secondaryValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_inputMode, 0);
}

@end