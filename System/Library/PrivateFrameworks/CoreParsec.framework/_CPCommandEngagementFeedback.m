@interface _CPCommandEngagementFeedback
- (BOOL)didDisplayHandleOptions;
- (BOOL)didSelectFromOptionsMenu;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)cardSectionId;
- (NSString)commandDetail;
- (NSString)resultSectionId;
- (_CPCommandEngagementFeedback)init;
- (_CPCommandEngagementFeedback)initWithFacade:(id)a3;
- (_CPPhotosAttributes)photosAttributes;
- (_CPSearchResultForFeedback)result;
- (int)commandType;
- (int)contactActionType;
- (int)triggerEvent;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unint64_t)uniqueButtonId;
- (void)setCardSectionId:(id)a3;
- (void)setCommandDetail:(id)a3;
- (void)setCommandType:(int)a3;
- (void)setContactActionType:(int)a3;
- (void)setDidDisplayHandleOptions:(BOOL)a3;
- (void)setDidSelectFromOptionsMenu:(BOOL)a3;
- (void)setPhotosAttributes:(id)a3;
- (void)setResult:(id)a3;
- (void)setResultSectionId:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerEvent:(int)a3;
- (void)setUniqueButtonId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPCommandEngagementFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosAttributes, 0);
  objc_storeStrong((id *)&self->_resultSectionId, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);

  objc_storeStrong((id *)&self->_commandDetail, 0);
}

- (void)setPhotosAttributes:(id)a3
{
}

- (_CPPhotosAttributes)photosAttributes
{
  return self->_photosAttributes;
}

- (void)setDidSelectFromOptionsMenu:(BOOL)a3
{
  self->_didSelectFromOptionsMenu = a3;
}

- (BOOL)didSelectFromOptionsMenu
{
  return self->_didSelectFromOptionsMenu;
}

- (void)setDidDisplayHandleOptions:(BOOL)a3
{
  self->_didDisplayHandleOptions = a3;
}

- (BOOL)didDisplayHandleOptions
{
  return self->_didDisplayHandleOptions;
}

- (void)setContactActionType:(int)a3
{
  self->_contactActionType = a3;
}

- (int)contactActionType
{
  return self->_contactActionType;
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setResultSectionId:(id)a3
{
}

- (NSString)resultSectionId
{
  return self->_resultSectionId;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setResult:(id)a3
{
}

- (_CPSearchResultForFeedback)result
{
  return self->_result;
}

- (void)setCardSectionId:(id)a3
{
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (void)setUniqueButtonId:(unint64_t)a3
{
  self->_uniqueButtonId = a3;
}

- (unint64_t)uniqueButtonId
{
  return self->_uniqueButtonId;
}

- (void)setCommandDetail:(id)a3
{
}

- (NSString)commandDetail
{
  return self->_commandDetail;
}

- (void)setCommandType:(int)a3
{
  self->_commandType = a3;
}

- (int)commandType
{
  return self->_commandType;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_commandType;
  NSUInteger v4 = [(NSString *)self->_commandDetail hash] ^ v3;
  unint64_t v5 = 2654435761u * self->_uniqueButtonId;
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_cardSectionId hash];
  unint64_t v7 = [(_CPSearchResultForFeedback *)self->_result hash] ^ (2654435761u * self->_timestamp);
  NSUInteger v8 = v6 ^ v7 ^ [(NSString *)self->_resultSectionId hash] ^ (2654435761 * self->_triggerEvent) ^ (2654435761 * self->_contactActionType) ^ (2654435761 * self->_didDisplayHandleOptions) ^ (2654435761 * self->_didSelectFromOptionsMenu);
  return v8 ^ [(_CPPhotosAttributes *)self->_photosAttributes hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  int commandType = self->_commandType;
  if (commandType != [v4 commandType]) {
    goto LABEL_34;
  }
  NSUInteger v6 = [(_CPCommandEngagementFeedback *)self commandDetail];
  unint64_t v7 = [v4 commandDetail];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_33;
  }
  uint64_t v8 = [(_CPCommandEngagementFeedback *)self commandDetail];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPCommandEngagementFeedback *)self commandDetail];
    v11 = [v4 commandDetail];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  unint64_t uniqueButtonId = self->_uniqueButtonId;
  if (uniqueButtonId != [v4 uniqueButtonId]) {
    goto LABEL_34;
  }
  NSUInteger v6 = [(_CPCommandEngagementFeedback *)self cardSectionId];
  unint64_t v7 = [v4 cardSectionId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_33;
  }
  uint64_t v14 = [(_CPCommandEngagementFeedback *)self cardSectionId];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_CPCommandEngagementFeedback *)self cardSectionId];
    v17 = [v4 cardSectionId];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_CPCommandEngagementFeedback *)self result];
  unint64_t v7 = [v4 result];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_33;
  }
  uint64_t v19 = [(_CPCommandEngagementFeedback *)self result];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_CPCommandEngagementFeedback *)self result];
    v22 = [v4 result];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_34;
  }
  NSUInteger v6 = [(_CPCommandEngagementFeedback *)self resultSectionId];
  unint64_t v7 = [v4 resultSectionId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_33;
  }
  uint64_t v25 = [(_CPCommandEngagementFeedback *)self resultSectionId];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [(_CPCommandEngagementFeedback *)self resultSectionId];
    v28 = [v4 resultSectionId];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  int triggerEvent = self->_triggerEvent;
  if (triggerEvent != [v4 triggerEvent]) {
    goto LABEL_34;
  }
  int contactActionType = self->_contactActionType;
  if (contactActionType != [v4 contactActionType]) {
    goto LABEL_34;
  }
  int didDisplayHandleOptions = self->_didDisplayHandleOptions;
  if (didDisplayHandleOptions != [v4 didDisplayHandleOptions]) {
    goto LABEL_34;
  }
  int didSelectFromOptionsMenu = self->_didSelectFromOptionsMenu;
  if (didSelectFromOptionsMenu != [v4 didSelectFromOptionsMenu]) {
    goto LABEL_34;
  }
  NSUInteger v6 = [(_CPCommandEngagementFeedback *)self photosAttributes];
  unint64_t v7 = [v4 photosAttributes];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_33:

    goto LABEL_34;
  }
  uint64_t v34 = [(_CPCommandEngagementFeedback *)self photosAttributes];
  if (!v34)
  {

LABEL_37:
    BOOL v39 = 1;
    goto LABEL_35;
  }
  v35 = (void *)v34;
  v36 = [(_CPCommandEngagementFeedback *)self photosAttributes];
  v37 = [v4 photosAttributes];
  char v38 = [v36 isEqual:v37];

  if (v38) {
    goto LABEL_37;
  }
LABEL_34:
  BOOL v39 = 0;
LABEL_35:

  return v39;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  if ([(_CPCommandEngagementFeedback *)self commandType]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_CPCommandEngagementFeedback *)self commandDetail];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPCommandEngagementFeedback *)self uniqueButtonId]) {
    PBDataWriterWriteUint64Field();
  }
  unint64_t v5 = [(_CPCommandEngagementFeedback *)self cardSectionId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v6 = [(_CPCommandEngagementFeedback *)self result];

  if (v6)
  {
    unint64_t v7 = [(_CPCommandEngagementFeedback *)self result];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPCommandEngagementFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  uint64_t v8 = [(_CPCommandEngagementFeedback *)self resultSectionId];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPCommandEngagementFeedback *)self triggerEvent]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPCommandEngagementFeedback *)self contactActionType]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPCommandEngagementFeedback *)self didDisplayHandleOptions]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPCommandEngagementFeedback *)self didSelectFromOptionsMenu]) {
    PBDataWriterWriteBOOLField();
  }
  v9 = [(_CPCommandEngagementFeedback *)self photosAttributes];

  v10 = v12;
  if (v9)
  {
    v11 = [(_CPCommandEngagementFeedback *)self photosAttributes];
    PBDataWriterWriteSubmessage();

    v10 = v12;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPCommandEngagementFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPCommandEngagementFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPCommandEngagementFeedback;
  v2 = [(_CPCommandEngagementFeedback *)&v5 init];
  if (v2)
  {
    [(_CPCommandEngagementFeedback *)v2 setTimestamp:mach_absolute_time()];
    uint64_t v3 = v2;
  }

  return v2;
}

- (_CPCommandEngagementFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_CPCommandEngagementFeedback *)self init];
  if (v5)
  {
    NSUInteger v6 = [v4 command];
    -[_CPCommandEngagementFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    unint64_t v7 = [v4 result];

    if (v7)
    {
      uint64_t v8 = [_CPSearchResultForFeedback alloc];
      v9 = [v4 result];
      v10 = [(_CPSearchResultForFeedback *)v8 initWithFacade:v9];
      [(_CPCommandEngagementFeedback *)v5 setResult:v10];
    }
    v11 = [v4 button];

    if (v11)
    {
      id v12 = [v4 button];
      -[_CPCommandEngagementFeedback setUniqueButtonId:](v5, "setUniqueButtonId:", [v12 uniqueId]);
    }
    v13 = [v4 command];

    if (v13)
    {
      -[_CPCommandEngagementFeedback setCommandType:](v5, "setCommandType:", [v6 _cpCommandType]);
      uint64_t v14 = [v6 commandDetail];
      [(_CPCommandEngagementFeedback *)v5 setCommandDetail:v14];
    }
    v15 = [v4 cardSection];

    if (v15)
    {
      v16 = [v4 cardSection];
      v17 = [v16 cardSectionId];
      [(_CPCommandEngagementFeedback *)v5 setCardSectionId:v17];
    }
    int v18 = [v4 resultSection];

    if (v18)
    {
      uint64_t v19 = [v4 resultSection];
      v20 = [v19 identifier];
      [(_CPCommandEngagementFeedback *)v5 setResultSectionId:v20];
    }
    -[_CPCommandEngagementFeedback setTriggerEvent:](v5, "setTriggerEvent:", [v4 triggerEvent]);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = v6;
      -[_CPCommandEngagementFeedback setContactActionType:](v5, "setContactActionType:", [v21 contactActionType]);
      -[_CPCommandEngagementFeedback setDidDisplayHandleOptions:](v5, "setDidDisplayHandleOptions:", [v21 didDisplayHandleOptions]);
      uint64_t v22 = [v21 didSelectFromOptionsMenu];

      [(_CPCommandEngagementFeedback *)v5 setDidSelectFromOptionsMenu:v22];
    }
    int v23 = v5;
  }
  return v5;
}

@end