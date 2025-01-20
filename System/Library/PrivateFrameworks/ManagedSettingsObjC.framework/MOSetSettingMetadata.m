@interface MOSetSettingMetadata
- (MOSetSettingMetadata)initWithSettingName:(id)a3 defaultSet:(id)a4 combineOperator:(int64_t)a5 maximumCount:(unint64_t)a6 isPublic:(BOOL)a7 scope:(id)a8 isPrivacySensitive:(BOOL)a9;
- (NSSet)defaultValue;
- (id)_combine:(id)a3 with:(id)a4;
- (id)combinePersistableValue:(id)a3 with:(id)a4;
- (id)persistableValueFromValue:(id)a3;
- (id)sanitizePersistableValue:(id)a3;
- (id)valueFromPersistableValue:(id)a3;
- (int64_t)combineOperator;
- (unint64_t)maximumCount;
@end

@implementation MOSetSettingMetadata

- (NSSet)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)MOSetSettingMetadata;
  v2 = [(MOSettingMetadata *)&v4 defaultValue];
  return (NSSet *)v2;
}

- (MOSetSettingMetadata)initWithSettingName:(id)a3 defaultSet:(id)a4 combineOperator:(int64_t)a5 maximumCount:(unint64_t)a6 isPublic:(BOOL)a7 scope:(id)a8 isPrivacySensitive:(BOOL)a9
{
  v12.receiver = self;
  v12.super_class = (Class)MOSetSettingMetadata;
  result = [(MOSettingMetadata *)&v12 initWithSettingName:a3 defaultValue:a4 isPublic:a7 scope:a8 isPrivacySensitive:a9];
  result->_combineOperator = a5;
  result->_maximumCount = a6;
  return result;
}

- (id)persistableValueFromValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v4 = [v3 allObjects];
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (id)valueFromPersistableValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v3];
  }
  else {
    objc_super v4 = 0;
  }

  return v4;
}

- (id)sanitizePersistableValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 count] <= self->_maximumCount) {
      goto LABEL_5;
    }
  }
  id v5 = 0;
LABEL_5:

  return v5;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6 = a4;
  v7 = [(MOSetSettingMetadata *)self sanitizePersistableValue:a3];
  v8 = [(MOSetSettingMetadata *)self sanitizePersistableValue:v6];

  if (v7)
  {
    if (v8)
    {
      v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
      v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
      v11 = [(MOSetSettingMetadata *)self _combine:v9 with:v10];
      objc_super v12 = [v11 allObjects];

      goto LABEL_9;
    }
    id v13 = v7;
    goto LABEL_7;
  }
  if (v8)
  {
    id v13 = v8;
LABEL_7:
    objc_super v12 = v13;
    goto LABEL_9;
  }
  objc_super v12 = 0;
LABEL_9:

  return v12;
}

- (id)_combine:(id)a3 with:(id)a4
{
  id v6 = a4;
  v7 = (void *)[a3 mutableCopy];
  v8 = v7;
  int64_t combineOperator = self->_combineOperator;
  if (combineOperator == 1)
  {
    [v7 unionSet:v6];
  }
  else if (!combineOperator)
  {
    [v7 intersectSet:v6];
  }
  v10 = (void *)[v8 copy];

  return v10;
}

- (int64_t)combineOperator
{
  return self->_combineOperator;
}

- (unint64_t)maximumCount
{
  return self->_maximumCount;
}

@end