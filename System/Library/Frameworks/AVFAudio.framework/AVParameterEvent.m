@interface AVParameterEvent
- (AVParameterEvent)initWithParameterEvent:(ParameterEvent *)a3;
- (AVParameterEvent)initWithParameterID:(UInt32)parameterID scope:(UInt32)scope element:(UInt32)element value:(float)value;
- (ParameterEvent)event;
- (UInt32)element;
- (UInt32)parameterID;
- (UInt32)scope;
- (float)value;
- (void)setElement:(UInt32)element;
- (void)setParameterID:(UInt32)parameterID;
- (void)setScope:(UInt32)scope;
- (void)setValue:(float)value;
@end

@implementation AVParameterEvent

- (ParameterEvent)event
{
  return &self->_event;
}

- (AVParameterEvent)initWithParameterEvent:(ParameterEvent *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVParameterEvent;
  result = [(AVParameterEvent *)&v5 init];
  if (result) {
    result->_event = *a3;
  }
  return result;
}

- (void)setValue:(float)value
{
  self->_event.value = value;
}

- (float)value
{
  return self->_event.value;
}

- (void)setElement:(UInt32)element
{
  self->_event.element = element;
}

- (UInt32)element
{
  return self->_event.element;
}

- (void)setScope:(UInt32)scope
{
  self->_event.scope = scope;
}

- (UInt32)scope
{
  return self->_event.scope;
}

- (void)setParameterID:(UInt32)parameterID
{
  self->_event.parameterID = parameterID;
}

- (UInt32)parameterID
{
  return self->_event.parameterID;
}

- (AVParameterEvent)initWithParameterID:(UInt32)parameterID scope:(UInt32)scope element:(UInt32)element value:(float)value
{
  v11.receiver = self;
  v11.super_class = (Class)AVParameterEvent;
  result = [(AVParameterEvent *)&v11 init];
  if (result)
  {
    result->_event.parameterID = parameterID;
    result->_event.scope = scope;
    result->_event.element = element;
    result->_event.value = value;
  }
  return result;
}

@end