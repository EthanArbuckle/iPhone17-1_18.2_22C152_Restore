@interface MPSGraphWaitEvent
- (MPSGraphWaitEvent)initWithEvent:(id)a3 value:(unint64_t)a4;
@end

@implementation MPSGraphWaitEvent

- (MPSGraphWaitEvent)initWithEvent:(id)a3 value:(unint64_t)a4
{
  v6 = (MTLSharedEvent *)a3;
  v10.receiver = self;
  v10.super_class = (Class)MPSGraphWaitEvent;
  v7 = [(MPSGraphWaitEvent *)&v10 init];
  event = v7->_event;
  v7->_event = v6;

  v7->_value = a4;
  return v7;
}

- (void).cxx_destruct
{
}

@end