@interface MOSubject
- (id)initSubject;
- (void)sendCompletion:(id)a3;
- (void)sendValue:(id)a3;
@end

@implementation MOSubject

- (id)initSubject
{
  v3.receiver = self;
  v3.super_class = (Class)MOSubject;
  return [(MOPublisher *)&v3 initPublisher];
}

- (void)sendCompletion:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void)sendValue:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end