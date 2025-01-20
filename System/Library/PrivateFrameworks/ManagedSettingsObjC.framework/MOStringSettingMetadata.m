@interface MOStringSettingMetadata
- (MOStringSettingMetadata)initWithSettingName:(id)a3 defaultString:(id)a4 combineOperator:(int64_t)a5 rankedAllowedValues:(id)a6 isPublic:(BOOL)a7 scope:(id)a8 isPrivacySensitive:(BOOL)a9;
- (NSDictionary)rankedAllowedValues;
- (NSString)defaultValue;
- (id)_combine:(id)a3 with:(id)a4;
- (id)combinePersistableValue:(id)a3 with:(id)a4;
- (id)sanitizePersistableValue:(id)a3;
- (int64_t)combineOperator;
@end

@implementation MOStringSettingMetadata

- (MOStringSettingMetadata)initWithSettingName:(id)a3 defaultString:(id)a4 combineOperator:(int64_t)a5 rankedAllowedValues:(id)a6 isPublic:(BOOL)a7 scope:(id)a8 isPrivacySensitive:(BOOL)a9
{
  BOOL v10 = a7;
  v15 = (NSDictionary *)a6;
  v19.receiver = self;
  v19.super_class = (Class)MOStringSettingMetadata;
  v16 = [(MOSettingMetadata *)&v19 initWithSettingName:a3 defaultValue:a4 isPublic:v10 scope:a8 isPrivacySensitive:a9];
  v16->_combineOperator = a5;
  rankedAllowedValues = v16->_rankedAllowedValues;
  v16->_rankedAllowedValues = v15;

  return v16;
}

- (NSString)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)MOStringSettingMetadata;
  v2 = [(MOSettingMetadata *)&v4 defaultValue];
  return (NSString *)v2;
}

- (id)sanitizePersistableValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(NSDictionary *)self->_rankedAllowedValues objectForKeyedSubscript:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [NSString stringWithString:v4];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6 = a4;
  v7 = [(MOStringSettingMetadata *)self sanitizePersistableValue:a3];
  v8 = [(MOStringSettingMetadata *)self sanitizePersistableValue:v6];

  if (v7)
  {
    if (v8)
    {
      id v9 = [(MOStringSettingMetadata *)self _combine:v7 with:v8];
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
    BOOL v10 = v9;
    goto LABEL_8;
  }
  BOOL v10 = 0;
LABEL_8:

  return v10;
}

- (id)_combine:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSDictionary *)self->_rankedAllowedValues objectForKeyedSubscript:v6];
  id v9 = [(NSDictionary *)self->_rankedAllowedValues objectForKeyedSubscript:v7];
  int64_t combineOperator = self->_combineOperator;
  if (combineOperator == 1)
  {
    uint64_t v13 = [v8 integerValue];
    BOOL v12 = v13 > [v9 integerValue];
    goto LABEL_5;
  }
  if (!combineOperator)
  {
    uint64_t v11 = [v8 integerValue];
    BOOL v12 = v11 < [v9 integerValue];
LABEL_5:
    if (v12) {
      v14 = v6;
    }
    else {
      v14 = v7;
    }
    self = v14;
  }

  return self;
}

- (int64_t)combineOperator
{
  return self->_combineOperator;
}

- (NSDictionary)rankedAllowedValues
{
  return self->_rankedAllowedValues;
}

- (void).cxx_destruct
{
}

@end