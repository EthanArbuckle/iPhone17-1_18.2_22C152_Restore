@interface VSAppleSubscriptionValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation VSAppleSubscriptionValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  id v7 = 0;
  v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v7];
  id v4 = v7;
  if (v4)
  {
    v5 = VSErrorLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[VSAppleSubscriptionValueTransformer transformedValue:]((uint64_t)v4, v5);
    }
  }

  return v3;
}

- (id)reverseTransformedValue:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28DC0];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  id v7 = [v4 setWithArray:v6];
  id v12 = 0;
  v8 = [v3 unarchivedObjectOfClasses:v7 fromData:v5 error:&v12];

  id v9 = v12;
  if (v9)
  {
    v10 = VSErrorLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[VSAppleSubscriptionValueTransformer reverseTransformedValue:]((uint64_t)v9, v10);
    }
  }

  return v8;
}

- (void)transformedValue:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error archiving VSAppleSubscription value: %@", (uint8_t *)&v2, 0xCu);
}

- (void)reverseTransformedValue:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error unarchiving VSAppleSubscription value: %@", (uint8_t *)&v2, 0xCu);
}

@end