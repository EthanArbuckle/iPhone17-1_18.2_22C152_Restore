@interface CKGroupTitleChangeChatItem
- (BOOL)failed;
- (Class)cellClass;
- (NSString)errorText;
- (NSString)title;
- (id)loadTranscriptText;
- (id)sender;
@end

@implementation CKGroupTitleChangeChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (id)loadTranscriptText
{
  v3 = +[CKUIBehavior sharedBehaviors];
  v4 = [v3 transcriptRegularFontAttributes];

  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 transcriptEmphasizedFontAttributes];

  v7 = +[CKUIBehavior sharedBehaviors];
  v8 = [v7 transcriptGroupModificationErrorRegularFontAttributes];

  v9 = +[CKUIBehavior sharedBehaviors];
  uint64_t v10 = [v9 transcriptGroupModificationErrorEmphasizedFontAttributes];

  if ([(CKGroupTitleChangeChatItem *)self failed]) {
    v11 = v8;
  }
  else {
    v11 = v4;
  }
  id v57 = v11;
  v54 = (void *)v10;
  if ([(CKGroupTitleChangeChatItem *)self failed]) {
    v12 = (void *)v10;
  }
  else {
    v12 = v6;
  }
  id v56 = v12;
  v13 = [(CKGroupTitleChangeChatItem *)self sender];
  uint64_t v14 = [v13 name];
  v15 = (void *)v14;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  else {
    v16 = &stru_1EDE4CA38;
  }
  v55 = v16;

  uint64_t v17 = [(CKGroupTitleChangeChatItem *)self title];
  v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = &stru_1EDE4CA38;
  }
  v20 = v19;

  uint64_t v21 = [(__CFString *)v20 length];
  v22 = CKFrameworkBundle();
  v23 = v22;
  if (v13)
  {
    if (v21) {
      [v22 localizedStringForKey:@"GROUP_NAME_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    else {
    v24 = [v22 localizedStringForKey:@"GROUP_REMOVE_NAME_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    CKAttributedFormatString(v57, v56, v24, v30, v31, v32, v33, v34, (uint64_t)v55);
  }
  else if (v21)
  {
    v24 = [v22 localizedStringForKey:@"GROUP_YOU_NAME_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    CKAttributedFormatString(v57, v56, v24, v25, v26, v27, v28, v29, (uint64_t)v20);
  }
  else
  {
    v24 = [v22 localizedStringForKey:@"GROUP_YOU_REMOVE_NAME_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    CKAttributedFormatString(v57, v56, v24, v48, v49, v50, v51, v52, 0);
  v35 = };

  if ([(CKGroupTitleChangeChatItem *)self failed])
  {
    v36 = (void *)MEMORY[0x1E4F42A98];
    v37 = +[CKUIBehavior sharedBehaviors];
    v38 = [v37 transcriptLightFont];
    v39 = [v36 configurationWithFont:v38];

    v40 = [MEMORY[0x1E4F42A80] systemImageNamed:@"exclamationmark.circle" withConfiguration:v39];
    [MEMORY[0x1E4F428B8] redColor];
    v53 = v6;
    v42 = v41 = v4;
    v43 = [v40 imageWithTintColor:v42];

    id v44 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    [v44 setImage:v43];
    id v45 = [MEMORY[0x1E4F28E48] attributedStringWithAttachment:v44 attributes:v8];
    v46 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    [v45 appendAttributedString:v46];

    [v45 appendAttributedString:v35];
    v4 = v41;
    v6 = v53;
  }
  else
  {
    id v45 = v35;
  }

  return v45;
}

- (BOOL)failed
{
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 failed];

  return v3;
}

- (NSString)title
{
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 title];

  return (NSString *)v3;
}

- (NSString)errorText
{
  v2 = CKFrameworkBundle();
  char v3 = [v2 localizedStringForKey:@"GROUP_NAME_CHANGE_ERROR_ALERT_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return (NSString *)v3;
}

- (id)sender
{
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 sender];

  return v3;
}

@end