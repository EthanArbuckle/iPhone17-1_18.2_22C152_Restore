@interface HMDCoreDataTransformerCKDeviceToDeviceShareInvitationToken
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation HMDCoreDataTransformerCKDeviceToDeviceShareInvitationToken

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

- (id)reverseTransformedValue:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [(id)objc_opt_class() keyedArchiveToken:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)transformedValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    v6 = [(id)objc_opt_class() shareTokenFromKeyedArchiveData:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end