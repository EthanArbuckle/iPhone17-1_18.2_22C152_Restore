@interface NSMutableDictionary(DIExtension)
- (id)popObjectForKey:()DIExtension;
- (uint64_t)validateAndPopObjectForKey:()DIExtension className:isOptional:error:;
- (uint64_t)validateObjWithKey:()DIExtension className:isOptional:error:;
@end

@implementation NSMutableDictionary(DIExtension)

- (id)popObjectForKey:()DIExtension
{
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  [a1 removeObjectForKey:v4];

  return v5;
}

- (uint64_t)validateAndPopObjectForKey:()DIExtension className:isOptional:error:
{
  id v10 = a3;
  uint64_t v11 = [a1 validateObjWithKey:v10 className:a4 isOptional:a5 error:a6];
  id v12 = (id)[a1 popObjectForKey:v10];

  return v11;
}

- (uint64_t)validateObjWithKey:()DIExtension className:isOptional:error:
{
  id v9 = a3;
  id v10 = [a1 objectForKey:v9];
  if (v10) {
    isKindOfClass = objc_opt_isKindOfClass();
  }
  if (a6 && (isKindOfClass & 1) == 0)
  {
    uint64_t v11 = [NSString stringWithFormat:@"Validation failed for dictionary key %@.", v9];
    *a6 = +[DIError errorWithPOSIXCode:22 verboseInfo:v11];
  }
  return isKindOfClass & 1;
}

@end