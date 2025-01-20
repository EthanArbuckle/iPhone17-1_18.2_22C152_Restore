@interface CKMessageReplyCountChatItem
- (BOOL)shouldHideDuringDarkFSM;
- (Class)cellClass;
- (char)transcriptOrientation;
- (id)_loadTranscriptButtonTextForReplyCountButtonType;
- (int64_t)buttonType;
- (unint64_t)layoutType;
- (unint64_t)replyCount;
@end

@implementation CKMessageReplyCountChatItem

- (char)transcriptOrientation
{
  v2 = [(CKChatItem *)self IMChatItem];
  int v3 = [v2 isFromMe];

  if (v3) {
    return 2;
  }
  else {
    return 0;
  }
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (int64_t)buttonType
{
  return 6;
}

- (id)_loadTranscriptButtonTextForReplyCountButtonType
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", -[CKMessageReplyCountChatItem replyCount](self, "replyCount"));
  int v3 = NSString;
  v4 = CKFrameworkBundle();
  v5 = [v4 localizedStringForKey:@"REPLY_COUNT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v6 = objc_msgSend(v3, "localizedStringWithFormat:", v5, v2);

  v7 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v8 = [v7 userInterfaceLayoutDirection];

  if (v8 == 1) {
    v9 = @"\u200F";
  }
  else {
    v9 = @"\u200E";
  }
  v10 = [(__CFString *)v9 stringByAppendingString:v6];

  v19[0] = *MEMORY[0x1E4FB06F8];
  v11 = +[CKUIBehavior sharedBehaviors];
  v12 = [v11 transcriptBoldFont];
  v20[0] = v12;
  v19[1] = *MEMORY[0x1E4FB0700];
  v13 = +[CKUIBehavior sharedBehaviors];
  v14 = [v13 theme];
  v15 = [v14 appTintColor];
  v20[1] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10 attributes:v16];

  return v17;
}

- (unint64_t)replyCount
{
  v2 = [(CKChatItem *)self IMChatItem];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)shouldHideDuringDarkFSM
{
  return 0;
}

- (unint64_t)layoutType
{
  return 15;
}

@end