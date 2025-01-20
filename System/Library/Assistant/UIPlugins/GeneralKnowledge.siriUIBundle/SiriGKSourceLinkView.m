@interface SiriGKSourceLinkView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SiriGKSourceLinkView)initWithLinkText:(id)a3 punchOut:(id)a4;
- (void)updateConstraints;
@end

@implementation SiriGKSourceLinkView

- (SiriGKSourceLinkView)initWithLinkText:(id)a3 punchOut:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SiriGKSourceLinkView;
  v8 = [(SiriGKSourceLinkView *)&v26 init];
  v9 = v8;
  if (v8)
  {
    -[SiriGKView setEdgeInsets:](v8, "setEdgeInsets:", 0.0, SiriUIPlatterStyle[32], 0.0, SiriUIPlatterStyle[34]);
    if (v7) {
      [(SiriGKView *)v9 setCommand:v7];
    }
    id v10 = objc_alloc((Class)UIImageView);
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = +[UIImage imageNamed:@"safariIcon" inBundle:v11];
    v13 = +[UIColor siriui_maskingColor];
    v14 = [v12 _flatImageWithColor:v13];
    v15 = (UIImageView *)[v10 initWithImage:v14];
    safariIconImageView = v9->_safariIconImageView;
    v9->_safariIconImageView = v15;

    [(UIImageView *)v9->_safariIconImageView setContentMode:4];
    LODWORD(v17) = 1148846080;
    [(UIImageView *)v9->_safariIconImageView setContentHuggingPriority:0 forAxis:v17];
    LODWORD(v18) = 1148846080;
    [(UIImageView *)v9->_safariIconImageView setContentHuggingPriority:1 forAxis:v18];
    [(UIImageView *)v9->_safariIconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SiriGKSourceLinkView *)v9 addSubview:v9->_safariIconImageView];
    if (v6)
    {
      uint64_t v19 = +[SiriSharedUIContentLabel label];
      titleLabel = v9->_titleLabel;
      v9->_titleLabel = (UILabel *)v19;

      v21 = v9->_titleLabel;
      int v22 = SiriUIIsCompactWidth();
      double v23 = 18.0;
      if (v22) {
        double v23 = 14.0;
      }
      v24 = +[UIFont siriui_lightWeightFontWithSize:v23];
      [(UILabel *)v21 setFont:v24];

      [(UILabel *)v9->_titleLabel setText:v6];
      [(UILabel *)v9->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [(SiriGKSourceLinkView *)v9 addSubview:v9->_titleLabel];
    }
    [(SiriGKSourceLinkView *)v9 setNeedsUpdateConstraints];
  }

  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(SiriGKView *)self edgeInsets];
  double v6 = width - (v4 + v5);
  double v7 = SiriUIPlatterStyle[26];
  result.height = v7;
  result.double width = v6;
  return result;
}

- (void)updateConstraints
{
  v11.receiver = self;
  v11.super_class = (Class)SiriGKSourceLinkView;
  [(SiriGKSourceLinkView *)&v11 updateConstraints];
  if (!self->_hasSetUpConstraints)
  {
    titleLabel = self->_titleLabel;
    if (titleLabel)
    {
      double v4 = _NSDictionaryOfVariableBindings(@"_titleLabel, _safariIconImageView", titleLabel, self->_safariIconImageView, 0);
      double v5 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|[_titleLabel]-padding-[_safariIconImageView]|", 0, &off_18CD8, v4);
      [(SiriGKSourceLinkView *)self addConstraints:v5];

      double v6 = _NSDictionaryOfVariableBindings(@"_titleLabel, _safariIconImageView", self->_titleLabel, self->_safariIconImageView, 0);
      CFStringRef v7 = @"V:|[_titleLabel]|";
    }
    else
    {
      double v6 = _NSDictionaryOfVariableBindings(@"_safariIconImageView", self->_safariIconImageView, 0);
      CFStringRef v7 = @"H:[_safariIconImageView]|";
    }
    v8 = +[NSLayoutConstraint constraintsWithVisualFormat:v7 options:0 metrics:0 views:v6];
    [(SiriGKSourceLinkView *)self addConstraints:v8];

    v9 = _NSDictionaryOfVariableBindings(@"_safariIconImageView", self->_safariIconImageView, 0);
    id v10 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_safariIconImageView]|" options:0 metrics:0 views:v9];
    [(SiriGKSourceLinkView *)self addConstraints:v10];

    self->_hasSetUpConstraints = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safariIconImageView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end