@interface GEORPProblemResponse
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIsNotificationSupported;
- (BOOL)hasProblemId;
- (BOOL)hasStatusCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNotificationSupported;
- (BOOL)readFrom:(id)a3;
- (GEORPProblemResponse)initWithDictionary:(id)a3;
- (GEORPProblemResponse)initWithJSON:(id)a3;
- (NSString)problemId;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)statusCodeAsString:(int)a3;
- (int)StringAsStatusCode:(id)a3;
- (int)statusCode;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsNotificationSupported:(BOOL)a3;
- (void)setHasStatusCode:(BOOL)a3;
- (void)setIsNotificationSupported:(BOOL)a3;
- (void)setProblemId:(id)a3;
- (void)setStatusCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPProblemResponse

- (int)statusCode
{
  if (*(unsigned char *)&self->_flags) {
    return self->_statusCode;
  }
  else {
    return 0;
  }
}

- (void)setStatusCode:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_statusCode = a3;
}

- (void)setHasStatusCode:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasStatusCode
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)statusCodeAsString:(int)a3
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

- (int)StringAsStatusCode:(id)a3
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

- (BOOL)hasProblemId
{
  return self->_problemId != 0;
}

- (NSString)problemId
{
  return self->_problemId;
}

- (void)setProblemId:(id)a3
{
}

- (BOOL)isNotificationSupported
{
  return self->_isNotificationSupported;
}

- (void)setIsNotificationSupported:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_isNotificationSupported = a3;
}

- (void)setHasIsNotificationSupported:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsNotificationSupported
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPProblemResponse;
  int v4 = [(GEORPProblemResponse *)&v8 description];
  v5 = [(GEORPProblemResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_34;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)(a1 + 24))
  {
    int v5 = *(_DWORD *)(a1 + 16);
    if (v5 <= 29)
    {
      v6 = @"STATUS_SUCCESS";
      switch(v5)
      {
        case 0:
          goto LABEL_20;
        case 1:
          v6 = @"STATUS_FAILED";
          break;
        case 2:
          v6 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          v6 = @"INVALID_REQUEST";
          break;
        default:
          if (v5 != 20) {
            goto LABEL_15;
          }
          v6 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_20;
    }
    if (v5 > 49)
    {
      if (v5 == 50)
      {
        v6 = @"STATUS_DEDUPED";
        goto LABEL_20;
      }
      if (v5 == 60)
      {
        v6 = @"VERSION_MISMATCH";
        goto LABEL_20;
      }
    }
    else
    {
      if (v5 == 30)
      {
        v6 = @"NEEDS_REFINEMENT";
        goto LABEL_20;
      }
      if (v5 == 40)
      {
        v6 = @"FAILED_NOT_AUTHORIZED";
LABEL_20:
        if (a2) {
          v7 = @"statusCode";
        }
        else {
          v7 = @"status_code";
        }
        [v4 setObject:v6 forKey:v7];

        goto LABEL_24;
      }
    }
LABEL_15:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 16));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_24:
  objc_super v8 = [(id)a1 problemId];
  if (v8)
  {
    if (a2) {
      v9 = @"problemId";
    }
    else {
      v9 = @"problem_id";
    }
    [v4 setObject:v8 forKey:v9];
  }

  if ((*(unsigned char *)(a1 + 24) & 2) != 0)
  {
    v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 20)];
    if (a2) {
      v11 = @"isNotificationSupported";
    }
    else {
      v11 = @"is_notification_supported";
    }
    [v4 setObject:v10 forKey:v11];
  }
LABEL_34:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPProblemResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPProblemResponse)initWithDictionary:(id)a3
{
  return (GEORPProblemResponse *)-[GEORPProblemResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_41;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_41;
  }
  if (a3) {
    v6 = @"statusCode";
  }
  else {
    v6 = @"status_code";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"STATUS_SUCCESS"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"STATUS_FAILED"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"INVALID_REQUEST"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"FAILED_NO_RESULT"])
    {
      uint64_t v9 = 20;
    }
    else if ([v8 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      uint64_t v9 = 30;
    }
    else if ([v8 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      uint64_t v9 = 40;
    }
    else if ([v8 isEqualToString:@"STATUS_DEDUPED"])
    {
      uint64_t v9 = 50;
    }
    else if ([v8 isEqualToString:@"VERSION_MISMATCH"])
    {
      uint64_t v9 = 60;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_29:
    [a1 setStatusCode:v9];
  }

  if (a3) {
    v10 = @"problemId";
  }
  else {
    v10 = @"problem_id";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = (void *)[v11 copy];
    [a1 setProblemId:v12];
  }
  if (a3) {
    v13 = @"isNotificationSupported";
  }
  else {
    v13 = @"is_notification_supported";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsNotificationSupported:", objc_msgSend(v14, "BOOLValue"));
  }

LABEL_41:
  return a1;
}

- (GEORPProblemResponse)initWithJSON:(id)a3
{
  return (GEORPProblemResponse *)-[GEORPProblemResponse _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemResponseReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_problemId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEORPProblemResponse *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 4) = self->_statusCode;
    v5[24] |= 1u;
  }
  if (self->_problemId)
  {
    objc_msgSend(v5, "setProblemId:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v4[20] = self->_isNotificationSupported;
    v4[24] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_statusCode;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_problemId copyWithZone:a3];
  id v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v6 + 20) = self->_isNotificationSupported;
    *(unsigned char *)(v6 + 24) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  [(GEORPProblemResponse *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 24);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_statusCode != *((_DWORD *)v4 + 4)) {
      goto LABEL_12;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_12;
  }
  problemId = self->_problemId;
  if ((unint64_t)problemId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](problemId, "isEqual:")) {
      goto LABEL_12;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 24);
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) != 0)
    {
      if (self->_isNotificationSupported)
      {
        if (!*((unsigned char *)v4 + 20)) {
          goto LABEL_12;
        }
      }
      else if (*((unsigned char *)v4 + 20))
      {
        goto LABEL_12;
      }
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  [(GEORPProblemResponse *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_statusCode;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_problemId hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_isNotificationSupported;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (int *)a3;
  [v5 readAll:0];
  NSUInteger v4 = (BOOL *)v5;
  if (v5[6])
  {
    self->_statusCode = v5[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 1))
  {
    -[GEORPProblemResponse setProblemId:](self, "setProblemId:");
    NSUInteger v4 = (BOOL *)v5;
  }
  if ((v4[24] & 2) != 0)
  {
    self->_isNotificationSupported = v4[20];
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
}

@end