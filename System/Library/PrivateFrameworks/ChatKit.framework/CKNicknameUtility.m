@interface CKNicknameUtility
+ (id)_catalystSubtitleTextWithUpdates:(id)a3 style:(unint64_t)a4;
+ (id)addContactOptionsMenuItemsWithTarget:(id)a3 update:(id)a4;
+ (id)addContactOptionsMenuWithTarget:(id)a3 update:(id)a4;
+ (id)avatarContactForUpdate:(id)a3 style:(unint64_t)a4;
+ (id)avatarContactsForUpdates:(id)a3 style:(unint64_t)a4;
+ (id)bannerActionButtonStringWithUpdates:(id)a3 style:(unint64_t)a4;
+ (id)bannerSubtitleTextWithUpdates:(id)a3 style:(unint64_t)a4;
+ (id)bannerTitleTextWithUpdates:(id)a3 style:(unint64_t)a4 useNamedTitles:(BOOL)a5;
+ (id)createContactForOutgoingShare;
+ (id)createContactFromNickname:(id)a3;
+ (id)customImageForUpdate:(id)a3 style:(unint64_t)a4;
+ (id)formattedNameWithFirstName:(id)a3 lastName:(id)a4;
+ (id)getContactDisplayName:(id)a3;
+ (id)groupPhotoUpdateSubtitleForUpdate:(id)a3;
+ (id)groupPhotoUpdateTitleForUpdate:(id)a3;
+ (id)updateNameAndPhotoMenuItemsWithTarget:(id)a3 update:(id)a4;
+ (id)updateNameAndPhotoMenuWithTarget:(id)a3 update:(id)a4;
@end

@implementation CKNicknameUtility

+ (id)customImageForUpdate:(id)a3 style:(unint64_t)a4
{
  v5 = [a3 contact];
  if (a4 == 5 || v5)
  {
  }
  else if (a4 != 4)
  {
    v6 = [MEMORY[0x1E4F42A80] ckImageNamed:@"ContactsIcon"];
    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)avatarContactForUpdate:(id)a3 style:(unint64_t)a4
{
  id v5 = a3;
  char v6 = [v5 updateType];
  id v7 = [v5 contact];
  id v8 = 0;
  if (a4 != 2)
  {
    if (a4 != 6)
    {
      if (a4 != 5)
      {
        if ((v6 & 4) == 0) {
          goto LABEL_7;
        }
        v11 = [v5 nickname];
        v12 = [v11 avatar];
        v9 = [v12 imageData];

        if (v9)
        {
          id v8 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
          [v8 setImageData:v9];
        }
        else
        {
          id v8 = v7;
        }
LABEL_6:

        id v7 = v8;
LABEL_7:
        id v7 = v7;
        id v8 = v7;
        goto LABEL_8;
      }
      id v8 = +[CKNicknameUtility createContactForOutgoingShare];
    }
    v9 = v7;
    goto LABEL_6;
  }
LABEL_8:

  return v8;
}

+ (id)avatarContactsForUpdates:(id)a3 style:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend((id)objc_opt_class(), "avatarContactForUpdate:style:", *(void *)(*((void *)&v14 + 1) + 8 * i), a4, (void)v14);
        if (v12) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)addContactOptionsMenuItemsWithTarget:(id)a3 update:(id)a4
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id location = 0;
  uint64_t v19 = v5;
  objc_initWeak(&location, v5);
  id v7 = [CKMenuItemObject alloc];
  uint64_t v8 = CKFrameworkBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"CREATE_NEW_CONTACT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __65__CKNicknameUtility_addContactOptionsMenuItemsWithTarget_update___block_invoke;
  v23[3] = &unk_1E5622AB8;
  objc_copyWeak(&v25, &location);
  id v10 = v6;
  id v24 = v10;
  v11 = [(CKMenuItemObject *)v7 initWithTitle:v9 imageName:@"person.crop.circle" handler:v23];
  v27[0] = v11;
  v12 = [CKMenuItemObject alloc];
  v13 = CKFrameworkBundle();
  long long v14 = [v13 localizedStringForKey:@"ADD_TO_EXISTING_CONTACT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __65__CKNicknameUtility_addContactOptionsMenuItemsWithTarget_update___block_invoke_2;
  v20[3] = &unk_1E5622AB8;
  objc_copyWeak(&v22, &location);
  id v15 = v10;
  id v21 = v15;
  long long v16 = [(CKMenuItemObject *)v12 initWithTitle:v14 imageName:@"person.crop.circle.badge.plus" handler:v20];
  v27[1] = v16;
  long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v25);

  objc_destroyWeak(&location);

  return v17;
}

void __65__CKNicknameUtility_addContactOptionsMenuItemsWithTarget_update___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateInterfaceSelectedAction:4 forUpdate:*(void *)(a1 + 32)];
}

void __65__CKNicknameUtility_addContactOptionsMenuItemsWithTarget_update___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateInterfaceSelectedAction:5 forUpdate:*(void *)(a1 + 32)];
}

+ (id)addContactOptionsMenuWithTarget:(id)a3 update:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [(id)objc_opt_class() addContactOptionsMenuItemsWithTarget:v5 update:v6];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) uiAction];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
  long long v14 = (void *)MEMORY[0x1E4F42B80];
  id v15 = (void *)[v7 copy];
  long long v16 = [v14 menuWithTitle:&stru_1EDE4CA38 children:v15];

  return v16;
}

+ (id)updateNameAndPhotoMenuItemsWithTarget:(id)a3 update:(id)a4
{
  v36[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id location = 0;
  id v24 = v5;
  objc_initWeak(&location, v5);
  id v7 = [CKMenuItemObject alloc];
  uint64_t v8 = CKFrameworkBundle();
  id v25 = [v8 localizedStringForKey:@"NAME_AND_PHOTO" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __66__CKNicknameUtility_updateNameAndPhotoMenuItemsWithTarget_update___block_invoke;
  v32[3] = &unk_1E5622AB8;
  objc_copyWeak(&v34, &location);
  id v9 = v6;
  id v33 = v9;
  uint64_t v10 = [(CKMenuItemObject *)v7 initWithTitle:v25 imageName:0 handler:v32];
  v36[0] = v10;
  uint64_t v11 = [CKMenuItemObject alloc];
  v12 = CKFrameworkBundle();
  v13 = [v12 localizedStringForKey:@"NAME_ONLY" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v23 = (void *)v10;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __66__CKNicknameUtility_updateNameAndPhotoMenuItemsWithTarget_update___block_invoke_2;
  v29[3] = &unk_1E5622AB8;
  objc_copyWeak(&v31, &location);
  id v14 = v9;
  id v30 = v14;
  id v15 = [(CKMenuItemObject *)v11 initWithTitle:v13 imageName:0 handler:v29];
  v36[1] = v15;
  long long v16 = [CKMenuItemObject alloc];
  long long v17 = CKFrameworkBundle();
  long long v18 = [v17 localizedStringForKey:@"PHOTO_ONLY" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __66__CKNicknameUtility_updateNameAndPhotoMenuItemsWithTarget_update___block_invoke_3;
  v26[3] = &unk_1E5622AB8;
  objc_copyWeak(&v28, &location);
  id v19 = v14;
  id v27 = v19;
  long long v20 = [(CKMenuItemObject *)v16 initWithTitle:v18 imageName:0 handler:v26];
  v36[2] = v20;
  long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

  return v21;
}

void __66__CKNicknameUtility_updateNameAndPhotoMenuItemsWithTarget_update___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateInterfaceSelectedAction:3 forUpdate:*(void *)(a1 + 32)];
}

void __66__CKNicknameUtility_updateNameAndPhotoMenuItemsWithTarget_update___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateInterfaceSelectedAction:1 forUpdate:*(void *)(a1 + 32)];
}

void __66__CKNicknameUtility_updateNameAndPhotoMenuItemsWithTarget_update___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateInterfaceSelectedAction:2 forUpdate:*(void *)(a1 + 32)];
}

+ (id)updateNameAndPhotoMenuWithTarget:(id)a3 update:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [(id)objc_opt_class() updateNameAndPhotoMenuItemsWithTarget:v5 update:v6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) uiAction];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
  id v14 = CKFrameworkBundle();
  id v15 = [v14 localizedStringForKey:@"UPDATE_PHOTO_AND_NAME_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  long long v16 = (void *)MEMORY[0x1E4F42B80];
  long long v17 = (void *)[v7 copy];
  long long v18 = [v16 menuWithTitle:v15 children:v17];

  return v18;
}

+ (id)bannerTitleTextWithUpdates:(id)a3 style:(unint64_t)a4 useNamedTitles:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  uint64_t v8 = [v7 firstObject];
  uint64_t v9 = [v8 contact];
  uint64_t v10 = v9;
  if (v5)
  {
    if (v9)
    {
      uint64_t v11 = [v9 givenName];
    }
    else
    {
      v12 = [v8 handle];
      uint64_t v11 = [v12 ID];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  switch(a4)
  {
    case 1uLL:
      if (v5)
      {
        v13 = NSString;
        id v14 = CKFrameworkBundle();
        id v15 = v14;
        long long v16 = @"%@_SHARED_A_NEW_PHOTO";
        goto LABEL_11;
      }
      long long v23 = CKFrameworkBundle();
      long long v18 = v23;
      id v24 = @"THIS_PERSON_SHARED_A_NEW_PHOTO";
      goto LABEL_28;
    case 2uLL:
      if (v5)
      {
        v13 = NSString;
        id v14 = CKFrameworkBundle();
        id v15 = v14;
        long long v16 = @"%@_SHARED_A_NEW_NAME";
LABEL_11:
        long long v17 = [v14 localizedStringForKey:v16 value:&stru_1EDE4CA38 table:@"ChatKit"];
        long long v18 = objc_msgSend(v13, "stringWithFormat:", v17, v11);

        id v19 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v20 = [v19 userInterfaceLayoutDirection];

        if (v20 == 1) {
          long long v21 = @"\u200F";
        }
        else {
          long long v21 = @"\u200E";
        }
        uint64_t v22 = [(__CFString *)v21 stringByAppendingString:v18];
      }
      else
      {
        long long v23 = CKFrameworkBundle();
        long long v18 = v23;
        id v24 = @"THIS_PERSON_SHARED_A_NEW_NAME";
LABEL_28:
        uint64_t v22 = [v23 localizedStringForKey:v24 value:&stru_1EDE4CA38 table:@"ChatKit"];
      }
      v35 = (void *)v22;

      if (!v10) {
        goto LABEL_30;
      }
      goto LABEL_32;
    case 3uLL:
      long long v23 = CKFrameworkBundle();
      long long v18 = v23;
      id v24 = @"THIS_PERSON_SHARED_A_NEW_PHOTO_AND_NAME";
      goto LABEL_28;
    case 4uLL:
      uint64_t v25 = NSString;
      v26 = CKFrameworkBundle();
      id v27 = [v26 localizedStringForKey:@"PEOPLE_SHARED_UPDATED_CONTACT_INFO_FORMAT" value:&stru_1EDE4CA38 table:@"ChatKit"];
      id v28 = objc_msgSend(v25, "localizedStringWithFormat:", v27, objc_msgSend(v7, "count"));

      v29 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v30 = [v29 userInterfaceLayoutDirection];

      if (v30 == 1) {
        id v31 = @"\u200F";
      }
      else {
        id v31 = @"\u200E";
      }
      uint64_t v32 = [(__CFString *)v31 stringByAppendingString:v28];
      goto LABEL_25;
    case 5uLL:
      id v33 = CKFrameworkBundle();
      id v28 = v33;
      id v34 = @"SHARE_YOUR_NAME_AND_PHOTO";
      goto LABEL_24;
    case 6uLL:
      id v33 = CKFrameworkBundle();
      id v28 = v33;
      id v34 = @"ADD_YOUR_NAME_AND_PHOTO";
LABEL_24:
      uint64_t v32 = [v33 localizedStringForKey:v34 value:&stru_1EDE4CA38 table:@"ChatKit"];
LABEL_25:
      v35 = (void *)v32;
      goto LABEL_31;
    default:
      v35 = 0;
      if (!v10)
      {
LABEL_30:
        id v28 = CKFrameworkBundle();
        uint64_t v36 = [v28 localizedStringForKey:@"NEW_CONTACT_INFORMATION" value:&stru_1EDE4CA38 table:@"ChatKit"];

        v35 = (void *)v36;
LABEL_31:
      }
LABEL_32:

      return v35;
  }
}

+ (id)bannerActionButtonStringWithUpdates:(id)a3 style:(unint64_t)a4
{
  BOOL v5 = [a3 firstObject];
  id v6 = v5;
  switch(a4)
  {
    case 6uLL:
      int v10 = CKIsRunningInMacCatalyst();
      id v7 = CKFrameworkBundle();
      uint64_t v8 = v7;
      if (v10) {
        uint64_t v9 = @"SET_UP_BUTTON";
      }
      else {
        uint64_t v9 = @"SET_UP";
      }
      goto LABEL_17;
    case 5uLL:
      id v7 = CKFrameworkBundle();
      uint64_t v8 = v7;
      uint64_t v9 = @"SHARE_BUTTON_TEXT";
      goto LABEL_17;
    case 4uLL:
      id v7 = CKFrameworkBundle();
      uint64_t v8 = v7;
      uint64_t v9 = @"VIEW_BUTTON_TEXT";
LABEL_17:
      long long v17 = [v7 localizedStringForKey:v9 value:&stru_1EDE4CA38 table:@"ChatKit"];
      goto LABEL_18;
  }
  uint64_t v8 = [v5 contact];
  int v11 = CKIsRunningInMacCatalyst();
  v12 = CKFrameworkBundle();
  v13 = v12;
  id v14 = @"UPDATE_LIST_TEXT";
  if (!v11) {
    id v14 = @"UPDATE_BUTTON_TEXT";
  }
  id v15 = @"ADD_BUTTON_TEXT";
  if (v11) {
    id v15 = @"ADD_LIST_TEXT";
  }
  if (v8) {
    long long v16 = v14;
  }
  else {
    long long v16 = v15;
  }
  long long v17 = [v12 localizedStringForKey:v16 value:&stru_1EDE4CA38 table:@"ChatKit"];

LABEL_18:

  return v17;
}

+ (id)bannerSubtitleTextWithUpdates:(id)a3 style:(unint64_t)a4
{
  id v5 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    id v6 = [(id)objc_opt_class() _catalystSubtitleTextWithUpdates:v5 style:a4];
    goto LABEL_11;
  }
  if (a4 - 2 >= 2)
  {
    if (a4 != 5)
    {
      id v6 = 0;
      goto LABEL_11;
    }
    int v10 = [(id)objc_opt_class() createContactForOutgoingShare];
  }
  else
  {
    id v7 = objc_opt_class();
    uint64_t v8 = [v5 firstObject];
    uint64_t v9 = [v8 nickname];
    int v10 = [v7 createContactFromNickname:v9];
  }
  int v11 = [MEMORY[0x1E4F1B910] stringFromContact:v10 style:0];
  id v6 = v11;
  if (v11) {
    id v12 = v11;
  }

LABEL_11:

  return v6;
}

+ (id)_catalystSubtitleTextWithUpdates:(id)a3 style:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 - 2 < 2)
  {
    long long v17 = objc_opt_class();
    long long v18 = [v6 firstObject];
    id v19 = [v18 nickname];
    uint64_t v20 = [v17 createContactFromNickname:v19];
  }
  else
  {
    if (a4 != 5)
    {
      if (a4 == 4)
      {
        id v7 = [MEMORY[0x1E4F1CA48] array];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "nickname", (void)v24);
              id v14 = [a1 createContactFromNickname:v13];

              id v15 = [v14 givenName];
              [v7 addObject:v15];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v10);
        }

        long long v16 = [v7 componentsJoinedByString:@", "];
      }
      else
      {
        long long v16 = 0;
      }
      goto LABEL_18;
    }
    uint64_t v20 = [(id)objc_opt_class() createContactForOutgoingShare];
  }
  long long v21 = [MEMORY[0x1E4F1B910] stringFromContact:v20 style:0];
  long long v16 = v21;
  if (v21) {
    id v22 = v21;
  }

LABEL_18:

  return v16;
}

+ (id)getContactDisplayName:(id)a3
{
  id v3 = a3;
  v4 = [v3 givenName];
  id v5 = [v3 givenName];
  char v6 = [v5 isEqualToString:&stru_1EDE4CA38];

  if ((v6 & 1) == 0)
  {
    uint64_t v15 = [v3 givenName];
LABEL_7:
    uint64_t v14 = v15;
    goto LABEL_11;
  }
  id v7 = [v3 familyName];
  char v8 = [v7 isEqualToString:&stru_1EDE4CA38];

  if ((v8 & 1) == 0)
  {
    uint64_t v15 = [v3 familyName];
    goto LABEL_7;
  }
  uint64_t v9 = [v3 phoneNumbers];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = [v3 phoneNumbers];
    id v12 = [v11 firstObject];

    v13 = [v12 value];
    uint64_t v14 = [v13 stringValue];
  }
  else
  {
    long long v16 = [v3 emailAddresses];
    uint64_t v17 = [v16 count];

    if (!v17) {
      goto LABEL_12;
    }
    long long v18 = [v3 emailAddresses];
    id v12 = [v18 firstObject];

    uint64_t v14 = [v12 value];
  }
  v4 = v12;
LABEL_11:

  v4 = (void *)v14;
LABEL_12:

  return v4;
}

+ (id)createContactFromNickname:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1BA40];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  char v6 = [v4 firstName];
  [v5 setGivenName:v6];

  id v7 = [v4 lastName];
  [v5 setFamilyName:v7];

  char v8 = [v4 avatar];

  uint64_t v9 = [v8 imageData];

  if (v9) {
    [v5 setImageData:v9];
  }

  return v5;
}

+ (id)createContactForOutgoingShare
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F6BD50] sharedInstance];
  id v3 = [v2 personalNickname];

  if (!v3) {
    goto LABEL_7;
  }
  id v4 = [(id)objc_opt_class() createContactFromNickname:v3];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      id v12 = v3;
      __int16 v13 = 2112;
      uint64_t v14 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Using nickname %@ for outgoing share banner with contact: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  if (!v4)
  {
LABEL_7:
    char v6 = [MEMORY[0x1E4F6E6D8] sharedInstance];
    id v7 = [MEMORY[0x1E4F6E6D8] keysForNicknameHandling];
    id v4 = [v6 fetchMeContactWithKeys:v7];

    if (IMOSLoggingEnabled())
    {
      char v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Using me contact for outgoing share banner: %@", (uint8_t *)&v11, 0xCu);
      }
    }
    if (!v4)
    {
      id v4 = +[CKMeCardSharingNameProvider nameContactForPrimaryAccount];
      if (IMOSLoggingEnabled())
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412290;
          id v12 = v4;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Using primary account contact for outgoing share banner: %@", (uint8_t *)&v11, 0xCu);
        }
      }
    }
  }

  return v4;
}

+ (id)groupPhotoUpdateTitleForUpdate:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F6E6D8] sharedInstance];
  id v5 = [v3 handleID];
  char v6 = [v4 fetchCNContactForHandleWithID:v5];

  id v7 = NSString;
  char v8 = CKFrameworkBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"GROUP_PHOTO_BANNER_UPDATE_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  if (v6) {
    +[CKNicknameUtility getContactDisplayName:v6];
  }
  else {
  uint64_t v10 = [v3 handleID];
  }
  int v11 = objc_msgSend(v7, "stringWithFormat:", v9, v10);

  id v12 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v13 = [v12 userInterfaceLayoutDirection];

  if (v13 == 1) {
    uint64_t v14 = @"\u200F";
  }
  else {
    uint64_t v14 = @"\u200E";
  }
  uint64_t v15 = [(__CFString *)v14 stringByAppendingString:v11];

  return v15;
}

+ (id)groupPhotoUpdateSubtitleForUpdate:(id)a3
{
  switch([a3 groupUpdateType])
  {
    case 1:
      id v3 = CKFrameworkBundle();
      id v4 = v3;
      id v5 = @"GROUP_NAME_ADDED_BANNER_UPDATE_SUBTITLE";
      goto LABEL_11;
    case 2:
      id v3 = CKFrameworkBundle();
      id v4 = v3;
      id v5 = @"GROUP_PHOTO_ADDED_BANNER_UPDATE_SUBTITLE";
      goto LABEL_11;
    case 3:
      id v3 = CKFrameworkBundle();
      id v4 = v3;
      id v5 = @"GROUP_PHOTO_ADDED_AND_NAME_ADDED_BANNER_UPDATE_SUBTITLE";
      goto LABEL_11;
    case 4:
      id v3 = CKFrameworkBundle();
      id v4 = v3;
      id v5 = @"GROUP_PHOTO_REMOVED_BANNER_UPDATE_SUBTITLE";
      goto LABEL_11;
    case 5:
      id v3 = CKFrameworkBundle();
      id v4 = v3;
      id v5 = @"GROUP_NAME_REMOVED_BANNER_UPDATE_SUBTITLE";
      goto LABEL_11;
    case 6:
      id v3 = CKFrameworkBundle();
      id v4 = v3;
      id v5 = @"GROUP_PHOTO_REMOVED_AND_NAME_REMOVED_BANNER_UPDATE_SUBTITLE";
      goto LABEL_11;
    case 7:
      id v3 = CKFrameworkBundle();
      id v4 = v3;
      id v5 = @"GROUP_PHOTO_REMOVED_AND_NAME_ADDED_BANNER_UPDATE_SUBTITLE";
      goto LABEL_11;
    case 8:
      id v3 = CKFrameworkBundle();
      id v4 = v3;
      id v5 = @"GROUP_PHOTO_ADDED_AND_NAME_REMOVED_BANNER_UPDATE_SUBTITLE";
LABEL_11:
      char v6 = [v3 localizedStringForKey:v5 value:&stru_1EDE4CA38 table:@"ChatKit"];

      break;
    default:
      char v6 = 0;
      break;
  }

  return v6;
}

+ (id)formattedNameWithFirstName:(id)a3 lastName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  char v8 = objc_opt_new();
  [v8 setGivenName:v6];

  [v8 setFamilyName:v5];
  uint64_t v9 = [v7 stringFromPersonNameComponents:v8];

  return v9;
}

@end