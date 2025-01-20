@interface CKConversationListTypingIndicatorView
- (BOOL)flipForRTLLayout;
- (BOOL)isDarkAqua;
- (BOOL)isHighlighted;
- (CKConversationListTypingIndicatorLayer)typingLayer;
- (CKConversationListTypingIndicatorView)init;
- (double)typingIndicatorScale;
- (void)_updateTypingLayerTransform;
- (void)destroyTypingLayer;
- (void)resetTypingLayer;
- (void)setFlipForRTLLayout:(BOOL)a3;
- (void)setHighlightedState:(BOOL)a3;
- (void)setIsDarkAqua:(BOOL)a3;
- (void)setTypingIndicatorScale:(double)a3;
- (void)setTypingLayer:(id)a3;
- (void)startGrowAnimation;
- (void)startPulseAnimation;
- (void)startShrinkAnimationWithCompletionBlock:(id)a3;
- (void)stopAnimation;
@end

@implementation CKConversationListTypingIndicatorView

- (CKConversationListTypingIndicatorView)init
{
  +[CKTypingIndicatorLayer defaultSize];
  v8.receiver = self;
  v8.super_class = (Class)CKConversationListTypingIndicatorView;
  v5 = -[CKConversationListTypingIndicatorView initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, v3, v4);
  v6 = v5;
  if (v5)
  {
    [(CKConversationListTypingIndicatorView *)v5 setAccessibilityIdentifier:@"TypingIndicator"];
    [(CKConversationListTypingIndicatorView *)v6 setClipsToBounds:0];
    [(CKConversationListTypingIndicatorView *)v6 setTypingIndicatorScale:1.0];
  }
  return v6;
}

- (void)setFlipForRTLLayout:(BOOL)a3
{
  if (self->_flipForRTLLayout != a3)
  {
    self->_flipForRTLLayout = a3;
    [(CKConversationListTypingIndicatorView *)self _updateTypingLayerTransform];
  }
}

- (void)setTypingLayer:(id)a3
{
  v5 = (CKConversationListTypingIndicatorLayer *)a3;
  p_typingLayer = &self->_typingLayer;
  typingLayer = self->_typingLayer;
  v9 = v5;
  if (typingLayer != v5)
  {
    if (typingLayer) {
      [(CKConversationListTypingIndicatorLayer *)typingLayer removeFromSuperlayer];
    }
    objc_storeStrong((id *)&self->_typingLayer, a3);
    if (*p_typingLayer)
    {
      objc_super v8 = [(CKConversationListTypingIndicatorView *)self layer];
      [v8 addSublayer:*p_typingLayer];

      [(CKConversationListTypingIndicatorView *)self _updateTypingLayerTransform];
      [(CKConversationListTypingIndicatorView *)self setNeedsLayout];
      [(CKConversationListTypingIndicatorView *)self setNeedsDisplay];
    }
  }
}

- (CKConversationListTypingIndicatorLayer)typingLayer
{
  typingLayer = self->_typingLayer;
  if (!typingLayer)
  {
    id v4 = [(CKTypingIndicatorLayer *)[CKConversationListTypingIndicatorLayer alloc] initHighlighted:[(CKConversationListTypingIndicatorView *)self isHighlighted]];
    [(CKConversationListTypingIndicatorView *)self setTypingLayer:v4];

    typingLayer = self->_typingLayer;
  }

  return typingLayer;
}

- (void)destroyTypingLayer
{
}

- (void)startGrowAnimation
{
  double v3 = [(CKConversationListTypingIndicatorView *)self typingLayer];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__CKConversationListTypingIndicatorView_startGrowAnimation__block_invoke;
  v4[3] = &unk_1E5620C40;
  v4[4] = self;
  [v3 startGrowAnimationWithCompletionBlock:v4];
}

uint64_t __59__CKConversationListTypingIndicatorView_startGrowAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startPulseAnimation];
}

- (void)startPulseAnimation
{
  id v2 = [(CKConversationListTypingIndicatorView *)self typingLayer];
  [v2 startPulseAnimation];
}

- (void)startShrinkAnimationWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  typingLayer = self->_typingLayer;
  if (typingLayer)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__CKConversationListTypingIndicatorView_startShrinkAnimationWithCompletionBlock___block_invoke;
    v7[3] = &unk_1E5623828;
    v7[4] = self;
    id v8 = v4;
    [(CKTypingIndicatorLayer *)typingLayer startShrinkAnimationWithCompletionBlock:v7];
  }
}

uint64_t __81__CKConversationListTypingIndicatorView_startShrinkAnimationWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  double v3 = *(void **)(a1 + 32);

  return [v3 destroyTypingLayer];
}

- (void)stopAnimation
{
  typingLayer = self->_typingLayer;
  if (typingLayer)
  {
    [(CKTypingIndicatorLayer *)typingLayer stopAnimation];
    [(CKConversationListTypingIndicatorView *)self destroyTypingLayer];
  }
}

- (void)_updateTypingLayerTransform
{
  if (self->_typingLayer)
  {
    [(CKConversationListTypingIndicatorView *)self typingIndicatorScale];
    if (v3 == 1.0)
    {
      if (!self->_flipForRTLLayout
        || ([MEMORY[0x1E4F42738] sharedApplication],
            id v4 = objc_claimAutoreleasedReturnValue(),
            uint64_t v5 = [v4 userInterfaceLayoutDirection],
            v4,
            v5 != 1))
      {
        typingLayer = self->_typingLayer;
        long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
        *(_OWORD *)&v33.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
        *(_OWORD *)&v33.m33 = v13;
        long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
        *(_OWORD *)&v33.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
        *(_OWORD *)&v33.m43 = v14;
        long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
        *(_OWORD *)&v33.m11 = *MEMORY[0x1E4F39B10];
        *(_OWORD *)&v33.m13 = v15;
        long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
        *(_OWORD *)&v33.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
        *(_OWORD *)&v33.m23 = v16;
        v11 = &v33;
LABEL_12:
        -[CKConversationListTypingIndicatorLayer setTransform:](typingLayer, "setTransform:", v11, *(_OWORD *)&v28.m11, *(_OWORD *)&v28.m13, *(_OWORD *)&v28.m21, *(_OWORD *)&v28.m23, *(_OWORD *)&v28.m31, *(_OWORD *)&v28.m33, *(_OWORD *)&v28.m41, *(_OWORD *)&v28.m43);
        return;
      }
      v6 = self->_typingLayer;
      long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      *(_OWORD *)&v33.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      *(_OWORD *)&v33.m33 = v7;
      long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      *(_OWORD *)&v33.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      *(_OWORD *)&v33.m43 = v8;
      long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      *(_OWORD *)&v33.m11 = *MEMORY[0x1E4F39B10];
      *(_OWORD *)&v33.m13 = v9;
      long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      *(_OWORD *)&v33.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      *(_OWORD *)&v33.m23 = v10;
      CATransform3DScale(&v34, &v33, -1.0, 1.0, 1.0);
      v11 = &v34;
    }
    else
    {
      double v17 = v3;
      memset(&v33, 0, sizeof(v33));
      CATransform3DMakeScale(&a, v3, v3, v3);
      [(CKConversationListTypingIndicatorLayer *)self->_typingLayer bounds];
      double v18 = 1.0 - v17;
      CGFloat v20 = (1.0 - v17) * v19 * -0.5;
      [(CKConversationListTypingIndicatorLayer *)self->_typingLayer bounds];
      CATransform3DMakeTranslation(&b, v20, v18 * v21 * -0.5, 0.0);
      CATransform3DConcat(&v33, &a, &b);
      if (!self->_flipForRTLLayout
        || ([MEMORY[0x1E4F42738] sharedApplication],
            v22 = objc_claimAutoreleasedReturnValue(),
            uint64_t v23 = [v22 userInterfaceLayoutDirection],
            v22,
            v23 != 1))
      {
        typingLayer = self->_typingLayer;
        CATransform3D v28 = v33;
        v11 = &v28;
        goto LABEL_12;
      }
      v6 = self->_typingLayer;
      long long v24 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      *(_OWORD *)&v28.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      *(_OWORD *)&v28.m33 = v24;
      long long v25 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      *(_OWORD *)&v28.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      *(_OWORD *)&v28.m43 = v25;
      long long v26 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      *(_OWORD *)&v28.m11 = *MEMORY[0x1E4F39B10];
      *(_OWORD *)&v28.m13 = v26;
      long long v27 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      *(_OWORD *)&v28.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      *(_OWORD *)&v28.m23 = v27;
      CATransform3DScale(&v29, &v28, -1.0, 1.0, 1.0);
      CATransform3D v28 = v33;
      CATransform3DConcat(&v30, &v28, &v29);
      v11 = &v30;
    }
    typingLayer = v6;
    goto LABEL_12;
  }
}

- (void)resetTypingLayer
{
  if (self->_typingLayer)
  {
    [(CKConversationListTypingIndicatorView *)self destroyTypingLayer];
    [(CKConversationListTypingIndicatorView *)self startPulseAnimation];
  }
}

- (void)setHighlightedState:(BOOL)a3
{
  if (self->_highlightedState != a3)
  {
    self->_highlightedState = a3;
    [(CKConversationListTypingIndicatorView *)self resetTypingLayer];
  }
}

- (double)typingIndicatorScale
{
  return self->_typingIndicatorScale;
}

- (void)setTypingIndicatorScale:(double)a3
{
  self->_typingIndicatorScale = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlightedState;
}

- (BOOL)flipForRTLLayout
{
  return self->_flipForRTLLayout;
}

- (BOOL)isDarkAqua
{
  return self->_isDarkAqua;
}

- (void)setIsDarkAqua:(BOOL)a3
{
  self->_isDarkAquCATransform3D a = a3;
}

- (void).cxx_destruct
{
}

@end