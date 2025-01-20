@interface SampleTextCollectionViewCell
- (NSString)fontTextStyle;
- (void)prepareForReuse;
- (void)setFontTextStyle:(id)a3;
@end

@implementation SampleTextCollectionViewCell

- (void)setFontTextStyle:(id)a3
{
  objc_storeStrong((id *)&self->_fontTextStyle, a3);
  id v5 = a3;
  id v6 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v23 = v5;
  v7 = +[UIFont preferredFontForTextStyle:v5];
  [v6 setFont:v7];

  [v6 setAdjustsFontForContentSizeCategory:1];
  v8 = [v5 stringByReplacingOccurrencesOfString:@"UICTFontTextStyle" withString:&stru_100094078];
  [v6 setText:v8];

  v9 = [(SampleTextCollectionViewCell *)self contentView];
  [v9 addSubview:v6];

  v26 = [v6 topAnchor];
  v27 = [(SampleTextCollectionViewCell *)self contentView];
  v25 = [v27 topAnchor];
  v24 = [v26 constraintEqualToAnchor:v25 constant:2.0];
  v28[0] = v24;
  v21 = [v6 leftAnchor];
  v22 = [(SampleTextCollectionViewCell *)self contentView];
  v20 = [v22 leftAnchor];
  v19 = [v21 constraintEqualToAnchor:v20 constant:2.0];
  v28[1] = v19;
  v10 = [v6 rightAnchor];
  v11 = [(SampleTextCollectionViewCell *)self contentView];
  v12 = [v11 rightAnchor];
  v13 = [v10 constraintEqualToAnchor:v12 constant:-2.0];
  v28[2] = v13;
  v14 = [v6 bottomAnchor];
  v15 = [(SampleTextCollectionViewCell *)self contentView];
  v16 = [v15 bottomAnchor];
  v17 = [v14 constraintEqualToAnchor:v16 constant:-2.0];
  v28[3] = v17;
  v18 = +[NSArray arrayWithObjects:v28 count:4];
  +[NSLayoutConstraint activateConstraints:v18];
}

- (void)prepareForReuse
{
  v13.receiver = self;
  v13.super_class = (Class)SampleTextCollectionViewCell;
  [(SampleTextCollectionViewCell *)&v13 prepareForReuse];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(SampleTextCollectionViewCell *)self contentView];
  v4 = [v3 subviews];

  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) removeFromSuperview];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (NSString)fontTextStyle
{
  return self->_fontTextStyle;
}

- (void).cxx_destruct
{
}

@end