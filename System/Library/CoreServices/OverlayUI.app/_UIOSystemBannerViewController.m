@interface _UIOSystemBannerViewController
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (UIEdgeInsets)bannerContentOutsets;
- (_UIOSystemBannerViewController)initWithBannerRequest:(id)a3;
- (_UIOSystemBannerViewControllerDelegate)delegate;
- (_UISystemBannerRequest)request;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation _UIOSystemBannerViewController

- (_UIOSystemBannerViewController)initWithBannerRequest:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_UIOSystemBannerViewController;
  v6 = [(_UIOSystemBannerViewController *)&v27 init];
  if (v6)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    v7 = (void *)qword_10000EC88;
    uint64_t v32 = qword_10000EC88;
    if (!qword_10000EC88)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000037CC;
      v28[3] = &unk_100008330;
      v28[4] = &v29;
      sub_1000037CC((uint64_t)v28);
      v7 = (void *)v30[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v29, 8);
    v9 = objc_opt_new();
    id v10 = objc_alloc_init((Class)NSMutableArray);
    v11 = [v5 primaryTitleText];

    if (v11)
    {
      id v12 = objc_alloc((Class)sub_1000034B8());
      v13 = [v5 primaryTitleText];
      id v14 = [v12 initWithText:v13 style:1];
      [v10 addObject:v14];
    }
    v15 = [v5 secondaryTitleText];

    if (v15)
    {
      id v16 = objc_alloc((Class)sub_1000034B8());
      v17 = [v5 secondaryTitleText];
      id v18 = [v16 initWithText:v17 style:2];
      [v10 addObject:v18];
    }
    [v9 setCenterContentItems:v10];
    [v9 setAutoresizingMask:18];
    v19 = [(_UIOSystemBannerViewController *)v6 view];
    [v19 bounds];
    objc_msgSend(v9, "setFrame:");

    v20 = [(_UIOSystemBannerViewController *)v6 view];
    [v20 addSubview:v9];

    pillView = v6->_pillView;
    v6->_pillView = (PLPillView *)v9;
    id v22 = v9;

    v23 = +[NSUUID UUID];
    uint64_t v24 = [v23 UUIDString];
    requestIdentifier = v6->_requestIdentifier;
    v6->_requestIdentifier = (NSString *)v24;

    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v6;
}

- (NSString)requesterIdentifier
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (UIEdgeInsets)bannerContentOutsets
{
  [(PLPillView *)self->_pillView shadowOutsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  -[PLPillView systemLayoutSizeFittingSize:](self->_pillView, "systemLayoutSizeFittingSize:", a3.width, a3.height, a4.width, a4.height);
  double v6 = v5;
  double v8 = v7;
  [(_UISystemBannerRequest *)self->_request preferredMinimumBannerWidth];
  double v10 = v9;
  [(_UISystemBannerRequest *)self->_request preferredMaximumBannerWidth];
  if (v11 <= 0.0 || v6 <= v11)
  {
    if (v10 > 0.0 && v6 < v10) {
      double v11 = v10;
    }
    else {
      double v11 = v6;
    }
  }
  double v14 = v8;
  result.height = v14;
  result.width = v11;
  return result;
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIOSystemBannerViewController *)self delegate];
  [v6 presentable:self willDisappearWithReason:v5];
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (_UIOSystemBannerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_UIOSystemBannerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UISystemBannerRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_pillView, 0);
}

@end