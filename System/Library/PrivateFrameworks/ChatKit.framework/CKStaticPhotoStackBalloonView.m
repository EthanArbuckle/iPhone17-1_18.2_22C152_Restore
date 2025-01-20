@interface CKStaticPhotoStackBalloonView
- (CKStaticImageStackView)stackView;
- (NSArray)mediaObjects;
- (double)stackCornerRadius;
- (void)configureForMessagePart:(id)a3;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)setMediaObjects:(id)a3;
- (void)setStackView:(id)a3;
@end

@implementation CKStaticPhotoStackBalloonView

- (void)configureForMessagePart:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKStaticPhotoStackBalloonView;
  id v4 = a3;
  [(CKBalloonView *)&v6 configureForMessagePart:v4];
  v5 = objc_msgSend(v4, "mediaObjects", v6.receiver, v6.super_class);

  [(CKStaticPhotoStackBalloonView *)self setMediaObjects:v5];
}

- (void)setMediaObjects:(id)a3
{
  id v8 = a3;
  v5 = [(CKStaticPhotoStackBalloonView *)self mediaObjects];
  char v6 = [v8 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_mediaObjects, a3);
    v7 = [(CKStaticPhotoStackBalloonView *)self stackView];
    [v7 removeFromSuperview];

    [(CKStaticPhotoStackBalloonView *)self setStackView:0];
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)prepareForDisplay
{
  v11.receiver = self;
  v11.super_class = (Class)CKStaticPhotoStackBalloonView;
  [(CKBalloonView *)&v11 prepareForDisplay];
  v3 = [(CKStaticPhotoStackBalloonView *)self stackView];

  if (v3)
  {
    [(CKStaticPhotoStackBalloonView *)self setNeedsLayout];
  }
  else
  {
    id v4 = [CKStaticImageStackView alloc];
    v5 = [(CKStaticPhotoStackBalloonView *)self mediaObjects];
    char v6 = -[CKStaticImageStackView initWithFrame:mediaObjects:](v4, "initWithFrame:mediaObjects:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CKStaticPhotoStackBalloonView *)self setStackView:v6];

    [(CKStaticPhotoStackBalloonView *)self stackCornerRadius];
    double v8 = v7;
    v9 = [(CKStaticPhotoStackBalloonView *)self stackView];
    [v9 setStackCornerRadius:v8];

    v10 = [(CKStaticPhotoStackBalloonView *)self stackView];
    [(CKStaticPhotoStackBalloonView *)self addSubview:v10];
  }
}

- (double)stackCornerRadius
{
  return 20.0;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CKStaticPhotoStackBalloonView;
  [(CKBalloonView *)&v4 layoutSubviews];
  v3 = [(CKStaticPhotoStackBalloonView *)self stackView];
  [(CKStaticPhotoStackBalloonView *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

- (NSArray)mediaObjects
{
  return self->_mediaObjects;
}

- (CKStaticImageStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);

  objc_storeStrong((id *)&self->_mediaObjects, 0);
}

@end