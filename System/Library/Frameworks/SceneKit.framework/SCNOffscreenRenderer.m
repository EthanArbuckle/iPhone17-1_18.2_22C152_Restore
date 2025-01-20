@interface SCNOffscreenRenderer
+ (SCNOffscreenRenderer)offscreenRendererWithContext:(id)a3 size:(CGSize)a4;
+ (SCNOffscreenRenderer)offscreenRendererWithDevice:(id)a3 sceneRendererDelegate:(id)a4 size:(CGSize)a5;
+ (SCNOffscreenRenderer)offscreenRendererWithDevice:(id)a3 size:(CGSize)a4;
- (BOOL)_usesSpecificMainPassClearColorForRenderer:(id)a3 clearColor:;
- (BOOL)_wantsCustomMainPassPostProcessForRenderer:(id)a3;
- (CGSize)size;
- (id)_renderer:(id)a3 subdivDataForHash:(id)a4;
- (id)snapshot;
- (unsigned)textureID;
- (void)_encodeCustomMainPassPostProcessForRenderer:(id)a3 atTime:(double)a4 helper:(id)a5;
- (void)_renderer:(id)a3 didApplyAnimationsAtTime:(double)a4;
- (void)_renderer:(id)a3 didApplyConstraintsAtTime:(double)a4;
- (void)_renderer:(id)a3 didBuildSubdivDataForHash:(id)a4 dataProvider:(id)a5;
- (void)_renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5;
- (void)_renderer:(id)a3 didSimulatePhysicsAtTime:(double)a4;
- (void)_renderer:(id)a3 updateAtTime:(double)a4;
- (void)_renderer:(id)a3 willRenderScene:(id)a4 atTime:(double)a5;
- (void)setSize:(CGSize)a3;
@end

@implementation SCNOffscreenRenderer

- (void)_renderer:(id)a3 willRenderScene:(id)a4 atTime:(double)a5
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 0x10) != 0) {
    [(_SCNSceneRendererDelegate *)self->_sceneRendererDelegate _renderer:a3 willRenderScene:a4 atTime:a5];
  }
}

+ (SCNOffscreenRenderer)offscreenRendererWithDevice:(id)a3 sceneRendererDelegate:(id)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = a3;
  if (a3 || (id v8 = +[SCNView deviceForOptions:](SCNView, "deviceForOptions:")) != 0)
  {
    uint64_t v10 = [objc_alloc((Class)a1) _initWithOptions:0 isPrivateRenderer:0 privateRendererOwner:0 clearsOnDraw:1 context:v8 renderingAPI:0];
    *(void *)(v10 + 448) = a4;
    if (a4)
    {
      *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFFFE | objc_opt_respondsToSelector() & 1;
      if (objc_opt_respondsToSelector()) {
        __int16 v11 = 2;
      }
      else {
        __int16 v11 = 0;
      }
      *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFFFD | v11;
      if (objc_opt_respondsToSelector()) {
        __int16 v12 = 4;
      }
      else {
        __int16 v12 = 0;
      }
      *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFFFB | v12;
      if (objc_opt_respondsToSelector()) {
        __int16 v13 = 8;
      }
      else {
        __int16 v13 = 0;
      }
      *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFFF7 | v13;
      if (objc_opt_respondsToSelector()) {
        __int16 v14 = 16;
      }
      else {
        __int16 v14 = 0;
      }
      *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFFEF | v14;
      if (objc_opt_respondsToSelector()) {
        __int16 v15 = 32;
      }
      else {
        __int16 v15 = 0;
      }
      *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFFDF | v15;
      if (objc_opt_respondsToSelector()) {
        __int16 v16 = 128;
      }
      else {
        __int16 v16 = 0;
      }
      *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFF7F | v16;
      if (objc_opt_respondsToSelector()) {
        __int16 v17 = 256;
      }
      else {
        __int16 v17 = 0;
      }
      *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFEFF | v17;
      if (objc_opt_respondsToSelector()) {
        __int16 v18 = 64;
      }
      else {
        __int16 v18 = 0;
      }
      *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFFBF | v18;
      objc_msgSend((id)v10, "set_wantsSceneRendererDelegationMessages:", 1);
    }
    objc_msgSend((id)v10, "_setupOffscreenRendererWithSize:", width, height);
    return (SCNOffscreenRenderer *)(id)v10;
  }
  else
  {
    return (SCNOffscreenRenderer *)objc_msgSend(a1, "offscreenRendererWithContext:size:", 0, width, height);
  }
}

- (void)_renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 0x20) != 0) {
    [(_SCNSceneRendererDelegate *)self->_sceneRendererDelegate _renderer:a3 didRenderScene:a4 atTime:a5];
  }
}

- (BOOL)_wantsCustomMainPassPostProcessForRenderer:(id)a3
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 0x200) != 0) {
    return [(_SCNSceneRendererDelegate *)self->_sceneRendererDelegate _wantsCustomMainPassPostProcessForRenderer:a3];
  }
  else {
    return 0;
  }
}

+ (SCNOffscreenRenderer)offscreenRendererWithContext:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v6 = (void *)[objc_alloc((Class)a1) _initWithOptions:0 isPrivateRenderer:0 privateRendererOwner:0 clearsOnDraw:1 context:a3 renderingAPI:1];
  objc_msgSend(v6, "_setupOffscreenRendererWithSize:", width, height);

  return (SCNOffscreenRenderer *)v6;
}

+ (SCNOffscreenRenderer)offscreenRendererWithDevice:(id)a3 size:(CGSize)a4
{
  return (SCNOffscreenRenderer *)objc_msgSend(a1, "offscreenRendererWithDevice:sceneRendererDelegate:size:", a3, 0, a4.width, a4.height);
}

- (id)snapshot
{
  *(float *)&double v2 = self->super._framebufferInfo.drawableSize.width;
  *(float *)&double v3 = self->super._framebufferInfo.drawableSize.height;
  -[SCNRenderer set_viewport:](self, "set_viewport:", 0.0, 0.0, v2, v3);

  return [(SCNRenderer *)self snapshotAtTime:0.0];
}

- (unsigned)textureID
{
  [(SCNRenderer *)self _prepareRenderTarget];
  TextureWithSlot = C3DFramebufferGetTextureWithSlot((uint64_t)self->super._framebufferInfo.frameBuffer, 0);

  return C3DTextureGetID((uint64_t)TextureWithSlot);
}

- (CGSize)size
{
  double width = self->super._framebufferInfo.drawableSize.width;
  double height = self->super._framebufferInfo.drawableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  if (a3.width != self->super._framebufferInfo.drawableSize.width
    || a3.height != self->super._framebufferInfo.drawableSize.height)
  {
    *((unsigned char *)&self->super + 129) |= 1u;
    self->super._framebufferInfo.drawableSize = a3;
  }
}

- (void)_renderer:(id)a3 updateAtTime:(double)a4
{
  if (*(_WORD *)&self->_sceneRendererDelegateDelegationConformance) {
    [(_SCNSceneRendererDelegate *)self->_sceneRendererDelegate _renderer:a3 updateAtTime:a4];
  }
}

- (void)_renderer:(id)a3 didApplyAnimationsAtTime:(double)a4
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 2) != 0) {
    [(_SCNSceneRendererDelegate *)self->_sceneRendererDelegate _renderer:a3 didApplyAnimationsAtTime:a4];
  }
}

- (void)_renderer:(id)a3 didSimulatePhysicsAtTime:(double)a4
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 4) != 0) {
    [(_SCNSceneRendererDelegate *)self->_sceneRendererDelegate _renderer:a3 didSimulatePhysicsAtTime:a4];
  }
}

- (void)_renderer:(id)a3 didApplyConstraintsAtTime:(double)a4
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 8) != 0) {
    [(_SCNSceneRendererDelegate *)self->_sceneRendererDelegate _renderer:a3 didApplyConstraintsAtTime:a4];
  }
}

- (void)_renderer:(id)a3 didBuildSubdivDataForHash:(id)a4 dataProvider:(id)a5
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 0x80) != 0) {
    [(_SCNSceneRendererDelegate *)self->_sceneRendererDelegate _renderer:a3 didBuildSubdivDataForHash:a4 dataProvider:a5];
  }
}

- (id)_renderer:(id)a3 subdivDataForHash:(id)a4
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 0x100) != 0) {
    return (id)[(_SCNSceneRendererDelegate *)self->_sceneRendererDelegate _renderer:a3 subdivDataForHash:a4];
  }
  else {
    return 0;
  }
}

- (BOOL)_usesSpecificMainPassClearColorForRenderer:(id)a3 clearColor:
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 0x200) != 0) {
    return -[_SCNSceneRendererDelegate _usesSpecificMainPassClearColorForRenderer:clearColor:](self->_sceneRendererDelegate, "_usesSpecificMainPassClearColorForRenderer:clearColor:", a3);
  }
  else {
    return 0;
  }
}

- (void)_encodeCustomMainPassPostProcessForRenderer:(id)a3 atTime:(double)a4 helper:(id)a5
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 0x200) != 0) {
    [(_SCNSceneRendererDelegate *)self->_sceneRendererDelegate _encodeCustomMainPassPostProcessForRenderer:a3 atTime:a5 helper:a4];
  }
}

@end