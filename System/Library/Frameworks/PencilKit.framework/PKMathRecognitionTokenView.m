@interface PKMathRecognitionTokenView
+ (BOOL)shouldAddViewForToken:(id)a3;
+ (PKMathRecognitionTokenView)viewForToken:(void *)a3 item:;
- (void)updateFrameForDrawingTransform:(uint64_t)a1;
@end

@implementation PKMathRecognitionTokenView

+ (BOOL)shouldAddViewForToken:(id)a3
{
  id v3 = a3;
  v4 = [v3 errors];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [v3 alternatives];
    BOOL v5 = [v6 count] != 0;
  }
  return v5;
}

+ (PKMathRecognitionTokenView)viewForToken:(void *)a3 item:
{
  id v5 = a2;
  id v6 = a3;
  if ([self shouldAddViewForToken:v5])
  {
    uint64_t v7 = [v5 characterRange];
    v9 = [(PKMathRecognitionItem *)(uint64_t)v6 _strokeIndexesForCharacterRange:v8];
    if ([v9 count])
    {
      v10 = objc_alloc_init(PKMathRecognitionTokenView);
      [(PKMathRecognitionTokenView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PKMathRecognitionTokenView *)v10 setUserInteractionEnabled:0];
      v11 = [MEMORY[0x1E4FB1618] clearColor];
      [(PKMathRecognitionTokenView *)v10 setBackgroundColor:v11];

      objc_storeStrong((id *)&v10->_item, a3);
      objc_storeStrong((id *)&v10->_token, a2);
      v10->_strokeBounds.origin.x = -[PKMathRecognitionItem _boundsForStrokeIndexes:](v6, v9);
      v10->_strokeBounds.origin.y = v12;
      v10->_strokeBounds.size.width = v13;
      v10->_strokeBounds.size.height = v14;
      v10->_timestamp = CACurrentMediaTime();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)updateFrameForDrawingTransform:(uint64_t)a1
{
  if (a1)
  {
    CGRect v15 = *(CGRect *)(a1 + 440);
    long long v3 = a2[1];
    *(_OWORD *)&v14.a = *a2;
    *(_OWORD *)&v14.c = v3;
    *(_OWORD *)&v14.tCGFloat x = a2[2];
    CGRect v16 = CGRectApplyAffineTransform(v15, &v14);
    CGFloat x = v16.origin.x;
    CGFloat y = v16.origin.y;
    CGFloat width = v16.size.width;
    CGFloat height = v16.size.height;
    [(id)a1 frame];
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    if (!CGRectEqualToRect(v17, v22))
    {
      v18.origin.CGFloat x = x;
      v18.origin.CGFloat y = y;
      v18.size.CGFloat width = width;
      v18.size.CGFloat height = height;
      CGRect v19 = CGRectInset(v18, -4.0, -4.0);
      objc_msgSend((id)a1, "setFrame:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
      if (!*(void *)(a1 + 408))
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F39C88]);
        v9 = *(void **)(a1 + 408);
        *(void *)(a1 + 408) = v8;

        [*(id *)(a1 + 408) setLineWidth:2.0];
        [*(id *)(a1 + 408) setLineJoin:*MEMORY[0x1E4F3A478]];
        [*(id *)(a1 + 408) setLineCap:*MEMORY[0x1E4F3A458]];
        id v10 = [MEMORY[0x1E4FB1618] clearColor];
        objc_msgSend(*(id *)(a1 + 408), "setFillColor:", objc_msgSend(v10, "CGColor"));

        [*(id *)(a1 + 408) setLineDashPattern:&unk_1F200EFA0];
        v11 = [(id)a1 layer];
        [v11 addSublayer:*(void *)(a1 + 408)];
      }
      if ([*(id *)(a1 + 416) type] == 4) {
        [MEMORY[0x1E4FB1618] systemBlueColor];
      }
      else {
      id v12 = [MEMORY[0x1E4FB1618] systemRedColor];
      }
      objc_msgSend(*(id *)(a1 + 408), "setStrokeColor:", objc_msgSend(v12, "CGColor"));

      [(id)a1 bounds];
      CGRect v21 = CGRectInset(v20, 1.0, 1.0);
      objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, 4.0);
      id v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 408), "setPath:", objc_msgSend(v13, "CGPath"));
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_shapeLayer, 0);
}

@end