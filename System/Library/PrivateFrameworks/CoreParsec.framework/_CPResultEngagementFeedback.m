@interface _CPResultEngagementFeedback
- (BOOL)actionEngaged;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesUnengagedSuggestion;
- (BOOL)readFrom:(id)a3;
- (NSString)titleText;
- (_CPResultEngagementFeedback)init;
- (_CPResultEngagementFeedback)initWithFacade:(id)a3;
- (_CPSearchResultForFeedback)result;
- (int)actionTarget;
- (int)destination;
- (int)triggerEvent;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setActionEngaged:(BOOL)a3;
- (void)setActionTarget:(int)a3;
- (void)setDestination:(int)a3;
- (void)setMatchesUnengagedSuggestion:(BOOL)a3;
- (void)setResult:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTitleText:(id)a3;
- (void)setTriggerEvent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPResultEngagementFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

- (void)setMatchesUnengagedSuggestion:(BOOL)a3
{
  self->_matchesUnengagedSuggestion = a3;
}

- (BOOL)matchesUnengagedSuggestion
{
  return self->_matchesUnengagedSuggestion;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setResult:(id)a3
{
}

- (_CPSearchResultForFeedback)result
{
  return self->_result;
}

- (void)setActionTarget:(int)a3
{
  self->_actionTarget = a3;
}

- (int)actionTarget
{
  return self->_actionTarget;
}

- (void)setDestination:(int)a3
{
  self->_destination = a3;
}

- (int)destination
{
  return self->_destination;
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setActionEngaged:(BOOL)a3
{
  self->_actionEngaged = a3;
}

- (BOOL)actionEngaged
{
  return self->_actionEngaged;
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
  unint64_t v3 = (2654435761 * self->_actionEngaged) ^ (2654435761u * self->_timestamp) ^ (2654435761 * self->_triggerEvent) ^ (2654435761 * self->_destination);
  uint64_t v4 = 2654435761 * self->_actionTarget;
  unint64_t v5 = v4 ^ [(_CPSearchResultForFeedback *)self->_result hash];
  return v3 ^ v5 ^ [(NSString *)self->_titleText hash] ^ (2654435761 * self->_matchesUnengagedSuggestion);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_17;
  }
  int actionEngaged = self->_actionEngaged;
  if (actionEngaged != [v4 actionEngaged]) {
    goto LABEL_17;
  }
  int triggerEvent = self->_triggerEvent;
  if (triggerEvent != [v4 triggerEvent]) {
    goto LABEL_17;
  }
  int destination = self->_destination;
  if (destination != [v4 destination]) {
    goto LABEL_17;
  }
  int actionTarget = self->_actionTarget;
  if (actionTarget != [v4 actionTarget]) {
    goto LABEL_17;
  }
  v10 = [(_CPResultEngagementFeedback *)self result];
  v11 = [v4 result];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_CPResultEngagementFeedback *)self result];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_CPResultEngagementFeedback *)self result];
    v15 = [v4 result];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v10 = [(_CPResultEngagementFeedback *)self titleText];
  v11 = [v4 titleText];
  if ((v10 == 0) != (v11 != 0))
  {
    uint64_t v17 = [(_CPResultEngagementFeedback *)self titleText];
    if (!v17)
    {

LABEL_20:
      int matchesUnengagedSuggestion = self->_matchesUnengagedSuggestion;
      BOOL v22 = matchesUnengagedSuggestion == [v4 matchesUnengagedSuggestion];
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_CPResultEngagementFeedback *)self titleText];
    v20 = [v4 titleText];
    int v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_CPResultEngagementFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPResultEngagementFeedback *)self actionEngaged]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPResultEngagementFeedback *)self triggerEvent]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPResultEngagementFeedback *)self destination]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPResultEngagementFeedback *)self actionTarget]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_CPResultEngagementFeedback *)self result];

  if (v4)
  {
    unint64_t v5 = [(_CPResultEngagementFeedback *)self result];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(_CPResultEngagementFeedback *)self titleText];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPResultEngagementFeedback *)self matchesUnengagedSuggestion]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPResultEngagementFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPResultEngagementFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPResultEngagementFeedback;
  v2 = [(_CPResultEngagementFeedback *)&v5 init];
  if (v2)
  {
    [(_CPResultEngagementFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPResultEngagementFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_CPResultEngagementFeedback;
  objc_super v5 = [(_CPResultEngagementFeedback *)&v15 init];
  if (v5)
  {
    -[_CPResultEngagementFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    -[_CPResultEngagementFeedback setActionEngaged:](v5, "setActionEngaged:", [v4 actionEngaged]);
    -[_CPResultEngagementFeedback setTriggerEvent:](v5, "setTriggerEvent:", [v4 triggerEvent]);
    -[_CPResultEngagementFeedback setDestination:](v5, "setDestination:", [v4 destination]);
    -[_CPResultEngagementFeedback setActionTarget:](v5, "setActionTarget:", [v4 actionTarget]);
    v6 = [v4 result];

    if (v6)
    {
      id v7 = [_CPSearchResultForFeedback alloc];
      v8 = [v4 result];
      v9 = [(_CPSearchResultForFeedback *)v7 initWithFacade:v8];
      [(_CPResultEngagementFeedback *)v5 setResult:v9];
    }
    v10 = [v4 result];
    v11 = [v10 title];
    uint64_t v12 = [v11 text];
    [(_CPResultEngagementFeedback *)v5 setTitleText:v12];

    -[_CPResultEngagementFeedback setMatchesUnengagedSuggestion:](v5, "setMatchesUnengagedSuggestion:", [v4 matchesUnengagedSuggestion]);
    v13 = v5;
  }

  return v5;
}

@end