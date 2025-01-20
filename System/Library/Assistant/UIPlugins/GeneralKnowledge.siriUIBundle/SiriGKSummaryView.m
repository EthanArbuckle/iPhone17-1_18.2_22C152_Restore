@interface SiriGKSummaryView
- (CGSize)_sizeThatFits:(CGSize)a3 setFrames:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SiriGKSummaryView)initWithText:(id)a3 caption:(id)a4 imageResource:(id)a5 usingPersistentStore:(id)a6;
- (id)_linkTextAttributes;
- (id)_textAttributes;
- (void)_configureWithImage:(id)a3;
- (void)layoutSubviews;
@end

@implementation SiriGKSummaryView

- (SiriGKSummaryView)initWithText:(id)a3 caption:(id)a4 imageResource:(id)a5 usingPersistentStore:(id)a6
{
  id v10 = a3;
  id v66 = a4;
  id v11 = a5;
  id v65 = a6;
  v77.receiver = self;
  v77.super_class = (Class)SiriGKSummaryView;
  v12 = [(SiriGKSummaryView *)&v77 init];
  p_isa = (id *)&v12->super.super.super.super.isa;
  if (!v12)
  {
LABEL_17:
    v15 = p_isa;
    goto LABEL_18;
  }
  -[SiriGKView setEdgeInsets:](v12, "setEdgeInsets:", 0.0, SiriUIPlatterStyle[32], 0.0, SiriUIPlatterStyle[34]);
  id v14 = [v10 length];
  if (v11 || v14)
  {
    id v16 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v17 = p_isa[6];
    p_isa[6] = v16;

    [p_isa addSubview:p_isa[6]];
    if (v10)
    {
      id v18 = objc_alloc_init((Class)UITextView);
      id v19 = p_isa[7];
      p_isa[7] = v18;

      id v20 = p_isa[7];
      v21 = +[UIColor clearColor];
      [v20 setBackgroundColor:v21];

      [p_isa[7] setScrollEnabled:0];
      [p_isa[7] setUserInteractionEnabled:0];
      v22 = [p_isa[7] layoutManager];
      [v22 setUsesFontLeading:0];

      objc_msgSend(p_isa[7], "setContentInset:", 0.0, -5.0, 0.0, 0.0);
      id v23 = p_isa[7];
      id v24 = objc_alloc((Class)NSAttributedString);
      v25 = [p_isa _textAttributes];
      id v26 = [v24 initWithString:v10 attributes:v25];
      [v23 setAttributedText:v26];

      id v27 = p_isa[7];
      v28 = [p_isa _linkTextAttributes];
      [v27 setLinkTextAttributes:v28];

      [p_isa[6] addSubview:p_isa[7]];
    }
    id v29 = objc_alloc_init((Class)NSMutableParagraphStyle);
    [v29 setMinimumLineHeight:15.0];
    [v29 setMaximumLineHeight:15.0];
    [v29 setAlignment:1];
    LODWORD(v30) = 1.0;
    [v29 setHyphenationFactor:v30];
    if (v11)
    {
      id v31 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 90.0, 90.0);
      id v32 = p_isa[10];
      p_isa[10] = v31;

      id v33 = p_isa[10];
      v34 = +[UIColor colorWithWhite:1.0 alpha:0.3];
      [v33 setBackgroundColor:v34];

      [p_isa[6] addSubview:p_isa[10]];
      id v35 = objc_alloc((Class)UIImageView);
      v36 = +[NSBundle bundleForClass:objc_opt_class()];
      v37 = +[UIImage imageNamed:@"missingPhoto" inBundle:v36];
      v38 = +[UIColor siriui_maskingColor];
      v39 = [v37 _flatImageWithColor:v38];
      id v63 = [v35 initWithImage:v39];

      [v63 frame];
      [p_isa[10] frame];
      UIRectCenteredIntegralRect();
      objc_msgSend(v63, "setFrame:");
      [p_isa[10] addSubview:v63];
      id v40 = objc_alloc_init((Class)UIImageView);
      id v41 = p_isa[9];
      p_isa[9] = v40;

      [p_isa[9] setContentMode:1];
      if (v66)
      {
        uint64_t v42 = +[SiriSharedUIContentLabel label];
        id v43 = p_isa[8];
        p_isa[8] = (id)v42;

        id v44 = p_isa[8];
        v45 = +[UIFont siriui_lightWeightFontWithSize:12.0];
        [v44 setFont:v45];

        id v46 = p_isa[8];
        id v47 = objc_alloc((Class)NSAttributedString);
        NSAttributedStringKey v78 = NSParagraphStyleAttributeName;
        id v79 = v29;
        v48 = +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
        id v49 = [v47 initWithString:v66 attributes:v48];
        [v46 setAttributedText:v49];

        [p_isa[8] setNumberOfLines:0];
        [p_isa[6] addSubview:p_isa[8]];
      }
      v50 = objc_msgSend(v11, "resourceUrl", v63);
      v51 = [v50 absoluteString];

      v52 = [v65 imageForKey:v51];
      if (v52)
      {
        [p_isa _configureWithImage:v52];
      }
      else
      {
        objc_initWeak(&location, p_isa);
        v53 = +[SiriUIURLSession sharedURLSession];
        v54 = [v11 resourceUrl];
        v55 = +[UIColor siriui_maskingColor];
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472;
        v72[2] = sub_B994;
        v72[3] = &unk_18580;
        objc_copyWeak(&v75, &location);
        id v73 = v65;
        id v74 = v51;
        id v56 = objc_msgSend(v53, "imageTaskWithHTTPGetRequest:client:fitToSize:fillColor:completionHandler:", v54, p_isa, v55, v72, 90.0, 90.0);

        objc_destroyWeak(&v75);
        objc_destroyWeak(&location);
      }
    }
    if (SiriLanguageIsRTL())
    {
      id v57 = p_isa[6];
      CGAffineTransformMakeScale(&v71, -1.0, 1.0);
      [v57 setTransform:&v71];
      id v58 = p_isa[7];
      CGAffineTransformMakeScale(&v70, -1.0, 1.0);
      [v58 setTransform:&v70];
      id v59 = p_isa[10];
      CGAffineTransformMakeScale(&v69, -1.0, 1.0);
      [v59 setTransform:&v69];
      id v60 = p_isa[8];
      CGAffineTransformMakeScale(&v68, -1.0, 1.0);
      [v60 setTransform:&v68];
      id v61 = p_isa[9];
      CGAffineTransformMakeScale(&v67, -1.0, 1.0);
      [v61 setTransform:&v67];
    }

    goto LABEL_17;
  }
  v15 = 0;
LABEL_18:

  return v15;
}

- (void)_configureWithImage:(id)a3
{
  [(UIImageView *)self->_insetImageView setImage:a3];
  insetImageView = self->_insetImageView;
  v5 = +[UIColor clearColor];
  [(UIImageView *)insetImageView setBackgroundColor:v5];

  [(UIImageView *)self->_insetImageView setAlpha:0.0];
  [(UIView *)self->_contentView addSubview:self->_insetImageView];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_BB58;
  v7[3] = &unk_185A8;
  v7[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_BBB4;
  v6[3] = &unk_185D0;
  v6[4] = self;
  +[UIView animateWithDuration:v7 animations:v6 completion:0.2];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SiriGKView *)self edgeInsets];
  double v10 = width - v8 - v9;

  -[SiriGKSummaryView _sizeThatFits:setFrames:](self, "_sizeThatFits:setFrames:", 0, v10, height - v6 - v7);
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)SiriGKSummaryView;
  [(SiriGKSummaryView *)&v11 layoutSubviews];
  [(SiriGKSummaryView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[SiriGKSummaryView _sizeThatFits:setFrames:](self, "_sizeThatFits:setFrames:", 1, v7, 1.79769313e308);
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
}

- (id)_linkTextAttributes
{
  NSAttributedStringKey v5 = NSForegroundColorAttributeName;
  v2 = +[UIColor siriui_linkTextColor];
  double v6 = v2;
  double v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

- (id)_textAttributes
{
  id v2 = objc_alloc_init((Class)NSMutableParagraphStyle);
  if (SiriUIIsCompactWidth()) {
    double v3 = 20.0;
  }
  else {
    double v3 = 25.0;
  }
  [v2 setMinimumLineHeight:v3];
  [v2 setMaximumLineHeight:v3];
  [v2 setLineBreakMode:0];
  v11[0] = v2;
  v10[0] = NSParagraphStyleAttributeName;
  v10[1] = NSFontAttributeName;
  int v4 = SiriUIIsCompactWidth();
  double v5 = 18.0;
  if (v4) {
    double v5 = 14.0;
  }
  double v6 = +[UIFont siriui_lightWeightFontWithSize:v5];
  v11[1] = v6;
  v10[2] = NSForegroundColorAttributeName;
  double v7 = +[UIColor siriui_textColor];
  v11[2] = v7;
  double v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

- (CGSize)_sizeThatFits:(CGSize)a3 setFrames:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  insetImageView = self->_insetImageView;
  if (insetImageView || self->_placeholderView)
  {
    double x = a3.width + -90.0;
    if (a4)
    {
      double v9 = 90.0;
      double y = 15.0;
      -[UIImageView setFrame:](insetImageView, "setFrame:", a3.width + -90.0, 15.0, 90.0, 90.0);
      -[UIView setFrame:](self->_placeholderView, "setFrame:", width + -90.0, 15.0, 90.0, 90.0);
    }
    else
    {
      double y = 15.0;
      double v9 = 90.0;
    }
    CGFloat v11 = 90.0;
  }
  else
  {
    CGFloat v11 = CGRectZero.size.width;
    double v9 = CGRectZero.size.height;
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
  }
  CGFloat v12 = CGRectZero.origin.x;
  CGFloat v13 = CGRectZero.origin.y;
  CGFloat v15 = CGRectZero.size.width;
  CGFloat v14 = CGRectZero.size.height;
  captionLabel = self->_captionLabel;
  ddouble x = width;
  double v59 = y;
  CGFloat rect = v11;
  if (!captionLabel)
  {
    id v19 = self->_insetImageView;
    CGFloat v53 = CGRectZero.origin.x;
    double v17 = CGRectZero.origin.y;
    CGFloat v57 = CGRectZero.size.width;
    CGFloat r2 = CGRectZero.size.height;
LABEL_15:
    CGFloat v54 = v17;
    if (!v19 && !self->_placeholderView) {
      goto LABEL_24;
    }
LABEL_19:
    CGFloat v23 = v9;
    CGFloat v21 = v59;
    CGFloat v22 = rect;
    CGFloat v20 = x;
    goto LABEL_20;
  }
  CGFloat v52 = CGRectZero.origin.y;
  [(UILabel *)captionLabel frame];
  v65.origin.double x = x;
  v65.origin.double y = y;
  v65.size.double width = v11;
  v65.size.double height = v9;
  double v17 = CGRectGetMaxY(v65) + 3.0;
  CGFloat v57 = 90.0;
  -[UILabel sizeThatFits:](self->_captionLabel, "sizeThatFits:");
  CGFloat r2 = v18;
  if (v4) {
    -[UILabel setFrame:](self->_captionLabel, "setFrame:", x, v17, 90.0, v18);
  }
  id v19 = self->_insetImageView;
  if (!self->_captionLabel)
  {
    CGFloat v53 = x;
    CGFloat v13 = v52;
    CGFloat v12 = CGRectZero.origin.x;
    goto LABEL_15;
  }
  CGFloat v54 = v17;
  if (v19)
  {
    v77.size.double width = 90.0;
    v66.origin.double x = x;
    v66.origin.double y = y;
    v66.size.double width = v11;
    v66.size.double height = v9;
    v77.origin.double x = x;
    v77.origin.double y = v17;
    CGFloat v57 = 90.0;
    v77.size.double height = r2;
    CGRect v67 = CGRectUnion(v66, v77);
    CGFloat v20 = v67.origin.x;
    CGFloat v21 = v67.origin.y;
    CGFloat v22 = v67.size.width;
    CGFloat v23 = v67.size.height;
    CGFloat v53 = x;
    CGFloat v13 = v52;
    CGFloat v12 = CGRectZero.origin.x;
    goto LABEL_20;
  }
  CGFloat v53 = x;
  CGFloat v57 = 90.0;
  CGFloat v23 = v14;
  CGFloat v22 = v15;
  CGFloat v13 = v52;
  CGFloat v12 = CGRectZero.origin.x;
  CGFloat v21 = v52;
  CGFloat v20 = CGRectZero.origin.x;
  if (self->_placeholderView) {
    goto LABEL_19;
  }
LABEL_20:
  v68.origin.double x = v20;
  v68.origin.double y = v21;
  v68.size.double width = v22;
  v68.size.double height = v23;
  CGFloat v24 = v15;
  CGFloat v25 = v14;
  if (!CGRectEqualToRect(v68, *(CGRect *)&v12))
  {
    if (SiriLanguageIsRTL())
    {
      CGAffineTransformMakeScale(&v62, -1.0, 1.0);
      v69.origin.double x = v20;
      v69.origin.double y = v21;
      v69.size.double width = v22;
      v69.size.double height = v23;
      CGRect v70 = CGRectApplyAffineTransform(v69, &v62);
      CGRect v71 = CGRectOffset(v70, dx, 0.0);
      CGFloat v20 = v71.origin.x;
      CGFloat v21 = v71.origin.y;
      CGFloat v22 = v71.size.width;
      CGFloat v23 = v71.size.height;
    }
    v72.origin.double x = v20;
    v72.origin.double y = v21;
    v72.size.double width = v22;
    v72.size.double height = v23;
    CGRect v73 = CGRectInset(v72, -3.0, -3.0);
    double v26 = v73.origin.x;
    double v27 = v73.origin.y;
    double v28 = v73.size.width;
    double v29 = v73.size.height;
    double v30 = [(UITextView *)self->_summaryTextView textContainer];
    id v31 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v26, v27, v28, v29);
    id v63 = v31;
    id v32 = +[NSArray arrayWithObjects:&v63 count:1];
    [v30 setExclusionPaths:v32];
  }
LABEL_24:
  [(UITextView *)self->_summaryTextView frame];
  double v34 = v33;
  double v36 = v35;
  -[UITextView sizeThatFits:](self->_summaryTextView, "sizeThatFits:", dx, height);
  CGFloat v39 = v37;
  CGFloat v40 = v38;
  if (v4) {
    -[UITextView setFrame:](self->_summaryTextView, "setFrame:", v34, v36, v37, v38);
  }
  double v41 = v59;
  if (!self->_summaryTextView)
  {
    [(SiriGKSummaryView *)self bounds];
    UIRectCenteredXInRect();
    double v41 = v44;
    double v9 = v45;
    CGFloat rect = v43;
    if (v4)
    {
      double v46 = v43;
      double v60 = v42;
      -[UIImageView setFrame:](self->_insetImageView, "setFrame:");
      -[UIView setFrame:](self->_placeholderView, "setFrame:", v60, v41, v46, v9);
      double x = v60;
    }
    else
    {
      double x = v42;
    }
  }
  v74.origin.double x = v34;
  v74.origin.double y = v36;
  v74.size.double width = v39;
  v74.size.double height = v40;
  double MaxY = CGRectGetMaxY(v74);
  v75.origin.double x = v53;
  v75.origin.double y = v54;
  v75.size.double width = v57;
  v75.size.double height = r2;
  double v48 = CGRectGetMaxY(v75);
  if (MaxY < v48) {
    double MaxY = v48;
  }
  v76.origin.double x = x;
  v76.origin.double y = v41;
  v76.size.double width = rect;
  v76.size.double height = v9;
  double v49 = CGRectGetMaxY(v76) + 5.0;
  if (MaxY >= v49) {
    double v49 = MaxY;
  }
  double v50 = v49 + 10.0;
  double v51 = dx;
  result.double height = v50;
  result.double width = v51;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_insetImageView, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);
  objc_storeStrong((id *)&self->_summaryTextView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end