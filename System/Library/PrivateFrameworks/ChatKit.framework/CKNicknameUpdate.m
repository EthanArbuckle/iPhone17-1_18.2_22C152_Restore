@interface CKNicknameUpdate
- (BOOL)isEqual:(id)a3;
- (CNContact)contact;
- (IMHandle)handle;
- (IMNickname)nickname;
- (id)_updatedName;
- (id)condensedSubtitleText;
- (id)contactWithUpdatedInformation;
- (id)description;
- (id)listSubtitleText;
- (id)listTitleText;
- (unint64_t)updateType;
- (void)setContact:(id)a3;
- (void)setHandle:(id)a3;
- (void)setNickname:(id)a3;
- (void)setUpdateType:(unint64_t)a3;
@end

@implementation CKNicknameUpdate

- (id)description
{
  v3 = NSString;
  v4 = [(CKNicknameUpdate *)self handle];
  v5 = [v4 ID];
  unint64_t v6 = [(CKNicknameUpdate *)self updateType];
  v7 = [(CKNicknameUpdate *)self nickname];
  v8 = [(CKNicknameUpdate *)self contact];
  v9 = [v3 stringWithFormat:@"Update for ID %@ is %lu nickname %@ contact %@", v5, v6, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(CKNicknameUpdate *)self handle];
    v7 = [v5 handle];
    if ([v6 isEqual:v7])
    {
      BOOL v8 = 1;
    }
    else
    {
      v10 = [(CKNicknameUpdate *)self handle];
      if (v10)
      {
        BOOL v8 = 0;
      }
      else
      {
        v11 = [v5 handle];
        BOOL v8 = v11 == 0;
      }
    }

    v12 = [(CKNicknameUpdate *)self nickname];
    v13 = [v5 nickname];
    int v14 = [v12 isEqual:v13];

    v15 = [(CKNicknameUpdate *)self contact];
    v16 = [v15 identifier];
    v17 = [v5 contact];
    v18 = [v17 identifier];
    if ([v16 isEqualToString:v18])
    {
      BOOL v19 = 1;
    }
    else
    {
      int v26 = v14;
      BOOL v20 = v8;
      v21 = [(CKNicknameUpdate *)self contact];
      if (v21)
      {
        BOOL v19 = 0;
      }
      else
      {
        v22 = [v5 contact];
        BOOL v19 = v22 == 0;
      }
      BOOL v8 = v20;
      int v14 = v26;
    }

    unint64_t v23 = [(CKNicknameUpdate *)self updateType];
    uint64_t v24 = [v5 updateType];
    BOOL v9 = (v8 & v14) == 1 && v23 == v24 && v19;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)listTitleText
{
  v3 = [(CKNicknameUpdate *)self contact];
  id v4 = [v3 givenName];

  id v5 = [(CKNicknameUpdate *)self contact];

  if (!v5)
  {
    v10 = NSString;
    v11 = CKFrameworkBundle();
    v12 = [v11 localizedStringForKey:@"NEW_CONTACT_INFORMATION" value:&stru_1EDE4CA38 table:@"ChatKit"];
LABEL_12:
    BOOL v8 = objc_msgSend(v10, "stringWithFormat:", v12, v20);

    v16 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v17 = [v16 userInterfaceLayoutDirection];

    if (v17 == 1) {
      v18 = @"\u200F";
    }
    else {
      v18 = @"\u200E";
    }
    uint64_t v9 = [(__CFString *)v18 stringByAppendingString:v8];
    goto LABEL_16;
  }
  char v6 = [(CKNicknameUpdate *)self updateType];
  char v7 = [(CKNicknameUpdate *)self updateType];
  if ((v6 & 2) == 0 || (v7 & 4) == 0)
  {
    if ((v6 & 2) != 0)
    {
      v10 = NSString;
      int v14 = CKFrameworkBundle();
      v11 = v14;
      v15 = @"%@_SHARED_A_NEW_NAME";
    }
    else
    {
      if ((v7 & 4) == 0)
      {
        v13 = 0;
        goto LABEL_17;
      }
      v10 = NSString;
      int v14 = CKFrameworkBundle();
      v11 = v14;
      v15 = @"%@_SHARED_A_NEW_PHOTO";
    }
    v12 = [v14 localizedStringForKey:v15 value:&stru_1EDE4CA38 table:@"ChatKit"];
    BOOL v20 = v4;
    goto LABEL_12;
  }
  BOOL v8 = CKFrameworkBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"THIS_PERSON_SHARED_A_NEW_PHOTO_AND_NAME" value:&stru_1EDE4CA38 table:@"ChatKit"];
LABEL_16:
  v13 = (void *)v9;

LABEL_17:

  return v13;
}

- (id)listSubtitleText
{
  v3 = (void *)MEMORY[0x1E4F1B910];
  id v4 = [(CKNicknameUpdate *)self contact];
  id v5 = [v3 stringFromContact:v4 style:0];

  char v6 = [(CKNicknameUpdate *)self contact];

  if (v6)
  {
    if (([(CKNicknameUpdate *)self updateType] & 2) != 0)
    {
      BOOL v8 = NSString;
      uint64_t v9 = CKFrameworkBundle();
      v10 = [v9 localizedStringForKey:@"NAME_CHANGED_FROM_%@_TO_%@" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v11 = [(CKNicknameUpdate *)self _updatedName];
      v12 = objc_msgSend(v8, "stringWithFormat:", v10, v5, v11);

      v13 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v14 = [v13 userInterfaceLayoutDirection];

      if (v14 == 1) {
        v15 = @"\u200F";
      }
      else {
        v15 = @"\u200E";
      }
      char v7 = [(__CFString *)v15 stringByAppendingString:v12];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = [(CKNicknameUpdate *)self _updatedName];
  }

  return v7;
}

- (id)condensedSubtitleText
{
  char v3 = [(CKNicknameUpdate *)self updateType];
  char v4 = [(CKNicknameUpdate *)self updateType];
  if ((v3 & 2) != 0 && (v4 & 4) != 0)
  {
    id v5 = CKFrameworkBundle();
    char v6 = v5;
    char v7 = @"NEW_CONTACT_INFORMATION";
    BOOL v8 = @"ChatKit";
  }
  else
  {
    if ((v3 & 2) != 0)
    {
      id v5 = CKFrameworkBundle();
      char v6 = v5;
      char v7 = @"NEW_CONTACT_NAME";
    }
    else
    {
      if ((v4 & 4) == 0)
      {
        uint64_t v9 = 0;
        goto LABEL_11;
      }
      id v5 = CKFrameworkBundle();
      char v6 = v5;
      char v7 = @"NEW_CONTACT_PHOTO";
    }
    BOOL v8 = @"ChatKitPepper";
  }
  uint64_t v9 = [v5 localizedStringForKey:v7 value:&stru_1EDE4CA38 table:v8];

LABEL_11:

  return v9;
}

- (id)contactWithUpdatedInformation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  char v4 = [(CKNicknameUpdate *)self nickname];
  id v5 = [v4 firstName];
  [v3 setGivenName:v5];

  char v6 = [(CKNicknameUpdate *)self nickname];
  char v7 = [v6 lastName];
  [v3 setFamilyName:v7];

  BOOL v8 = [(CKNicknameUpdate *)self nickname];
  uint64_t v9 = [v8 avatar];
  v10 = [v9 imageData];

  if (v10) {
    [v3 setImageData:v10];
  }

  return v3;
}

- (id)_updatedName
{
  v2 = (void *)MEMORY[0x1E4F1B910];
  id v3 = [(CKNicknameUpdate *)self contactWithUpdatedInformation];
  char v4 = [v2 stringFromContact:v3 style:0];

  return v4;
}

- (IMHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (IMNickname)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (unint64_t)updateType
{
  return self->_updateType;
}

- (void)setUpdateType:(unint64_t)a3
{
  self->_updateType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_nickname, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end