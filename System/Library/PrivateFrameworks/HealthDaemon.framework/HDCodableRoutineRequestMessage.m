@interface HDCodableRoutineRequestMessage
- (BOOL)hasFetchLocationRequest;
- (BOOL)hasRequestIdentifier;
- (BOOL)hasRequestType;
- (BOOL)hasScenarioTriggeredRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableRoutineLocationRequest)fetchLocationRequest;
- (HDCodableRoutineScenarioTriggeredRequest)scenarioTriggeredRequest;
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
- (void)setFetchLocationRequest:(id)a3;
- (void)setHasRequestType:(BOOL)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setRequestType:(int)a3;
- (void)setScenarioTriggeredRequest:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableRoutineRequestMessage

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
    v3 = off_1E6304C78[a3 - 1];
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

- (BOOL)hasFetchLocationRequest
{
  return self->_fetchLocationRequest != 0;
}

- (BOOL)hasScenarioTriggeredRequest
{
  return self->_scenarioTriggeredRequest != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableRoutineRequestMessage;
  int v4 = [(HDCodableRoutineRequestMessage *)&v8 description];
  v5 = [(HDCodableRoutineRequestMessage *)self dictionaryRepresentation];
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
      v5 = off_1E6304C78[v4];
    }
    [v3 setObject:v5 forKey:@"requestType"];
  }
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier) {
    [v3 setObject:requestIdentifier forKey:@"requestIdentifier"];
  }
  fetchLocationRequest = self->_fetchLocationRequest;
  if (fetchLocationRequest)
  {
    objc_super v8 = [(HDCodableRoutineLocationRequest *)fetchLocationRequest dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"fetchLocationRequest"];
  }
  scenarioTriggeredRequest = self->_scenarioTriggeredRequest;
  if (scenarioTriggeredRequest)
  {
    v10 = [(HDCodableRoutineScenarioTriggeredRequest *)scenarioTriggeredRequest dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"scenarioTriggeredRequest"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRoutineRequestMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_fetchLocationRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_scenarioTriggeredRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_requestType;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v5 = v4;
  if (self->_requestIdentifier)
  {
    objc_msgSend(v4, "setRequestIdentifier:");
    id v4 = v5;
  }
  if (self->_fetchLocationRequest)
  {
    objc_msgSend(v5, "setFetchLocationRequest:");
    id v4 = v5;
  }
  if (self->_scenarioTriggeredRequest)
  {
    objc_msgSend(v5, "setScenarioTriggeredRequest:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_requestType;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_requestIdentifier copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(HDCodableRoutineLocationRequest *)self->_fetchLocationRequest copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  id v11 = [(HDCodableRoutineScenarioTriggeredRequest *)self->_scenarioTriggeredRequest copyWithZone:a3];
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_requestType != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  requestIdentifier = self->_requestIdentifier;
  if ((unint64_t)requestIdentifier | *((void *)v4 + 2)
    && !-[NSString isEqual:](requestIdentifier, "isEqual:"))
  {
    goto LABEL_13;
  }
  fetchLocationRequest = self->_fetchLocationRequest;
  if ((unint64_t)fetchLocationRequest | *((void *)v4 + 1))
  {
    if (!-[HDCodableRoutineLocationRequest isEqual:](fetchLocationRequest, "isEqual:")) {
      goto LABEL_13;
    }
  }
  scenarioTriggeredRequest = self->_scenarioTriggeredRequest;
  if ((unint64_t)scenarioTriggeredRequest | *((void *)v4 + 4)) {
    char v8 = -[HDCodableRoutineScenarioTriggeredRequest isEqual:](scenarioTriggeredRequest, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
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
  unint64_t v5 = [(HDCodableRoutineLocationRequest *)self->_fetchLocationRequest hash];
  return v4 ^ v5 ^ [(HDCodableRoutineScenarioTriggeredRequest *)self->_scenarioTriggeredRequest hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (*((unsigned char *)v4 + 40))
  {
    self->_requestType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  v10 = v4;
  if (*((void *)v4 + 2))
  {
    -[HDCodableRoutineRequestMessage setRequestIdentifier:](self, "setRequestIdentifier:");
    unint64_t v5 = v10;
  }
  fetchLocationRequest = self->_fetchLocationRequest;
  uint64_t v7 = v5[1];
  if (fetchLocationRequest)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[HDCodableRoutineLocationRequest mergeFrom:](fetchLocationRequest, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[HDCodableRoutineRequestMessage setFetchLocationRequest:](self, "setFetchLocationRequest:");
  }
  unint64_t v5 = v10;
LABEL_11:
  scenarioTriggeredRequest = self->_scenarioTriggeredRequest;
  uint64_t v9 = v5[4];
  if (scenarioTriggeredRequest)
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[HDCodableRoutineScenarioTriggeredRequest mergeFrom:](scenarioTriggeredRequest, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[HDCodableRoutineRequestMessage setScenarioTriggeredRequest:](self, "setScenarioTriggeredRequest:");
  }
  unint64_t v5 = v10;
LABEL_17:
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (HDCodableRoutineLocationRequest)fetchLocationRequest
{
  return self->_fetchLocationRequest;
}

- (void)setFetchLocationRequest:(id)a3
{
}

- (HDCodableRoutineScenarioTriggeredRequest)scenarioTriggeredRequest
{
  return self->_scenarioTriggeredRequest;
}

- (void)setScenarioTriggeredRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenarioTriggeredRequest, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_fetchLocationRequest, 0);
}

@end