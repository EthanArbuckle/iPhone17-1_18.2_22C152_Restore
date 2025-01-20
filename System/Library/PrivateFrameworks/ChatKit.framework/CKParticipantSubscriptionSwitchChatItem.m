@interface CKParticipantSubscriptionSwitchChatItem
- (id)handle;
- (id)loadTranscriptText;
- (id)sender;
@end

@implementation CKParticipantSubscriptionSwitchChatItem

- (id)loadTranscriptText
{
  v3 = +[CKUIBehavior sharedBehaviors];
  v4 = [v3 transcriptRegularFontAttributes];

  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 transcriptEmphasizedFontAttributes];

  v7 = [(CKParticipantSubscriptionSwitchChatItem *)self handle];
  uint64_t v8 = [v7 name];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = &stru_1EDE4CA38;
  }
  v11 = v10;

  v12 = CKFrameworkBundle();
  v13 = [v12 localizedStringForKey:@"GROUP_SUBSCRIPTION_CHANGE_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v19 = CKAttributedFormatString(v4, v6, v13, v14, v15, v16, v17, v18, (uint64_t)v11);

  return v19;
}

- (id)handle
{
  v2 = [(CKChatItem *)self IMChatItem];
  v3 = [v2 otherHandle];

  return v3;
}

- (id)sender
{
  v2 = [(CKChatItem *)self IMChatItem];
  v3 = [v2 sender];

  return v3;
}

@end