@interface EncryptionTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation EncryptionTransformer

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

- (id)transformedValue:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [v3 dataUsingEncoding:4];
      goto LABEL_8;
    }
    v5 = +[CHLogServer sharedInstance];
    v6 = [v5 logHandleForDomain:"ch.encrypttransform"];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[EncryptionTransformer transformedValue:](v6);
    }
  }
  v4 = 0;
LABEL_8:

  return v4;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = (objc_class *)NSString;
      id v5 = v3;
      id v6 = [v4 alloc];
      id v7 = v5;
      uint64_t v8 = [v7 bytes];
      uint64_t v9 = [v7 length];

      v10 = (void *)[v6 initWithBytes:v8 length:v9 encoding:4];
      goto LABEL_8;
    }
    v11 = +[CHLogServer sharedInstance];
    v12 = [v11 logHandleForDomain:"ch.encrypttransform"];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[EncryptionTransformer reverseTransformedValue:](v12);
    }
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (void)transformedValue:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B8E4A000, log, OS_LOG_TYPE_ERROR, "Encryption transformation is only available for NSString", v1, 2u);
}

- (void)reverseTransformedValue:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B8E4A000, log, OS_LOG_TYPE_ERROR, "Encryption reverse transformation is only available for NSData", v1, 2u);
}

@end