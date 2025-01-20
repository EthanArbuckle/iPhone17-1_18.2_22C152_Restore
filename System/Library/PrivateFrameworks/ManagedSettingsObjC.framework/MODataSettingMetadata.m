@interface MODataSettingMetadata
- (MODataSettingMetadata)initWithSettingName:(id)a3 defaultData:(id)a4 combineOperator:(int64_t)a5 isPublic:(BOOL)a6 scope:(id)a7 isPrivacySensitive:(BOOL)a8;
- (NSData)defaultValue;
- (id)_combine:(id)a3 with:(id)a4;
- (id)combinePersistableValue:(id)a3 with:(id)a4;
- (id)sanitizePersistableValue:(id)a3;
- (int64_t)combineOperator;
@end

@implementation MODataSettingMetadata

- (MODataSettingMetadata)initWithSettingName:(id)a3 defaultData:(id)a4 combineOperator:(int64_t)a5 isPublic:(BOOL)a6 scope:(id)a7 isPrivacySensitive:(BOOL)a8
{
  v10.receiver = self;
  v10.super_class = (Class)MODataSettingMetadata;
  result = [(MOSettingMetadata *)&v10 initWithSettingName:a3 defaultValue:a4 isPublic:a6 scope:a7 isPrivacySensitive:a8];
  result->_combineOperator = a5;
  return result;
}

- (NSData)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)MODataSettingMetadata;
  v2 = [(MOSettingMetadata *)&v4 defaultValue];
  return (NSData *)v2;
}

- (id)sanitizePersistableValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v4 = v3;
  }
  else {
    objc_super v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6 = a4;
  v7 = [(MODataSettingMetadata *)self sanitizePersistableValue:a3];
  v8 = [(MODataSettingMetadata *)self sanitizePersistableValue:v6];

  if (v7)
  {
    if (v8)
    {
      id v9 = [(MODataSettingMetadata *)self _combine:v7 with:v8];
    }
    else
    {
      id v9 = v7;
    }
  }
  else
  {
    id v9 = v8;
  }
  objc_super v10 = v9;

  return v10;
}

- (id)_combine:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  int64_t combineOperator = self->_combineOperator;
  if (combineOperator == 1)
  {
    if ([v7 length]) {
      objc_super v10 = v8;
    }
    else {
      objc_super v10 = v6;
    }
  }
  else
  {
    if (combineOperator) {
      goto LABEL_10;
    }
    if ([v6 length]) {
      objc_super v10 = v6;
    }
    else {
      objc_super v10 = v8;
    }
  }
  self = v10;
LABEL_10:

  return self;
}

- (int64_t)combineOperator
{
  return self->_combineOperator;
}

@end