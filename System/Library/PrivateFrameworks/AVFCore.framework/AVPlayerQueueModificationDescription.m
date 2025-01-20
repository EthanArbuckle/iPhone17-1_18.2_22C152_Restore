@interface AVPlayerQueueModificationDescription
+ (id)modificationForInsertingItem:(id)a3 afterItem:(id)a4;
+ (id)modificationForRemovingItem:(id)a3;
- (AVPlayerItem)afterItem;
- (AVPlayerItem)item;
- (AVPlayerQueueModificationDescription)init;
- (AVPlayerQueueModificationDescription)initWithModificationType:(int64_t)a3 item:(id)a4 afterItem:(id)a5;
- (int64_t)modificationType;
- (void)dealloc;
@end

@implementation AVPlayerQueueModificationDescription

+ (id)modificationForInsertingItem:(id)a3 afterItem:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithModificationType:0 item:a3 afterItem:a4];
  return v4;
}

- (AVPlayerQueueModificationDescription)initWithModificationType:(int64_t)a3 item:(id)a4 afterItem:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)AVPlayerQueueModificationDescription;
  v8 = [(AVPlayerQueueModificationDescription *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_modificationType = a3;
    v8->_item = (AVPlayerItem *)a4;
    v9->_afterItem = (AVPlayerItem *)a5;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerQueueModificationDescription;
  [(AVPlayerQueueModificationDescription *)&v3 dealloc];
}

- (AVPlayerItem)item
{
  return self->_item;
}

- (AVPlayerQueueModificationDescription)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(sel_modificationForInsertingItem_afterItem_);
  NSStringFromSelector(sel_modificationForRemovingItem_);
  v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not available.  Use %@ or %@ instead", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

+ (id)modificationForRemovingItem:(id)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithModificationType:1 item:a3 afterItem:0];
  return v3;
}

- (int64_t)modificationType
{
  return self->_modificationType;
}

- (AVPlayerItem)afterItem
{
  return self->_afterItem;
}

@end