@interface _CPDidGoToSiteFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)input;
- (_CPDidGoToSiteFeedback)init;
- (_CPDidGoToSiteFeedback)initWithFacade:(id)a3;
- (int)triggerEvent;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setInput:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerEvent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPDidGoToSiteFeedback

- (void).cxx_destruct
{
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setInput:(id)a3
{
}

- (NSString)input
{
  return self->_input;
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
  return [(NSString *)self->_input hash] ^ v2 ^ (2654435761 * self->_triggerEvent);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t timestamp = self->_timestamp;
    if (timestamp == [v4 timestamp])
    {
      v6 = [(_CPDidGoToSiteFeedback *)self input];
      v7 = [v4 input];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(_CPDidGoToSiteFeedback *)self input];
        if (!v9)
        {

LABEL_11:
          int triggerEvent = self->_triggerEvent;
          BOOL v14 = triggerEvent == [v4 triggerEvent];
          goto LABEL_9;
        }
        v10 = (void *)v9;
        v11 = [(_CPDidGoToSiteFeedback *)self input];
        v12 = [v4 input];
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
  if ([(_CPDidGoToSiteFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPDidGoToSiteFeedback *)self input];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPDidGoToSiteFeedback *)self triggerEvent]) {
    PBDataWriterWriteInt32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPDidGoToSiteFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPDidGoToSiteFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPDidGoToSiteFeedback;
  unint64_t v2 = [(_CPDidGoToSiteFeedback *)&v5 init];
  if (v2)
  {
    [(_CPDidGoToSiteFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

- (_CPDidGoToSiteFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CPDidGoToSiteFeedback;
  objc_super v5 = [(_CPDidGoToSiteFeedback *)&v10 init];
  if (v5)
  {
    -[_CPDidGoToSiteFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    v6 = [v4 input];

    if (v6)
    {
      v7 = [v4 input];
      [(_CPDidGoToSiteFeedback *)v5 setInput:v7];
    }
    -[_CPDidGoToSiteFeedback setTriggerEvent:](v5, "setTriggerEvent:", [v4 triggerEvent]);
    v8 = v5;
  }

  return v5;
}

@end