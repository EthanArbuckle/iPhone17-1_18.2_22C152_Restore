@interface UIApplicationShortcutItem(SpringBoardActionManager)
+ (id)ck_shortcutItemForConversation:()SpringBoardActionManager;
+ (id)ck_shortcutItemsForConversations:()SpringBoardActionManager maximumNumberOfShortcuts:;
@end

@implementation UIApplicationShortcutItem(SpringBoardActionManager)

+ (id)ck_shortcutItemForConversation:()SpringBoardActionManager
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    v12 = 0;
    goto LABEL_15;
  }
  uint64_t v4 = [MEMORY[0x1E4F1BB38] maxContactAvatars];
  v5 = [v3 conversationVisualIdentityWithKeys:MEMORY[0x1E4F1CBF0] requestedNumberOfContactsToFetch:v4];
  if (![v3 isGroupConversation])
  {
    v13 = [v5 contacts];
    v6 = [v13 firstObject];

    if (v6)
    {
      v11 = [MEMORY[0x1E4F42798] iconWithContact:v6];
      goto LABEL_9;
    }
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v6 = [v5 groupPhoto];
  if (!v6) {
    goto LABEL_8;
  }
  v7 = [MEMORY[0x1E4F42A80] imageWithData:v6];
  v8 = objc_msgSend(v7, "imageByPreparingThumbnailOfSize:", 35.0, 35.0);

  v9 = (void *)MEMORY[0x1E4F42798];
  v10 = objc_msgSend(v8, "ck_imageCroppedToCircle");
  v11 = [v9 iconWithCustomImage:v10 isTemplate:0];

LABEL_9:
  if ([v3 hasDisplayName]) {
    [v3 displayName];
  }
  else {
  v14 = [v3 name];
  }
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F42BD8]) initWithType:@"com.apple.mobilesms.conversation" localizedTitle:v14];
  v12 = v15;
  if (v11) {
    [v15 setIcon:v11];
  }
  v20 = @"CKSBActionUserInfoKeyChatGUID";
  v16 = [v3 chat];
  v17 = [v16 guid];
  v21[0] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  [v12 setUserInfo:v18];

LABEL_15:

  return v12;
}

+ (id)ck_shortcutItemsForConversations:()SpringBoardActionManager maximumNumberOfShortcuts:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = objc_msgSend(a1, "ck_shortcutItemForConversation:", *(void *)(*((void *)&v17 + 1) + 8 * v12), (void)v17);
      if (v13) {
        [v7 addObject:v13];
      }
      uint64_t v14 = [v7 count];

      if (v14 == a4) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v15 = (void *)[v7 copy];

  return v15;
}

@end