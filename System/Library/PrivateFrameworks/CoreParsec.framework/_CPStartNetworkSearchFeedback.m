@interface _CPStartNetworkSearchFeedback
+ (id)startSearchFeedbackWithUUID;
- (BOOL)getHeaders:(id *)a3 forKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)bodyData;
- (NSDictionary)headers;
- (NSString)experimentId;
- (NSString)input;
- (NSString)treatmentId;
- (NSString)url;
- (NSString)uuid;
- (_CPStartNetworkSearchFeedback)init;
- (_CPStartNetworkSearchFeedback)initWithFacade:(id)a3;
- (int)endpoint;
- (int)lookupSelectionType;
- (int)searchType;
- (int)triggerEvent;
- (unint64_t)compressedRequestSize;
- (unint64_t)hash;
- (unint64_t)queryId;
- (unint64_t)rawRequestSize;
- (unint64_t)timestamp;
- (unint64_t)whichTrigger;
- (void)clearTrigger;
- (void)setBodyData:(id)a3;
- (void)setCompressedRequestSize:(unint64_t)a3;
- (void)setEndpoint:(int)a3;
- (void)setExperimentId:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setHeaders:(id)a3 forKey:(id)a4;
- (void)setInput:(id)a3;
- (void)setLookupSelectionType:(int)a3;
- (void)setQueryId:(unint64_t)a3;
- (void)setRawRequestSize:(unint64_t)a3;
- (void)setSearchType:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTreatmentId:(id)a3;
- (void)setTriggerEvent:(int)a3;
- (void)setUrl:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPStartNetworkSearchFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_input, 0);
}

- (unint64_t)whichTrigger
{
  return self->_whichTrigger;
}

- (void)setCompressedRequestSize:(unint64_t)a3
{
  self->_compressedRequestSize = a3;
}

- (unint64_t)compressedRequestSize
{
  return self->_compressedRequestSize;
}

- (void)setRawRequestSize:(unint64_t)a3
{
  self->_rawRequestSize = a3;
}

- (unint64_t)rawRequestSize
{
  return self->_rawRequestSize;
}

- (void)setSearchType:(int)a3
{
  self->_searchType = a3;
}

- (int)searchType
{
  return self->_searchType;
}

- (void)setTreatmentId:(id)a3
{
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setBodyData:(id)a3
{
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (void)setEndpoint:(int)a3
{
  self->_endpoint = a3;
}

- (int)endpoint
{
  return self->_endpoint;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setUrl:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (unint64_t)queryId
{
  return self->_queryId;
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
  NSUInteger v5 = v4 ^ [(NSString *)self->_uuid hash] ^ v3;
  unint64_t v6 = 2654435761u * self->_queryId;
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_url hash];
  uint64_t v8 = v7 ^ [(NSDictionary *)self->_headers hash] ^ (2654435761 * self->_endpoint) ^ (2654435761
                                                                                             * self->_triggerEvent);
  uint64_t v9 = 2654435761 * self->_lookupSelectionType;
  uint64_t v10 = v9 ^ [(NSData *)self->_bodyData hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_experimentId hash];
  return v8 ^ v11 ^ [(NSString *)self->_treatmentId hash] ^ (2654435761 * self->_searchType) ^ (2654435761u * self->_rawRequestSize) ^ (2654435761u * self->_compressedRequestSize);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_42;
  }
  unint64_t v6 = [(_CPStartNetworkSearchFeedback *)self input];
  NSUInteger v7 = [v4 input];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_41;
  }
  uint64_t v8 = [(_CPStartNetworkSearchFeedback *)self input];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(_CPStartNetworkSearchFeedback *)self input];
    NSUInteger v11 = [v4 input];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v6 = [(_CPStartNetworkSearchFeedback *)self uuid];
  NSUInteger v7 = [v4 uuid];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_41;
  }
  uint64_t v13 = [(_CPStartNetworkSearchFeedback *)self uuid];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(_CPStartNetworkSearchFeedback *)self uuid];
    v16 = [v4 uuid];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t queryId = self->_queryId;
  if (queryId != [v4 queryId]) {
    goto LABEL_42;
  }
  unint64_t v6 = [(_CPStartNetworkSearchFeedback *)self url];
  NSUInteger v7 = [v4 url];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_41;
  }
  uint64_t v19 = [(_CPStartNetworkSearchFeedback *)self url];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_CPStartNetworkSearchFeedback *)self url];
    v22 = [v4 url];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v6 = [(_CPStartNetworkSearchFeedback *)self headers];
  NSUInteger v7 = [v4 headers];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_41;
  }
  uint64_t v24 = [(_CPStartNetworkSearchFeedback *)self headers];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_CPStartNetworkSearchFeedback *)self headers];
    v27 = [v4 headers];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  int endpoint = self->_endpoint;
  if (endpoint != [v4 endpoint]) {
    goto LABEL_42;
  }
  int triggerEvent = self->_triggerEvent;
  if (triggerEvent != [v4 triggerEvent]) {
    goto LABEL_42;
  }
  int lookupSelectionType = self->_lookupSelectionType;
  if (lookupSelectionType != [v4 lookupSelectionType]) {
    goto LABEL_42;
  }
  unint64_t v6 = [(_CPStartNetworkSearchFeedback *)self bodyData];
  NSUInteger v7 = [v4 bodyData];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_41;
  }
  uint64_t v32 = [(_CPStartNetworkSearchFeedback *)self bodyData];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_CPStartNetworkSearchFeedback *)self bodyData];
    v35 = [v4 bodyData];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v6 = [(_CPStartNetworkSearchFeedback *)self experimentId];
  NSUInteger v7 = [v4 experimentId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_41;
  }
  uint64_t v37 = [(_CPStartNetworkSearchFeedback *)self experimentId];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_CPStartNetworkSearchFeedback *)self experimentId];
    v40 = [v4 experimentId];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v6 = [(_CPStartNetworkSearchFeedback *)self treatmentId];
  NSUInteger v7 = [v4 treatmentId];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_41:

    goto LABEL_42;
  }
  uint64_t v42 = [(_CPStartNetworkSearchFeedback *)self treatmentId];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_CPStartNetworkSearchFeedback *)self treatmentId];
    v45 = [v4 treatmentId];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  int searchType = self->_searchType;
  if (searchType == [v4 searchType])
  {
    unint64_t rawRequestSize = self->_rawRequestSize;
    if (rawRequestSize == [v4 rawRequestSize])
    {
      unint64_t compressedRequestSize = self->_compressedRequestSize;
      BOOL v47 = compressedRequestSize == [v4 compressedRequestSize];
      goto LABEL_43;
    }
  }
LABEL_42:
  BOOL v47 = 0;
LABEL_43:

  return v47;
}

- (void)writeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_CPStartNetworkSearchFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  NSUInteger v5 = [(_CPStartNetworkSearchFeedback *)self input];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  unint64_t v6 = [(_CPStartNetworkSearchFeedback *)self uuid];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPStartNetworkSearchFeedback *)self queryId]) {
    PBDataWriterWriteUint64Field();
  }
  NSUInteger v7 = [(_CPStartNetworkSearchFeedback *)self url];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_headers;
  uint64_t v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        PBDataWriterWriteStringField();
        v14 = [(NSDictionary *)self->_headers objectForKeyedSubscript:v13];
        PBDataWriterWriteStringField();

        PBDataWriterRecallMark();
      }
      uint64_t v10 = [(NSDictionary *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  if ([(_CPStartNetworkSearchFeedback *)self endpoint]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPStartNetworkSearchFeedback *)self triggerEvent]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPStartNetworkSearchFeedback *)self lookupSelectionType]) {
    PBDataWriterWriteInt32Field();
  }
  v15 = [(_CPStartNetworkSearchFeedback *)self bodyData];

  if (v15) {
    PBDataWriterWriteDataField();
  }
  v16 = [(_CPStartNetworkSearchFeedback *)self experimentId];

  if (v16) {
    PBDataWriterWriteStringField();
  }
  int v17 = [(_CPStartNetworkSearchFeedback *)self treatmentId];

  if (v17) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPStartNetworkSearchFeedback *)self searchType]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPStartNetworkSearchFeedback *)self rawRequestSize]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPStartNetworkSearchFeedback *)self compressedRequestSize]) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPStartNetworkSearchFeedbackReadFrom(self, (uint64_t)a3);
}

- (int)lookupSelectionType
{
  if (self->_whichTrigger == 2) {
    return self->_lookupSelectionType;
  }
  else {
    return 0;
  }
}

- (void)setLookupSelectionType:(int)a3
{
  self->_whichTrigger = 2;
  self->_int lookupSelectionType = a3;
}

- (int)triggerEvent
{
  if (self->_whichTrigger == 1) {
    return self->_triggerEvent;
  }
  else {
    return 0;
  }
}

- (void)setTriggerEvent:(int)a3
{
  self->_whichTrigger = 1;
  self->_int triggerEvent = a3;
}

- (void)setHeaders:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_headers)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    headers = self->_headers;
    self->_headers = v8;
  }
  id v10 = v7;
  id v11 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(NSDictionary *)self->_headers setObject:v11 forKey:v10];
    }
  }
}

- (BOOL)getHeaders:(id *)a3 forKey:(id)a4
{
  NSUInteger v5 = [(NSDictionary *)self->_headers objectForKeyedSubscript:a4];
  id v6 = v5;
  if (a3 && v5) {
    *a3 = v5;
  }

  return v6 != 0;
}

- (void)setHeaders:(id)a3
{
  self->_headers = (NSDictionary *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (void)clearTrigger
{
  self->_whichTrigger = 0;
  self->_int triggerEvent = 0;
  self->_int lookupSelectionType = 0;
}

- (_CPStartNetworkSearchFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPStartNetworkSearchFeedback;
  v2 = [(_CPStartNetworkSearchFeedback *)&v5 init];
  if (v2)
  {
    [(_CPStartNetworkSearchFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPStartNetworkSearchFeedback)initWithFacade:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_CPStartNetworkSearchFeedback;
  objc_super v5 = [(_CPStartNetworkSearchFeedback *)&v32 init];
  if (v5)
  {
    -[_CPStartNetworkSearchFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    id v6 = [v4 input];

    if (v6)
    {
      id v7 = [v4 input];
      [(_CPStartNetworkSearchFeedback *)v5 setInput:v7];
    }
    uint64_t v8 = [v4 uuid];

    if (v8)
    {
      uint64_t v9 = [v4 uuid];
      [(_CPStartNetworkSearchFeedback *)v5 setUuid:v9];
    }
    -[_CPStartNetworkSearchFeedback setQueryId:](v5, "setQueryId:", [v4 queryId]);
    id v10 = [v4 url];

    if (v10)
    {
      id v11 = [v4 url];
      [(_CPStartNetworkSearchFeedback *)v5 setUrl:v11];
    }
    int v12 = [v4 headers];
    uint64_t v13 = v12;
    if (v12)
    {
      v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
    }
    else
    {
      v14 = 0;
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          long long v21 = objc_msgSend(v15, "objectForKey:", v20, (void)v28);
          if (v21) {
            [v14 setObject:v21 forKey:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v17);
    }

    [(_CPStartNetworkSearchFeedback *)v5 setHeaders:v14];
    -[_CPStartNetworkSearchFeedback setEndpoint:](v5, "setEndpoint:", [v4 endpoint]);
    -[_CPStartNetworkSearchFeedback setTriggerEvent:](v5, "setTriggerEvent:", [v4 triggerEvent]);
    v22 = [v4 experimentId];

    if (v22)
    {
      uint64_t v23 = [v4 experimentId];
      [(_CPStartNetworkSearchFeedback *)v5 setExperimentId:v23];
    }
    uint64_t v24 = objc_msgSend(v4, "treatmentId", (void)v28);

    if (v24)
    {
      v25 = [v4 treatmentId];
      [(_CPStartNetworkSearchFeedback *)v5 setTreatmentId:v25];
    }
    -[_CPStartNetworkSearchFeedback setSearchType:](v5, "setSearchType:", [v4 searchType]);
    -[_CPStartNetworkSearchFeedback setRawRequestSize:](v5, "setRawRequestSize:", [v4 rawRequestSize]);
    -[_CPStartNetworkSearchFeedback setCompressedRequestSize:](v5, "setCompressedRequestSize:", [v4 compressedRequestSize]);
    v26 = v5;
  }
  return v5;
}

+ (id)startSearchFeedbackWithUUID
{
  id v2 = objc_alloc_init((Class)a1);
  unint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];
  [v2 setUuid:v4];

  return v2;
}

@end