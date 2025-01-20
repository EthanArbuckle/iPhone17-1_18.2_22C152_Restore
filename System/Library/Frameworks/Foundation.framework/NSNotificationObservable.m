@interface NSNotificationObservable
+ (id)observableWithName:(id)a3 object:(id)a4;
- (NSNotificationObservable)initWithName:(id)a3 object:(id)a4;
@end

@implementation NSNotificationObservable

+ (id)observableWithName:(id)a3 object:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithName:a3 object:a4];

  return v4;
}

- (NSNotificationObservable)initWithName:(id)a3 object:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSNotificationObservable;
  v6 = [(NSNotificationObservable *)&v8 init];
  if (v6) {
    [+[NSNotificationCenter defaultCenter] addObserver:v6 selector:sel_receiveObservedValue_ name:a3 object:a4];
  }
  return v6;
}

@end