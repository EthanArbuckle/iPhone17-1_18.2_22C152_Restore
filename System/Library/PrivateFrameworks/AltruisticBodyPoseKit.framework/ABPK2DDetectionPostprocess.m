@interface ABPK2DDetectionPostprocess
- (ABPK2DDetectionPostprocess)initWithInputJoints:(unint64_t)a3 andOutputJoints:(unint64_t)a4 use3DSkeletonForExtrapolation:(BOOL)a5 shouldPush3DSupportSkeleton:(BOOL)a6 withExtrapolationTime:(double)a7;
- (id)get2DDetectionResultforRotation:(int64_t)a3 croppedRect:(CGRect)a4;
- (id)getAligned3DSkeleton;
- (id)getRaw2DDetectionResultforRotation:(int64_t)a3 croppedRect:(CGRect)a4;
- (int)extract2DSkeletonfromBuffers:(id)a3 withImagePreProcessingParams:(id)a4 atTimestamp:(double)a5 previousSkeleton3D:(id)a6;
- (void)_endExtract2DSkeletonSignpostWithTimestamp:(double)a3;
- (void)_endExtractHumanSignpostWithTimestamp:(double)a3;
- (void)_endExtrapolationSignpostWithTimestamp:(double)a3;
- (void)_endMaxFilterSignpostWithTimestamp:(double)a3;
- (void)_startExtract2DSkeletonSignpostWithTimestamp:(double)a3;
- (void)_startExtractHumanSignpostWithTimestamp:(double)a3;
- (void)_startExtrapolationSignpostWithTimestamp:(double)a3;
- (void)_startMaxFilterSignpostWithTimestamp:(double)a3;
- (void)getRawTrackedHumanForLiftingSkeleton:(id)a3;
- (void)getRawTrackedHumanSkeleton:(id)a3;
- (void)getRawTrackedHumanSkeletonVector:(id)a3;
- (void)getTrackedHumanForLiftingSkeleton:(id)a3;
- (void)getTrackedHumanSkeleton:(id)a3;
@end

@implementation ABPK2DDetectionPostprocess

- (ABPK2DDetectionPostprocess)initWithInputJoints:(unint64_t)a3 andOutputJoints:(unint64_t)a4 use3DSkeletonForExtrapolation:(BOOL)a5 shouldPush3DSupportSkeleton:(BOOL)a6 withExtrapolationTime:(double)a7
{
  v7 = (void *)MEMORY[0x263EFF940];
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", a4, a5, a6, a7, "-[ABPK2DDetectionPostprocess initWithInputJoints:andOutputJoints:use3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:withExtrapolationTime:]");
  id v9 = [v7 exceptionWithName:*MEMORY[0x263EFF4A0] reason:v8 userInfo:0];

  objc_exception_throw(v9);
}

- (int)extract2DSkeletonfromBuffers:(id)a3 withImagePreProcessingParams:(id)a4 atTimestamp:(double)a5 previousSkeleton3D:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  v11 = (void *)MEMORY[0x263EFF940];
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", "-[ABPK2DDetectionPostprocess extract2DSkeletonfromBuffers:withImagePreProcessingParams:atTimestamp:previousSkeleton3D:]");
  id v13 = [v11 exceptionWithName:*MEMORY[0x263EFF4A0] reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)getRawTrackedHumanSkeleton:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x263EFF940];
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", "-[ABPK2DDetectionPostprocess getRawTrackedHumanSkeleton:]");
  id v6 = [v4 exceptionWithName:*MEMORY[0x263EFF4A0] reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)getRawTrackedHumanSkeletonVector:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x263EFF940];
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", "-[ABPK2DDetectionPostprocess getRawTrackedHumanSkeletonVector:]");
  id v6 = [v4 exceptionWithName:*MEMORY[0x263EFF4A0] reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)getTrackedHumanSkeleton:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x263EFF940];
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", "-[ABPK2DDetectionPostprocess getTrackedHumanSkeleton:]");
  id v6 = [v4 exceptionWithName:*MEMORY[0x263EFF4A0] reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)getTrackedHumanForLiftingSkeleton:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x263EFF940];
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", "-[ABPK2DDetectionPostprocess getTrackedHumanForLiftingSkeleton:]");
  id v6 = [v4 exceptionWithName:*MEMORY[0x263EFF4A0] reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)getRawTrackedHumanForLiftingSkeleton:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x263EFF940];
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", "-[ABPK2DDetectionPostprocess getRawTrackedHumanForLiftingSkeleton:]");
  id v6 = [v4 exceptionWithName:*MEMORY[0x263EFF4A0] reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)getAligned3DSkeleton
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF4A0];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", "-[ABPK2DDetectionPostprocess getAligned3DSkeleton]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (id)get2DDetectionResultforRotation:(int64_t)a3 croppedRect:(CGRect)a4
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF4A0];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, "-[ABPK2DDetectionPostprocess get2DDetectionResultforRotation:croppedRect:]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)getRaw2DDetectionResultforRotation:(int64_t)a3 croppedRect:(CGRect)a4
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF4A0];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, "-[ABPK2DDetectionPostprocess getRaw2DDetectionResultforRotation:croppedRect:]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)_startExtract2DSkeletonSignpostWithTimestamp:(double)a3
{
}

- (void)_endExtract2DSkeletonSignpostWithTimestamp:(double)a3
{
}

- (void)_startMaxFilterSignpostWithTimestamp:(double)a3
{
}

- (void)_endMaxFilterSignpostWithTimestamp:(double)a3
{
}

- (void)_startExtractHumanSignpostWithTimestamp:(double)a3
{
}

- (void)_endExtractHumanSignpostWithTimestamp:(double)a3
{
}

- (void)_startExtrapolationSignpostWithTimestamp:(double)a3
{
}

- (void)_endExtrapolationSignpostWithTimestamp:(double)a3
{
}

@end