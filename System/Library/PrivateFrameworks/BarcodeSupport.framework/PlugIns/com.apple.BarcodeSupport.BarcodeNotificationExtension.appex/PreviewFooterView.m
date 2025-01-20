@interface PreviewFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PreviewFooterView)initWithTitle:(id)a3 subtitle:(id)a4;
@end

@implementation PreviewFooterView

- (PreviewFooterView)initWithTitle:(id)a3 subtitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v63.receiver = self;
  v63.super_class = (Class)PreviewFooterView;
  v8 = [(PreviewFooterView *)&v63 init];
  if (v8)
  {
    id v9 = objc_alloc_init((Class)UIView);
    v10 = +[UIColor _barHairlineShadowColor];
    [v9 setBackgroundColor:v10];

    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PreviewFooterView *)v8 addSubview:v9];
    v59 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCaption1 addingSymbolicTraits:2 options:0];
    v11 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", 0.0);
    id v12 = objc_alloc_init((Class)UILabel);
    [v12 setFont:v11];
    id v61 = v6;
    [v12 setText:v6];
    v13 = +[UIColor labelColor];
    [v12 setTextColor:v13];

    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    v62 = v12;
    [(PreviewFooterView *)v8 addSubview:v12];
    id v14 = objc_alloc_init((Class)UILabel);
    v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [v14 setFont:v15];

    id v60 = v7;
    [v14 setText:v7];
    v16 = +[UIColor systemGrayColor];
    [v14 setTextColor:v16];

    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PreviewFooterView *)v8 addSubview:v14];
    v17 = [v9 heightAnchor];
    double v18 = *(double *)&qword_10000CEA8;
    if (*(double *)&qword_10000CEA8 == 0.0)
    {
      v19 = +[UIScreen mainScreen];
      [v19 scale];
      qword_10000CEA8 = v20;

      double v18 = *(double *)&qword_10000CEA8;
    }
    v58 = [v17 constraintEqualToConstant:1.0 / v18];
    v64[0] = v58;
    v57 = [v9 leadingAnchor];
    v56 = [(PreviewFooterView *)v8 leadingAnchor];
    v55 = [v57 constraintEqualToAnchor:v56];
    v64[1] = v55;
    v54 = [v9 trailingAnchor];
    v53 = [(PreviewFooterView *)v8 trailingAnchor];
    v52 = [v54 constraintEqualToAnchor:v53];
    v64[2] = v52;
    v51 = [v9 topAnchor];
    v50 = [(PreviewFooterView *)v8 topAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v64[3] = v49;
    v48 = [v62 leadingAnchor];
    v47 = [(PreviewFooterView *)v8 leadingAnchor];
    v46 = [v48 constraintEqualToAnchor:v47 constant:16.0];
    v64[4] = v46;
    v45 = [v62 firstBaselineAnchor];
    v43 = [v9 bottomAnchor];
    [v11 _scaledValueForValue:20.0];
    v42 = objc_msgSend(v45, "constraintEqualToAnchor:constant:", v43);
    v64[5] = v42;
    v39 = [v62 trailingAnchor];
    v38 = [(PreviewFooterView *)v8 trailingAnchor];
    v37 = [v39 constraintEqualToAnchor:v38 constant:-16.0];
    v64[6] = v37;
    v36 = [v14 leadingAnchor];
    v35 = [(PreviewFooterView *)v8 leadingAnchor];
    v34 = [v36 constraintEqualToAnchor:v35 constant:16.0];
    v64[7] = v34;
    v33 = [v14 firstBaselineAnchor];
    v32 = [v62 firstBaselineAnchor];
    [v11 _scaledValueForValue:15.0];
    v21 = objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32);
    v64[8] = v21;
    [v14 trailingAnchor];
    v22 = v41 = v17;
    v23 = [(PreviewFooterView *)v8 trailingAnchor];
    [v22 constraintEqualToAnchor:v23 constant:-16.0];
    v24 = v44 = v9;
    v64[9] = v24;
    [(PreviewFooterView *)v8 bottomAnchor];
    v25 = v11;
    v26 = v40 = v11;
    v27 = [v14 firstBaselineAnchor];
    [v25 _scaledValueForValue:12.0];
    v28 = objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27);
    v64[10] = v28;
    v29 = +[NSArray arrayWithObjects:v64 count:11];
    +[NSLayoutConstraint activateConstraints:v29];

    v30 = v8;
    id v7 = v60;
    id v6 = v61;
  }

  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[PreviewFooterView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

@end