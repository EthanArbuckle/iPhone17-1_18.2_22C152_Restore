@interface HKDrugInteractionSeverity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKDrugInteractionSeverity)init;
- (HKDrugInteractionSeverity)initWithCoder:(id)a3;
- (HKDrugInteractionSeverity)initWithSeverityLevel:(unint64_t)a3 validRegionCodes:(id)a4;
- (NSSet)validRegionCodes;
- (id)description;
- (unint64_t)hash;
- (unint64_t)severityLevel;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKDrugInteractionSeverity

- (HKDrugInteractionSeverity)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKDrugInteractionSeverity)initWithSeverityLevel:(unint64_t)a3 validRegionCodes:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKDrugInteractionSeverity;
  v7 = [(HKDrugInteractionSeverity *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_severityLevel = a3;
    uint64_t v9 = [v6 copy];
    validRegionCodes = v8->_validRegionCodes;
    v8->_validRegionCodes = (NSSet *)v9;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = HKStringFromDrugInteractionSeverityLevel(self->_severityLevel);
  id v6 = [(NSSet *)self->_validRegionCodes allObjects];
  v7 = [v6 componentsJoinedByString:@","];
  v8 = [v3 stringWithFormat:@"<%@:%p severity level:%@, valid region codes:[%@]", v4, self, v5, v7];

  return v8;
}

- (unint64_t)hash
{
  unint64_t severityLevel = self->_severityLevel;
  return [(NSSet *)self->_validRegionCodes hash] ^ severityLevel;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKDrugInteractionSeverity *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self->_severityLevel != v5->_severityLevel) {
        goto LABEL_9;
      }
      validRegionCodes = self->_validRegionCodes;
      v7 = v5->_validRegionCodes;
      if (validRegionCodes == v7)
      {
        char v8 = 1;
        goto LABEL_11;
      }
      if (v7) {
        char v8 = -[NSSet isEqualToSet:](validRegionCodes, "isEqualToSet:");
      }
      else {
LABEL_9:
      }
        char v8 = 0;
LABEL_11:

      goto LABEL_12;
    }
    char v8 = 0;
  }
LABEL_12:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t severityLevel = self->_severityLevel;
  id v5 = a3;
  [v5 encodeInteger:severityLevel forKey:@"SeverityLevel"];
  [v5 encodeObject:self->_validRegionCodes forKey:@"ValidRegionCodes"];
}

- (HKDrugInteractionSeverity)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKDrugInteractionSeverity;
  id v5 = [(HKDrugInteractionSeverity *)&v10 init];
  if (v5)
  {
    v5->_unint64_t severityLevel = [v4 decodeIntegerForKey:@"SeverityLevel"];
    id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForSetOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"ValidRegionCodes"];
    validRegionCodes = v5->_validRegionCodes;
    v5->_validRegionCodes = (NSSet *)v7;
  }
  return v5;
}

- (unint64_t)severityLevel
{
  return self->_severityLevel;
}

- (NSSet)validRegionCodes
{
  return self->_validRegionCodes;
}

- (void).cxx_destruct
{
}

@end