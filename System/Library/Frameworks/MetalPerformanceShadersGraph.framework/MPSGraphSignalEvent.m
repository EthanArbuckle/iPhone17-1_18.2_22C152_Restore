@interface MPSGraphSignalEvent
- (MPSGraphSignalEvent)initWithEvent:(id)a3 executionStage:(unint64_t)a4 value:(unint64_t)a5;
@end

@implementation MPSGraphSignalEvent

- (MPSGraphSignalEvent)initWithEvent:(id)a3 executionStage:(unint64_t)a4 value:(unint64_t)a5
{
  v8 = (MTLSharedEvent *)a3;
  v12.receiver = self;
  v12.super_class = (Class)MPSGraphSignalEvent;
  v9 = [(MPSGraphSignalEvent *)&v12 init];
  event = v9->_event;
  v9->_event = v8;

  v9->_value = a5;
  v9->_executionStage = a4;
  return v9;
}

- (void).cxx_destruct
{
}

@end