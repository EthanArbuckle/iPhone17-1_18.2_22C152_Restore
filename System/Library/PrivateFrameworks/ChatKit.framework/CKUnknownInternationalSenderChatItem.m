@interface CKUnknownInternationalSenderChatItem
- (Class)cellClass;
- (id)loadTranscriptText;
@end

@implementation CKUnknownInternationalSenderChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (id)loadTranscriptText
{
  v2 = +[CKUIBehavior sharedBehaviors];
  v3 = [v2 transcriptEmphasizedFontAttributes];

  v4 = CKFrameworkBundle();
  v5 = [v4 localizedStringForKey:@"SENDER_IS_UNKNOWN_INTERNATIONAL_SENDER_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v3];

  return v6;
}

@end