@interface CFXCameraStreamAdapter
+ (void)notifyExternalImageData:(id)a3 orientation:(int64_t)a4 effectComposition:(id)a5;
@end

@implementation CFXCameraStreamAdapter

+ (void)notifyExternalImageData:(id)a3 orientation:(int64_t)a4 effectComposition:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x263EF8F50] isSupported]
    && ([MEMORY[0x263F1C5C0] currentDevice],
        v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = objc_msgSend(v9, "jfx_hasTrueDepthFrontCamera"),
        v9,
        v10))
  {
    v11 = objc_opt_new();
    [v7 cameraIntrinsics];
    objc_msgSend(v11, "setCameraIntrinsics:");
    objc_msgSend(v11, "setCameraPosition:", objc_msgSend(v7, "cameraPosition"));
    v12 = [v7 faceData];
    v13 = [v12 detectedFaces];
    objc_msgSend(v11, "setHasValidFaceData:", objc_msgSend(v13, "count") != 0);

    [v11 setOrientation:a4];
    objc_msgSend(v11, "setPixelBuffer:", objc_msgSend(v7, "pixelBuffer"));
    [v7 timestamp];
    objc_msgSend(v11, "setTimestamp:");
    objc_msgSend(v11, "setRequiresFaceTracking:", objc_msgSend(v8, "requiresFaceTracking"));
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __80__CFXCameraStreamAdapter_notifyExternalImageData_orientation_effectComposition___block_invoke;
    v39[3] = &unk_264C09FA8;
    id v40 = v7;
    v14 = (void *)MEMORY[0x237DD15A0](v39);
    v15 = +[JFXVideoCameraController sharedInstance];
    [v15 notifyExternalARKitFaceTrackedImageData:v11 completion:v14];

    v16 = v40;
  }
  else
  {
    v11 = objc_opt_new();
    objc_msgSend(v11, "setPixelBuffer:", objc_msgSend(v7, "pixelBuffer"));
    [v7 timestamp];
    objc_msgSend(v11, "setTimestamp:");
    objc_msgSend(v11, "setCaptureFramesPerSecond:", objc_msgSend(v7, "captureFramesPerSecond"));
    [v7 cameraIntrinsics];
    objc_msgSend(v11, "setCameraIntrinsics:");
    objc_msgSend(v11, "setCameraPosition:", objc_msgSend(v7, "cameraPosition"));
    v17 = [v7 faceData];
    v18 = [v17 detectedFaces];
    objc_msgSend(v11, "setHasValidFaceData:", objc_msgSend(v18, "count") != 0);

    objc_msgSend(v11, "setRequiresFaceTracking:", objc_msgSend(v8, "requiresFaceTracking"));
    [v11 setOrientation:a4];
    v19 = [v7 faceData];
    v20 = [v19 detectedFaces];
    if ([v20 count])
    {
      v21 = +[JFXVideoCameraController sharedInstance];
      int v22 = [v21 faceTrackingEnabled];

      int v23 = v22 ^ 1;
    }
    else
    {
      int v23 = 1;
    }

    v24 = +[JFXVideoCameraController sharedInstance];
    if ([v24 sessionRequiresFaceTracking]) {
      int v25 = 0;
    }
    else {
      int v25 = [v8 requiresFaceTracking] ^ 1;
    }

    if (((v23 | v25) & 1) == 0)
    {
      v26 = [v7 faceData];
      v27 = [v26 detectedFaces];

      v28 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v27, "count"));
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __80__CFXCameraStreamAdapter_notifyExternalImageData_orientation_effectComposition___block_invoke_2;
      v37[3] = &unk_264C0AAA8;
      id v29 = v28;
      id v38 = v29;
      [v27 enumerateObjectsUsingBlock:v37];
      v30 = +[JFXVideoCameraController sharedInstance];
      v31 = [v30 updateCurrentlyTrackedFaceID:v29];

      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __80__CFXCameraStreamAdapter_notifyExternalImageData_orientation_effectComposition___block_invoke_3;
      v35[3] = &unk_264C0AAD0;
      id v32 = v31;
      id v36 = v32;
      uint64_t v33 = [v27 indexOfObjectPassingTest:v35];
      if (v33 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v34 = [v27 objectAtIndexedSubscript:v33];
        [v34 boundingBox];
        objc_msgSend(v11, "setNormalizedFaceRect:");
        [v34 rollAngleInDegrees];
        objc_msgSend(v11, "setRollAngle:");
      }
    }
    v16 = +[JFXVideoCameraController sharedInstance];
    [v16 notifyExternalImageData:v11 completion:0];
  }
}

void __80__CFXCameraStreamAdapter_notifyExternalImageData_orientation_effectComposition___block_invoke(uint64_t a1)
{
  id v3 = +[JFXVideoCameraController sharedInstance];
  v2 = [v3 arCameraSessionController];
  [v2 processExternalSensorData:*(void *)(a1 + 32)];
}

void __80__CFXCameraStreamAdapter_notifyExternalImageData_orientation_effectComposition___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a2, "ID"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

BOOL __80__CFXCameraStreamAdapter_notifyExternalImageData_orientation_effectComposition___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 ID];
  return v3 == [*(id *)(a1 + 32) longLongValue];
}

@end