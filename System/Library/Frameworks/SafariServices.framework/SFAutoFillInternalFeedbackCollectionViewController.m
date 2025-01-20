@interface SFAutoFillInternalFeedbackCollectionViewController
@end

@implementation SFAutoFillInternalFeedbackCollectionViewController

id __82___SFAutoFillInternalFeedbackCollectionViewController__createCollectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  v7 = v6;
  if (a2 == 3)
  {
    [v6 setHeaderMode:1];
    [v7 setFooterMode:1];
  }
  else if (!a2)
  {
    [v6 setHeaderMode:1];
  }
  v8 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v7 layoutEnvironment:v5];
  [v8 contentInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if (a2 == 1)
  {
    v17 = [*(id *)(*(void *)(a1 + 32) + 1016) detailTypesForSelectedFeedbackCategory];
    uint64_t v18 = [v17 count];

    if (!v18)
    {
      double v14 = 0.0;
      double v10 = 0.0;
    }
  }
  objc_msgSend(v8, "setContentInsets:", v10, v12, v14, v16);

  return v8;
}

@end