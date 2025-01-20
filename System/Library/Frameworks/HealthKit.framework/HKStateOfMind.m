@interface HKStateOfMind
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)stateOfMindWithDate:(id)a3 kind:(int64_t)a4 valence:(double)a5 labels:(id)a6 associations:(id)a7;
+ (id)stateOfMindWithDate:(id)a3 kind:(int64_t)a4 valence:(double)a5 labels:(id)a6 associations:(id)a7 context:(id)a8 metadata:(id)a9;
+ (id)stateOfMindWithDate:(id)a3 kind:(int64_t)a4 valence:(double)a5 labels:(id)a6 associations:(id)a7 metadata:(id)a8;
+ (id)stateOfMindWithDate:(id)a3 reflectiveInterval:(int64_t)a4 valence:(double)a5 labels:(id)a6 domains:(id)a7 context:(id)a8 metadata:(id)a9;
+ (id)stateOfMindWithDate:(id)a3 reflectiveInterval:(int64_t)a4 valence:(double)a5 labels:(id)a6 domains:(id)a7 metadata:(id)a8;
+ (id)validateArgumentsWithKind:(int64_t)a3 valence:(double)a4;
+ (id)validateArgumentsWithKind:(int64_t)a3 valence:(double)a4 labels:(id)a5 associations:(id)a6;
+ (id)validateAssociations:(id)a3;
+ (id)validateKind:(int64_t)a3;
+ (id)validateLabels:(id)a3;
+ (id)validateValence:(double)a3;
- (BOOL)_validateForSavingWithClientEntitlements:(id)a3 applicationSDKVersionToken:(unint64_t)a4 isAppleWatch:(BOOL)a5 error:(id *)a6;
- (BOOL)hasAnyUnknownDomain;
- (BOOL)hasAnyUnknownLabel;
- (BOOL)isEquivalent:(id)a3;
- (HKStateOfMind)initWithCoder:(id)a3;
- (NSArray)associations;
- (NSArray)domains;
- (NSArray)labels;
- (NSString)context;
- (double)valence;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)description;
- (id)sanitizedSample:(id)a3 forEntitlements:(id)a4;
- (int64_t)kind;
- (int64_t)reflectiveInterval;
- (int64_t)valenceClassification;
- (void)_setAssociations:(id)a3;
- (void)_setContext:(id)a3;
- (void)_setKind:(int64_t)a3;
- (void)_setLabels:(id)a3;
- (void)_setValence:(double)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKStateOfMind

- (id)sanitizedSample:(id)a3 forEntitlements:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v8 = v5;
  v9 = v8;
  if (isKindOfClass)
  {
    v9 = v8;
    if (([v6 hasEntitlement:@"com.apple.private.healthkit"] & 1) == 0)
    {
      v9 = v8;
      if (([v6 hasPrivateAccessEntitlementWithIdentifier:@"mental-health"] & 1) == 0)
      {
        v10 = [v8 context];

        v9 = v8;
        if (v10)
        {
          v9 = (void *)[v8 _copyByArchiving];

          [v9 _setContext:0];
        }
      }
    }
  }

  return v9;
}

+ (id)stateOfMindWithDate:(id)a3 kind:(int64_t)a4 valence:(double)a5 labels:(id)a6 associations:(id)a7
{
  return (id)[a1 stateOfMindWithDate:a3 kind:a4 valence:a6 labels:a7 associations:0 metadata:a5];
}

+ (id)stateOfMindWithDate:(id)a3 kind:(int64_t)a4 valence:(double)a5 labels:(id)a6 associations:(id)a7 metadata:(id)a8
{
  return (id)[a1 stateOfMindWithDate:a3 kind:a4 valence:a6 labels:a7 associations:0 context:a8 metadata:a5];
}

+ (id)stateOfMindWithDate:(id)a3 kind:(int64_t)a4 valence:(double)a5 labels:(id)a6 associations:(id)a7 context:(id)a8 metadata:(id)a9
{
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a3;
  v21 = +[HKObjectType stateOfMindType];
  uint64_t v22 = [v19 count];
  v30[0] = MEMORY[0x1E4F143A8];
  if (v22) {
    id v23 = v19;
  }
  else {
    id v23 = 0;
  }
  v30[1] = 3221225472;
  v30[2] = __87__HKStateOfMind_stateOfMindWithDate_kind_valence_labels_associations_context_metadata___block_invoke;
  v30[3] = &unk_1E58C32A8;
  double v35 = a5;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  int64_t v34 = a4;
  v29.receiver = a1;
  v29.super_class = (Class)&OBJC_METACLASS___HKStateOfMind;
  id v24 = v18;
  id v25 = v17;
  id v26 = v16;
  id v27 = objc_msgSendSuper2(&v29, sel__newSampleFromDatesWithType_startDate_endDate_device_metadata_config_, v21, v20, v20, 0, v23, v30);

  return v27;
}

void __87__HKStateOfMind_stateOfMindWithDate_kind_valence_labels_associations_context_metadata___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 96) = *(void *)(a1 + 56);
  *(void *)(a2 + 104) = *(void *)(a1 + 64);
  objc_storeStrong((id *)(a2 + 112), *(id *)(a1 + 32));
  id v5 = (id *)(id)a2;
  objc_storeStrong(v5 + 15, *(id *)(a1 + 40));
  if ([*(id *)(a1 + 48) length]) {
    v4 = *(void **)(a1 + 48);
  }
  else {
    v4 = 0;
  }
  objc_storeStrong(v5 + 16, v4);
}

+ (id)stateOfMindWithDate:(id)a3 reflectiveInterval:(int64_t)a4 valence:(double)a5 labels:(id)a6 domains:(id)a7 metadata:(id)a8
{
  return (id)[a1 stateOfMindWithDate:a3 reflectiveInterval:a4 valence:a6 labels:a7 domains:0 context:a8 metadata:a5];
}

+ (id)stateOfMindWithDate:(id)a3 reflectiveInterval:(int64_t)a4 valence:(double)a5 labels:(id)a6 domains:(id)a7 context:(id)a8 metadata:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a6;
  id v19 = a3;
  id v20 = objc_msgSend(a7, "hk_map:", &__block_literal_global_58);
  v21 = [a1 stateOfMindWithDate:v19 kind:a4 valence:v18 labels:v20 associations:v17 context:v16 metadata:a5];

  return v21;
}

uint64_t __96__HKStateOfMind_stateOfMindWithDate_reflectiveInterval_valence_labels_domains_context_metadata___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 integerValue];

  return [v2 numberWithInteger:v3];
}

- (int64_t)valenceClassification
{
  [(HKStateOfMind *)self valence];
  id v5 = HKStateOfMindValenceClassificationForValence(v4);
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"HKStateOfMind.m" lineNumber:722 description:@"Initialized state of mind objects should always hold validated valence values"];
  }
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (int64_t)reflectiveInterval
{
  return self->_kind;
}

- (NSArray)domains
{
  return (NSArray *)[(NSArray *)self->_associations hk_map:&__block_literal_global_310];
}

uint64_t __24__HKStateOfMind_domains__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 integerValue];

  return [v2 numberWithInteger:v3];
}

- (BOOL)hasAnyUnknownLabel
{
  return [(NSArray *)self->_labels hk_containsObjectPassingTest:&__block_literal_global_313];
}

BOOL __35__HKStateOfMind_hasAnyUnknownLabel__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)([a2 integerValue] - 39) < 0xFFFFFFFFFFFFFFDALL;
}

- (BOOL)hasAnyUnknownDomain
{
  v2 = [(HKStateOfMind *)self domains];
  char v3 = objc_msgSend(v2, "hk_containsObjectPassingTest:", &__block_literal_global_315_0);

  return v3;
}

BOOL __36__HKStateOfMind_hasAnyUnknownDomain__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)([a2 integerValue] - 19) < 0xFFFFFFFFFFFFFFEELL;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  char var0 = a3.var0;
  v13.receiver = self;
  v13.super_class = (Class)HKStateOfMind;
  id v5 = -[HKSample _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  int64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = objc_opt_class();
    int64_t kind = self->_kind;
    double valence = self->_valence;
    if ((var0 & 0x10) != 0) {
      [v8 validateArgumentsWithKind:kind valence:valence];
    }
    else {
    id v7 = [v8 validateArgumentsWithKind:kind valence:self->_labels labels:self->_associations associations:valence];
    }
  }
  v11 = v7;

  return v11;
}

+ (id)validateArgumentsWithKind:(int64_t)a3 valence:(double)a4 labels:(id)a5 associations:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  v11 = [(id)objc_opt_class() validateArgumentsWithKind:a3 valence:a4];
  if (!v11)
  {
    v11 = [(id)objc_opt_class() validateLabels:v9];
    if (!v11)
    {
      v11 = [(id)objc_opt_class() validateAssociations:v10];
    }
  }

  return v11;
}

+ (id)validateArgumentsWithKind:(int64_t)a3 valence:(double)a4
{
  id v5 = [(id)objc_opt_class() validateKind:a3];
  if (!v5)
  {
    id v5 = [(id)objc_opt_class() validateValence:a4];
  }

  return v5;
}

+ (id)validateKind:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    double v4 = 0;
  }
  else
  {
    double v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Only momentary emotion and daily mood are supported."");
  }
  return v4;
}

+ (id)validateValence:(double)a3
{
  if (a3 >= -1.0 && a3 <= 1.0)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Only valence values in the range [-1, +1] are supported."");
  }
  return v5;
}

+ (id)validateLabels:(id)a3
{
  if (objc_msgSend(a3, "hk_containsObjectPassingTest:", &__block_literal_global_330_0))
  {
    double v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"One or more HKStateOfMind labels are not supported"");
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

BOOL __32__HKStateOfMind_validateLabels___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)([a2 integerValue] - 39) < 0xFFFFFFFFFFFFFFDALL;
}

+ (id)validateAssociations:(id)a3
{
  if (objc_msgSend(a3, "hk_containsObjectPassingTest:", &__block_literal_global_335))
  {
    double v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"One or more HKStateOfMind associations are not supported"");
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

BOOL __38__HKStateOfMind_validateAssociations___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)([a2 integerValue] - 19) < 0xFFFFFFFFFFFFFFEELL;
}

- (void)_setContext:(id)a3
{
}

- (BOOL)_validateForSavingWithClientEntitlements:(id)a3 applicationSDKVersionToken:(unint64_t)a4 isAppleWatch:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKStateOfMind;
  if ([(HKObject *)&v13 _validateForSavingWithClientEntitlements:v10 applicationSDKVersionToken:a4 isAppleWatch:v7 error:a6])
  {
    if (([v10 hasEntitlement:@"com.apple.private.healthkit"] & 1) != 0
      || ([v10 hasPrivateAccessEntitlementWithIdentifier:@"mental-health"] & 1) != 0
      || !self->_context)
    {
      BOOL v11 = 1;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a6, 2, @"Unable to save state of mind sample with this configuration");
  }
  BOOL v11 = 0;
LABEL_8:

  return v11;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11.receiver = self;
    v11.super_class = (Class)HKStateOfMind;
    if ([(HKSample *)&v11 isEquivalent:v4])
    {
      id v5 = v4;
      int64_t v6 = v5;
      if (self->_kind != v5[12]
        || self->_valence != *((double *)v5 + 13)
        || ![(NSArray *)self->_labels isEqual:v5[14]]
        || ![(NSArray *)self->_associations isEqual:v6[15]])
      {
        goto LABEL_11;
      }
      context = self->_context;
      id v8 = (NSString *)v6[16];
      if (context == v8)
      {
        char v9 = 1;
        goto LABEL_12;
      }
      if (v8) {
        char v9 = -[NSString isEqual:](context, "isEqual:");
      }
      else {
LABEL_11:
      }
        char v9 = 0;
LABEL_12:

      goto LABEL_13;
    }
  }
  char v9 = 0;
LABEL_13:

  return v9;
}

- (id)description
{
  uint64_t v3 = [(NSArray *)self->_labels hk_map:&__block_literal_global_348];
  id v4 = [(HKStateOfMind *)self domains];
  id v5 = objc_msgSend(v4, "hk_map:", &__block_literal_global_350);

  int64_t v6 = NSString;
  uint64_t v7 = objc_opt_class();
  id v8 = [(HKSample *)self startDate];
  int64_t v9 = [(HKStateOfMind *)self reflectiveInterval];
  id v10 = @"<unknown>";
  if (v9 == 2) {
    id v10 = @"daily";
  }
  if (v9 == 1) {
    id v10 = @"momentary";
  }
  objc_super v11 = NSNumber;
  double valence = self->_valence;
  objc_super v13 = v10;
  v14 = [v11 numberWithDouble:valence];
  v15 = [v6 stringWithFormat:@"<%@:%p date: %@, kind: %@, valence: %@, labels: %@, associations: %@>", v7, self, v8, v13, v14, v3, v5, 0];

  return v15;
}

__CFString *__28__HKStateOfMind_description__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];

  return NSStringFromHKStateOfMindLabel(v2);
}

__CFString *__28__HKStateOfMind_description__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];

  return NSStringFromHKStateOfMindDomain(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HKStateOfMind;
  [(HKSample *)&v6 encodeWithCoder:v4];
  [v4 encodeInteger:self->_kind forKey:@"ReflectiveInterval"];
  [v4 encodeDouble:@"Valence" forKey:self->_valence];
  [v4 encodeObject:self->_labels forKey:@"Labels"];
  [v4 encodeObject:self->_associations forKey:@"Domains"];
  context = self->_context;
  if (context) {
    [v4 encodeObject:context forKey:@"Context"];
  }
}

- (HKStateOfMind)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKStateOfMind;
  id v5 = [(HKSample *)&v16 initWithCoder:v4];
  if (v5)
  {
    v5->_int64_t kind = [v4 decodeIntegerForKey:@"ReflectiveInterval"];
    [v4 decodeDoubleForKey:@"Valence"];
    v5->_double valence = v6;
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"Labels"];
    labels = v5->_labels;
    v5->_labels = (NSArray *)v8;

    id v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"Domains"];
    associations = v5->_associations;
    v5->_associations = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Context"];
    context = v5->_context;
    v5->_context = (NSString *)v13;
  }
  return v5;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)_setKind:(int64_t)a3
{
  self->_int64_t kind = a3;
}

- (double)valence
{
  return self->_valence;
}

- (void)_setValence:(double)a3
{
  self->_double valence = a3;
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)_setLabels:(id)a3
{
}

- (NSArray)associations
{
  return self->_associations;
}

- (void)_setAssociations:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_associations, 0);

  objc_storeStrong((id *)&self->_labels, 0);
}

@end