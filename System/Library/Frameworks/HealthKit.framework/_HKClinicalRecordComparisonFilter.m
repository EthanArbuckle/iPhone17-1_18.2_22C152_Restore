@interface _HKClinicalRecordComparisonFilter
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
+ (int64_t)enumRepresentationForKeyPath:(id)a3;
- (BOOL)acceptsDataObject:(id)a3;
@end

@implementation _HKClinicalRecordComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FHIRResource.identifier"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"FHIRResource.resourceType"];
  }

  return v4;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"FHIRResource.identifier"])
  {
    int64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"FHIRResource.resourceType"])
  {
    int64_t v6 = 1;
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"_HKClinicalRecordComparisonFilter.m" lineNumber:62 description:@"Unreachable code has been executed"];

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKClinicalRecordComparisonFilter;
    int64_t v6 = (int64_t)objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return v6;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    int64_t v7 = [(_HKComparisonFilter *)self keyPathIntegerValue];
    if (v7 == 1)
    {
      v8 = [v6 FHIRResource];
      uint64_t v9 = [v8 resourceType];
    }
    else
    {
      if (v7)
      {
        v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a2 object:self file:@"_HKClinicalRecordComparisonFilter.m" lineNumber:82 description:@"Unreachable code has been executed"];
        BOOL v10 = 0;
        goto LABEL_9;
      }
      v8 = [v6 FHIRResource];
      uint64_t v9 = [v8 identifier];
    }
    v11 = (void *)v9;
    v12 = [(_HKComparisonFilter *)self value];
    BOOL v10 = HKComparisonResultMatchesPredicateOperator([v11 compare:v12], -[_HKComparisonFilter operatorType](self, "operatorType"));

LABEL_9:
    goto LABEL_10;
  }
  BOOL v10 = 0;
LABEL_10:

  return v10;
}

@end