@interface GEORideBookingIntentResponseFailure
+ (BOOL)isValid:(id)a3;
- (BOOL)hasFailure;
- (BOOL)hasIntent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORideBookingIntentResponseFailure)initWithDictionary:(id)a3;
- (GEORideBookingIntentResponseFailure)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)failureAsString:(int)a3;
- (id)intentAsString:(int)a3;
- (int)StringAsFailure:(id)a3;
- (int)StringAsIntent:(id)a3;
- (int)failure;
- (int)intent;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFailure:(int)a3;
- (void)setHasFailure:(BOOL)a3;
- (void)setHasIntent:(BOOL)a3;
- (void)setIntent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORideBookingIntentResponseFailure

- (int)intent
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_intent;
  }
  else {
    return 0;
  }
}

- (void)setIntent:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_intent = a3;
}

- (void)setHasIntent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIntent
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)intentAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F6E48[a3];
  }

  return v3;
}

- (int)StringAsIntent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RBI_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RBI_HANDLE_LIST_RIDE_OPTIONS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RBI_CONFIRM_REQUEST_RIDE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RBI_HANDLE_REQUEST_RIDE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RBI_HANDLE_GET_RIDE_STATUS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RBI_CONFIRM_CANCEL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RBI_HANDLE_CANCEL"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RBI_HANDLE_SEND_FEEDBACK"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)failure
{
  if (*(unsigned char *)&self->_flags) {
    return self->_failure;
  }
  else {
    return 0;
  }
}

- (void)setFailure:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_failure = a3;
}

- (void)setHasFailure:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFailure
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)failureAsString:(int)a3
{
  if (a3 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F6E88[a3];
  }

  return v3;
}

- (int)StringAsFailure:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RBRF_NOT_SET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RBRF_RESPONSE_TIMEOUT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RBRF_RESPONSE_NIL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RBRF_RESPONSE_CODE_UNSPECIFIED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RBRF_RESPONSE_CODE_GENERIC_ERROR"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RBRF_RESPONSE_CODE_REQUIRES_APP_LAUNCH"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RBRF_RESPONSE_CODE_REQUIRES_VERIFY_CREDENTIALS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RBRF_RESPONSE_CODE_NO_SERVICE_IN_AREA"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RBRF_RESPONSE_CODE_SERVICE_TEMPORARILY_UNAVAILABLE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"RBRF_RESPONSE_CODE_REQUIRES_APP_COMPLETION"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"RBRF_RESPONSE_CODE_REQUIRES_FEEDBACK"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"RBRF_RESPONSE_RIDE_OPTION_MISSING_NAME"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"RBRF_RESPONSE_RIDE_OPTION_MISSING_ETA"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"RBRF_RESPONSE_RIDE_MISSING_IDENTIFIER"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"RBRF_RESPONSE_RIDE_PHASE_UNKNOWN"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"RBRF_RESPONSE_RIDE_OPTIONS_NOT_AVAILABLE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"RBRF_RESPONSE_RIDE_PICKUP_LOCATION_INVALID"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"RBRF_RESPONSE_RIDE_VEHICLE_LOCATION_INVALID"])
  {
    int v4 = 17;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORideBookingIntentResponseFailure;
  int v4 = [(GEORideBookingIntentResponseFailure *)&v8 description];
  v5 = [(GEORideBookingIntentResponseFailure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    char v3 = *(unsigned char *)(a1 + 16);
    if ((v3 & 2) != 0)
    {
      uint64_t v4 = *(int *)(a1 + 12);
      if (v4 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 12));
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = off_1E53F6E48[v4];
      }
      [v2 setObject:v5 forKey:@"intent"];

      char v3 = *(unsigned char *)(a1 + 16);
    }
    if (v3)
    {
      uint64_t v6 = *(int *)(a1 + 8);
      if (v6 >= 0x12)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53F6E88[v6];
      }
      [v2 setObject:v7 forKey:@"failure"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEORideBookingIntentResponseFailure)initWithDictionary:(id)a3
{
  return (GEORideBookingIntentResponseFailure *)-[GEORideBookingIntentResponseFailure _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      uint64_t v4 = [v3 objectForKeyedSubscript:@"intent"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = v4;
        if ([v5 isEqualToString:@"RBI_UNKNOWN"])
        {
          uint64_t v6 = 0;
        }
        else if ([v5 isEqualToString:@"RBI_HANDLE_LIST_RIDE_OPTIONS"])
        {
          uint64_t v6 = 1;
        }
        else if ([v5 isEqualToString:@"RBI_CONFIRM_REQUEST_RIDE"])
        {
          uint64_t v6 = 2;
        }
        else if ([v5 isEqualToString:@"RBI_HANDLE_REQUEST_RIDE"])
        {
          uint64_t v6 = 3;
        }
        else if ([v5 isEqualToString:@"RBI_HANDLE_GET_RIDE_STATUS"])
        {
          uint64_t v6 = 4;
        }
        else if ([v5 isEqualToString:@"RBI_CONFIRM_CANCEL"])
        {
          uint64_t v6 = 5;
        }
        else if ([v5 isEqualToString:@"RBI_HANDLE_CANCEL"])
        {
          uint64_t v6 = 6;
        }
        else if ([v5 isEqualToString:@"RBI_HANDLE_SEND_FEEDBACK"])
        {
          uint64_t v6 = 7;
        }
        else
        {
          uint64_t v6 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_25;
        }
        uint64_t v6 = [v4 intValue];
      }
      [a1 setIntent:v6];
LABEL_25:

      v7 = [v3 objectForKeyedSubscript:@"failure"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"RBRF_NOT_SET"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"RBRF_RESPONSE_TIMEOUT"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"RBRF_RESPONSE_NIL"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"RBRF_RESPONSE_CODE_UNSPECIFIED"])
        {
          uint64_t v9 = 3;
        }
        else if ([v8 isEqualToString:@"RBRF_RESPONSE_CODE_GENERIC_ERROR"])
        {
          uint64_t v9 = 4;
        }
        else if ([v8 isEqualToString:@"RBRF_RESPONSE_CODE_REQUIRES_APP_LAUNCH"])
        {
          uint64_t v9 = 5;
        }
        else if ([v8 isEqualToString:@"RBRF_RESPONSE_CODE_REQUIRES_VERIFY_CREDENTIALS"])
        {
          uint64_t v9 = 6;
        }
        else if ([v8 isEqualToString:@"RBRF_RESPONSE_CODE_NO_SERVICE_IN_AREA"])
        {
          uint64_t v9 = 7;
        }
        else if ([v8 isEqualToString:@"RBRF_RESPONSE_CODE_SERVICE_TEMPORARILY_UNAVAILABLE"])
        {
          uint64_t v9 = 8;
        }
        else if ([v8 isEqualToString:@"RBRF_RESPONSE_CODE_REQUIRES_APP_COMPLETION"])
        {
          uint64_t v9 = 9;
        }
        else if ([v8 isEqualToString:@"RBRF_RESPONSE_CODE_REQUIRES_FEEDBACK"])
        {
          uint64_t v9 = 10;
        }
        else if ([v8 isEqualToString:@"RBRF_RESPONSE_RIDE_OPTION_MISSING_NAME"])
        {
          uint64_t v9 = 11;
        }
        else if ([v8 isEqualToString:@"RBRF_RESPONSE_RIDE_OPTION_MISSING_ETA"])
        {
          uint64_t v9 = 12;
        }
        else if ([v8 isEqualToString:@"RBRF_RESPONSE_RIDE_MISSING_IDENTIFIER"])
        {
          uint64_t v9 = 13;
        }
        else if ([v8 isEqualToString:@"RBRF_RESPONSE_RIDE_PHASE_UNKNOWN"])
        {
          uint64_t v9 = 14;
        }
        else if ([v8 isEqualToString:@"RBRF_RESPONSE_RIDE_OPTIONS_NOT_AVAILABLE"])
        {
          uint64_t v9 = 15;
        }
        else if ([v8 isEqualToString:@"RBRF_RESPONSE_RIDE_PICKUP_LOCATION_INVALID"])
        {
          uint64_t v9 = 16;
        }
        else if ([v8 isEqualToString:@"RBRF_RESPONSE_RIDE_VEHICLE_LOCATION_INVALID"])
        {
          uint64_t v9 = 17;
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_67:

          goto LABEL_68;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setFailure:v9];
      goto LABEL_67;
    }
  }
LABEL_68:

  return a1;
}

- (GEORideBookingIntentResponseFailure)initWithJSON:(id)a3
{
  return (GEORideBookingIntentResponseFailure *)-[GEORideBookingIntentResponseFailure _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEORideBookingIntentResponseFailureIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORideBookingIntentResponseFailureReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEORideBookingIntentResponseFailure *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = self->_intent;
    *((unsigned char *)v5 + 16) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[2] = self->_failure;
    *((unsigned char *)v5 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_intent;
    *((unsigned char *)result + 16) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)result + 2) = self->_failure;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEORideBookingIntentResponseFailure *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_intent != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_failure != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEORideBookingIntentResponseFailure *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_intent;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_failure;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 16);
  if ((v4 & 2) != 0)
  {
    self->_intent = v5[3];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 16);
  }
  if (v4)
  {
    self->_failure = v5[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end