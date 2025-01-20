@interface CKGroupActionChatItem
- (BOOL)failed;
- (IMHandle)sender;
- (NSArray)fileTransferGUIDs;
- (NSString)errorText;
- (id)loadTranscriptText;
- (int64_t)actionType;
@end

@implementation CKGroupActionChatItem

- (id)loadTranscriptText
{
  v3 = +[CKUIBehavior sharedBehaviors];
  v4 = [v3 transcriptRegularFontAttributes];

  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 transcriptEmphasizedFontAttributes];

  v7 = +[CKUIBehavior sharedBehaviors];
  v8 = [v7 transcriptGroupModificationErrorRegularFontAttributes];

  v9 = +[CKUIBehavior sharedBehaviors];
  v10 = [v9 transcriptGroupModificationErrorEmphasizedFontAttributes];

  v11 = [(CKGroupActionChatItem *)self sender];
  uint64_t v12 = [v11 name];
  v13 = (void *)v12;
  v14 = &stru_1EDE4CA38;
  if (v12) {
    v14 = (__CFString *)v12;
  }
  v15 = v14;

  if ([(CKGroupActionChatItem *)self failed]) {
    v16 = v8;
  }
  else {
    v16 = v4;
  }
  id v54 = v16;
  if ([(CKGroupActionChatItem *)self failed]) {
    v17 = v10;
  }
  else {
    v17 = v6;
  }
  id v53 = v17;
  int64_t v18 = [(CKGroupActionChatItem *)self actionType];
  v52 = v15;
  if (v18 == 2)
  {
    v20 = CKFrameworkBundle();
    if (v11)
    {
      v21 = @"GROUP_DELETE_PHOTO_STATUS";
LABEL_26:
      v25 = [v20 localizedStringForKey:v21 value:&stru_1EDE4CA38 table:@"ChatKit"];
      CKAttributedFormatString(v54, v53, v25, v31, v32, v33, v34, v35, (uint64_t)v15);
      goto LABEL_27;
    }
    v24 = @"GROUP_YOU_DELETE_PHOTO_STATUS";
LABEL_23:
    v23 = v20;
    goto LABEL_24;
  }
  if (v18 == 1)
  {
    v20 = CKFrameworkBundle();
    if (v11)
    {
      v21 = @"GROUP_UPDATE_PHOTO_STATUS";
      goto LABEL_26;
    }
    v24 = @"GROUP_YOU_UPDATE_PHOTO_STATUS";
    goto LABEL_23;
  }
  if (v18)
  {
    v22 = 0;
    goto LABEL_28;
  }
  if (v11)
  {
    int v19 = [v11 isBusiness];
    v20 = CKFrameworkBundle();
    if (v19) {
      v21 = @"BIA_LEAVE_CONVERSATION";
    }
    else {
      v21 = @"GROUP_LEAVE_STATUS";
    }
    goto LABEL_26;
  }
  v23 = CKFrameworkBundle();
  v20 = v23;
  v24 = @"GROUP_YOU_LEAVE_STATUS";
LABEL_24:
  v25 = [v23 localizedStringForKey:v24 value:&stru_1EDE4CA38 table:@"ChatKit"];
  CKAttributedFormatString(v54, v53, v25, v26, v27, v28, v29, v30, 0);
  v22 = LABEL_27:;

LABEL_28:
  if ([(CKGroupActionChatItem *)self failed])
  {
    v36 = (void *)MEMORY[0x1E4F42A98];
    v37 = +[CKUIBehavior sharedBehaviors];
    v38 = [v37 transcriptLightFont];
    v51 = [v36 configurationWithFont:v38];

    v39 = [MEMORY[0x1E4F42A80] systemImageNamed:@"exclamationmark.circle" withConfiguration:v51];
    v40 = [MEMORY[0x1E4F428B8] redColor];
    v41 = [v39 imageWithTintColor:v40];

    id v42 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    [v42 setImage:v41];
    id v43 = [MEMORY[0x1E4F28E48] attributedStringWithAttachment:v42 attributes:v8];
    v44 = v11;
    v45 = v8;
    v46 = v10;
    v47 = v6;
    v48 = v4;
    v49 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    [v43 appendAttributedString:v49];

    v4 = v48;
    v6 = v47;
    v10 = v46;
    v8 = v45;
    v11 = v44;
    [v43 appendAttributedString:v22];
  }
  else
  {
    id v43 = v22;
  }

  return v43;
}

- (int64_t)actionType
{
  v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 actionType];

  return v3;
}

- (IMHandle)sender
{
  v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 sender];

  return (IMHandle *)v3;
}

- (BOOL)failed
{
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 failed];

  return v3;
}

- (NSString)errorText
{
  if ([(CKGroupActionChatItem *)self actionType])
  {
    v2 = CKFrameworkBundle();
    char v3 = [v2 localizedStringForKey:@"GROUP_PHOTO_CHANGE_ERROR_ALERT_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  else
  {
    char v3 = 0;
  }

  return (NSString *)v3;
}

- (NSArray)fileTransferGUIDs
{
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 fileTransferGUIDs];

  return (NSArray *)v3;
}

@end