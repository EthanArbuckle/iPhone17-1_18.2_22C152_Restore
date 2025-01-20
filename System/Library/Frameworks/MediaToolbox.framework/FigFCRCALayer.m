@interface FigFCRCALayer
- (FigFCRCALayer)init;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)compose;
- (void)dealloc;
- (void)layoutSublayers;
- (void)setCallbacks:(id)a3 userEvent:(void *)a4 viewportChanged:(void *)a5 drawInContext:(void *)a6;
- (void)setVideoBounds:(CGRect)a3;
@end

@implementation FigFCRCALayer

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CA98], "null", a3, a4);
}

- (FigFCRCALayer)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  v8.receiver = self;
  v8.super_class = (Class)FigFCRCALayer;
  v3 = [(FigBaseCALayer *)&v8 init];
  if (v3)
  {
    v4 = (OpaqueFigCaptionRendererCALayerInternal *)malloc_type_calloc(1uLL, 0x58uLL, 0x10C00408E46FD1AuLL);
    v3->layerInternal = v4;
    v4->var0 = v3;
    snprintf(__str, 0x100uLL, "com.apple.coremedia.figfcrcalayer.messagequeue<%p>", v3);
    dispatch_queue_t v5 = dispatch_queue_create(__str, 0);
    layerInternal = v3->layerInternal;
    layerInternal->var6 = v5;
    if (v5)
    {
      layerInternal->var7 = 1;
    }
    else
    {

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  layerInternal = (dispatch_object_t *)self->layerInternal;
  if (layerInternal)
  {
    if (layerInternal[9])
    {
      dispatch_release(layerInternal[9]);
      layerInternal = (dispatch_object_t *)self->layerInternal;
      layerInternal[9] = 0;
    }
    free(layerInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)FigFCRCALayer;
  [(FigFCRCALayer *)&v4 dealloc];
}

- (void)setVideoBounds:(CGRect)a3
{
  self->layerInternal->var1 = a3;
}

- (void)setCallbacks:(id)a3 userEvent:(void *)a4 viewportChanged:(void *)a5 drawInContext:(void *)a6
{
  self->layerInternal->var2 = a3;
  self->layerInternal->var3 = a4;
  self->layerInternal->var4 = a5;
  self->layerInternal->var5 = a6;
}

- (void)compose
{
  layerInternal = self->layerInternal;
  if (layerInternal->var7)
  {
    layerInternal->var7 = 0;
    if (dword_1EB2AEA38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (dword_1EB2AEA38)
      {
        dispatch_queue_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  ((void (*)(void, void *))self->layerInternal->var5)(0, self->layerInternal->var2);
}

- (void)layoutSublayers
{
  [(FigFCRCALayer *)self bounds];
  ((void (*)(void *, void))self->layerInternal->var4)(self->layerInternal->var2, 0);
  ((void (*)(void, void *))self->layerInternal->var5)(0, self->layerInternal->var2);
  v3.receiver = self;
  v3.super_class = (Class)FigFCRCALayer;
  [(FigFCRCALayer *)&v3 layoutSublayers];
}

@end