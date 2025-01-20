@interface CKMessageActionChatItem
- (id)handle;
- (id)loadTranscriptText;
- (id)sender;
- (int64_t)actionType;
@end

@implementation CKMessageActionChatItem

- (id)loadTranscriptText
{
  v3 = +[CKUIBehavior sharedBehaviors];
  v4 = [v3 transcriptRegularFontAttributes];

  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 transcriptEmphasizedFontAttributes];

  v7 = [(CKMessageActionChatItem *)self sender];
  v8 = [(CKMessageActionChatItem *)self handle];
  v9 = [v7 name];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v12 = CKFrameworkBundle();
    id v11 = [v12 localizedStringForKey:@"SOMEONE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  v13 = [v8 name];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    v16 = CKFrameworkBundle();
    id v15 = [v16 localizedStringForKey:@"SOMEONE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  int64_t v17 = [(CKMessageActionChatItem *)self actionType];
  if (v17 != 2)
  {
    if (v17 == 1)
    {
      v18 = CKFrameworkBundle();
      v19 = v18;
      v20 = @"VIDEO_SAVE_ACTION";
    }
    else
    {
      if (v17)
      {
        v25 = 0;
        if (v7) {
          goto LABEL_18;
        }
        goto LABEL_21;
      }
      v18 = CKFrameworkBundle();
      v19 = v18;
      v20 = @"AUDIO_SAVE_ACTION";
    }
    uint64_t v24 = [v18 localizedStringForKey:v20 value:&stru_1EDE4CA38 table:@"ChatKit"];
    goto LABEL_16;
  }
  v21 = [(CKChatItem *)self IMChatItem];
  v19 = [v21 balloonBundleID];

  if (v19)
  {
    v22 = [MEMORY[0x1E4F6BC18] sharedInstance];
    v23 = (void *)[v22 dataSourceClassForBundleID:v19];

    if (v23)
    {
      uint64_t v24 = [v23 previewSummaryForPluginBundle:v19];
LABEL_16:
      v25 = (void *)v24;
      goto LABEL_17;
    }
    v42 = CKFrameworkBundle();
    v25 = [v42 localizedStringForKey:@"A_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  else
  {
    v41 = CKFrameworkBundle();
    v25 = [v41 localizedStringForKey:@"A_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];

    if (!_IMWillLog()) {
      goto LABEL_17;
    }
    v42 = [(CKChatItem *)self IMChatItem];
    _IMAlwaysLog();
  }

LABEL_17:
  if (v7)
  {
LABEL_18:
    v26 = CKFrameworkBundle();
    v27 = v26;
    if (v8) {
      [v26 localizedStringForKey:@"MESSAGE_SAVE_ACTION_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    else {
    v28 = [v26 localizedStringForKey:@"MESSAGE_SAVE_YOU_ACTION_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    CKAttributedFormatString(v4, v6, v28, v34, v35, v36, v37, v38, (uint64_t)v11);
    goto LABEL_24;
  }
LABEL_21:
  v27 = CKFrameworkBundle();
  v28 = [v27 localizedStringForKey:@"MESSAGE_YOU_SAVE_ACTION_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  CKAttributedFormatString(v4, v6, v28, v29, v30, v31, v32, v33, (uint64_t)v25);
  v39 = LABEL_24:;

  return v39;
}

- (int64_t)actionType
{
  v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 actionType];

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