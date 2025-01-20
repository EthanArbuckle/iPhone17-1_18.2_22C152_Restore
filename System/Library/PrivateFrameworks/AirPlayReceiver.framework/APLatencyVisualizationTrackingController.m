@interface APLatencyVisualizationTrackingController
- (id)init:(id)a3;
- (id)layer;
- (void)dealloc;
- (void)draw;
@end

@implementation APLatencyVisualizationTrackingController

- (id)layer
{
  return self->_layer;
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__APLatencyVisualizationTrackingController_dealloc__block_invoke;
  block[3] = &unk_264895FB0;
  block[4] = self;
  dispatch_sync(queue, block);
  dispatch_release((dispatch_object_t)self->_queue);

  self->_layer = 0;
  v4.receiver = self;
  v4.super_class = (Class)APLatencyVisualizationTrackingController;
  [(APLatencyVisualizationTrackingController *)&v4 dealloc];
}

void __51__APLatencyVisualizationTrackingController_dealloc__block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 16));
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);

  dispatch_release(v2);
}

- (id)init:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)APLatencyVisualizationTrackingController;
  id v4 = [(APLatencyVisualizationTrackingController *)&v11 init];
  if (v4)
  {
    *((void *)v4 + 1) = a3;
    v5 = dispatch_queue_create("com.apple.airplay.receiver.latencyTracker", 0);
    *((void *)v4 + 3) = v5;
    v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v5);
    *((void *)v4 + 2) = v6;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __49__APLatencyVisualizationTrackingController_init___block_invoke;
    handler[3] = &unk_264895FB0;
    handler[4] = v4;
    dispatch_source_set_event_handler(v6, handler);
    v7 = *((void *)v4 + 2);
    dispatch_time_t v8 = dispatch_time(0, 16666666);
    dispatch_source_set_timer(v7, v8, 0xFE502AuLL, 0x3E8uLL);
    dispatch_resume(*((dispatch_object_t *)v4 + 2));
  }
  return v4;
}

uint64_t __49__APLatencyVisualizationTrackingController_init___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) draw];
}

- (void)draw
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(APLatencyVisualizationLayer *)self->_layer setNeedsDisplay];
  [(APLatencyVisualizationLayer *)self->_layer display];
  v3 = (void *)MEMORY[0x263F158F8];

  [v3 commit];
}

@end