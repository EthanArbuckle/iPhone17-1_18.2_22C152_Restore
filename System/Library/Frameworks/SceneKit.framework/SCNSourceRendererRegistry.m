@interface SCNSourceRendererRegistry
+ (id)sharedRegistry;
- (SCNSourceRendererRegistry)init;
- (id)sourceRendererForEngineContext:(__C3DEngineContext *)a3 source:(id)a4 textureSource:(id)a5 targetTexture:(id)a6;
- (void)dealloc;
- (void)endFrameForEngineContext:(__C3DEngineContext *)a3;
- (void)removeSourceRenderersForEngineContext:(__C3DEngineContext *)a3;
- (void)removeSourceRenderersForSource:(id)a3;
- (void)rendererDidChange:(id)a3;
@end

@implementation SCNSourceRendererRegistry

- (void)removeSourceRenderersForEngineContext:(__C3DEngineContext *)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&sourceRendererRegistryAccessMutex);
  CFDictionaryRemoveValue(self->_registry, a3);

  os_unfair_lock_unlock((os_unfair_lock_t)&sourceRendererRegistryAccessMutex);
}

+ (id)sharedRegistry
{
  if (sharedRegistry_onceToken != -1) {
    dispatch_once(&sharedRegistry_onceToken, &__block_literal_global_115);
  }
  return (id)sharedRegistry_sharedRegistry;
}

- (void)endFrameForEngineContext:(__C3DEngineContext *)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&sourceRendererRegistryAccessMutex);
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(self->_registry, a3);
  if (Value)
  {
    CFDictionaryRef v6 = Value;
    CFIndex Count = CFDictionaryGetCount(Value);
    if (Count >= 1)
    {
      CFIndex v8 = Count;
      size_t v9 = 8 * Count;
      v10 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
      v11 = (const void **)malloc_type_malloc(v9, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(v6, v10, v11);
      for (uint64_t i = 0; i != v8; ++i)
      {
        v13 = (void *)v11[i];
        if ((objc_opt_respondsToSelector() & 1) != 0 && ![v13 scene]) {
          CFDictionaryRemoveValue(v6, v10[i]);
        }
      }
      free(v10);
      free(v11);
      CFDictionaryApplyFunction(v6, (CFDictionaryApplierFunction)_removeSKRendererLinkToSource, 0);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&sourceRendererRegistryAccessMutex);
}

SCNSourceRendererRegistry *__43__SCNSourceRendererRegistry_sharedRegistry__block_invoke()
{
  result = objc_alloc_init(SCNSourceRendererRegistry);
  sharedRegistry_sharedRegistry = (uint64_t)result;
  return result;
}

- (SCNSourceRendererRegistry)init
{
  v4.receiver = self;
  v4.super_class = (Class)SCNSourceRendererRegistry;
  v2 = [(SCNSourceRendererRegistry *)&v4 init];
  if (v2) {
    v2->_registry = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x263EFFF90]);
  }
  return v2;
}

- (void)dealloc
{
  registry = self->_registry;
  if (registry) {
    CFRelease(registry);
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNSourceRendererRegistry;
  [(SCNSourceRendererRegistry *)&v4 dealloc];
}

- (void)rendererDidChange:(id)a3
{
  if (pthread_main_np())
  {
    uint64_t v4 = [a3 layer];
    v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:@"SCNLayerTreeDidChange" object:v4];
  }
  else
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] activateBackground:1];
    uint64_t v6 = [a3 layer];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"SCNLayerTreeDidChange", v6);
    v7 = (void *)MEMORY[0x263F158F8];
    [v7 commit];
  }
}

- (id)sourceRendererForEngineContext:(__C3DEngineContext *)a3 source:(id)a4 textureSource:(id)a5 targetTexture:(id)a6
{
  v37[1] = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)&sourceRendererRegistryAccessMutex);
  CFDictionaryRef Value = (void *)CFDictionaryGetValue(self->_registry, a3);
  if (!Value)
  {
    CFDictionaryRef Value = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x263EFFF90]);
    CFDictionarySetValue(self->_registry, a3, Value);
    CFRelease(Value);
  }
  v12 = (void *)CFDictionaryGetValue((CFDictionaryRef)Value, a4);
  if (v12)
  {
    v13 = v12;
    __SKSceneClass();
    if (objc_opt_class())
    {
      __SKSceneClass();
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v13 setScene:a4];
      }
    }
    goto LABEL_28;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (objc_opt_respondsToSelector())
    {
      v14 = (void *)[a4 rendererOptions];
      if (!v14)
      {
LABEL_19:
        id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
LABEL_20:
        v19 = v18;
        if (a6)
        {
          [v18 setObject:C3DColorSpaceLinearSRGB() forKeyedSubscript:*MEMORY[0x263F15F00]];
          uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
          [v19 setObject:-[SCNMTLRenderContext commandQueue](RenderContext) forKeyedSubscript:*MEMORY[0x263F15F08]];
          [v19 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F15EF8]];
          v21 = (void *)[MEMORY[0x263F15860] rendererWithMTLTexture:a6 options:v19];
        }
        else
        {
          uint64_t GLContext = C3DRendererContextGetGLContext([a5 rendererContextForTextureSourceWithEngineContext:a3]);
          if (!GLContext)
          {
            v23 = scn_default_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
              C3DEngineContextGetScene_cold_1(v23, v24, v25, v26, v27, v28, v29, v30);
            }
          }
          v21 = (void *)[MEMORY[0x263F15860] rendererWithEAGLContext:GLContext options:v19];
        }
        v13 = v21;
        [v21 setDelegate:self];

        if (v13) {
          goto LABEL_27;
        }
        goto LABEL_28;
      }
    }
    else
    {
      if (!objc_msgSend((id)objc_msgSend(a4, "valueForKey:", @"SCN_isBackingUIView"), "BOOLValue")) {
        goto LABEL_19;
      }
      v36 = @"kCARendererFlags";
      v37[0] = [NSNumber numberWithUnsignedInt:3];
      v14 = (void *)[NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
      if (!v14) {
        goto LABEL_19;
      }
    }
    id v18 = (id)[v14 mutableCopy];
    goto LABEL_20;
  }
  __SKSceneClass();
  if (!objc_opt_class() || (__SKSceneClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v13 = 0;
    goto LABEL_28;
  }
  Class v15 = NSClassFromString(&cfstr_Skscnrenderer.isa);
  uint64_t v16 = C3DEngineContextGetRenderContext((uint64_t)a3);
  if (v16) {
    v17 = (void *)-[objc_class rendererWithDevice:options:](v15, "rendererWithDevice:options:", -[SCNMTLRenderContext device](v16), 0);
  }
  else {
    v17 = (void *)[(objc_class *)v15 rendererWithContext:C3DEngineContextGetGLContext((uint64_t)a3) options:0];
  }
  v13 = v17;
  [v17 setScene:a4];
  [v13 setBackingScaleFactor:1.0];
  [a4 size];
  double v34 = v33;
  [a4 size];
  objc_msgSend(v13, "setBounds:", 0.0, 0.0, v34, v35);
  if (v13) {
LABEL_27:
  }
    CFDictionarySetValue((CFMutableDictionaryRef)Value, a4, v13);
LABEL_28:
  id v31 = v13;
  os_unfair_lock_unlock((os_unfair_lock_t)&sourceRendererRegistryAccessMutex);
  return v13;
}

- (void)removeSourceRenderersForSource:(id)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&sourceRendererRegistryAccessMutex);
  CFDictionaryApplyFunction(self->_registry, (CFDictionaryApplierFunction)_removeSourceRendererForSource, a3);

  os_unfair_lock_unlock((os_unfair_lock_t)&sourceRendererRegistryAccessMutex);
}

@end