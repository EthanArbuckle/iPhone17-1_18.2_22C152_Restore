@interface ASCStaticLockupTheme
+ (ASCStaticLockupTheme)adTheme;
+ (ASCStaticLockupTheme)adWhiteTheme;
+ (ASCStaticLockupTheme)webBrowserTheme;
- (ASCStaticLockupTheme)initWithTitleTextColor:(id)a3 titleFontSizeProvider:(id)a4 titleFontWeight:(double)a5 subtitleTextColor:(id)a6 subtitleFontSizeProvider:(id)a7 subtitleFontWeight:(double)a8 headingTextColor:(id)a9 headingFontSizeProvider:(id)a10 headingFontWeight:(double)a11;
- (ASCStaticLockupTheme)initWithTitleTextColor:(id)a3 titleTextStyle:(id)a4 titleFontWeight:(double)a5 titleTraits:(unsigned int)a6 subtitleTextColor:(id)a7 subtitleTextStyle:(id)a8 subtitleFontWeight:(double)a9 subtitleTraits:(unsigned int)a10 headingTextColor:(id)a11 headingTextStyle:(id)a12 headingFontWeight:(double)a13 headingTraits:(unsigned int)a14;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)headingTextStyle;
- (NSString)subtitleTextStyle;
- (NSString)titleTextStyle;
- (UIColor)headingTextColor;
- (UIColor)subtitleTextColor;
- (UIColor)titleTextColor;
- (double)headingFontWeight;
- (double)subtitleFontWeight;
- (double)titleFontWeight;
- (id)headingFontCompatibleWithTraitCollection:(id)a3;
- (id)headingFontSizeProvider;
- (id)subtitleFontCompatibleWithTraitCollection:(id)a3;
- (id)subtitleFontSizeProvider;
- (id)titleFontCompatibleWithTraitCollection:(id)a3;
- (id)titleFontSizeProvider;
- (unint64_t)hash;
- (unsigned)headingTraits;
- (unsigned)subtitleTraits;
- (unsigned)titleTraits;
- (void)applyToLockupContentView:(id)a3 compatibleWithTraitCollection:(id)a4;
- (void)setHeadingFontSizeProvider:(id)a3;
- (void)setHeadingFontWeight:(double)a3;
- (void)setHeadingTextStyle:(id)a3;
- (void)setHeadingTraits:(unsigned int)a3;
- (void)setSubtitleFontSizeProvider:(id)a3;
- (void)setSubtitleFontWeight:(double)a3;
- (void)setSubtitleTextStyle:(id)a3;
- (void)setSubtitleTraits:(unsigned int)a3;
- (void)setTitleFontSizeProvider:(id)a3;
- (void)setTitleFontWeight:(double)a3;
- (void)setTitleTextStyle:(id)a3;
- (void)setTitleTraits:(unsigned int)a3;
@end

@implementation ASCStaticLockupTheme

+ (ASCStaticLockupTheme)adTheme
{
  if (adTheme_onceToken_0 != -1) {
    dispatch_once(&adTheme_onceToken_0, &__block_literal_global_27);
  }
  v2 = (void *)adTheme_adTheme_0;

  return (ASCStaticLockupTheme *)v2;
}

void __31__ASCStaticLockupTheme_adTheme__block_invoke()
{
  v0 = [ASCStaticLockupTheme alloc];
  +[ASCSemanticColor primaryLabel]();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  double v1 = *MEMORY[0x1E4FB29A8];
  v2 = +[ASCSemanticColor secondaryLabel]();
  double v3 = *MEMORY[0x1E4FB29C0];
  v4 = +[ASCSemanticColor secondaryLabel]();
  uint64_t v5 = [(ASCStaticLockupTheme *)v0 initWithTitleTextColor:v7 titleFontSizeProvider:&__block_literal_global_4_1 titleFontWeight:v2 subtitleTextColor:&__block_literal_global_7_1 subtitleFontSizeProvider:v4 subtitleFontWeight:&__block_literal_global_9 headingTextColor:v1 headingFontSizeProvider:v3 headingFontWeight:*MEMORY[0x1E4FB29C8]];
  v6 = (void *)adTheme_adTheme_0;
  adTheme_adTheme_0 = v5;
}

uint64_t __31__ASCStaticLockupTheme_adTheme__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[__ASCLayoutProxy lockupTitlePointSizeProvider:a2];
}

uint64_t __31__ASCStaticLockupTheme_adTheme__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[__ASCLayoutProxy lockupSubtitlePointSizeProvider:a2];
}

uint64_t __31__ASCStaticLockupTheme_adTheme__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[__ASCLayoutProxy lockupHeadingPointSizeProvider:a2];
}

+ (ASCStaticLockupTheme)adWhiteTheme
{
  if (adWhiteTheme_onceToken != -1) {
    dispatch_once(&adWhiteTheme_onceToken, &__block_literal_global_11_0);
  }
  v2 = (void *)adWhiteTheme_adWhiteTheme;

  return (ASCStaticLockupTheme *)v2;
}

void __36__ASCStaticLockupTheme_adWhiteTheme__block_invoke()
{
  v0 = [ASCStaticLockupTheme alloc];
  double v1 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
  v2 = +[ASCSemanticColor primaryLabel]();
  id v9 = [v2 resolvedColorWithTraitCollection:v1];

  double v3 = *MEMORY[0x1E4FB29A8];
  v4 = ASCLockupDarkStyleSubtitleColor();
  double v5 = *MEMORY[0x1E4FB29C0];
  v6 = ASCLockupDarkStyleSubtitleColor();
  uint64_t v7 = [(ASCStaticLockupTheme *)v0 initWithTitleTextColor:v9 titleFontSizeProvider:&__block_literal_global_13 titleFontWeight:v4 subtitleTextColor:&__block_literal_global_15 subtitleFontSizeProvider:v6 subtitleFontWeight:&__block_literal_global_17 headingTextColor:v3 headingFontSizeProvider:v5 headingFontWeight:*MEMORY[0x1E4FB29C8]];
  v8 = (void *)adWhiteTheme_adWhiteTheme;
  adWhiteTheme_adWhiteTheme = v7;
}

uint64_t __36__ASCStaticLockupTheme_adWhiteTheme__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[__ASCLayoutProxy lockupTitlePointSizeProvider:a2];
}

uint64_t __36__ASCStaticLockupTheme_adWhiteTheme__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[__ASCLayoutProxy lockupSubtitlePointSizeProvider:a2];
}

uint64_t __36__ASCStaticLockupTheme_adWhiteTheme__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[__ASCLayoutProxy lockupHeadingPointSizeProvider:a2];
}

+ (ASCStaticLockupTheme)webBrowserTheme
{
  if (webBrowserTheme_onceToken != -1) {
    dispatch_once(&webBrowserTheme_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)webBrowserTheme_webBrowserTheme;

  return (ASCStaticLockupTheme *)v2;
}

void __39__ASCStaticLockupTheme_webBrowserTheme__block_invoke()
{
  v0 = [ASCStaticLockupTheme alloc];
  +[ASCSemanticColor primaryLabel]();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = *MEMORY[0x1E4FB28C8];
  double v2 = *MEMORY[0x1E4FB29C8];
  double v3 = +[ASCSemanticColor secondaryLabel]();
  uint64_t v4 = *MEMORY[0x1E4FB28D8];
  double v5 = +[ASCSemanticColor secondaryLabel]();
  LODWORD(v8) = 0x8000;
  uint64_t v6 = [(ASCStaticLockupTheme *)v0 initWithTitleTextColor:v9 titleTextStyle:v1 titleFontWeight:0x8000 titleTraits:v3 subtitleTextColor:v4 subtitleTextStyle:0x8000 subtitleFontWeight:v2 subtitleTraits:v2 headingTextColor:v2 headingTextStyle:v5 headingFontWeight:*MEMORY[0x1E4FB28F0] headingTraits:v8];
  uint64_t v7 = (void *)webBrowserTheme_webBrowserTheme;
  webBrowserTheme_webBrowserTheme = v6;
}

- (ASCStaticLockupTheme)initWithTitleTextColor:(id)a3 titleTextStyle:(id)a4 titleFontWeight:(double)a5 titleTraits:(unsigned int)a6 subtitleTextColor:(id)a7 subtitleTextStyle:(id)a8 subtitleFontWeight:(double)a9 subtitleTraits:(unsigned int)a10 headingTextColor:(id)a11 headingTextStyle:(id)a12 headingFontWeight:(double)a13 headingTraits:(unsigned int)a14
{
  id v22 = a3;
  id v32 = a4;
  id v31 = a7;
  id v30 = a8;
  id v23 = a11;
  id v24 = a12;
  v33.receiver = self;
  v33.super_class = (Class)ASCStaticLockupTheme;
  v25 = [(ASCStaticLockupTheme *)&v33 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_titleTextColor, a3);
    objc_storeStrong((id *)&v26->_titleTextStyle, a4);
    v26->_titleFontWeight = a5;
    v26->_titleTraits = a6;
    objc_storeStrong((id *)&v26->_subtitleTextColor, a7);
    objc_storeStrong((id *)&v26->_subtitleTextStyle, a8);
    v26->_subtitleFontWeight = a9;
    v26->_subtitleTraits = a10;
    objc_storeStrong((id *)&v26->_headingTextColor, a11);
    objc_storeStrong((id *)&v26->_headingTextStyle, a12);
    v26->_headingFontWeight = a13;
    v26->_headingTraits = a14;
  }

  return v26;
}

- (ASCStaticLockupTheme)initWithTitleTextColor:(id)a3 titleFontSizeProvider:(id)a4 titleFontWeight:(double)a5 subtitleTextColor:(id)a6 subtitleFontSizeProvider:(id)a7 subtitleFontWeight:(double)a8 headingTextColor:(id)a9 headingFontSizeProvider:(id)a10 headingFontWeight:(double)a11
{
  id v35 = a3;
  id v21 = a4;
  id v22 = a6;
  id v23 = a7;
  id v24 = a9;
  id v25 = a10;
  v36.receiver = self;
  v36.super_class = (Class)ASCStaticLockupTheme;
  v26 = [(ASCStaticLockupTheme *)&v36 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_titleTextColor, a3);
    uint64_t v28 = MEMORY[0x1C8768F90](v21);
    id titleFontSizeProvider = v27->_titleFontSizeProvider;
    v27->_id titleFontSizeProvider = (id)v28;

    v27->_titleFontWeight = a5;
    objc_storeStrong((id *)&v27->_subtitleTextColor, a6);
    uint64_t v30 = MEMORY[0x1C8768F90](v23);
    subid titleFontSizeProvider = v27->_subtitleFontSizeProvider;
    v27->_subid titleFontSizeProvider = (id)v30;

    v27->_subtitleFontWeight = a8;
    objc_storeStrong((id *)&v27->_headingTextColor, a9);
    uint64_t v32 = MEMORY[0x1C8768F90](v25);
    id headingFontSizeProvider = v27->_headingFontSizeProvider;
    v27->_id headingFontSizeProvider = (id)v32;

    v27->_headingFontWeight = a11;
  }

  return v27;
}

- (id)titleFontCompatibleWithTraitCollection:(id)a3
{
  id v4 = a3;
  double v5 = [(ASCStaticLockupTheme *)self titleFontSizeProvider];

  if (v5)
  {
    uint64_t v6 = [(ASCStaticLockupTheme *)self titleFontSizeProvider];
    uint64_t v7 = [v4 preferredContentSizeCategory];
    double v8 = ((double (**)(void, void *))v6)[2](v6, v7);

    if (!titleFontCompatibleWithTraitCollection__titleFont
      || ([(id)titleFontCompatibleWithTraitCollection__titleFont pointSize], v9 != v8))
    {
      v10 = (void *)MEMORY[0x1E4FB1798];
      [(ASCStaticLockupTheme *)self titleFontWeight];
      uint64_t v12 = [v10 systemFontOfSize:v8 weight:v11];
      v13 = (void *)titleFontCompatibleWithTraitCollection__titleFont;
      titleFontCompatibleWithTraitCollection__titleFont = v12;
    }
    id v14 = (id)titleFontCompatibleWithTraitCollection__titleFont;
  }
  else
  {
    unsigned int v15 = [(ASCStaticLockupTheme *)self titleTraits];
    v16 = (void *)MEMORY[0x1E4FB1798];
    v17 = [(ASCStaticLockupTheme *)self titleTextStyle];
    if (v15)
    {
      objc_msgSend(v16, "asc_preferredFontForTextStyle:withTraits:compatibleWithTraitCollection:", v17, -[ASCStaticLockupTheme titleTraits](self, "titleTraits"), v4);
    }
    else
    {
      [(ASCStaticLockupTheme *)self titleFontWeight];
      objc_msgSend(v16, "asc_fontDerivedFromTextStyle:byApplyingFontWeight:compatibleWithTraitCollection:", v17, v4);
    }
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)subtitleFontCompatibleWithTraitCollection:(id)a3
{
  id v4 = a3;
  double v5 = [(ASCStaticLockupTheme *)self subtitleFontSizeProvider];

  if (v5)
  {
    uint64_t v6 = [(ASCStaticLockupTheme *)self subtitleFontSizeProvider];
    uint64_t v7 = [v4 preferredContentSizeCategory];
    double v8 = ((double (**)(void, void *))v6)[2](v6, v7);

    if (!subtitleFontCompatibleWithTraitCollection__subtitleFont
      || ([(id)subtitleFontCompatibleWithTraitCollection__subtitleFont pointSize], v9 != v8))
    {
      v10 = (void *)MEMORY[0x1E4FB1798];
      [(ASCStaticLockupTheme *)self subtitleFontWeight];
      uint64_t v12 = [v10 systemFontOfSize:v8 weight:v11];
      v13 = (void *)subtitleFontCompatibleWithTraitCollection__subtitleFont;
      subtitleFontCompatibleWithTraitCollection__subtitleFont = v12;
    }
    id v14 = (id)subtitleFontCompatibleWithTraitCollection__subtitleFont;
  }
  else
  {
    unsigned int v15 = [(ASCStaticLockupTheme *)self subtitleTraits];
    v16 = (void *)MEMORY[0x1E4FB1798];
    v17 = [(ASCStaticLockupTheme *)self subtitleTextStyle];
    if (v15)
    {
      objc_msgSend(v16, "asc_preferredFontForTextStyle:withTraits:compatibleWithTraitCollection:", v17, -[ASCStaticLockupTheme subtitleTraits](self, "subtitleTraits"), v4);
    }
    else
    {
      [(ASCStaticLockupTheme *)self subtitleFontWeight];
      objc_msgSend(v16, "asc_fontDerivedFromTextStyle:byApplyingFontWeight:compatibleWithTraitCollection:", v17, v4);
    }
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)headingFontCompatibleWithTraitCollection:(id)a3
{
  id v4 = a3;
  double v5 = [(ASCStaticLockupTheme *)self headingFontSizeProvider];

  if (v5)
  {
    uint64_t v6 = [(ASCStaticLockupTheme *)self headingFontSizeProvider];
    uint64_t v7 = [v4 preferredContentSizeCategory];
    double v8 = ((double (**)(void, void *))v6)[2](v6, v7);

    if (!headingFontCompatibleWithTraitCollection__headingFont
      || ([(id)headingFontCompatibleWithTraitCollection__headingFont pointSize], v9 != v8))
    {
      v10 = (void *)MEMORY[0x1E4FB1798];
      [(ASCStaticLockupTheme *)self headingFontWeight];
      uint64_t v12 = [v10 systemFontOfSize:v8 weight:v11];
      v13 = (void *)headingFontCompatibleWithTraitCollection__headingFont;
      headingFontCompatibleWithTraitCollection__headingFont = v12;
    }
    id v14 = (id)headingFontCompatibleWithTraitCollection__headingFont;
  }
  else
  {
    unsigned int v15 = [(ASCStaticLockupTheme *)self headingTraits];
    v16 = (void *)MEMORY[0x1E4FB1798];
    v17 = [(ASCStaticLockupTheme *)self headingTextStyle];
    if (v15)
    {
      objc_msgSend(v16, "asc_preferredFontForTextStyle:withTraits:compatibleWithTraitCollection:", v17, -[ASCStaticLockupTheme headingTraits](self, "headingTraits"), v4);
    }
    else
    {
      [(ASCStaticLockupTheme *)self headingFontWeight];
      objc_msgSend(v16, "asc_fontDerivedFromTextStyle:byApplyingFontWeight:compatibleWithTraitCollection:", v17, v4);
    }
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (void)applyToLockupContentView:(id)a3 compatibleWithTraitCollection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(ASCStaticLockupTheme *)self titleTextColor];
  double v9 = [v7 titleLabel];
  [v9 setTextColor:v8];

  v10 = [(ASCStaticLockupTheme *)self subtitleTextColor];
  double v11 = [v7 subtitleLabel];
  [v11 setTextColor:v10];

  uint64_t v12 = [(ASCStaticLockupTheme *)self headingTextColor];
  v13 = [v7 headingLabelIfLoaded];
  [v13 setTextColor:v12];

  id v14 = [(ASCStaticLockupTheme *)self titleFontCompatibleWithTraitCollection:v6];
  unsigned int v15 = [v7 titleLabel];
  [v15 setFont:v14];

  v16 = [(ASCStaticLockupTheme *)self subtitleFontCompatibleWithTraitCollection:v6];
  v17 = [v7 subtitleLabel];
  [v17 setFont:v16];

  id v19 = [(ASCStaticLockupTheme *)self headingFontCompatibleWithTraitCollection:v6];

  v18 = [v7 headingLabelIfLoaded];

  [v18 setFont:v19];
}

- (unint64_t)hash
{
  double v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCStaticLockupTheme *)self titleTextColor];
  [(ASCHasher *)v3 combineObject:v4];

  double v5 = [(ASCStaticLockupTheme *)self titleTextStyle];
  [(ASCHasher *)v3 combineObject:v5];

  [(ASCStaticLockupTheme *)self titleFontWeight];
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  [(ASCHasher *)v3 combineUnsignedInteger:[(ASCStaticLockupTheme *)self titleTraits]];
  id v6 = [(ASCStaticLockupTheme *)self subtitleTextColor];
  [(ASCHasher *)v3 combineObject:v6];

  id v7 = [(ASCStaticLockupTheme *)self subtitleTextStyle];
  [(ASCHasher *)v3 combineObject:v7];

  [(ASCStaticLockupTheme *)self subtitleFontWeight];
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  [(ASCHasher *)v3 combineUnsignedInteger:[(ASCStaticLockupTheme *)self subtitleTraits]];
  double v8 = [(ASCStaticLockupTheme *)self headingTextColor];
  [(ASCHasher *)v3 combineObject:v8];

  double v9 = [(ASCStaticLockupTheme *)self headingTextStyle];
  [(ASCHasher *)v3 combineObject:v9];

  [(ASCStaticLockupTheme *)self headingFontWeight];
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  [(ASCHasher *)v3 combineUnsignedInteger:[(ASCStaticLockupTheme *)self headingTraits]];
  unint64_t v10 = [(ASCHasher *)v3 finalizeHash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    double v8 = [(ASCStaticLockupTheme *)self titleTextColor];
    uint64_t v9 = [v7 titleTextColor];
    unint64_t v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9])
      {
LABEL_10:
        double v11 = [(ASCStaticLockupTheme *)self titleTextStyle];
        uint64_t v12 = [v7 titleTextStyle];
        v13 = (void *)v12;
        if (v11 && v12)
        {
          if (![v11 isEqual:v12]) {
            goto LABEL_33;
          }
        }
        else if (v11 != (void *)v12)
        {
          goto LABEL_33;
        }
        [(ASCStaticLockupTheme *)self titleFontWeight];
        double v16 = v15;
        [v7 titleFontWeight];
        if (v16 == v17)
        {
          v18 = [(ASCStaticLockupTheme *)self subtitleTextColor];
          uint64_t v19 = [v7 subtitleTextColor];
          v20 = (void *)v19;
          if (v18 && v19)
          {
            if ([v18 isEqual:v19])
            {
LABEL_22:
              id v21 = [(ASCStaticLockupTheme *)self subtitleTextStyle];
              uint64_t v22 = [v7 subtitleTextStyle];
              id v23 = (void *)v22;
              if (v21 && v22)
              {
                id v24 = v21;
                v51 = v20;
                id v25 = v21;
                v26 = v23;
                int v27 = [v24 isEqual:v23];
                id v23 = v26;
                id v21 = v25;
                v20 = v51;
                if (v27) {
                  goto LABEL_25;
                }
              }
              else if (v21 == (void *)v22)
              {
LABEL_25:
                v49 = v23;
                v50 = v21;
                [(ASCStaticLockupTheme *)self subtitleFontWeight];
                double v29 = v28;
                [v7 subtitleFontWeight];
                if (v29 != v30)
                {
                  BOOL v14 = 0;
LABEL_45:
                  id v23 = v49;
                  id v21 = v50;
                  goto LABEL_46;
                }
                uint64_t v31 = [(ASCStaticLockupTheme *)self headingTextColor];
                uint64_t v32 = [v7 headingTextColor];
                objc_super v33 = (void *)v32;
                v52 = (void *)v31;
                if (v31 && v32)
                {
                  v34 = (void *)v32;
                  int v35 = [v52 isEqual:v32];
                  objc_super v33 = v34;
                  if (v35)
                  {
LABEL_29:
                    v47 = v33;
                    uint64_t v36 = [(ASCStaticLockupTheme *)self headingTextStyle];
                    uint64_t v37 = [v7 headingTextStyle];
                    v38 = (void *)v37;
                    v48 = (void *)v36;
                    if (v36 && v37)
                    {
                      v39 = (void *)v37;
                      int v40 = [v48 isEqual:v37];
                      v38 = v39;
                      if (v40)
                      {
LABEL_32:
                        v41 = self;
                        v42 = v38;
                        [(ASCStaticLockupTheme *)v41 headingFontWeight];
                        double v44 = v43;
                        [v7 headingFontWeight];
                        v38 = v42;
                        BOOL v14 = v44 == v45;
LABEL_43:

                        objc_super v33 = v47;
                        goto LABEL_44;
                      }
                    }
                    else if (v36 == v37)
                    {
                      goto LABEL_32;
                    }
                    BOOL v14 = 0;
                    goto LABEL_43;
                  }
                }
                else if (v31 == v32)
                {
                  goto LABEL_29;
                }
                BOOL v14 = 0;
LABEL_44:

                goto LABEL_45;
              }
              BOOL v14 = 0;
LABEL_46:

              goto LABEL_47;
            }
          }
          else if (v18 == (void *)v19)
          {
            goto LABEL_22;
          }
          BOOL v14 = 0;
LABEL_47:

          goto LABEL_48;
        }
LABEL_33:
        BOOL v14 = 0;
LABEL_48:

        goto LABEL_49;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    BOOL v14 = 0;
LABEL_49:

    goto LABEL_50;
  }
  BOOL v14 = 0;
LABEL_50:

  return v14;
}

- (NSString)description
{
  double v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCStaticLockupTheme *)self titleTextColor];
  [(ASCDescriber *)v3 addObject:v4 withName:@"titleTextColor"];

  id v5 = [(ASCStaticLockupTheme *)self titleTextStyle];
  [(ASCDescriber *)v3 addObject:v5 withName:@"titleTextStyle"];

  [(ASCStaticLockupTheme *)self titleFontWeight];
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", @"titleFontWeight");
  [(ASCDescriber *)v3 addUnsignedInteger:[(ASCStaticLockupTheme *)self titleTraits] withName:@"titleTraits"];
  id v6 = [(ASCStaticLockupTheme *)self subtitleTextColor];
  [(ASCDescriber *)v3 addObject:v6 withName:@"subtitleTextColor"];

  id v7 = [(ASCStaticLockupTheme *)self subtitleTextStyle];
  [(ASCDescriber *)v3 addObject:v7 withName:@"subtitleTextStyle"];

  [(ASCStaticLockupTheme *)self subtitleFontWeight];
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", @"subtitleFontWeight");
  [(ASCDescriber *)v3 addUnsignedInteger:[(ASCStaticLockupTheme *)self subtitleTraits] withName:@"subtitleTraits"];
  double v8 = [(ASCStaticLockupTheme *)self headingTextColor];
  [(ASCDescriber *)v3 addObject:v8 withName:@"headingTextColor"];

  uint64_t v9 = [(ASCStaticLockupTheme *)self headingTextStyle];
  [(ASCDescriber *)v3 addObject:v9 withName:@"headingTextStyle"];

  [(ASCStaticLockupTheme *)self headingFontWeight];
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", @"headingFontWeight");
  [(ASCDescriber *)v3 addUnsignedInteger:[(ASCStaticLockupTheme *)self headingTraits] withName:@"headingTraits"];
  unint64_t v10 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v10;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (UIColor)headingTextColor
{
  return self->_headingTextColor;
}

- (NSString)titleTextStyle
{
  return self->_titleTextStyle;
}

- (void)setTitleTextStyle:(id)a3
{
}

- (id)titleFontSizeProvider
{
  return self->_titleFontSizeProvider;
}

- (void)setTitleFontSizeProvider:(id)a3
{
}

- (double)titleFontWeight
{
  return self->_titleFontWeight;
}

- (void)setTitleFontWeight:(double)a3
{
  self->_titleFontWeight = a3;
}

- (unsigned)titleTraits
{
  return self->_titleTraits;
}

- (void)setTitleTraits:(unsigned int)a3
{
  self->_titleTraits = a3;
}

- (NSString)subtitleTextStyle
{
  return self->_subtitleTextStyle;
}

- (void)setSubtitleTextStyle:(id)a3
{
}

- (id)subtitleFontSizeProvider
{
  return self->_subtitleFontSizeProvider;
}

- (void)setSubtitleFontSizeProvider:(id)a3
{
}

- (double)subtitleFontWeight
{
  return self->_subtitleFontWeight;
}

- (void)setSubtitleFontWeight:(double)a3
{
  self->_subtitleFontWeight = a3;
}

- (unsigned)subtitleTraits
{
  return self->_subtitleTraits;
}

- (void)setSubtitleTraits:(unsigned int)a3
{
  self->_subtitleTraits = a3;
}

- (NSString)headingTextStyle
{
  return self->_headingTextStyle;
}

- (void)setHeadingTextStyle:(id)a3
{
}

- (id)headingFontSizeProvider
{
  return self->_headingFontSizeProvider;
}

- (void)setHeadingFontSizeProvider:(id)a3
{
}

- (double)headingFontWeight
{
  return self->_headingFontWeight;
}

- (void)setHeadingFontWeight:(double)a3
{
  self->_headingFontWeight = a3;
}

- (unsigned)headingTraits
{
  return self->_headingTraits;
}

- (void)setHeadingTraits:(unsigned int)a3
{
  self->_headingTraits = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_headingFontSizeProvider, 0);
  objc_storeStrong((id *)&self->_headingTextStyle, 0);
  objc_storeStrong(&self->_subtitleFontSizeProvider, 0);
  objc_storeStrong((id *)&self->_subtitleTextStyle, 0);
  objc_storeStrong(&self->_titleFontSizeProvider, 0);
  objc_storeStrong((id *)&self->_titleTextStyle, 0);
  objc_storeStrong((id *)&self->_headingTextColor, 0);
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);

  objc_storeStrong((id *)&self->_titleTextColor, 0);
}

@end