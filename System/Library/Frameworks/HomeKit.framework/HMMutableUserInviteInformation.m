@interface HMMutableUserInviteInformation
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HMMutableUserInviteInformation

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [HMUserInviteInformation alloc];
  v5 = [(HMUserInviteInformation *)self userID];
  BOOL v6 = [(HMUserInviteInformation *)self isAdministrator];
  BOOL v7 = [(HMUserInviteInformation *)self isRemoteAccessAllowed];
  BOOL v8 = [(HMUserInviteInformation *)self isAnnounceAccessAllowed];
  unint64_t v9 = [(HMUserInviteInformation *)self camerasAccessLevel];
  BOOL v10 = [(HMUserInviteInformation *)self isRestrictedGuest];
  v11 = [(HMUserInviteInformation *)self restrictedGuestHomeAccessSettings];
  v12 = [(HMUserInviteInformation *)v4 initWithUser:v5 administrator:v6 remoteAccess:v7 announceAccess:v8 camerasAccessLevel:v9 restrictedGuest:v10 restrictedGuestHomeAccessSettings:v11];

  return v12;
}

@end