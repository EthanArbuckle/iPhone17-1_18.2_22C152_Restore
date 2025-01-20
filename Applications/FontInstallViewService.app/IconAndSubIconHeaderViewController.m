@interface IconAndSubIconHeaderViewController
- (IconAndSubIconHeaderViewController)initWithIconImage:(id)a3 andSubIconImage:(id)a4;
- (void)loadView;
@end

@implementation IconAndSubIconHeaderViewController

- (IconAndSubIconHeaderViewController)initWithIconImage:(id)a3 andSubIconImage:(id)a4
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  v4 = v21;
  v21 = 0;
  v18.receiver = v4;
  v18.super_class = (Class)IconAndSubIconHeaderViewController;
  v17 = [(IconAndSubIconHeaderViewController *)&v18 init];
  v21 = v17;
  objc_storeStrong((id *)&v21, v17);
  if (v17)
  {
    id v5 = objc_alloc((Class)UIImageView);
    v6 = (UIImageView *)[v5 initWithImage:location[0]];
    mainImageView = v21->_mainImageView;
    v21->_mainImageView = v6;

    if (v19)
    {
      id v8 = objc_alloc((Class)UIImageView);
      v9 = (UIImageView *)[v8 initWithImage:v19];
      subImageView = v21->_subImageView;
      v21->_subImageView = v9;

      id v11 = objc_alloc((Class)UIImageView);
      v12 = (UIImageView *)[v11 initWithImage:v19];
      subIconShadowView = v21->_subIconShadowView;
      v21->_subIconShadowView = v12;
    }
  }
  v15 = v21;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v21, 0);
  return v15;
}

- (void)loadView
{
  v36 = self;
  SEL v35 = a2;
  CGRectMake();
  v34.origin.x = v2;
  v34.origin.y = v3;
  v34.size.width = v4;
  v34.size.height = v5;
  CGSize v33 = (CGSize)0;
  if (v36->_subImageView)
  {
    CGSizeMake();
    v33.width = v6;
    v33.height = v7;
  }
  else
  {
    CGSize v33 = CGSizeZero;
  }
  CGRectGetMaxY(v34);
  CGRectMake();
  v32.origin.x = v8;
  v32.origin.y = v9;
  v32.size.width = v10;
  v32.size.height = v11;
  CGRect v37 = CGRectUnion(v34, v32);
  long long v30 = *(unint64_t *)&v37.origin.x;
  *(CGFloat *)&long long v31 = v37.size.width;
  *((void *)&v31 + 1) = CGRectGetMaxY(v37);
  id v29 = [objc_alloc((Class)UIView) initWithFrame:v30, v31];
  [v29 setSize:v31];
  [v29 setBackgroundColor:0];
  [v29 addSubview:v36->_mainImageView];
  -[UIImageView setFrame:](v36->_mainImageView, "setFrame:", *(_OWORD *)&v34.origin, *(_OWORD *)&v34.size);
  if (v36->_subImageView)
  {
    CGRect v28 = CGRectOffset(v32, -v34.origin.x, -v34.origin.y);
    [v29 addSubview:v36->_subImageView];
    -[UIImageView setFrame:](v36->_subImageView, "setFrame:", *(_OWORD *)&v32.origin, *(_OWORD *)&v32.size);
    -[UIImageView setSize:](v36->_subIconShadowView, "setSize:", v28.size.width, v28.size.height);
    [(UIImageView *)v36->_mainImageView addSubview:v36->_subIconShadowView];
    id v18 = [(UIImageView *)v36->_mainImageView layer];
    [v18 setMasksToBounds:1];

    -[UIImageView setFrame:](v36->_subIconShadowView, "setFrame:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
    id v19 = [(UIImageView *)v36->_subIconShadowView layer];
    [v19 setCornerRadius:20.0];

    v22 = +[UIColor blackColor];
    v20 = [(UIColor *)v22 CGColor];
    id v21 = [(UIImageView *)v36->_subIconShadowView layer];
    [v21 setShadowColor:v20];

    id v23 = [(UIImageView *)v36->_subIconShadowView layer];
    LODWORD(v12) = 1045220557;
    [v23 setShadowOpacity:v12];

    CGSizeMake();
    double v26 = v13;
    double v27 = v14;
    id v24 = [(UIImageView *)v36->_subIconShadowView layer];
    [v24 setShadowOffset:v26, v27];

    id v25 = [(UIImageView *)v36->_subIconShadowView layer];
    [v25 setShadowRadius:8.0];
  }
  v17 = v36;
  [v29 size];
  -[IconAndSubIconHeaderViewController setPreferredContentSize:](v17, "setPreferredContentSize:", v15, v16);
  [(IconAndSubIconHeaderViewController *)v36 setView:v29];
  objc_storeStrong(&v29, 0);
}

- (void).cxx_destruct
{
}

@end