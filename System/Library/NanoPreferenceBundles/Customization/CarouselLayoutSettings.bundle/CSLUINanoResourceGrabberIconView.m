@interface CSLUINanoResourceGrabberIconView
- (CSLUINanoResourceGrabberIconView)initWithBundleID:(id)a3;
- (void)setRawIcon:(id)a3;
@end

@implementation CSLUINanoResourceGrabberIconView

- (CSLUINanoResourceGrabberIconView)initWithBundleID:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = +[UIImage imageNamed:@"Default_Icon@2x" inBundle:v5 compatibleWithTraitCollection:0];

  [v6 size];
  double v8 = v7;
  v30.receiver = self;
  v30.super_class = (Class)CSLUINanoResourceGrabberIconView;
  v9 = -[CSLUINanoResourceGrabberIconView initWithFrame:](&v30, "initWithFrame:", 0.0, 0.0, v8, v8);
  if (v9)
  {
    v10 = (NSString *)[v4 copy];
    bundleID = v9->_bundleID;
    v9->_bundleID = v10;

    id v12 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 0.0, 0.0, v8, v8);
    objc_storeWeak((id *)&v9->_imageView, v12);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_CE50;
    v27[3] = &unk_3CA48;
    v28 = v9;
    v13 = v28;
    v29 = v13;
    v14 = objc_retainBlock(v27);
    id v26 = 0;
    v15 = +[NanoResourceGrabber sharedInstance];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_CF7C;
    v24[3] = &unk_3CA70;
    v16 = v14;
    id v25 = v16;
    [v15 getCachedIconForBundleID:v4 iconVariant:42 outIconImage:&v26 updateBlock:v24];
    if (v26)
    {
      -[CSLUINanoResourceGrabberIconView setRawIcon:](v13, "setRawIcon:");
    }
    else
    {
      [(CSLUINanoResourceGrabberIconView *)v13 setRawIcon:v6];
      v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      v20 = sub_CF94;
      v21 = &unk_3CA98;
      v23 = v16;
      v22 = v13;
      [v15 getIconForBundleID:v4 iconVariant:42 block:&v18 timeout:1000.0];
    }
    -[CSLUINanoResourceGrabberIconView addSubview:](v13, "addSubview:", v12, v18, v19, v20, v21);
  }
  return v9;
}

- (void)setRawIcon:(id)a3
{
  p_imageView = &self->_imageView;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_imageView);
  [WeakRetained setImage:v4];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageView);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end