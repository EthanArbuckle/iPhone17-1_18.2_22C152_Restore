@interface SMSApplicationIntentsHelper
+ (BOOL)continueWithSendMessageInteraction:(id)a3 chatRegistry:(id)a4 navigationProvider:(id)a5 conversationList:(id)a6 chatController:(id)a7;
+ (BOOL)isSendMessageInteraction:(id)a3;
@end

@implementation SMSApplicationIntentsHelper

+ (BOOL)isSendMessageInteraction:(id)a3
{
  if (a3)
  {
    v3 = [a3 intent];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

+ (BOOL)continueWithSendMessageInteraction:(id)a3 chatRegistry:(id)a4 navigationProvider:(id)a5 conversationList:(id)a6 chatController:(id)a7
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v73 = a4;
  id v67 = a5;
  id v70 = a6;
  id v69 = a7;
  v71 = v11;
  [v11 intent];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v72 = long long v84 = 0u;
  v12 = [v72 attachments];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v81 objects:v86 count:16];
  unint64_t v14 = 0x1E4F28000uLL;
  if (!v13)
  {
    v16 = 0;
    goto LABEL_27;
  }
  uint64_t v15 = v13;
  v16 = 0;
  v74 = v12;
  uint64_t v75 = *(void *)v82;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v82 != v75) {
        objc_enumerationMutation(v12);
      }
      v18 = *(void **)(*((void *)&v81 + 1) + 8 * i);
      v19 = objc_msgSend(v18, "sharedLink", v67);

      if (v19)
      {
        id v20 = objc_alloc(*(Class *)(v14 + 2840));
        v21 = [v18 sharedLink];
        v22 = [v21 absoluteString];
        id v23 = (id)[v20 initWithString:v22 attributes:0];

        v24 = [[CKComposition alloc] initWithText:v23 subject:0];
        v25 = v24;
        if (v16)
        {
          uint64_t v26 = [(CKComposition *)v16 compositionByAppendingComposition:v24];

          v16 = (CKComposition *)v26;
        }
        else
        {
          v25 = v24;
          v16 = v25;
        }
      }
      else
      {
        v27 = [v18 file];

        if (!v27) {
          continue;
        }
        v28 = [v18 file];
        v29 = [v28 typeIdentifier];
        if ([v29 isEqual:@"com.apple.live-photo"])
        {
          v30 = [v18 file];
          v31 = [v30 fileURL];
          v32 = [v31 pathExtension];
          char v33 = [v32 isEqualToIgnoringCase:@"mov"];

          if (v33)
          {
            unint64_t v14 = 0x1E4F28000;
            v12 = v74;
            continue;
          }
        }
        else
        {
        }
        v25 = [MEMORY[0x1E4F6C348] defaultHFSFileManager];
        v34 = [v18 file];
        v35 = [v34 fileURL];

        v36 = [v35 lastPathComponent];
        v37 = [(CKComposition *)v25 im_randomTemporaryFileURLWithFileName:v36];

        id v80 = 0;
        LODWORD(v36) = [(CKComposition *)v25 im_copySecurityScopedResourceAtURL:v35 toDestination:v37 error:&v80];
        id v23 = v80;
        if (v36)
        {
          v38 = +[CKMediaObjectManager sharedInstance];
          v39 = [v38 mediaObjectWithFileURL:v37 filename:0 transcoderUserInfo:0];

          if (v16)
          {
            uint64_t v40 = [(CKComposition *)v16 compositionByAppendingMediaObject:v39];

            v16 = (CKComposition *)v40;
          }
          else
          {
            v16 = +[CKComposition compositionWithMediaObject:v39 subject:0];
          }
          unint64_t v14 = 0x1E4F28000;
        }
        else
        {
          unint64_t v14 = 0x1E4F28000;
        }
        v12 = v74;
      }
    }
    uint64_t v15 = [v12 countByEnumeratingWithState:&v81 objects:v86 count:16];
  }
  while (v15);
LABEL_27:

  v41 = [v72 content];
  if ([v41 length])
  {
    v42 = (void *)[objc_alloc(*(Class *)(v14 + 2840)) initWithString:v41 attributes:0];
    if (v16)
    {
      uint64_t v43 = [(CKComposition *)v16 compositionByAppendingText:v42];

      v16 = (CKComposition *)v43;
    }
    else
    {
      v16 = [[CKComposition alloc] initWithText:v42 subject:0];
    }
  }
  v44 = objc_msgSend(v72, "conversationIdentifier", v67);
  id v45 = [v73 existingChatWithGUID:v44];

  v46 = [v72 speakableGroupName];
  v47 = v46;
  if (!v45 && v46)
  {
    v48 = [v46 vocabularyIdentifier];
    id v45 = [v73 existingChatWithGUID:v48];
  }
  if (!v45 && v47)
  {
    v49 = [v47 spokenPhrase];
    id v45 = [v73 existingChatWithDisplayName:v49];
  }
  if (v45)
  {
LABEL_51:
    v51 = [v70 conversationForExistingChat:v45];
    id v59 = v69;
    uint64_t v60 = [v71 intentHandlingStatus];
    v61 = [v59 conversation];
    if ([v61 isEqual:v51])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v63 = v59;
        v64 = v63;
        if (v60 != 3)
        {
          [v63 setComposition:v16];
          [v64 showKeyboardForReply];
        }

        v65 = v68;
LABEL_60:

        goto LABEL_61;
      }
    }
    else
    {
    }
    if (v60 != 3) {
      [v51 setUnsentComposition:v16];
    }
    v65 = v68;
    [v68 showConversation:v51 animate:1];
    goto LABEL_60;
  }
  v50 = [v72 valueForKeyPath:@"recipients.personHandle.value"];
  v51 = [MEMORY[0x1E4F1CA48] array];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v45 = v50;
  uint64_t v52 = [v45 countByEnumeratingWithState:&v76 objects:v85 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v77;
    do
    {
      for (uint64_t j = 0; j != v53; ++j)
      {
        if (*(void *)v77 != v54) {
          objc_enumerationMutation(v45);
        }
        uint64_t v56 = *(void *)(*((void *)&v76 + 1) + 8 * j);
        if (v56)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v51 addObject:v56];
          }
        }
      }
      uint64_t v53 = [v45 countByEnumeratingWithState:&v76 objects:v85 count:16];
    }
    while (v53);
  }

  v57 = (void *)[v51 copy];
  uint64_t v58 = [v73 existingChatWithAddresses:v57 allowAlternativeService:0 bestHandles:0];

  if (v58)
  {

    id v45 = (id)v58;
    goto LABEL_51;
  }
  v65 = v68;
  [v68 showNewMessageCompositionPanelWithRecipients:v45 composition:v16 chatID:0 animated:1];
LABEL_61:

  return 1;
}

@end