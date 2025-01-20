@interface SCNRendererTransitionContext
- (SCNNode)outgoingPointOfView;
- (SCNScene)outgoingScene;
- (SKTransition)transition;
- (__C3DFXPass)transitionPass;
- (double)transitionStartTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)prepareRendererAtIndex:(int)a3 withScene:(id)a4 renderSize:(CGSize)a5 pointOfView:(id)a6 parentRenderer:(id)a7;
- (void)dealloc;
- (void)setOutgoingPointOfView:(id)a3;
- (void)setOutgoingScene:(id)a3;
- (void)setTransition:(id)a3;
- (void)setTransitionStartTime:(double)a3;
@end

@implementation SCNRendererTransitionContext

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SCNRendererTransitionContext);
  [(SCNRendererTransitionContext *)self transitionStartTime];
  -[SCNRendererTransitionContext setTransitionStartTime:](v4, "setTransitionStartTime:");
  [(SCNRendererTransitionContext *)v4 setTransition:[(SCNRendererTransitionContext *)self transition]];
  [(SCNRendererTransitionContext *)v4 setOutgoingPointOfView:[(SCNRendererTransitionContext *)self outgoingPointOfView]];
  [(SCNRendererTransitionContext *)v4 setOutgoingScene:[(SCNRendererTransitionContext *)self outgoingScene]];
  return v4;
}

- (__C3DFXPass)transitionPass
{
  result = self->_transitionPass;
  if (!result)
  {
    v4 = (__C3DFXPass *)C3DFXPassCreate();
    self->_transitionPass = v4;
    C3DFXPassSetName((uint64_t)v4, @"transition pass");
    C3DFXPassSetDrawInstruction((uint64_t)self->_transitionPass, 1);
    uint64_t FramebufferDescription = C3DFXPassGetFramebufferDescription((uint64_t)self->_transitionPass);
    *(unsigned char *)(FramebufferDescription + 8) = 1;
    *(unsigned char *)(FramebufferDescription + 80) |= 8u;
    return self->_transitionPass;
  }
  return result;
}

- (id)prepareRendererAtIndex:(int)a3 withScene:(id)a4 renderSize:(CGSize)a5 pointOfView:(id)a6 parentRenderer:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  renderers = self->_renderers;
  uint64_t v10 = a3;
  v11 = self->_renderers[a3];
  if (!v11)
  {
    +[SCNTransaction begin];
    +[SCNTransaction setImmediateMode:1];
    if ([a7 renderingAPI]) {
      v15 = +[SCNOffscreenRenderer offscreenRendererWithContext:size:](SCNOffscreenRenderer, "offscreenRendererWithContext:size:", [a7 context], width, height);
    }
    else {
      v15 = +[SCNOffscreenRenderer offscreenRendererWithDevice:size:](SCNOffscreenRenderer, "offscreenRendererWithDevice:size:", [a7 device], width, height);
    }
    v16 = v15;
    renderers[v10] = v16;
    [(SCNRenderer *)v16 setScene:a4];
    [(SCNRenderer *)renderers[v10] setPointOfView:a6];
    -[SCNRenderer setBackgroundColor:](renderers[v10], "setBackgroundColor:", [a7 backgroundColor]);
    v17 = renderers[v10];
    [a7 sceneTime];
    -[SCNRenderer setSceneTime:](v17, "setSceneTime:");
    +[SCNTransaction commit];
    v11 = renderers[v10];
  }
  -[SCNOffscreenRenderer setSize:](v11, "setSize:", width, height);
  return renderers[v10];
}

- (void)dealloc
{
  transitionPass = self->_transitionPass;
  if (transitionPass) {
    CFRelease(transitionPass);
  }
  id completionHandler = self->completionHandler;
  if (completionHandler) {
    _Block_release(completionHandler);
  }

  v5.receiver = self;
  v5.super_class = (Class)SCNRendererTransitionContext;
  [(SCNRendererTransitionContext *)&v5 dealloc];
}

- (SCNScene)outgoingScene
{
  return self->_outgoingScene;
}

- (void)setOutgoingScene:(id)a3
{
}

- (SKTransition)transition
{
  return self->_transition;
}

- (void)setTransition:(id)a3
{
}

- (double)transitionStartTime
{
  return self->_transitionStartTime;
}

- (void)setTransitionStartTime:(double)a3
{
  self->_transitionStartTime = a3;
}

- (SCNNode)outgoingPointOfView
{
  return self->_outgoingPointOfView;
}

- (void)setOutgoingPointOfView:(id)a3
{
}

@end