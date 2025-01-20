@interface RCOverlayBarLayer
+ (double)_internalSelectionBarWidth;
+ (double)_internalSelectionKnobRadius;
+ (double)selectionBarWidth;
+ (double)selectionKnobRadius;
- (BOOL)barWidthMatchesKnobs;
- (RCOverlayBarLayer)initWithColor:(id)a3 selectionExtentIncludingKnobs:(double)a4 topKnob:(BOOL)a5 bottomKnob:(BOOL)a6 widthMultiplier:(double)a7 barWidthMatchesKnobs:(BOOL)a8;
- (UIColor)color;
- (UIImage)barGlyph;
- (double)selectionBarWidth;
- (double)selectionKnobRadius;
- (double)widthMultiplier;
- (id)barComponents;
- (void)_loadWithColor:(id)a3 selectionExtentIncludingKnobs:(double)a4 topKnob:(BOOL)a5 bottomKnob:(BOOL)a6;
- (void)layoutSublayers;
- (void)setBarGlyph:(id)a3;
- (void)setBarWidthMatchesKnobs:(BOOL)a3;
- (void)setColor:(id)a3;
- (void)setWidthMultiplier:(double)a3;
@end

@implementation RCOverlayBarLayer

+ (double)selectionBarWidth
{
  +[RCOverlayBarLayer _internalSelectionBarWidth];
  return result;
}

+ (double)selectionKnobRadius
{
  +[RCOverlayBarLayer _internalSelectionKnobRadius];
  return result;
}

+ (double)_internalSelectionBarWidth
{
  v2 = +[UIScreen mainScreen];
  v3 = [v2 traitCollection];
  v4 = [v3 preferredContentSizeCategory];

  v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  if (UIContentSizeCategoryIsAccessibilityCategory(v4)) {
    [v5 selectionBarWidthAX];
  }
  else {
    [v5 selectionBarWidth];
  }
  double v7 = v6;

  return v7;
}

+ (double)_internalSelectionKnobRadius
{
  v2 = +[UIScreen mainScreen];
  v3 = [v2 traitCollection];
  v4 = [v3 preferredContentSizeCategory];

  v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  if (UIContentSizeCategoryIsAccessibilityCategory(v4)) {
    [v5 selectionKnobRadiusAX];
  }
  else {
    [v5 selectionKnobRadius];
  }
  double v7 = v6;

  return v7;
}

- (RCOverlayBarLayer)initWithColor:(id)a3 selectionExtentIncludingKnobs:(double)a4 topKnob:(BOOL)a5 bottomKnob:(BOOL)a6 widthMultiplier:(double)a7 barWidthMatchesKnobs:(BOOL)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RCOverlayBarLayer;
  v16 = [(RCOverlayBarLayer *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_color, a3);
    v17->_widthMultiplier = a7;
    v17->_barWidthMatchesKnobs = a8;
    [(RCOverlayBarLayer *)v17 _loadWithColor:v15 selectionExtentIncludingKnobs:v11 topKnob:v10 bottomKnob:a4];
  }

  return v17;
}

- (double)selectionKnobRadius
{
  +[RCOverlayBarLayer _internalSelectionKnobRadius];
  return v3 * self->_widthMultiplier;
}

- (double)selectionBarWidth
{
  if ([(RCOverlayBarLayer *)self barWidthMatchesKnobs])
  {
    [(RCOverlayBarLayer *)self selectionKnobRadius];
    return v3 + v3;
  }
  else
  {
    +[RCOverlayBarLayer _internalSelectionBarWidth];
  }
  return result;
}

- (id)barComponents
{
  bottomKnob = self->_bottomKnob;
  v5[0] = self->_topKnob;
  v5[1] = bottomKnob;
  v5[2] = self->_bar;
  double v3 = +[NSArray arrayWithObjects:v5 count:3];

  return v3;
}

- (void)setColor:(id)a3
{
  id v5 = a3;
  p_color = &self->_color;
  if (([v5 isEqual:self->_color] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v7 = [(RCOverlayBarLayer *)self barComponents];
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        BOOL v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v11);
          objc_msgSend(v12, "setBackgroundColor:", -[UIColor CGColor](*p_color, "CGColor"));
          [v12 setOpaque:1];
          BOOL v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)setBarGlyph:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_barGlyph] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_barGlyph, a3);
    [v5 scale];
    -[CALayer setContentsScale:](self->_bar, "setContentsScale:");
    [(CALayer *)self->_bar setContentsGravity:kCAGravityCenter];
    -[CALayer setContents:](self->_bar, "setContents:", [v5 CGImage]);
  }
}

- (void)_loadWithColor:(id)a3 selectionExtentIncludingKnobs:(double)a4 topKnob:(BOOL)a5 bottomKnob:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  [(RCOverlayBarLayer *)self selectionKnobRadius];
  double v12 = v11;
  [(RCOverlayBarLayer *)self selectionBarWidth];
  double v14 = v13;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_AB54;
  v52[3] = &unk_6CFF8;
  double v54 = a4;
  double v55 = v12;
  double v56 = v13;
  id v15 = v10;
  id v53 = v15;
  long long v16 = objc_retainBlock(v52);
  v46 = _NSConcreteStackBlock;
  uint64_t v47 = 3221225472;
  v48 = sub_ABD8;
  v49 = &unk_6D020;
  double v51 = v12;
  id v17 = v15;
  id v50 = v17;
  v18 = objc_retainBlock(&v46);
  ((void (*)(void ***, uint64_t, uint64_t, uint64_t))v18[2])(v18, v19, v20, v21);
  v22 = (CALayer *)objc_claimAutoreleasedReturnValue();
  topKnob = self->_topKnob;
  self->_topKnob = v22;

  if (!v7)
  {
    [(CALayer *)self->_topKnob bounds];
    -[CALayer setBounds:](self->_topKnob, "setBounds:");
  }
  ((void (*)(void ***))v18[2])(v18);
  v24 = (CALayer *)objc_claimAutoreleasedReturnValue();
  bottomKnob = self->_bottomKnob;
  self->_bottomKnob = v24;

  if (!v6)
  {
    [(CALayer *)self->_bottomKnob bounds];
    -[CALayer setBounds:](self->_bottomKnob, "setBounds:");
  }
  ((void (*)(void *))v16[2])(v16);
  v26 = (CALayer *)objc_claimAutoreleasedReturnValue();
  bar = self->_bar;
  self->_bar = v26;

  double v28 = RCRoundCoord(v12 + v14 * -0.5);
  [(CALayer *)self->_topKnob bounds];
  double Height = CGRectGetHeight(v57);
  double v30 = RCRoundCoord(Height);
  [(CALayer *)self->_bar frame];
  double v32 = RCRoundCoord(v31);
  [(CALayer *)self->_bar frame];
  -[CALayer setFrame:](self->_bar, "setFrame:", v28, v30, v32, RCRoundCoord(v33));
  [(CALayer *)self->_bar frame];
  double MaxY = CGRectGetMaxY(v58);
  if ([(RCOverlayBarLayer *)self barWidthMatchesKnobs]) {
    double v35 = v12;
  }
  else {
    double v35 = 0.0;
  }
  double v36 = RCRoundCoord(MaxY - v35);
  [(CALayer *)self->_bottomKnob frame];
  double v38 = RCRoundCoord(v37);
  [(CALayer *)self->_bottomKnob frame];
  -[CALayer setFrame:](self->_bottomKnob, "setFrame:", 0.0, v36, v38, RCRoundCoord(v39));
  if ([(RCOverlayBarLayer *)self barWidthMatchesKnobs]) {
    double v40 = v12;
  }
  else {
    double v40 = 0.0;
  }
  double v41 = RCRoundCoord(v40);
  [(CALayer *)self->_topKnob frame];
  double v43 = RCRoundCoord(v42);
  [(CALayer *)self->_topKnob frame];
  -[CALayer setFrame:](self->_topKnob, "setFrame:", 0.0, v41, v43, RCRoundCoord(v44));
  [(CALayer *)self->_bottomKnob frame];
  double Width = CGRectGetWidth(v59);
  [(CALayer *)self->_bottomKnob frame];
  -[RCOverlayBarLayer setBounds:](self, "setBounds:", 0.0, 0.0, Width, CGRectGetMaxY(v60));
  -[RCOverlayBarLayer setAnchorPoint:](self, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  [(RCOverlayBarLayer *)self addSublayer:self->_bar];
  if (v7) {
    [(RCOverlayBarLayer *)self addSublayer:self->_topKnob];
  }
  if (v6) {
    [(RCOverlayBarLayer *)self addSublayer:self->_bottomKnob];
  }
}

- (void)layoutSublayers
{
  v44.receiver = self;
  v44.super_class = (Class)RCOverlayBarLayer;
  [(RCOverlayBarLayer *)&v44 layoutSublayers];
  [(RCOverlayBarLayer *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CALayer *)self->_bottomKnob frame];
  double v12 = v11;
  double v14 = v13;
  v45.origin.x = v4;
  v45.origin.y = v6;
  v45.size.width = v8;
  v45.size.height = v10;
  double MidX = CGRectGetMidX(v45);
  [(CALayer *)self->_bottomKnob bounds];
  CGFloat v16 = CGRectGetMidX(v46);
  double v17 = RCRoundCoord(MidX - v16);
  v47.origin.x = v4;
  v47.origin.y = v6;
  v47.size.width = v8;
  v47.size.height = v10;
  double Height = CGRectGetHeight(v47);
  [(CALayer *)self->_bottomKnob frame];
  CGFloat v19 = CGRectGetHeight(v48);
  -[CALayer setFrame:](self->_bottomKnob, "setFrame:", v17, RCRoundCoord(Height - v19), v12, v14);
  [(CALayer *)self->_topKnob frame];
  double v21 = v20;
  double v23 = v22;
  v49.origin.x = v4;
  v49.origin.y = v6;
  v49.size.width = v8;
  v49.size.height = v10;
  double v24 = CGRectGetMidX(v49);
  [(CALayer *)self->_topKnob bounds];
  CGFloat v25 = CGRectGetMidX(v50);
  -[CALayer setFrame:](self->_topKnob, "setFrame:", RCRoundCoord(v24 - v25), 0.0, v21, v23);
  [(CALayer *)self->_bar frame];
  double v27 = v26;
  CGFloat v29 = v28;
  v51.origin.x = v4;
  v51.origin.y = v6;
  v51.size.width = v8;
  v51.size.height = v10;
  double v30 = CGRectGetMidX(v51);
  [(RCOverlayBarLayer *)self selectionBarWidth];
  double v32 = RCRoundCoord(v30 + v31 * -0.5);
  unsigned int v33 = [(RCOverlayBarLayer *)self barWidthMatchesKnobs];
  topKnob = self->_topKnob;
  if (v33)
  {
    [(CALayer *)topKnob frame];
    double MidY = CGRectGetMidY(v52);
  }
  else
  {
    [(CALayer *)topKnob bounds];
    double MidY = CGRectGetMaxY(v53);
  }
  double v36 = MidY;
  unsigned int v37 = [(RCOverlayBarLayer *)self barWidthMatchesKnobs];
  [(CALayer *)self->_bottomKnob frame];
  if (v37) {
    double MinY = CGRectGetMidY(*(CGRect *)&v38);
  }
  else {
    double MinY = CGRectGetMinY(*(CGRect *)&v38);
  }
  double v43 = MinY;
  v54.origin.x = v32;
  v54.origin.y = v36;
  v54.size.width = v27;
  v54.size.height = v29;
  -[CALayer setFrame:](self->_bar, "setFrame:", v32, v36, v27, v43 - CGRectGetMinY(v54));
}

- (UIColor)color
{
  return self->_color;
}

- (UIImage)barGlyph
{
  return self->_barGlyph;
}

- (double)widthMultiplier
{
  return self->_widthMultiplier;
}

- (void)setWidthMultiplier:(double)a3
{
  self->_widthMultiplier = a3;
}

- (BOOL)barWidthMatchesKnobs
{
  return self->_barWidthMatchesKnobs;
}

- (void)setBarWidthMatchesKnobs:(BOOL)a3
{
  self->_barWidthMatchesKnobs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barGlyph, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_bottomKnob, 0);
  objc_storeStrong((id *)&self->_bar, 0);

  objc_storeStrong((id *)&self->_topKnob, 0);
}

@end