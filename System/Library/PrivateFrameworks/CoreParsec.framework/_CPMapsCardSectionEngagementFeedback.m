@interface _CPMapsCardSectionEngagementFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)cardSectionId;
- (NSString)resultId;
- (_CPMapsCardSectionEngagementFeedback)init;
- (_CPMapsCardSectionEngagementFeedback)initWithFacade:(id)a3;
- (_CPPunchoutForFeedback)destination;
- (int)actionCardType;
- (int)feedbackType;
- (int)triggerEvent;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setActionCardType:(int)a3;
- (void)setCardSectionId:(id)a3;
- (void)setDestination:(id)a3;
- (void)setFeedbackType:(int)a3;
- (void)setResultId:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerEvent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPMapsCardSectionEngagementFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultId, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);

  objc_storeStrong((id *)&self->_destination, 0);
}

- (void)setResultId:(id)a3
{
}

- (NSString)resultId
{
  return self->_resultId;
}

- (void)setCardSectionId:(id)a3
{
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (void)setFeedbackType:(int)a3
{
  self->_feedbackType = a3;
}

- (int)feedbackType
{
  return self->_feedbackType;
}

- (void)setActionCardType:(int)a3
{
  self->_actionCardType = a3;
}

- (int)actionCardType
{
  return self->_actionCardType;
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setDestination:(id)a3
{
}

- (_CPPunchoutForFeedback)destination
{
  return self->_destination;
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
  unint64_t v4 = [(_CPPunchoutForFeedback *)self->_destination hash] ^ v3 ^ (2654435761 * self->_triggerEvent) ^ (2654435761 * self->_actionCardType);
  uint64_t v5 = 2654435761 * self->_feedbackType;
  NSUInteger v6 = v5 ^ [(NSString *)self->_cardSectionId hash];
  return v4 ^ v6 ^ [(NSString *)self->_resultId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_21;
  }
  NSUInteger v6 = [(_CPMapsCardSectionEngagementFeedback *)self destination];
  v7 = [v4 destination];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_20;
  }
  uint64_t v8 = [(_CPMapsCardSectionEngagementFeedback *)self destination];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPMapsCardSectionEngagementFeedback *)self destination];
    v11 = [v4 destination];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  int triggerEvent = self->_triggerEvent;
  if (triggerEvent != [v4 triggerEvent]) {
    goto LABEL_21;
  }
  int actionCardType = self->_actionCardType;
  if (actionCardType != [v4 actionCardType]) {
    goto LABEL_21;
  }
  int feedbackType = self->_feedbackType;
  if (feedbackType != [v4 feedbackType]) {
    goto LABEL_21;
  }
  NSUInteger v6 = [(_CPMapsCardSectionEngagementFeedback *)self cardSectionId];
  v7 = [v4 cardSectionId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_20;
  }
  uint64_t v16 = [(_CPMapsCardSectionEngagementFeedback *)self cardSectionId];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(_CPMapsCardSectionEngagementFeedback *)self cardSectionId];
    v19 = [v4 cardSectionId];
    int v20 = [v18 isEqual:v19];

    if (!v20) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_CPMapsCardSectionEngagementFeedback *)self resultId];
  v7 = [v4 resultId];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v21 = [(_CPMapsCardSectionEngagementFeedback *)self resultId];
    if (!v21)
    {

LABEL_24:
      BOOL v26 = 1;
      goto LABEL_22;
    }
    v22 = (void *)v21;
    v23 = [(_CPMapsCardSectionEngagementFeedback *)self resultId];
    v24 = [v4 resultId];
    char v25 = [v23 isEqual:v24];

    if (v25) {
      goto LABEL_24;
    }
  }
  else
  {
LABEL_20:
  }
LABEL_21:
  BOOL v26 = 0;
LABEL_22:

  return v26;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  if ([(_CPMapsCardSectionEngagementFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPMapsCardSectionEngagementFeedback *)self destination];

  if (v4)
  {
    uint64_t v5 = [(_CPMapsCardSectionEngagementFeedback *)self destination];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPMapsCardSectionEngagementFeedback *)self triggerEvent]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPMapsCardSectionEngagementFeedback *)self actionCardType]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPMapsCardSectionEngagementFeedback *)self feedbackType]) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v6 = [(_CPMapsCardSectionEngagementFeedback *)self cardSectionId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  v7 = [(_CPMapsCardSectionEngagementFeedback *)self resultId];

  uint64_t v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    uint64_t v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPMapsCardSectionEngagementFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPMapsCardSectionEngagementFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPMapsCardSectionEngagementFeedback;
  v2 = [(_CPMapsCardSectionEngagementFeedback *)&v5 init];
  if (v2)
  {
    [(_CPMapsCardSectionEngagementFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPMapsCardSectionEngagementFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_CPMapsCardSectionEngagementFeedback;
  objc_super v5 = [(_CPMapsCardSectionEngagementFeedback *)&v16 init];
  if (v5)
  {
    -[_CPMapsCardSectionEngagementFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    NSUInteger v6 = [v4 destination];

    if (v6)
    {
      v7 = [_CPPunchoutForFeedback alloc];
      uint64_t v8 = [v4 destination];
      id v9 = [(_CPPunchoutForFeedback *)v7 initWithFacade:v8];
      [(_CPMapsCardSectionEngagementFeedback *)v5 setDestination:v9];
    }
    -[_CPMapsCardSectionEngagementFeedback setTriggerEvent:](v5, "setTriggerEvent:", [v4 triggerEvent]);
    -[_CPMapsCardSectionEngagementFeedback setActionCardType:](v5, "setActionCardType:", [v4 actionCardType]);
    -[_CPMapsCardSectionEngagementFeedback setFeedbackType:](v5, "setFeedbackType:", [v4 feedbackType]);
    v10 = [v4 cardSectionId];

    if (v10)
    {
      v11 = [v4 cardSectionId];
      [(_CPMapsCardSectionEngagementFeedback *)v5 setCardSectionId:v11];
    }
    int v12 = [v4 resultId];

    if (v12)
    {
      v13 = [v4 resultId];
      [(_CPMapsCardSectionEngagementFeedback *)v5 setResultId:v13];
    }
    v14 = v5;
  }

  return v5;
}

@end