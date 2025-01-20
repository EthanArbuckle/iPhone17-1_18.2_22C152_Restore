@interface VFXView(Generative_Playground)
- (uint64_t)vfx_resetColorSpace;
- (void)_vfx_setColorSpace:()Generative_Playground;
- (void)vfx_setClearBackground;
- (void)vfx_setExtendedLinearSRGBColorSpace;
- (void)vfx_setLinearSRGBColorSpace;
@end

@implementation VFXView(Generative_Playground)

- (void)vfx_setClearBackground
{
  id v2 = [MEMORY[0x263F825C8] clearColor];
  [a1 setBackgroundColor:v2];
}

- (uint64_t)vfx_resetColorSpace
{
  return objc_msgSend(a1, "_vfx_setColorSpace:", 0);
}

- (void)vfx_setExtendedLinearSRGBColorSpace
{
  id v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00230]);
  objc_msgSend(a1, "_vfx_setColorSpace:", v2);

  CGColorSpaceRelease(v2);
}

- (void)vfx_setLinearSRGBColorSpace
{
  id v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002C8]);
  objc_msgSend(a1, "_vfx_setColorSpace:", v2);

  CGColorSpaceRelease(v2);
}

- (void)_vfx_setColorSpace:()Generative_Playground
{
  if (objc_opt_respondsToSelector())
  {
    [a1 performSelector:sel_setColorSpace_ withObject:a3];
    v4 = a3;
  }
  else
  {
    v5 = [a1 layer];
    [v5 setColorspace:a3];
    v4 = v5;
  }
}

@end