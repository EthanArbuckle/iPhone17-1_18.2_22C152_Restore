@interface HKUserTrackedConcept
+ (BOOL)isConcreteUserTrackedConceptClass;
+ (BOOL)supportsSecureCoding;
+ (id)_newUserTrackedConceptWithType:(id)a3 config:(id)a4;
- (HKUserTrackedConcept)init;
- (HKUserTrackedConcept)initWithCoder:(id)a3;
- (HKUserTrackedConceptType)userTrackedConceptType;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKUserTrackedConcept

- (HKUserTrackedConcept)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (id)_newUserTrackedConceptWithType:(id)a3 config:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (([a1 isConcreteUserTrackedConceptClass] & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = NSStringFromSelector(a2);
    v16 = NSStringFromClass((Class)a1);
    [v14 handleFailureInMethod:a2, a1, @"HKUserTrackedConcept.m", 34, @"%@ should not be used for abstract class %@", v15, v16 object file lineNumber description];
  }
  id v9 = objc_alloc((Class)a1);
  if (v9)
  {
    v17.receiver = v9;
    v17.super_class = (Class)HKUserTrackedConcept;
    v10 = objc_msgSendSuper2(&v17, sel_init);
  }
  else
  {
    v10 = 0;
  }
  uint64_t v11 = [v7 copy];
  v12 = (void *)v10[1];
  v10[1] = v11;

  if (v8) {
    v8[2](v8, v10);
  }

  return v10;
}

+ (BOOL)isConcreteUserTrackedConceptClass
{
  return 0;
}

- (id)description
{
  v2 = NSString;
  v3 = [(HKObjectType *)self->_userTrackedConceptType identifier];
  uint64_t v4 = [v2 stringWithFormat:@"User Tracked Concept with data type identifier %@", v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKUserTrackedConcept)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKUserTrackedConcept;
  v5 = [(HKUserTrackedConcept *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserTrackedConceptType"];
    userTrackedConceptType = v5->_userTrackedConceptType;
    v5->_userTrackedConceptType = (HKUserTrackedConceptType *)v6;
  }
  return v5;
}

- (HKUserTrackedConceptType)userTrackedConceptType
{
  return self->_userTrackedConceptType;
}

- (void).cxx_destruct
{
}

@end