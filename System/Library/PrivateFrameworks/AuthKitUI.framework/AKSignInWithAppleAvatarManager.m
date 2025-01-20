@interface AKSignInWithAppleAvatarManager
+ (id)avatarImageForPrimaryAccountOwnerWithDiameter:(double)a3;
+ (id)avatarImageForUserHandle:(id)a3 diameter:(double)a4;
@end

@implementation AKSignInWithAppleAvatarManager

+ (id)avatarImageForUserHandle:(id)a3 diameter:(double)a4
{
  id v5 = a3;
  ASAccountSharingGroupMemberDataManagerClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAccountSharingGroupMemberDataManagerClass) {
    ASAccountSharingGroupMemberDataManagerClass = (objc_class *)get_ASAccountSharingGroupMemberDataManagerClass();
  }
  id v7 = objc_alloc_init(ASAccountSharingGroupMemberDataManagerClass);
  v8 = [v7 avatarImageForUserHandle:v5 diameter:a4];

  return v8;
}

+ (id)avatarImageForPrimaryAccountOwnerWithDiameter:(double)a3
{
  ASAccountSharingGroupMemberDataManagerClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAccountSharingGroupMemberDataManagerClass) {
    ASAccountSharingGroupMemberDataManagerClass = (objc_class *)get_ASAccountSharingGroupMemberDataManagerClass();
  }
  id v5 = objc_alloc_init(ASAccountSharingGroupMemberDataManagerClass);
  v6 = [v5 avatarImageForPrimaryAccountOwnerWithDiameter:a3];

  return v6;
}

@end