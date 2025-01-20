@interface ABPK2DMLModelConfigSelector
+ (CGSize)inputDimensionsForModelWithABPKNetworkConfig:(id)a3;
+ (CGSize)inputDimensionsForModelWithNetworkConfig:(id)a3;
+ (id)getModelWithNetworkConfig:(id)a3;
@end

@implementation ABPK2DMLModelConfigSelector

+ (id)getModelWithNetworkConfig:(id)a3
{
  id v3 = a3;
  if ([v3 algMode] == 4 || objc_msgSend(v3, "algMode") == 1)
  {
    if ([v3 deviceANEVersionPriorOrEqualToH12])
    {
      v4 = ABPKMLModelConfiguration2DStandard;
LABEL_10:
      id v5 = objc_alloc_init(v4);
      goto LABEL_11;
    }
LABEL_8:
    v4 = ABPKMLModelConfiguration2DStandardFull;
    goto LABEL_10;
  }
  if ([v3 algMode] == 2 || !objc_msgSend(v3, "algMode"))
  {
    v4 = ABPKMLModelConfiguration2DBreakthrough;
    goto LABEL_10;
  }
  if ([v3 algMode] == 10) {
    goto LABEL_8;
  }
  v7 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21B7C6000, v7, OS_LOG_TYPE_ERROR, " Invalid algorithm mode specified ", v8, 2u);
  }

  id v5 = 0;
LABEL_11:

  return v5;
}

+ (CGSize)inputDimensionsForModelWithNetworkConfig:(id)a3
{
  id v3 = a3;
  v4 = +[ABPK2DMLModelConfigSelector getModelWithNetworkConfig:v3];
  uint64_t v5 = [v3 abpkDeviceOrientation];

  [v4 inputDimensionsForABPKDeviceOrientation:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (CGSize)inputDimensionsForModelWithABPKNetworkConfig:(id)a3
{
  id v3 = a3;
  v4 = +[ABPK2DMLModelConfigSelector getModelWithNetworkConfig:v3];
  uint64_t v5 = [v3 abpkDeviceOrientation];

  [v4 inputDimensionsForABPKDeviceOrientation:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

@end