@interface CKAttachmentCell
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isEditing;
- (BOOL)isIrisAsset;
- (BOOL)userExplicitlyUnpausedAnimation;
- (CGImage)_cgImageForUIImage:(id)a3;
- (CKAnimatedImage)animatedImage;
- (CKAttachmentCell)initWithFrame:(CGRect)a3;
- (CKAttachmentCellDelegate)delegate;
- (CKAttachmentItem)representedObject;
- (NSArray)frames;
- (UIImage)image;
- (UIImageView)checkmarkView;
- (UIImageView)irisBadgeView;
- (UITapGestureRecognizer)tapRecognizer;
- (void)animationTimerFired:(double)a3;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)layoutSubviews;
- (void)more:(id)a3;
- (void)prepareForReuse;
- (void)saveAttachment:(id)a3;
- (void)setAnimatedImage:(id)a3;
- (void)setCheckmarkView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFrames:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setImage:(id)a3;
- (void)setIrisBadgeView:(id)a3;
- (void)setIsIrisAsset:(BOOL)a3;
- (void)setRepresentedObject:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTapRecognizer:(id)a3;
- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3;
- (void)tapGestureRecognized:(id)a3;
- (void)updateAnimationTimerObserving;
@end

@implementation CKAttachmentCell

- (void)dealloc
{
  [(CKAttachmentCell *)self setDelegate:0];
  v3 = +[CKImageAnimationTimer sharedTimer];
  [v3 removeAnimationTimerObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKAttachmentCell;
  [(CKAttachmentCell *)&v4 dealloc];
}

- (CKAttachmentCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKAttachmentCell;
  v3 = -[CKAttachmentCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3)
  {
    v5 = [(CKAttachmentCell *)v3 contentView];
    v6 = [v5 layer];

    if (CKMainScreenScale_once_11 != -1) {
      dispatch_once(&CKMainScreenScale_once_11, &__block_literal_global_23);
    }
    double v7 = *(double *)&CKMainScreenScale_sMainScreenScale_11;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_11 == 0.0) {
      double v7 = 1.0;
    }
    [v6 setBorderWidth:ceil(v7 * 0.5) / v7];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v4 action:sel_tapGestureRecognized_];
    [v8 setDelegate:v4];
    [(CKAttachmentCell *)v4 addGestureRecognizer:v8];
    [(CKAttachmentCell *)v4 setTapRecognizer:v8];
  }
  return v4;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKAttachmentCell;
  -[CKAttachmentCell setSelected:](&v6, sel_setSelected_);
  v5 = [(CKAttachmentCell *)self checkmarkView];
  [v5 setHighlighted:v3];
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    if (a3)
    {
      id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
      v5 = [MEMORY[0x1E4F42A80] ckImageNamed:@"BlueCheckUnselected"];
      objc_super v6 = [MEMORY[0x1E4F42A80] ckImageNamed:@"BlueCheckSelected"];
      double v7 = (void *)[v4 initWithImage:v5 highlightedImage:v6];

      v8 = [(CKAttachmentCell *)self contentView];
      [v8 addSubview:v7];

      [(CKAttachmentCell *)self setCheckmarkView:v7];
    }
    else
    {
      v9 = [(CKAttachmentCell *)self checkmarkView];
      [v9 removeFromSuperview];

      [(CKAttachmentCell *)self setCheckmarkView:0];
    }
    [(CKAttachmentCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)CKAttachmentCell;
  [(CKAttachmentCell *)&v36 layoutSubviews];
  BOOL v3 = [(CKAttachmentCell *)self contentView];
  id v4 = [v3 layer];

  id v5 = [MEMORY[0x1E4F428B8] _ckSystemBackgroundColor];
  objc_msgSend(v4, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

  id v6 = [MEMORY[0x1E4F428B8] _ckSecondarySystemBackgroundColor];
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v6, "CGColor"));

  double v7 = [(CKAttachmentCell *)self checkmarkView];
  if (v7)
  {
    objc_msgSend(v7, "setHighlighted:", -[CKAttachmentCell isSelected](self, "isSelected"));
    [v7 frame];
    double v9 = v8;
    double v11 = v10;
    v12 = [(CKAttachmentCell *)self contentView];
    [v12 bounds];
    double v14 = v13;
    [v7 bounds];
    double v16 = v14 - v15;
    v17 = [(CKAttachmentCell *)self contentView];
    [v17 bounds];
    double v19 = v18;
    [v7 bounds];
    double v21 = v19 - v20;

    objc_msgSend(v7, "setFrame:", v16, v21, v9, v11);
  }
  v22 = [(CKAttachmentCell *)self irisBadgeView];

  if (v22)
  {
    v23 = +[CKUIBehavior sharedBehaviors];
    [v23 verticalBalloonBadgeInset];
    double v25 = v24;

    v26 = +[CKUIBehavior sharedBehaviors];
    [v26 horizontalBalloonBadgeInset];
    double v28 = v27;

    v29 = [(CKAttachmentCell *)self irisBadgeView];
    [v29 sizeToFit];

    v30 = [(CKAttachmentCell *)self irisBadgeView];
    [v30 frame];
    double v32 = v31;
    double v34 = v33;

    v35 = [(CKAttachmentCell *)self irisBadgeView];
    objc_msgSend(v35, "setFrame:", v28, v25, v32, v34);
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKAttachmentCell;
  [(CKAttachmentCell *)&v4 prepareForReuse];
  BOOL v3 = +[CKImageAnimationTimer sharedTimer];
  [v3 removeAnimationTimerObserver:self];

  [(CKAttachmentCell *)self setImage:0];
  [(CKAttachmentCell *)self setFrames:0];
  [(CKAttachmentCell *)self setAnimatedImage:0];
  [(CKAttachmentCell *)self setAlpha:1.0];
}

- (void)tapGestureRecognized:(id)a3
{
  id v4 = [(CKAttachmentCell *)self delegate];
  [v4 attachmentCellTapped:self];
}

- (void)copy:(id)a3
{
  id v5 = [(CKAttachmentCell *)self delegate];
  [v5 performAction:a2 forAttachmentCell:self];
}

- (void)delete:(id)a3
{
  id v5 = [(CKAttachmentCell *)self delegate];
  [v5 performAction:a2 forAttachmentCell:self];
}

- (void)more:(id)a3
{
  id v5 = [(CKAttachmentCell *)self delegate];
  [v5 performAction:a2 forAttachmentCell:self];
}

- (void)saveAttachment:(id)a3
{
  id v5 = [(CKAttachmentCell *)self delegate];
  [v5 performAction:a2 forAttachmentCell:self];
}

- (void)setImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    id v6 = [(CKAttachmentCell *)self contentView];
    double v7 = [v6 layer];

    objc_msgSend(v7, "setContents:", -[CKAttachmentCell _cgImageForUIImage:](self, "_cgImageForUIImage:", self->_image));
    [v7 setContentsGravity:*MEMORY[0x1E4F3A3E0]];
    [v7 setMasksToBounds:1];

    id v5 = v8;
  }
}

- (void)setIconImage:(id)a3
{
  [(CKAttachmentCell *)self setImage:a3];
  id v4 = [(CKAttachmentCell *)self contentView];
  id v5 = [v4 layer];

  [v5 setContentsGravity:*MEMORY[0x1E4F3A3C0]];
  [v5 setMasksToBounds:0];
}

- (void)setAnimatedImage:(id)a3
{
  id v5 = (CKAnimatedImage *)a3;
  if (self->_animatedImage != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)&self->_animatedImage, a3);
    id v6 = [(CKAnimatedImage *)self->_animatedImage frames];
    [(CKAttachmentCell *)self setFrames:v6];
    if ([v6 count]) {
      [v6 objectAtIndex:0];
    }
    else {
    double v7 = [(CKAnimatedImage *)v8 image];
    }
    [(CKAttachmentCell *)self setImage:v7];

    [(CKAttachmentCell *)self updateAnimationTimerObserving];
    id v5 = v8;
  }
}

- (void)setIsIrisAsset:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[CKUIBehavior sharedBehaviors];
  int v6 = [v5 showsBalloonBadges];

  if (v6 && self->_isIrisAsset != v3)
  {
    self->_isIrisAsset = v3;
    double v7 = [(CKAttachmentCell *)self irisBadgeView];
    double v8 = v7;
    if (v3)
    {

      if (!v8)
      {
        id v9 = objc_alloc(MEMORY[0x1E4F42AA0]);
        double v10 = +[CKUIBehavior sharedBehaviors];
        double v11 = [v10 livePhotoBadgeImage];
        id v18 = (id)[v9 initWithImage:v11];

        v12 = [v18 layer];
        LODWORD(v13) = 0.5;
        [v12 setShadowOpacity:v13];

        double v14 = [v18 layer];
        objc_msgSend(v14, "setShadowOffset:", 0.0, 0.0);

        double v15 = [v18 layer];
        [v15 setShadowRadius:1.0];

        double v16 = [(CKAttachmentCell *)self contentView];
        [v16 addSubview:v18];

        [(CKAttachmentCell *)self setIrisBadgeView:v18];
        [(CKAttachmentCell *)self setNeedsLayout];
        [(CKAttachmentCell *)self layoutIfNeeded];
      }
    }
    else
    {

      if (v8)
      {
        v17 = [(CKAttachmentCell *)self irisBadgeView];
        [v17 removeFromSuperview];

        [(CKAttachmentCell *)self setIrisBadgeView:0];
      }
    }
  }
}

- (CGImage)_cgImageForUIImage:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 image];
    id v5 = (CGImage *)[v4 CGImage];
  }
  else
  {
    id v5 = (CGImage *)[v3 CGImage];
  }

  return v5;
}

- (void)updateAnimationTimerObserving
{
  id v3 = [(CKAttachmentCell *)self frames];
  unint64_t v4 = [v3 count];

  id v5 = +[CKImageAnimationTimer sharedTimer];
  id v6 = v5;
  if (v4 < 2) {
    [v5 removeAnimationTimerObserver:self];
  }
  else {
    [v5 addAnimationTimerObserver:self];
  }
}

- (void)animationTimerFired:(double)a3
{
  id v4 = [(CKAnimatedImage *)self->_animatedImage frameForAnimationTime:a3];
  [(CKAttachmentCell *)self setImage:v4];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a3;
  id v6 = [(CKAttachmentCell *)self tapRecognizer];

  if (v6 == v5) {
    return ![(CKAttachmentCell *)self isEditing];
  }
  else {
    return 1;
  }
}

- (UIImage)image
{
  return self->_image;
}

- (CKAnimatedImage)animatedImage
{
  return self->_animatedImage;
}

- (UIImageView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
}

- (CKAttachmentCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKAttachmentCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKAttachmentItem)representedObject
{
  return self->_representedObject;
}

- (void)setRepresentedObject:(id)a3
{
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isIrisAsset
{
  return self->_isIrisAsset;
}

- (BOOL)userExplicitlyUnpausedAnimation
{
  return self->_userExplicitlyUnpausedAnimation;
}

- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3
{
  self->_userExplicitlyUnpausedAnimation = a3;
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
}

- (UIImageView)irisBadgeView
{
  return self->_irisBadgeView;
}

- (void)setIrisBadgeView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irisBadgeView, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_representedObject, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_animatedImage, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end