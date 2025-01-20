@interface _CPConnectionInvalidatedFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPConnectionInvalidatedFeedback)init;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPConnectionInvalidatedFeedback

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
  return 2654435761u * self->_timestamp;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t timestamp = self->_timestamp;
    BOOL v6 = timestamp == [v4 timestamp];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_CPConnectionInvalidatedFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPConnectionInvalidatedFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPConnectionInvalidatedFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPConnectionInvalidatedFeedback;
  v2 = [(_CPConnectionInvalidatedFeedback *)&v5 init];
  if (v2)
  {
    [(_CPConnectionInvalidatedFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

@end