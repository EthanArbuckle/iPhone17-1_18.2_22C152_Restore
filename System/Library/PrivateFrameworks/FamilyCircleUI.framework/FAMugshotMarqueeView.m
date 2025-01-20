@interface FAMugshotMarqueeView
+ (id)imageWithMemberFilter:(id)a3 profilePictureStore:(id)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (FAMugshotMarqueeView)initWithCoder:(id)a3;
- (FAMugshotMarqueeView)initWithFamilyCircle:(id)a3 profilePictureStore:(id)a4;
- (FAMugshotMarqueeView)initWithFrame:(CGRect)a3;
- (FAMugshotMarqueeView)initWithMemberFilter:(id)a3 profilePictureStore:(id)a4;
- (double)shadowRadius;
- (id)_configureImageViewWithImage:(id)a3;
- (id)_configureImageWithData:(id)a3;
- (void)_configureMarquee;
- (void)_configureStackView;
- (void)_profilePictureStoreDidReloadImages:(id)a3;
- (void)dealloc;
@end

@implementation FAMugshotMarqueeView

- (FAMugshotMarqueeView)initWithCoder:(id)a3
{
  return 0;
}

- (FAMugshotMarqueeView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (FAMugshotMarqueeView)initWithFamilyCircle:(id)a3 profilePictureStore:(id)a4
{
  return [(FAMugshotMarqueeView *)self initWithMemberFilter:0 profilePictureStore:a4];
}

- (FAMugshotMarqueeView)initWithMemberFilter:(id)a3 profilePictureStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)FAMugshotMarqueeView;
  v8 = -[FAMugshotMarqueeView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    memberPhotoMap = v8->_memberPhotoMap;
    v8->_memberPhotoMap = (NSMutableDictionary *)v9;

    objc_storeStrong((id *)&v8->_pictureStore, a4);
    v11 = _Block_copy(v6);
    id membersFilter = v8->_membersFilter;
    v8->_id membersFilter = v11;

    v13 = [(FAProfilePictureStore *)v8->_pictureStore familyCircle];

    if (!v13)
    {
      v14 = _FALogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[FAMugshotMarqueeView initWithMemberFilter:profilePictureStore:](v14);
      }
    }
    [(FAMugshotMarqueeView *)v8 _configureStackView];
    [(FAMugshotMarqueeView *)v8 _configureMarquee];
    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v8 selector:sel__profilePictureStoreDidReloadImages_ name:FAProfilePictureStoreDidReloadImagesNotification object:v7];
  }
  return v8;
}

- (double)shadowRadius
{
  return 3.0;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F83C20];
  double v3 = 68.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  LODWORD(v3) = 1144750080;
  LODWORD(v4) = 1144750080;
  -[UIStackView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_marquee, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8), v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)dealloc
{
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FAMugshotMarqueeView;
  [(FAMugshotMarqueeView *)&v4 dealloc];
}

- (void)_profilePictureStoreDidReloadImages:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__FAMugshotMarqueeView__profilePictureStoreDidReloadImages___block_invoke;
  block[3] = &unk_2643489F8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __60__FAMugshotMarqueeView__profilePictureStoreDidReloadImages___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureMarquee];
}

- (void)_configureMarquee
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v3 = [(UIStackView *)self->_marquee arrangedSubviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v5);
  }

  v25 = [(FAProfilePictureStore *)self->_pictureStore profilePicturesWithDiameter:68.0];
  v8 = [(FAProfilePictureStore *)self->_pictureStore familyCircle];
  uint64_t v9 = [v8 members];
  int v10 = [v9 count];

  if (v10 >= 1)
  {
    unint64_t v12 = v10 + 1;
    *(void *)&long long v11 = 138412290;
    long long v24 = v11;
    do
    {
      v13 = [(FAProfilePictureStore *)self->_pictureStore familyCircle];
      v14 = [v13 members];
      v15 = [v14 objectAtIndexedSubscript:(v12 - 2)];

      id membersFilter = (unsigned int (**)(id, void *))self->_membersFilter;
      if (!membersFilter || membersFilter[2](membersFilter, v15))
      {
        objc_super v17 = [v25 objectForKeyedSubscript:v15];
        v18 = [(FAMugshotMarqueeView *)self _configureImageWithData:v17];
        if (v18)
        {
          v19 = [(FAMugshotMarqueeView *)self _configureImageViewWithImage:v18];
          v20 = [v19 heightAnchor];
          v21 = [v20 constraintEqualToConstant:68.0];
          [v21 setActive:1];

          v22 = [v19 widthAnchor];
          v23 = [v22 constraintEqualToConstant:68.0];
          [v23 setActive:1];

          [(UIStackView *)self->_marquee insertArrangedSubview:v19 atIndex:0];
        }
        else
        {
          v19 = _FALogSystem();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            v31 = v15;
            _os_log_error_impl(&dword_2189F0000, v19, OS_LOG_TYPE_ERROR, "No member image for %@", buf, 0xCu);
          }
        }
      }
      --v12;
    }
    while (v12 > 1);
  }
  [(FAMugshotMarqueeView *)self setNeedsDisplay];
}

- (void)_configureStackView
{
  v16[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F82BF8]);
  uint64_t v4 = (UIStackView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(UIStackView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)v4 setAxis:0];
  [(UIStackView *)v4 setDistribution:4];
  [(FAMugshotMarqueeView *)self addSubview:v4];
  [(UIStackView *)v4 setSpacing:-24.0];
  v15 = [(UIStackView *)v4 centerYAnchor];
  v14 = [(FAMugshotMarqueeView *)self centerYAnchor];
  uint64_t v5 = [v15 constraintEqualToAnchor:v14];
  v16[0] = v5;
  uint64_t v6 = [(UIStackView *)v4 centerXAnchor];
  id v7 = [(FAMugshotMarqueeView *)self centerXAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v16[1] = v8;
  uint64_t v9 = [(UIStackView *)v4 heightAnchor];
  int v10 = [(FAMugshotMarqueeView *)self heightAnchor];
  long long v11 = [v9 constraintEqualToAnchor:v10];
  v16[2] = v11;
  unint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];

  [MEMORY[0x263F08938] activateConstraints:v12];
  marquee = self->_marquee;
  self->_marquee = v4;
}

- (id)_configureImageWithData:(id)a3
{
  return (id)[MEMORY[0x263F827E8] imageWithData:a3];
}

- (id)_configureImageViewWithImage:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F82828];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithImage:v4];

  [v5 setContentMode:1];
  uint64_t v6 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v5 setBackgroundColor:v6];

  id v7 = [v5 layer];
  [v7 setCornerRadius:34.0];

  v8 = [v5 layer];
  [v8 setBorderWidth:2.0];

  id v9 = [MEMORY[0x263F825C8] whiteColor];
  uint64_t v10 = [v9 CGColor];
  long long v11 = [v5 layer];
  [v11 setBorderColor:v10];

  id v12 = [MEMORY[0x263F825C8] blackColor];
  uint64_t v13 = [v12 CGColor];
  v14 = [v5 layer];
  [v14 setShadowColor:v13];

  v15 = [v5 layer];
  LODWORD(v16) = 0.25;
  [v15 setShadowOpacity:v16];

  objc_super v17 = [v5 layer];
  [v17 setShadowRadius:3.0];

  double v18 = *MEMORY[0x263F001B0];
  double v19 = *(double *)(MEMORY[0x263F001B0] + 8);
  v20 = [v5 layer];
  objc_msgSend(v20, "setShadowOffset:", v18, v19);

  v21 = [v5 layer];
  [v21 setMasksToBounds:0];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marquee, 0);
  objc_storeStrong(&self->_membersFilter, 0);
  objc_storeStrong((id *)&self->_pictureStore, 0);
  objc_storeStrong((id *)&self->_memberPhotoMap, 0);
}

+ (id)imageWithMemberFilter:(id)a3 profilePictureStore:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[FAMugshotMarqueeView alloc] initWithMemberFilter:v6 profilePictureStore:v5];

  [(FAMugshotMarqueeView *)v7 sizeToFit];
  [(FAMugshotMarqueeView *)v7 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(FAMugshotMarqueeView *)v7 shadowRadius];
  CGFloat v17 = -v16;
  [(FAMugshotMarqueeView *)v7 shadowRadius];
  CGFloat v19 = -v18;
  v30.origin.x = v9;
  v30.origin.y = v11;
  v30.size.width = v13;
  v30.size.height = v15;
  CGRect v31 = CGRectInset(v30, v17, v19);
  v20 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
  [v20 addSubview:v7];
  [v20 bounds];
  double MidX = CGRectGetMidX(v32);
  [v20 bounds];
  -[FAMugshotMarqueeView setCenter:](v7, "setCenter:", MidX, CGRectGetMidY(v33));
  id v22 = objc_alloc(MEMORY[0x263F827A0]);
  [v20 bounds];
  v23 = objc_msgSend(v22, "initWithBounds:");
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __76__FAMugshotMarqueeView_Snapshot__imageWithMemberFilter_profilePictureStore___block_invoke;
  v27[3] = &unk_264348D68;
  id v28 = v20;
  id v24 = v20;
  v25 = [v23 imageWithActions:v27];

  return v25;
}

uint64_t __76__FAMugshotMarqueeView_Snapshot__imageWithMemberFilter_profilePictureStore___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 bounds];
  return objc_msgSend(v1, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
}

- (void)initWithMemberFilter:(os_log_t)log profilePictureStore:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  double v2 = "-[FAMugshotMarqueeView initWithMemberFilter:profilePictureStore:]";
  _os_log_error_impl(&dword_2189F0000, log, OS_LOG_TYPE_ERROR, "%s has no circle", (uint8_t *)&v1, 0xCu);
}

@end