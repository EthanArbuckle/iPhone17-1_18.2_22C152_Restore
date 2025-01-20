@interface PhotosSeparationSharedAlbumParticipant
- (PhotosSeparationSharedAlbumParticipant)initWithInvitationRecord:(id)a3 isOwner:(BOOL)a4 readwrite:(BOOL)a5;
- (id)nameComponents;
- (id)representedObject;
- (id)uuid;
@end

@implementation PhotosSeparationSharedAlbumParticipant

- (void).cxx_destruct
{
}

- (id)nameComponents
{
  id v3 = objc_alloc_init((Class)NSPersonNameComponents);
  v4 = [(PHCloudSharedAlbumInvitationRecord *)self->_invitationRecord inviteeFirstName];
  [v3 setGivenName:v4];

  v5 = [(PHCloudSharedAlbumInvitationRecord *)self->_invitationRecord inviteeLastName];
  [v3 setFamilyName:v5];

  return v3;
}

- (id)uuid
{
  return [(PHCloudSharedAlbumInvitationRecord *)self->_invitationRecord cloudGUID];
}

- (id)representedObject
{
  return self->_invitationRecord;
}

- (PhotosSeparationSharedAlbumParticipant)initWithInvitationRecord:(id)a3 isOwner:(BOOL)a4 readwrite:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v9 = a3;
  v10 = [v9 inviteeEmails];
  uint64_t v11 = [v10 firstObject];

  v12 = [v9 inviteePhones];
  v13 = [v12 firstObject];

  if (!v11
    || (+[ECEmailAddressParser parseEmailAddressString:v11 displayName:0 localPart:0 domain:0 groupList:0] & 1) != 0|| v13)
  {
    if (!v13)
    {
      v14 = (void *)v11;
      goto LABEL_22;
    }
    BOOL v32 = v6;
    v14 = (void *)v11;
  }
  else
  {
    BOOL v32 = v6;
    v14 = 0;
    v13 = (void *)v11;
  }
  id v38 = 0;
  id v15 = [objc_alloc((Class)NSDataDetector) initWithTypes:2048 error:&v38];
  id v16 = v38;
  if (v15)
  {
    BOOL v29 = v5;
    v30 = self;
    id v31 = v7;
    v17 = objc_msgSend(v15, "matchesInString:options:range:", v13, 0, 0, objc_msgSend(v13, "length"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v18 = [v17 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v35;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if ([v22 resultType] == &stru_7D8.size)
          {
            uint64_t v23 = [v22 phoneNumber];

            v13 = (void *)v23;
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v19);
    }

    self = v30;
    id v7 = v31;
    BOOL v5 = v29;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v16;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invitation Recipient can't instantiate detector for phone %@", buf, 0xCu);
  }

  BOOL v6 = v32;
LABEL_22:
  if (v6) {
    uint64_t v24 = 1;
  }
  else {
    uint64_t v24 = 2;
  }
  if (v5) {
    uint64_t v25 = 2;
  }
  else {
    uint64_t v25 = 1;
  }
  v33.receiver = self;
  v33.super_class = (Class)PhotosSeparationSharedAlbumParticipant;
  v26 = [(PhotosSeparationParticipant *)&v33 initWithRole:v24 permission:v25 emailAddress:v14 phoneNumber:v13];
  v27 = v26;
  if (v26) {
    objc_storeStrong((id *)&v26->_invitationRecord, v7);
  }

  return v27;
}

@end