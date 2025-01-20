@interface MKDeveloperPlaceCardLoadingViewDecorator
+ (id)configureWithViews:(id)a3 axis:(int64_t)a4 alignment:(int64_t)a5 insets:(UIEdgeInsets)a6 spacing:(double)a7 parentView:(id)a8;
+ (id)decorateView:(id)a3 ofType:(int64_t)a4;
+ (id)viewWithSize:(CGSize)a3;
@end

@implementation MKDeveloperPlaceCardLoadingViewDecorator

+ (id)decorateView:(id)a3 ofType:(int64_t)a4
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  switch(a4)
  {
    case 0:
      v6 = +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 50.0, 12.0);
      v25[0] = v6;
      v7 = +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 240.0, 16.0);
      v25[1] = v7;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
      double v9 = 12.0;
      double v10 = 12.0;
      double v11 = 0.0;
      double v12 = -12.0;
      double v13 = 4.0;
      goto LABEL_7;
    case 1:
      v6 = +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 50.0, 12.0);
      v24[0] = v6;
      v7 = +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 240.0, 16.0);
      v24[1] = v7;
      v8 = +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 200.0, 16.0);
      v24[2] = v8;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
      v14 = +[MKDeveloperPlaceCardLoadingViewDecorator configureWithViews:axis:alignment:insets:spacing:parentView:](MKDeveloperPlaceCardLoadingViewDecorator, "configureWithViews:axis:alignment:insets:spacing:parentView:", v15, 1, 1, v5, 12.0, 12.0, 12.0, -12.0, 4.0);
      goto LABEL_10;
    case 2:
      v6 = +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 32.0, 32.0);
      v23[0] = v6;
      v7 = +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 200.0, 16.0);
      v23[1] = v7;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
      double v9 = 12.0;
      double v10 = 12.0;
      double v11 = 12.0;
      double v12 = -12.0;
      double v13 = 8.0;
      v16 = v8;
      uint64_t v17 = 0;
      uint64_t v18 = 3;
      goto LABEL_8;
    case 3:
      v6 = +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 240.0, 20.0);
      v22[0] = v6;
      v7 = +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 200.0, 16.0);
      v22[1] = v7;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
      double v9 = 20.0;
      double v10 = 16.0;
      double v11 = 12.0;
      double v12 = 0.0;
      double v13 = 8.0;
LABEL_7:
      v16 = v8;
      uint64_t v17 = 1;
      uint64_t v18 = 1;
LABEL_8:
      v14 = +[MKDeveloperPlaceCardLoadingViewDecorator configureWithViews:axis:alignment:insets:spacing:parentView:](MKDeveloperPlaceCardLoadingViewDecorator, "configureWithViews:axis:alignment:insets:spacing:parentView:", v16, v17, v18, v5, v9, v10, v11, v12, v13);
      goto LABEL_11;
    case 4:
      v6 = +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 180.0, 16.0);
      v7 = +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 200.0, 16.0, v6);
      v21[1] = v7;
      v8 = +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 200.0, 16.0);
      v21[2] = v8;
      v15 = +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 140.0, 16.0);
      v21[3] = v15;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
      v14 = +[MKDeveloperPlaceCardLoadingViewDecorator configureWithViews:axis:alignment:insets:spacing:parentView:](MKDeveloperPlaceCardLoadingViewDecorator, "configureWithViews:axis:alignment:insets:spacing:parentView:", v19, 1, 1, v5, 12.0, 12.0, 12.0, -12.0, 4.0);

LABEL_10:
LABEL_11:

      break;
    default:
      v14 = 0;
      break;
  }

  return v14;
}

+ (id)viewWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v16[2] = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_new();
  v6 = objc_msgSend(MEMORY[0x1E4F428B8], "_mapkit_colorNamed:", @"DeveloperPlaceCardLoadingAccessoryColor");
  [v5 setBackgroundColor:v6];

  v7 = [v5 layer];
  [v7 setCornerRadius:height * 0.5];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [v5 widthAnchor];
  double v9 = [v8 constraintEqualToConstant:width];

  LODWORD(v10) = 1144750080;
  [v9 setPriority:v10];
  double v11 = (void *)MEMORY[0x1E4F28DC8];
  v16[0] = v9;
  double v12 = [v5 heightAnchor];
  double v13 = [v12 constraintEqualToConstant:height];
  v16[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  [v11 activateConstraints:v14];

  return v5;
}

+ (id)configureWithViews:(id)a3 axis:(int64_t)a4 alignment:(int64_t)a5 insets:(UIEdgeInsets)a6 spacing:(double)a7 parentView:(id)a8
{
  double right = a6.right;
  double bottom = a6.bottom;
  double left = a6.left;
  double top = a6.top;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a8;
  id v18 = objc_alloc_init(MEMORY[0x1E4F42E20]);
  [v18 setAxis:a4];
  [v18 setLayoutMarginsRelativeArrangement:1];
  objc_msgSend(v18, "setLayoutMargins:", top, left, bottom, right);
  [v18 setAlignment:a5];
  [v18 setSpacing:a7];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v19 = v16;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(v19);
        }
        [v18 addArrangedSubview:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v21);
  }

  if (v17)
  {
    [v17 addSubview:v18];
    v33 = (void *)MEMORY[0x1E4F28DC8];
    v38 = [v18 topAnchor];
    v37 = [v17 topAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v43[0] = v36;
    v35 = [v18 bottomAnchor];
    v34 = [v17 bottomAnchor];
    v32 = [v35 constraintLessThanOrEqualToAnchor:v34];
    v43[1] = v32;
    v24 = [v18 leadingAnchor];
    v25 = [v17 leadingAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v43[2] = v26;
    v27 = [v18 trailingAnchor];
    v28 = [v17 trailingAnchor];
    v29 = [v27 constraintLessThanOrEqualToAnchor:v28];
    v43[3] = v29;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
    [v33 activateConstraints:v30];
  }

  return v18;
}

@end