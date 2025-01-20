@interface MOPublisher
- (id)initPublisher;
- (id)sinkWithCompletion:(id)a3 receiveInput:(id)a4;
- (id)sinkWithReceiveInput:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation MOPublisher

- (id)initPublisher
{
  v3.receiver = self;
  v3.super_class = (Class)MOPublisher;
  return [(MOPublisher *)&v3 init];
}

- (id)sinkWithReceiveInput:(id)a3
{
  return [(MOPublisher *)self sinkWithCompletion:&__block_literal_global_1 receiveInput:a3];
}

- (id)sinkWithCompletion:(id)a3 receiveInput:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[MOSink alloc] initWithCompletion:v7 receiveInput:v6];

  [(MOPublisher *)self subscribe:v8];
  return v8;
}

- (void)subscribe:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end