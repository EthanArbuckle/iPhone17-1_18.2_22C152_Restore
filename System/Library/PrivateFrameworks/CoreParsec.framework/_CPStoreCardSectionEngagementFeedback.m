@interface _CPStoreCardSectionEngagementFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)cardSectionId;
- (NSString)resultId;
- (_CPCardSectionForFeedback)cardSection;
- (_CPPunchoutForFeedback)destination;
- (_CPStoreCardSectionEngagementFeedback)init;
- (_CPStoreCardSectionEngagementFeedback)initWithFacade:(id)a3;
- (int)actionCardType;
- (int)productPageResult;
- (int)triggerEvent;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setActionCardType:(int)a3;
- (void)setCardSection:(id)a3;
- (void)setCardSectionId:(id)a3;
- (void)setDestination:(id)a3;
- (void)setProductPageResult:(int)a3;
- (void)setResultId:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerEvent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPStoreCardSectionEngagementFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultId, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);

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

- (void)setProductPageResult:(int)a3
{
  self->_productPageResult = a3;
}

- (int)productPageResult
{
  return self->_productPageResult;
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
  unint64_t v5 = [(_CPCardSectionForFeedback *)self->_cardSection hash] ^ (2654435761 * self->_productPageResult);
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_cardSectionId hash];
  return v6 ^ [(NSString *)self->_resultId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_26;
  }
  NSUInteger v6 = [(_CPStoreCardSectionEngagementFeedback *)self destination];
  v7 = [v4 destination];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_25;
  }
  uint64_t v8 = [(_CPStoreCardSectionEngagementFeedback *)self destination];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPStoreCardSectionEngagementFeedback *)self destination];
    v11 = [v4 destination];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  int triggerEvent = self->_triggerEvent;
  if (triggerEvent != [v4 triggerEvent]) {
    goto LABEL_26;
  }
  int actionCardType = self->_actionCardType;
  if (actionCardType != [v4 actionCardType]) {
    goto LABEL_26;
  }
  NSUInteger v6 = [(_CPStoreCardSectionEngagementFeedback *)self cardSection];
  v7 = [v4 cardSection];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_25;
  }
  uint64_t v15 = [(_CPStoreCardSectionEngagementFeedback *)self cardSection];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [(_CPStoreCardSectionEngagementFeedback *)self cardSection];
    v18 = [v4 cardSection];
    int v19 = [v17 isEqual:v18];

    if (!v19) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  int productPageResult = self->_productPageResult;
  if (productPageResult != [v4 productPageResult]) {
    goto LABEL_26;
  }
  NSUInteger v6 = [(_CPStoreCardSectionEngagementFeedback *)self cardSectionId];
  v7 = [v4 cardSectionId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_25;
  }
  uint64_t v21 = [(_CPStoreCardSectionEngagementFeedback *)self cardSectionId];
  if (v21)
  {
    v22 = (void *)v21;
    v23 = [(_CPStoreCardSectionEngagementFeedback *)self cardSectionId];
    v24 = [v4 cardSectionId];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_CPStoreCardSectionEngagementFeedback *)self resultId];
  v7 = [v4 resultId];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v26 = [(_CPStoreCardSectionEngagementFeedback *)self resultId];
  if (!v26)
  {

LABEL_29:
    BOOL v31 = 1;
    goto LABEL_27;
  }
  v27 = (void *)v26;
  v28 = [(_CPStoreCardSectionEngagementFeedback *)self resultId];
  v29 = [v4 resultId];
  char v30 = [v28 isEqual:v29];

  if (v30) {
    goto LABEL_29;
  }
LABEL_26:
  BOOL v31 = 0;
LABEL_27:

  return v31;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  if ([(_CPStoreCardSectionEngagementFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPStoreCardSectionEngagementFeedback *)self destination];

  if (v4)
  {
    unint64_t v5 = [(_CPStoreCardSectionEngagementFeedback *)self destination];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPStoreCardSectionEngagementFeedback *)self triggerEvent]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPStoreCardSectionEngagementFeedback *)self actionCardType]) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v6 = [(_CPStoreCardSectionEngagementFeedback *)self cardSection];

  if (v6)
  {
    v7 = [(_CPStoreCardSectionEngagementFeedback *)self cardSection];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPStoreCardSectionEngagementFeedback *)self productPageResult]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v8 = [(_CPStoreCardSectionEngagementFeedback *)self cardSectionId];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  v9 = [(_CPStoreCardSectionEngagementFeedback *)self resultId];

  v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    v10 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPStoreCardSectionEngagementFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPStoreCardSectionEngagementFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPStoreCardSectionEngagementFeedback;
  v2 = [(_CPStoreCardSectionEngagementFeedback *)&v5 init];
  if (v2)
  {
    [(_CPStoreCardSectionEngagementFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPStoreCardSectionEngagementFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_CPStoreCardSectionEngagementFeedback;
  objc_super v5 = [(_CPStoreCardSectionEngagementFeedback *)&v20 init];
  if (v5)
  {
    -[_CPStoreCardSectionEngagementFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    NSUInteger v6 = [v4 destination];

    if (v6)
    {
      v7 = [_CPPunchoutForFeedback alloc];
      uint64_t v8 = [v4 destination];
      v9 = [(_CPPunchoutForFeedback *)v7 initWithFacade:v8];
      [(_CPStoreCardSectionEngagementFeedback *)v5 setDestination:v9];
    }
    -[_CPStoreCardSectionEngagementFeedback setTriggerEvent:](v5, "setTriggerEvent:", [v4 triggerEvent]);
    -[_CPStoreCardSectionEngagementFeedback setActionCardType:](v5, "setActionCardType:", [v4 actionCardType]);
    v10 = [v4 cardSection];

    if (v10)
    {
      id v11 = [_CPCardSectionForFeedback alloc];
      int v12 = [v4 cardSection];
      v13 = [(_CPCardSectionForFeedback *)v11 initWithFacade:v12];
      [(_CPStoreCardSectionEngagementFeedback *)v5 setCardSection:v13];
    }
    -[_CPStoreCardSectionEngagementFeedback setProductPageResult:](v5, "setProductPageResult:", [v4 productPageResult]);
    v14 = [v4 cardSectionId];

    if (v14)
    {
      uint64_t v15 = [v4 cardSectionId];
      [(_CPStoreCardSectionEngagementFeedback *)v5 setCardSectionId:v15];
    }
    v16 = [v4 resultId];

    if (v16)
    {
      v17 = [v4 resultId];
      [(_CPStoreCardSectionEngagementFeedback *)v5 setResultId:v17];
    }
    v18 = v5;
  }

  return v5;
}

@end