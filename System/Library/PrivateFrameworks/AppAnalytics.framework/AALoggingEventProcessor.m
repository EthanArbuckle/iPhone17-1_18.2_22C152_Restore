@interface AALoggingEventProcessor
- (AALoggingEventProcessor)init;
- (AALoggingEventProcessor)initWithFormat:(int64_t)a3;
- (AALoggingEventProcessor)initWithFormat:(int64_t)a3 subsystem:(id)a4;
- (void)processEvent:(id)a3;
@end

@implementation AALoggingEventProcessor

- (AALoggingEventProcessor)initWithFormat:(int64_t)a3 subsystem:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1A916AF90();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (AALoggingEventProcessor *)BridgingLoggingEventProcessor.init(format:subsystem:)(a3, (uint64_t)a4, v6);
}

- (AALoggingEventProcessor)initWithFormat:(int64_t)a3
{
  return [(AALoggingEventProcessor *)self initWithFormat:a3 subsystem:0];
}

- (void)processEvent:(id)a3
{
}

- (AALoggingEventProcessor)init
{
  result = (AALoggingEventProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end