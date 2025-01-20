@interface _CPClearInputFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPClearInputFeedback)init;
- (_CPClearInputFeedback)initWithFacade:(id)a3;
- (int)triggerEvent;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerEvent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPClearInputFeedback

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)hash
{
  return (2654435761 * self->_triggerEvent) ^ (2654435761u * self->_timestamp);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (unint64_t timestamp = self->_timestamp, timestamp == [v4 timestamp]))
  {
    int triggerEvent = self->_triggerEvent;
    BOOL v7 = triggerEvent == [v4 triggerEvent];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_CPClearInputFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPClearInputFeedback *)self triggerEvent]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPClearInputFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPClearInputFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPClearInputFeedback;
  v2 = [(_CPClearInputFeedback *)&v5 init];
  if (v2)
  {
    [(_CPClearInputFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

- (_CPClearInputFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_CPClearInputFeedback;
  objc_super v5 = [(_CPClearInputFeedback *)&v8 init];
  if (v5)
  {
    -[_CPClearInputFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    -[_CPClearInputFeedback setTriggerEvent:](v5, "setTriggerEvent:", [v4 triggerEvent]);
    v6 = v5;
  }

  return v5;
}

@end