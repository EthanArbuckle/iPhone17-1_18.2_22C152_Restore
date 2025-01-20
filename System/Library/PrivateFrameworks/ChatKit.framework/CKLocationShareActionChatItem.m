@interface CKLocationShareActionChatItem
- (id)handle;
- (id)loadTranscriptText;
- (id)sender;
- (int64_t)actionType;
- (int64_t)direction;
@end

@implementation CKLocationShareActionChatItem

- (id)loadTranscriptText
{
  v3 = +[CKUIBehavior sharedBehaviors];
  v4 = [v3 transcriptEmphasizedFontAttributes];

  v5 = [(CKLocationShareActionChatItem *)self sender];
  v6 = [(CKLocationShareActionChatItem *)self handle];
  uint64_t v7 = [v5 name];
  v8 = (void *)v7;
  v9 = &stru_1EDE4CA38;
  if (v7) {
    v10 = (__CFString *)v7;
  }
  else {
    v10 = &stru_1EDE4CA38;
  }
  v11 = v10;

  uint64_t v12 = [v6 name];
  v13 = (void *)v12;
  if (v12) {
    v14 = (__CFString *)v12;
  }
  else {
    v14 = &stru_1EDE4CA38;
  }
  v15 = v14;

  int64_t v16 = [(CKLocationShareActionChatItem *)self actionType];
  int64_t v17 = [(CKLocationShareActionChatItem *)self direction];
  if (v16 != 1)
  {
    if (v16) {
      goto LABEL_23;
    }
    if (v17 != 1)
    {
      if (!v17)
      {
        v18 = NSString;
        v19 = CKFrameworkBundle();
        v20 = v19;
        v21 = @"LOCATION_YOU_START_STATUS";
LABEL_15:
        v22 = [v19 localizedStringForKey:v21 value:&stru_1EDE4CA38 table:@"ChatKit"];
        objc_msgSend(v18, "stringWithFormat:", v22, v15);
        v26 = LABEL_19:;

        v27 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v28 = [v27 userInterfaceLayoutDirection];

        if (v28 == 1) {
          v29 = @"\u200F";
        }
        else {
          v29 = @"\u200E";
        }
        v9 = [(__CFString *)v29 stringByAppendingString:v26];

        goto LABEL_23;
      }
      goto LABEL_23;
    }
    v23 = NSString;
    v24 = CKFrameworkBundle();
    v20 = v24;
    v25 = @"LOCATION_START_YOU_STATUS";
LABEL_18:
    v22 = [v24 localizedStringForKey:v25 value:&stru_1EDE4CA38 table:@"ChatKit"];
    objc_msgSend(v23, "stringWithFormat:", v22, v11);
    goto LABEL_19;
  }
  if (v17 == 1)
  {
    v23 = NSString;
    v24 = CKFrameworkBundle();
    v20 = v24;
    v25 = @"LOCATION_STOP_YOU_STATUS";
    goto LABEL_18;
  }
  if (!v17)
  {
    v18 = NSString;
    v19 = CKFrameworkBundle();
    v20 = v19;
    v21 = @"LOCATION_YOU_STOP_STATUS";
    goto LABEL_15;
  }
LABEL_23:
  v30 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v9 attributes:0];
  objc_msgSend(v30, "replaceCharactersInRange:withString:", 0, 0, @" ");
  id v31 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  v32 = +[CKUIBehavior sharedBehaviors];
  v33 = [v32 locationShareActionIcon];
  [v31 setImage:v33];

  v34 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v31];
  [v30 insertAttributedString:v34 atIndex:0];

  objc_msgSend(v30, "addAttributes:range:", v4, 0, objc_msgSend(v30, "length"));

  return v30;
}

- (int64_t)actionType
{
  v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 actionType];

  return v3;
}

- (int64_t)direction
{
  v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 direction];

  return v3;
}

- (id)sender
{
  v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 sender];

  return v3;
}

- (id)handle
{
  v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 otherHandle];

  return v3;
}

@end