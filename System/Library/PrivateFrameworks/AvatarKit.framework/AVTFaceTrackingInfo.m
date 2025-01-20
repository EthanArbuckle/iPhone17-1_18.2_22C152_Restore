@interface AVTFaceTrackingInfo
+ (id)dataWithARFrame:(id)a3 captureOrientation:(int64_t)a4 interfaceOrientation:(int64_t)a5;
+ (id)trackingInfoWithARFrame:(id)a3 inputOrientation:(int64_t)a4 outputOrientation:(int64_t)a5;
+ (id)trackingInfoWithARFrame:(id)a3 inputOrientation:(int64_t)a4 outputOrientation:(int64_t)a5 constrainHeadPose:(BOOL)a6;
+ (id)trackingInfoWithARFrame:(id)a3 worldAlignment:(int64_t)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6;
+ (id)trackingInfoWithARFrame:(id)a3 worldAlignment:(int64_t)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6 constrainHeadPose:(BOOL)a7;
+ (id)trackingInfoWithTrackingData:(id *)a3;
- (BOOL)hasFaceTrackingData;
- (__n128)rawTransform;
- (const)trackingData;
- (double)timestamp;
@end

@implementation AVTFaceTrackingInfo

- (const)trackingData
{
  return (const $E6535DB85E8BC2AEB7FF0DAA3D45D990 *)&self->_trackingData;
}

- (double)timestamp
{
  return self->_trackingData.timestamp;
}

- (__n128)rawTransform
{
  return a1[31];
}

- (BOOL)hasFaceTrackingData
{
  return 1;
}

+ (id)trackingInfoWithARFrame:(id)a3 inputOrientation:(int64_t)a4 outputOrientation:(int64_t)a5
{
  return (id)[a1 trackingInfoWithARFrame:a3 inputOrientation:a4 outputOrientation:a5 constrainHeadPose:0];
}

+ (id)trackingInfoWithARFrame:(id)a3 inputOrientation:(int64_t)a4 outputOrientation:(int64_t)a5 constrainHeadPose:(BOOL)a6
{
  int64_t v6 = 4;
  if (a4 != 3) {
    int64_t v6 = a4;
  }
  if (a4 == 4) {
    int64_t v6 = 3;
  }
  return (id)[a1 trackingInfoWithARFrame:a3 worldAlignment:2 captureOrientation:AVTVideoCaptureOrientationFromInterfaceOrientation_orientations[v6] interfaceOrientation:a5 constrainHeadPose:a6];
}

+ (id)trackingInfoWithARFrame:(id)a3 worldAlignment:(int64_t)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6
{
  return (id)[a1 trackingInfoWithARFrame:a3 worldAlignment:a4 captureOrientation:a5 interfaceOrientation:a6 constrainHeadPose:0];
}

+ (id)trackingInfoWithARFrame:(id)a3 worldAlignment:(int64_t)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6 constrainHeadPose:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v11 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v12 = [v11 anchors];
  v13 = (AVTFaceTrackingInfo *)[v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    int v19 = v7;
    uint64_t v14 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v13; i = (AVTFaceTrackingInfo *)((char *)i + 1))
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v16;
          if ([v17 isTracked])
          {
            v13 = objc_alloc_init(AVTFaceTrackingInfo);
            AVTTrackingDataFromARFrame((uint64_t)&v13->_trackingData, v11, a4, v17, a5, a6, v19, 0, 0);

            goto LABEL_13;
          }
        }
      }
      v13 = (AVTFaceTrackingInfo *)[v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v13;
}

+ (id)dataWithARFrame:(id)a3 captureOrientation:(int64_t)a4 interfaceOrientation:(int64_t)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = [v7 anchors];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          if ([v14 isTracked])
          {
            memset(v17, 0, sizeof(v17));
            AVTTrackingDataFromARFrame((uint64_t)v17, v7, [v7 worldAlignment], v14, a4, a5, 1, 0, 0);
            v15 = [MEMORY[0x263EFF8F8] dataWithBytes:v17 length:480];

            goto LABEL_13;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  v15 = 0;
LABEL_13:

  return v15;
}

+ (id)trackingInfoWithTrackingData:(id *)a3
{
  v4 = objc_alloc_init(AVTFaceTrackingInfo);
  memcpy(&v4->_trackingData, a3, 0x1E0uLL);
  return v4;
}

@end