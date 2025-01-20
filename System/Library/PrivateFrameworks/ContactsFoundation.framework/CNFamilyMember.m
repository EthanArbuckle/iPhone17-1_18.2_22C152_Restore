@interface CNFamilyMember
+ (BOOL)isAdministrativeGuardianFamilyMember:(id)a3;
+ (BOOL)isDelegateChildFamilyMember:(id)a3;
@end

@implementation CNFamilyMember

+ (BOOL)isDelegateChildFamilyMember:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 isParent] & 1) == 0
    && ([v3 isOrganizer] & 1) == 0
    && (unint64_t)([v3 memberType] - 1) < 2;

  return v4;
}

+ (BOOL)isAdministrativeGuardianFamilyMember:(id)a3
{
  id v3 = a3;
  if ([v3 isParent]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isOrganizer];
  }

  return v4;
}

@end