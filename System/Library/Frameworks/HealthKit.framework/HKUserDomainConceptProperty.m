@interface HKUserDomainConceptProperty
+ (BOOL)supportsSecureCoding;
+ (id)mergeListsOfPropertiesWithType:(int64_t)a3 intoListOfProperties:(id)a4 fromListOfProperties:(id)a5 options:(unint64_t)a6;
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (HKUserDomainConceptProperty)init;
- (HKUserDomainConceptProperty)initWithCoder:(id)a3;
- (HKUserDomainConceptProperty)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6;
- (double)timestamp;
- (id)description;
- (id)valueDescription;
- (int64_t)type;
- (int64_t)version;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)unitTesting_setTimestamp:(double)a3;
@end

@implementation HKUserDomainConceptProperty

- (HKUserDomainConceptProperty)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKUserDomainConceptProperty)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6
{
  v14.receiver = self;
  v14.super_class = (Class)HKUserDomainConceptProperty;
  v11 = [(HKUserDomainConceptProperty *)&v14 init];
  if (HKIsDeprecatedPropertyType(a3))
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, v11, @"HKUserDomainConceptProperty.m", 30, @"Invalid parameter not satisfying: %@", @"HKIsDeprecatedPropertyType(type) == NO" object file lineNumber description];

    if (!v11) {
      return v11;
    }
    goto LABEL_3;
  }
  if (v11)
  {
LABEL_3:
    v11->_type = a3;
    v11->_version = a4;
    v11->_timestamp = a5;
    v11->_deleted = a6;
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = HKStringFromUserDomainConceptPropertyType(self->_type);
  if (self->_deleted) {
    v5 = @" DELETED";
  }
  else {
    v5 = &stru_1EEC60288;
  }
  int64_t version = self->_version;
  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_timestamp];
  v8 = HKDiagnosticStringFromDate(v7);
  v9 = [(HKUserDomainConceptProperty *)self valueDescription];
  v10 = [v3 stringWithFormat:@"<%@%@ %ld, (%@), %@>", v4, v5, version, v8, v9];

  return v10;
}

+ (id)mergeListsOfPropertiesWithType:(int64_t)a3 intoListOfProperties:(id)a4 fromListOfProperties:(id)a5 options:(unint64_t)a6
{
  char v6 = a6;
  id v11 = a4;
  id v12 = a5;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __112__HKUserDomainConceptProperty_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options___block_invoke;
  v27[3] = &__block_descriptor_48_e37_B16__0__HKUserDomainConceptProperty_8l;
  v27[4] = a3;
  v27[5] = a1;
  if ((objc_msgSend(v11, "hk_allObjectsPassTest:", v27) & 1) == 0)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"HKUserDomainConceptProperty.m", 65, @"Invalid parameter not satisfying: %@", @"[intoListOfProperties hk_allObjectsPassTest:^BOOL(HKUserDomainConceptProperty *property) { return property.type == type && [property isKindOfClass:self]; }]" object file lineNumber description];
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __112__HKUserDomainConceptProperty_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options___block_invoke_2;
  v26[3] = &__block_descriptor_48_e37_B16__0__HKUserDomainConceptProperty_8l;
  v26[4] = a3;
  v26[5] = a1;
  if ((objc_msgSend(v12, "hk_allObjectsPassTest:", v26) & 1) == 0)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"HKUserDomainConceptProperty.m", 69, @"Invalid parameter not satisfying: %@", @"[fromListOfProperties hk_allObjectsPassTest:^BOOL(HKUserDomainConceptProperty *property) { return property.type == type && [property isKindOfClass:self]; }]" object file lineNumber description];
  }
  uint64_t v13 = [v12 count];
  objc_super v14 = v11;
  if (v13)
  {
    uint64_t v15 = [v11 count];
    objc_super v14 = v12;
    if (v15)
    {
      int64_t v16 = MaximumVersionForListOfProperties(v11);
      int64_t v17 = MaximumVersionForListOfProperties(v12);
      double v18 = MaximumTimestampForListOfProperties(v11);
      double v19 = MaximumTimestampForListOfProperties(v12);
      objc_super v14 = v12;
      if (v17 <= v16)
      {
        if (v19 > v18 && v17 == v16 && (v6 & 1) == 0) {
          objc_super v14 = v12;
        }
        else {
          objc_super v14 = v11;
        }
      }
    }
  }
  id v22 = v14;

  return v22;
}

uint64_t __112__HKUserDomainConceptProperty_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == *(void *)(a1 + 32)) {
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

uint64_t __112__HKUserDomainConceptProperty_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == *(void *)(a1 + 32)) {
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return self->_version ^ self->_type ^ self->_deleted ^ (unint64_t)self->_timestamp;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKUserDomainConceptProperty *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = self->_type == v5->_type
        && self->_version == v5->_version
        && self->_timestamp == v5->_timestamp
        && self->_deleted == v5->_deleted;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeInteger:self->_version forKey:@"version"];
  [v5 encodeDouble:@"timestamp" forKey:self->_timestamp];
  [v5 encodeBool:self->_deleted forKey:@"deleted"];
}

- (HKUserDomainConceptProperty)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKUserDomainConceptProperty;
  id v5 = [(HKUserDomainConceptProperty *)&v10 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeIntegerForKey:@"type"];
  if (!HKIsDeprecatedPropertyType(v6))
  {
    v5->_int64_t type = v6;
    v5->_int64_t version = [v4 decodeIntegerForKey:@"version"];
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timestamp = v8;
    v5->_deleted = [v4 decodeBoolForKey:@"deleted"];
LABEL_5:
    v7 = v5;
    goto LABEL_6;
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (void)unitTesting_setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)version
{
  return self->_version;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (id)valueDescription
{
  return 0;
}

@end