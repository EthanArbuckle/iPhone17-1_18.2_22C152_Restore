@interface CADPropertyFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)applicableToEntityType:(int)a3;
- (BOOL)isDate;
- (BOOL)isInteger;
- (BOOL)isString;
- (BOOL)validate;
- (BOOL)validateWithRequiredPropertyType:(int)a3;
- (CADPropertyFilter)initWithCoder:(id)a3;
- (CADPropertyFilter)initWithProperty:(int64_t)a3 comparison:(int64_t)a4 dateValue:(id)a5;
- (CADPropertyFilter)initWithProperty:(int64_t)a3 comparison:(int64_t)a4 integerValue:(int64_t)a5;
- (CADPropertyFilter)initWithProperty:(int64_t)a3 comparison:(int64_t)a4 stringValue:(id)a5;
- (NSDate)dateValue;
- (NSString)stringValue;
- (id)extendWhereClause:(id)a3 usingOperation:(int64_t)a4 withValues:(id)a5 andTypes:(id)a6;
- (int64_t)comparison;
- (int64_t)integerValue;
- (int64_t)property;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CADPropertyFilter

- (CADPropertyFilter)initWithProperty:(int64_t)a3 comparison:(int64_t)a4 stringValue:(id)a5
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CADPropertyFilter;
  v10 = [(CADPropertyFilter *)&v14 init];
  v11 = v10;
  if (v10
    && (v10->_property = a3,
        v10->_comparison = a4,
        objc_storeStrong((id *)&v10->_stringValue, a5),
        ![(CADPropertyFilter *)v11 validateWithRequiredPropertyType:0]))
  {
    v12 = 0;
  }
  else
  {
    v12 = v11;
  }

  return v12;
}

- (CADPropertyFilter)initWithProperty:(int64_t)a3 comparison:(int64_t)a4 integerValue:(int64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CADPropertyFilter;
  v8 = [(CADPropertyFilter *)&v12 init];
  id v9 = v8;
  if (v8
    && (v8->_property = a3,
        v8->_comparison = a4,
        v8->_integerValue = a5,
        ![(CADPropertyFilter *)v8 validateWithRequiredPropertyType:1]))
  {
    v10 = 0;
  }
  else
  {
    v10 = v9;
  }

  return v10;
}

- (CADPropertyFilter)initWithProperty:(int64_t)a3 comparison:(int64_t)a4 dateValue:(id)a5
{
  id v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CADPropertyFilter;
  id v9 = [(CADPropertyFilter *)&v17 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_5;
  }
  v9->_property = a3;
  v9->_comparison = a4;
  if (v8)
  {
    v11 = (void *)MEMORY[0x1E4F1C9C8];
    [v8 timeIntervalSinceReferenceDate];
    uint64_t v13 = [v11 dateWithTimeIntervalSinceReferenceDate:floor(v12)];
    dateValue = v10->_dateValue;
    v10->_dateValue = (NSDate *)v13;
  }
  if (![(CADPropertyFilter *)v10 validateWithRequiredPropertyType:2]) {
    v15 = 0;
  }
  else {
LABEL_5:
  }
    v15 = v10;

  return v15;
}

- (BOOL)validateWithRequiredPropertyType:(int)a3
{
  BOOL v5 = [(CADPropertyFilter *)self validate];
  if (v5)
  {
    if (*((_DWORD *)getSearchPropertyInfo(self->_property) + 2) == a3)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v6 = CADLogHandle;
      BOOL v5 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1BBC88000, v6, OS_LOG_TYPE_ERROR, "Property is of the wrong type; you must use the initializer that matches the property type.",
          v8,
          2u);
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (BOOL)validate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!getSearchPropertyInfo(self->_property))
  {
    v4 = CADLogHandle;
    LODWORD(v5) = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR);
    if (!v5) {
      return v5;
    }
    int64_t property = self->_property;
    int v11 = 134217984;
    int64_t v12 = property;
    v7 = "property %li is invalid.";
    goto LABEL_6;
  }
  if ([(CADPropertyFilter *)self isDate])
  {
    v3 = [(CADPropertyFilter *)self dateValue];
  }
  else
  {
    if (![(CADPropertyFilter *)self isString])
    {
LABEL_10:
      LOBYTE(v5) = 1;
      return v5;
    }
    v3 = [(CADPropertyFilter *)self stringValue];
  }
  id v8 = v3;

  if (v8 || ![(CADPropertyFilter *)self comparison]) {
    goto LABEL_10;
  }
  int64_t v5 = [(CADPropertyFilter *)self comparison];
  if (v5 != 1)
  {
    v4 = CADLogHandle;
    LODWORD(v5) = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      int64_t comparison = self->_comparison;
      int v11 = 134217984;
      int64_t v12 = comparison;
      v7 = "comparison %li is invalid for null values.";
LABEL_6:
      _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v11, 0xCu);
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)applicableToEntityType:(int)a3
{
  if (a3 == -1) {
    return 0;
  }
  v4 = getSearchPropertyInfo(self->_property)[2];
  do
  {
    int isa = (int)v4->isa;
    v4 = (__CFString *)((char *)v4 + 4);
    int v5 = isa;
    BOOL result = isa != -1;
  }
  while (isa != a3 && v5 != -1);
  return result;
}

- (BOOL)isString
{
  return *((_DWORD *)getSearchPropertyInfo(self->_property) + 2) == 0;
}

- (BOOL)isInteger
{
  return *((_DWORD *)getSearchPropertyInfo(self->_property) + 2) == 1;
}

- (BOOL)isDate
{
  return *((_DWORD *)getSearchPropertyInfo(self->_property) + 2) == 2;
}

- (id)extendWhereClause:(id)a3 usingOperation:(int64_t)a4 withValues:(id)a5 andTypes:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  SearchPropertyInfo = getSearchPropertyInfo([(CADPropertyFilter *)self property]);
  int v14 = *((_DWORD *)SearchPropertyInfo + 2);
  switch(v14)
  {
    case 0:
      objc_super v17 = [(CADPropertyFilter *)self stringValue];

      if (v17)
      {
        v15 = [(CADPropertyFilter *)self stringValue];
        v16 = &unk_1F151D9B0;
        goto LABEL_9;
      }
LABEL_17:
      unint64_t v24 = [(CADPropertyFilter *)self comparison];
      if (v24 > 5) {
        v25 = 0;
      }
      else {
        v25 = off_1E624EF68[v24];
      }
      [NSString stringWithFormat:@"%@ %@ NULL", *SearchPropertyInfo, v25];
      goto LABEL_14;
    case 2:
      v18 = [(CADPropertyFilter *)self dateValue];

      if (v18)
      {
        v15 = [(CADPropertyFilter *)self dateValue];
        v16 = &unk_1F151D998;
        goto LABEL_9;
      }
      goto LABEL_17;
    case 1:
      v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[CADPropertyFilter integerValue](self, "integerValue"));
      v16 = &unk_1F151D980;
LABEL_9:
      [v10 addObject:v15];

      [v11 addObject:v16];
      break;
  }
  unint64_t v19 = [(CADPropertyFilter *)self comparison];
  if (v19 > 5) {
    v20 = 0;
  }
  else {
    v20 = off_1E624EF98[v19];
  }
  [NSString stringWithFormat:@"%@ %@ ?", *SearchPropertyInfo, v20];
  v21 = LABEL_14:;
  v22 = _CADPropertySearchPredicateExtendWhereClause(v12, a4, v21);

  return v22;
}

- (CADPropertyFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CADPropertyFilter;
  int v5 = [(CADFilter *)&v12 initWithCoder:v4];
  if (!v5) {
    goto LABEL_3;
  }
  v5->_int64_t property = [v4 decodeIntegerForKey:@"property"];
  v5->_int64_t comparison = [v4 decodeIntegerForKey:@"comparison"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringValue"];
  stringValue = v5->_stringValue;
  v5->_stringValue = (NSString *)v6;

  v5->_integerValue = [v4 decodeIntegerForKey:@"integerValue"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateValue"];
  dateValue = v5->_dateValue;
  v5->_dateValue = (NSDate *)v8;

  if (![(CADPropertyFilter *)v5 validate]) {
    id v10 = 0;
  }
  else {
LABEL_3:
  }
    id v10 = v5;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CADPropertyFilter;
  id v4 = a3;
  [(CADFilter *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_property, @"property", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_comparison forKey:@"comparison"];
  [v4 encodeObject:self->_stringValue forKey:@"stringValue"];
  [v4 encodeInteger:self->_integerValue forKey:@"integerValue"];
  [v4 encodeObject:self->_dateValue forKey:@"dateValue"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)property
{
  return self->_property;
}

- (int64_t)comparison
{
  return self->_comparison;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (NSDate)dateValue
{
  return self->_dateValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end