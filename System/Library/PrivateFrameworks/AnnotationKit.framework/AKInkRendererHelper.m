@interface AKInkRendererHelper
+ (double)_calculateMaxRenderingSize;
+ (double)maxRenderingSize;
+ (id)_createFullSizeRenderer;
+ (id)_sharedOfflineInkRendererSmallSize;
+ (id)renderDrawing:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5;
+ (void)purgeSharedRenderer;
@end

@implementation AKInkRendererHelper

+ (id)renderDrawing:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_2376668F8;
  v32 = sub_237666908;
  id v33 = 0;
  v12 = (void *)MEMORY[0x237E1DFC0]();
  v13 = qword_2689251A8;
  if (!qword_2689251A8)
  {
    dispatch_group_t v14 = dispatch_group_create();
    v15 = (void *)qword_2689251A8;
    qword_2689251A8 = (uint64_t)v14;

    v13 = qword_2689251A8;
  }
  dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_enter((dispatch_group_t)qword_2689251A8);
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_2376668F8;
  v26 = sub_237666908;
  dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
  v35.origin.double x = x;
  v35.origin.double y = y;
  v35.size.double width = width;
  v35.size.double height = height;
  double v16 = CGRectGetWidth(v35);
  v36.origin.double x = x;
  v36.origin.double y = y;
  v36.size.double width = width;
  v36.size.double height = height;
  double v17 = CGRectGetHeight(v36);
  if (v16 >= v17) {
    double v17 = v16;
  }
  if ((ceil(v17) + 2.0) * a5 >= 128.0) {
    [a1 _createFullSizeRenderer];
  }
  else {
  v18 = +[AKInkRendererHelper _sharedOfflineInkRendererSmallSize];
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_237666910;
  v21[3] = &unk_264CDB520;
  v21[4] = &v28;
  v21[5] = &v22;
  objc_msgSend(v18, "renderDrawing:clippedToStrokeSpaceRect:scale:completion:", v11, v21, x, y, width, height, a5);
  dispatch_semaphore_wait((dispatch_semaphore_t)v23[5], 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(&v22, 8);
  id v19 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v19;
}

+ (void)purgeSharedRenderer
{
  if (qword_2689251A8) {
    dispatch_group_notify((dispatch_group_t)qword_2689251A8, MEMORY[0x263EF83A0], &unk_26EA575B8);
  }
}

+ (double)maxRenderingSize
{
  double result = *(double *)&qword_2689251B0;
  if (*(double *)&qword_2689251B0 == 0.0)
  {
    objc_msgSend(a1, "_calculateMaxRenderingSize", *(double *)&qword_2689251B0);
    qword_2689251B0 = *(void *)&result;
  }
  return result;
}

+ (id)_sharedOfflineInkRendererSmallSize
{
  v2 = (void *)qword_2689251A0;
  if (!qword_2689251A0)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263F14B40]), "initWithSize:scale:", 128.0, 128.0, 1.0);
    v4 = (void *)qword_2689251A0;
    qword_2689251A0 = v3;

    v2 = (void *)qword_2689251A0;
  }

  return v2;
}

+ (id)_createFullSizeRenderer
{
  [a1 maxRenderingSize];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263F14B40]), "initWithSize:scale:", v2, v2, 1.0);

  return v3;
}

+ (double)_calculateMaxRenderingSize
{
  double v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 scale];
  double v4 = v3;

  v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v17.origin.double x = v7;
  v17.origin.double y = v9;
  v17.size.double width = v11;
  v17.size.double height = v13;
  double v14 = v4 * CGRectGetWidth(v17);
  v18.origin.double x = v7;
  v18.origin.double y = v9;
  v18.size.double width = v11;
  v18.size.double height = v13;
  double v15 = v4 * CGRectGetHeight(v18);
  if (v14 >= v15) {
    double v15 = v14;
  }
  double result = v15 * 1.5;
  if (result > 2048.0)
  {
    NSLog(&cfstr_AskingForAFram.isa, 0x40A0000000000000, *(void *)&result);
    return 2048.0;
  }
  return result;
}

@end