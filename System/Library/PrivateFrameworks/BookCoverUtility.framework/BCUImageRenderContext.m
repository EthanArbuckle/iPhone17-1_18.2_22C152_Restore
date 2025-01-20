@interface BCUImageRenderContext
- (BCUCoverEffects)coverEffects;
- (BCUImageRenderContext)init;
- (BCUImageRenderContext)initWithMode:(unint64_t)a3;
- (BCULayerRenderer)renderer;
- (NSHashTable)filterOperations;
- (void)filteredImageFromImage:(CGImage *)a3 filterInfo:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 completion:(id)a7;
- (void)filteredImageFromImage:(CGImage *)a3 filterInfo:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 waitForCPUSynchronization:(BOOL)a7 logKey:(id)a8 completion:(id)a9;
- (void)setFilterOperations:(id)a3;
@end

@implementation BCUImageRenderContext

- (BCUImageRenderContext)init
{
  return (BCUImageRenderContext *)MEMORY[0x270F9A6D0](self, sel_initWithMode_, 0);
}

- (BCUImageRenderContext)initWithMode:(unint64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)BCUImageRenderContext;
  id v4 = [(BCUImageRenderContext *)&v15 init];
  if (v4)
  {
    v5 = objc_alloc_init(BCULayerRenderer);
    v6 = (void *)*((void *)v4 + 2);
    *((void *)v4 + 2) = v5;

    v7 = [BCUCoverEffects alloc];
    uint64_t v9 = objc_msgSend_initWithRenderer_mode_(v7, v8, *((void *)v4 + 2), a3);
    v10 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v9;

    uint64_t v12 = objc_msgSend_hashTableWithOptions_(MEMORY[0x263F088B0], v11, 0);
    v13 = (void *)*((void *)v4 + 4);
    *((void *)v4 + 4) = v12;

    *((_DWORD *)v4 + 2) = 0;
  }
  return (BCUImageRenderContext *)v4;
}

- (void)filteredImageFromImage:(CGImage *)a3 filterInfo:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 completion:(id)a7
{
}

- (void)filteredImageFromImage:(CGImage *)a3 filterInfo:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 waitForCPUSynchronization:(BOOL)a7 logKey:(id)a8 completion:(id)a9
{
  BOOL v10 = a7;
  double height = a5.height;
  double width = a5.width;
  id v17 = a8;
  id v18 = a9;
  v22 = objc_msgSend_effectIdentifierForFilterInfo_(BCUCoverEffects, v19, (uint64_t)a4);
  if (v22)
  {
    v23 = objc_msgSend_coverEffects(self, v20, v21);
    v25 = objc_msgSend_bookCoverEffectFilterForEffectIdentifier_(v23, v24, (uint64_t)v22);

    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = sub_236A48DAC;
    v39[3] = &unk_264CBADC8;
    v39[4] = self;
    id v40 = v18;
    LODWORD(v26) = 1056964608;
    v28 = objc_msgSend_newOperationWithImage_size_contentsScale_priority_options_waitForCPUSynchronization_logKey_completion_(v25, v27, (uint64_t)a3, 0, v10, v17, v39, width, height, a6, v26);
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    v35 = sub_236A48F24;
    v36 = &unk_264CBADA0;
    p_accessLock = &self->_accessLock;
    v37 = self;
    id v38 = v28;
    id v30 = v28;
    os_unfair_lock_lock_with_options();
    ((void (*)(uint64_t *))sub_236A48F24)(&v33);
    os_unfair_lock_unlock(p_accessLock);
    objc_msgSend_start(v30, v31, v32, v33, v34);
  }
  else
  {
    (*((void (**)(id, void, double, double, double, double))v18 + 2))(v18, 0, 0.0, 0.0, 0.0, 0.0);
  }
}

- (BCULayerRenderer)renderer
{
  return self->_renderer;
}

- (BCUCoverEffects)coverEffects
{
  return self->_coverEffects;
}

- (NSHashTable)filterOperations
{
  return self->_filterOperations;
}

- (void)setFilterOperations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterOperations, 0);
  objc_storeStrong((id *)&self->_coverEffects, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

@end