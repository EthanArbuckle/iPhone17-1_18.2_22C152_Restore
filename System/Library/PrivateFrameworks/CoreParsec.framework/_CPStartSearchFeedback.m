@interface _CPStartSearchFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)input;
- (NSString)uuid;
- (_CPStartSearchFeedback)init;
- (_CPStartSearchFeedback)initWithFacade:(id)a3;
- (int)searchType;
- (int)triggerEvent;
- (unint64_t)hash;
- (unint64_t)queryId;
- (unint64_t)timestamp;
- (void)setInput:(id)a3;
- (void)setQueryId:(unint64_t)a3;
- (void)setSearchType:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerEvent:(int)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPStartSearchFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_input, 0);
}

- (void)setSearchType:(int)a3
{
  self->_searchType = a3;
}

- (int)searchType
{
  return self->_searchType;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
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
  return v4 ^ [(NSString *)self->_uuid hash] ^ v3 ^ (2654435761 * self->_triggerEvent) ^ (2654435761u
                                                                                                 * self->_queryId) ^ (2654435761 * self->_searchType);
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
  v6 = [(_CPStartSearchFeedback *)self input];
  v7 = [v4 input];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(_CPStartSearchFeedback *)self input];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPStartSearchFeedback *)self input];
    v11 = [v4 input];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(_CPStartSearchFeedback *)self uuid];
  v7 = [v4 uuid];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v13 = [(_CPStartSearchFeedback *)self uuid];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(_CPStartSearchFeedback *)self uuid];
    v16 = [v4 uuid];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  int triggerEvent = self->_triggerEvent;
  if (triggerEvent == [v4 triggerEvent])
  {
    unint64_t queryId = self->_queryId;
    if (queryId == [v4 queryId])
    {
      int searchType = self->_searchType;
      BOOL v18 = searchType == [v4 searchType];
      goto LABEL_14;
    }
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  a3;
  if ([(_CPStartSearchFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPStartSearchFeedback *)self input];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_CPStartSearchFeedback *)self uuid];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPStartSearchFeedback *)self triggerEvent]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPStartSearchFeedback *)self queryId]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPStartSearchFeedback *)self searchType]) {
    PBDataWriterWriteInt32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPStartSearchFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPStartSearchFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPStartSearchFeedback;
  v2 = [(_CPStartSearchFeedback *)&v5 init];
  if (v2)
  {
    [(_CPStartSearchFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPStartSearchFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CPStartSearchFeedback;
  objc_super v5 = [(_CPStartSearchFeedback *)&v12 init];
  if (v5)
  {
    -[_CPStartSearchFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    v6 = [v4 input];

    if (v6)
    {
      v7 = [v4 input];
      [(_CPStartSearchFeedback *)v5 setInput:v7];
    }
    uint64_t v8 = [v4 uuid];

    if (v8)
    {
      v9 = [v4 uuid];
      [(_CPStartSearchFeedback *)v5 setUuid:v9];
    }
    -[_CPStartSearchFeedback setTriggerEvent:](v5, "setTriggerEvent:", [v4 triggerEvent]);
    -[_CPStartSearchFeedback setQueryId:](v5, "setQueryId:", [v4 queryId]);
    -[_CPStartSearchFeedback setSearchType:](v5, "setSearchType:", [v4 searchType]);
    v10 = v5;
  }

  return v5;
}

@end