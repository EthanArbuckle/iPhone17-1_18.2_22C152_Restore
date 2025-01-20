@interface MDLCamera(SCNModelIO)
+ (id)cameraWithSCNCamera:()SCNModelIO;
@end

@implementation MDLCamera(SCNModelIO)

+ (id)cameraWithSCNCamera:()SCNModelIO
{
  id v4 = objc_alloc_init(a1);
  objc_setAssociatedObject(v4, @"SCNSceneKitAssociatedObject", a3, (void *)0x301);
  [a3 focusDistance];
  *(float *)&double v5 = v5;
  [v4 setFocusDistance:v5];
  [a3 sensorHeight];
  *(float *)&double v6 = v6;
  [v4 setSensorVerticalAperture:v6];
  objc_msgSend(v4, "setApertureBladeCount:", objc_msgSend(a3, "apertureBladeCount"));
  if ([a3 useLegacyFov]) {
    [a3 yFov];
  }
  else {
    [a3 fieldOfView];
  }
  *(float *)&double v7 = v7;
  [v4 setFieldOfView:v7];
  [a3 aspectRatio];
  *(float *)&double v8 = v8;
  [v4 setSensorAspect:v8];
  [a3 zNear];
  *(float *)&double v9 = v9;
  [v4 setNearVisibilityDistance:v9];
  [a3 zFar];
  *(float *)&double v10 = v10;
  [v4 setFarVisibilityDistance:v10];
  [a3 focalBlurRadius];
  *(float *)&double v11 = v11;
  [v4 setMaximumCircleOfConfusion:v11];
  [a3 fStop];
  *(float *)&double v12 = v12;
  [v4 setFStop:v12];
  objc_msgSend(v4, "setProjection:", objc_msgSend(a3, "usesOrthographicProjection"));

  return v4;
}

@end