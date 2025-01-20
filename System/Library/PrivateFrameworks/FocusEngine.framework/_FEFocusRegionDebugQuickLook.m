@interface _FEFocusRegionDebugQuickLook
+ (void)drawDebugQuickLookImageForRegion:(id)a3 withInfo:(id)a4 inContext:(CGContext *)a5;
@end

@implementation _FEFocusRegionDebugQuickLook

+ (void)drawDebugQuickLookImageForRegion:(id)a3 withInfo:(id)a4 inContext:(CGContext *)a5
{
  id v9 = a3;
  id v6 = a4;
  v7 = [v9 _debugDrawingConfigurationWithDebugInfo:v6];
  if (v7)
  {
    v8 = [v6 snapshot];
    [v8 snapshotFrameForRegion:v9];
  }
}

@end