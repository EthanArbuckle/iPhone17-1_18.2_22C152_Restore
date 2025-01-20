@interface AAInheritanceMessageInviteContext
- (AAInheritanceMessageInviteContext)initWithLocalContact:(id)a3 beneficiaryID:(id)a4;
@end

@implementation AAInheritanceMessageInviteContext

- (AAInheritanceMessageInviteContext)initWithLocalContact:(id)a3 beneficiaryID:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"AAInheritanceMessageInviteContext.m", 17, @"Invalid parameter not satisfying: %@", @"beneficiaryID" object file lineNumber description];
  }
  BOOL v9 = +[AAUrlBagHelper isLCInviteAcceptanceEnabled];
  if (v9)
  {
    int v10 = [v7 isFamilyMember];
    v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v12 = v11;
    if (v10) {
      v13 = @"INHERITANCE_ADDED_MESSAGES_BUBBLE_BODY";
    }
    else {
      v13 = @"INHERITANCE_INVITED_MESSAGES_BUBBLE_BODY";
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v12 = v11;
    v13 = @"INHERITANCE_ADDED_MESSAGES_BUBBLE_BODY";
  }
  v14 = [v11 localizedStringForKey:v13 value:0 table:@"Localizable"];

  v15 = NSString;
  v16 = [v7 firstNameOrHandleForDisplay];
  v17 = objc_msgSend(v15, "stringWithFormat:", v14, v16);

  v18 = +[AAUniversalLinkHelper stringForBenefiaryMessagesURLWithUUID:v8];
  v19 = [MEMORY[0x1E4F1CB10] URLWithString:v18];
  if (!v19)
  {
    v20 = _AALogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[AAInheritanceMessageInviteContext initWithLocalContact:beneficiaryID:]((uint64_t)v18, v20);
    }
  }
  v21 = [(AAInheritanceMessageInviteContext *)self init];
  if (v21)
  {
    if (v9)
    {
      int v22 = [v7 isFamilyMember];
      v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      v24 = v23;
      if (v22) {
        v25 = @"INHERITANCE_ADDED_MESSAGES_BUBBLE_TITLE_REBRAND";
      }
      else {
        v25 = @"INHERITANCE_INVITED_MESSAGES_BUBBLE_TITLE_REBRAND";
      }
    }
    else
    {
      v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      v24 = v23;
      v25 = @"INHERITANCE_ADDED_MESSAGES_BUBBLE_TITLE";
    }
    v26 = [v23 localizedStringForKey:v25 value:0 table:@"Localizable"];
    [(AAMessagesInviteContext *)v21 setTitle:v26];

    v27 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v28 = [v27 localizedStringForKey:@"INHERITANCE_MESSAGES_BUBBLE_ACTION_LABEL" value:0 table:@"Localizable"];
    [(AAMessagesInviteContext *)v21 setAction:v28];

    v29 = [v7 handle];
    v33[0] = v29;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    [(AAMessagesInviteContext *)v21 setRecipients:v30];

    [(AAMessagesInviteContext *)v21 setMessageBody:v17];
    [(AAMessagesInviteContext *)v21 setInviteURL:v19];
  }

  return v21;
}

- (void)initWithLocalContact:(uint64_t)a1 beneficiaryID:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "Error creating NSURL from universal link - %@", (uint8_t *)&v2, 0xCu);
}

@end