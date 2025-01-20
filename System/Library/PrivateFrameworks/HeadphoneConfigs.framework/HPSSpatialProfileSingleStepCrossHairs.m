@interface HPSSpatialProfileSingleStepCrossHairs
- (HPSSpatialProfileSingleStepCrossHairs)initWithView:(CGRect)a3 view:(id)a4;
- (void)nudgeCustomDirection:(unint64_t)a3 completion:(id)a4;
- (void)nudgeInDirection:(unint64_t)a3 smallNudgePeak:(id)a4 largeNudgePeak:(id)a5 completion:(id)a6;
@end

@implementation HPSSpatialProfileSingleStepCrossHairs

- (HPSSpatialProfileSingleStepCrossHairs)initWithView:(CGRect)a3 view:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)HPSSpatialProfileSingleStepCrossHairs;
  v7 = -[BKUIPearlCrossHairsView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v7) {
    objc_storeStrong((id *)&_parentView, a4);
  }

  return v7;
}

- (void)nudgeCustomDirection:(unint64_t)a3 completion:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)HPSSpatialProfileSingleStepCrossHairs;
  [(BKUIPearlCrossHairsView *)&v4 nudgeInDirection:a3 smallNudgePeak:0 largeNudgePeak:0 completion:a4];
}

- (void)nudgeInDirection:(unint64_t)a3 smallNudgePeak:(id)a4 largeNudgePeak:(id)a5 completion:(id)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v10 = (void (**)(void))a4;
  v11 = (void (**)(void))a5;
  v12 = (void (**)(void))a6;
  v13 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v16 = a3;
    _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Nudging Requesr in direction  %d", buf, 8u);
  }

  if ([(id)_parentView faceCaptured])
  {
    if (v10) {
      v10[2](v10);
    }
    if (v11) {
      v11[2](v11);
    }
    if (v12) {
      v12[2](v12);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HPSSpatialProfileSingleStepCrossHairs;
    [(BKUIPearlCrossHairsView *)&v14 nudgeInDirection:a3 smallNudgePeak:v10 largeNudgePeak:v11 completion:v12];
  }
}

@end