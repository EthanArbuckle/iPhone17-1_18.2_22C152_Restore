@interface AVPlayerItemMediaDataCollector
- (AVPlayerItemMediaDataCollector)init;
- (BOOL)_attachToPlayerItem:(id)a3;
- (id)_weakReference;
- (void)_detatchFromPlayerItem;
- (void)dealloc;
@end

@implementation AVPlayerItemMediaDataCollector

- (AVPlayerItemMediaDataCollector)init
{
  v7.receiver = self;
  v7.super_class = (Class)AVPlayerItemMediaDataCollector;
  v3 = [(AVPlayerItemMediaDataCollector *)&v7 init];
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    AVRequireConcreteObject(v3, a2, v4);
    v5 = objc_alloc_init(AVPlayerItemMediaDataCollectorInternal);
    v3->_collectorInternal = v5;
    if (v5)
    {
      CFRetain(v5);
      v3->_collectorInternal->weakReference = [[AVWeakReference alloc] initWithReferencedObject:v3];
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
  collectorInternal = self->_collectorInternal;
  if (collectorInternal)
  {

    CFRelease(self->_collectorInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemMediaDataCollector;
  [(AVPlayerItemMediaDataCollector *)&v4 dealloc];
}

- (id)_weakReference
{
  return self->_collectorInternal->weakReference;
}

- (BOOL)_attachToPlayerItem:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (void)_detatchFromPlayerItem
{
  objc_super v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
}

@end