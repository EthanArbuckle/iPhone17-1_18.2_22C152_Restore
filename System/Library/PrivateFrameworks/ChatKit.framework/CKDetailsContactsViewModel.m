@interface CKDetailsContactsViewModel
+ (id)descriptorForContactRequiredKeys;
- (BOOL)isPendingRecipient;
- (BOOL)isSatellite;
- (BOOL)showsFaceTimeVideoButton;
- (BOOL)showsLocation;
- (BOOL)showsMessageButton;
- (BOOL)showsPhoneButton;
- (BOOL)showsScreenSharingButton;
- (BOOL)showsTUConversationStatus;
- (BOOL)tuConversationStatusIsActive;
- (BOOL)verified;
- (CKDetailsContactsViewModel)initWithEntity:(id)a3 locationString:(id)a4 tuConversationStatusIsActive:(BOOL)a5 callType:(int64_t)a6 showsLocation:(BOOL)a7 showsMessageButton:(BOOL)a8 showsFaceTimeVideoButton:(BOOL)a9 showsPhoneButton:(BOOL)a10 showsScreenSharingButton:(BOOL)a11 contact:(id)a12 isPendingRecipient:(BOOL)a13 verified:(BOOL)a14 isSatellite:(BOOL)a15 showsTUConversationStatus:(BOOL)a16;
- (CKEntity)entity;
- (CNContact)contact;
- (NSString)entityName;
- (NSString)locationString;
- (NSString)preferredHandle;
- (int64_t)callType;
- (void)setCallType:(int64_t)a3;
- (void)setContact:(id)a3;
- (void)setEntity:(id)a3;
- (void)setEntityName:(id)a3;
- (void)setIsPendingRecipient:(BOOL)a3;
- (void)setIsSatellite:(BOOL)a3;
- (void)setLocationString:(id)a3;
- (void)setPreferredHandle:(id)a3;
- (void)setShowsFaceTimeVideoButton:(BOOL)a3;
- (void)setShowsLocation:(BOOL)a3;
- (void)setShowsMessageButton:(BOOL)a3;
- (void)setShowsPhoneButton:(BOOL)a3;
- (void)setShowsScreenSharingButton:(BOOL)a3;
- (void)setShowsTUConversationStatus:(BOOL)a3;
- (void)setTuConversationStatusIsActive:(BOOL)a3;
- (void)setVerified:(BOOL)a3;
@end

@implementation CKDetailsContactsViewModel

+ (id)descriptorForContactRequiredKeys
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (CKDetailsContactsViewModel)initWithEntity:(id)a3 locationString:(id)a4 tuConversationStatusIsActive:(BOOL)a5 callType:(int64_t)a6 showsLocation:(BOOL)a7 showsMessageButton:(BOOL)a8 showsFaceTimeVideoButton:(BOOL)a9 showsPhoneButton:(BOOL)a10 showsScreenSharingButton:(BOOL)a11 contact:(id)a12 isPendingRecipient:(BOOL)a13 verified:(BOOL)a14 isSatellite:(BOOL)a15 showsTUConversationStatus:(BOOL)a16
{
  BOOL v16 = a8;
  BOOL v17 = a7;
  BOOL v19 = a5;
  id v22 = a3;
  id v23 = a4;
  id v24 = a12;
  v25 = [(CKDetailsContactsViewModel *)self init];
  v26 = v25;
  if (v25)
  {
    [(CKDetailsContactsViewModel *)v25 setEntity:v22];
    v27 = [v22 rawAddress];
    [(CKDetailsContactsViewModel *)v26 setPreferredHandle:v27];

    v28 = [v22 fullName];
    [(CKDetailsContactsViewModel *)v26 setEntityName:v28];

    [(CKDetailsContactsViewModel *)v26 setLocationString:v23];
    [(CKDetailsContactsViewModel *)v26 setTuConversationStatusIsActive:v19];
    [(CKDetailsContactsViewModel *)v26 setCallType:a6];
    [(CKDetailsContactsViewModel *)v26 setShowsLocation:v17];
    [(CKDetailsContactsViewModel *)v26 setShowsMessageButton:v16];
    [(CKDetailsContactsViewModel *)v26 setShowsFaceTimeVideoButton:a9];
    [(CKDetailsContactsViewModel *)v26 setShowsPhoneButton:a10];
    [(CKDetailsContactsViewModel *)v26 setShowsScreenSharingButton:a11];
    [(CKDetailsContactsViewModel *)v26 setContact:v24];
    [(CKDetailsContactsViewModel *)v26 setIsPendingRecipient:a13];
    [(CKDetailsContactsViewModel *)v26 setVerified:a14];
    [(CKDetailsContactsViewModel *)v26 setIsSatellite:a15];
    [(CKDetailsContactsViewModel *)v26 setShowsTUConversationStatus:a16];
  }

  return v26;
}

- (NSString)preferredHandle
{
  return self->_preferredHandle;
}

- (void)setPreferredHandle:(id)a3
{
}

- (NSString)entityName
{
  return self->_entityName;
}

- (void)setEntityName:(id)a3
{
}

- (CKEntity)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
}

- (NSString)locationString
{
  return self->_locationString;
}

- (void)setLocationString:(id)a3
{
}

- (BOOL)tuConversationStatusIsActive
{
  return self->_tuConversationStatusIsActive;
}

- (void)setTuConversationStatusIsActive:(BOOL)a3
{
  self->_tuConversationStatusIsActive = a3;
}

- (int64_t)callType
{
  return self->_callType;
}

- (void)setCallType:(int64_t)a3
{
  self->_callType = a3;
}

- (BOOL)showsLocation
{
  return self->_showsLocation;
}

- (void)setShowsLocation:(BOOL)a3
{
  self->_showsLocation = a3;
}

- (BOOL)showsMessageButton
{
  return self->_showsMessageButton;
}

- (void)setShowsMessageButton:(BOOL)a3
{
  self->_showsMessageButton = a3;
}

- (BOOL)showsFaceTimeVideoButton
{
  return self->_showsFaceTimeVideoButton;
}

- (void)setShowsFaceTimeVideoButton:(BOOL)a3
{
  self->_showsFaceTimeVideoButton = a3;
}

- (BOOL)showsPhoneButton
{
  return self->_showsPhoneButton;
}

- (void)setShowsPhoneButton:(BOOL)a3
{
  self->_showsPhoneButton = a3;
}

- (BOOL)showsScreenSharingButton
{
  return self->_showsScreenSharingButton;
}

- (void)setShowsScreenSharingButton:(BOOL)a3
{
  self->_showsScreenSharingButton = a3;
}

- (BOOL)showsTUConversationStatus
{
  return self->_showsTUConversationStatus;
}

- (void)setShowsTUConversationStatus:(BOOL)a3
{
  self->_showsTUConversationStatus = a3;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (BOOL)isPendingRecipient
{
  return self->_isPendingRecipient;
}

- (void)setIsPendingRecipient:(BOOL)a3
{
  self->_isPendingRecipient = a3;
}

- (BOOL)isSatellite
{
  return self->_isSatellite;
}

- (void)setIsSatellite:(BOOL)a3
{
  self->_isSatellite = a3;
}

- (BOOL)verified
{
  return self->_verified;
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_entityName, 0);

  objc_storeStrong((id *)&self->_preferredHandle, 0);
}

@end