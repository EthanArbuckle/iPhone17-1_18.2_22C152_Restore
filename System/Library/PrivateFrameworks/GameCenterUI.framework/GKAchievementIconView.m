@interface GKAchievementIconView
+ (id)progressSource;
+ (id)progressSourceDetail;
- (BOOL)isDetail;
- (GKAchievement)achievement;
- (GKAchievement)localAchievement;
- (GKAchievementIconView)initWithFrame:(CGRect)a3;
- (double)progressForAchievement:(id)a3;
- (id)processProgressImage:(id)a3 forAchievement:(id)a4;
- (id)progressIdentifierForAchievement:(id)a3;
- (void)configureImage;
- (void)loadAndProcessAchievementProgressImageForAchievement:(id)a3 withHandler:(id)a4;
- (void)setAchievement:(id)a3;
- (void)setIsDetail:(BOOL)a3;
- (void)setLocalAchievement:(id)a3;
- (void)setupForAchievement:(id)a3 localAchievement:(id)a4;
@end

@implementation GKAchievementIconView

+ (id)progressSource
{
  if (progressSource_onceToken != -1) {
    dispatch_once(&progressSource_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)progressSource_sResult;

  return v2;
}

uint64_t __39__GKAchievementIconView_progressSource__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F639C8]) initWithName:@"progressSource" imageBrush:0];
  uint64_t v1 = progressSource_sResult;
  progressSource_sResult = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)progressSourceDetail
{
  if (progressSourceDetail_onceToken != -1) {
    dispatch_once(&progressSourceDetail_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)progressSourceDetail_sResult;

  return v2;
}

uint64_t __45__GKAchievementIconView_progressSourceDetail__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F639C8]) initWithName:@"progressSourceDetail" imageBrush:0];
  uint64_t v1 = progressSourceDetail_sResult;
  progressSourceDetail_sResult = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (GKAchievementIconView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKAchievementIconView;
  return -[GKAchievementIconView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setupForAchievement:(id)a3 localAchievement:(id)a4
{
  v11 = self->_achievement;
  v7 = self->_localAchievement;
  v8 = (GKAchievement *)a4;
  v9 = (GKAchievement *)a3;
  [(GKAchievementIconView *)self setAchievement:v9];
  [(GKAchievementIconView *)self setLocalAchievement:v8];

  if (v11 != v9 || v7 != v8) {
    [(GKAchievementIconView *)self configureImage];
  }
}

- (double)progressForAchievement:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 internal];
  char v5 = [v4 isHidden];

  double v6 = 0.0;
  if ((v5 & 1) == 0)
  {
    [v3 percentComplete];
    double v6 = v7 / 100.0;
  }

  return v6;
}

- (id)processProgressImage:(id)a3 forAchievement:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(GKAchievementIconView *)self progressForAchievement:v6];
  v9 = objc_msgSend(v7, "_gkImageWithProgress:achievement:isDetail:", v6, -[GKAchievementIconView isDetail](self, "isDetail"), v8);

  return v9;
}

- (id)progressIdentifierForAchievement:(id)a3
{
  id v4 = a3;
  [(GKAchievementIconView *)self progressForAchievement:v4];
  uint64_t v6 = v5;
  id v7 = NSString;
  double v8 = [v4 identifier];

  v9 = [v7 stringWithFormat:@"%@~%g", v8, v6];

  return v9;
}

- (void)loadAndProcessAchievementProgressImageForAchievement:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [MEMORY[0x1E4F63A10] sharedTheme];
  v9 = v8;
  if (self->_isDetail) {
    [v8 untreatedAchievementImageDetailSource];
  }
  else {
  v10 = [v8 untreatedAchievementImageSource];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke;
  aBlock[3] = &unk_1E5F668B0;
  aBlock[4] = self;
  id v24 = v9;
  id v11 = v10;
  id v25 = v11;
  id v26 = v7;
  id v12 = v7;
  id v13 = v9;
  v14 = _Block_copy(aBlock);
  v15 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_3;
  block[3] = &unk_1E5F647F8;
  id v20 = v11;
  id v21 = v6;
  id v22 = v14;
  id v16 = v14;
  id v17 = v6;
  id v18 = v11;
  dispatch_async(v15, block);
}

void __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1B3E83AA0]();
  double v8 = *(void **)(a1 + 32);
  if (v5)
  {
    v9 = [*(id *)(a1 + 32) processProgressImage:v5 forAchievement:v6];
    if (!v9) {
      goto LABEL_6;
    }
    v10 = *(void **)(a1 + 48);
    id v11 = [*(id *)(a1 + 32) progressIdentifierForAchievement:v6];
    id v12 = (id)[v10 processAndCacheImage:v9 forIdentifier:v11];
  }
  else
  {
    id v11 = [*(id *)(a1 + 40) achievementsDefaultIcon];
    v9 = [v8 processProgressImage:v11 forAchievement:v6];
  }

LABEL_6:
  if (*(void *)(a1 + 56))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_2;
    block[3] = &unk_1E5F63268;
    id v16 = *(id *)(a1 + 56);
    id v14 = v9;
    id v15 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) imageURL];
  id v4 = [v2 cachedImageForIdentifier:v3];

  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) imageURL];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_4;
    v11[3] = &unk_1E5F66900;
    id v12 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 40);
    double v8 = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_6;
    v9[3] = &unk_1E5F64018;
    id v10 = *(id *)(a1 + 48);
    [v5 loadImageForURLString:v6 loader:v11 reference:v7 queue:v8 handler:v9];
  }
}

void __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_5;
  v6[3] = &unk_1E5F668D8;
  id v7 = v3;
  id v5 = v3;
  [v4 loadImageWithCompletionHandler:v6];
}

uint64_t __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)configureImage
{
  p_localAchievement = &self->_localAchievement;
  id v4 = [(GKAchievement *)self->_localAchievement internal];
  if (([v4 isHidden] & 1) == 0) {
    p_localAchievement = &self->_achievement;
  }
  id v5 = *p_localAchievement;

  BOOL isDetail = self->_isDetail;
  id v7 = objc_opt_class();
  if (isDetail) {
    [v7 progressSourceDetail];
  }
  else {
  double v8 = [v7 progressSource];
  }
  v9 = [(GKAchievementIconView *)self progressIdentifierForAchievement:v5];
  id v10 = [v8 cachedImageForIdentifier:v9];

  if (v10)
  {
    [(GKAchievementIconView *)self setImage:v10];
  }
  else
  {
    [(GKAchievementIconView *)self setImage:0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__GKAchievementIconView_configureImage__block_invoke;
    v11[3] = &unk_1E5F66928;
    id v12 = v5;
    id v13 = self;
    [(GKAchievementIconView *)self loadAndProcessAchievementProgressImageForAchievement:v12 withHandler:v11];
  }
}

uint64_t __39__GKAchievementIconView_configureImage__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(void *)(result + 32) == a3)
  {
    uint64_t v3 = result;
    [*(id *)(result + 40) setImage:a2];
    id v4 = *(void **)(v3 + 40);
    return [v4 _gkSetNeedsRender];
  }
  return result;
}

- (BOOL)isDetail
{
  return self->_isDetail;
}

- (void)setIsDetail:(BOOL)a3
{
  self->_BOOL isDetail = a3;
}

- (GKAchievement)achievement
{
  return self->_achievement;
}

- (void)setAchievement:(id)a3
{
}

- (GKAchievement)localAchievement
{
  return self->_localAchievement;
}

- (void)setLocalAchievement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAchievement, 0);

  objc_storeStrong((id *)&self->_achievement, 0);
}

@end