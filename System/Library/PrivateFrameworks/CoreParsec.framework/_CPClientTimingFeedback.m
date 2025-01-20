@interface _CPClientTimingFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)eventName;
- (NSString)input;
- (_CPClientTimingFeedback)init;
- (_CPClientTimingFeedback)initWithFacade:(id)a3;
- (unint64_t)hash;
- (unint64_t)nanosecondInterval;
- (unint64_t)queryId;
- (unint64_t)timestamp;
- (void)setEventName:(id)a3;
- (void)setInput:(id)a3;
- (void)setNanosecondInterval:(unint64_t)a3;
- (void)setQueryId:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPClientTimingFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);

  objc_storeStrong((id *)&self->_input, 0);
}

- (void)setNanosecondInterval:(unint64_t)a3
{
  self->_nanosecondInterval = a3;
}

- (unint64_t)nanosecondInterval
{
  return self->_nanosecondInterval;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void)setEventName:(id)a3
{
}

- (NSString)eventName
{
  return self->_eventName;
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
  unint64_t v3 = 2654435761u * self->_timestamp;
  NSUInteger v4 = [(NSString *)self->_input hash];
  return v4 ^ [(NSString *)self->_eventName hash] ^ v3 ^ (2654435761u * self->_queryId) ^ (2654435761u
                                                                                                * self->_nanosecondInterval);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_13;
  }
  v6 = [(_CPClientTimingFeedback *)self input];
  v7 = [v4 input];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(_CPClientTimingFeedback *)self input];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPClientTimingFeedback *)self input];
    v11 = [v4 input];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(_CPClientTimingFeedback *)self eventName];
  v7 = [v4 eventName];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v13 = [(_CPClientTimingFeedback *)self eventName];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(_CPClientTimingFeedback *)self eventName];
    v16 = [v4 eventName];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  unint64_t queryId = self->_queryId;
  if (queryId == [v4 queryId])
  {
    unint64_t nanosecondInterval = self->_nanosecondInterval;
    BOOL v18 = nanosecondInterval == [v4 nanosecondInterval];
    goto LABEL_14;
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  a3;
  if ([(_CPClientTimingFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPClientTimingFeedback *)self input];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_CPClientTimingFeedback *)self eventName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPClientTimingFeedback *)self queryId]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPClientTimingFeedback *)self nanosecondInterval]) {
    PBDataWriterWriteUint64Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPClientTimingFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPClientTimingFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPClientTimingFeedback;
  v2 = [(_CPClientTimingFeedback *)&v5 init];
  if (v2)
  {
    [(_CPClientTimingFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPClientTimingFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CPClientTimingFeedback;
  objc_super v5 = [(_CPClientTimingFeedback *)&v12 init];
  if (v5)
  {
    -[_CPClientTimingFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    v6 = [v4 input];

    if (v6)
    {
      v7 = [v4 input];
      [(_CPClientTimingFeedback *)v5 setInput:v7];
    }
    uint64_t v8 = [v4 eventName];

    if (v8)
    {
      v9 = [v4 eventName];
      [(_CPClientTimingFeedback *)v5 setEventName:v9];
    }
    -[_CPClientTimingFeedback setQueryId:](v5, "setQueryId:", [v4 queryId]);
    -[_CPClientTimingFeedback setNanosecondInterval:](v5, "setNanosecondInterval:", [v4 nanosecondInterval]);
    v10 = v5;
  }

  return v5;
}

@end