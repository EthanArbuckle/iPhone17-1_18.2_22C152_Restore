@interface MOSubscriber
- (id)initSubscriber;
- (unint64_t)receiveInput:(id)a3;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
@end

@implementation MOSubscriber

- (id)initSubscriber
{
  v3.receiver = self;
  v3.super_class = (Class)MOSubscriber;
  return [(MOSubscriber *)&v3 init];
}

- (void)receiveSubscription:(id)a3
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_3();
  NSRequestConcreteImplementation();
}

- (unint64_t)receiveInput:(id)a3
{
  return 0;
}

- (void)receiveCompletion:(id)a3
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_3();
  NSRequestConcreteImplementation();
}

@end