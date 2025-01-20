@interface AAOBModelHelper
+ (id)contactInfoForHandle:(id)a3;
+ (id)firstNameForLocalContactInfo:(id)a3;
@end

@implementation AAOBModelHelper

+ (id)contactInfoForHandle:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(AAContactsManager);
  v5 = [(AAContactsManager *)v4 contactForHandle:v3];
  v6 = [[AALocalContactInfo alloc] initWithHandle:v3 contact:v5];

  return v6;
}

+ (id)firstNameForLocalContactInfo:(id)a3
{
  return (id)[a3 firstNameOrHandleForDisplay];
}

@end