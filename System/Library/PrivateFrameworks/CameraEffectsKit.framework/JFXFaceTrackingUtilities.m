@interface JFXFaceTrackingUtilities
+ (BOOL)isFaceAnchorInRange:(id)a3;
+ (CGRect)faceRectInImageWithFaceAnchor:(id)a3 invertY:(BOOL)a4 interfaceOrientation:(int64_t)a5 imageResolution:(CGSize *)a6;
+ (CGSize)faceRectScaleFactorForInterfaceOrientation:(int64_t)a3 andDeviceInterfaceOrientation:(int64_t)a4;
+ (double)pointOnFaceMesh;
+ (double)rollAngleFromFaceAnchor:(id)a3 forInterfaceOrientation:(int64_t)a4;
+ (id)JFX_faceAnchorWithFaceAnchor:(id)a3 forInterfaceOrientation:(int64_t)a4;
+ (uint64_t)JFX_projectionMatrixWithFaceAnchor:(uint64_t)a3 bufferSize:(uint64_t)a4;
+ (void)adjustIntrinsics:(__n128)a3 forRenderSize:(double)a4 capturedSize:(double)a5 interfaceOrientation:(double)a6;
@end

@implementation JFXFaceTrackingUtilities

+ (double)pointOnFaceMesh
{
  return -2.44623217e-22;
}

+ (CGRect)faceRectInImageWithFaceAnchor:(id)a3 invertY:(BOOL)a4 interfaceOrientation:(int64_t)a5 imageResolution:(CGSize *)a6
{
  id v9 = a3;
  v10 = objc_msgSend(a1, "JFX_faceAnchorWithFaceAnchor:forInterfaceOrientation:", v9, a5);
  [v10 imageResolution];
  a6->width = v11;
  a6->height = v12;
  objc_msgSend(a1, "JFX_projectionMatrixWithFaceAnchor:bufferSize:", v10);
  [v9 faceRect];

  [v10 transform];
  [v10 cameraTransform];
  if (pv_projected_screen_aligned_bounding_rect_around_point())
  {
    double v13 = 0.0;
    double v14 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
  }
  else
  {
    double v13 = *MEMORY[0x263F001A8];
    double v14 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v16 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

+ (double)rollAngleFromFaceAnchor:(id)a3 forInterfaceOrientation:(int64_t)a4
{
  v4 = objc_msgSend(a1, "JFX_faceAnchorWithFaceAnchor:forInterfaceOrientation:", a3, a4);
  [v4 rollAngle];
  double v6 = v5;

  return v6;
}

+ (uint64_t)JFX_projectionMatrixWithFaceAnchor:(uint64_t)a3 bufferSize:(uint64_t)a4
{
  objc_msgSend(a5, "focalLengthForViewport:");
  pv_fov_for_focal_length_and_side(v6, a2);
  v7 = JFXLog_DebugFaceAnchor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[JFXFaceTrackingUtilities JFX_projectionMatrixWithFaceAnchor:bufferSize:]();
  }

  return pv_simd_matrix_make_perspective();
}

+ (BOOL)isFaceAnchorInRange:(id)a3
{
  if (!a3) {
    return 0;
  }
  [a3 screenRelativePosition];
  float v4 = v3;
  double v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v5 floatForKey:@"CFX_MaxCameraToFaceTrackingDistance"];
  float v7 = v6;

  float v8 = -0.8;
  if (v7 != 0.0) {
    float v8 = v7;
  }
  return v4 > v8;
}

+ (void)adjustIntrinsics:(__n128)a3 forRenderSize:(double)a4 capturedSize:(double)a5 interfaceOrientation:(double)a6
{
  *(__n128 *)&v25[16] = a2;
  *(__n128 *)&v25[32] = a3;
  *(__n128 *)v25 = a1;
  unint64_t v15 = a10 - 3;
  double v16 = JFXLog_DebugFaceAnchor();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    +[JFXFaceTrackingUtilities adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:].cold.5(a10, v16);
  }

  if (v15 >= 0xFFFFFFFFFFFFFFFELL) {
    double v17 = a4;
  }
  else {
    double v17 = a5;
  }
  if (v15 >= 0xFFFFFFFFFFFFFFFELL) {
    double v18 = a5;
  }
  else {
    double v18 = a4;
  }
  double v19 = a6 / a7 - v18 / v17;
  double v20 = JFXLog_DebugFaceAnchor();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    +[JFXFaceTrackingUtilities adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:].cold.4(v19 > 0.01, v20, a6 / a7 - v18 / v17);
  }

  if (v19 <= 0.01) {
    double v21 = v18 / a6;
  }
  else {
    double v21 = v17 / a7;
  }
  v22 = JFXLog_DebugFaceAnchor();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  if (v15 <= 0xFFFFFFFFFFFFFFFDLL && v21 == 1.0)
  {
    if (v23) {
      +[JFXFaceTrackingUtilities adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:](v22);
    }
  }
  else
  {
    if (v23) {
      +[JFXFaceTrackingUtilities adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:]();
    }

    v24 = JFXLog_DebugFaceAnchor();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      +[JFXFaceTrackingUtilities adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:]();
    }

    pv_focal_length_from_intrinsics(*(simd_float3x3 *)v25);
    pv_principal_point_from_intrinsics(*(simd_float3x3 *)v25);
    pv_intrinsics_from_focal_length_and_principal_point();
  }
}

+ (CGSize)faceRectScaleFactorForInterfaceOrientation:(int64_t)a3 andDeviceInterfaceOrientation:(int64_t)a4
{
  int v4 = ((unint64_t)(a3 - 1) < 2) ^ ((unint64_t)(a4 - 1) < 2);
  double v5 = 1.0;
  if (v4) {
    double v6 = 1.25;
  }
  else {
    double v6 = 1.0;
  }
  if (!v4) {
    double v5 = 1.25;
  }
  result.height = v5;
  result.width = v6;
  return result;
}

+ (id)JFX_faceAnchorWithFaceAnchor:(id)a3 forInterfaceOrientation:(int64_t)a4
{
  id v5 = a3;
  int64_t v6 = [v5 captureInterfaceOrientation];
  if (v6) {
    a4 = v6;
  }
  if ([v5 preferredAnchorOrientation] == a4
    || ((unint64_t)(a4 - 1) > 3 ? (uint64_t v7 = 0) : (uint64_t v7 = qword_234D61278[a4 - 1]),
        (int v8 = +[JFXRotationTransforms rotationFromCaptureDevicePosition:2 captureVideoOrientation:4 toInterfaceOrientation:v7]) == 0))
  {
    id v10 = v5;
  }
  else
  {
    int v9 = v8;
    id v10 = (id)[v5 copy];
    [v10 transform];
    pv_simd_matrix_rotate();
    objc_msgSend(v10, "setTransform:");
    if ((v9 & 0xFFFFFFFD) == 1)
    {
      [v10 imageResolution];
      objc_msgSend(v10, "setImageResolution:", CGSizeRotate90(v11, v12));
    }
  }

  return v10;
}

+ (void)JFX_projectionMatrixWithFaceAnchor:bufferSize:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_234C41000, v0, v1, "focalLength = (%f), fovy = (%f)", v2, v3, v4, v5, v6);
}

+ (void)adjustIntrinsics:(os_log_t)log forRenderSize:capturedSize:interfaceOrientation:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "adjustIntrinsics - same orientation and size, bailing.", v1, 2u);
}

+ (void)adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_234C41000, v0, v1, "adjustIntrinsics - renderSize - width: %f, height: %f", v2, v3, v4, v5, v6);
}

+ (void)adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:.cold.3()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_234C41000, v0, v1, "adjustIntrinsics - capturedSize - width: %f, height: %f", v2, v3, v4, v5, v6);
}

+ (void)adjustIntrinsics:(double)a3 forRenderSize:capturedSize:interfaceOrientation:.cold.4(char a1, NSObject *a2, double a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = @"NO";
  if (a3 >= -0.01) {
    uint64_t v4 = @"NO";
  }
  else {
    uint64_t v4 = @"YES";
  }
  if (a1) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  if (a1) {
    uint64_t v4 = @"NO";
  }
  int v6 = 138412802;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  int v9 = v4;
  if (!(a1 & 1 | (a3 < -0.01))) {
    uint64_t v3 = @"YES";
  }
  __int16 v10 = 2112;
  double v11 = v3;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "adjustIntrinsics - cropWidth: %@, cropHeight: %@, nocrop: %@", (uint8_t *)&v6, 0x20u);
}

+ (void)adjustIntrinsics:(uint64_t)a1 forRenderSize:(NSObject *)a2 capturedSize:interfaceOrientation:.cold.5(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "adjustIntrinsics - interface orientation: %ld", (uint8_t *)&v2, 0xCu);
}

@end