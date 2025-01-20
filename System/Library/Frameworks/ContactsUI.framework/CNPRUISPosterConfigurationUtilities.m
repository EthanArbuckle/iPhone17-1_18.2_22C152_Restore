@interface CNPRUISPosterConfigurationUtilities
+ (id)titleStyleAttributesForCNConfiguration:(id)a3 error:(id *)a4;
@end

@implementation CNPRUISPosterConfigurationUtilities

+ (id)titleStyleAttributesForCNConfiguration:(id)a3 error:(id *)a4
{
  v5 = (Class (__cdecl *)())getPRUISPosterConfigurationUtilitiesClass[0];
  id v6 = a3;
  Class v7 = v5();
  v8 = [v6 wrappedPosterConfiguration];

  v9 = [(objc_class *)v7 titleStyleAttributesForConfiguration:v8 error:a4];

  if (v9) {
    v10 = [[CNPRUISPosterTitleStyleAttributes alloc] initWithPosterTitleStyleAttributes:v9];
  }
  else {
    v10 = 0;
  }

  return v10;
}

@end