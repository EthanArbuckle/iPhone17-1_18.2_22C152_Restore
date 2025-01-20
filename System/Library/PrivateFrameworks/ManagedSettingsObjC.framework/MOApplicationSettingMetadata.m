@interface MOApplicationSettingMetadata
- (MOApplication)defaultValue;
- (MOApplicationSettingMetadata)initWithSettingName:(id)a3 defaultApplication:(id)a4 combineOperator:(int64_t)a5 isPublic:(BOOL)a6 scope:(id)a7 isPrivacySensitive:(BOOL)a8;
- (id)_combine:(id)a3 with:(id)a4;
- (id)combinePersistableValue:(id)a3 with:(id)a4;
- (id)persistableValueFromValue:(id)a3;
- (id)sanitizePersistableValue:(id)a3;
- (id)valueFromPersistableValue:(id)a3;
- (int64_t)combineOperator;
@end

@implementation MOApplicationSettingMetadata

- (MOApplicationSettingMetadata)initWithSettingName:(id)a3 defaultApplication:(id)a4 combineOperator:(int64_t)a5 isPublic:(BOOL)a6 scope:(id)a7 isPrivacySensitive:(BOOL)a8
{
  v10.receiver = self;
  v10.super_class = (Class)MOApplicationSettingMetadata;
  result = [(MOSettingMetadata *)&v10 initWithSettingName:a3 defaultValue:a4 isPublic:a6 scope:a7 isPrivacySensitive:a8];
  result->_combineOperator = a5;
  return result;
}

- (MOApplication)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)MOApplicationSettingMetadata;
  v2 = [(MOSettingMetadata *)&v4 defaultValue];
  return (MOApplication *)v2;
}

- (id)persistableValueFromValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v4 = [v3 persistableValue];
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (id)valueFromPersistableValue:(id)a3
{
  return +[MOApplication initializeWithPersistableValue:a3];
}

- (id)sanitizePersistableValue:(id)a3
{
  id v3 = a3;
  if (+[MOApplication isValidPersistableRepresentation:v3])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6 = a4;
  v7 = [(MOApplicationSettingMetadata *)self sanitizePersistableValue:a3];
  v8 = [(MOApplicationSettingMetadata *)self sanitizePersistableValue:v6];

  if (v7)
  {
    if (v8)
    {
      id v9 = [(MOApplicationSettingMetadata *)self _combine:v7 with:v8];
    }
    else
    {
      id v9 = v7;
    }
    goto LABEL_7;
  }
  if (v8)
  {
    id v9 = v8;
LABEL_7:
    objc_super v10 = v9;
    goto LABEL_8;
  }
  objc_super v10 = 0;
LABEL_8:

  return v10;
}

- (id)_combine:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  int64_t combineOperator = self->_combineOperator;
  objc_super v10 = v6;
  if (combineOperator)
  {
    if (combineOperator != 1) {
      goto LABEL_5;
    }
    objc_super v10 = v7;
  }
  self = v10;
LABEL_5:

  return self;
}

- (int64_t)combineOperator
{
  return self->_combineOperator;
}

@end