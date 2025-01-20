@interface _ASAccountSharingGroupMemberData
- (BOOL)isEqual:(id)a3;
- (BOOL)isMeParticipant;
- (CNContact)contact;
- (NSString)contactDisplayName;
- (NSString)displayName;
- (NSString)handle;
- (NSString)handleForDisplay;
- (NSString)participantID;
- (NSString)shortContactDisplayName;
- (UIImage)avatarImageForGroupMemberCell;
- (id)description;
- (int64_t)groupPermissionLevel;
- (int64_t)inviteStatus;
- (unint64_t)hash;
- (void)setAvatarImageForGroupMemberCell:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactDisplayName:(id)a3;
- (void)setGroupPermissionLevel:(int64_t)a3;
- (void)setHandle:(id)a3;
- (void)setHandleForDisplay:(id)a3;
- (void)setInviteStatus:(int64_t)a3;
- (void)setIsMeParticipant:(BOOL)a3;
- (void)setParticipantID:(id)a3;
- (void)setShortContactDisplayName:(id)a3;
@end

@implementation _ASAccountSharingGroupMemberData

- (NSString)displayName
{
  contactDisplayName = self->_contactDisplayName;
  if (contactDisplayName) {
    return contactDisplayName;
  }
  contactDisplayName = self->_shortContactDisplayName;
  if (contactDisplayName) {
    return contactDisplayName;
  }
  else {
    return self->_handleForDisplay;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_ASAccountSharingGroupMemberData *)a3;
  if (self == v4)
  {
    char v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(_ASAccountSharingGroupMemberData *)v5 contactDisplayName];
      if (WBSIsEqual())
      {
        v7 = [(_ASAccountSharingGroupMemberData *)v5 shortContactDisplayName];
        if (WBSIsEqual())
        {
          handle = self->_handle;
          v9 = [(_ASAccountSharingGroupMemberData *)v5 handle];
          if ([(NSString *)handle isEqualToString:v9])
          {
            handleForDisplay = self->_handleForDisplay;
            v11 = [(_ASAccountSharingGroupMemberData *)v5 handleForDisplay];
            if ([(NSString *)handleForDisplay isEqualToString:v11])
            {
              avatarImageForGroupMemberCell = self->_avatarImageForGroupMemberCell;
              v13 = [(_ASAccountSharingGroupMemberData *)v5 avatarImageForGroupMemberCell];
              if ([(UIImage *)avatarImageForGroupMemberCell isEqual:v13]
                && (int64_t groupPermissionLevel = self->_groupPermissionLevel,
                    groupPermissionLevel == [(_ASAccountSharingGroupMemberData *)v5 groupPermissionLevel])&& (BOOL isMeParticipant = self->_isMeParticipant, isMeParticipant == [(_ASAccountSharingGroupMemberData *)v5 isMeParticipant])&& (inviteStatus = self->_inviteStatus, inviteStatus == [(_ASAccountSharingGroupMemberData *)v5 inviteStatus]))
              {
                v17 = [(_ASAccountSharingGroupMemberData *)v5 contact];
                if (WBSIsEqual())
                {
                  v18 = [(_ASAccountSharingGroupMemberData *)v5 participantID];
                  char v19 = WBSIsEqual();
                }
                else
                {
                  char v19 = 0;
                }
              }
              else
              {
                char v19 = 0;
              }
            }
            else
            {
              char v19 = 0;
            }
          }
          else
          {
            char v19 = 0;
          }
        }
        else
        {
          char v19 = 0;
        }
      }
      else
      {
        char v19 = 0;
      }
    }
    else
    {
      char v19 = 0;
    }
  }

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_contactDisplayName hash];
  NSUInteger v4 = [(NSString *)self->_shortContactDisplayName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_handle hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_handleForDisplay hash];
  uint64_t v7 = [(UIImage *)self->_avatarImageForGroupMemberCell hash];
  int64_t inviteStatus = self->_inviteStatus;
  int64_t v9 = v6 ^ v7 ^ self->_groupPermissionLevel ^ self->_isMeParticipant;
  uint64_t v10 = inviteStatus ^ [(CNContact *)self->_contact hash];
  return v9 ^ v10 ^ [(NSString *)self->_participantID hash];
}

- (id)description
{
  NSUInteger v3 = NSString;
  uint64_t v4 = objc_opt_class();
  long long v14 = *(_OWORD *)&self->_contactDisplayName;
  long long v13 = *(_OWORD *)&self->_handle;
  if (self->_isMeParticipant) {
    NSUInteger v5 = @"YES";
  }
  else {
    NSUInteger v5 = @"NO";
  }
  int64_t groupPermissionLevel = self->_groupPermissionLevel;
  int64_t inviteStatus = self->_inviteStatus;
  participantID = self->_participantID;
  if (self->_contact) {
    int64_t v9 = @"YES";
  }
  else {
    int64_t v9 = @"NO";
  }
  uint64_t v10 = v5;
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; contactDisplayName = %@; shortContactDisplayName = %@; handle = %@; handleForDisplay = %@; permissionLevel = %lld; BOOL isMeParticipant = %@; inviteStatus = %lld>; hasContact = %@; participantID: %@;",
    v4,
    self,
    v14,
    v13,
    groupPermissionLevel,
    v10,
    inviteStatus,
    v9,
  v11 = participantID);

  return v11;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)handleForDisplay
{
  return self->_handleForDisplay;
}

- (void)setHandleForDisplay:(id)a3
{
}

- (NSString)contactDisplayName
{
  return self->_contactDisplayName;
}

- (void)setContactDisplayName:(id)a3
{
}

- (NSString)shortContactDisplayName
{
  return self->_shortContactDisplayName;
}

- (void)setShortContactDisplayName:(id)a3
{
}

- (UIImage)avatarImageForGroupMemberCell
{
  return self->_avatarImageForGroupMemberCell;
}

- (void)setAvatarImageForGroupMemberCell:(id)a3
{
}

- (int64_t)groupPermissionLevel
{
  return self->_groupPermissionLevel;
}

- (void)setGroupPermissionLevel:(int64_t)a3
{
  self->_int64_t groupPermissionLevel = a3;
}

- (BOOL)isMeParticipant
{
  return self->_isMeParticipant;
}

- (void)setIsMeParticipant:(BOOL)a3
{
  self->_BOOL isMeParticipant = a3;
}

- (int64_t)inviteStatus
{
  return self->_inviteStatus;
}

- (void)setInviteStatus:(int64_t)a3
{
  self->_int64_t inviteStatus = a3;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_avatarImageForGroupMemberCell, 0);
  objc_storeStrong((id *)&self->_shortContactDisplayName, 0);
  objc_storeStrong((id *)&self->_contactDisplayName, 0);
  objc_storeStrong((id *)&self->_handleForDisplay, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end