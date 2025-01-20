@interface AVPictureInPictureIndicatorView
- (AVPictureInPictureIndicatorLayer)pipIndicatorLayer;
- (NSString)customMessage;
- (void)_addIndicatorLayerIfNeeded;
- (void)_updateGeometry;
- (void)didMoveToWindow;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCustomMessage:(id)a3;
- (void)setPipIndicatorLayer:(id)a3;
@end

@implementation AVPictureInPictureIndicatorView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipIndicatorLayer, 0);

  objc_storeStrong((id *)&self->_customMessage, 0);
}

- (void)setPipIndicatorLayer:(id)a3
{
}

- (AVPictureInPictureIndicatorLayer)pipIndicatorLayer
{
  return self->_pipIndicatorLayer;
}

- (NSString)customMessage
{
  return self->_customMessage;
}

- (void)_addIndicatorLayerIfNeeded
{
  v3 = [(AVPictureInPictureIndicatorView *)self pipIndicatorLayer];
  if (!v3)
  {
    v4 = [(AVPictureInPictureIndicatorView *)self window];

    if (!v4) {
      return;
    }
    v5 = (void *)MEMORY[0x1E4FB1818];
    v6 = AVBundle();
    v7 = [(AVPictureInPictureIndicatorView *)self window];
    v8 = [v7 traitCollection];
    id v24 = [v5 imageNamed:@"PictureInPictureIndicatorLarge" inBundle:v6 compatibleWithTraitCollection:v8];

    v9 = objc_msgSend(MEMORY[0x1E4FB1618], "AV_indicatorForegroundColor");
    v10 = [v24 _flatImageWithColor:v9];

    v11 = [AVPictureInPictureIndicatorLayer alloc];
    v12 = [(AVPictureInPictureIndicatorView *)self window];
    v13 = [v12 traitCollection];
    [v13 displayScale];
    double v15 = v14;
    id v16 = v10;
    uint64_t v17 = [v16 CGImage];
    v18 = -[AVPictureInPictureIndicatorLayer initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:](v11, "initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:", v17, 0, v15, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));

    [(AVPictureInPictureIndicatorView *)self setPipIndicatorLayer:v18];
    v19 = [(AVPictureInPictureIndicatorView *)self customMessage];

    if (v19)
    {
      v20 = [(AVPictureInPictureIndicatorView *)self customMessage];
      v21 = [(AVPictureInPictureIndicatorView *)self pipIndicatorLayer];
      [v21 setCustomText:v20];
    }
    v22 = [(AVPictureInPictureIndicatorView *)self layer];
    v23 = [(AVPictureInPictureIndicatorView *)self pipIndicatorLayer];
    [v22 addSublayer:v23];

    v3 = v24;
  }
}

- (void)_updateGeometry
{
  v2 = self;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  [(AVPictureInPictureIndicatorView *)self _addIndicatorLayerIfNeeded];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v3 = [(AVPictureInPictureIndicatorView *)v2 layer];
  v4 = [v3 animationKeys];

  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v42;
    do
    {
      uint64_t v8 = 0;
      uint64_t v35 = v6;
      do
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v41 + 1) + 8 * v8);
        v10 = [(AVPictureInPictureIndicatorView *)v2 layer];
        v11 = [v10 animationForKey:v9];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (([v9 containsString:@"position"] & 1) != 0
           || [v9 containsString:@"bounds.origin"]))
        {
          uint64_t v12 = v7;
          v13 = [(AVPictureInPictureIndicatorView *)v2 pipIndicatorLayer];
          [v13 addAnimation:v11 forKey:v9];

          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          double v14 = v2;
          double v15 = [(AVPictureInPictureIndicatorView *)v2 pipIndicatorLayer];
          id v16 = [v15 sublayers];

          uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v38;
            do
            {
              uint64_t v20 = 0;
              do
              {
                if (*(void *)v38 != v19) {
                  objc_enumerationMutation(v16);
                }
                [*(id *)(*((void *)&v37 + 1) + 8 * v20++) addAnimation:v11 forKey:v9];
              }
              while (v18 != v20);
              uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
            }
            while (v18);
          }

          uint64_t v7 = v12;
          uint64_t v6 = v35;
          v2 = v14;
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v6);
  }

  [(AVPictureInPictureIndicatorView *)v2 bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = [(AVPictureInPictureIndicatorView *)v2 pipIndicatorLayer];
  objc_msgSend(v29, "setBounds:", v22, v24, v26, v28);

  [(AVPictureInPictureIndicatorView *)v2 bounds];
  UIRectGetCenter();
  double v31 = v30;
  double v33 = v32;
  v34 = [(AVPictureInPictureIndicatorView *)v2 pipIndicatorLayer];
  objc_msgSend(v34, "setPosition:", v31, v33);
}

- (void)setBackgroundColor:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVPictureInPictureIndicatorView;
  id v4 = a3;
  [(AVPictureInPictureIndicatorView *)&v8 setBackgroundColor:v4];
  id v5 = v4;
  uint64_t v6 = objc_msgSend(v5, "CGColor", v8.receiver, v8.super_class);

  uint64_t v7 = [(AVPictureInPictureIndicatorView *)self pipIndicatorLayer];
  [v7 setBackgroundColor:v6];
}

- (void)setCustomMessage:(id)a3
{
  id v4 = a3;
  id v5 = (NSString *)[v4 copy];
  customMessage = self->_customMessage;
  self->_customMessage = v5;

  id v7 = [(AVPictureInPictureIndicatorView *)self pipIndicatorLayer];
  [v7 setCustomText:v4];
}

- (void)layoutSublayersOfLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVPictureInPictureIndicatorView;
  [(AVPictureInPictureIndicatorView *)&v4 layoutSublayersOfLayer:a3];
  [(AVPictureInPictureIndicatorView *)self _updateGeometry];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)AVPictureInPictureIndicatorView;
  [(AVPictureInPictureIndicatorView *)&v3 didMoveToWindow];
  [(AVPictureInPictureIndicatorView *)self _updateGeometry];
}

@end