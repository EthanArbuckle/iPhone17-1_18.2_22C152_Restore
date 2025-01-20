@interface CKUnavailableSatelliteForServiceChatItem
+ (id)newComposeTranscriptTextForiMessage:(BOOL)a3 isGroupChat:(BOOL)a4;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (id)loadTranscriptText;
@end

@implementation CKUnavailableSatelliteForServiceChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = +[CKUIBehavior sharedBehaviors];
  v9 = [(CKUnavailableSatelliteForServiceChatItem *)self loadTranscriptText];
  objc_msgSend(v9, "boundingRectWithSize:options:context:", 1, 0, width, height);
  double v11 = v10;

  [v8 smallTranscriptSpace];
  double v13 = v12;
  [v8 transcriptBoldTextAlignmentInsets];
  if (a4)
  {
    a4->top = v14;
    a4->left = v15;
    a4->bottom = v16;
    a4->right = v17;
  }
  double v18 = v11 - v14 + v13 + v11 - v16;

  double v19 = 0.0;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (id)loadTranscriptText
{
  v3 = +[CKUIBehavior sharedBehaviors];
  v4 = [v3 transcriptEmphasizedFontAttributes];

  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 transcriptRegularFontAttributes];

  v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v8 = [v7 isCarrierPigeonEnabled];

  if (v8)
  {
    v9 = [(CKChatItem *)self IMChatItem];
    uint64_t v10 = [v9 service];
    int v11 = [v9 isGroupChat];
    double v12 = [MEMORY[0x1E4F6BDC0] iMessageService];

    double v13 = CKFrameworkBundle();
    double v14 = v13;
    v30 = (void *)v10;
    if ((void *)v10 == v12)
    {
      CGFloat v15 = [v13 localizedStringForKey:@"PLACEHOLDER_TEXT_VIEW_SATELLITE_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];

      double v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v15 attributes:v4];
      CGFloat v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
      id v24 = objc_alloc(MEMORY[0x1E4F28E48]);
      v25 = CKFrameworkBundle();
      v26 = v25;
      if (v11) {
        v27 = @"GROUP_CHATS_SENDING_DISABLED";
      }
      else {
        v27 = @"IMESSAGE_SATELLITE_NOT_AVAILABLE";
      }
      v28 = [v25 localizedStringForKey:v27 value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];
      v23 = (void *)[v24 initWithString:v28 attributes:v6];
    }
    else
    {
      CGFloat v15 = [v13 localizedStringForKey:@"PLACEHOLDER_TEXT_VIEW_SATELLITE_MESSAGE_SMS" value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];

      double v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v15 attributes:v4];
      CGFloat v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
      id v18 = objc_alloc(MEMORY[0x1E4F28E48]);
      double v19 = CKFrameworkBundle();
      double v20 = v19;
      if (v11) {
        v21 = @"GROUP_CHATS_SENDING_DISABLED";
      }
      else {
        v21 = @"SMS_SATELLITE_NOT_AVAILABLE";
      }
      v22 = [v19 localizedStringForKey:v21 value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];
      v23 = (void *)[v18 initWithString:v22 attributes:v6];
    }
    [v16 appendLocalizedFormat:v17];
    [v16 appendLocalizedFormat:v23];
  }
  else
  {
    double v16 = 0;
  }

  return v16;
}

+ (id)newComposeTranscriptTextForiMessage:(BOOL)a3 isGroupChat:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v6 = +[CKUIBehavior sharedBehaviors];
  v7 = [v6 transcriptEmphasizedFontAttributes];

  int v8 = +[CKUIBehavior sharedBehaviors];
  v9 = [v8 transcriptRegularFontAttributes];

  uint64_t v10 = CKFrameworkBundle();
  int v11 = v10;
  if (v5) {
    double v12 = @"PLACEHOLDER_TEXT_VIEW_SATELLITE_MESSAGE";
  }
  else {
    double v12 = @"PLACEHOLDER_TEXT_VIEW_SATELLITE_MESSAGE_SMS";
  }
  double v13 = [v10 localizedStringForKey:v12 value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];

  double v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v13 attributes:v7];
  CGFloat v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
  id v16 = objc_alloc(MEMORY[0x1E4F28E48]);
  CGFloat v17 = CKFrameworkBundle();
  id v18 = v17;
  if (v4) {
    double v19 = @"GROUP_CHATS_SENDING_DISABLED";
  }
  else {
    double v19 = @"IMESSAGE_SATELLITE_NOT_AVAILABLE";
  }
  double v20 = [v17 localizedStringForKey:v19 value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];
  v21 = (void *)[v16 initWithString:v20 attributes:v9];

  [v14 appendAttributedString:v15];
  [v14 appendAttributedString:v21];

  return v14;
}

@end