@interface _CPCardSectionEngagementFeedback
- (BOOL)destinationWasPARPunchout;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)cardSectionId;
- (NSString)parPunchoutActionTarget;
- (NSString)resultId;
- (_CPCardSectionEngagementFeedback)init;
- (_CPCardSectionEngagementFeedback)initWithFacade:(id)a3;
- (_CPCardSectionForFeedback)cardSection;
- (_CPPunchoutForFeedback)destination;
- (int)actionCardType;
- (int)actionTarget;
- (int)triggerEvent;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setActionCardType:(int)a3;
- (void)setActionTarget:(int)a3;
- (void)setCardSection:(id)a3;
- (void)setCardSectionId:(id)a3;
- (void)setDestination:(id)a3;
- (void)setDestinationWasPARPunchout:(BOOL)a3;
- (void)setParPunchoutActionTarget:(id)a3;
- (void)setResultId:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerEvent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPCardSectionEngagementFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultId, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);
  objc_storeStrong((id *)&self->_parPunchoutActionTarget, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);

  objc_storeStrong((id *)&self->_destination, 0);
}

- (void)setActionTarget:(int)a3
{
  self->_actionTarget = a3;
}

- (int)actionTarget
{
  return self->_actionTarget;
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

- (void)setParPunchoutActionTarget:(id)a3
{
}

- (NSString)parPunchoutActionTarget
{
  return self->_parPunchoutActionTarget;
}

- (void)setDestinationWasPARPunchout:(BOOL)a3
{
  self->_destinationWasPARPunchout = a3;
}

- (BOOL)destinationWasPARPunchout
{
  return self->_destinationWasPARPunchout;
}

- (void)setCardSection:(id)a3
{
}

- (_CPCardSectionForFeedback)cardSection
{
  return self->_cardSection;
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
  unint64_t v5 = [(_CPCardSectionForFeedback *)self->_cardSection hash] ^ (2654435761 * self->_destinationWasPARPunchout);
  NSUInteger v6 = v5 ^ [(NSString *)self->_parPunchoutActionTarget hash];
  NSUInteger v7 = v4 ^ v6 ^ [(NSString *)self->_cardSectionId hash];
  return v7 ^ [(NSString *)self->_resultId hash] ^ (2654435761 * self->_actionTarget);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_31;
  }
  NSUInteger v6 = [(_CPCardSectionEngagementFeedback *)self destination];
  NSUInteger v7 = [v4 destination];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_30;
  }
  uint64_t v8 = [(_CPCardSectionEngagementFeedback *)self destination];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPCardSectionEngagementFeedback *)self destination];
    v11 = [v4 destination];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  int triggerEvent = self->_triggerEvent;
  if (triggerEvent != [v4 triggerEvent]) {
    goto LABEL_31;
  }
  int actionCardType = self->_actionCardType;
  if (actionCardType != [v4 actionCardType]) {
    goto LABEL_31;
  }
  NSUInteger v6 = [(_CPCardSectionEngagementFeedback *)self cardSection];
  NSUInteger v7 = [v4 cardSection];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_30;
  }
  uint64_t v15 = [(_CPCardSectionEngagementFeedback *)self cardSection];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [(_CPCardSectionEngagementFeedback *)self cardSection];
    v18 = [v4 cardSection];
    int v19 = [v17 isEqual:v18];

    if (!v19) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  int destinationWasPARPunchout = self->_destinationWasPARPunchout;
  if (destinationWasPARPunchout != [v4 destinationWasPARPunchout]) {
    goto LABEL_31;
  }
  NSUInteger v6 = [(_CPCardSectionEngagementFeedback *)self parPunchoutActionTarget];
  NSUInteger v7 = [v4 parPunchoutActionTarget];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_30;
  }
  uint64_t v21 = [(_CPCardSectionEngagementFeedback *)self parPunchoutActionTarget];
  if (v21)
  {
    v22 = (void *)v21;
    v23 = [(_CPCardSectionEngagementFeedback *)self parPunchoutActionTarget];
    v24 = [v4 parPunchoutActionTarget];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_CPCardSectionEngagementFeedback *)self cardSectionId];
  NSUInteger v7 = [v4 cardSectionId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_30;
  }
  uint64_t v26 = [(_CPCardSectionEngagementFeedback *)self cardSectionId];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(_CPCardSectionEngagementFeedback *)self cardSectionId];
    v29 = [v4 cardSectionId];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_CPCardSectionEngagementFeedback *)self resultId];
  NSUInteger v7 = [v4 resultId];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v31 = [(_CPCardSectionEngagementFeedback *)self resultId];
  if (!v31)
  {

LABEL_34:
    int actionTarget = self->_actionTarget;
    BOOL v36 = actionTarget == [v4 actionTarget];
    goto LABEL_32;
  }
  v32 = (void *)v31;
  v33 = [(_CPCardSectionEngagementFeedback *)self resultId];
  v34 = [v4 resultId];
  int v35 = [v33 isEqual:v34];

  if (v35) {
    goto LABEL_34;
  }
LABEL_31:
  BOOL v36 = 0;
LABEL_32:

  return v36;
}

- (void)writeTo:(id)a3
{
  a3;
  if ([(_CPCardSectionEngagementFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPCardSectionEngagementFeedback *)self destination];

  if (v4)
  {
    unint64_t v5 = [(_CPCardSectionEngagementFeedback *)self destination];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPCardSectionEngagementFeedback *)self triggerEvent]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPCardSectionEngagementFeedback *)self actionCardType]) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v6 = [(_CPCardSectionEngagementFeedback *)self cardSection];

  if (v6)
  {
    NSUInteger v7 = [(_CPCardSectionEngagementFeedback *)self cardSection];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPCardSectionEngagementFeedback *)self destinationWasPARPunchout]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v8 = [(_CPCardSectionEngagementFeedback *)self parPunchoutActionTarget];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  v9 = [(_CPCardSectionEngagementFeedback *)self cardSectionId];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  v10 = [(_CPCardSectionEngagementFeedback *)self resultId];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPCardSectionEngagementFeedback *)self actionTarget]) {
    PBDataWriterWriteInt32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPCardSectionEngagementFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPCardSectionEngagementFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPCardSectionEngagementFeedback;
  v2 = [(_CPCardSectionEngagementFeedback *)&v5 init];
  if (v2)
  {
    [(_CPCardSectionEngagementFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPCardSectionEngagementFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_CPCardSectionEngagementFeedback;
  objc_super v5 = [(_CPCardSectionEngagementFeedback *)&v20 init];
  if (v5)
  {
    -[_CPCardSectionEngagementFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    NSUInteger v6 = [v4 destination];

    if (v6)
    {
      NSUInteger v7 = [_CPPunchoutForFeedback alloc];
      uint64_t v8 = [v4 destination];
      v9 = [(_CPPunchoutForFeedback *)v7 initWithFacade:v8];
      [(_CPCardSectionEngagementFeedback *)v5 setDestination:v9];
    }
    -[_CPCardSectionEngagementFeedback setTriggerEvent:](v5, "setTriggerEvent:", [v4 triggerEvent]);
    -[_CPCardSectionEngagementFeedback setActionCardType:](v5, "setActionCardType:", [v4 actionCardType]);
    v10 = [v4 cardSection];

    if (v10)
    {
      v11 = [_CPCardSectionForFeedback alloc];
      int v12 = [v4 cardSection];
      v13 = [(_CPCardSectionForFeedback *)v11 initWithFacade:v12];
      [(_CPCardSectionEngagementFeedback *)v5 setCardSection:v13];
    }
    v14 = [v4 cardSectionId];

    if (v14)
    {
      uint64_t v15 = [v4 cardSectionId];
      [(_CPCardSectionEngagementFeedback *)v5 setCardSectionId:v15];
    }
    v16 = [v4 resultId];

    if (v16)
    {
      v17 = [v4 resultId];
      [(_CPCardSectionEngagementFeedback *)v5 setResultId:v17];
    }
    -[_CPCardSectionEngagementFeedback setActionTarget:](v5, "setActionTarget:", [v4 actionTarget]);
    v18 = v5;
  }

  return v5;
}

@end