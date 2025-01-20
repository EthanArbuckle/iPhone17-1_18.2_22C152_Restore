@interface AFUISiriViewBuilder
+ (BOOL)_carDNDActiveOrEyesFreeAndShouldHaveFullScreenPresentation:(int64_t)a3;
+ (id)buildSiriViewForFrame:(CGRect)a3 configuration:(id)a4 dataSource:(id)a5 delegate:(id)a6 siriContentDelegate:(id)a7 edgeLightViewProvider:(id)a8 instrumentationHandler:(id)a9;
@end

@implementation AFUISiriViewBuilder

+ (id)buildSiriViewForFrame:(CGRect)a3 configuration:(id)a4 dataSource:(id)a5 delegate:(id)a6 siriContentDelegate:(id)a7 edgeLightViewProvider:(id)a8 instrumentationHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  if ([v19 siriViewMode] == 5)
  {
    v25 = -[AFUISiriCarPlayView initWithFrame:viewDelegate:instrumentationHandler:]([AFUISiriCarPlayView alloc], "initWithFrame:viewDelegate:instrumentationHandler:", v21, v24, x, y, width, height);
  }
  else
  {
    if (![v19 allowResizingBetweenModes])
    {
      v31 = -[AFUISiriView initWithFrame:configuration:]([AFUISiriView alloc], "initWithFrame:configuration:", v19, x, y, width, height);
      [(AFUISiriView *)v31 setDelegate:v21];
      [(AFUISiriView *)v31 setDataSource:v20];
      goto LABEL_13;
    }
    if ([v19 siriViewMode] == 4 || objc_msgSend(v19, "siriViewMode") == 8)
    {
      int v26 = objc_msgSend(a1, "_carDNDActiveOrEyesFreeAndShouldHaveFullScreenPresentation:", objc_msgSend(v19, "siriViewMode"));
      v27 = [AFUISiriCompactView alloc];
      uint64_t v28 = [v19 showsSensitiveUI];
      if (v26)
      {
        id v29 = v23;
        uint64_t v30 = 1;
      }
      else
      {
        uint64_t v30 = 0;
        id v29 = v23;
      }
      v25 = -[AFUISiriCompactView initWithFrame:eyesFreeMode:edgeLightViewProvider:showsSensitiveUI:](v27, "initWithFrame:eyesFreeMode:edgeLightViewProvider:showsSensitiveUI:", v30, v29, v28, x, y, width, height);
    }
    else
    {
      v25 = -[AFUISiriCompactView initWithFrame:compactViewDelegate:edgeLightViewProvider:showsSensitiveUI:]([AFUISiriCompactView alloc], "initWithFrame:compactViewDelegate:edgeLightViewProvider:showsSensitiveUI:", v21, v23, [v19 showsSensitiveUI], x, y, width, height);
    }
  }
  v31 = (AFUISiriView *)v25;
LABEL_13:
  if (objc_opt_respondsToSelector()) {
    [(AFUISiriView *)v31 setSiriContentDelegate:v22];
  }

  return v31;
}

+ (BOOL)_carDNDActiveOrEyesFreeAndShouldHaveFullScreenPresentation:(int64_t)a3
{
  v4 = [MEMORY[0x263F6C740] sharedSystemState];
  LOBYTE(a3) = [v4 carDNDActiveOrEyesFreeAndShouldHaveFullScreenPresentation:a3 == 8];

  return a3;
}

@end