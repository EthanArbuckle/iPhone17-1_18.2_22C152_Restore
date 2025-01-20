@interface _CPStartLocalSearchFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)isPhotosScopedSearch;
- (BOOL)readFrom:(id)a3;
- (NSString)input;
- (NSString)originatingApp;
- (NSString)uuid;
- (_CPIndexStateForFeedback)indexState;
- (_CPPerformEntityQueryCommandForFeedback)entityQueryCommand;
- (_CPStartLocalSearchFeedback)init;
- (_CPStartLocalSearchFeedback)initWithFacade:(id)a3;
- (int)coreSpotlightIndexTypeUsed;
- (int)indexType;
- (int)searchType;
- (int)triggerEvent;
- (unint64_t)hash;
- (unint64_t)queryId;
- (unint64_t)timestamp;
- (void)setCoreSpotlightIndexTypeUsed:(int)a3;
- (void)setEntityQueryCommand:(id)a3;
- (void)setIndexState:(id)a3;
- (void)setIndexType:(int)a3;
- (void)setInput:(id)a3;
- (void)setIsPhotosScopedSearch:(BOOL)a3;
- (void)setOriginatingApp:(id)a3;
- (void)setQueryId:(unint64_t)a3;
- (void)setSearchType:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerEvent:(int)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPStartLocalSearchFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexState, 0);
  objc_storeStrong((id *)&self->_entityQueryCommand, 0);
  objc_storeStrong((id *)&self->_originatingApp, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_input, 0);
}

- (void)setIsPhotosScopedSearch:(BOOL)a3
{
  self->_isPhotosScopedSearch = a3;
}

- (BOOL)isPhotosScopedSearch
{
  return self->_isPhotosScopedSearch;
}

- (void)setCoreSpotlightIndexTypeUsed:(int)a3
{
  self->_coreSpotlightIndexTypeUsed = a3;
}

- (int)coreSpotlightIndexTypeUsed
{
  return self->_coreSpotlightIndexTypeUsed;
}

- (void)setIndexState:(id)a3
{
}

- (_CPIndexStateForFeedback)indexState
{
  return self->_indexState;
}

- (void)setEntityQueryCommand:(id)a3
{
}

- (_CPPerformEntityQueryCommandForFeedback)entityQueryCommand
{
  return self->_entityQueryCommand;
}

- (void)setOriginatingApp:(id)a3
{
}

- (NSString)originatingApp
{
  return self->_originatingApp;
}

- (void)setSearchType:(int)a3
{
  self->_searchType = a3;
}

- (int)searchType
{
  return self->_searchType;
}

- (void)setIndexType:(int)a3
{
  self->_indexType = a3;
}

- (int)indexType
{
  return self->_indexType;
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
  NSUInteger v5 = v4 ^ [(NSString *)self->_uuid hash] ^ v3 ^ (2654435761 * self->_triggerEvent) ^ (2654435761u
                                                                                               * self->_queryId);
  uint64_t v6 = (2654435761 * self->_indexType) ^ (2654435761 * self->_searchType);
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_originatingApp hash];
  unint64_t v8 = [(_CPPerformEntityQueryCommandForFeedback *)self->_entityQueryCommand hash];
  return v7 ^ v8 ^ [(_CPIndexStateForFeedback *)self->_indexState hash] ^ (2654435761
                                                                                * self->_coreSpotlightIndexTypeUsed) ^ (2654435761 * self->_isPhotosScopedSearch);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_32;
  }
  uint64_t v6 = [(_CPStartLocalSearchFeedback *)self input];
  NSUInteger v7 = [v4 input];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_31;
  }
  uint64_t v8 = [(_CPStartLocalSearchFeedback *)self input];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPStartLocalSearchFeedback *)self input];
    v11 = [v4 input];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_CPStartLocalSearchFeedback *)self uuid];
  NSUInteger v7 = [v4 uuid];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_31;
  }
  uint64_t v13 = [(_CPStartLocalSearchFeedback *)self uuid];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(_CPStartLocalSearchFeedback *)self uuid];
    v16 = [v4 uuid];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  int triggerEvent = self->_triggerEvent;
  if (triggerEvent != [v4 triggerEvent]) {
    goto LABEL_32;
  }
  unint64_t queryId = self->_queryId;
  if (queryId != [v4 queryId]) {
    goto LABEL_32;
  }
  int indexType = self->_indexType;
  if (indexType != [v4 indexType]) {
    goto LABEL_32;
  }
  int searchType = self->_searchType;
  if (searchType != [v4 searchType]) {
    goto LABEL_32;
  }
  uint64_t v6 = [(_CPStartLocalSearchFeedback *)self originatingApp];
  NSUInteger v7 = [v4 originatingApp];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(_CPStartLocalSearchFeedback *)self originatingApp];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_CPStartLocalSearchFeedback *)self originatingApp];
    v25 = [v4 originatingApp];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_CPStartLocalSearchFeedback *)self entityQueryCommand];
  NSUInteger v7 = [v4 entityQueryCommand];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(_CPStartLocalSearchFeedback *)self entityQueryCommand];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_CPStartLocalSearchFeedback *)self entityQueryCommand];
    v30 = [v4 entityQueryCommand];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_CPStartLocalSearchFeedback *)self indexState];
  NSUInteger v7 = [v4 indexState];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v32 = [(_CPStartLocalSearchFeedback *)self indexState];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_CPStartLocalSearchFeedback *)self indexState];
    v35 = [v4 indexState];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  int coreSpotlightIndexTypeUsed = self->_coreSpotlightIndexTypeUsed;
  if (coreSpotlightIndexTypeUsed == [v4 coreSpotlightIndexTypeUsed])
  {
    int isPhotosScopedSearch = self->_isPhotosScopedSearch;
    BOOL v37 = isPhotosScopedSearch == [v4 isPhotosScopedSearch];
    goto LABEL_33;
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  if ([(_CPStartLocalSearchFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPStartLocalSearchFeedback *)self input];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(_CPStartLocalSearchFeedback *)self uuid];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPStartLocalSearchFeedback *)self triggerEvent]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPStartLocalSearchFeedback *)self queryId]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPStartLocalSearchFeedback *)self indexType]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPStartLocalSearchFeedback *)self searchType]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v6 = [(_CPStartLocalSearchFeedback *)self originatingApp];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v7 = [(_CPStartLocalSearchFeedback *)self entityQueryCommand];

  if (v7)
  {
    uint64_t v8 = [(_CPStartLocalSearchFeedback *)self entityQueryCommand];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(_CPStartLocalSearchFeedback *)self indexState];

  if (v9)
  {
    v10 = [(_CPStartLocalSearchFeedback *)self indexState];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPStartLocalSearchFeedback *)self coreSpotlightIndexTypeUsed]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPStartLocalSearchFeedback *)self isPhotosScopedSearch]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPStartLocalSearchFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPStartLocalSearchFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPStartLocalSearchFeedback;
  v2 = [(_CPStartLocalSearchFeedback *)&v5 init];
  if (v2)
  {
    [(_CPStartLocalSearchFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPStartLocalSearchFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_CPStartLocalSearchFeedback;
  objc_super v5 = [(_CPStartLocalSearchFeedback *)&v22 init];
  if (v5)
  {
    -[_CPStartLocalSearchFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    uint64_t v6 = [v4 input];

    if (v6)
    {
      NSUInteger v7 = [v4 input];
      [(_CPStartLocalSearchFeedback *)v5 setInput:v7];
    }
    uint64_t v8 = [v4 uuid];

    if (v8)
    {
      v9 = [v4 uuid];
      [(_CPStartLocalSearchFeedback *)v5 setUuid:v9];
    }
    -[_CPStartLocalSearchFeedback setTriggerEvent:](v5, "setTriggerEvent:", [v4 triggerEvent]);
    -[_CPStartLocalSearchFeedback setQueryId:](v5, "setQueryId:", [v4 queryId]);
    -[_CPStartLocalSearchFeedback setIndexType:](v5, "setIndexType:", [v4 indexType]);
    -[_CPStartLocalSearchFeedback setSearchType:](v5, "setSearchType:", [v4 searchType]);
    v10 = [v4 originatingApp];

    if (v10)
    {
      id v11 = [v4 originatingApp];
      [(_CPStartLocalSearchFeedback *)v5 setOriginatingApp:v11];
    }
    int v12 = [v4 entityQueryCommand];

    if (v12)
    {
      uint64_t v13 = [_CPPerformEntityQueryCommandForFeedback alloc];
      v14 = [v4 entityQueryCommand];
      v15 = [(_CPPerformEntityQueryCommandForFeedback *)v13 initWithFacade:v14];
      [(_CPStartLocalSearchFeedback *)v5 setEntityQueryCommand:v15];
    }
    v16 = [v4 indexState];

    if (v16)
    {
      int v17 = [_CPIndexStateForFeedback alloc];
      v18 = [v4 indexState];
      v19 = [(_CPIndexStateForFeedback *)v17 initWithFacade:v18];
      [(_CPStartLocalSearchFeedback *)v5 setIndexState:v19];
    }
    -[_CPStartLocalSearchFeedback setCoreSpotlightIndexTypeUsed:](v5, "setCoreSpotlightIndexTypeUsed:", [v4 coreSpotlightIndexTypeUsed]);
    -[_CPStartLocalSearchFeedback setIsPhotosScopedSearch:](v5, "setIsPhotosScopedSearch:", [v4 isPhotosScopedSearch]);
    v20 = v5;
  }

  return v5;
}

@end