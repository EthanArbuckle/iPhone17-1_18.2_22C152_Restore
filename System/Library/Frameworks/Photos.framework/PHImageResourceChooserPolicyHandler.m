@interface PHImageResourceChooserPolicyHandler
+ (BOOL)_passesSquareTableThumbnailTestWithKey:(id)a3 pixelSize:(CGSize)a4 storeClassID:(unsigned __int16)a5 loadingOptions:(unint64_t)a6;
+ (unint64_t)qualifyResourceInfo:(id)a3 againstPolicy:(int64_t)a4 requestInfo:(id)a5 reversed:(BOOL)a6 tooLargeForPolicy:(BOOL *)a7 disqualificationReason:(id *)a8;
@end

@implementation PHImageResourceChooserPolicyHandler

+ (unint64_t)qualifyResourceInfo:(id)a3 againstPolicy:(int64_t)a4 requestInfo:(id)a5 reversed:(BOOL)a6 tooLargeForPolicy:(BOOL *)a7 disqualificationReason:(id *)a8
{
  id v14 = a3;
  id v15 = a5;
  if (v15)
  {
    if (a7) {
      goto LABEL_3;
    }
LABEL_31:
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, a1, @"PHImageResourceChooserPolicyHandler.m", 77, @"Invalid parameter not satisfying: %@", @"tooLargeForPolicy" object file lineNumber description];

    if (a8) {
      goto LABEL_4;
    }
    goto LABEL_32;
  }
  v43 = [MEMORY[0x1E4F28B00] currentHandler];
  [v43 handleFailureInMethod:a2, a1, @"PHImageResourceChooserPolicyHandler.m", 76, @"Invalid parameter not satisfying: %@", @"requestInfo" object file lineNumber description];

  if (!a7) {
    goto LABEL_31;
  }
LABEL_3:
  if (a8) {
    goto LABEL_4;
  }
LABEL_32:
  v45 = [MEMORY[0x1E4F28B00] currentHandler];
  [v45 handleFailureInMethod:a2, a1, @"PHImageResourceChooserPolicyHandler.m", 78, @"Invalid parameter not satisfying: %@", @"outDisqualificationReason" object file lineNumber description];

LABEL_4:
  v16 = [v14 store];
  uint64_t v17 = [(id)objc_opt_class() storeClassID];

  v18 = [v15 allowedResourceVersions];
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v14, "version"));
  int v20 = [v18 containsObject:v19];

  if (!v20)
  {
    v28 = @"version mismatch";
LABEL_22:
    unint64_t v33 = 0;
    *a8 = v28;
    goto LABEL_23;
  }
  v21 = [v14 dataStoreKey];
  [v15 desiredSize];
  double v23 = v22;
  double v25 = v24;
  v26 = [v15 behaviorSpec];
  v27 = objc_msgSend(a1, "_passesSquareTableThumbnailTestWithKey:pixelSize:storeClassID:loadingOptions:", v21, v17, objc_msgSend(v26, "loadingOptions"), v23, v25);

  if (!v27)
  {
    v28 = @"failed square thumb test";
    goto LABEL_22;
  }
  if (a4 == 4)
  {
    if ([v15 isCloudShared]) {
      goto LABEL_19;
    }
  }
  else
  {
    v27 = [v15 behaviorSpec];
    if ([v27 version] != 2 || (objc_msgSend(v15, "isCloudShared") & 1) != 0)
    {

      goto LABEL_19;
    }
  }
  v29 = [v15 asset];
  uint64_t v30 = [v29 mediaType];

  if (a4 != 4) {
  if (v30 != 2 && ([v14 isDerivative] & 1) != 0)
  }
  {
    v28 = @"failed derivative test";
    goto LABEL_22;
  }
LABEL_19:
  v31 = [v15 behaviorSpec];
  int v32 = [v31 useLimitedLibraryMode];

  if (v32 && v17 == 1)
  {
    v28 = @"failed limited library test";
    goto LABEL_22;
  }
  v35 = [v15 behaviorSpec];
  int v36 = [v35 useLowMemoryMode];

  unint64_t v33 = 2;
  if (v36 && v17 != 1)
  {
    v37 = [v15 asset];
    [v14 approximateSizeFromAsset:v37];
    double v39 = v38;
    double v41 = v40;

    int v42 = [v14 isPrimaryFormat];
    v28 = @"failed low-memory mode test";
    if (v42 && v39 <= 5000.0 && v41 <= 5000.0)
    {
      unint64_t v33 = 2;
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_23:

  return v33;
}

+ (BOOL)_passesSquareTableThumbnailTestWithKey:(id)a3 pixelSize:(CGSize)a4 storeClassID:(unsigned __int16)a5 loadingOptions:(unint64_t)a6
{
  int v6 = a5;
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  v10 = v9;
  BOOL v11 = v6 != 1 || width == height && width > 0.0 || ([v9 representsSquareResource] & 1) == 0;

  return v11;
}

@end