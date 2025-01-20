@interface GEORPFeedbackResponse
+ (BOOL)isValid:(id)a3;
- (BOOL)attestationNotFound;
- (BOOL)discardLogs;
- (BOOL)hasAttestationNotFound;
- (BOOL)hasDiscardLogs;
- (BOOL)hasFeedbackRequestType;
- (BOOL)hasFeedbackResult;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackResponse)initWithDictionary:(id)a3;
- (GEORPFeedbackResponse)initWithJSON:(id)a3;
- (GEORPFeedbackResult)feedbackResult;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedbackRequestTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsFeedbackRequestType:(id)a3;
- (int)StringAsStatus:(id)a3;
- (int)feedbackRequestType;
- (int)status;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttestationNotFound:(BOOL)a3;
- (void)setDiscardLogs:(BOOL)a3;
- (void)setFeedbackRequestType:(int)a3;
- (void)setFeedbackResult:(id)a3;
- (void)setHasAttestationNotFound:(BOOL)a3;
- (void)setHasDiscardLogs:(BOOL)a3;
- (void)setHasFeedbackRequestType:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackResponse

- (int)status
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 <= 29)
  {
    v4 = @"STATUS_SUCCESS";
    switch(a3)
    {
      case 0:
        goto LABEL_22;
      case 1:
        v4 = @"STATUS_FAILED";
        break;
      case 2:
        v4 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_21;
      case 5:
        v4 = @"INVALID_REQUEST";
        break;
      default:
        if (a3 != 20) {
          goto LABEL_21;
        }
        v4 = @"FAILED_NO_RESULT";
        break;
    }
    return v4;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      v4 = @"STATUS_DEDUPED";
    }
    else
    {
      if (a3 != 60) {
        goto LABEL_21;
      }
      v4 = @"VERSION_MISMATCH";
    }
  }
  else
  {
    if (a3 != 30)
    {
      if (a3 == 40)
      {
        v4 = @"FAILED_NOT_AUTHORIZED";
        return v4;
      }
LABEL_21:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      return v4;
    }
    v4 = @"NEEDS_REFINEMENT";
  }
  return v4;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATUS_SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATUS_FAILED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATUS_INCOMPLETE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INVALID_REQUEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FAILED_NO_RESULT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"NEEDS_REFINEMENT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"STATUS_DEDUPED"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"VERSION_MISMATCH"])
  {
    int v4 = 60;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)feedbackRequestType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_feedbackRequestType;
  }
  else {
    return 0;
  }
}

- (void)setFeedbackRequestType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_feedbackRequestType = a3;
}

- (void)setHasFeedbackRequestType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFeedbackRequestType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)feedbackRequestTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DBB60[a3];
  }

  return v3;
}

- (int)StringAsFeedbackRequestType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_REQUEST_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_REQUEST_TYPE_SUBMISSION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_REQUEST_TYPE_ID_LOOKUP"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_REQUEST_TYPE_QUERY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_REQUEST_TYPE_IMAGE_UPLOAD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_REQUEST_TYPE_LAYOUT_CONFIG"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_REQUEST_TYPE_TDM_FRAUD_NOTIFICATION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_REQUEST_TYPE_LOG_EVENT"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasFeedbackResult
{
  return self->_feedbackResult != 0;
}

- (GEORPFeedbackResult)feedbackResult
{
  return self->_feedbackResult;
}

- (void)setFeedbackResult:(id)a3
{
}

- (BOOL)discardLogs
{
  return self->_discardLogs;
}

- (void)setDiscardLogs:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_discardLogs = a3;
}

- (void)setHasDiscardLogs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasDiscardLogs
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)attestationNotFound
{
  return self->_attestationNotFound;
}

- (void)setAttestationNotFound:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_attestationNotFound = a3;
}

- (void)setHasAttestationNotFound:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasAttestationNotFound
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackResponse;
  int v4 = [(GEORPFeedbackResponse *)&v8 description];
  v5 = [(GEORPFeedbackResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_48;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 36);
  if ((v5 & 2) != 0)
  {
    int v6 = *(_DWORD *)(a1 + 28);
    if (v6 <= 29)
    {
      v7 = @"STATUS_SUCCESS";
      switch(v6)
      {
        case 0:
          goto LABEL_20;
        case 1:
          v7 = @"STATUS_FAILED";
          break;
        case 2:
          v7 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          v7 = @"INVALID_REQUEST";
          break;
        default:
          if (v6 != 20) {
            goto LABEL_15;
          }
          v7 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_20;
    }
    if (v6 > 49)
    {
      if (v6 == 50)
      {
        v7 = @"STATUS_DEDUPED";
        goto LABEL_20;
      }
      if (v6 == 60)
      {
        v7 = @"VERSION_MISMATCH";
        goto LABEL_20;
      }
    }
    else
    {
      if (v6 == 30)
      {
        v7 = @"NEEDS_REFINEMENT";
        goto LABEL_20;
      }
      if (v6 == 40)
      {
        v7 = @"FAILED_NOT_AUTHORIZED";
LABEL_20:
        [v4 setObject:v7 forKey:@"status"];

        char v5 = *(unsigned char *)(a1 + 36);
        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 28));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  if (v5)
  {
    uint64_t v8 = *(int *)(a1 + 24);
    if (v8 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E53DBB60[v8];
    }
    if (a2) {
      v10 = @"feedbackRequestType";
    }
    else {
      v10 = @"feedback_request_type";
    }
    [v4 setObject:v9 forKey:v10];
  }
  v11 = [(id)a1 feedbackResult];
  v12 = v11;
  if (v11)
  {
    if (a2)
    {
      v13 = [v11 jsonRepresentation];
      v14 = @"feedbackResult";
    }
    else
    {
      v13 = [v11 dictionaryRepresentation];
      v14 = @"feedback_result";
    }
    [v4 setObject:v13 forKey:v14];
  }
  char v15 = *(unsigned char *)(a1 + 36);
  if ((v15 & 8) != 0)
  {
    v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 33)];
    if (a2) {
      v17 = @"discardLogs";
    }
    else {
      v17 = @"discard_logs";
    }
    [v4 setObject:v16 forKey:v17];

    char v15 = *(unsigned char *)(a1 + 36);
  }
  if ((v15 & 4) != 0)
  {
    v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
    if (a2) {
      v19 = @"attestationNotFound";
    }
    else {
      v19 = @"attestation_not_found";
    }
    [v4 setObject:v18 forKey:v19];
  }
  v20 = *(void **)(a1 + 8);
  if (v20)
  {
    v21 = [v20 dictionaryRepresentation];
    v22 = v21;
    if (a2)
    {
      v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __51__GEORPFeedbackResponse__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E53D8860;
      id v24 = v23;
      id v28 = v24;
      [v22 enumerateKeysAndObjectsUsingBlock:v27];
      id v25 = v24;

      v22 = v25;
    }
    [v4 setObject:v22 forKey:@"Unknown Fields"];
  }
LABEL_48:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEORPFeedbackResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPFeedbackResponse)initWithDictionary:(id)a3
{
  return (GEORPFeedbackResponse *)-[GEORPFeedbackResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_71;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_71;
  }
  int v6 = [v5 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"STATUS_SUCCESS"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"STATUS_FAILED"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"INVALID_REQUEST"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"FAILED_NO_RESULT"])
    {
      uint64_t v8 = 20;
    }
    else if ([v7 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      uint64_t v8 = 30;
    }
    else if ([v7 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      uint64_t v8 = 40;
    }
    else if ([v7 isEqualToString:@"STATUS_DEDUPED"])
    {
      uint64_t v8 = 50;
    }
    else if ([v7 isEqualToString:@"VERSION_MISMATCH"])
    {
      uint64_t v8 = 60;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_27;
    }
    uint64_t v8 = [v6 intValue];
  }
  [a1 setStatus:v8];
LABEL_27:

  if (a3) {
    v9 = @"feedbackRequestType";
  }
  else {
    v9 = @"feedback_request_type";
  }
  id v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    if ([v11 isEqualToString:@"FEEDBACK_REQUEST_TYPE_UNKNOWN"])
    {
      uint64_t v12 = 0;
    }
    else if ([v11 isEqualToString:@"FEEDBACK_REQUEST_TYPE_SUBMISSION"])
    {
      uint64_t v12 = 1;
    }
    else if ([v11 isEqualToString:@"FEEDBACK_REQUEST_TYPE_ID_LOOKUP"])
    {
      uint64_t v12 = 2;
    }
    else if ([v11 isEqualToString:@"FEEDBACK_REQUEST_TYPE_QUERY"])
    {
      uint64_t v12 = 3;
    }
    else if ([v11 isEqualToString:@"FEEDBACK_REQUEST_TYPE_IMAGE_UPLOAD"])
    {
      uint64_t v12 = 4;
    }
    else if ([v11 isEqualToString:@"FEEDBACK_REQUEST_TYPE_LAYOUT_CONFIG"])
    {
      uint64_t v12 = 5;
    }
    else if ([v11 isEqualToString:@"FEEDBACK_REQUEST_TYPE_TDM_FRAUD_NOTIFICATION"])
    {
      uint64_t v12 = 6;
    }
    else if ([v11 isEqualToString:@"FEEDBACK_REQUEST_TYPE_LOG_EVENT"])
    {
      uint64_t v12 = 7;
    }
    else
    {
      uint64_t v12 = 0;
    }

    goto LABEL_51;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v10 intValue];
LABEL_51:
    [a1 setFeedbackRequestType:v12];
  }

  if (a3) {
    v13 = @"feedbackResult";
  }
  else {
    v13 = @"feedback_result";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v15 = [GEORPFeedbackResult alloc];
    if (a3) {
      uint64_t v16 = [(GEORPFeedbackResult *)v15 initWithJSON:v14];
    }
    else {
      uint64_t v16 = [(GEORPFeedbackResult *)v15 initWithDictionary:v14];
    }
    v17 = (void *)v16;
    [a1 setFeedbackResult:v16];
  }
  if (a3) {
    v18 = @"discardLogs";
  }
  else {
    v18 = @"discard_logs";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDiscardLogs:", objc_msgSend(v19, "BOOLValue"));
  }

  if (a3) {
    v20 = @"attestationNotFound";
  }
  else {
    v20 = @"attestation_not_found";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAttestationNotFound:", objc_msgSend(v21, "BOOLValue"));
  }

LABEL_71:
  return a1;
}

- (GEORPFeedbackResponse)initWithJSON:(id)a3
{
  return (GEORPFeedbackResponse *)-[GEORPFeedbackResponse _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_feedbackResult) {
    PBDataWriterWriteSubmessage();
  }
  char v5 = (char)self->_flags;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v5 = (char)self->_flags;
  }
  if ((v5 & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEORPFeedbackResult *)self->_feedbackResult hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  [(GEORPFeedbackResponse *)self readAll:0];
  int v4 = v7;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v7 + 7) = self->_status;
    v7[36] |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v7 + 6) = self->_feedbackRequestType;
    v7[36] |= 1u;
  }
  if (self->_feedbackResult)
  {
    objc_msgSend(v7, "setFeedbackResult:");
    int v4 = v7;
  }
  char v6 = (char)self->_flags;
  if ((v6 & 8) != 0)
  {
    v4[33] = self->_discardLogs;
    v4[36] |= 8u;
    char v6 = (char)self->_flags;
  }
  if ((v6 & 4) != 0)
  {
    v4[32] = self->_attestationNotFound;
    v4[36] |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_status;
    *(unsigned char *)(v5 + 36) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_feedbackRequestType;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  id v8 = [(GEORPFeedbackResult *)self->_feedbackResult copyWithZone:a3];
  v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  char v10 = (char)self->_flags;
  if ((v10 & 8) != 0)
  {
    *(unsigned char *)(v6 + 33) = self->_discardLogs;
    *(unsigned char *)(v6 + 36) |= 8u;
    char v10 = (char)self->_flags;
  }
  if ((v10 & 4) != 0)
  {
    *(unsigned char *)(v6 + 32) = self->_attestationNotFound;
    *(unsigned char *)(v6 + 36) |= 4u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  [(GEORPFeedbackResponse *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 36);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_status != *((_DWORD *)v4 + 7)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_feedbackRequestType != *((_DWORD *)v4 + 6)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_25;
  }
  feedbackResult = self->_feedbackResult;
  if ((unint64_t)feedbackResult | *((void *)v4 + 2))
  {
    if (!-[GEORPFeedbackResult isEqual:](feedbackResult, "isEqual:")) {
      goto LABEL_25;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 36);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0) {
      goto LABEL_25;
    }
    if (self->_discardLogs)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_25;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_25;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_25;
  }
  BOOL v8 = (v6 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) != 0)
    {
      if (self->_attestationNotFound)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_25;
        }
      }
      else if (*((unsigned char *)v4 + 32))
      {
        goto LABEL_25;
      }
      BOOL v8 = 1;
      goto LABEL_26;
    }
LABEL_25:
    BOOL v8 = 0;
  }
LABEL_26:

  return v8;
}

- (unint64_t)hash
{
  [(GEORPFeedbackResponse *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_status;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_feedbackRequestType;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = [(GEORPFeedbackResult *)self->_feedbackResult hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v6 = 2654435761 * self->_discardLogs;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v7 = 2654435761 * self->_attestationNotFound;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  v9 = (int *)a3;
  [v9 readAll:0];
  uint64_t v4 = (BOOL *)v9;
  char v5 = *((unsigned char *)v9 + 36);
  if ((v5 & 2) != 0)
  {
    self->_status = v9[7];
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v9 + 36);
  }
  if (v5)
  {
    self->_feedbackRequestType = v9[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
  feedbackResult = self->_feedbackResult;
  uint64_t v7 = *((void *)v9 + 2);
  if (feedbackResult)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEORPFeedbackResult mergeFrom:](feedbackResult, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEORPFeedbackResponse setFeedbackResult:](self, "setFeedbackResult:");
  }
  uint64_t v4 = (BOOL *)v9;
LABEL_11:
  BOOL v8 = v4[36];
  if ((v8 & 8) != 0)
  {
    self->_discardLogs = v4[33];
    *(unsigned char *)&self->_flags |= 8u;
    BOOL v8 = v4[36];
  }
  if ((v8 & 4) != 0)
  {
    self->_attestationNotFound = v4[32];
    *(unsigned char *)&self->_flags |= 4u;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPFeedbackResponse *)self readAll:0];
    feedbackResult = self->_feedbackResult;
    [(GEORPFeedbackResult *)feedbackResult clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackResult, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end