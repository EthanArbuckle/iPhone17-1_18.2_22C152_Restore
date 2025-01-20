@interface CKLocatingChatItem
- (BOOL)failed;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)balloonViewClass;
- (NSString)locationText;
- (id)description;
- (id)message;
- (id)sender;
- (id)time;
- (void)configureBalloonView:(id)a3;
@end

@implementation CKLocatingChatItem

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CKLocatingChatItem;
  v4 = [(CKBalloonChatItem *)&v8 description];
  v5 = [(CKLocatingChatItem *)self locationText];
  v6 = [v3 stringWithFormat:@"[%@ locationText:%@]", v4, v5];

  return v6;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)failed
{
  v2 = [(CKLocatingChatItem *)self message];
  v3 = [v2 error];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)time
{
  v2 = [(CKLocatingChatItem *)self message];
  v3 = [v2 time];

  return v3;
}

- (id)sender
{
  v2 = [(CKLocatingChatItem *)self message];
  v3 = [v2 sender];

  return v3;
}

- (void)configureBalloonView:(id)a3
{
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  BOOL v4 = +[CKUIBehavior sharedBehaviors];
  v5 = +[CKUIBehavior sharedBehaviors];
  [v5 previewMaxWidth];
  objc_msgSend(v4, "mapThumbnailFillSizeForWidth:");
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (NSString)locationText
{
  v2 = CKFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"LOCATING" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return (NSString *)v3;
}

- (id)message
{
  v2 = [(CKChatItem *)self IMChatItem];
  v3 = [v2 message];

  return v3;
}

@end