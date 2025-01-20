@interface AVPropertyValuePublisher
+ (id)propertyValuePublisherWithObject:(id)a3 key:(id)a4 notificationName:(id)a5;
- (AVPropertyValuePublisher)initWithObject:(id)a3 key:(id)a4 notificationName:(id)a5;
- (id)description;
- (id)subscribeRequestingInitialValue:(BOOL)a3 block:(id)a4;
- (void)dealloc;
@end

@implementation AVPropertyValuePublisher

uint64_t __66__AVPropertyValuePublisher_subscribeRequestingInitialValue_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = objc_msgSend((id)objc_msgSend(a2, "object"), "valueForKey:", *(void *)(a1 + 32));
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (id)subscribeRequestingInitialValue:(BOOL)a3 block:(id)a4
{
  BOOL v5 = a3;
  objc_initWeak(&location, self);
  key = self->_key;
  v8 = [AVNotificationSubscription alloc];
  object = self->_object;
  notificationName = self->_notificationName;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__AVPropertyValuePublisher_subscribeRequestingInitialValue_block___block_invoke;
  v14[3] = &unk_1E57B4440;
  v14[4] = key;
  v14[5] = a4;
  v11 = [(AVNotificationSubscription *)v8 initWithObject:object notificationName:notificationName callbackBlock:v14];
  if (v5) {
    (*((void (**)(id, id))a4 + 2))(a4, [self->_object valueForKey:key]);
  }
  v12 = v11;
  objc_destroyWeak(&location);
  return v12;
}

+ (id)propertyValuePublisherWithObject:(id)a3 key:(id)a4 notificationName:(id)a5
{
  BOOL v5 = [[AVPropertyValuePublisher alloc] initWithObject:a3 key:a4 notificationName:a5];
  return v5;
}

- (AVPropertyValuePublisher)initWithObject:(id)a3 key:(id)a4 notificationName:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)AVPropertyValuePublisher;
  v8 = [(AVPublisher *)&v10 init];
  if (v8)
  {
    v8->_object = a3;
    v8->_key = (NSString *)[a4 copy];
    v8->_notificationName = (NSString *)[a5 copy];
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVPropertyValuePublisher;
  [(AVPublisher *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p key=%@, object=%@, notification=%@>", objc_opt_class(), self, self->_key, self->_object, self->_notificationName];
}

@end