@interface _CPCustomFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonFeedback;
- (_CPCustomFeedback)init;
- (_CPCustomFeedback)initWithFacade:(id)a3;
- (int)feedbackType;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setFeedbackType:(int)a3;
- (void)setJsonFeedback:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPCustomFeedback

- (void).cxx_destruct
{
}

- (void)setFeedbackType:(int)a3
{
  self->_feedbackType = a3;
}

- (int)feedbackType
{
  return self->_feedbackType;
}

- (void)setJsonFeedback:(id)a3
{
}

- (NSData)jsonFeedback
{
  return self->_jsonFeedback;
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
  unint64_t v2 = 2654435761u * self->_timestamp;
  return [(NSData *)self->_jsonFeedback hash] ^ v2 ^ (2654435761 * self->_feedbackType);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t timestamp = self->_timestamp;
    if (timestamp == [v4 timestamp])
    {
      v6 = [(_CPCustomFeedback *)self jsonFeedback];
      v7 = [v4 jsonFeedback];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(_CPCustomFeedback *)self jsonFeedback];
        if (!v9)
        {

LABEL_11:
          int feedbackType = self->_feedbackType;
          BOOL v14 = feedbackType == [v4 feedbackType];
          goto LABEL_9;
        }
        v10 = (void *)v9;
        v11 = [(_CPCustomFeedback *)self jsonFeedback];
        v12 = [v4 jsonFeedback];
        int v13 = [v11 isEqual:v12];

        if (v13) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
  }
  BOOL v14 = 0;
LABEL_9:

  return v14;
}

- (void)writeTo:(id)a3
{
  a3;
  if ([(_CPCustomFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPCustomFeedback *)self jsonFeedback];

  if (v4) {
    PBDataWriterWriteDataField();
  }
  if ([(_CPCustomFeedback *)self feedbackType]) {
    PBDataWriterWriteInt32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPCustomFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPCustomFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPCustomFeedback;
  unint64_t v2 = [(_CPCustomFeedback *)&v5 init];
  if (v2)
  {
    [(_CPCustomFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

- (_CPCustomFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CPCustomFeedback;
  objc_super v5 = [(_CPCustomFeedback *)&v10 init];
  if (v5)
  {
    -[_CPCustomFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    v6 = [v4 data];
    v7 = (void *)[v6 copy];
    [(_CPCustomFeedback *)v5 setJsonFeedback:v7];

    -[_CPCustomFeedback setFeedbackType:](v5, "setFeedbackType:", [v4 feedbackType]);
    v8 = v5;
  }

  return v5;
}

@end