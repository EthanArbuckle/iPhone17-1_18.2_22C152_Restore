@interface MOBoolSettingMetadata
- (BOOL)_combine:(BOOL)a3 with:(BOOL)a4;
- (MOBoolSettingMetadata)initWithSettingName:(id)a3 defaultBool:(BOOL)a4 combineOperator:(int64_t)a5 isPublic:(BOOL)a6 scope:(id)a7 isPrivacySensitive:(BOOL)a8;
- (NSNumber)defaultValue;
- (id)combinePersistableValue:(id)a3 with:(id)a4;
- (id)sanitizePersistableValue:(id)a3;
- (int64_t)combineOperator;
@end

@implementation MOBoolSettingMetadata

- (MOBoolSettingMetadata)initWithSettingName:(id)a3 defaultBool:(BOOL)a4 combineOperator:(int64_t)a5 isPublic:(BOOL)a6 scope:(id)a7 isPrivacySensitive:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a6;
  BOOL v11 = a4;
  v14 = (void *)MEMORY[0x1E4F28ED0];
  id v15 = a7;
  id v16 = a3;
  v17 = [v14 numberWithBool:v11];
  v20.receiver = self;
  v20.super_class = (Class)MOBoolSettingMetadata;
  v18 = [(MOSettingMetadata *)&v20 initWithSettingName:v16 defaultValue:v17 isPublic:v9 scope:v15 isPrivacySensitive:v8];

  v18->_combineOperator = a5;
  return v18;
}

- (NSNumber)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)MOBoolSettingMetadata;
  v2 = [(MOSettingMetadata *)&v4 defaultValue];
  return (NSNumber *)v2;
}

- (id)sanitizePersistableValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v3, "BOOLValue"));
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6 = a4;
  v7 = [(MOBoolSettingMetadata *)self sanitizePersistableValue:a3];
  BOOL v8 = [(MOBoolSettingMetadata *)self sanitizePersistableValue:v6];

  if (v7)
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MOBoolSettingMetadata _combine:with:](self, "_combine:with:", objc_msgSend(v7, "BOOLValue"), objc_msgSend(v8, "BOOLValue")));
      id v9 = (id)objc_claimAutoreleasedReturnValue();
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
    v10 = v9;
    goto LABEL_8;
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (BOOL)_combine:(BOOL)a3 with:(BOOL)a4
{
  char v4 = 40;
  int64_t combineOperator = self->_combineOperator;
  if (combineOperator)
  {
    if (combineOperator == 1) {
      char v4 = a3 && a4;
    }
  }
  else
  {
    char v4 = a3 || a4;
  }
  return v4 & 1;
}

- (int64_t)combineOperator
{
  return self->_combineOperator;
}

@end