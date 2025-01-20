@interface CKContextMenuGenerator
+ (BOOL)_shouldShowPrivateMessageOptionForHandle:(id)a3 conversation:(id)a4;
+ (BOOL)supportsRelayPhoneCallsCalls;
+ (id)_menuActionToInitiateFaceTimeAudioForConversation:(id)a3 andContactsManager:(id)a4;
+ (id)_menuActionToInitiateFaceTimeVideoForConversation:(id)a3 andContactsManager:(id)a4;
+ (id)_menuActionToInviteHandleToShareTheirScreen:(id)a3 conversation:(id)a4 andContactsManager:(id)a5;
+ (id)_menuActionToSendEmailForConversation:(id)a3 andContactsManager:(id)a4;
+ (id)_menuActionToShareMyScreenWithHandle:(id)a3 conversation:(id)a4 andContactsManager:(id)a5;
+ (id)menuActionToCreateContactForID:(id)a3 handler:(id)a4;
+ (id)menuActionToDisplayRecipientForHandle:(id)a3;
+ (id)menuActionToInitiateFaceTimeAudioWithHandle:(id)a3 andContactsManager:(id)a4;
+ (id)menuActionToInitiateFaceTimeVideoWithHandle:(id)a3 andContactsManager:(id)a4;
+ (id)menuActionToOpenContactCardForContact:(id)a3;
+ (id)menuActionToRemoveHandle:(id)a3 fromConversation:(id)a4;
+ (id)menuActionToSendEmailToAddress:(id)a3;
+ (id)menuActionToSendPrivateMessageToHandleID:(id)a3;
+ (id)menuActionToShowIDAsLargeType:(id)a3 handler:(id)a4;
+ (id)menuActionsToInitiateRelayPhoneCallWithHandle:(id)a3;
+ (id)menuForNamedGroupConversation:(id)a3 andContactsManager:(id)a4;
+ (id)recipientSubmenuForHandle:(id)a3;
+ (id)relayPhoneCallActionTextForPhoneNumber:(id)a3;
+ (id)subMenuForScreenSharingOptionsWithHandle:(id)a3 conversation:(id)a4 andContactsManager:(id)a5;
+ (id)submenuForIndividualParticipantWithHandle:(id)a3 forConversation:(id)a4 includeAddToContactsAction:(BOOL)a5 includeRemoveAction:(BOOL)a6;
@end

@implementation CKContextMenuGenerator

+ (id)recipientSubmenuForHandle:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[CKContextMenuGenerator menuActionToDisplayRecipientForHandle:a3];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E4F42B80];
    v9[0] = v3;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    v7 = [v5 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)menuActionToDisplayRecipientForHandle:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && ([v3 ID], v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v6 = [v4 ID];
    if (((MEMORY[0x192FBA6E0]() & 1) != 0 || IMStringIsEmail())
      && (IMFormattedDisplayStringForNumber(), (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = (void *)v8;
      v7 = [MEMORY[0x1E4F426E8] actionWithTitle:v8 image:0 identifier:0 handler:&__block_literal_global_59];
      [v7 setAttributes:1];
      [v7 setState:1];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)submenuForIndividualParticipantWithHandle:(id)a3 forConversation:(id)a4 includeAddToContactsAction:(BOOL)a5 includeRemoveAction:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  v11 = [MEMORY[0x1E4F1CA48] arrayWithArray:MEMORY[0x1E4F1CBF0]];
  if (v6)
  {
    v12 = +[CKContextMenuGenerator menuActionToRemoveHandle:v9 fromConversation:v10];
    if (v12) {
      [v11 addObject:v12];
    }
  }
  if ([a1 _shouldShowPrivateMessageOptionForHandle:v9 conversation:v10])
  {
    v13 = [v9 ID];
    v14 = +[CKContextMenuGenerator menuActionToSendPrivateMessageToHandleID:v13];

    if (v14) {
      [v11 addObject:v14];
    }
  }
  v15 = [v9 email];

  if (v15)
  {
    v16 = [v9 email];
    v17 = +[CKContextMenuGenerator menuActionToSendEmailToAddress:v16];

    if (v17) {
      [v11 addObject:v17];
    }
  }
  v18 = [v9 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];
  if (v18 && [MEMORY[0x1E4F6E6D8] isCNContactAKnownContact:v18])
  {
    v19 = +[CKContextMenuGenerator menuActionToOpenContactCardForContact:v18];
    if (v19) {
      [v11 addObject:v19];
    }
  }
  if ([v11 count])
  {
    v20 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v11];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)menuActionToRemoveHandle:(id)a3 fromConversation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  uint64_t v8 = 0;
  if (v5 && v6)
  {
    id v9 = (void *)MEMORY[0x1E4F426E8];
    id v10 = CKFrameworkBundle();
    v11 = [v10 localizedStringForKey:@"REMOVE_RECIPIENT" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__CKContextMenuGenerator_menuActionToRemoveHandle_fromConversation___block_invoke;
    v13[3] = &unk_1E5624B40;
    id v14 = v7;
    id v15 = v5;
    uint64_t v8 = [v9 actionWithTitle:v11 image:0 identifier:0 handler:v13];
  }

  return v8;
}

void __68__CKContextMenuGenerator_menuActionToRemoveHandle_fromConversation___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(void *)(a1 + 40);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 removeRecipientHandles:v2];
}

+ (id)menuActionToSendPrivateMessageToHandleID:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 length])
  {
    id v5 = (void *)MEMORY[0x1E4F426E8];
    id v6 = CKFrameworkBundle();
    v7 = [v6 localizedStringForKey:@"SEND_PRIVATE_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__CKContextMenuGenerator_menuActionToSendPrivateMessageToHandleID___block_invoke;
    v10[3] = &unk_1E56211C8;
    id v11 = v4;
    uint64_t v8 = [v5 actionWithTitle:v7 image:0 identifier:0 handler:v10];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __67__CKContextMenuGenerator_menuActionToSendPrivateMessageToHandleID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [NSString stringWithFormat:@"sms://open?addresses=%@", *(void *)(a1 + 32)];
  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  id v6 = v5;
  if (v5)
  {
    v7 = (void *)*MEMORY[0x1E4F43630];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __67__CKContextMenuGenerator_menuActionToSendPrivateMessageToHandleID___block_invoke_58;
    v9[3] = &unk_1E5620BF0;
    id v10 = v5;
    [v7 openURL:v10 withCompletionHandler:v9];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Unable to create NSURL with urlString: %@", buf, 0xCu);
    }
  }
}

void __67__CKContextMenuGenerator_menuActionToSendPrivateMessageToHandleID___block_invoke_58(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = @"Failed";
      uint64_t v6 = *(void *)(a1 + 32);
      if (a2) {
        id v5 = @"Succeeded";
      }
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Opening private conversation URL: %@ %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

+ (id)menuActionToSendEmailToAddress:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 length])
  {
    id v5 = (void *)MEMORY[0x1E4F426E8];
    uint64_t v6 = CKFrameworkBundle();
    int v7 = [v6 localizedStringForKey:@"SEND_EMAIL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__CKContextMenuGenerator_menuActionToSendEmailToAddress___block_invoke;
    v10[3] = &unk_1E56211C8;
    id v11 = v4;
    uint64_t v8 = [v5 actionWithTitle:v7 image:0 identifier:0 handler:v10];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __57__CKContextMenuGenerator_menuActionToSendEmailToAddress___block_invoke(uint64_t a1)
{
  id v2 = [NSString alloc];
  id v3 = *(void **)(a1 + 32);
  v4 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
  id v5 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v4];
  id v7 = (id)[v2 initWithFormat:@"mailto:%@", v5];

  if ([v7 length])
  {
    uint64_t v6 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    [(id)*MEMORY[0x1E4F43630] openURL:v6 withCompletionHandler:0];
  }
}

+ (id)menuActionToOpenContactCardForContact:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  id v5 = [v3 identifier];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 identifier];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F426E8];
    __int16 v9 = CKFrameworkBundle();
    id v10 = [v9 localizedStringForKey:@"SHOW_CONTACT_CARD" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__CKContextMenuGenerator_menuActionToOpenContactCardForContact___block_invoke;
    v12[3] = &unk_1E56211C8;
    id v13 = v4;
    id v5 = [v8 actionWithTitle:v10 image:0 identifier:0 handler:v12];
  }
  else
  {
LABEL_5:
    id v5 = 0;
  }
LABEL_6:

  return v5;
}

void __64__CKContextMenuGenerator_menuActionToOpenContactCardForContact___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F28E78] stringWithString:@"addressbook://"];
  id v2 = [*(id *)(a1 + 32) identifier];
  [v5 appendString:v2];

  id v3 = (void *)*MEMORY[0x1E4F43630];
  v4 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  [v3 openURL:v4 withCompletionHandler:0];
}

+ (id)menuActionToCreateContactForID:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 _appearsToBeBusinessID])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F426E8];
    __int16 v9 = CKFrameworkBundle();
    id v10 = [v9 localizedStringForKey:@"ADD_TO_CONTACTS…" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__CKContextMenuGenerator_menuActionToCreateContactForID_handler___block_invoke;
    v12[3] = &unk_1E5624D20;
    id v14 = v6;
    id v13 = v5;
    uint64_t v7 = [v8 actionWithTitle:v10 image:0 identifier:0 handler:v12];
  }

  return v7;
}

uint64_t __65__CKContextMenuGenerator_menuActionToCreateContactForID_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 32), 0);
  }
  return result;
}

+ (id)menuActionToShowIDAsLargeType:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 _appearsToBeEmail] & 1) != 0 || (objc_msgSend(v5, "_appearsToBeBusinessID"))
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F426E8];
    __int16 v9 = CKFrameworkBundle();
    id v10 = [v9 localizedStringForKey:@"LARGE_TYPE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__CKContextMenuGenerator_menuActionToShowIDAsLargeType_handler___block_invoke;
    v12[3] = &unk_1E5624D20;
    id v14 = v6;
    id v13 = v5;
    uint64_t v7 = [v8 actionWithTitle:v10 image:0 identifier:0 handler:v12];
  }

  return v7;
}

uint64_t __64__CKContextMenuGenerator_menuActionToShowIDAsLargeType_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, *(void *)(a1 + 32), 1);
  }
  return result;
}

+ (id)subMenuForScreenSharingOptionsWithHandle:(id)a3 conversation:(id)a4 andContactsManager:(id)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[CKContextMenuGenerator _menuActionToShareMyScreenWithHandle:v9 conversation:v8 andContactsManager:v7];
  id v11 = +[CKContextMenuGenerator _menuActionToInviteHandleToShareTheirScreen:v9 conversation:v8 andContactsManager:v7];

  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    id v15 = 0;
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F42B80];
    v17[0] = v10;
    v17[1] = v11;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    id v15 = [v13 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v14];
  }

  return v15;
}

+ (id)_menuActionToShareMyScreenWithHandle:(id)a3 conversation:(id)a4 andContactsManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7 && ([v7 ID], id v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    id v11 = (void *)MEMORY[0x1E4F426E8];
    BOOL v12 = CKFrameworkBundle();
    id v13 = [v12 localizedStringForKey:@"INVITE_TO_SHARE_MY_SCREEN" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __95__CKContextMenuGenerator__menuActionToShareMyScreenWithHandle_conversation_andContactsManager___block_invoke;
    v16[3] = &unk_1E5624B40;
    id v17 = v9;
    id v18 = v8;
    id v14 = [v11 actionWithTitle:v13 image:0 identifier:0 handler:v16];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void __95__CKContextMenuGenerator__menuActionToShareMyScreenWithHandle_conversation_andContactsManager___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) recipient];
  [v1 shareMyScreenWithEntity:v2];
}

+ (id)_menuActionToInviteHandleToShareTheirScreen:(id)a3 conversation:(id)a4 andContactsManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7 && ([v7 ID], id v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    id v11 = (void *)MEMORY[0x1E4F426E8];
    BOOL v12 = CKFrameworkBundle();
    id v13 = [v12 localizedStringForKey:@"ASK_TO_SHARE_THEIR_SCREEN" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __102__CKContextMenuGenerator__menuActionToInviteHandleToShareTheirScreen_conversation_andContactsManager___block_invoke;
    v16[3] = &unk_1E5624B40;
    id v17 = v9;
    id v18 = v8;
    id v14 = [v11 actionWithTitle:v13 image:0 identifier:0 handler:v16];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void __102__CKContextMenuGenerator__menuActionToInviteHandleToShareTheirScreen_conversation_andContactsManager___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) recipient];
  [v1 inviteEntityToShareTheirScreen:v2];
}

+ (id)menuActionToInitiateFaceTimeAudioWithHandle:(id)a3 andContactsManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  id v8 = 0;
  if (v5 && v6)
  {
    id v9 = (void *)MEMORY[0x1E4F426E8];
    id v10 = CKFrameworkBundle();
    id v11 = [v10 localizedStringForKey:@"FACE_TIME_AUDIO" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __89__CKContextMenuGenerator_menuActionToInitiateFaceTimeAudioWithHandle_andContactsManager___block_invoke;
    v13[3] = &unk_1E5624B40;
    id v14 = v5;
    id v15 = v7;
    id v8 = [v9 actionWithTitle:v11 image:0 identifier:0 handler:v13];
  }

  return v8;
}

void __89__CKContextMenuGenerator_menuActionToInitiateFaceTimeAudioWithHandle_andContactsManager___block_invoke(uint64_t a1)
{
  id v2 = [[CKEntity alloc] initWithIMHandle:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) startCommunicationForEntity:v2 action:1 address:0];
}

+ (id)menuActionToInitiateFaceTimeVideoWithHandle:(id)a3 andContactsManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  id v8 = 0;
  if (v5 && v6)
  {
    id v9 = (void *)MEMORY[0x1E4F426E8];
    id v10 = CKFrameworkBundle();
    id v11 = [v10 localizedStringForKey:@"FACE_TIME" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __89__CKContextMenuGenerator_menuActionToInitiateFaceTimeVideoWithHandle_andContactsManager___block_invoke;
    v13[3] = &unk_1E5624B40;
    id v14 = v5;
    id v15 = v7;
    id v8 = [v9 actionWithTitle:v11 image:0 identifier:0 handler:v13];
  }

  return v8;
}

void __89__CKContextMenuGenerator_menuActionToInitiateFaceTimeVideoWithHandle_andContactsManager___block_invoke(uint64_t a1)
{
  id v2 = [[CKEntity alloc] initWithIMHandle:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) startCommunicationForEntity:v2 action:0 address:0];
}

+ (id)menuActionsToInitiateRelayPhoneCallWithHandle:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = +[CKContextMenuGenerator supportsRelayPhoneCallsCalls];
  uint64_t v5 = MEMORY[0x1E4F1CBF0];
  id v21 = [MEMORY[0x1E4F1CA48] arrayWithArray:MEMORY[0x1E4F1CBF0]];
  uint64_t v6 = [v3 cnContactWithKeys:v5];
  id v7 = (void *)v6;
  if (v4 && v6 != 0)
  {
    v20 = (void *)v6;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = [MEMORY[0x1E4F6E6D8] phoneNumbersForCNContact:v6];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      BOOL v12 = 0;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v9);
          }
          id v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v15 _appearsToBePhoneNumber])
          {
            v16 = (void *)MEMORY[0x1E4F426E8];
            id v17 = +[CKContextMenuGenerator relayPhoneCallActionTextForPhoneNumber:v15];
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __72__CKContextMenuGenerator_menuActionsToInitiateRelayPhoneCallWithHandle___block_invoke;
            v22[3] = &unk_1E56211C8;
            v22[4] = v15;
            uint64_t v18 = [v16 actionWithTitle:v17 image:0 identifier:0 handler:v22];

            if (v18) {
              [v21 addObject:v18];
            }
            BOOL v12 = (void *)v18;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }
    else
    {
      BOOL v12 = 0;
    }

    id v7 = v20;
  }

  return v21;
}

void __72__CKContextMenuGenerator_menuActionsToInitiateRelayPhoneCallWithHandle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    BOOL v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Initiating relay phone call.", (uint8_t *)&v12, 2u);
    }
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4FADAB0]);
  id v6 = objc_alloc(MEMORY[0x1E4FADBC0]);
  id v7 = [v5 defaultProvider];
  id v8 = (void *)[v6 initWithProvider:v7];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FADBD8]) initWithType:2 value:*(void *)(a1 + 32)];
  [v8 setHandle:v9];
  uint64_t v10 = [v8 URL];
  if (v10)
  {
    [(id)*MEMORY[0x1E4F43630] openURL:v10 withCompletionHandler:&__block_literal_global_105];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "CKContextMenuGenerator: Relay phone call: Couldn't get URL from dial request %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

void __72__CKContextMenuGenerator_menuActionsToInitiateRelayPhoneCallWithHandle___block_invoke_103(uint64_t a1, int a2)
{
  int v3 = IMOSLoggingEnabled();
  if (a2)
  {
    if (!v3) {
      return;
    }
    BOOL v4 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    __int16 v8 = 0;
    id v5 = "Successfully initiated relay phone call";
    id v6 = (uint8_t *)&v8;
    goto LABEL_8;
  }
  if (!v3) {
    return;
  }
  BOOL v4 = OSLogHandleForIMFoundationCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    __int16 v7 = 0;
    id v5 = "CKContextMenuGenerator: Attempt to open relay phone call request URL failed.";
    id v6 = (uint8_t *)&v7;
LABEL_8:
    _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
  }
LABEL_9:
}

+ (BOOL)supportsRelayPhoneCallsCalls
{
  return +[CKFaceTimeUtilities isTelephonyAvailable];
}

+ (id)relayPhoneCallActionTextForPhoneNumber:(id)a3
{
  int v3 = (void *)MEMORY[0x1E4FADA80];
  BOOL v4 = CKFormattedPhoneNumberFromNumber(a3);
  id v5 = [v3 supplementalDialTelephonyCallStringForDestination:v4 isPhoneNumber:1];

  return v5;
}

+ (id)menuForNamedGroupConversation:(id)a3 andContactsManager:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 isGroupConversation]
    && ([v5 displayName], __int16 v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    __int16 v8 = objc_opt_new();
    id v9 = objc_opt_new();
    uint64_t v10 = +[CKContextMenuGenerator _menuActionToInitiateFaceTimeVideoForConversation:v5 andContactsManager:v6];
    uint64_t v11 = +[CKContextMenuGenerator _menuActionToInitiateFaceTimeAudioForConversation:v5 andContactsManager:v6];
    if (v10) {
      [v9 addObject:v10];
    }
    if (v11) {
      [v9 addObject:v11];
    }
    if ([v9 count])
    {
      int v12 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v9];
      [v8 addObject:v12];
    }
    uint64_t v13 = +[CKContextMenuGenerator _menuActionToSendEmailForConversation:v5 andContactsManager:v6];
    uint64_t v14 = (void *)v13;
    if (v13)
    {
      id v15 = (void *)MEMORY[0x1E4F42B80];
      v20[0] = v13;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      id v17 = [v15 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v16];
      [v8 addObject:v17];
    }
    if ([v8 count])
    {
      uint64_t v18 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 children:v8];
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

+ (id)_menuActionToInitiateFaceTimeVideoForConversation:(id)a3 andContactsManager:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  __int16 v7 = 0;
  if (a3 && v5)
  {
    __int16 v8 = (void *)MEMORY[0x1E4F426E8];
    id v9 = CKFrameworkBundle();
    uint64_t v10 = [v9 localizedStringForKey:@"FACE_TIME" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __95__CKContextMenuGenerator__menuActionToInitiateFaceTimeVideoForConversation_andContactsManager___block_invoke;
    v12[3] = &unk_1E56211C8;
    id v13 = v6;
    __int16 v7 = [v8 actionWithTitle:v10 image:0 identifier:0 handler:v12];
  }

  return v7;
}

uint64_t __95__CKContextMenuGenerator__menuActionToInitiateFaceTimeVideoForConversation_andContactsManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginFacetimeCallWithVideo:1];
}

+ (id)_menuActionToInitiateFaceTimeAudioForConversation:(id)a3 andContactsManager:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  __int16 v7 = 0;
  if (a3 && v5)
  {
    __int16 v8 = (void *)MEMORY[0x1E4F426E8];
    id v9 = CKFrameworkBundle();
    uint64_t v10 = [v9 localizedStringForKey:@"FACE_TIME_AUDIO" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __95__CKContextMenuGenerator__menuActionToInitiateFaceTimeAudioForConversation_andContactsManager___block_invoke;
    v12[3] = &unk_1E56211C8;
    id v13 = v6;
    __int16 v7 = [v8 actionWithTitle:v10 image:0 identifier:0 handler:v12];
  }

  return v7;
}

uint64_t __95__CKContextMenuGenerator__menuActionToInitiateFaceTimeAudioForConversation_andContactsManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginFacetimeCallWithVideo:0];
}

+ (id)_menuActionToSendEmailForConversation:(id)a3 andContactsManager:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  __int16 v7 = 0;
  if (a3 && v5)
  {
    __int16 v8 = (void *)MEMORY[0x1E4F426E8];
    id v9 = CKFrameworkBundle();
    uint64_t v10 = [v9 localizedStringForKey:@"SEND_EMAIL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __83__CKContextMenuGenerator__menuActionToSendEmailForConversation_andContactsManager___block_invoke;
    v12[3] = &unk_1E56211C8;
    id v13 = v6;
    __int16 v7 = [v8 actionWithTitle:v10 image:0 identifier:0 handler:v12];
  }

  return v7;
}

uint64_t __83__CKContextMenuGenerator__menuActionToSendEmailForConversation_andContactsManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendEmail];
}

+ (BOOL)_shouldShowPrivateMessageOptionForHandle:(id)a3 conversation:(id)a4
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = [a4 chat];
  id v5 = [v4 participants];
  BOOL v6 = (unint64_t)[v5 count] > 1;

  return v6;
}

@end