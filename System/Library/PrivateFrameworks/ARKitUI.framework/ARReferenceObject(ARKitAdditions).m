@interface ARReferenceObject(ARKitAdditions)
+ (void)initialize;
- (id)_writeToArchiveWithPreviewImage:()ARKitAdditions error:;
@end

@implementation ARReferenceObject(ARKitAdditions)

+ (void)initialize
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ARReferenceObject_ARKitAdditions__initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, block);
  }
}

- (id)_writeToArchiveWithPreviewImage:()ARKitAdditions error:
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v6 = a3;
  v7 = objc_opt_new();
  v8 = (void *)MEMORY[0x263F20F50];
  v9 = [a1 trackingData];
  [v8 boundsForTrackingData:v9];

  [a1 referenceOriginTransform];
  float32x4_t v33 = v11;
  float32x4_t v34 = v10;
  float32x4_t v31 = v13;
  float32x4_t v32 = v12;
  ARMatrix4x4FromRotationAndTranslation();
  uint64_t v14 = 0;
  v35[0] = v15;
  v35[1] = v16;
  v35[2] = v17;
  v35[3] = v18;
  memset(buf, 0, sizeof(buf));
  long long v37 = 0u;
  long long v38 = 0u;
  do
  {
    *(float32x4_t *)&buf[v14 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v34, COERCE_FLOAT(v35[v14])), v33, *(float32x2_t *)&v35[v14], 1), v32, (float32x4_t)v35[v14], 2), v31, (float32x4_t)v35[v14], 3);
    ++v14;
  }
  while (v14 != 4);
  if (v6)
  {
    v19 = UIImageJPEGRepresentation(v6, 0.8);
  }
  else
  {
    v19 = 0;
  }
  v20 = objc_opt_new();
  v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "version"));
  [v20 setObject:v21 forKeyedSubscript:@"Version"];

  [v20 setObject:@"trackingData.cv3dmap" forKeyedSubscript:@"TrackingDataReference"];
  v22 = ARMatrix4x4Dictionary();
  [v20 setObject:v22 forKeyedSubscript:@"ReferenceOrigin"];

  if ([v19 length]) {
    [v20 setObject:@"preview.jpg" forKeyedSubscript:@"ImageReference"];
  }
  v23 = objc_msgSend(MEMORY[0x263F08AC0], "dataWithPropertyList:format:options:error:", v20, 100, 0, a4, *(_OWORD *)&v31);
  if (v23)
  {
    [v7 addData:v23 withPath:@"Info.plist"];
    v24 = [a1 trackingData];
    [v7 addData:v24 withPath:@"trackingData.cv3dmap"];

    if ([v19 length]) {
      [v7 addData:v19 withPath:@"preview.jpg"];
    }
    id v25 = v7;
  }
  else
  {
    if (_ARLogGeneral_onceToken_4 != -1) {
      dispatch_once(&_ARLogGeneral_onceToken_4, &__block_literal_global_15);
    }
    v26 = (void *)_ARLogGeneral_logObj_4;
    if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_4, OS_LOG_TYPE_ERROR))
    {
      v27 = v26;
      v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a1;
      _os_log_impl(&dword_20B202000, v27, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to serialize object metadata.", buf, 0x16u);
    }
    id v25 = 0;
  }

  return v25;
}

@end