@interface _CPFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPFeedback)init;
- (_CPFeedback)initWithFacade:(id)a3;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPFeedback

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
  if ([(_CPFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPFeedback;
  v2 = [(_CPFeedback *)&v5 init];
  if (v2)
  {
    [(_CPFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

- (_CPFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_CPFeedback;
  objc_super v5 = [(_CPFeedback *)&v8 init];
  if (v5)
  {
    -[_CPFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    BOOL v6 = v5;
  }

  return v5;
}

@end