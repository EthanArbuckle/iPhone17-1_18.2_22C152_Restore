@interface PHImageResourceChooserFastPolicyHandler
+ (unint64_t)qualifyResourceInfo:(id)a3 againstPolicy:(int64_t)a4 requestInfo:(id)a5 reversed:(BOOL)a6 tooLargeForPolicy:(BOOL *)a7 disqualificationReason:(id *)a8;
@end

@implementation PHImageResourceChooserFastPolicyHandler

+ (unint64_t)qualifyResourceInfo:(id)a3 againstPolicy:(int64_t)a4 requestInfo:(id)a5 reversed:(BOOL)a6 tooLargeForPolicy:(BOOL *)a7 disqualificationReason:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a5;
  v34.receiver = a1;
  v34.super_class = (Class)&OBJC_METACLASS___PHImageResourceChooserFastPolicyHandler;
  id v16 = objc_msgSendSuper2(&v34, sel_qualifyResourceInfo_againstPolicy_requestInfo_reversed_tooLargeForPolicy_disqualificationReason_, v14, a4, v15, v10, a7, a8);
  v17 = [v14 store];
  int v18 = [(id)objc_opt_class() storeClassID];

  if (v16)
  {
    if (v18 == 1
      || !a4
      && ([v15 behaviorSpec],
          v20 = objc_claimAutoreleasedReturnValue(),
          char v21 = [v20 isNetworkAccessAllowed],
          v20,
          (v21 & 1) != 0))
    {
      int v19 = 1;
    }
    else
    {
      int v19 = 0;
      *a8 = @"not fast";
      *a7 = 1;
    }
  }
  else
  {
    int v19 = 0;
  }
  v22 = [v15 asset];
  [v14 approximateSizeFromAsset:v22];
  double v24 = v23;
  double v26 = v25;

  if (!v19)
  {
    unint64_t v32 = 0;
    goto LABEL_17;
  }
  v27 = [v15 behaviorSpec];
  [v27 minimumTableThumbnailLongSide];
  if (v28 <= 0.0)
  {

LABEL_16:
    unint64_t v32 = 2;
    goto LABEL_17;
  }
  if (v24 >= v26) {
    double v26 = v24;
  }
  v29 = [v15 behaviorSpec];
  [v29 minimumTableThumbnailLongSide];
  double v31 = v30;

  if (v26 >= v31) {
    goto LABEL_16;
  }
  unint64_t v32 = 0;
  *a8 = @"failed minimumTableThumbnailLongSide test";
LABEL_17:

  return v32;
}

@end