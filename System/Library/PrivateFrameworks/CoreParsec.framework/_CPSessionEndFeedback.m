@interface _CPSessionEndFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPSessionEndFeedback)init;
- (int)reason;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setReason:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPSessionEndFeedback

- (void)setReason:(int)a3
{
  self->_reason = a3;
}

- (int)reason
{
  return self->_reason;
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
  return (2654435761 * self->_reason) ^ (2654435761u * self->_timestamp);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (unint64_t timestamp = self->_timestamp, timestamp == [v4 timestamp]))
  {
    int reason = self->_reason;
    BOOL v7 = reason == [v4 reason];
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
  if ([(_CPSessionEndFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPSessionEndFeedback *)self reason]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPSessionEndFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPSessionEndFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPSessionEndFeedback;
  v2 = [(_CPSessionEndFeedback *)&v5 init];
  if (v2)
  {
    [(_CPSessionEndFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

@end