@interface ABPKGestureDetectionResult
- (ABPK2dSkeleton)skeleton2D;
- (ABPKGestureDetectionResult)init;
- (BOOL)isPoseValid;
- (NSArray)gestureTypes;
- (int)overlayResultOnImage:(__CVBuffer *)a3 withResult:(__CVBuffer *)a4 withColor:;
- (unsigned)trackingId;
- (void)set2dSkeleton:(id)a3 isPoseValid:(BOOL)a4 trackingId:(unsigned int)a5 gestureTypes:(id)a6;
@end

@implementation ABPKGestureDetectionResult

- (ABPKGestureDetectionResult)init
{
  v5.receiver = self;
  v5.super_class = (Class)ABPKGestureDetectionResult;
  v2 = [(ABPKGestureDetectionResult *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(ABPK2dSkeleton);
    [(ABPKGestureDetectionResult *)v2 set2dSkeleton:v3 isPoseValid:0 trackingId:0 gestureTypes:MEMORY[0x263EFFA68]];
  }
  return v2;
}

- (void)set2dSkeleton:(id)a3 isPoseValid:(BOOL)a4 trackingId:(unsigned int)a5 gestureTypes:(id)a6
{
  v10 = (ABPK2dSkeleton *)a3;
  v11 = (NSArray *)a6;
  skeleton2D = self->_skeleton2D;
  self->_skeleton2D = v10;
  v14 = v10;

  self->_isPoseValid = a4;
  self->_trackingId = a5;
  gestureTypes = self->_gestureTypes;
  self->_gestureTypes = v11;
}

- (int)overlayResultOnImage:(__CVBuffer *)a3 withResult:(__CVBuffer *)a4 withColor:
{
  double v13 = v4;
  v8 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v8, OS_LOG_TYPE_DEBUG, " Overlaying Gesture-Detection results on image ", buf, 2u);
  }

  if (!a4)
  {
    v9 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_21B7C6000, v9, OS_LOG_TYPE_ERROR, " Overlay image not initialized ", v15, 2u);
    }
  }
  skeleton2D = self->_skeleton2D;
  if (skeleton2D)
  {
    [(ABPK2dSkeleton *)skeleton2D printData];
    return [(ABPK2dSkeleton *)self->_skeleton2D overlaySkeletonOnImage:a3 withResult:a4 withColor:v13];
  }
  else
  {
    v12 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_21B7C6000, v12, OS_LOG_TYPE_ERROR, " _skeleton2D is nil ", v14, 2u);
    }

    return -6661;
  }
}

- (ABPK2dSkeleton)skeleton2D
{
  return self->_skeleton2D;
}

- (BOOL)isPoseValid
{
  return self->_isPoseValid;
}

- (unsigned)trackingId
{
  return self->_trackingId;
}

- (NSArray)gestureTypes
{
  return self->_gestureTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureTypes, 0);
  objc_storeStrong((id *)&self->_skeleton2D, 0);
}

@end