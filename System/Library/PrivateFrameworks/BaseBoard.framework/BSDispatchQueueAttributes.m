@interface BSDispatchQueueAttributes
+ (id)concurrent;
+ (id)serial;
- (OS_dispatch_queue_attr)attributes;
- (id)autoreleaseFrequency:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)inactive;
- (id)serviceClass:(unsigned int)a3;
- (id)serviceClass:(unsigned int)a3 relativePriority:(int)a4;
- (id)targetQueue:(id)a3;
@end

@implementation BSDispatchQueueAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_attrs, 0);
}

- (id)serviceClass:(unsigned int)a3
{
  return [(BSDispatchQueueAttributes *)self serviceClass:*(void *)&a3 relativePriority:0];
}

- (id)serviceClass:(unsigned int)a3 relativePriority:(int)a4
{
  attrs = self->_attrs;
  if (a4 <= -15) {
    int v6 = -15;
  }
  else {
    int v6 = a4;
  }
  dispatch_queue_attr_make_with_qos_class((dispatch_queue_attr_t)self->_attrs, (dispatch_qos_class_t)a3, v6 & (v6 >> 31));
  self->_attrs = (OS_dispatch_queue_attr *)objc_claimAutoreleasedReturnValue();

  return self;
}

- (OS_dispatch_queue_attr)attributes
{
  return self->_attrs;
}

+ (id)serial
{
  v2 = objc_alloc_init((Class)a1);
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (void *)v2[1];
    v2[1] = v3;
  }
  return v2;
}

- (id)targetQueue:(id)a3
{
  v5 = (OS_dispatch_queue *)a3;
  if (self->_targetQueue != v5) {
    objc_storeStrong((id *)&self->_targetQueue, a3);
  }

  return self;
}

+ (id)concurrent
{
  v2 = objc_alloc_init((Class)a1);
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (void *)v2[1];
    v2[1] = v3;
  }
  return v2;
}

- (id)autoreleaseFrequency:(unint64_t)a3
{
  attrs = self->_attrs;
  dispatch_queue_attr_make_with_autorelease_frequency(attrs, (dispatch_autorelease_frequency_t)a3);
  self->_attrs = (OS_dispatch_queue_attr *)objc_claimAutoreleasedReturnValue();

  return self;
}

- (id)inactive
{
  attrs = self->_attrs;
  dispatch_queue_attr_make_initially_inactive(attrs);
  self->_attrs = (OS_dispatch_queue_attr *)objc_claimAutoreleasedReturnValue();

  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_attrs);
  objc_storeStrong(v4 + 2, self->_targetQueue);
  return v4;
}

@end