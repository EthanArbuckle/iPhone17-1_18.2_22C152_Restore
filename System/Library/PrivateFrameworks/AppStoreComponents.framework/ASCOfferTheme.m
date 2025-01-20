@interface ASCOfferTheme
+ (ASCOfferTheme)adTheme;
+ (ASCOfferTheme)blueTheme;
+ (ASCOfferTheme)essoTheme;
+ (ASCOfferTheme)grayTheme;
+ (ASCOfferTheme)primaryTheme;
+ (ASCOfferTheme)secondaryTheme;
+ (ASCOfferTheme)viewInAppStoreTheme;
+ (ASCOfferTheme)whiteOnGrayTheme;
+ (ASCOfferTheme)whiteTheme;
+ (id)confirmationForTheme:(id)a3;
- (ASCOfferBackgroundStyle)backgroundStyle;
- (ASCOfferTheme)initWithTitleBackgroundColor:(id)a3 titleTextColor:(id)a4 subtitleTextColor:(id)a5 iconTintColor:(id)a6 progressColor:(id)a7;
- (ASCOfferTheme)initWithTitleBackgroundColor:(id)a3 titleTextColor:(id)a4 titleTextDisabledColor:(id)a5 subtitleTextColor:(id)a6 iconTintColor:(id)a7 progressColor:(id)a8;
- (ASCOfferTheme)initWithTitleBackgroundColor:(id)a3 titleTextColor:(id)a4 titleTextDisabledColor:(id)a5 subtitleTextColor:(id)a6 iconTintColor:(id)a7 progressColor:(id)a8 progressLineWidth:(double)a9 progressLineCap:(int)a10 stopIndicatorRatio:(double)a11 stopIndicatorCornerSize:(CGSize)a12 backgroundStyle:(id)a13;
- (ASCOfferTheme)offerThemeWithBackgroundStyle:(id)a3;
- (ASCOfferTheme)offerThemeWithProgressLineCap:(int)a3;
- (ASCOfferTheme)offerThemeWithProgressLineWidth:(double)a3;
- (ASCOfferTheme)offerThemeWithStopIndicatorRatio:(double)a3;
- (BOOL)isEqual:(id)a3;
- (CGSize)stopIndicatorCornerSize;
- (UIColor)iconTintColor;
- (UIColor)progressColor;
- (UIColor)subtitleTextColor;
- (UIColor)titleBackgroundColor;
- (UIColor)titleTextColor;
- (UIColor)titleTextDisabledColor;
- (double)progressLineWidth;
- (double)stopIndicatorRatio;
- (id)clone;
- (id)description;
- (int)progressLineCap;
- (unint64_t)hash;
@end

@implementation ASCOfferTheme

+ (ASCOfferTheme)grayTheme
{
  if (grayTheme_onceToken != -1) {
    dispatch_once(&grayTheme_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)grayTheme_theme;

  return (ASCOfferTheme *)v2;
}

void __26__ASCOfferTheme_grayTheme__block_invoke()
{
  v0 = [ASCOfferTheme alloc];
  id v7 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  v1 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v2 = [MEMORY[0x1E4FB1618] systemGrayColor];
  v3 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v4 = [MEMORY[0x1E4FB1618] systemFillColor];
  uint64_t v5 = [(ASCOfferTheme *)v0 initWithTitleBackgroundColor:v7 titleTextColor:v1 subtitleTextColor:v2 iconTintColor:v3 progressColor:v4];
  v6 = (void *)grayTheme_theme;
  grayTheme_theme = v5;
}

+ (ASCOfferTheme)blueTheme
{
  if (blueTheme_onceToken != -1) {
    dispatch_once(&blueTheme_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)blueTheme_theme;

  return (ASCOfferTheme *)v2;
}

void __26__ASCOfferTheme_blueTheme__block_invoke()
{
  v0 = [ASCOfferTheme alloc];
  id v7 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v1 = [MEMORY[0x1E4FB1618] whiteColor];
  v2 = [MEMORY[0x1E4FB1618] systemGrayColor];
  v3 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v4 = [MEMORY[0x1E4FB1618] systemFillColor];
  uint64_t v5 = [(ASCOfferTheme *)v0 initWithTitleBackgroundColor:v7 titleTextColor:v1 subtitleTextColor:v2 iconTintColor:v3 progressColor:v4];
  v6 = (void *)blueTheme_theme;
  blueTheme_theme = v5;
}

+ (ASCOfferTheme)whiteTheme
{
  if (whiteTheme_onceToken != -1) {
    dispatch_once(&whiteTheme_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)whiteTheme_theme;

  return (ASCOfferTheme *)v2;
}

void __27__ASCOfferTheme_whiteTheme__block_invoke()
{
  v0 = [ASCOfferTheme alloc];
  id v8 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  v1 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v2 = [MEMORY[0x1E4FB1618] colorWithRed:0.768481433 green:0.768305421 blue:0.788933814 alpha:1.0];
  v3 = [MEMORY[0x1E4FB1618] systemGrayColor];
  v4 = [MEMORY[0x1E4FB1618] systemBlueColor];
  uint64_t v5 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v6 = [(ASCOfferTheme *)v0 initWithTitleBackgroundColor:v8 titleTextColor:v1 titleTextDisabledColor:v2 subtitleTextColor:v3 iconTintColor:v4 progressColor:v5];
  id v7 = (void *)whiteTheme_theme;
  whiteTheme_theme = v6;
}

+ (ASCOfferTheme)whiteOnGrayTheme
{
  if (whiteOnGrayTheme_onceToken != -1) {
    dispatch_once(&whiteOnGrayTheme_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)whiteOnGrayTheme_theme;

  return (ASCOfferTheme *)v2;
}

void __33__ASCOfferTheme_whiteOnGrayTheme__block_invoke()
{
  v0 = [ASCOfferTheme alloc];
  id v10 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  v1 = [MEMORY[0x1E4FB1618] labelColor];
  v2 = [MEMORY[0x1E4FB1618] colorWithRed:0.768481433 green:0.768305421 blue:0.788933814 alpha:1.0];
  v3 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v4 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v5 = [MEMORY[0x1E4FB1618] grayColor];
  uint64_t v6 = +[ASCOfferBackgroundStyle defaultStyle];
  LODWORD(v9) = 1;
  uint64_t v7 = -[ASCOfferTheme initWithTitleBackgroundColor:titleTextColor:titleTextDisabledColor:subtitleTextColor:iconTintColor:progressColor:progressLineWidth:progressLineCap:stopIndicatorRatio:stopIndicatorCornerSize:backgroundStyle:](v0, "initWithTitleBackgroundColor:titleTextColor:titleTextDisabledColor:subtitleTextColor:iconTintColor:progressColor:progressLineWidth:progressLineCap:stopIndicatorRatio:stopIndicatorCornerSize:backgroundStyle:", v10, v1, v2, v3, v4, v5, 2.0, 0.3, 1.0, 1.0, v9, v6);
  id v8 = (void *)whiteOnGrayTheme_theme;
  whiteOnGrayTheme_theme = v7;
}

+ (id)confirmationForTheme:(id)a3
{
  id v3 = a3;
  v4 = [ASCOfferTheme alloc];
  uint64_t v5 = [MEMORY[0x1E4FB1618] systemGreenColor];
  uint64_t v6 = [MEMORY[0x1E4FB1618] whiteColor];
  if (v3)
  {
    uint64_t v7 = [v3 subtitleTextColor];
    id v8 = [v3 iconTintColor];
    [v3 progressColor];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] systemGrayColor];
    id v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [MEMORY[0x1E4FB1618] systemFillColor];
  uint64_t v9 = };
  id v10 = [(ASCOfferTheme *)v4 initWithTitleBackgroundColor:v5 titleTextColor:v6 subtitleTextColor:v7 iconTintColor:v8 progressColor:v9];

  return v10;
}

+ (ASCOfferTheme)adTheme
{
  if (adTheme_onceToken != -1) {
    dispatch_once(&adTheme_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)adTheme_adTheme;

  return (ASCOfferTheme *)v2;
}

void __24__ASCOfferTheme_adTheme__block_invoke()
{
  v0 = [ASCOfferTheme alloc];
  v1 = (void *)MEMORY[0x1E4FB1618];
  v2 = [MEMORY[0x1E4FB1618] whiteColor];
  id v3 = [MEMORY[0x1E4FB1618] whiteColor];
  objc_msgSend(v1, "asc_colorWithLightColor:darkColor:", v2, v3);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [MEMORY[0x1E4FB1618] colorWithRed:0.149 green:0.529 blue:0.984 alpha:1.0];
  uint64_t v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.039 green:0.517 blue:0.996 alpha:1.0];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1618], "asc_colorWithLightColor:darkColor:", v4, v5);

  uint64_t v7 = [MEMORY[0x1E4FB1618] systemGrayColor];
  id v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
  uint64_t v9 = [MEMORY[0x1E4FB1618] systemFillColor];
  uint64_t v10 = [(ASCOfferTheme *)v0 initWithTitleBackgroundColor:v12 titleTextColor:v6 subtitleTextColor:v7 iconTintColor:v8 progressColor:v9];
  v11 = (void *)adTheme_adTheme;
  adTheme_adTheme = v10;
}

+ (ASCOfferTheme)essoTheme
{
  if (essoTheme_onceToken != -1) {
    dispatch_once(&essoTheme_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)essoTheme_theme;

  return (ASCOfferTheme *)v2;
}

void __26__ASCOfferTheme_essoTheme__block_invoke()
{
  id v5 = +[ASCOfferTheme blueTheme];
  v0 = [v5 offerThemeWithProgressLineWidth:3.0];
  v1 = [v0 offerThemeWithStopIndicatorRatio:0.35];
  v2 = +[ASCOfferBackgroundStyle fixedCornerRadiusStyle:14.0];
  uint64_t v3 = [v1 offerThemeWithBackgroundStyle:v2];
  v4 = (void *)essoTheme_theme;
  essoTheme_theme = v3;
}

+ (ASCOfferTheme)viewInAppStoreTheme
{
  if (viewInAppStoreTheme_onceToken != -1) {
    dispatch_once(&viewInAppStoreTheme_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)viewInAppStoreTheme_theme;

  return (ASCOfferTheme *)v2;
}

void __36__ASCOfferTheme_viewInAppStoreTheme__block_invoke()
{
  v0 = [ASCOfferTheme alloc];
  id v7 = [MEMORY[0x1E4FB1618] clearColor];
  v1 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v2 = [MEMORY[0x1E4FB1618] clearColor];
  uint64_t v3 = [MEMORY[0x1E4FB1618] clearColor];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  uint64_t v5 = [(ASCOfferTheme *)v0 initWithTitleBackgroundColor:v7 titleTextColor:v1 subtitleTextColor:v2 iconTintColor:v3 progressColor:v4];
  uint64_t v6 = (void *)viewInAppStoreTheme_theme;
  viewInAppStoreTheme_theme = v5;
}

+ (ASCOfferTheme)primaryTheme
{
  return +[ASCOfferTheme grayTheme];
}

+ (ASCOfferTheme)secondaryTheme
{
  return +[ASCOfferTheme whiteTheme];
}

- (ASCOfferTheme)initWithTitleBackgroundColor:(id)a3 titleTextColor:(id)a4 subtitleTextColor:(id)a5 iconTintColor:(id)a6 progressColor:(id)a7
{
  return [(ASCOfferTheme *)self initWithTitleBackgroundColor:a3 titleTextColor:a4 titleTextDisabledColor:a4 subtitleTextColor:a5 iconTintColor:a6 progressColor:a7];
}

- (ASCOfferTheme)initWithTitleBackgroundColor:(id)a3 titleTextColor:(id)a4 titleTextDisabledColor:(id)a5 subtitleTextColor:(id)a6 iconTintColor:(id)a7 progressColor:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = +[ASCOfferBackgroundStyle defaultStyle];
  LODWORD(v23) = 0;
  v21 = -[ASCOfferTheme initWithTitleBackgroundColor:titleTextColor:titleTextDisabledColor:subtitleTextColor:iconTintColor:progressColor:progressLineWidth:progressLineCap:stopIndicatorRatio:stopIndicatorCornerSize:backgroundStyle:](self, "initWithTitleBackgroundColor:titleTextColor:titleTextDisabledColor:subtitleTextColor:iconTintColor:progressColor:progressLineWidth:progressLineCap:stopIndicatorRatio:stopIndicatorCornerSize:backgroundStyle:", v19, v18, v17, v16, v15, v14, 2.0, 0.3, 1.0, 1.0, v23, v20);

  return v21;
}

- (ASCOfferTheme)initWithTitleBackgroundColor:(id)a3 titleTextColor:(id)a4 titleTextDisabledColor:(id)a5 subtitleTextColor:(id)a6 iconTintColor:(id)a7 progressColor:(id)a8 progressLineWidth:(double)a9 progressLineCap:(int)a10 stopIndicatorRatio:(double)a11 stopIndicatorCornerSize:(CGSize)a12 backgroundStyle:(id)a13
{
  CGFloat height = a12.height;
  CGFloat width = a12.width;
  id v24 = a3;
  id v33 = a4;
  id v32 = a5;
  id v31 = a6;
  id v30 = a7;
  id v29 = a8;
  id v25 = a13;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v34.receiver = self;
  v34.super_class = (Class)ASCOfferTheme;
  v26 = [(ASCOfferTheme *)&v34 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_titleBackgroundColor, a3);
    objc_storeStrong((id *)&v27->_titleTextColor, a4);
    objc_storeStrong((id *)&v27->_titleTextDisabledColor, a5);
    objc_storeStrong((id *)&v27->_subtitleTextColor, a6);
    objc_storeStrong((id *)&v27->_iconTintColor, a7);
    objc_storeStrong((id *)&v27->_progressColor, a8);
    v27->_progressLineWidth = a9;
    v27->_stopIndicatorRatio = a11;
    v27->_progressLineCap = a10;
    v27->_stopIndicatorCornerSize.CGFloat width = width;
    v27->_stopIndicatorCornerSize.CGFloat height = height;
    objc_storeStrong((id *)&v27->_backgroundStyle, a13);
  }

  return v27;
}

- (id)clone
{
  id v3 = objc_alloc((Class)objc_opt_class());
  v4 = [(ASCOfferTheme *)self titleBackgroundColor];
  uint64_t v5 = [(ASCOfferTheme *)self titleTextColor];
  uint64_t v6 = [(ASCOfferTheme *)self titleTextDisabledColor];
  id v7 = [(ASCOfferTheme *)self subtitleTextColor];
  id v8 = [(ASCOfferTheme *)self iconTintColor];
  uint64_t v9 = [(ASCOfferTheme *)self progressColor];
  [(ASCOfferTheme *)self progressLineWidth];
  double v11 = v10;
  int v12 = [(ASCOfferTheme *)self progressLineCap];
  [(ASCOfferTheme *)self stopIndicatorRatio];
  double v14 = v13;
  [(ASCOfferTheme *)self stopIndicatorCornerSize];
  double v16 = v15;
  double v18 = v17;
  id v19 = [(ASCOfferTheme *)self backgroundStyle];
  LODWORD(v22) = v12;
  v20 = objc_msgSend(v3, "initWithTitleBackgroundColor:titleTextColor:titleTextDisabledColor:subtitleTextColor:iconTintColor:progressColor:progressLineWidth:progressLineCap:stopIndicatorRatio:stopIndicatorCornerSize:backgroundStyle:", v4, v5, v6, v7, v8, v9, v11, v14, v16, v18, v22, v19);

  return v20;
}

- (ASCOfferTheme)offerThemeWithProgressLineWidth:(double)a3
{
  [(ASCOfferTheme *)self progressLineWidth];
  if (v5 == a3)
  {
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = [(ASCOfferTheme *)self clone];
    v6->_progressLineWidth = a3;
  }

  return v6;
}

- (ASCOfferTheme)offerThemeWithProgressLineCap:(int)a3
{
  if ([(ASCOfferTheme *)self progressLineCap] == a3)
  {
    double v5 = self;
  }
  else
  {
    double v5 = [(ASCOfferTheme *)self clone];
    v5->_progressLineCap = a3;
  }

  return v5;
}

- (ASCOfferTheme)offerThemeWithStopIndicatorRatio:(double)a3
{
  [(ASCOfferTheme *)self stopIndicatorRatio];
  if (v5 == a3)
  {
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = [(ASCOfferTheme *)self clone];
    v6->_stopIndicatorRatio = a3;
  }

  return v6;
}

- (ASCOfferTheme)offerThemeWithBackgroundStyle:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(ASCOfferTheme *)self backgroundStyle];
  id v7 = v6;
  if (v5 && v6)
  {
    int v8 = [v6 isEqual:v5];

    if (v8)
    {
LABEL_4:
      uint64_t v9 = self;
      goto LABEL_7;
    }
  }
  else
  {

    if (v7 == v5) {
      goto LABEL_4;
    }
  }
  uint64_t v9 = [(ASCOfferTheme *)self clone];
  objc_storeStrong((id *)&v9->_backgroundStyle, a3);
LABEL_7:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(ASCHasher);
  v4 = [(ASCOfferTheme *)self titleBackgroundColor];
  [(ASCHasher *)v3 combineObject:v4];

  id v5 = [(ASCOfferTheme *)self titleTextColor];
  [(ASCHasher *)v3 combineObject:v5];

  uint64_t v6 = [(ASCOfferTheme *)self titleTextDisabledColor];
  [(ASCHasher *)v3 combineObject:v6];

  id v7 = [(ASCOfferTheme *)self subtitleTextColor];
  [(ASCHasher *)v3 combineObject:v7];

  int v8 = [(ASCOfferTheme *)self iconTintColor];
  [(ASCHasher *)v3 combineObject:v8];

  uint64_t v9 = [(ASCOfferTheme *)self progressColor];
  [(ASCHasher *)v3 combineObject:v9];

  [(ASCOfferTheme *)self progressLineWidth];
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  [(ASCHasher *)v3 combineInteger:[(ASCOfferTheme *)self progressLineCap]];
  [(ASCOfferTheme *)self stopIndicatorRatio];
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  [(ASCOfferTheme *)self stopIndicatorCornerSize];
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  [(ASCOfferTheme *)self stopIndicatorCornerSize];
  [(ASCHasher *)v3 combineDouble:v10];
  double v11 = [(ASCOfferTheme *)self backgroundStyle];
  [(ASCHasher *)v3 combineObject:v11];

  unint64_t v12 = [(ASCHasher *)v3 finalizeHash];
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    int v8 = [(ASCOfferTheme *)self titleBackgroundColor];
    uint64_t v9 = [v7 titleBackgroundColor];
    double v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9])
      {
LABEL_10:
        double v11 = [(ASCOfferTheme *)self titleTextColor];
        uint64_t v12 = [v7 titleTextColor];
        double v13 = (void *)v12;
        if (v11 && v12)
        {
          if ([v11 isEqual:v12])
          {
LABEL_13:
            double v14 = [(ASCOfferTheme *)self titleTextDisabledColor];
            uint64_t v15 = [v7 titleTextDisabledColor];
            double v16 = (void *)v15;
            if (v14 && v15)
            {
              if ([v14 isEqual:v15])
              {
LABEL_16:
                double v17 = [(ASCOfferTheme *)self subtitleTextColor];
                uint64_t v18 = [v7 subtitleTextColor];
                id v19 = (void *)v18;
                v59 = v17;
                if (v17 && v18)
                {
                  v57 = v14;
                  v20 = v16;
                  v21 = (void *)v18;
                  int v22 = [v17 isEqual:v18];
                  id v19 = v21;
                  double v16 = v20;
                  double v14 = v57;
                  if (v22)
                  {
LABEL_19:
                    v55 = v19;
                    v56 = v16;
                    uint64_t v23 = [(ASCOfferTheme *)self iconTintColor];
                    uint64_t v24 = [v7 iconTintColor];
                    id v25 = (void *)v24;
                    v58 = (void *)v23;
                    if (v23 && v24)
                    {
                      v26 = (void *)v24;
                      int v27 = [v58 isEqual:v24];
                      id v25 = v26;
                      if (v27)
                      {
LABEL_22:
                        v53 = v25;
                        uint64_t v28 = [(ASCOfferTheme *)self progressColor];
                        uint64_t v29 = [v7 progressColor];
                        id v30 = (void *)v29;
                        v54 = (void *)v28;
                        if (v28 && v29)
                        {
                          id v31 = (void *)v29;
                          int v32 = [v54 isEqual:v29];
                          id v30 = v31;
                          if (v32)
                          {
LABEL_25:
                            id v33 = v30;
                            [(ASCOfferTheme *)self progressLineWidth];
                            double v35 = v34;
                            [v7 progressLineWidth];
                            if (v35 == v36
                              && (int v37 = [(ASCOfferTheme *)self progressLineCap],
                                  v37 == [v7 progressLineCap])
                              && ([(ASCOfferTheme *)self stopIndicatorRatio],
                                  double v39 = v38,
                                  [v7 stopIndicatorRatio],
                                  v39 == v40))
                            {
                              [(ASCOfferTheme *)self stopIndicatorCornerSize];
                              double v42 = v41;
                              double v44 = v43;
                              [v7 stopIndicatorCornerSize];
                              char v46 = 0;
                              if (v42 == v47)
                              {
                                id v30 = v33;
                                if (v44 == v45)
                                {
                                  v48 = [(ASCOfferTheme *)self backgroundStyle];
                                  uint64_t v49 = [v7 backgroundStyle];
                                  v50 = (void *)v49;
                                  v52 = v48;
                                  if (v48 && v49) {
                                    char v46 = [v48 isEqual:v49];
                                  }
                                  else {
                                    char v46 = v48 == (void *)v49;
                                  }

                                  goto LABEL_47;
                                }
LABEL_48:

                                id v25 = v53;
                                goto LABEL_49;
                              }
                            }
                            else
                            {
                              char v46 = 0;
                            }
LABEL_47:
                            id v30 = v33;
                            goto LABEL_48;
                          }
                        }
                        else if (v28 == v29)
                        {
                          goto LABEL_25;
                        }
                        char v46 = 0;
                        goto LABEL_48;
                      }
                    }
                    else if (v23 == v24)
                    {
                      goto LABEL_22;
                    }
                    char v46 = 0;
LABEL_49:

                    id v19 = v55;
                    double v16 = v56;
                    goto LABEL_50;
                  }
                }
                else if (v17 == (void *)v18)
                {
                  goto LABEL_19;
                }
                char v46 = 0;
LABEL_50:

                goto LABEL_51;
              }
            }
            else if (v14 == (void *)v15)
            {
              goto LABEL_16;
            }
            char v46 = 0;
LABEL_51:

            goto LABEL_52;
          }
        }
        else if (v11 == (void *)v12)
        {
          goto LABEL_13;
        }
        char v46 = 0;
LABEL_52:

        goto LABEL_53;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    char v46 = 0;
LABEL_53:

    goto LABEL_54;
  }
  char v46 = 0;
LABEL_54:

  return v46;
}

- (id)description
{
  id v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCOfferTheme *)self titleBackgroundColor];
  [(ASCDescriber *)v3 addObject:v4 withName:@"titleBackgroundColor"];

  id v5 = [(ASCOfferTheme *)self titleTextColor];
  [(ASCDescriber *)v3 addObject:v5 withName:@"titleTextColor"];

  uint64_t v6 = [(ASCOfferTheme *)self titleTextDisabledColor];
  [(ASCDescriber *)v3 addObject:v6 withName:@"titleTextDisabledColor"];

  id v7 = [(ASCOfferTheme *)self subtitleTextColor];
  [(ASCDescriber *)v3 addObject:v7 withName:@"subtitleTextColor"];

  int v8 = [(ASCOfferTheme *)self iconTintColor];
  [(ASCDescriber *)v3 addObject:v8 withName:@"iconTintColor"];

  uint64_t v9 = [(ASCOfferTheme *)self progressColor];
  [(ASCDescriber *)v3 addObject:v9 withName:@"progressColor"];

  [(ASCOfferTheme *)self progressLineWidth];
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", @"progressLineWidth");
  [(ASCDescriber *)v3 addInteger:[(ASCOfferTheme *)self progressLineCap] withName:@"progressLineCap"];
  [(ASCOfferTheme *)self stopIndicatorRatio];
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", @"stopIndicatorRatio");
  [(ASCOfferTheme *)self stopIndicatorCornerSize];
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", @"stopIndicatorCornerSize.width");
  [(ASCOfferTheme *)self stopIndicatorCornerSize];
  [(ASCDescriber *)v3 addDouble:@"stopIndicatorCornerSize.height" withName:v10];
  double v11 = [(ASCOfferTheme *)self backgroundStyle];
  [(ASCDescriber *)v3 addObject:v11 withName:@"backgroundStyle"];

  uint64_t v12 = [(ASCDescriber *)v3 finalizeDescription];

  return v12;
}

- (UIColor)titleBackgroundColor
{
  return self->_titleBackgroundColor;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (UIColor)titleTextDisabledColor
{
  return self->_titleTextDisabledColor;
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (UIColor)iconTintColor
{
  return self->_iconTintColor;
}

- (UIColor)progressColor
{
  return self->_progressColor;
}

- (double)progressLineWidth
{
  return self->_progressLineWidth;
}

- (int)progressLineCap
{
  return self->_progressLineCap;
}

- (double)stopIndicatorRatio
{
  return self->_stopIndicatorRatio;
}

- (CGSize)stopIndicatorCornerSize
{
  double width = self->_stopIndicatorCornerSize.width;
  double height = self->_stopIndicatorCornerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (ASCOfferBackgroundStyle)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundStyle, 0);
  objc_storeStrong((id *)&self->_progressColor, 0);
  objc_storeStrong((id *)&self->_iconTintColor, 0);
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextDisabledColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);

  objc_storeStrong((id *)&self->_titleBackgroundColor, 0);
}

@end