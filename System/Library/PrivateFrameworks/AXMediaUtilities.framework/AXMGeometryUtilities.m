@interface AXMGeometryUtilities
+ (CGRect)motionCorrectedNormalizedFrame:(CGRect)a3 fromAttitude:(id)a4 fromFieldOfViewX:(float)a5 fromFieldOfViewY:(float)a6 toAttitude:(id)a7 toFieldOfViewX:(float)a8 toFieldOfViewY:(float)a9 interfaceOrientation:(int64_t)a10 mirrored:(BOOL)a11;
@end

@implementation AXMGeometryUtilities

+ (CGRect)motionCorrectedNormalizedFrame:(CGRect)a3 fromAttitude:(id)a4 fromFieldOfViewX:(float)a5 fromFieldOfViewY:(float)a6 toAttitude:(id)a7 toFieldOfViewX:(float)a8 toFieldOfViewY:(float)a9 interfaceOrientation:(int64_t)a10 mirrored:(BOOL)a11
{
  BOOL v11 = a11;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v22 = a4;
  id v23 = a7;
  v24 = v23;
  if (!v22 || !v23 || a5 == 0.0 || a6 == 0.0 || a8 == 0.0 || a9 == 0.0)
  {
    v25 = AXMediaLogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      +[AXMGeometryUtilities motionCorrectedNormalizedFrame:fromAttitude:fromFieldOfViewX:fromFieldOfViewY:toAttitude:toFieldOfViewX:toFieldOfViewY:interfaceOrientation:mirrored:](v25);
    }
  }
  else
  {
    v67.origin.double x = x;
    v67.origin.double y = y;
    v67.size.double width = width;
    v67.size.double height = height;
    double MidX = CGRectGetMidX(v67);
    v68.origin.double x = x;
    v68.origin.double y = y;
    v68.size.double width = width;
    v68.size.double height = height;
    double MidY = CGRectGetMidY(v68);
    v30 = (void *)[v22 copy];
    [v30 multiplyByInverseOfAttitude:v24];
    double v31 = -1.0;
    if (v11) {
      double v31 = 1.0;
    }
    double v66 = v31;
    double v32 = tan(a5 * 0.5 * 0.0174532925);
    double v33 = tan(a6 * 0.5 * 0.0174532925);
    BOOL v34 = a8 == a5;
    double v35 = v32;
    if (!v34)
    {
      double v36 = v33;
      long double v37 = tan(a8 * 0.5 * 0.0174532925);
      double v33 = v36;
      double v32 = v37;
    }
    BOOL v34 = a9 == a6;
    double v38 = v33;
    if (!v34)
    {
      double v39 = v33;
      long double v40 = tan(a9 * 0.5 * 0.0174532925);
      double v33 = v39;
      double v38 = v40;
    }
    double v41 = MidX + -0.5 + MidX + -0.5;
    double v42 = MidY + -0.5 + MidY + -0.5;
    switch(a10)
    {
      case 0:
      case 1:
        double v42 = -v42;
        double v43 = MidX + -0.5 + MidX + -0.5;
        break;
      case 2:
        double v43 = -v41;
        break;
      case 3:
        double v43 = -v42;
        double v42 = -v41;
        break;
      case 4:
        double v43 = MidY + -0.5 + MidY + -0.5;
        double v42 = MidX + -0.5 + MidX + -0.5;
        break;
      default:
        double v43 = 0.0;
        double v42 = 0.0;
        break;
    }
    double v64 = v33 * v42;
    double v65 = v35 * v43;
    [v30 quaternion];
    v48.f64[0] = v46;
    v48.f64[1] = v47;
    v49.f64[0] = v44;
    v49.f64[1] = v45;
    int8x16_t v50 = (int8x16_t)vnegq_f64(v49);
    float64x2_t v51 = vmulq_f64(v48, (float64x2_t)xmmword_1B58ACC20);
    float64x2_t v52 = (float64x2_t)vextq_s8((int8x16_t)v51, (int8x16_t)vnegq_f64(v51), 8uLL);
    float64x2_t v53 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(v49, v64), (float64x2_t)vextq_s8(v50, (int8x16_t)v49, 8uLL), v65), v52, v66);
    float64x2_t v54 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(v51, v64), v52, v65), (float64x2_t)vextq_s8((int8x16_t)v49, v50, 8uLL), v66);
    float64x2_t v55 = vnegq_f64(v54);
    float64x2_t v56 = (float64x2_t)vextq_s8((int8x16_t)v53, (int8x16_t)vnegq_f64(v53), 8uLL);
    double v57 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v53, v47), v56, v46), vmlaq_n_f64(vmulq_n_f64(v55, v45), (float64x2_t)vextq_s8((int8x16_t)v54, (int8x16_t)v55, 8uLL), v44)).f64[0];
    if (v57 == 0.0) {
      float64x2_t v58 = 0uLL;
    }
    else {
      float64x2_t v58 = vmulq_n_f64(vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v54, v47), (float64x2_t)vextq_s8((int8x16_t)v55, (int8x16_t)v54, 8uLL), v46), vmlaq_n_f64(vmulq_n_f64(v53, v45), v56, v44)), v66 / v57);
    }
    double v59 = v58.f64[0] / v32;
    double v60 = v58.f64[1] / v38;
    switch(a10)
    {
      case 0:
      case 1:
        double v60 = -v60;
        double v61 = v59;
        break;
      case 2:
        double v61 = -v59;
        break;
      case 3:
        double v61 = -v60;
        double v60 = -v59;
        break;
      case 4:
        double v61 = v58.f64[1] / v38;
        double v60 = v59;
        break;
      default:
        double v61 = 0.0;
        double v60 = 0.0;
        break;
    }
    double x = v61 * 0.5 + 0.5 - width * 0.5;
    double y = v60 * 0.5 + 0.5 - height * 0.5;
  }
  double v26 = x;
  double v27 = y;
  double v28 = width;
  double v29 = height;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

+ (void)motionCorrectedNormalizedFrame:(os_log_t)log fromAttitude:fromFieldOfViewX:fromFieldOfViewY:toAttitude:toFieldOfViewX:toFieldOfViewY:interfaceOrientation:mirrored:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "AXMGeometryUtilities motionCorrectedNormalizedFrame received invalid input", v1, 2u);
}

@end