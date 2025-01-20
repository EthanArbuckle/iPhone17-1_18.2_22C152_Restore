@interface MPArtworkColorAnalyzer
+ (id)translateFromMLColorAnalysis:(id)a3;
- (MPArtworkColorAnalyzer)initWithImage:(id)a3;
- (UIImage)image;
- (id)_fallbackColorAnalysis;
- (id)analyze;
- (int64_t)algorithm;
- (void)analyzeWithCompletionHandler:(id)a3;
@end

@implementation MPArtworkColorAnalyzer

+ (id)translateFromMLColorAnalysis:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(MPMutableArtworkColorAnalysis);
  v5 = [v3 backgroundColor];
  v6 = objc_msgSend(v5, "MP_colorFromHexString");
  [(MPMutableArtworkColorAnalysis *)v4 setBackgroundColor:v6];

  -[MPMutableArtworkColorAnalysis setBackgroundColorLight:](v4, "setBackgroundColorLight:", [v3 isBackgroundColorLight]);
  v7 = [v3 primaryTextColor];
  v8 = objc_msgSend(v7, "MP_colorFromHexString");
  [(MPMutableArtworkColorAnalysis *)v4 setPrimaryTextColor:v8];

  -[MPMutableArtworkColorAnalysis setPrimaryTextColorLight:](v4, "setPrimaryTextColorLight:", [v3 isPrimaryTextColorLight]);
  v9 = [v3 secondaryTextColor];
  v10 = objc_msgSend(v9, "MP_colorFromHexString");
  [(MPMutableArtworkColorAnalysis *)v4 setSecondaryTextColor:v10];

  -[MPMutableArtworkColorAnalysis setSecondaryTextColorLight:](v4, "setSecondaryTextColorLight:", [v3 isSecondaryTextColorLight]);
  v11 = [v3 tertiaryTextColor];
  v12 = objc_msgSend(v11, "MP_colorFromHexString");
  [(MPMutableArtworkColorAnalysis *)v4 setTertiaryTextColor:v12];

  -[MPMutableArtworkColorAnalysis setTertiaryTextColorLight:](v4, "setTertiaryTextColorLight:", [v3 isTertiaryTextColorLight]);

  return v4;
}

- (void).cxx_destruct
{
}

- (int64_t)algorithm
{
  return self->_algorithm;
}

- (UIImage)image
{
  return self->_image;
}

- (id)_fallbackColorAnalysis
{
  v2 = objc_alloc_init(MPMutableArtworkColorAnalysis);
  id v3 = [MEMORY[0x1E4FB1618] whiteColor];
  [(MPMutableArtworkColorAnalysis *)v2 setBackgroundColor:v3];

  [(MPMutableArtworkColorAnalysis *)v2 setBackgroundColorLight:1];
  v4 = [MEMORY[0x1E4FB1618] blackColor];
  [(MPMutableArtworkColorAnalysis *)v2 setPrimaryTextColor:v4];

  [(MPMutableArtworkColorAnalysis *)v2 setPrimaryTextColorLight:0];
  v5 = [MEMORY[0x1E4FB1618] darkGrayColor];
  [(MPMutableArtworkColorAnalysis *)v2 setSecondaryTextColor:v5];

  [(MPMutableArtworkColorAnalysis *)v2 setSecondaryTextColorLight:0];
  v6 = [MEMORY[0x1E4FB1618] darkGrayColor];
  [(MPMutableArtworkColorAnalysis *)v2 setTertiaryTextColor:v6];

  [(MPMutableArtworkColorAnalysis *)v2 setTertiaryTextColorLight:0];

  return v2;
}

- (void)analyzeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__MPArtworkColorAnalyzer_analyzeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E57F9140;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__MPArtworkColorAnalyzer_analyzeWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [v2 analyze];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

- (id)analyze
{
  id v3 = objc_alloc(MEMORY[0x1E4F77920]);
  id v4 = [(MPArtworkColorAnalyzer *)self image];
  v5 = objc_msgSend(v3, "initWithSourceImage:", objc_msgSend(v4, "CGImage"));

  id v6 = [v5 analyze];
  v7 = objc_alloc_init(MPMutableArtworkColorAnalysis);
  id v8 = [v6 backgroundColorHex];
  v9 = objc_msgSend(v8, "MP_colorFromHexString");
  [(MPMutableArtworkColorAnalysis *)v7 setBackgroundColor:v9];

  -[MPMutableArtworkColorAnalysis setBackgroundColorLight:](v7, "setBackgroundColorLight:", [v6 isBackgroundColorLight]);
  v10 = [v6 primaryTextColorHex];
  v11 = objc_msgSend(v10, "MP_colorFromHexString");
  [(MPMutableArtworkColorAnalysis *)v7 setPrimaryTextColor:v11];

  -[MPMutableArtworkColorAnalysis setPrimaryTextColorLight:](v7, "setPrimaryTextColorLight:", [v6 isPrimaryTextColorLight]);
  v12 = [v6 secondaryTextColorHex];
  v13 = objc_msgSend(v12, "MP_colorFromHexString");
  [(MPMutableArtworkColorAnalysis *)v7 setSecondaryTextColor:v13];

  -[MPMutableArtworkColorAnalysis setSecondaryTextColorLight:](v7, "setSecondaryTextColorLight:", [v6 isSecondaryTextColorLight]);
  v14 = [v6 tertiaryTextColorHex];
  v15 = objc_msgSend(v14, "MP_colorFromHexString");
  [(MPMutableArtworkColorAnalysis *)v7 setTertiaryTextColor:v15];

  -[MPMutableArtworkColorAnalysis setTertiaryTextColorLight:](v7, "setTertiaryTextColorLight:", [v6 isTertiaryTextColorLight]);

  return v7;
}

- (MPArtworkColorAnalyzer)initWithImage:(id)a3
{
  id v5 = a3;
  id v6 = [(MPArtworkColorAnalyzer *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_image, a3);
  }

  return v7;
}

@end