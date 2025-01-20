@interface CASecureFlipBookLayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)_hasRenderLayerSubclass;
+ (id)secureFlipBookWithType:(id)a3;
- (BOOL)canTransitionToState:(id)a3;
- (BOOL)forceTransitionToState:(id)a3;
- (BOOL)transitionToState:(id)a3;
- (BOOL)validTransitionFromState:(id)a3 toState:(id)a4;
- (NSArray)states;
- (NSArray)validPositions;
- (NSString)currentState;
- (NSString)nextState;
- (NSString)type;
- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5;
- (void)dealloc;
- (void)tick:(double)a3;
@end

@implementation CASecureFlipBookLayer

- (NSArray)states
{
  return self->_states;
}

- (BOOL)forceTransitionToState:(id)a3
{
  if (CADeviceHasInternalBuild::once[0] != -1) {
    dispatch_once(CADeviceHasInternalBuild::once, &__block_literal_global_153);
  }
  if (CADeviceHasInternalBuild::internal) {
    BOOL v5 = MEMORY[0x1E4F97B38] == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    LODWORD(v6) = SILStateMachineForceTransitionToState();
    if (v6)
    {
      v6 = (NSString *)(id)[a3 copy];
      self->_currentState = v6;
      self->_nextState = v6;
      LOBYTE(v6) = 1;
    }
  }
  return (char)v6;
}

- (BOOL)transitionToState:(id)a3
{
  nextState = self->_nextState;
  if (nextState != self->_currentState)
  {
    LODWORD(v6) = -[NSString isEqualToString:](nextState, "isEqualToString:");
    if (!v6) {
      return (char)v6;
    }
    nextState = self->_currentState;
  }
  if (nextState) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = MEMORY[0x1E4F97B38] == 0;
  }
  if (v7)
  {
    LODWORD(v6) = SILStateMachineTransitionToState();
    if (v6)
    {
      v6 = (NSString *)(id)[a3 copy];
LABEL_13:
      self->_nextState = v6;
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LODWORD(v6) = SILStateMachineForceTransitionToState();
    if (v6)
    {
      v6 = (NSString *)(id)[a3 copy];
      self->_currentState = v6;
      goto LABEL_13;
    }
  }
  return (char)v6;
}

- (BOOL)canTransitionToState:(id)a3
{
  nextState = self->_nextState;
  currentState = self->_currentState;
  if (nextState != currentState)
  {
    BOOL v7 = [(NSString *)self->_nextState isEqualToString:currentState];
    if (!v7) {
      return v7;
    }
    nextState = self->_currentState;
  }

  LOBYTE(v7) = [(CASecureFlipBookLayer *)self validTransitionFromState:nextState toState:a3];
  return v7;
}

- (BOOL)validTransitionFromState:(id)a3 toState:(id)a4
{
  return SILStateMachineTransitionSupported();
}

- (void)tick:(double)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = (CA::Transaction *)SILStateMachineTick();
  BOOL v5 = v4;
  if (self->_currentFrame != self->_commitedFrame)
  {
    v6 = CA::Transaction::ensure_compat(v4);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v6, 0x10000);
  }
  currentState = self->_currentState;
  if (currentState != (NSString *)v5 && ![(NSString *)currentState isEqualToString:v5])
  {
    [(CASecureFlipBookLayer *)self willChangeValueForKey:NSStringFromSelector(sel_currentState)];

    v8 = v5;
    self->_nextState = v8;
    self->_currentState = v8;
    [(CASecureFlipBookLayer *)self didChangeValueForKey:NSStringFromSelector(sel_currentState)];
    if (x_log_hook_p())
    {
      [(NSString *)self->_currentState UTF8String];
      x_log_();
    }
    else
    {
      v9 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_INFO))
      {
        v10 = [(NSString *)self->_currentState UTF8String];
        *(_DWORD *)buf = 136315138;
        v12 = v10;
        _os_log_impl(&dword_184668000, v9, OS_LOG_TYPE_INFO, "SILStateMachine finished transition %s", buf, 0xCu);
      }
    }
  }
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)CASecureFlipBookLayer;
  id v7 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v13, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(void *)&a4);
  if (v7 && (*((unsigned char *)a5 + 2) & 1) != 0)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v9 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x18uLL, 0x743898A5uLL);
    v10 = v9;
    if (v9)
    {
      v9[2] = 0;
      *((_DWORD *)v9 + 2) = 1;
      *((_DWORD *)v9 + 3) = 45;
      ++dword_1EB2ADE7C;
      void *v9 = &unk_1ED02EDA0;
    }
    int v11 = indicator_id_from_name([(CASecureFlipBookLayer *)self type]);
    if (v11 == -1) {
      __assert_rtn("-[CASecureFlipBookLayer _copyRenderLayer:layerFlags:commitFlags:]", "CASecureIndicatorLayer.mm", 349, "type != ~0U");
    }
    *((_DWORD *)v10 + 4) = v11;
    *((_WORD *)v10 + 10) = self->_currentFrame;
    self->_commitedFrame = self->_currentFrame;
    CA::Render::Layer::set_subclass((uint64_t)v7, (CA::Render::LayerSubclass *)v10);
    if (atomic_fetch_add((atomic_uint *volatile)v10 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(void *))(*v10 + 16))(v10);
    }
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  SILStateMachineRelease();
  v3.receiver = self;
  v3.super_class = (Class)CASecureFlipBookLayer;
  [(CALayer *)&v3 dealloc];
}

- (NSArray)validPositions
{
  v2 = [(CASecureFlipBookLayer *)self type];

  return (NSArray *)CASecureIndicatorLayerValidPositionsForIndicator(v2);
}

- (NSString)nextState
{
  return self->_nextState;
}

- (NSString)currentState
{
  return self->_currentState;
}

- (NSString)type
{
  return self->_type;
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CASecureFlipBookLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

+ (id)secureFlipBookWithType:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (CADeviceSupportsMedina::once[0] != -1) {
    dispatch_once(CADeviceSupportsMedina::once, &__block_literal_global_314);
  }
  BOOL v5 = 0;
  if (CADeviceSupportsMedina::medina)
  {
    if (MEMORY[0x1E4F97B40]) {
      BOOL v6 = MEMORY[0x1E4F97B58] == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6 && MEMORY[0x1E4F97B50] != 0 && MEMORY[0x1E4F97B48] != 0 && MEMORY[0x1E4F97B30] != 0)
    {
      uint64_t v15 = *MEMORY[0x1E4F97B78];
      v16[0] = a3;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      uint64_t v10 = SILStateMachineCreate();
      if (v10)
      {
        uint64_t v11 = v10;
        BOOL v5 = objc_alloc_init((Class)a1);
        if (v5)
        {
          v5[5] = [a3 copy];
          v5[4] = v11;
          v12 = (void *)SILStateMachineStateList();
          v5[9] = v12;
          if (MEMORY[0x1E4F97B38])
          {
            v5[7] = 0;
            v5[6] = 0;
          }
          else
          {
            uint64_t v13 = [v12 objectAtIndexedSubscript:0];
            v5[7] = v13;
            v5[6] = v13;
          }
        }
        else
        {
          SILStateMachineRelease();
        }
      }
      else
      {
        NSLog(&cfstr_CoreanimationI_2.isa, a3);
        return 0;
      }
    }
  }
  return v5;
}

@end