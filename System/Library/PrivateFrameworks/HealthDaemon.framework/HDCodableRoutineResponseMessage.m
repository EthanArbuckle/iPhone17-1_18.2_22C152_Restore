@interface HDCodableRoutineResponseMessage
- (BOOL)hasErrorDescription;
- (BOOL)hasFetchLocationResponse;
- (BOOL)hasFetchNextLocationResponse;
- (BOOL)hasRequestIdentifier;
- (BOOL)hasRequestType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableRoutineLocationResponse)fetchLocationResponse;
- (HDCodableRoutinePredictedLocationsResponse)fetchNextLocationResponse;
- (NSString)errorDescription;
- (NSString)requestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)requestTypeAsString:(int)a3;
- (int)StringAsRequestType:(id)a3;
- (int)requestType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorDescription:(id)a3;
- (void)setFetchLocationResponse:(id)a3;
- (void)setFetchNextLocationResponse:(id)a3;
- (void)setHasRequestType:(BOOL)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setRequestType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableRoutineResponseMessage

- (int)requestType
{
  if (*(unsigned char *)&self->_has) {
    return self->_requestType;
  }
  else {
    return 1;
  }
}

- (void)setRequestType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_requestType = a3;
}

- (void)setHasRequestType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)requestTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E6307448[a3 - 1];
  }

  return v3;
}

- (int)StringAsRequestType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FetchLocation"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FetchNextLocations"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ScenarioTriggered"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (BOOL)hasFetchLocationResponse
{
  return self->_fetchLocationResponse != 0;
}

- (BOOL)hasFetchNextLocationResponse
{
  return self->_fetchNextLocationResponse != 0;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableRoutineResponseMessage;
  int v4 = [(HDCodableRoutineResponseMessage *)&v8 description];
  v5 = [(HDCodableRoutineResponseMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = self->_requestType - 1;
    if (v4 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_requestType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E6307448[v4];
    }
    [v3 setObject:v5 forKey:@"requestType"];
  }
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier) {
    [v3 setObject:requestIdentifier forKey:@"requestIdentifier"];
  }
  fetchLocationResponse = self->_fetchLocationResponse;
  if (fetchLocationResponse)
  {
    objc_super v8 = [(HDCodableRoutineLocationResponse *)fetchLocationResponse dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"fetchLocationResponse"];
  }
  fetchNextLocationResponse = self->_fetchNextLocationResponse;
  if (fetchNextLocationResponse)
  {
    v10 = [(HDCodableRoutinePredictedLocationsResponse *)fetchNextLocationResponse dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"fetchNextLocationResponse"];
  }
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [v3 setObject:errorDescription forKey:@"errorDescription"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRoutineResponseMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_requestIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_fetchLocationResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_fetchNextLocationResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[10] = self->_requestType;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  id v5 = v4;
  if (self->_requestIdentifier)
  {
    objc_msgSend(v4, "setRequestIdentifier:");
    id v4 = v5;
  }
  if (self->_fetchLocationResponse)
  {
    objc_msgSend(v5, "setFetchLocationResponse:");
    id v4 = v5;
  }
  if (self->_fetchNextLocationResponse)
  {
    objc_msgSend(v5, "setFetchNextLocationResponse:");
    id v4 = v5;
  }
  if (self->_errorDescription)
  {
    objc_msgSend(v5, "setErrorDescription:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_requestType;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_requestIdentifier copyWithZone:a3];
  objc_super v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = [(HDCodableRoutineLocationResponse *)self->_fetchLocationResponse copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  id v11 = [(HDCodableRoutinePredictedLocationsResponse *)self->_fetchNextLocationResponse copyWithZone:a3];
  v12 = (void *)v6[3];
  v6[3] = v11;

  uint64_t v13 = [(NSString *)self->_errorDescription copyWithZone:a3];
  v14 = (void *)v6[1];
  v6[1] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_requestType != *((_DWORD *)v4 + 10)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  requestIdentifier = self->_requestIdentifier;
  if ((unint64_t)requestIdentifier | *((void *)v4 + 4)
    && !-[NSString isEqual:](requestIdentifier, "isEqual:"))
  {
    goto LABEL_15;
  }
  fetchLocationResponse = self->_fetchLocationResponse;
  if ((unint64_t)fetchLocationResponse | *((void *)v4 + 2))
  {
    if (!-[HDCodableRoutineLocationResponse isEqual:](fetchLocationResponse, "isEqual:")) {
      goto LABEL_15;
    }
  }
  fetchNextLocationResponse = self->_fetchNextLocationResponse;
  if ((unint64_t)fetchNextLocationResponse | *((void *)v4 + 3))
  {
    if (!-[HDCodableRoutinePredictedLocationsResponse isEqual:](fetchNextLocationResponse, "isEqual:")) {
      goto LABEL_15;
    }
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((void *)v4 + 1)) {
    char v9 = -[NSString isEqual:](errorDescription, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_requestType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_requestIdentifier hash] ^ v3;
  unint64_t v5 = [(HDCodableRoutineLocationResponse *)self->_fetchLocationResponse hash];
  unint64_t v6 = v4 ^ v5 ^ [(HDCodableRoutinePredictedLocationsResponse *)self->_fetchNextLocationResponse hash];
  return v6 ^ [(NSString *)self->_errorDescription hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (*((unsigned char *)v4 + 44))
  {
    self->_requestType = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  v10 = v4;
  if (*((void *)v4 + 4))
  {
    -[HDCodableRoutineResponseMessage setRequestIdentifier:](self, "setRequestIdentifier:");
    unint64_t v5 = v10;
  }
  fetchLocationResponse = self->_fetchLocationResponse;
  uint64_t v7 = v5[2];
  if (fetchLocationResponse)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[HDCodableRoutineLocationResponse mergeFrom:](fetchLocationResponse, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[HDCodableRoutineResponseMessage setFetchLocationResponse:](self, "setFetchLocationResponse:");
  }
  unint64_t v5 = v10;
LABEL_11:
  fetchNextLocationResponse = self->_fetchNextLocationResponse;
  uint64_t v9 = v5[3];
  if (fetchNextLocationResponse)
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[HDCodableRoutinePredictedLocationsResponse mergeFrom:](fetchNextLocationResponse, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[HDCodableRoutineResponseMessage setFetchNextLocationResponse:](self, "setFetchNextLocationResponse:");
  }
  unint64_t v5 = v10;
LABEL_17:
  if (v5[1])
  {
    -[HDCodableRoutineResponseMessage setErrorDescription:](self, "setErrorDescription:");
    unint64_t v5 = v10;
  }
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (HDCodableRoutineLocationResponse)fetchLocationResponse
{
  return self->_fetchLocationResponse;
}

- (void)setFetchLocationResponse:(id)a3
{
}

- (HDCodableRoutinePredictedLocationsResponse)fetchNextLocationResponse
{
  return self->_fetchNextLocationResponse;
}

- (void)setFetchNextLocationResponse:(id)a3
{
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_fetchNextLocationResponse, 0);
  objc_storeStrong((id *)&self->_fetchLocationResponse, 0);

  objc_storeStrong((id *)&self->_errorDescription, 0);
}

@end