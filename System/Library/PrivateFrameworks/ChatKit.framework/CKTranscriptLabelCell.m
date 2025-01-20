@interface CKTranscriptLabelCell
+ (id)createStampLabelView;
+ (id)reuseIdentifier;
- (CKTranscriptLabelCell)initWithFrame:(CGRect)a3;
- (id)attributedText;
- (void)setAttributedText:(id)a3;
@end

@implementation CKTranscriptLabelCell

+ (id)reuseIdentifier
{
  return @"TS";
}

- (CKTranscriptLabelCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptLabelCell;
  v3 = -[CKTranscriptStampCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CKTranscriptLabelCell *)v3 label];
    [v5 setNumberOfLines:0];
  }
  return v4;
}

+ (id)createStampLabelView
{
  id v2 = objc_alloc(MEMORY[0x1E4F42B38]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v3;
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptLabelCell *)self label];
  [v5 setAttributedText:v4];
}

- (id)attributedText
{
  id v2 = [(CKTranscriptLabelCell *)self label];
  v3 = [v2 attributedText];

  return v3;
}

@end