@interface _CPSearchViewDisappearFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPSearchViewDisappearFeedback)init;
- (_CPSearchViewDisappearFeedback)initWithFacade:(id)a3;
- (int)viewDisappearEvent;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setTimestamp:(unint64_t)a3;
- (void)setViewDisappearEvent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPSearchViewDisappearFeedback

- (void)setViewDisappearEvent:(int)a3
{
  self->_viewDisappearEvent = a3;
}

- (int)viewDisappearEvent
{
  return self->_viewDisappearEvent;
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
  return (2654435761 * self->_viewDisappearEvent) ^ (2654435761u * self->_timestamp);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (unint64_t timestamp = self->_timestamp, timestamp == [v4 timestamp]))
  {
    int viewDisappearEvent = self->_viewDisappearEvent;
    BOOL v7 = viewDisappearEvent == [v4 viewDisappearEvent];
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
  if ([(_CPSearchViewDisappearFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPSearchViewDisappearFeedback *)self viewDisappearEvent]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPSearchViewDisappearFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPSearchViewDisappearFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPSearchViewDisappearFeedback;
  v2 = [(_CPSearchViewDisappearFeedback *)&v5 init];
  if (v2)
  {
    [(_CPSearchViewDisappearFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

- (_CPSearchViewDisappearFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_CPSearchViewDisappearFeedback;
  objc_super v5 = [(_CPSearchViewDisappearFeedback *)&v8 init];
  if (v5)
  {
    -[_CPSearchViewDisappearFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    -[_CPSearchViewDisappearFeedback setViewDisappearEvent:](v5, "setViewDisappearEvent:", [v4 viewDisappearEvent]);
    v6 = v5;
  }

  return v5;
}

@end