@interface AVCMNotificationDispatcherListenerKey
+ (id)listenerKeyWithWeakReferenceToListener:(id)a3 callback:(void *)a4 name:(id)a5 object:(void *)a6;
- (AVCMNotificationDispatcherListenerKey)init;
- (AVCMNotificationDispatcherListenerKey)initWithWeakReferenceToListener:(id)a3 callback:(void *)a4 name:(id)a5 object:(void *)a6;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AVCMNotificationDispatcherListenerKey

- (unint64_t)hash
{
  uint64_t v3 = [(AVWeakReference *)self->_weakReferenceToListener hash] ^ (uint64_t)self->_callback;
  return v3 ^ [(NSString *)self->_name hash] ^ (uint64_t)self->_object;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[AVCMNotificationDispatcherListenerKey allocWithZone:[(AVCMNotificationDispatcherListenerKey *)self zone]];
  weakReferenceToListener = self->_weakReferenceToListener;
  callback = self->_callback;
  name = self->_name;
  object = self->_object;
  return [(AVCMNotificationDispatcherListenerKey *)v4 initWithWeakReferenceToListener:weakReferenceToListener callback:callback name:name object:object];
}

+ (id)listenerKeyWithWeakReferenceToListener:(id)a3 callback:(void *)a4 name:(id)a5 object:(void *)a6
{
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithWeakReferenceToListener:a3 callback:a4 name:a5 object:a6];
  return v6;
}

- (AVCMNotificationDispatcherListenerKey)initWithWeakReferenceToListener:(id)a3 callback:(void *)a4 name:(id)a5 object:(void *)a6
{
  v12.receiver = self;
  v12.super_class = (Class)AVCMNotificationDispatcherListenerKey;
  v10 = [(AVCMNotificationDispatcherListenerKey *)&v12 init];
  if (v10)
  {
    v10->_weakReferenceToListener = (AVWeakReference *)a3;
    v10->_callback = a4;
    v10->_name = (NSString *)objc_msgSend(a5, "copyWithZone:", -[AVCMNotificationDispatcherListenerKey zone](v10, "zone"));
    v10->_object = a6;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCMNotificationDispatcherListenerKey;
  [(AVCMNotificationDispatcherListenerKey *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_13:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (self == a3)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    name = self->_name;
    if (name == *((NSString **)a3 + 3)) {
      LOBYTE(v6) = 0;
    }
    else {
      int v6 = !-[NSString isEqualToString:](name, "isEqualToString:");
    }
    weakReferenceToListener = self->_weakReferenceToListener;
    if (weakReferenceToListener == *((AVWeakReference **)a3 + 1)
      || (int v7 = -[AVWeakReference isEqual:](weakReferenceToListener, "isEqual:")) != 0)
    {
      if (self->_callback == (void *)*((void *)a3 + 2)) {
        char v9 = v6;
      }
      else {
        char v9 = 1;
      }
      if (v9) {
        goto LABEL_13;
      }
      LOBYTE(v7) = self->_object == (void *)*((void *)a3 + 4);
    }
  }
  return v7;
}

- (AVCMNotificationDispatcherListenerKey)init
{
  return [(AVCMNotificationDispatcherListenerKey *)self initWithWeakReferenceToListener:0 callback:0 name:0 object:0];
}

@end