@interface CKEntity
+ (BOOL)string:(id)a3 hasPrefix:(id)a4;
+ (id)_copyEntityForAddressString:(id)a3 onAccount:(id)a4;
+ (id)copyEntityForAddressString:(id)a3;
+ (id)entityForAddress:(id)a3;
- (BOOL)_allowedByScreenTime;
- (BOOL)cachedCNContactForNicknameIncludesImageData;
- (BOOL)enlargedContactImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMe;
- (BOOL)isMentionable;
- (CKEntity)initWithChat:(id)a3 imHandle:(id)a4;
- (CKEntity)initWithIMHandle:(id)a3;
- (CNContact)cnContact;
- (CNMutableContact)cachedCNContactForNickname;
- (IMAccount)chatAccount;
- (IMChat)chat;
- (IMHandle)defaultIMHandle;
- (IMHandle)handle;
- (IMNickname)cachedNicknameForCNContact;
- (NSString)IDSCanonicalAddress;
- (NSString)abbreviatedDisplayName;
- (NSString)fullName;
- (NSString)name;
- (NSString)originalAddress;
- (NSString)propertyType;
- (NSString)rawAddress;
- (NSString)textToneIdentifier;
- (NSString)textVibrationIdentifier;
- (UIImage)locationMapViewContactImage;
- (UIImage)locationShareBalloonContactImage;
- (UIImage)transcriptContactImage;
- (UIImage)transcriptDrawerContactImage;
- (id)_createNicknameContactForNickname:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 includeImageData:(BOOL)a6;
- (id)_croppedImageFromImageData:(id)a3;
- (id)_nicknameContactForNickname:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 includeImageData:(BOOL)a6;
- (id)cnContactWithKeys:(id)a3;
- (id)cnContactWithKeys:(id)a3 shouldFetchSuggestedContact:(BOOL)a4;
- (id)description;
- (id)displayNameMatchingInputText:(id)a3;
- (id)mentionTokens;
- (id)mentionsHandleID;
- (id)personViewControllerWithDelegate:(id)a3 isUnknown:(BOOL *)a4;
- (id)personViewControllerWithDelegate:(id)a3 isUnknown:(BOOL *)a4 contactStoreProvider:(id)a5;
- (id)pinnedConversationContactItemIdentifier;
- (unint64_t)hash;
- (void)_invalidateContactStoreCache:(id)a3;
- (void)_invalidatePartialContactStoreCache:(id)a3;
- (void)_setBusinessInfoForMutableContact:(id)a3 enlargedImageData:(id)a4;
- (void)addToken:(id)a3 ifAvailableToTokens:(id)a4;
- (void)setCachedCNContactForNickname:(id)a3;
- (void)setCachedCNContactForNicknameIncludesImageData:(BOOL)a3;
- (void)setCachedNicknameForCNContact:(id)a3;
- (void)setChat:(id)a3;
- (void)setChatAccount:(id)a3;
- (void)setCnContact:(id)a3;
- (void)setEnlargedContactImage:(BOOL)a3;
- (void)setHandle:(id)a3;
@end

@implementation CKEntity

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(CKEntity *)self defaultIMHandle];
    v6 = [v4 defaultIMHandle];
    char v7 = [v5 matchesIMHandle:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (CKEntity)initWithChat:(id)a3 imHandle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKEntity;
  v9 = [(CKEntity *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_handle, a4);
    objc_storeStrong((id *)&v10->_chat, a3);
    uint64_t v11 = [v7 account];
    chatAccount = v10->_chatAccount;
    v10->_chatAccount = (IMAccount *)v11;

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v10 selector:sel__invalidateContactStoreCache_ name:*MEMORY[0x1E4F6CA58] object:0];

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v10 selector:sel__invalidatePartialContactStoreCache_ name:*MEMORY[0x1E4F6CA98] object:0];
  }
  return v10;
}

- (IMHandle)defaultIMHandle
{
  v3 = [(IMHandle *)self->_handle account];
  id v4 = v3;
  if (v3 && (![v3 isActive] || (objc_msgSend(v4, "isOperational") & 1) == 0))
  {
    v5 = self->_chatAccount;
    if (!v5)
    {
      v6 = [MEMORY[0x1E4F6BBD8] sharedInstance];
      id v7 = [(IMHandle *)self->_handle ID];
      objc_msgSend(v6, "__ck_bestAccountForAddress:", v7);
      v5 = (IMAccount *)objc_claimAutoreleasedReturnValue();
    }
    id v8 = self->_handle;
    v9 = [(IMHandle *)v8 imHandleForOtherAccount:v5];
    handle = self->_handle;
    self->_handle = v9;
  }
  uint64_t v11 = self->_handle;

  return v11;
}

- (id)cnContactWithKeys:(id)a3 shouldFetchSuggestedContact:(BOOL)a4
{
  BOOL v4 = a4;
  v69[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(IMHandle *)self->_handle cnContactWithKeys:v6];
  handle = self->_handle;
  if (!v7)
  {
    if (([(IMHandle *)handle isBusiness] & 1) != 0
      || [(IMHandle *)self->_handle isStewieRoadside])
    {
      v14 = [(IMHandle *)self->_handle brand];
      if (v14)
      {
        v15 = [(CNContact *)self->_cnContact imageData];
        BOOL v16 = v15 == 0;
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__CKEntity_cnContactWithKeys_shouldFetchSuggestedContact___block_invoke;
    aBlock[3] = &unk_1E5623DC0;
    aBlock[4] = self;
    v23 = (void (**)(void *, void *))_Block_copy(aBlock);
    cnContact = self->_cnContact;
    if (cnContact)
    {
      if (v16)
      {
        v25 = (void *)[(CNContact *)self->_cnContact mutableCopy];
        v23[2](v23, v25);
        [(CKEntity *)self setCnContact:v25];
        cnContact = self->_cnContact;
      }
      v26 = cnContact;
LABEL_51:
      v22 = v26;

      goto LABEL_52;
    }
    v26 = (CNContact *)objc_alloc_init(MEMORY[0x1E4F1BA40]);
    v27 = [(IMHandle *)self->_handle ID];
    if ([v27 _appearsToBeEmail])
    {
      v28 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:v27];
      v69[0] = v28;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];
      [(CNContact *)v26 setEmailAddresses:v29];
    }
    else
    {
      if (![v27 _appearsToBePhoneNumber]) {
        goto LABEL_32;
      }
      v30 = (void *)MEMORY[0x1E4F1BA20];
      v31 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v27];
      v28 = [v30 labeledValueWithLabel:0 value:v31];

      v68 = v28;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
      [(CNContact *)v26 setPhoneNumbers:v29];
    }

LABEL_32:
    if (v16) {
      v23[2](v23, v26);
    }
    v32 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v33 = [v32 stewieEnabled];

    if (!v33) {
      goto LABEL_46;
    }
    if ([(IMHandle *)self->_handle isStewieEmergency]
      && ([(CNContact *)self->_cnContact imageData],
          v34 = objc_claimAutoreleasedReturnValue(),
          BOOL v35 = v34 == 0,
          v34,
          v35))
    {
      v36 = [MEMORY[0x1E4F42A80] ckImageNamed:@"SOS_50"];
      v49 = UIImagePNGRepresentation(v36);
      [(CNContact *)v26 setImageData:v49];
    }
    else
    {
      if (![(IMHandle *)self->_handle isStewieRoadside]) {
        goto LABEL_46;
      }
      v36 = [(CNContact *)self->_cnContact imageData];
      if (v36) {
        goto LABEL_45;
      }
      v37 = [(IMHandle *)self->_handle brandSquareLogoImageData];
      BOOL v38 = v37 == 0;

      if (!v38) {
        goto LABEL_46;
      }
      v71.width = 100.0;
      v71.height = 100.0;
      UIGraphicsBeginImageContextWithOptions(v71, 0, 0.0);
      c = UIGraphicsGetCurrentContext();
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      components[0] = xmmword_18F81B000;
      components[1] = unk_18F81B010;
      v40 = CGColorCreate(DeviceRGB, (const CGFloat *)components);
      *(_OWORD *)v65 = xmmword_18F81B020;
      long long v66 = unk_18F81B030;
      v41 = CGColorCreate(DeviceRGB, v65);
      v64[0] = v40;
      v64[1] = v41;
      CFArrayRef v42 = (const __CFArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
      *(_OWORD *)locations = xmmword_18F81AFF0;
      v43 = CGGradientCreateWithColors(DeviceRGB, v42, locations);
      v74.size.width = 100.0;
      v74.origin.x = 0.0;
      v74.origin.y = 0.0;
      v74.size.height = 100.0;
      CGFloat MinY = CGRectGetMinY(v74);
      v75.size.width = 100.0;
      v75.origin.x = 0.0;
      v75.origin.y = 0.0;
      v75.size.height = 100.0;
      v73.y = CGRectGetMaxY(v75);
      v72.x = 0.0;
      v73.x = 0.0;
      v72.y = MinY;
      CGContextDrawLinearGradient(c, v43, v72, v73, 0);
      CGGradientRelease(v43);
      CGColorRelease(v40);
      CGColorRelease(v41);
      CGColorSpaceRelease(DeviceRGB);
      v45 = (void *)MEMORY[0x1E4F42A98];
      v46 = [MEMORY[0x1E4F428B8] whiteColor];
      v62[0] = v46;
      v47 = [MEMORY[0x1E4F428B8] whiteColor];
      v62[1] = v47;
      v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
      v36 = [v45 configurationWithPaletteColors:v48];

      v49 = [MEMORY[0x1E4F42A80] systemImageNamed:@"car.front.waves.down.fill" withConfiguration:v36];
      v76.size.width = 100.0;
      v76.origin.x = 0.0;
      v76.origin.y = 0.0;
      v76.size.height = 100.0;
      CGRect v77 = CGRectInset(v76, 20.0, 20.0);
      objc_msgSend(v49, "drawInRect:", v77.origin.x, v77.origin.y, v77.size.width, v77.size.height);
      UIGraphicsGetImageFromCurrentImageContext();
      v50 = (UIImage *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
      if (v50)
      {
        v51 = UIImagePNGRepresentation(v50);
        [(CNContact *)v26 setImageData:v51];
      }
    }

LABEL_45:
LABEL_46:
    v52 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", c);
    int v53 = [v52 isTranscriptSharingEnabled];

    if (v53)
    {
      if ([(IMHandle *)self->_handle isStewieTranscriptSharingHandle])
      {
        v54 = [(CNContact *)self->_cnContact imageData];
        BOOL v55 = v54 == 0;

        if (v55)
        {
          v56 = [MEMORY[0x1E4F42A80] ckImageNamed:@"SOS_50"];
          v57 = UIImagePNGRepresentation(v56);
          [(CNContact *)v26 setImageData:v57];
        }
      }
    }
    [(CKEntity *)self setCnContact:v26];

    goto LABEL_51;
  }
  if (([(IMHandle *)handle isContact] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F6BD50] sharedInstance];
    v10 = [v9 nicknameForHandle:self->_handle];

    if (v10)
    {
      uint64_t v11 = [v7 emailAddresses];
      v12 = [v7 phoneNumbers];
      uint64_t v13 = [(CKEntity *)self _nicknameContactForNickname:v10 emailAddresses:v11 phoneNumbers:v12 includeImageData:[(CKEntity *)self _allowedByScreenTime]];

      id v7 = (void *)v13;
    }
    else if (v4 && [(IMHandle *)self->_handle hasSuggestedName])
    {
      if (IMOSLoggingEnabled())
      {
        v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "If we have a suggested name, we should return a contact for it", buf, 2u);
        }
      }
      v18 = [MEMORY[0x1E4F6BDE0] sharedInstance];
      v19 = [(IMHandle *)self->_handle displayID];
      v20 = [v18 fetchCNContactForSuggestedHandle:v19];

      if (v20)
      {
        uint64_t v21 = [v20 mutableCopy];

        id v7 = (void *)v21;
      }
    }
  }
  v22 = v7;
LABEL_52:

  return v22;
}

- (id)cnContactWithKeys:(id)a3
{
  return [(CKEntity *)self cnContactWithKeys:a3 shouldFetchSuggestedContact:0];
}

- (void)setCnContact:(id)a3
{
}

+ (id)_copyEntityForAddressString:(id)a3 onAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (CKIsRunningInFullCKClient())
  {
    if (v5)
    {
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObject:v5];
      id v8 = objc_msgSend(v6, "__ck_handlesFromAddressStrings:", v7);
      v9 = objc_msgSend(v8, "__imFirstObject");

      if (v9)
      {
        v10 = [[CKEntity alloc] initWithIMHandle:v9];

LABEL_8:
        goto LABEL_9;
      }
    }
    else
    {
      id v7 = 0;
    }
    v10 = [[CKEntity alloc] initWithIMHandle:0];
    goto LABEL_8;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

+ (id)copyEntityForAddressString:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F6BBD8];
  id v5 = a3;
  id v6 = [v4 sharedInstance];
  id v7 = objc_msgSend(v6, "__ck_bestAccountForAddress:", v5);

  id v8 = (void *)[a1 _copyEntityForAddressString:v5 onAccount:v7];
  return v8;
}

- (CKEntity)initWithIMHandle:(id)a3
{
  return [(CKEntity *)self initWithChat:0 imHandle:a3];
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CKEntity;
  BOOL v4 = [(CKEntity *)&v8 description];
  id v5 = [(CKEntity *)self defaultIMHandle];
  id v6 = [v3 stringWithFormat:@"%@ [Default IM Handle: %@]", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  v2 = [(CKEntity *)self defaultIMHandle];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (id)entityForAddress:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    BOOL v4 = IMStripFormattingFromAddress();
    id v5 = [MEMORY[0x1E4F6BBD8] sharedInstance];
    id v6 = objc_msgSend(v5, "__ck_bestAccountForAddress:", v4);

    if (v6)
    {
      id v7 = [v6 imHandleWithID:v4];
      objc_super v8 = v7;
      if (v7)
      {
        v9 = [v7 ID];

        if (v9) {
          v9 = [[CKEntity alloc] initWithIMHandle:v8];
        }
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_allowedByScreenTime
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(CKEntity *)self chat];

  if (v3)
  {
    BOOL v4 = [(CKEntity *)self chat];
    char v5 = [v4 allowedByScreenTime];
  }
  else
  {
    id v6 = [(CKEntity *)self handle];
    id v7 = [v6 ID];

    if (!v7) {
      return 1;
    }
    BOOL v4 = [MEMORY[0x1E4F6BCB0] sharedInstance];
    objc_super v8 = [(CKEntity *)self handle];
    v9 = [v8 ID];
    v12[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    char v5 = [v4 allowedToShowConversationWithHandleIDs:v10 sync:1 context:0];
  }
  return v5;
}

- (CNContact)cnContact
{
  return (CNContact *)[(CKEntity *)self cnContactWithKeys:MEMORY[0x1E4F1CBF0]];
}

void __58__CKEntity_cnContactWithKeys_shouldFetchSuggestedContact___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) enlargedContactImage])
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 40) brandSquareLogoImageData];

    if (v3)
    {
      BOOL v4 = *(id **)(a1 + 32);
      char v5 = [v4[5] brandSquareLogoImageData];
      id v3 = [v4 _croppedImageFromImageData:v5];
    }
  }
  else
  {
    id v3 = 0;
  }
  [*(id *)(a1 + 32) _setBusinessInfoForMutableContact:v6 enlargedImageData:v3];
}

- (id)_nicknameContactForNickname:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 includeImageData:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  p_cachedCNContactForNickname = &self->_cachedCNContactForNickname;
  if (!self->_cachedCNContactForNickname) {
    goto LABEL_17;
  }
  cachedNicknameForCNContact = self->_cachedNicknameForCNContact;
  if (!cachedNicknameForCNContact) {
    goto LABEL_17;
  }
  int v16 = [(IMNickname *)cachedNicknameForCNContact isUpdateFromNickname:v11 withOptions:8];
  v17 = [(CNMutableContact *)*p_cachedCNContactForNickname emailAddresses];
  id v18 = v12;
  id v19 = v17;
  v20 = v19;
  if (v19 == v18)
  {
    int v21 = 0;
  }
  else
  {
    int v21 = 1;
    if (v18 && v19) {
      int v21 = [v18 isEqualToArray:v19] ^ 1;
    }
  }
  int v29 = v21;

  v22 = [(CNMutableContact *)*p_cachedCNContactForNickname phoneNumbers];
  id v23 = v13;
  id v24 = v22;
  v25 = v24;
  int v30 = v16;
  if (v24 == v23)
  {
    char v26 = 0;
  }
  else
  {
    char v26 = 1;
    if (v23 && v24) {
      char v26 = [v23 isEqualToArray:v24] ^ 1;
    }
  }

  if (((v30 | v29) & 1) == 0 && (v26 & 1) == 0 && self->_cachedCNContactForNicknameIncludesImageData == v6)
  {
    v27 = *p_cachedCNContactForNickname;
  }
  else
  {
LABEL_17:
    v27 = [(CKEntity *)self _createNicknameContactForNickname:v11 emailAddresses:v12 phoneNumbers:v13 includeImageData:v6];
    objc_storeStrong((id *)&self->_cachedCNContactForNickname, v27);
    objc_storeStrong((id *)&self->_cachedNicknameForCNContact, a3);
    self->_cachedCNContactForNicknameIncludesImageData = v6;
  }

  return v27;
}

- (id)_createNicknameContactForNickname:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 includeImageData:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v6)
  {
    id v12 = [v9 avatar];
    id v13 = [v12 imageData];
  }
  else
  {
    id v13 = 0;
  }
  v14 = [v9 firstName];
  v15 = [v9 lastName];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  [v16 setImageData:v13];
  [v16 setGivenName:v14];
  [v16 setFamilyName:v15];
  [v16 setEmailAddresses:v10];
  [v16 setPhoneNumbers:v11];
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v16;
      _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Created nickname contact: %@", (uint8_t *)&v19, 0xCu);
    }
  }

  return v16;
}

- (BOOL)isMe
{
  v2 = [(CKEntity *)self defaultIMHandle];
  char v3 = [v2 isLoginIMHandle];

  return v3;
}

- (void)setEnlargedContactImage:(BOOL)a3
{
  self->_enlargedContactImage = a3;
  cnContact = self->_cnContact;
  self->_cnContact = 0;
}

- (NSString)abbreviatedDisplayName
{
  v2 = [(CKEntity *)self defaultIMHandle];
  char v3 = [v2 _displayNameWithAbbreviation];

  return (NSString *)v3;
}

- (void)_invalidateContactStoreCache:(id)a3
{
  cnContact = self->_cnContact;
  self->_cnContact = 0;
}

- (void)_invalidatePartialContactStoreCache:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 userInfo];
  BOOL v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6CA90]];
  if ([v6 length])
  {
    id v7 = self->_handle;
    objc_super v8 = [(CKEntity *)self defaultIMHandle];
    id v9 = [(IMHandle *)v8 ID];
    if ([v9 length] && objc_msgSend(v9, "isEqualToString:", v6))
    {
      if (IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v16 = 138412546;
          v17 = v6;
          __int16 v18 = 2112;
          int v19 = self;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Received partial change notification for UID %@. Invalidating contact for IMHandle: %@", (uint8_t *)&v16, 0x16u);
        }
      }
      if (![(IMHandle *)self->_handle isBusiness]) {
        goto LABEL_12;
      }
      if (v7 != v8)
      {
        cnContact = self->_cnContact;
        self->_cnContact = 0;
      }
      id v12 = [v4 object];
      BOOL v13 = v12 == v8;

      if (v13)
      {
LABEL_12:
        v14 = self->_cnContact;
        self->_cnContact = 0;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Received a partial change notification without a UID. Ignoring.", (uint8_t *)&v16, 2u);
    }
  }
}

- (NSString)propertyType
{
  v2 = [(CKEntity *)self defaultIMHandle];
  char v3 = [v2 ID];
  int IsEmail = IMStringIsEmail();

  char v5 = (void **)MEMORY[0x1E4F1AEE0];
  if (IsEmail) {
    char v5 = (void **)MEMORY[0x1E4F1ADC8];
  }
  BOOL v6 = *v5;

  return (NSString *)v6;
}

- (NSString)rawAddress
{
  v2 = [(CKEntity *)self defaultIMHandle];
  char v3 = [v2 ID];

  return (NSString *)v3;
}

- (NSString)originalAddress
{
  char v3 = [(CKEntity *)self defaultIMHandle];
  id v4 = [v3 originalID];

  if (![v4 length])
  {
    uint64_t v5 = [(CKEntity *)self rawAddress];

    id v4 = (void *)v5;
  }

  return (NSString *)v4;
}

- (NSString)IDSCanonicalAddress
{
  char v3 = [(CKEntity *)self rawAddress];
  id v4 = IMStripFormattingFromAddress();

  uint64_t v5 = [(CKEntity *)self propertyType];
  BOOL v6 = (void *)*MEMORY[0x1E4F1AEE0];

  if (v5 == v6)
  {
    uint64_t v9 = IDSCopyIDForPhoneNumber();
  }
  else
  {
    id v7 = [(CKEntity *)self propertyType];
    objc_super v8 = (void *)*MEMORY[0x1E4F1ADC8];

    if (v7 != v8) {
      goto LABEL_6;
    }
    uint64_t v9 = MEMORY[0x192FB9BB0](v4);
  }
  id v10 = (void *)v9;

  id v4 = v10;
LABEL_6:

  return (NSString *)v4;
}

- (NSString)fullName
{
  v2 = [(CKEntity *)self defaultIMHandle];
  char v3 = [v2 fullName];

  if (!v3)
  {
    id v4 = CKFrameworkBundle();
    char v3 = [v4 localizedStringForKey:@"Unknown" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }

  return (NSString *)v3;
}

- (NSString)name
{
  v2 = [(CKEntity *)self defaultIMHandle];
  char v3 = [v2 name];

  if (!v3)
  {
    id v4 = CKFrameworkBundle();
    char v3 = [v4 localizedStringForKey:@"Unknown" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }

  return (NSString *)v3;
}

- (NSString)textToneIdentifier
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4F1AF90];
  uint64_t v3 = v9[0];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  uint64_t v5 = [(CKEntity *)self cnContactWithKeys:v4];
  BOOL v6 = [v5 valueForKey:v3];

  id v7 = [v6 sound];

  return (NSString *)v7;
}

- (NSString)textVibrationIdentifier
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4F1AF90];
  uint64_t v3 = v9[0];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  uint64_t v5 = [(CKEntity *)self cnContactWithKeys:v4];
  BOOL v6 = [v5 valueForKey:v3];

  id v7 = [v6 vibration];

  return (NSString *)v7;
}

- (void)_setBusinessInfoForMutableContact:(id)a3 enlargedImageData:(id)a4
{
}

- (UIImage)locationMapViewContactImage
{
  uint64_t v3 = [(CKEntity *)self defaultIMHandle];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x192FBA860](@"FMFMapViewController", @"FMFUI");
    if (v4)
    {
      [v4 annotationImageSize];
      double v6 = v5;
    }
    else
    {
      double v6 = 0.0;
    }
    objc_super v8 = [(CKEntity *)self rawAddress];
    id v7 = +[CKAddressBook locationSharingContactImageOfDiameter:v8 forID:1 useCustomFont:v6];
  }
  else
  {
    id v7 = 0;
  }

  return (UIImage *)v7;
}

- (UIImage)locationShareBalloonContactImage
{
  uint64_t v3 = +[CKUIBehavior sharedBehaviors];
  [v3 locationShareBalloonContactImageDiameter];
  double v5 = v4;
  double v6 = [(CKEntity *)self rawAddress];
  id v7 = +[CKAddressBook locationSharingContactImageOfDiameter:v6 forID:0 useCustomFont:v5];

  return (UIImage *)v7;
}

- (id)_croppedImageFromImageData:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F42A80] imageWithData:a3];
  [v3 size];
  CGFloat v5 = v4 * 0.17;
  [v3 size];
  CGFloat v7 = v6 * 0.14;
  [v3 size];
  CGFloat v9 = v8 + v5 * -2.0;
  [v3 size];
  CGFloat v11 = v10 + v5 * -2.0;
  id v12 = v3;
  BOOL v13 = (CGImage *)[v12 CGImage];
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  v14 = CGImageCreateWithImageInRect(v13, v19);
  v15 = [MEMORY[0x1E4F42A80] imageWithCGImage:v14];
  CGImageRelease(v14);
  int v16 = UIImagePNGRepresentation(v15);

  return v16;
}

- (UIImage)transcriptContactImage
{
  return self->_transcriptContactImage;
}

- (UIImage)transcriptDrawerContactImage
{
  return self->_transcriptDrawerContactImage;
}

- (BOOL)enlargedContactImage
{
  return self->_enlargedContactImage;
}

- (IMHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (IMAccount)chatAccount
{
  return self->_chatAccount;
}

- (void)setChatAccount:(id)a3
{
}

- (IMChat)chat
{
  return self->_chat;
}

- (void)setChat:(id)a3
{
}

- (CNMutableContact)cachedCNContactForNickname
{
  return self->_cachedCNContactForNickname;
}

- (void)setCachedCNContactForNickname:(id)a3
{
}

- (IMNickname)cachedNicknameForCNContact
{
  return self->_cachedNicknameForCNContact;
}

- (void)setCachedNicknameForCNContact:(id)a3
{
}

- (BOOL)cachedCNContactForNicknameIncludesImageData
{
  return self->_cachedCNContactForNicknameIncludesImageData;
}

- (void)setCachedCNContactForNicknameIncludesImageData:(BOOL)a3
{
  self->_cachedCNContactForNicknameIncludesImageData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedNicknameForCNContact, 0);
  objc_storeStrong((id *)&self->_cachedCNContactForNickname, 0);
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_chatAccount, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_transcriptDrawerContactImage, 0);
  objc_storeStrong((id *)&self->_transcriptContactImage, 0);

  objc_storeStrong((id *)&self->_cnContact, 0);
}

- (BOOL)isMentionable
{
  v2 = [(CKEntity *)self defaultIMHandle];
  char v3 = [v2 isContact];

  return v3;
}

- (id)mentionTokens
{
  char v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:9];
  double v4 = [(CKEntity *)self abbreviatedDisplayName];
  CGFloat v5 = [v4 mentionsSafeText];
  [(CKEntity *)self addToken:v5 ifAvailableToTokens:v3];

  double v6 = [(CKEntity *)self name];
  CGFloat v7 = [v6 mentionsSafeText];
  [(CKEntity *)self addToken:v7 ifAvailableToTokens:v3];

  double v8 = [(CKEntity *)self fullName];
  CGFloat v9 = [v8 mentionsSafeText];
  [(CKEntity *)self addToken:v9 ifAvailableToTokens:v3];

  double v10 = [(CKEntity *)self defaultIMHandle];
  CGFloat v11 = [v10 nickname];
  id v12 = [v11 mentionsSafeText];
  [(CKEntity *)self addToken:v12 ifAvailableToTokens:v3];

  BOOL v13 = [(CKEntity *)self defaultIMHandle];
  v14 = [v13 firstName];
  v15 = [v14 mentionsSafeText];
  [(CKEntity *)self addToken:v15 ifAvailableToTokens:v3];

  int v16 = [(CKEntity *)self defaultIMHandle];
  v17 = [v16 lastName];
  __int16 v18 = [v17 mentionsSafeText];
  [(CKEntity *)self addToken:v18 ifAvailableToTokens:v3];

  CGRect v19 = [(CKEntity *)self defaultIMHandle];
  uint64_t v20 = [v19 phoneticFirstName];
  uint64_t v21 = [v20 mentionsSafeText];
  [(CKEntity *)self addToken:v21 ifAvailableToTokens:v3];

  v22 = [(CKEntity *)self defaultIMHandle];
  id v23 = [v22 phoneticLastName];
  id v24 = [v23 mentionsSafeText];
  [(CKEntity *)self addToken:v24 ifAvailableToTokens:v3];

  v25 = [(CKEntity *)self defaultIMHandle];
  char v26 = [v25 phoneticFullName];
  v27 = [v26 mentionsSafeText];
  [(CKEntity *)self addToken:v27 ifAvailableToTokens:v3];

  v28 = (void *)[v3 copy];

  return v28;
}

- (void)addToken:(id)a3 ifAvailableToTokens:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if ([v6 length]) {
    [v5 addObject:v6];
  }
}

- (id)mentionsHandleID
{
  v2 = [(CKEntity *)self defaultIMHandle];
  char v3 = [v2 ID];

  return v3;
}

- (id)displayNameMatchingInputText:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mentionsSafeText];
  id v6 = [(CKEntity *)self abbreviatedDisplayName];
  CGFloat v7 = [v6 mentionsSafeText];
  int v8 = [v7 isEqualToIgnoringCase:v5];

  if (v8)
  {
    id v9 = [(CKEntity *)self abbreviatedDisplayName];
LABEL_7:
    int v16 = v9;
    goto LABEL_8;
  }
  double v10 = [(CKEntity *)self name];
  CGFloat v11 = [v10 mentionsSafeText];
  int v12 = [v11 isEqualToIgnoringCase:v5];

  if (v12)
  {
    id v9 = [(CKEntity *)self name];
    goto LABEL_7;
  }
  BOOL v13 = [(CKEntity *)self fullName];
  v14 = [v13 mentionsSafeText];
  int v15 = [v14 isEqualToIgnoringCase:v5];

  if (v15)
  {
    id v9 = [(CKEntity *)self fullName];
    goto LABEL_7;
  }
  __int16 v18 = [(CKEntity *)self defaultIMHandle];
  CGRect v19 = [v18 nickname];
  uint64_t v20 = [v19 mentionsSafeText];
  int v21 = [v20 isEqualToIgnoringCase:v5];

  v22 = [(CKEntity *)self defaultIMHandle];
  id v23 = v22;
  if (v21)
  {
    uint64_t v24 = [v22 nickname];
  }
  else
  {
    v25 = [v22 firstName];
    char v26 = [v25 mentionsSafeText];
    int v27 = [v26 isEqualToIgnoringCase:v5];

    v28 = [(CKEntity *)self defaultIMHandle];
    id v23 = v28;
    if (v27)
    {
      uint64_t v24 = [v28 firstName];
    }
    else
    {
      int v29 = [v28 lastName];
      int v30 = [v29 mentionsSafeText];
      int v31 = [v30 isEqualToIgnoringCase:v5];

      v32 = [(CKEntity *)self defaultIMHandle];
      id v23 = v32;
      if (v31)
      {
        uint64_t v24 = [v32 lastName];
      }
      else
      {
        int v33 = [v32 phoneticFirstName];
        v34 = [v33 mentionsSafeText];
        int v35 = [v34 isEqualToIgnoringCase:v5];

        v36 = [(CKEntity *)self defaultIMHandle];
        id v23 = v36;
        if (v35)
        {
          uint64_t v24 = [v36 phoneticFirstName];
        }
        else
        {
          v37 = [v36 phoneticLastName];
          BOOL v38 = [v37 mentionsSafeText];
          int v39 = [v38 isEqualToIgnoringCase:v5];

          v40 = [(CKEntity *)self defaultIMHandle];
          id v23 = v40;
          if (v39)
          {
            uint64_t v24 = [v40 phoneticLastName];
          }
          else
          {
            v41 = [v40 phoneticFullName];
            CFArrayRef v42 = [v41 mentionsSafeText];
            int v43 = [v42 isEqualToIgnoringCase:v5];

            if (!v43)
            {
              id v9 = v4;
              goto LABEL_7;
            }
            id v23 = [(CKEntity *)self defaultIMHandle];
            uint64_t v24 = [v23 phoneticFullName];
          }
        }
      }
    }
  }
  int v16 = (void *)v24;

LABEL_8:

  return v16;
}

+ (BOOL)string:(id)a3 hasPrefix:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a3;
  CGFloat v7 = [v5 predicateWithFormat:@"SELF beginswith[cld] %@", a4];
  LOBYTE(v5) = [v7 evaluateWithObject:v6];

  return (char)v5;
}

- (id)personViewControllerWithDelegate:(id)a3 isUnknown:(BOOL *)a4
{
  id v6 = a3;
  CGFloat v7 = +[_CKEntityContactStoreProvider sharedInstance];
  int v8 = [(CKEntity *)self personViewControllerWithDelegate:v6 isUnknown:a4 contactStoreProvider:v7];

  return v8;
}

- (id)personViewControllerWithDelegate:(id)a3 isUnknown:(BOOL *)a4 contactStoreProvider:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = [(CKEntity *)self defaultIMHandle];
  id v9 = [MEMORY[0x1E4F1BBA8] descriptorForRequiredKeys];
  v16[0] = v9;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  CGFloat v11 = [v8 cnContactWithKeys:v10];

  if ([MEMORY[0x1E4F6E6D8] isCNContactAKnownContact:v11])
  {
    *a4 = 0;
    int v12 = [MEMORY[0x1E4F1BBA8] viewControllerForContact:v11];
    [v12 setDisplayMode:2];
    [v12 setAllowsActions:1];
    [v12 setAllowsEditing:1];
    [v12 setShouldShowLinkedContacts:1];
    objc_msgSend(v12, "setActions:", objc_msgSend(v12, "actions") | 0x80);
    BOOL v13 = [(CKEntity *)self propertyType];
    [v12 highlightPropertyWithKey:v13 identifier:0];
  }
  else
  {
    *a4 = 1;
    int v12 = [MEMORY[0x1E4F1BBA8] viewControllerForUnknownContact:v11];
    [v12 setDisplayMode:2];
    v14 = [(CKEntity *)self propertyType];
    [v12 setPrimaryPropertyKey:v14];

    [v12 setAllowsActions:1];
    objc_msgSend(v12, "setActions:", objc_msgSend(v12, "actions") | 0x80);
  }
  [v12 setDelegate:v7];

  return v12;
}

- (id)pinnedConversationContactItemIdentifier
{
  char v3 = [(CKEntity *)self rawAddress];
  if (![v3 length])
  {
    _IMWarn();
    uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%p", self);

    char v3 = (void *)v4;
  }

  return v3;
}

@end