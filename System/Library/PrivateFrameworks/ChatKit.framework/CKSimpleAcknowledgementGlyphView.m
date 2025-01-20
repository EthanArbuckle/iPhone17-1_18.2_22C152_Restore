@interface CKSimpleAcknowledgementGlyphView
- (CGPoint)glyphOffset;
- (CKAcknowledgmentGlyphImageView)glyph;
- (CKSimpleAcknowledgementGlyphView)initWithFrame:(CGRect)a3 color:(char)a4;
- (double)animationDuration;
- (id)glyphImageForType:(int64_t)a3 color:(char)a4;
- (void)layoutSubviews;
- (void)setGlyph:(id)a3;
- (void)setGlyphColor:(id)a3;
@end

@implementation CKSimpleAcknowledgementGlyphView

- (CKSimpleAcknowledgementGlyphView)initWithFrame:(CGRect)a3 color:(char)a4
{
  uint64_t v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CKSimpleAcknowledgementGlyphView;
  v5 = -[CKSimpleAcknowledgementGlyphView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    [(CKSimpleAcknowledgementGlyphView *)v5 setBackgroundColor:0];
    v7 = [(CKSimpleAcknowledgementGlyphView *)v6 glyphImageForType:[(CKAcknowledgmentGlyphView *)v6 acknowledgmentType] color:v4];
    v8 = [[CKAcknowledgmentGlyphImageView alloc] initWithImage:v7];
    [(CKAcknowledgmentGlyphImageView *)v8 setAutoresizingMask:18];
    [(CKSimpleAcknowledgementGlyphView *)v6 setGlyph:v8];
    [(CKSimpleAcknowledgementGlyphView *)v6 addSubview:v8];
  }
  return v6;
}

- (id)glyphImageForType:(int64_t)a3 color:(char)a4
{
  switch(a3)
  {
    case 2000:
      switch(a4)
      {
        case 4:
          uint64_t v4 = +[CKUIBehavior sharedBehaviors];
          uint64_t v5 = [v4 whiteHeartAckImage];
          goto LABEL_23;
        case 3:
          goto LABEL_18;
        case -1:
          uint64_t v4 = +[CKUIBehavior sharedBehaviors];
          uint64_t v5 = [v4 grayHeartAckImage];
          goto LABEL_23;
      }
      goto LABEL_17;
    case 2001:
      switch(a4)
      {
        case 4:
          uint64_t v4 = +[CKUIBehavior sharedBehaviors];
          uint64_t v5 = [v4 whiteThumbsUpAckImage];
          goto LABEL_23;
        case 3:
          goto LABEL_18;
        case -1:
          uint64_t v4 = +[CKUIBehavior sharedBehaviors];
          uint64_t v5 = [v4 grayThumbsUpAckImage];
          goto LABEL_23;
      }
      goto LABEL_17;
    case 2002:
      switch(a4)
      {
        case 4:
          uint64_t v4 = +[CKUIBehavior sharedBehaviors];
          uint64_t v5 = [v4 whiteThumbsDownAckImage];
          break;
        case 3:
LABEL_18:
          uint64_t v4 = +[CKUIBehavior sharedBehaviors];
          uint64_t v5 = [v4 redHeartAckImage];
          break;
        case -1:
          uint64_t v4 = +[CKUIBehavior sharedBehaviors];
          uint64_t v5 = [v4 grayThumbsDownAckImage];
          break;
        default:
          goto LABEL_17;
      }
      goto LABEL_23;
    case 2003:
      if (a4 == 4)
      {
        uint64_t v4 = +[CKUIBehavior sharedBehaviors];
        uint64_t v5 = [v4 whiteHaAckImage];
      }
      else
      {
        if (a4 != -1)
        {
LABEL_17:
          v6 = 0;
          goto LABEL_24;
        }
        uint64_t v4 = +[CKUIBehavior sharedBehaviors];
        uint64_t v5 = [v4 grayHaAckImage];
      }
LABEL_23:
      v6 = (void *)v5;

LABEL_24:
      return v6;
    default:
      goto LABEL_17;
  }
}

- (CGPoint)glyphOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)animationDuration
{
  return 1.0;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CKSimpleAcknowledgementGlyphView;
  [(CKSimpleAcknowledgementGlyphView *)&v4 layoutSubviews];
  double v3 = [(CKSimpleAcknowledgementGlyphView *)self glyph];
  [(CKSimpleAcknowledgementGlyphView *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)setGlyphColor:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKSimpleAcknowledgementGlyphView;
  id v4 = a3;
  [(CKAcknowledgmentGlyphView *)&v11 setGlyphColor:v4];
  uint64_t v5 = [(CKSimpleAcknowledgementGlyphView *)self glyph];
  int64_t v6 = [(CKAcknowledgmentGlyphView *)self acknowledgmentType];
  v7 = +[CKUIBehavior sharedBehaviors];
  v8 = [v7 theme];
  uint64_t v9 = [v8 ckAcknowledgementColorTypeForColor:v4];

  objc_super v10 = [(CKSimpleAcknowledgementGlyphView *)self glyphImageForType:v6 color:v9];
  [v5 setImage:v10];
}

- (CKAcknowledgmentGlyphImageView)glyph
{
  return self->_glyph;
}

- (void)setGlyph:(id)a3
{
}

- (void).cxx_destruct
{
}

@end