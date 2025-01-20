@interface DBLeafIconDataSource
+ (id)dataSourceForApplication:(id)a3;
+ (id)dataSourceForNowPlayingIcon;
+ (id)dataSourceForOEMIconWithSessionConfiguration:(id)a3;
- (BOOL)_stringIsDigits:(id)a3;
- (BOOL)drawsBorder;
- (BOOL)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5;
- (BOOL)iconAllowsLaunch:(id)a3;
- (BOOL)iconCanTightenLabel:(id)a3;
- (BOOL)iconCanTruncateLabel:(id)a3;
- (BOOL)iconCompleteUninstall:(id)a3;
- (BOOL)iconDisallowsLaunchForObscuredReason:(id)a3;
- (BOOL)iconSupportsUninstall:(id)a3;
- (BOOL)isProgressPausedForIcon:(id)a3;
- (CARSessionConfiguration)sessionConfiguration;
- (DBApplication)application;
- (FBSApplicationDataStore)dataStore;
- (NSString)cachedBadgeValue;
- (NSString)identifier;
- (double)progressPercentForIcon:(id)a3;
- (id)_initWithIdentifier:(id)a3 application:(id)a4 sessionConfiguration:(id)a5;
- (id)icon:(id)a3 defaultImageWithInfo:(SBIconImageInfo *)a4;
- (id)icon:(id)a3 displayNameForLocation:(id)a4;
- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4;
- (id)icon:(id)a3 unmaskedImageWithInfo:(SBIconImageInfo *)a4;
- (int64_t)accessoryTypeForIcon:(id)a3;
- (int64_t)labelAccessoryTypeForIcon:(id)a3;
- (int64_t)progressStateForIcon:(id)a3;
- (unint64_t)priorityForIcon:(id)a3;
- (void)invalidateBadgeValue;
- (void)setApplication:(id)a3;
- (void)setCachedBadgeValue:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setDrawsBorder:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setSessionConfiguration:(id)a3;
@end

@implementation DBLeafIconDataSource

+ (id)dataSourceForApplication:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [v3 bundleIdentifier];
  v6 = (void *)[v4 _initWithIdentifier:v5 application:v3 sessionConfiguration:0];

  return v6;
}

+ (id)dataSourceForOEMIconWithSessionConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = [DBLeafIconDataSource alloc];
  id v5 = [(DBLeafIconDataSource *)v4 _initWithIdentifier:*MEMORY[0x263F312A8] application:0 sessionConfiguration:v3];

  return v5;
}

+ (id)dataSourceForNowPlayingIcon
{
  v2 = [DBLeafIconDataSource alloc];
  id v3 = [(DBLeafIconDataSource *)v2 _initWithIdentifier:*MEMORY[0x263F31298] application:0 sessionConfiguration:0];
  return v3;
}

- (id)_initWithIdentifier:(id)a3 application:(id)a4 sessionConfiguration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DBLeafIconDataSource;
  v12 = [(DBLeafIconDataSource *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_application, a4);
    objc_storeStrong((id *)&v13->_sessionConfiguration, a5);
    uint64_t v14 = [MEMORY[0x263F3F6B8] storeForApplication:v9];
    dataStore = v13->_dataStore;
    v13->_dataStore = (FBSApplicationDataStore *)v14;

    [(DBLeafIconDataSource *)v13 invalidateBadgeValue];
  }

  return v13;
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 1;
}

- (id)icon:(id)a3 unmaskedImageWithInfo:(SBIconImageInfo *)a4
{
  double v8 = v7;
  double v9 = v6;
  double v10 = v5;
  double v11 = v4;
  id v13 = a3;
  uint64_t v14 = [(DBLeafIconDataSource *)self application];

  if (v14)
  {
    v15 = [(DBLeafIconDataSource *)self application];
    v16 = [v15 bundleIdentifier];
    objc_super v17 = DBUnmaskedIconImageForBundleIdentifierWithInfoAndBorder(v16, [(DBLeafIconDataSource *)self drawsBorder], v11, v10, v9);

LABEL_5:
    goto LABEL_7;
  }
  v18 = [(DBLeafIconDataSource *)self identifier];
  int v19 = [v18 isEqualToString:*MEMORY[0x263F31298]];

  if (v19)
  {
    v15 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceIdiom:3];
    v20 = (void *)MEMORY[0x263F827E8];
    v21 = NSString;
    v22 = [(DBLeafIconDataSource *)self identifier];
    v23 = [v21 stringWithFormat:@"CarDisplayCanvasIcon-%@.png", v22];
    objc_super v17 = objc_msgSend(v20, "crsui_imageNamed:compatibleWithTraitCollection:", v23, v15);

    goto LABEL_5;
  }
  objc_super v17 = -[DBLeafIconDataSource icon:imageWithInfo:](self, "icon:imageWithInfo:", v13, v11, v10, v9, v8);
LABEL_7:

  return v17;
}

- (id)icon:(id)a3 defaultImageWithInfo:(SBIconImageInfo *)a4
{
  double v8 = v7;
  double v9 = v6;
  double v10 = v5;
  double v11 = v4;
  id v13 = a3;
  uint64_t v14 = [(DBLeafIconDataSource *)self application];

  if (v14)
  {
    v15 = [(DBLeafIconDataSource *)self application];
    v16 = [v15 bundleIdentifier];
    objc_super v17 = DBIconImageForBundleIdentifierWithInfoAndBorder(v16, [(DBLeafIconDataSource *)self drawsBorder], v11, v10, v9, v8);
  }
  else
  {
    objc_super v17 = -[DBLeafIconDataSource icon:imageWithInfo:](self, "icon:imageWithInfo:", v13, v11, v10, v9, v8);
  }

  return v17;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  double v8 = v7;
  double v9 = v6;
  double v10 = v5;
  double v11 = v4;
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v13 = a3;
  uint64_t v14 = [(DBLeafIconDataSource *)self application];

  if (v14)
  {
    v15 = [(DBLeafIconDataSource *)self application];
    v16 = [v15 bundleIdentifier];
    objc_super v17 = DBIconImageForBundleIdentifierWithInfoAndBorder(v16, [(DBLeafIconDataSource *)self drawsBorder], v11, v10, v9, v8);
  }
  else
  {
    v18 = [MEMORY[0x263F4B558] imageDescriptorNamed:*MEMORY[0x263F4B570]];
    [v18 setScale:v9];
    objc_msgSend(v18, "setDrawBorder:", -[DBLeafIconDataSource drawsBorder](self, "drawsBorder"));
    [v18 setAppearance:1];
    [v18 size];
    double v20 = v19;
    double v22 = v21;
    CGAffineTransformMakeScale(&v88, v9, v9);
    double a = v88.a;
    double b = v88.b;
    double c = v88.c;
    double d = v88.d;
    v27 = [(DBLeafIconDataSource *)self identifier];
    uint64_t v28 = *MEMORY[0x263F312A8];
    int v29 = [v27 isEqualToString:*MEMORY[0x263F312A8]];

    double v30 = v22 * c + a * v20;
    double v31 = v22 * d + b * v20;
    if (v29)
    {
      uint64_t v82 = 0;
      v83 = &v82;
      uint64_t v84 = 0x3032000000;
      v85 = __Block_byref_object_copy_;
      v86 = __Block_byref_object_dispose_;
      id v87 = 0;
      v80[0] = 0;
      v80[1] = v80;
      v80[2] = 0x3010000000;
      v80[3] = &unk_22D897135;
      long long v81 = *MEMORY[0x263F001B0];
      v32 = [(DBLeafIconDataSource *)self sessionConfiguration];
      v33 = [v32 manufacturerIcons];
      v34 = (void *)[v33 copy];

      v35 = DBLogForCategory(0);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v91 = v34;
        _os_log_impl(&dword_22D6F0000, v35, OS_LOG_TYPE_DEFAULT, "Available icons: %{public}@", buf, 0xCu);
      }

      v36 = DBLogForCategory(0);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v94.width = v30;
        v94.height = v31;
        v37 = NSStringFromCGSize(v94);
        *(_DWORD *)buf = 138543362;
        v91 = v37;
        _os_log_impl(&dword_22D6F0000, v36, OS_LOG_TYPE_DEFAULT, "Expected icon size: %{public}@", buf, 0xCu);
      }
      v38 = DBLogForCategory(0);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v95.width = v9 * 52.0;
        v95.height = v9 * 52.0;
        v39 = NSStringFromCGSize(v95);
        *(_DWORD *)buf = 138543362;
        v91 = v39;
        _os_log_impl(&dword_22D6F0000, v38, OS_LOG_TYPE_DEFAULT, "Expected masked icon size: %{public}@", buf, 0xCu);
      }
      v79[0] = MEMORY[0x263EF8330];
      v79[1] = 3221225472;
      v79[2] = __43__DBLeafIconDataSource_icon_imageWithInfo___block_invoke;
      v79[3] = &unk_2649B3F58;
      *(double *)&v79[6] = v30;
      *(double *)&v79[7] = v31;
      *(double *)&v79[8] = v9 * 52.0;
      *(double *)&v79[9] = v9 * 52.0;
      v79[4] = &v82;
      v79[5] = v80;
      [v34 enumerateObjectsUsingBlock:v79];
      v40 = DBLogForCategory(0);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = (void *)v83[5];
        *(_DWORD *)buf = 138543362;
        v91 = v41;
        _os_log_impl(&dword_22D6F0000, v40, OS_LOG_TYPE_DEFAULT, "Final OEM Icon: %{public}@", buf, 0xCu);
      }

      v42 = (void *)MEMORY[0x263F827E8];
      v43 = [(id)v83[5] imageData];
      v44 = [v42 imageWithData:v43 scale:v9];

      if (([(id)v83[5] isPrerendered] & 1) != 0 && (id v45 = v44) != 0)
      {
        v46 = v45;
        v47 = 0;
      }
      else
      {
        v53 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceIdiom:3];
        v54 = (void *)MEMORY[0x263F827E8];
        v55 = [NSString stringWithFormat:@"CarDisplayCanvasIcon-%@.png", v28];
        v46 = objc_msgSend(v54, "crsui_imageNamed:compatibleWithTraitCollection:", v55, v53);

        v56 = [MEMORY[0x263F825C8] whiteColor];
        v47 = [v44 _flatImageWithColor:v56];
      }
      _Block_object_dispose(v80, 8);
      _Block_object_dispose(&v82, 8);
    }
    else
    {
      v48 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceIdiom:3];
      v49 = (void *)MEMORY[0x263F827E8];
      v50 = NSString;
      v51 = [(DBLeafIconDataSource *)self identifier];
      v52 = [v50 stringWithFormat:@"CarDisplayCanvasIcon-%@.png", v51];
      v46 = objc_msgSend(v49, "crsui_imageNamed:compatibleWithTraitCollection:", v52, v48);

      v47 = 0;
    }
    if (v46)
    {
      [v46 size];
      double v58 = v57;
      double v60 = v59;
      [v46 scale];
      double v62 = v61;
      if (v47 || (v30 == v58 * v61 ? (BOOL v63 = v31 == v60 * v61) : (BOOL v63 = 0), !v63))
      {
        v64 = (void *)MEMORY[0x263F827E8];
        v73[0] = MEMORY[0x263EF8330];
        v73[1] = 3221225472;
        v73[2] = __43__DBLeafIconDataSource_icon_imageWithInfo___block_invoke_53;
        v73[3] = &unk_2649B3F80;
        double v76 = v30 / v9;
        double v77 = v31 / v9;
        double v78 = v9;
        id v74 = v46;
        id v75 = v47;
        v46 = objc_msgSend(v64, "sbf_imageFromContextWithSize:scale:type:pool:drawing:", 0, 0, v73, v30 / v9, v31 / v9, v9);
      }
      id v65 = objc_alloc(MEMORY[0x263F4B500]);
      id v66 = v46;
      v67 = objc_msgSend(v65, "initWithCGImage:scale:", objc_msgSend(v66, "CGImage"), v62);
      id v68 = objc_alloc(MEMORY[0x263F4B540]);
      v89 = v67;
      v69 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v89 count:1];
      v70 = (void *)[v68 initWithImages:v69];

      objc_msgSend(v18, "setDrawBorder:", -[DBLeafIconDataSource drawsBorder](self, "drawsBorder"));
      v71 = [v70 imageForDescriptor:v18];
      objc_super v17 = (void *)[v71 CGImage];
      if (v17)
      {
        objc_super v17 = objc_msgSend(MEMORY[0x263F827E8], "imageWithCGImage:scale:orientation:", v17, objc_msgSend(v66, "imageOrientation"), v9);
      }
    }
    else
    {
      objc_super v17 = 0;
    }
  }
  return v17;
}

void __43__DBLeafIconDataSource_icon_imageWithInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  double v5 = a2;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a2;
  double v8 = DBLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v40 = v7;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Testing icon: %{public}@", buf, 0xCu);
  }

  if (([v7 isPrerendered] & 1) != 0
    || ![*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) isPrerendered])
  {
    [v7 pixelSize];
    double v11 = v10;
    double v13 = v12;
    int v14 = [v7 isPrerendered];
    uint64_t v15 = 72;
    if (v14) {
      uint64_t v15 = 56;
    }
    uint64_t v16 = 64;
    if (v14) {
      uint64_t v16 = 48;
    }
    double v17 = *(double *)(a1 + v16);
    double v18 = *(double *)(a1 + v15);
    if ([v7 isPrerendered]) {
      int v19 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) isPrerendered] ^ 1;
    }
    else {
      int v19 = 0;
    }
    uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
    double v21 = *(double *)(v20 + 40);
    BOOL v22 = v13 > v21 && v11 > *(double *)(v20 + 32);
    BOOL v23 = v13 < v21 && v11 < *(double *)(v20 + 32);
    BOOL v24 = v21 < v18 && *(double *)(v20 + 32) < v17;
    BOOL v25 = v11 >= v17 && v13 >= v18;
    v26 = DBLogForCategory(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBOOL();
      v27 = int v36 = v19;
      NSStringFromBOOL();
      uint64_t v28 = v38 = a4;
      NSStringFromBOOL();
      int v29 = v37 = v5;
      NSStringFromBOOL();
      double v30 = v35 = v23;
      NSStringFromBOOL();
      double v31 = v34 = v22;
      *(_DWORD *)buf = 138544386;
      id v40 = v27;
      __int16 v41 = 2114;
      v42 = v28;
      __int16 v43 = 2114;
      v44 = v29;
      __int16 v45 = 2114;
      v46 = v30;
      __int16 v47 = 2114;
      v48 = v31;
      _os_log_impl(&dword_22D6F0000, v26, OS_LOG_TYPE_DEFAULT, "shouldReplaceWithPrerendered: %{public}@, testIconIsLargerThanSelected %{public}@, testIconIsSmallerThanSelected %{public}@, selectedIconIsTooSmall %{public}@, testIconIsLargeEnough %{public}@", buf, 0x34u);

      BOOL v22 = v34;
      BOOL v23 = v35;

      double v5 = v37;
      a4 = v38;

      int v19 = v36;
    }

    if (((v19 | (v22 && v24)) & 1) != 0 || v25 && v23)
    {
      v32 = DBLogForCategory(0);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v40 = v7;
        _os_log_impl(&dword_22D6F0000, v32, OS_LOG_TYPE_DEFAULT, "Selecting new icon: %{public}@", buf, 0xCu);
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5);
      uint64_t v33 = *(void *)(*(void *)(a1 + 40) + 8);
      *(double *)(v33 + 32) = v11;
      *(double *)(v33 + 40) = v13;
      if (v17 == v11 && v18 == v13 && [v7 isPrerendered]) {
        *a4 = 1;
      }
    }
  }
  else
  {
    double v9 = DBLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v40 = v7;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Already found a preferended icon, skipping %{public}@", buf, 0xCu);
    }
  }
}

void *__43__DBLeafIconDataSource_icon_imageWithInfo___block_invoke_53(uint64_t a1)
{
  UIRectCenteredAboutPointScale();
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:blendMode:alpha:", 17);
  result = *(void **)(a1 + 40);
  if (result)
  {
    [result size];
    UIRectCenteredAboutPointScale();
    id v3 = *(void **)(a1 + 40);
    return objc_msgSend(v3, "drawInRect:blendMode:alpha:", 0);
  }
  return result;
}

- (id)icon:(id)a3 displayNameForLocation:(id)a4
{
  double v5 = [(DBLeafIconDataSource *)self identifier];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F312B0]];

  if (v6)
  {
    id v7 = NSString;
    double v8 = [(DBLeafIconDataSource *)self identifier];
    double v9 = [v7 stringWithFormat:@"LAUNCHER_NAME-%@", v8];

    double v10 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    double v11 = [v10 localizedStringForKey:v9 value:&stru_26E13A820 table:@"CarPlayApp"];

    goto LABEL_8;
  }
  double v12 = [(DBLeafIconDataSource *)self application];

  if (v12)
  {
    double v9 = [(DBLeafIconDataSource *)self application];
    uint64_t v13 = [v9 displayName];
LABEL_7:
    double v11 = (void *)v13;
LABEL_8:

    if (v11) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v14 = [(DBLeafIconDataSource *)self identifier];
  int v15 = [v14 isEqualToString:*MEMORY[0x263F312A8]];

  if (v15)
  {
    double v9 = [(DBLeafIconDataSource *)self sessionConfiguration];
    uint64_t v13 = [v9 manufacturerIconLabel];
    goto LABEL_7;
  }
LABEL_9:
  uint64_t v16 = NSString;
  double v17 = [(DBLeafIconDataSource *)self identifier];
  double v18 = [v16 stringWithFormat:@"LAUNCHER_NAME-%@", v17];

  int v19 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
  double v11 = [v19 localizedStringForKey:v18 value:&stru_26E13A820 table:@"CarPlayApp"];

LABEL_10:
  return v11;
}

- (BOOL)iconCanTruncateLabel:(id)a3
{
  return 1;
}

- (BOOL)iconCanTightenLabel:(id)a3
{
  return 1;
}

- (int64_t)progressStateForIcon:(id)a3
{
  return 0;
}

- (double)progressPercentForIcon:(id)a3
{
  return 0.0;
}

- (BOOL)isProgressPausedForIcon:(id)a3
{
  return 0;
}

- (void)invalidateBadgeValue
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22D6F0000, v2, v3, "Badge for identifier: %{public}@ is not a number: %{public}@", v4, v5, v6, v7, v8);
}

- (int64_t)accessoryTypeForIcon:(id)a3
{
  uint64_t v3 = [(DBLeafIconDataSource *)self cachedBadgeValue];

  return v3 != 0;
}

- (int64_t)labelAccessoryTypeForIcon:(id)a3
{
  return 0;
}

- (BOOL)iconSupportsUninstall:(id)a3
{
  return 0;
}

- (BOOL)iconCompleteUninstall:(id)a3
{
  return 0;
}

- (BOOL)iconAllowsLaunch:(id)a3
{
  return 1;
}

- (BOOL)iconDisallowsLaunchForObscuredReason:(id)a3
{
  return 0;
}

- (BOOL)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)_stringIsDigits:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    uint64_t v5 = [v4 invertedSet];

    BOOL v6 = [v3 rangeOfCharacterFromSet:v5] == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (DBApplication)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
}

- (BOOL)drawsBorder
{
  return self->_drawsBorder;
}

- (void)setDrawsBorder:(BOOL)a3
{
  self->_drawsBorder = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CARSessionConfiguration)sessionConfiguration
{
  return self->_sessionConfiguration;
}

- (void)setSessionConfiguration:(id)a3
{
}

- (FBSApplicationDataStore)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
}

- (NSString)cachedBadgeValue
{
  return self->_cachedBadgeValue;
}

- (void)setCachedBadgeValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedBadgeValue, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end