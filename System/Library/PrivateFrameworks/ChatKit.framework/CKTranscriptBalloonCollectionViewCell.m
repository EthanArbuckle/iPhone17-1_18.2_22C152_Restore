@interface CKTranscriptBalloonCollectionViewCell
+ (id)reuseIdentifier;
- (CKBalloonView)balloonView;
- (id)_balloonViewForChatItem:(id)a3;
- (id)description;
- (int64_t)animationPauseReasons;
- (void)addFilter:(id)a3;
- (void)clearFilters;
- (void)configureForChatItem:(id)a3 context:(id)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAnimationPauseReasons:(int64_t)a3;
- (void)setBalloonView:(id)a3;
@end

@implementation CKTranscriptBalloonCollectionViewCell

- (void)dealloc
{
  v3 = [(CKTranscriptBalloonCollectionViewCell *)self balloonView];
  [v3 removeFromSuperview];

  v4 = [(CKTranscriptBalloonCollectionViewCell *)self balloonView];
  CKBalloonViewReuse(v4);

  [(CKTranscriptBalloonCollectionViewCell *)self setBalloonView:0];
  v5.receiver = self;
  v5.super_class = (Class)CKTranscriptBalloonCollectionViewCell;
  [(CKTranscriptBalloonCollectionViewCell *)&v5 dealloc];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CKTranscriptBalloonCollectionViewCell;
  [(CKTranscriptCollectionViewCell *)&v13 layoutSubviews];
  v3 = [(CKTranscriptBalloonCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(CKTranscriptBalloonCollectionViewCell *)self balloonView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CKTranscriptBalloonCollectionViewCell;
  [(CKTranscriptCollectionViewCell *)&v5 prepareForReuse];
  v3 = [(CKTranscriptBalloonCollectionViewCell *)self balloonView];
  [v3 removeFromSuperview];

  double v4 = [(CKTranscriptBalloonCollectionViewCell *)self balloonView];
  CKBalloonViewReuse(v4);

  [(CKTranscriptBalloonCollectionViewCell *)self setBalloonView:0];
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptBalloonCollectionViewCell;
  double v4 = [(CKTranscriptCollectionViewCell *)&v8 description];
  objc_super v5 = [(CKTranscriptBalloonCollectionViewCell *)self balloonView];
  double v6 = [v3 stringWithFormat:@"%@ balloonView:%@", v4, v5];

  return v6;
}

- (void)setBalloonView:(id)a3
{
  objc_super v5 = (CKBalloonView *)a3;
  p_balloonView = &self->_balloonView;
  balloonView = self->_balloonView;
  if (balloonView != v5)
  {
    double v10 = v5;
    [(CKBalloonView *)balloonView removeFromSuperview];
    objc_storeStrong((id *)&self->_balloonView, a3);
    objc_super v8 = [(CKTranscriptBalloonCollectionViewCell *)self contentView];
    [v8 addSubview:*p_balloonView];

    double v9 = [(CKTranscriptBalloonCollectionViewCell *)self layer];
    objc_msgSend(v9, "setAllowsGroupOpacity:", -[CKBalloonView needsGroupOpacity](*p_balloonView, "needsGroupOpacity"));

    [(CKTranscriptBalloonCollectionViewCell *)self setNeedsLayout];
    objc_super v5 = v10;
  }
}

+ (id)reuseIdentifier
{
  return @"BC";
}

- (void)configureForChatItem:(id)a3 context:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    double v7 = [(CKTranscriptBalloonCollectionViewCell *)self _balloonViewForChatItem:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 configureForLocatingChatItem:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 configureForLocationShareOfferChatItem:v6];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v7 configureForTUConversationChatItem:v6];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v7 configureForMessagePart:v6];
            }
            else {
              [v7 configureForChatItem:v6];
            }
          }
        }
      }
    }
    [v6 size];
    double v9 = v8;
    double v11 = v10;
    v12 = +[CKUIBehavior sharedBehaviors];
    if (v6) {
      [v6 balloonDescriptor];
    }
    else {
      memset(v16, 0, sizeof(v16));
    }
    [v12 balloonMaskSizeWithBalloonDescriptor:v16];
    [v7 setWantsSkinnyMask:v9 < v13];

    v14 = +[CKUIBehavior sharedBehaviors];
    [v14 textBalloonMinHeight];
    [v7 setWantsMultilineMask:v11 > v15];

    [(CKTranscriptBalloonCollectionViewCell *)self setNeedsLayout];
  }
  else
  {
    objc_opt_class();
    objc_opt_class();
    _IMWarn();
  }
}

- (id)_balloonViewForChatItem:(id)a3
{
  double v4 = (objc_class *)[a3 balloonViewClass];
  id v5 = [(CKTranscriptBalloonCollectionViewCell *)self balloonView];
  if (!v5 || (objc_class *)objc_opt_class() != v4)
  {
    uint64_t v6 = CKBalloonViewForClass(v4);

    [(CKTranscriptBalloonCollectionViewCell *)self setBalloonView:v6];
    id v5 = (void *)v6;
  }

  return v5;
}

- (void)addFilter:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptBalloonCollectionViewCell *)self balloonView];
  [v5 prepareForDisplayIfNeeded];

  id v6 = [(CKTranscriptBalloonCollectionViewCell *)self balloonView];
  [v6 addFilter:v4];
}

- (void)clearFilters
{
  id v2 = [(CKTranscriptBalloonCollectionViewCell *)self balloonView];
  [v2 clearFilters];
}

- (void)setAnimationPauseReasons:(int64_t)a3
{
  if (self->_animationPauseReasons != a3)
  {
    self->_animationPauseReasons = a3;
    id v5 = [(CKTranscriptBalloonCollectionViewCell *)self balloonView];
    [v5 setInvisibleInkEffectPaused:a3 != 0];

    id v6 = [(CKTranscriptBalloonCollectionViewCell *)self balloonView];
    [v6 setAnimationPaused:((unint64_t)a3 >> 1) & 1];
  }
}

- (CKBalloonView)balloonView
{
  return self->_balloonView;
}

- (int64_t)animationPauseReasons
{
  return self->_animationPauseReasons;
}

- (void).cxx_destruct
{
}

@end