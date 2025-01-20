@interface DRSProtoDiagnosticRequestOutcomeBucket
- (BOOL)hasCount;
- (BOOL)hasOutcome;
- (BOOL)hasRequestState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)outcomeAsString:(int)a3;
- (id)requestStateAsString:(int)a3;
- (int)StringAsOutcome:(id)a3;
- (int)StringAsRequestState:(id)a3;
- (int)outcome;
- (int)requestState;
- (unint64_t)count;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasOutcome:(BOOL)a3;
- (void)setHasRequestState:(BOOL)a3;
- (void)setOutcome:(int)a3;
- (void)setRequestState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation DRSProtoDiagnosticRequestOutcomeBucket

- (int)outcome
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_outcome;
  }
  else {
    return 1;
  }
}

- (void)setOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_outcome = a3;
}

- (void)setHasOutcome:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOutcome
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)outcomeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_263FCA298[a3 - 1];
  }

  return v3;
}

- (int)StringAsOutcome:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ERROR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SUCCESS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REJECTED"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (int)requestState
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_requestState;
  }
  else {
    return 4096;
  }
}

- (void)setRequestState:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_requestState = a3;
}

- (void)setHasRequestState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRequestState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)requestStateAsString:(int)a3
{
  if (!(!v4 & v3))
  {
    v7 = @"REJECTED_RESOURCE_HYSTERESIS";
    switch(a3)
    {
      case 4096:
        goto LABEL_55;
      case 4097:
        v7 = @"REJECTED_RESOURCE_CAP";
        return v7;
      case 4098:
        v7 = @"REJECTED_RESOURCE_RANDOM_DOWNSAMPLING";
        return v7;
      case 4099:
        v7 = @"REJECTED_SIGNATURE_HYSTERESIS";
        return v7;
      case 4100:
        v7 = @"REJECTED_SIGNATURE_CAP";
        return v7;
      case 4101:
        v7 = @"REJECTED_SIGNATURE_RANDOM_DOWNSAMPLING";
        return v7;
      case 4102:
        v7 = @"REJECTED_TOTAL_CAP";
        return v7;
      case 4103:
        v7 = @"REJECTED_DISABLED_SERVICE";
        return v7;
      default:
        JUMPOUT(0);
    }
  }
  switch(a3)
  {
    case 4352:
      v7 = @"ERROR_ON_RECEIPT_WORK_FAILURE";
      break;
    case 4353:
      v7 = @"REJECTED_REJECTED_BY_DS";
      break;
    case 4354:
      v7 = @"ERROR_LOG_CULLED";
      break;
    case 4355:
      v7 = @"ERROR_UPLOAD_ATTEMPTS_FAILED";
      break;
    case 4356:
      v7 = @"REJECTED_CUSTOMER_DISABLED";
      break;
    case 4357:
      v7 = @"ERROR_LOG_EXCEEDS_CAP";
      break;
    case 4358:
      v7 = @"ERROR_INVALID_TRANSITION";
      break;
    case 4359:
      v7 = @"ERROR_LOG_STATE_UPDATE_FAILURE";
      break;
    default:
      if (a3 == 0x2000)
      {
        v7 = @"SUCCESS_UPLOADED";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_55:
      }
      break;
  }
  return v7;
}

- (int)StringAsRequestState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"REJECTED_RESOURCE_HYSTERESIS"])
  {
    int v4 = 4096;
  }
  else if ([v3 isEqualToString:@"REJECTED_RESOURCE_CAP"])
  {
    int v4 = 4097;
  }
  else if ([v3 isEqualToString:@"REJECTED_RESOURCE_RANDOM_DOWNSAMPLING"])
  {
    int v4 = 4098;
  }
  else if ([v3 isEqualToString:@"REJECTED_SIGNATURE_HYSTERESIS"])
  {
    int v4 = 4099;
  }
  else if ([v3 isEqualToString:@"REJECTED_SIGNATURE_CAP"])
  {
    int v4 = 4100;
  }
  else if ([v3 isEqualToString:@"REJECTED_SIGNATURE_RANDOM_DOWNSAMPLING"])
  {
    int v4 = 4101;
  }
  else if ([v3 isEqualToString:@"REJECTED_TOTAL_CAP"])
  {
    int v4 = 4102;
  }
  else if ([v3 isEqualToString:@"REJECTED_DISABLED_SERVICE"])
  {
    int v4 = 4103;
  }
  else if ([v3 isEqualToString:@"REJECTED_REJECTED_BY_DS"])
  {
    int v4 = 4353;
  }
  else if ([v3 isEqualToString:@"REJECTED_CUSTOMER_DISABLED"])
  {
    int v4 = 4356;
  }
  else if ([v3 isEqualToString:@"ERROR_ON_RECEIPT_WORK_FAILURE"])
  {
    int v4 = 4352;
  }
  else if ([v3 isEqualToString:@"ERROR_LOG_CULLED"])
  {
    int v4 = 4354;
  }
  else if ([v3 isEqualToString:@"ERROR_UPLOAD_ATTEMPTS_FAILED"])
  {
    int v4 = 4355;
  }
  else if ([v3 isEqualToString:@"ERROR_LOG_EXCEEDS_CAP"])
  {
    int v4 = 4357;
  }
  else if ([v3 isEqualToString:@"ERROR_INVALID_TRANSITION"])
  {
    int v4 = 4358;
  }
  else if ([v3 isEqualToString:@"ERROR_LOG_STATE_UPDATE_FAILURE"])
  {
    int v4 = 4359;
  }
  else if ([v3 isEqualToString:@"SUCCESS_UPLOADED"])
  {
    int v4 = 0x2000;
  }
  else
  {
    int v4 = 4096;
  }

  return v4;
}

- (void)setCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoDiagnosticRequestOutcomeBucket;
  int v4 = [(DRSProtoDiagnosticRequestOutcomeBucket *)&v8 description];
  uint64_t v5 = [(DRSProtoDiagnosticRequestOutcomeBucket *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v9 = self->_outcome - 1;
    if (v9 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_outcome);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_263FCA298[v9];
    }
    [v5 setObject:v10 forKey:@"outcome"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  int requestState = self->_requestState;
  if (!v4 & v3)
  {
    switch(requestState)
    {
      case 4352:
        v12 = @"ERROR_ON_RECEIPT_WORK_FAILURE";
        break;
      case 4353:
        v12 = @"REJECTED_REJECTED_BY_DS";
        break;
      case 4354:
        v12 = @"ERROR_LOG_CULLED";
        break;
      case 4355:
        v12 = @"ERROR_UPLOAD_ATTEMPTS_FAILED";
        break;
      case 4356:
        v12 = @"REJECTED_CUSTOMER_DISABLED";
        break;
      case 4357:
        v12 = @"ERROR_LOG_EXCEEDS_CAP";
        break;
      case 4358:
        v12 = @"ERROR_INVALID_TRANSITION";
        break;
      case 4359:
        v12 = @"ERROR_LOG_STATE_UPDATE_FAILURE";
        break;
      default:
        if (requestState == 0x2000)
        {
          v12 = @"SUCCESS_UPLOADED";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_requestState);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
  }
  else
  {
    v12 = @"REJECTED_RESOURCE_HYSTERESIS";
    switch(requestState)
    {
      case 4096:
        break;
      case 4097:
        v12 = @"REJECTED_RESOURCE_CAP";
        break;
      case 4098:
        v12 = @"REJECTED_RESOURCE_RANDOM_DOWNSAMPLING";
        break;
      case 4099:
        v12 = @"REJECTED_SIGNATURE_HYSTERESIS";
        break;
      case 4100:
        v12 = @"REJECTED_SIGNATURE_CAP";
        break;
      case 4101:
        v12 = @"REJECTED_SIGNATURE_RANDOM_DOWNSAMPLING";
        break;
      case 4102:
        v12 = @"REJECTED_TOTAL_CAP";
        break;
      case 4103:
        v12 = @"REJECTED_DISABLED_SERVICE";
        break;
      default:
        JUMPOUT(0);
    }
  }
  [v5 setObject:v12 forKey:@"request_state"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v7 = [NSNumber numberWithUnsignedLongLong:self->_count];
    [v5 setObject:v7 forKey:@"count"];
  }
LABEL_5:

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoDiagnosticRequestOutcomeBucketReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[4] = self->_outcome;
    *((unsigned char *)v4 + 24) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_requestState;
  *((unsigned char *)v4 + 24) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((void *)v4 + 1) = self->_count;
    *((unsigned char *)v4 + 24) |= 1u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_outcome;
    *((unsigned char *)result + 24) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_requestState;
  *((unsigned char *)result + 24) |= 4u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 1) = self->_count;
  *((unsigned char *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_outcome != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_requestState != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_count != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_outcome;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_requestState;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v4 = 2654435761u * self->_count;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) != 0)
  {
    self->_outcome = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_int requestState = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 24))
  {
LABEL_4:
    self->_count = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
}

- (unint64_t)count
{
  return self->_count;
}

@end