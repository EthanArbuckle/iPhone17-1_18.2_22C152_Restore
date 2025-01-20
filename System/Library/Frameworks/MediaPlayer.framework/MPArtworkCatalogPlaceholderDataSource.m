@interface MPArtworkCatalogPlaceholderDataSource
@end

@implementation MPArtworkCatalogPlaceholderDataSource

void __96___MPArtworkCatalogPlaceholderDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 format];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
  [v12 setFill];

  v28.origin.x = v5;
  v28.origin.y = v7;
  v28.size.width = v9;
  v28.size.height = v11;
  UIRectFill(v28);
  id v26 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_453];
  if (v9 >= v11) {
    double v13 = v9;
  }
  else {
    double v13 = v11;
  }
  if (v9 >= v11) {
    double v14 = v11;
  }
  else {
    double v14 = v9;
  }
  double v15 = v13 * 0.46;
  if (v14 < v15) {
    double v15 = v14;
  }
  v16 = [MEMORY[0x1E4FB1830] configurationWithPointSize:3 weight:-1 scale:v15];
  v17 = (void *)MEMORY[0x1E4FB1818];
  v18 = [*(id *)(a1 + 32) token];
  v19 = [v17 _systemImageNamed:v18];

  v20 = [v19 imageWithConfiguration:v16];

  v21 = [v20 imageByApplyingSymbolConfiguration:v16];

  v22 = [v21 imageWithTintColor:v26];

  [v22 size];
  double v24 = v23 * -0.5 + v9 * 0.5;
  [v22 size];
  objc_msgSend(v22, "drawAtPoint:", v24, v25 * -0.5 + v11 * 0.5);
}

id __96___MPArtworkCatalogPlaceholderDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 userInterfaceStyle];
  if ((unint64_t)v2 >= 2)
  {
    if (v2 != (void *)2) {
      goto LABEL_6;
    }
    v3 = (void *)MEMORY[0x1E4FB1618];
    double v4 = 0.270588235;
    double v7 = 0.278431373;
    double v5 = 1.0;
    double v6 = 0.270588235;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4FB1618];
    double v4 = 0.858823529;
    double v5 = 1.0;
    double v6 = 0.858823529;
    double v7 = 0.858823529;
  }
  v2 = [v3 colorWithRed:v4 green:v6 blue:v7 alpha:v5];
LABEL_6:

  return v2;
}

uint64_t __58___MPArtworkCatalogPlaceholderDataSource_sharedDataSource__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedDataSource___dataSource;
  sharedDataSource___dataSource = (uint64_t)v1;

  id v3 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  double v4 = *(void **)(sharedDataSource___dataSource + 8);
  *(void *)(sharedDataSource___dataSource + 8) = v3;

  double v5 = *(void **)(sharedDataSource___dataSource + 8);

  return [v5 setCountLimit:4];
}

@end