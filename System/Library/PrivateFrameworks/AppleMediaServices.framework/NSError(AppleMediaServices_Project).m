@interface NSError(AppleMediaServices_Project)
- (id)ams_errorByCombiningWithUnderlyingError:()AppleMediaServices_Project;
- (id)ams_multipleUnderlyingErrors;
- (uint64_t)ams_isBagValueMissingError;
@end

@implementation NSError(AppleMediaServices_Project)

- (uint64_t)ams_isBagValueMissingError
{
  return objc_msgSend(a1, "ams_hasDomain:code:", @"AMSErrorDomain", 204);
}

- (id)ams_errorByCombiningWithUnderlyingError:()AppleMediaServices_Project
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend(a1, "ams_hasDomain:code:", @"AMSErrorDomain", 15))
  {
    v10[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

    uint64_t v6 = objc_msgSend(a1, "ams_errorByAddingToMultipleUnderlyingErrors:", v5);
  }
  else
  {
    v9[0] = a1;
    v9[1] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];

    uint64_t v6 = AMSErrorWithMultipleUnderlyingErrors(15, 0, 0, v5);
  }
  v7 = (void *)v6;

  return v7;
}

- (id)ams_multipleUnderlyingErrors
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F28750]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

@end