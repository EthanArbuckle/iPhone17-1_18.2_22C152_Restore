@interface FigFCRLOLayer
- (FigFCRLOLayer)init;
- (void)compose;
- (void)dealloc;
- (void)layoutSublayers;
- (void)setCallbacks:(id)a3 viewportChanged:(void *)a4 drawInContext:(void *)a5;
- (void)setVideoBounds:(CGRect)a3;
- (void)setVideoDisplaySize:(CGSize)a3;
@end

@implementation FigFCRLOLayer

- (FigFCRLOLayer)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  v8.receiver = self;
  v8.super_class = (Class)FigFCRLOLayer;
  v3 = [(FigBaseCALayer *)&v8 init];
  if (v3)
  {
    v4 = (OpaqueFigCaptionRendererRenderedLegibleOutputInternal *)malloc_type_calloc(1uLL, 0x60uLL, 0x10C0040EE8B7EF8uLL);
    v3->layerInternal = v4;
    v4->var0 = v3;
    snprintf(__str, 0x100uLL, "com.apple.coremedia.figrenderedfcrcalayer.messagequeue<%p>", v3);
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

- (void)setVideoBounds:(CGRect)a3
{
  self->layerInternal->var1 = a3;
}

- (void)dealloc
{
  layerInternal = (dispatch_object_t *)self->layerInternal;
  if (layerInternal)
  {
    if (layerInternal[10])
    {
      dispatch_release(layerInternal[10]);
      layerInternal = (dispatch_object_t *)self->layerInternal;
      layerInternal[10] = 0;
    }
    free(layerInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)FigFCRLOLayer;
  [(FigFCRLOLayer *)&v4 dealloc];
}

- (void)setVideoDisplaySize:(CGSize)a3
{
  self->layerInternal->var5 = a3;
}

- (void)setCallbacks:(id)a3 viewportChanged:(void *)a4 drawInContext:(void *)a5
{
  self->layerInternal->var2 = a3;
  self->layerInternal->var3 = a4;
  self->layerInternal->var4 = a5;
}

- (void)compose
{
  layerInternal = self->layerInternal;
  if (layerInternal->var7)
  {
    layerInternal->var7 = 0;
    if (dword_1E9351088)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (dword_1E9351088)
      {
        dispatch_queue_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  ((void (*)(void, void *))self->layerInternal->var4)(0, self->layerInternal->var2);
}

- (void)layoutSublayers
{
  [(FigFCRLOLayer *)self bounds];
  ((void (*)(void *, void))self->layerInternal->var3)(self->layerInternal->var2, 0);
  ((void (*)(void, void *))self->layerInternal->var4)(0, self->layerInternal->var2);
  v3.receiver = self;
  v3.super_class = (Class)FigFCRLOLayer;
  [(FigFCRLOLayer *)&v3 layoutSublayers];
}

@end