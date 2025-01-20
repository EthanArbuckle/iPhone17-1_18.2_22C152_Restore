@interface ScreenSuppressor
+ (id)sharedInstance;
- (BOOL)suppressEventScreenMessage:(id)a3;
- (ScreenSuppressor)init;
- (void)dealloc;
- (void)decSuppressEventScreenMessageAssertionLevel:(id)a3;
- (void)incSuppressEventScreenMessageAssertionLevel:(id)a3;
@end

@implementation ScreenSuppressor

- (ScreenSuppressor)init
{
  v4.receiver = self;
  v4.super_class = (Class)ScreenSuppressor;
  v2 = [(ScreenSuppressor *)&v4 init];
  v2->_dict = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:16];
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ScreenSuppressor;
  [(ScreenSuppressor *)&v3 dealloc];
}

- (void)incSuppressEventScreenMessageAssertionLevel:(id)a3
{
  if (a3)
  {
    objc_sync_enter(self);
    v5 = (NSNumber *)[(NSMutableDictionary *)self->_dict objectForKey:a3];
    if (!v5) {
      v5 = +[NSNumber numberWithInt:0];
    }
    [(NSMutableDictionary *)self->_dict setObject:+[NSNumber numberWithInt:[(NSNumber *)v5 intValue] + 1] forKeyedSubscript:a3];
    objc_sync_exit(self);
  }
}

- (void)decSuppressEventScreenMessageAssertionLevel:(id)a3
{
  if (a3)
  {
    objc_sync_enter(self);
    id v5 = [(NSMutableDictionary *)self->_dict objectForKey:a3];
    v6 = v5;
    if (v5 && (int)[v5 intValue] >= 1) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 intValue] - 1), a3);
    }
    objc_sync_exit(self);
  }
}

- (BOOL)suppressEventScreenMessage:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    objc_sync_enter(self);
    id v5 = [(NSMutableDictionary *)self->_dict objectForKey:v3];
    if (v5) {
      LOBYTE(v3) = (int)[v5 intValue] > 0;
    }
    else {
      LOBYTE(v3) = 0;
    }
    objc_sync_exit(self);
  }
  return (char)v3;
}

+ (id)sharedInstance
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_101B0C8A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_101B0C8A8))
  {
    qword_101B0C8A0 = objc_alloc_init(ScreenSuppressor);
    __cxa_guard_release(&qword_101B0C8A8);
  }
  return (id)qword_101B0C8A0;
}

@end