@interface LAUITouchIDGlyph
- (LAUITouchIDGlyph)initWithStyle:(int64_t)a3;
- (UIView)view;
- (int64_t)state;
- (void)dealloc;
- (void)setState:(int64_t)a3;
- (void)shake;
@end

@implementation LAUITouchIDGlyph

- (LAUITouchIDGlyph)initWithStyle:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)LAUITouchIDGlyph;
  v4 = [(LAUITouchIDGlyph *)&v10 init];
  if (v4)
  {
    uint64_t v5 = +[LAUIPKGlyphWrapper glyphWithStyle:frame:](LAUIPKGlyphWrapper, "glyphWithStyle:frame:", a3, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    glyph = v4->_glyph;
    v4->_glyph = (LAUIPKGlyphWrapper *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263F1C6D8]) initWithStyle:2];
    hapticGenerator = v4->_hapticGenerator;
    v4->_hapticGenerator = (UIImpactFeedbackGenerator *)v7;

    [(UIImpactFeedbackGenerator *)v4->_hapticGenerator prepare];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(LAUIPKGlyphWrapper *)self->_glyph view];
  [v3 removeFromSuperview];

  v4.receiver = self;
  v4.super_class = (Class)LAUITouchIDGlyph;
  [(LAUITouchIDGlyph *)&v4 dealloc];
}

- (UIView)view
{
  return [(LAUIPKGlyphWrapper *)self->_glyph view];
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
  if (a3 == 2) {
    uint64_t v3 = 11;
  }
  else {
    uint64_t v3 = a3 == 1;
  }
  [(LAUIPKGlyphWrapper *)self->_glyph setState:v3 idleTouchID:0 animated:1 completionHandler:&__block_literal_global_3];
}

uint64_t __29__LAUITouchIDGlyph_setState___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v1 == 2) {
    return 11;
  }
  else {
    return v1 == 1;
  }
}

- (void)shake
{
  [(UIImpactFeedbackGenerator *)self->_hapticGenerator impactOccurred];
  CGAffineTransformMakeTranslation(&v6, 20.0, 0.0);
  uint64_t v3 = [(LAUITouchIDGlyph *)self view];
  CGAffineTransform v5 = v6;
  [v3 setTransform:&v5];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __25__LAUITouchIDGlyph_shake__block_invoke;
  v4[3] = &unk_26420C8D8;
  v4[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v4 usingSpringWithDamping:0 initialSpringVelocity:0.4 options:0.0 animations:0.03 completion:1.2];
}

void __25__LAUITouchIDGlyph_shake__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) view];
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v3[0] = *MEMORY[0x263F000D0];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v1 setTransform:v3];
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticGenerator, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
}

@end