@interface MOIntegerSettingMetadata
- (MOIntegerSettingMetadata)initWithSettingName:(id)a3 defaultInt:(int64_t)a4 combineOperator:(int64_t)a5 lowerBound:(int64_t)a6 upperBound:(int64_t)a7 isPublic:(BOOL)a8 scope:(id)a9 isPrivacySensitive:(BOOL)a10;
- (NSNumber)defaultValue;
- (id)combinePersistableValue:(id)a3 with:(id)a4;
- (id)sanitizePersistableValue:(id)a3;
- (int64_t)_combine:(int64_t)a3 with:(int64_t)a4;
- (int64_t)combineOperator;
- (int64_t)lowerBound;
- (int64_t)upperBound;
@end

@implementation MOIntegerSettingMetadata

- (MOIntegerSettingMetadata)initWithSettingName:(id)a3 defaultInt:(int64_t)a4 combineOperator:(int64_t)a5 lowerBound:(int64_t)a6 upperBound:(int64_t)a7 isPublic:(BOOL)a8 scope:(id)a9 isPrivacySensitive:(BOOL)a10
{
  BOOL v10 = a8;
  v17 = (void *)MEMORY[0x1E4F28ED0];
  id v18 = a9;
  id v19 = a3;
  v20 = [v17 numberWithInteger:a4];
  v23.receiver = self;
  v23.super_class = (Class)MOIntegerSettingMetadata;
  v21 = [(MOSettingMetadata *)&v23 initWithSettingName:v19 defaultValue:v20 isPublic:v10 scope:v18 isPrivacySensitive:a10];

  v21->_combineOperator = a5;
  v21->_lowerBound = a6;
  v21->_upperBound = a7;
  return v21;
}

- (NSNumber)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)MOIntegerSettingMetadata;
  v2 = [(MOSettingMetadata *)&v4 defaultValue];
  return (NSNumber *)v2;
}

- (id)sanitizePersistableValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v5 = [v4 integerValue];
    int64_t lowerBound = self->_lowerBound;
    if (v5 >= lowerBound)
    {
      if (v5 >= self->_upperBound) {
        int64_t lowerBound = self->_upperBound;
      }
      else {
        int64_t lowerBound = v5;
      }
    }
    v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:lowerBound];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6 = a4;
  v7 = [(MOIntegerSettingMetadata *)self sanitizePersistableValue:a3];
  v8 = [(MOIntegerSettingMetadata *)self sanitizePersistableValue:v6];

  if (v7)
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[MOIntegerSettingMetadata _combine:with:](self, "_combine:with:", objc_msgSend(v7, "integerValue"), objc_msgSend(v8, "integerValue")));
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
    BOOL v10 = v9;
    goto LABEL_8;
  }
  BOOL v10 = 0;
LABEL_8:

  return v10;
}

- (int64_t)_combine:(int64_t)a3 with:(int64_t)a4
{
  uint64_t v4 = *(void *)(self + 40);
  if (v4)
  {
    if (v4 == 1)
    {
      if (a3 <= a4) {
        return a4;
      }
      else {
        return a3;
      }
    }
  }
  else if (a3 >= a4)
  {
    return a4;
  }
  else
  {
    return a3;
  }
  return self;
}

- (int64_t)combineOperator
{
  return self->_combineOperator;
}

- (int64_t)lowerBound
{
  return self->_lowerBound;
}

- (int64_t)upperBound
{
  return self->_upperBound;
}

@end