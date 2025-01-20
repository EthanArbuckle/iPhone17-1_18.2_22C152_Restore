@interface CKAcknowledgmentGlyphView
+ (id)glyphViewForAcknowledgmentType:(int64_t)a3 glyphColor:(char)a4;
+ (id)viewCache;
- (CGPoint)glyphOffset;
- (CKAcknowledgmentGlyphView)initWithFrame:(CGRect)a3 color:(char)a4;
- (UIColor)glyphColor;
- (double)animationDuration;
- (int64_t)acknowledgmentType;
- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5;
- (void)setGlyphColor:(id)a3;
@end

@implementation CKAcknowledgmentGlyphView

+ (id)viewCache
{
  if (viewCache_onceToken != -1) {
    dispatch_once(&viewCache_onceToken, &__block_literal_global_262);
  }
  v2 = (void *)viewCache_sCache;

  return v2;
}

void __38__CKAcknowledgmentGlyphView_viewCache__block_invoke()
{
  v0 = objc_alloc_init(CKMultiCache);
  v1 = (void *)viewCache_sCache;
  viewCache_sCache = (uint64_t)v0;
}

- (CKAcknowledgmentGlyphView)initWithFrame:(CGRect)a3 color:(char)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CKAcknowledgmentGlyphView;
  return -[CKAcknowledgmentGlyphView initWithFrame:](&v5, sel_initWithFrame_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)glyphViewForAcknowledgmentType:(int64_t)a3 glyphColor:(char)a4
{
  uint64_t v4 = a4;
  switch(a3)
  {
    case 2000:
    case 2001:
    case 2002:
    case 2004:
    case 2005:
      goto LABEL_4;
    case 2003:
      v6 = +[CKUIBehavior sharedBehaviors];
      v7 = [v6 messageAcknowledgmentImageNameForType:2003];
      [v7 hasSuffix:@"ENG"];

LABEL_4:
      objc_super v5 = (objc_class *)objc_opt_class();
      break;
    default:
      objc_super v5 = 0;
      break;
  }
  id v8 = [v5 alloc];
  v9 = objc_msgSend(v8, "initWithFrame:color:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v9;
}

- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, double, double))a5 + 2))(a5, a3, a4);
  }
}

- (int64_t)acknowledgmentType
{
  return 0;
}

- (CGPoint)glyphOffset
{
  double x = self->_glyphOffset.x;
  double y = self->_glyphOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (void)setGlyphColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end