@interface GEOPlaceSearchFeedbackRequest
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBusinessID;
- (BOOL)hasFeedbackType;
- (BOOL)hasLocalSearchProviderID;
- (BOOL)hasNumberOfResults;
- (BOOL)hasPositionInResults;
- (BOOL)hasSequenceNumber;
- (BOOL)hasSessionGUID;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOPlaceSearchFeedbackRequest)initWithDictionary:(id)a3;
- (GEOPlaceSearchFeedbackRequest)initWithJSON:(id)a3;
- (GEOSessionID)sessionGUID;
- (double)timestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)feedbackTypeAsString:(int)a3;
- (int)StringAsFeedbackType:(id)a3;
- (int)feedbackType;
- (int)localSearchProviderID;
- (int)numberOfResults;
- (int)positionInResults;
- (int)sequenceNumber;
- (int64_t)businessID;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBusinessID:(int64_t)a3;
- (void)setFeedbackType:(int)a3;
- (void)setHasBusinessID:(BOOL)a3;
- (void)setHasFeedbackType:(BOOL)a3;
- (void)setHasLocalSearchProviderID:(BOOL)a3;
- (void)setHasNumberOfResults:(BOOL)a3;
- (void)setHasPositionInResults:(BOOL)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setHasSessionGUID:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLocalSearchProviderID:(int)a3;
- (void)setNumberOfResults:(int)a3;
- (void)setPositionInResults:(int)a3;
- (void)setSequenceNumber:(int)a3;
- (void)setSessionGUID:(GEOSessionID)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPlaceSearchFeedbackRequest

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (GEOSessionID)sessionGUID
{
  p_sessionGUID = &self->_sessionGUID;
  unint64_t high = self->_sessionGUID._high;
  unint64_t low = p_sessionGUID->_low;
  result._unint64_t low = low;
  result._unint64_t high = high;
  return result;
}

- (void)setSessionGUID:(GEOSessionID)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_sessionGUID = a3;
}

- (void)setHasSessionGUID:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSessionGUID
{
  return *(unsigned char *)&self->_flags & 1;
}

- (int64_t)businessID
{
  return self->_businessID;
}

- (void)setBusinessID:(int64_t)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_businessID = a3;
}

- (void)setHasBusinessID:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasBusinessID
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)feedbackType
{
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    return self->_feedbackType;
  }
  else {
    return 0;
  }
}

- (void)setFeedbackType:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_feedbackType = a3;
}

- (void)setHasFeedbackType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasFeedbackType
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)feedbackTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53DE2E8[a3];
  }

  return v3;
}

- (int)StringAsFeedbackType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ASSISTANT_RESULT_CLICK"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ASSISTANT_YELP_CLICK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ASSISTANT_RESULT_CLICK_CALL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ASSISTANT_RESULT_CLICK_DIRECTIONS"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)numberOfResults
{
  return self->_numberOfResults;
}

- (void)setNumberOfResults:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_numberOfResults = a3;
}

- (void)setHasNumberOfResults:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasNumberOfResults
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (int)positionInResults
{
  return self->_positionInResults;
}

- (void)setPositionInResults:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x40u;
  self->_positionInResults = a3;
}

- (void)setHasPositionInResults:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasPositionInResults
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (int)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x80u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = v3 & 0x80 | *(unsigned char *)&self->_flags & 0x7F;
}

- (BOOL)hasSequenceNumber
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (int)localSearchProviderID
{
  return self->_localSearchProviderID;
}

- (void)setLocalSearchProviderID:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_localSearchProviderID = a3;
}

- (void)setHasLocalSearchProviderID:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasLocalSearchProviderID
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPlaceSearchFeedbackRequest;
  int v4 = [(GEOPlaceSearchFeedbackRequest *)&v8 description];
  v5 = [(GEOPlaceSearchFeedbackRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v2 = 0;
    goto LABEL_22;
  }
  [(id)a1 readAll:1];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  char v3 = *(unsigned char *)(a1 + 60);
  if ((v3 & 4) != 0)
  {
    int v4 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    [v2 setObject:v4 forKey:@"timestamp"];

    char v3 = *(unsigned char *)(a1 + 60);
  }
  if (v3)
  {
    v5 = _GEOSessionIDDictionaryRepresentation((void *)(a1 + 8));
    [v2 setObject:v5 forKey:@"sessionGUID"];

    char v3 = *(unsigned char *)(a1 + 60);
    if ((v3 & 2) == 0)
    {
LABEL_6:
      if ((v3 & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_14;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_6;
  }
  v6 = [NSNumber numberWithLongLong:*(void *)(a1 + 24)];
  [v2 setObject:v6 forKey:@"businessID"];

  char v3 = *(unsigned char *)(a1 + 60);
  if ((v3 & 8) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_14:
  uint64_t v7 = *(int *)(a1 + 40);
  if (v7 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 40));
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v8 = off_1E53DE2E8[v7];
  }
  [v2 setObject:v8 forKey:@"feedbackType"];

  char v3 = *(unsigned char *)(a1 + 60);
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  [v2 setObject:v9 forKey:@"numberOfResults"];

  char v3 = *(unsigned char *)(a1 + 60);
  if ((v3 & 0x40) == 0)
  {
LABEL_9:
    if ((v3 & 0x80) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
    [v2 setObject:v11 forKey:@"sequenceNumber"];

    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_19:
  v10 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  [v2 setObject:v10 forKey:@"positionInResults"];

  char v3 = *(unsigned char *)(a1 + 60);
  if (v3 < 0) {
    goto LABEL_20;
  }
LABEL_10:
  if ((v3 & 0x10) != 0)
  {
LABEL_21:
    v12 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
    [v2 setObject:v12 forKey:@"localSearchProviderID"];
  }
LABEL_22:

  return v2;
}

- (GEOPlaceSearchFeedbackRequest)initWithDictionary:(id)a3
{
  return (GEOPlaceSearchFeedbackRequest *)-[GEOPlaceSearchFeedbackRequest _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_32;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_32;
  }
  int v4 = [v3 objectForKeyedSubscript:@"timestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 doubleValue];
    objc_msgSend(a1, "setTimestamp:");
  }

  v5 = [v3 objectForKeyedSubscript:@"sessionGUID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    _GEOSessionIDFromDictionaryRepresentation(v5, &v15);
    objc_msgSend(a1, "setSessionGUID:", v15, v16);
  }

  v6 = [v3 objectForKeyedSubscript:@"businessID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBusinessID:", objc_msgSend(v6, "longLongValue"));
  }

  uint64_t v7 = [v3 objectForKeyedSubscript:@"feedbackType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"ASSISTANT_RESULT_CLICK"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"ASSISTANT_YELP_CLICK"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"ASSISTANT_RESULT_CLICK_CALL"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"ASSISTANT_RESULT_CLICK_DIRECTIONS"])
    {
      uint64_t v9 = 3;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_22:
    [a1 setFeedbackType:v9];
  }

  v10 = [v3 objectForKeyedSubscript:@"numberOfResults"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setNumberOfResults:", objc_msgSend(v10, "intValue"));
  }

  v11 = [v3 objectForKeyedSubscript:@"positionInResults"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPositionInResults:", objc_msgSend(v11, "intValue"));
  }

  v12 = [v3 objectForKeyedSubscript:@"sequenceNumber"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSequenceNumber:", objc_msgSend(v12, "intValue"));
  }

  v13 = [v3 objectForKeyedSubscript:@"localSearchProviderID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLocalSearchProviderID:", objc_msgSend(v13, "intValue"));
  }

LABEL_32:
  return a1;
}

- (GEOPlaceSearchFeedbackRequest)initWithJSON:(id)a3
{
  return (GEOPlaceSearchFeedbackRequest *)-[GEOPlaceSearchFeedbackRequest _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  [a3 position];
  [a3 length];
  int v4 = (int *)MEMORY[0x1E4F940E8];
  v5 = (int *)MEMORY[0x1E4F940E0];
  v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v4;
        uint64_t v12 = *(void *)((char *)a3 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v12);
        *(void *)((char *)a3 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          uint64_t v16 = *v6;
          int v17 = *((unsigned __int8 *)a3 + v16);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      uint64_t v16 = *v6;
      int v17 = *((unsigned __int8 *)a3 + v16);
      if (*((unsigned char *)a3 + v16)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v18 = v10 & 7;
      if (v17 || v18 == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          if (v18 != 1) {
            goto LABEL_82;
          }
          uint64_t v20 = *v4;
          unint64_t v21 = *(void *)((char *)a3 + v20);
          if (v21 > 0xFFFFFFFFFFFFFFF7) {
            goto LABEL_78;
          }
          unint64_t v22 = v21 + 8;
          if (v22 > *(void *)((char *)a3 + *v5)) {
            goto LABEL_78;
          }
          *(void *)((char *)a3 + v20) = v22;
          continue;
        case 2u:
          if (v18 != 2 || !PBReaderPlaceMark() || !GEOSessionIDIsValid(a3)) {
            goto LABEL_82;
          }
          PBReaderRecallMark();
          continue;
        case 3u:
          if ((v10 & 7) != 0) {
            goto LABEL_82;
          }
          unsigned int v23 = 0;
          while (1)
          {
            uint64_t v24 = *v4;
            uint64_t v25 = *(void *)((char *)a3 + v24);
            unint64_t v26 = v25 + 1;
            if (v25 == -1 || v26 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_77;
            }
            int v27 = *(char *)(*(void *)((char *)a3 + *v7) + v25);
            *(void *)((char *)a3 + v24) = v26;
            if (v27 < 0)
            {
              BOOL v28 = v23++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_79;
          }
        case 4u:
          if ((v10 & 7) != 0) {
            goto LABEL_82;
          }
          unsigned int v29 = 0;
          while (1)
          {
            uint64_t v30 = *v4;
            uint64_t v31 = *(void *)((char *)a3 + v30);
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_77;
            }
            int v33 = *(char *)(*(void *)((char *)a3 + *v7) + v31);
            *(void *)((char *)a3 + v30) = v32;
            if (v33 < 0)
            {
              BOOL v28 = v29++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_79;
          }
        case 5u:
          if ((v10 & 7) != 0) {
            goto LABEL_82;
          }
          unsigned int v34 = 0;
          while (1)
          {
            uint64_t v35 = *v4;
            uint64_t v36 = *(void *)((char *)a3 + v35);
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_77;
            }
            int v38 = *(char *)(*(void *)((char *)a3 + *v7) + v36);
            *(void *)((char *)a3 + v35) = v37;
            if (v38 < 0)
            {
              BOOL v28 = v34++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_79;
          }
        case 6u:
          if ((v10 & 7) != 0) {
            goto LABEL_82;
          }
          unsigned int v39 = 0;
          while (1)
          {
            uint64_t v40 = *v4;
            uint64_t v41 = *(void *)((char *)a3 + v40);
            unint64_t v42 = v41 + 1;
            if (v41 == -1 || v42 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_77;
            }
            int v43 = *(char *)(*(void *)((char *)a3 + *v7) + v41);
            *(void *)((char *)a3 + v40) = v42;
            if (v43 < 0)
            {
              BOOL v28 = v39++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_79;
          }
        case 7u:
          if ((v10 & 7) != 0) {
            goto LABEL_82;
          }
          unsigned int v44 = 0;
          while (1)
          {
            uint64_t v45 = *v4;
            uint64_t v46 = *(void *)((char *)a3 + v45);
            unint64_t v47 = v46 + 1;
            if (v46 == -1 || v47 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_77;
            }
            int v48 = *(char *)(*(void *)((char *)a3 + *v7) + v46);
            *(void *)((char *)a3 + v45) = v47;
            if (v48 < 0)
            {
              BOOL v28 = v44++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_79;
          }
        case 8u:
          if ((v10 & 7) != 0) {
            goto LABEL_82;
          }
          unsigned int v49 = 0;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_82:
          PBReaderRecallMark();
          return 0;
      }
      while (1)
      {
        uint64_t v50 = *v4;
        uint64_t v51 = *(void *)((char *)a3 + v50);
        unint64_t v52 = v51 + 1;
        if (v51 == -1 || v52 > *(void *)((char *)a3 + *v5)) {
          break;
        }
        int v53 = *(char *)(*(void *)((char *)a3 + *v7) + v51);
        *(void *)((char *)a3 + v50) = v52;
        if (v53 < 0)
        {
          BOOL v28 = v49++ > 8;
          if (!v28) {
            continue;
          }
        }
        goto LABEL_79;
      }
LABEL_77:
      uint64_t v16 = *v6;
LABEL_78:
      *((unsigned char *)a3 + v16) = 1;
LABEL_79:
      ;
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  BOOL v54 = *((unsigned char *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v54;
}

- (BOOL)readFrom:(id)a3
{
  int v4 = (char *)a3;
  objc_sync_enter(v4);
  if (v4)
  {
    v5 = (int *)MEMORY[0x1E4F940E8];
    v6 = (int *)MEMORY[0x1E4F940E0];
    uint64_t v7 = (int *)MEMORY[0x1E4F940C8];
    if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
    {
      char v8 = (int *)MEMORY[0x1E4F940B8];
      do
      {
        if (v4[*v7]) {
          break;
        }
        char v9 = 0;
        unsigned int v10 = 0;
        unint64_t v11 = 0;
        while (1)
        {
          uint64_t v12 = *v5;
          uint64_t v13 = *(void *)&v4[v12];
          unint64_t v14 = v13 + 1;
          if (v13 == -1 || v14 > *(void *)&v4[*v6]) {
            break;
          }
          char v15 = *(unsigned char *)(*(void *)&v4[*v8] + v13);
          *(void *)&v4[v12] = v14;
          v11 |= (unint64_t)(v15 & 0x7F) << v9;
          if ((v15 & 0x80) == 0) {
            goto LABEL_13;
          }
          v9 += 7;
          BOOL v16 = v10++ >= 9;
          if (v16)
          {
            unint64_t v11 = 0;
            int v17 = v4[*v7];
            goto LABEL_15;
          }
        }
        v4[*v7] = 1;
LABEL_13:
        int v17 = v4[*v7];
        if (v4[*v7]) {
          unint64_t v11 = 0;
        }
LABEL_15:
        if (v17 || (v11 & 7) == 4) {
          break;
        }
        switch((v11 >> 3))
        {
          case 1u:
            *(unsigned char *)&self->_flags |= 4u;
            uint64_t v19 = *v5;
            unint64_t v20 = *(void *)&v4[v19];
            if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)&v4[*v6])
            {
              double v21 = *(double *)(*(void *)&v4[*v8] + v20);
              *(void *)&v4[v19] = v20 + 8;
            }
            else
            {
              v4[*v7] = 1;
              double v21 = 0.0;
            }
            self->_timestamp = v21;
            continue;
          case 2u:
            if (!PBReaderPlaceMark()
              || (GEOSessionIDReadAllFrom(&self->_sessionGUID._high, (uint64_t)v4) & 1) == 0)
            {
              goto LABEL_100;
            }
            PBReaderRecallMark();
            *(unsigned char *)&self->_flags |= 1u;
            continue;
          case 3u:
            char v22 = 0;
            unsigned int v23 = 0;
            int64_t v24 = 0;
            *(unsigned char *)&self->_flags |= 2u;
            while (2)
            {
              uint64_t v25 = *v5;
              uint64_t v26 = *(void *)&v4[v25];
              unint64_t v27 = v26 + 1;
              if (v26 == -1 || v27 > *(void *)&v4[*v6])
              {
                v4[*v7] = 1;
              }
              else
              {
                char v28 = *(unsigned char *)(*(void *)&v4[*v8] + v26);
                *(void *)&v4[v25] = v27;
                v24 |= (unint64_t)(v28 & 0x7F) << v22;
                if (v28 < 0)
                {
                  v22 += 7;
                  BOOL v16 = v23++ >= 9;
                  if (v16)
                  {
                    int64_t v24 = 0;
                    goto LABEL_73;
                  }
                  continue;
                }
              }
              break;
            }
            if (v4[*v7]) {
              int64_t v24 = 0;
            }
LABEL_73:
            self->_businessID = v24;
            continue;
          case 4u:
            char v29 = 0;
            unsigned int v30 = 0;
            uint64_t v31 = 0;
            *(unsigned char *)&self->_flags |= 8u;
            while (1)
            {
              uint64_t v32 = *v5;
              uint64_t v33 = *(void *)&v4[v32];
              unint64_t v34 = v33 + 1;
              if (v33 == -1 || v34 > *(void *)&v4[*v6]) {
                break;
              }
              char v35 = *(unsigned char *)(*(void *)&v4[*v8] + v33);
              *(void *)&v4[v32] = v34;
              v31 |= (unint64_t)(v35 & 0x7F) << v29;
              if ((v35 & 0x80) == 0) {
                goto LABEL_75;
              }
              v29 += 7;
              BOOL v16 = v30++ >= 9;
              if (v16)
              {
                LODWORD(v31) = 0;
                goto LABEL_77;
              }
            }
            v4[*v7] = 1;
LABEL_75:
            if (v4[*v7]) {
              LODWORD(v31) = 0;
            }
LABEL_77:
            uint64_t v60 = 40;
            goto LABEL_94;
          case 5u:
            char v36 = 0;
            unsigned int v37 = 0;
            uint64_t v31 = 0;
            *(unsigned char *)&self->_flags |= 0x20u;
            while (2)
            {
              uint64_t v38 = *v5;
              uint64_t v39 = *(void *)&v4[v38];
              unint64_t v40 = v39 + 1;
              if (v39 == -1 || v40 > *(void *)&v4[*v6])
              {
                v4[*v7] = 1;
              }
              else
              {
                char v41 = *(unsigned char *)(*(void *)&v4[*v8] + v39);
                *(void *)&v4[v38] = v40;
                v31 |= (unint64_t)(v41 & 0x7F) << v36;
                if (v41 < 0)
                {
                  v36 += 7;
                  BOOL v16 = v37++ >= 9;
                  if (v16)
                  {
                    LODWORD(v31) = 0;
                    goto LABEL_81;
                  }
                  continue;
                }
              }
              break;
            }
            if (v4[*v7]) {
              LODWORD(v31) = 0;
            }
LABEL_81:
            uint64_t v60 = 48;
            goto LABEL_94;
          case 6u:
            char v42 = 0;
            unsigned int v43 = 0;
            uint64_t v31 = 0;
            *(unsigned char *)&self->_flags |= 0x40u;
            while (2)
            {
              uint64_t v44 = *v5;
              uint64_t v45 = *(void *)&v4[v44];
              unint64_t v46 = v45 + 1;
              if (v45 == -1 || v46 > *(void *)&v4[*v6])
              {
                v4[*v7] = 1;
              }
              else
              {
                char v47 = *(unsigned char *)(*(void *)&v4[*v8] + v45);
                *(void *)&v4[v44] = v46;
                v31 |= (unint64_t)(v47 & 0x7F) << v42;
                if (v47 < 0)
                {
                  v42 += 7;
                  BOOL v16 = v43++ >= 9;
                  if (v16)
                  {
                    LODWORD(v31) = 0;
                    goto LABEL_85;
                  }
                  continue;
                }
              }
              break;
            }
            if (v4[*v7]) {
              LODWORD(v31) = 0;
            }
LABEL_85:
            uint64_t v60 = 52;
            goto LABEL_94;
          case 7u:
            char v48 = 0;
            unsigned int v49 = 0;
            uint64_t v31 = 0;
            *(unsigned char *)&self->_flags |= 0x80u;
            while (2)
            {
              uint64_t v50 = *v5;
              uint64_t v51 = *(void *)&v4[v50];
              unint64_t v52 = v51 + 1;
              if (v51 == -1 || v52 > *(void *)&v4[*v6])
              {
                v4[*v7] = 1;
              }
              else
              {
                char v53 = *(unsigned char *)(*(void *)&v4[*v8] + v51);
                *(void *)&v4[v50] = v52;
                v31 |= (unint64_t)(v53 & 0x7F) << v48;
                if (v53 < 0)
                {
                  v48 += 7;
                  BOOL v16 = v49++ >= 9;
                  if (v16)
                  {
                    LODWORD(v31) = 0;
                    goto LABEL_89;
                  }
                  continue;
                }
              }
              break;
            }
            if (v4[*v7]) {
              LODWORD(v31) = 0;
            }
LABEL_89:
            uint64_t v60 = 56;
            goto LABEL_94;
          case 8u:
            char v54 = 0;
            unsigned int v55 = 0;
            uint64_t v31 = 0;
            *(unsigned char *)&self->_flags |= 0x10u;
            break;
          default:
            if (!PBReaderSkipValueWithTag()) {
              goto LABEL_100;
            }
            continue;
        }
        while (1)
        {
          uint64_t v56 = *v5;
          uint64_t v57 = *(void *)&v4[v56];
          unint64_t v58 = v57 + 1;
          if (v57 == -1 || v58 > *(void *)&v4[*v6]) {
            break;
          }
          char v59 = *(unsigned char *)(*(void *)&v4[*v8] + v57);
          *(void *)&v4[v56] = v58;
          v31 |= (unint64_t)(v59 & 0x7F) << v54;
          if ((v59 & 0x80) == 0) {
            goto LABEL_91;
          }
          v54 += 7;
          BOOL v16 = v55++ >= 9;
          if (v16)
          {
            LODWORD(v31) = 0;
            goto LABEL_93;
          }
        }
        v4[*v7] = 1;
LABEL_91:
        if (v4[*v7]) {
          LODWORD(v31) = 0;
        }
LABEL_93:
        uint64_t v60 = 44;
LABEL_94:
        *(_DWORD *)((char *)&self->super.super.super.isa + v60) = v31;
      }
      while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
    }
    BOOL v61 = v4[*v7] == 0;
  }
  else
  {
LABEL_100:
    BOOL v61 = 0;
  }
  objc_sync_exit(v4);

  return v61;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterPlaceMark();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterRecallMark();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt64Field();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0) {
      goto LABEL_8;
    }
LABEL_17:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if (flags < 0) {
    goto LABEL_17;
  }
LABEL_8:
  if ((flags & 0x10) != 0) {
LABEL_9:
  }
    PBDataWriterWriteInt32Field();
LABEL_10:
}

- (unsigned)requestTypeCode
{
  return 1005;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  v5 = (char *)a3;
  [(GEOPlaceSearchFeedbackRequest *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((void *)v5 + 4) = *(void *)&self->_timestamp;
    v5[60] |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(GEOSessionID *)(v5 + 8) = self->_sessionGUID;
  v5[60] |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)v5 + 3) = self->_businessID;
  v5[60] |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v5 + 10) = self->_feedbackType;
  v5[60] |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v5 + 12) = self->_numberOfResults;
  v5[60] |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v5 + 13) = self->_positionInResults;
  v5[60] |= 0x40u;
  char flags = (char)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_8:
    if ((flags & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  *((_DWORD *)v5 + 14) = self->_sequenceNumber;
  v5[60] |= 0x80u;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_9:
    *((_DWORD *)v5 + 11) = self->_localSearchProviderID;
    v5[60] |= 0x10u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((void *)result + 4) = *(void *)&self->_timestamp;
    *((unsigned char *)result + 60) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(GEOSessionID *)((char *)result + 8) = self->_sessionGUID;
  *((unsigned char *)result + 60) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 3) = self->_businessID;
  *((unsigned char *)result + 60) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 10) = self->_feedbackType;
  *((unsigned char *)result + 60) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 12) = self->_numberOfResults;
  *((unsigned char *)result + 60) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 13) = self->_positionInResults;
  *((unsigned char *)result + 60) |= 0x40u;
  char flags = (char)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_8:
    if ((flags & 0x10) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 14) = self->_sequenceNumber;
  *((unsigned char *)result + 60) |= 0x80u;
  if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
    return result;
  }
LABEL_9:
  *((_DWORD *)result + 11) = self->_localSearchProviderID;
  *((unsigned char *)result + 60) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  [(GEOPlaceSearchFeedbackRequest *)self readAll:1];
  [v4 readAll:1];
  $A14AAD9D3671273A066B57AEC6FEAFB5 flags = self->_flags;
  int v6 = v4[60];
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_timestamp != *((double *)v4 + 4)) {
      goto LABEL_44;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_44;
  }
  if (*(unsigned char *)&flags & 1) != 0 && (v6)
  {
    if (self->_sessionGUID._high != *((void *)v4 + 1) || self->_sessionGUID._low != *((void *)v4 + 2)) {
      goto LABEL_44;
    }
  }
  else if ((*(_DWORD *)&flags | v6))
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_businessID != *((void *)v4 + 3)) {
      goto LABEL_44;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_feedbackType != *((_DWORD *)v4 + 10)) {
      goto LABEL_44;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_numberOfResults != *((_DWORD *)v4 + 12)) {
      goto LABEL_44;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_positionInResults != *((_DWORD *)v4 + 13)) {
      goto LABEL_44;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&flags & 0x80) == 0)
  {
    if ((v6 & 0x80) == 0) {
      goto LABEL_38;
    }
LABEL_44:
    BOOL v8 = 0;
    goto LABEL_45;
  }
  if ((v6 & 0x80) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 14)) {
    goto LABEL_44;
  }
LABEL_38:
  BOOL v8 = (v6 & 0x10) == 0;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_localSearchProviderID != *((_DWORD *)v4 + 11)) {
      goto LABEL_44;
    }
    BOOL v8 = 1;
  }
LABEL_45:

  return v8;
}

- (unint64_t)hash
{
  [(GEOPlaceSearchFeedbackRequest *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    double timestamp = self->_timestamp;
    double v6 = -timestamp;
    if (timestamp >= 0.0) {
      double v6 = self->_timestamp;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if (flags)
  {
    uint64_t v9 = PBHashBytes();
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
LABEL_11:
      uint64_t v10 = 2654435761 * self->_businessID;
      if ((flags & 8) != 0) {
        goto LABEL_12;
      }
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_11;
    }
  }
  uint64_t v10 = 0;
  if ((flags & 8) != 0)
  {
LABEL_12:
    uint64_t v11 = 2654435761 * self->_feedbackType;
    if ((flags & 0x20) != 0) {
      goto LABEL_13;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v11 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_13:
    uint64_t v12 = 2654435761 * self->_numberOfResults;
    if ((flags & 0x40) != 0) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v12 = 0;
  if ((flags & 0x40) != 0)
  {
LABEL_14:
    uint64_t v13 = 2654435761 * self->_positionInResults;
    if (flags < 0) {
      goto LABEL_15;
    }
LABEL_22:
    uint64_t v14 = 0;
    if ((flags & 0x10) != 0) {
      goto LABEL_16;
    }
LABEL_23:
    uint64_t v15 = 0;
    return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_21:
  uint64_t v13 = 0;
  if ((flags & 0x80) == 0) {
    goto LABEL_22;
  }
LABEL_15:
  uint64_t v14 = 2654435761 * self->_sequenceNumber;
  if ((flags & 0x10) == 0) {
    goto LABEL_23;
  }
LABEL_16:
  uint64_t v15 = 2654435761 * self->_localSearchProviderID;
  return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  v5 = (char *)a3;
  [v5 readAll:0];
  char v4 = v5[60];
  if ((v4 & 4) != 0)
  {
    self->_double timestamp = *((double *)v5 + 4);
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = v5[60];
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((v5[60] & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_sessionGUID = *(GEOSessionID *)(v5 + 8);
  *(unsigned char *)&self->_flags |= 1u;
  char v4 = v5[60];
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_businessID = *((void *)v5 + 3);
  *(unsigned char *)&self->_flags |= 2u;
  char v4 = v5[60];
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_feedbackType = *((_DWORD *)v5 + 10);
  *(unsigned char *)&self->_flags |= 8u;
  char v4 = v5[60];
  if ((v4 & 0x20) == 0)
  {
LABEL_6:
    if ((v4 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_numberOfResults = *((_DWORD *)v5 + 12);
  *(unsigned char *)&self->_flags |= 0x20u;
  char v4 = v5[60];
  if ((v4 & 0x40) == 0)
  {
LABEL_7:
    if ((v4 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_positionInResults = *((_DWORD *)v5 + 13);
  *(unsigned char *)&self->_flags |= 0x40u;
  char v4 = v5[60];
  if ((v4 & 0x80) == 0)
  {
LABEL_8:
    if ((v4 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  self->_sequenceNumber = *((_DWORD *)v5 + 14);
  *(unsigned char *)&self->_flags |= 0x80u;
  if ((v5[60] & 0x10) != 0)
  {
LABEL_9:
    self->_localSearchProviderID = *((_DWORD *)v5 + 11);
    *(unsigned char *)&self->_flags |= 0x10u;
  }
LABEL_10:
}

@end