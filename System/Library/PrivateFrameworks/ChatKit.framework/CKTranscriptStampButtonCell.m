@interface CKTranscriptStampButtonCell
+ (id)createStampTextView;
+ (id)reuseIdentifier;
- (id)attributedText;
- (void)setAttributedText:(id)a3;
@end

@implementation CKTranscriptStampButtonCell

+ (id)reuseIdentifier
{
  return @"TSBC";
}

+ (id)createStampTextView
{
  v2 = +[CKTranscriptStampButtonCellButton buttonWithType:0];
  v3 = [v2 titleLabel];
  [v3 setLineBreakMode:0];

  [v2 setContentHorizontalAlignment:3];
  v4 = +[CKUIBehavior sharedBehaviors];
  [v4 stampTranscriptInsets];
  objc_msgSend(v2, "setContentEdgeInsets:");

  return v2;
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptStampButtonCell *)self stampButton];
  [v5 setAttributedTitle:v4 forState:0];
}

- (id)attributedText
{
  v2 = [(CKTranscriptStampButtonCell *)self stampButton];
  v3 = [v2 attributedTitleForState:0];

  return v3;
}

@end