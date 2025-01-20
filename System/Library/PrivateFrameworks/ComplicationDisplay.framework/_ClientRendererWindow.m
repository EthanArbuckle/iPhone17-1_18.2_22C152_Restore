@interface _ClientRendererWindow
+ (BOOL)_isSecure;
- (BOOL)_alwaysGetsContexts;
- (BOOL)_isWindowServerHostingManaged;
- (BOOL)_shouldUseRemoteContext;
- (BOOL)_wantsSceneAssociation;
- (_ClientRendererWindow)init;
- (int64_t)_orientationForRootTransform;
- (int64_t)_orientationForViewTransform;
@end

@implementation _ClientRendererWindow

- (_ClientRendererWindow)init
{
  v5.receiver = self;
  v5.super_class = (Class)_ClientRendererWindow;
  v2 = -[_ClientRendererWindow initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v2)
  {
    v3 = [MEMORY[0x263F825C8] blackColor];
    [(_ClientRendererWindow *)v2 setBackgroundColor:v3];

    [(_ClientRendererWindow *)v2 setOpaque:1];
  }
  return v2;
}

- (BOOL)_shouldUseRemoteContext
{
  return 1;
}

- (BOOL)_wantsSceneAssociation
{
  return 0;
}

- (BOOL)_isWindowServerHostingManaged
{
  return 1;
}

- (BOOL)_alwaysGetsContexts
{
  return 1;
}

- (int64_t)_orientationForViewTransform
{
  return 1;
}

- (int64_t)_orientationForRootTransform
{
  return 1;
}

+ (BOOL)_isSecure
{
  return 1;
}

@end