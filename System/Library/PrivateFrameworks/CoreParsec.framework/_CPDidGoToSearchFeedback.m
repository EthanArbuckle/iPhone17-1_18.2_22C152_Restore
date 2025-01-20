@interface _CPDidGoToSearchFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)input;
- (_CPDidGoToSearchFeedback)init;
- (_CPDidGoToSearchFeedback)initWithFacade:(id)a3;
- (int)endpoint;
- (int)triggerEvent;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setEndpoint:(int)a3;
- (void)setInput:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerEvent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPDidGoToSearchFeedback

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

- (void)setEndpoint:(int)a3
{
  self->_endpoint = a3;
}

- (int)endpoint
{
  return self->_endpoint;
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
  return [(NSString *)self->_input hash] ^ v2 ^ (2654435761 * self->_endpoint) ^ (2654435761
                                                                                         * self->_triggerEvent);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_11;
  }
  v6 = [(_CPDidGoToSearchFeedback *)self input];
  v7 = [v4 input];
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

    goto LABEL_11;
  }
  uint64_t v9 = [(_CPDidGoToSearchFeedback *)self input];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_CPDidGoToSearchFeedback *)self input];
    v12 = [v4 input];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  int endpoint = self->_endpoint;
  if (endpoint != [v4 endpoint])
  {
LABEL_11:
    BOOL v16 = 0;
    goto LABEL_12;
  }
  int triggerEvent = self->_triggerEvent;
  BOOL v16 = triggerEvent == [v4 triggerEvent];
LABEL_12:

  return v16;
}

- (void)writeTo:(id)a3
{
  a3;
  if ([(_CPDidGoToSearchFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPDidGoToSearchFeedback *)self input];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPDidGoToSearchFeedback *)self endpoint]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPDidGoToSearchFeedback *)self triggerEvent]) {
    PBDataWriterWriteInt32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPDidGoToSearchFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPDidGoToSearchFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPDidGoToSearchFeedback;
  unint64_t v2 = [(_CPDidGoToSearchFeedback *)&v5 init];
  if (v2)
  {
    [(_CPDidGoToSearchFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

- (_CPDidGoToSearchFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CPDidGoToSearchFeedback;
  objc_super v5 = [(_CPDidGoToSearchFeedback *)&v10 init];
  if (v5)
  {
    -[_CPDidGoToSearchFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    v6 = [v4 input];

    if (v6)
    {
      v7 = [v4 input];
      [(_CPDidGoToSearchFeedback *)v5 setInput:v7];
    }
    -[_CPDidGoToSearchFeedback setEndpoint:](v5, "setEndpoint:", [v4 endpoint]);
    -[_CPDidGoToSearchFeedback setTriggerEvent:](v5, "setTriggerEvent:", [v4 triggerEvent]);
    v8 = v5;
  }

  return v5;
}

@end