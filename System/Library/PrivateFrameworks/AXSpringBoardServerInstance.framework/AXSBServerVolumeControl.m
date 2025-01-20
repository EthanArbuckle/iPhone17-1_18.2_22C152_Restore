@interface AXSBServerVolumeControl
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_effectiveVolumeChanged:(id)a3;
- (void)_presentVolumeHUDWithVolume:(float)a3;
@end

@implementation AXSBServerVolumeControl

- (void)_effectiveVolumeChanged:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKey:*MEMORY[0x263F54390]];
  [v6 floatValue];
  int v8 = v7;

  _CurrentVolume = v8;
  _LastVolumeDisplay = CFAbsoluteTimeGetCurrent();
  v9.receiver = self;
  v9.super_class = (Class)AXSBServerVolumeControl;
  [(AXSBServerVolumeControl *)&v9 _effectiveVolumeChanged:v4];
}

+ (id)safeCategoryTargetClassName
{
  return @"SBVolumeControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_presentVolumeHUDWithVolume:(float)a3
{
  v5 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  [v5 springBoardActionOccurred:1];

  v6 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  char v7 = [v6 shouldBlockGestureActivation:4];

  if ((v7 & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)AXSBServerVolumeControl;
    *(float *)&double v8 = a3;
    [(AXSBServerVolumeControl *)&v9 _presentVolumeHUDWithVolume:v8];
  }
}

@end