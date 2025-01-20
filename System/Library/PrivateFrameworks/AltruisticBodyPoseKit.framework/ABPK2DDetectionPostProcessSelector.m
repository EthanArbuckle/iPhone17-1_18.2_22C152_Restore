@interface ABPK2DDetectionPostProcessSelector
+ (id)get2DDetectionPostProcessWithNetworkConfig:(id)a3 use3DSkeletonForExtrapolation:(BOOL)a4 shouldPush3DSupportSkeleton:(BOOL)a5;
+ (id)get2DDetectionPostProcessWithNetworkConfig:(id)a3 use3DSkeletonForExtrapolation:(BOOL)a4 shouldPush3DSupportSkeleton:(BOOL)a5 withExtrapolationTime:(double)a6;
@end

@implementation ABPK2DDetectionPostProcessSelector

+ (id)get2DDetectionPostProcessWithNetworkConfig:(id)a3 use3DSkeletonForExtrapolation:(BOOL)a4 shouldPush3DSupportSkeleton:(BOOL)a5
{
  v5 = [a1 get2DDetectionPostProcessWithNetworkConfig:a3 use3DSkeletonForExtrapolation:a4 shouldPush3DSupportSkeleton:a5 withExtrapolationTime:0.3];
  return v5;
}

+ (id)get2DDetectionPostProcessWithNetworkConfig:(id)a3 use3DSkeletonForExtrapolation:(BOOL)a4 shouldPush3DSupportSkeleton:(BOOL)a5 withExtrapolationTime:(double)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  if ([v9 algMode] == 4)
  {
    v10 = [ABPK2DDetectionPostprocessHeatmap alloc];
    uint64_t v11 = 17;
LABEL_13:
    v14 = [(ABPK2DDetectionPostprocessHeatmap *)v10 initWithInputJoints:19 andOutputJoints:v11 use3DSkeletonForExtrapolation:v8 shouldPush3DSupportSkeleton:v7 withExtrapolationTime:a6];
    goto LABEL_14;
  }
  if ([v9 algMode] == 1) {
    goto LABEL_4;
  }
  if ([v9 algMode] == 2 || !objc_msgSend(v9, "algMode"))
  {
    v12 = off_2643B6B40;
    goto LABEL_12;
  }
  if ([v9 algMode] == 10)
  {
LABEL_4:
    v12 = off_2643B6B38;
LABEL_12:
    v10 = (ABPK2DDetectionPostprocessHeatmap *)objc_alloc(*v12);
    uint64_t v11 = 19;
    goto LABEL_13;
  }
  v13 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_ERROR, " Invalid algorithm mode specified ", v16, 2u);
  }

  v14 = 0;
LABEL_14:

  return v14;
}

@end