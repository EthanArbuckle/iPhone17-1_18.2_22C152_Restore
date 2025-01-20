@interface BMPBTombstoneEvent
- (BOOL)hasPolicyID;
- (BOOL)hasProcessName;
- (BOOL)hasSegmentName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (__CFString)reasonAsString:(__CFString *)a1;
- (double)eventTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)StringAsReason:(uint64_t)a1;
- (uint64_t)hasEventTimestamp;
- (uint64_t)hasLength;
- (uint64_t)hasOffset;
- (uint64_t)hasReason;
- (uint64_t)length;
- (uint64_t)offset;
- (uint64_t)policyID;
- (uint64_t)processName;
- (uint64_t)reason;
- (uint64_t)segmentName;
- (uint64_t)setEventTimestamp:(uint64_t)result;
- (uint64_t)setHasEventTimestamp:(uint64_t)result;
- (uint64_t)setHasLength:(uint64_t)result;
- (uint64_t)setHasOffset:(uint64_t)result;
- (uint64_t)setHasReason:(uint64_t)result;
- (uint64_t)setLength:(uint64_t)result;
- (uint64_t)setOffset:(uint64_t)result;
- (uint64_t)setReason:(uint64_t)result;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setPolicyID:(uint64_t)a1;
- (void)setProcessName:(uint64_t)a1;
- (void)setSegmentName:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation BMPBTombstoneEvent

- (BOOL)hasSegmentName
{
  if (result) {
    return *(void *)(result + 48) != 0;
  }
  return result;
}

- (uint64_t)setOffset:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 56) |= 4u;
    *(_DWORD *)(result + 20) = a2;
  }
  return result;
}

- (uint64_t)setHasOffset:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 4;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 56) = *(unsigned char *)(result + 56) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasOffset
{
  if (result) {
    return (*(unsigned __int8 *)(result + 56) >> 2) & 1;
  }
  return result;
}

- (uint64_t)setLength:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 56) |= 2u;
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasLength:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 56) = *(unsigned char *)(result + 56) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasLength
{
  if (result) {
    return (*(unsigned __int8 *)(result + 56) >> 1) & 1;
  }
  return result;
}

- (uint64_t)reason
{
  if (result)
  {
    if ((*(unsigned char *)(result + 56) & 8) != 0) {
      return *(unsigned int *)(result + 40);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)setReason:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 56) |= 8u;
    *(_DWORD *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setHasReason:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 8;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 56) = *(unsigned char *)(result + 56) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasReason
{
  if (result) {
    return (*(unsigned __int8 *)(result + 56) >> 3) & 1;
  }
  return result;
}

- (__CFString)reasonAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5E786E8[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsReason:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"Unknown"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"TTL"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"UserInitiated"])
    {
      uint64_t v6 = 2;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasProcessName
{
  if (result) {
    return *(void *)(result + 32) != 0;
  }
  return result;
}

- (uint64_t)setEventTimestamp:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 56) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasEventTimestamp:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 56) = *(unsigned char *)(result + 56) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasEventTimestamp
{
  if (result) {
    return *(unsigned char *)(result + 56) & 1;
  }
  return result;
}

- (BOOL)hasPolicyID
{
  if (result) {
    return *(void *)(result + 24) != 0;
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBTombstoneEvent;
  v4 = [(BMPBTombstoneEvent *)&v8 description];
  id v5 = [(BMPBTombstoneEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  segmentName = self->_segmentName;
  if (segmentName) {
    [v3 setObject:segmentName forKey:@"segmentName"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_offset];
    [v4 setObject:v7 forKey:@"offset"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_super v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_length];
  [v4 setObject:v8 forKey:@"length"];

  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t reason = self->_reason;
  if (reason >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_reason);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E5E786E8[reason];
  }
  [v4 setObject:v10 forKey:@"reason"];

LABEL_13:
  processName = self->_processName;
  if (processName) {
    [v4 setObject:processName forKey:@"processName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_eventTimestamp];
    [v4 setObject:v12 forKey:@"eventTimestamp"];
  }
  policyID = self->_policyID;
  if (policyID) {
    [v4 setObject:policyID forKey:@"policyID"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBTombstoneEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_segmentName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_7:
  if (self->_processName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_policyID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_14;
  }
  id v4 = *(void **)(a1 + 48);
  id v8 = v3;
  if (v4)
  {
    -[BMPBTombstoneEvent setSegmentName:]((uint64_t)v3, v4);
    id v3 = v8;
  }
  char v5 = *(unsigned char *)(a1 + 56);
  if ((v5 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 56) & 2) == 0) {
      goto LABEL_6;
    }
LABEL_18:
    *((_DWORD *)v3 + 4) = *(_DWORD *)(a1 + 16);
    *((unsigned char *)v3 + 56) |= 2u;
    if ((*(unsigned char *)(a1 + 56) & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  *((_DWORD *)v3 + 5) = *(_DWORD *)(a1 + 20);
  *((unsigned char *)v3 + 56) |= 4u;
  char v5 = *(unsigned char *)(a1 + 56);
  if ((v5 & 2) != 0) {
    goto LABEL_18;
  }
LABEL_6:
  if ((v5 & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v3 + 10) = *(_DWORD *)(a1 + 40);
    *((unsigned char *)v3 + 56) |= 8u;
  }
LABEL_8:
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    -[BMPBTombstoneEvent setProcessName:]((uint64_t)v8, v6);
    id v3 = v8;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    *((void *)v3 + 1) = *(void *)(a1 + 8);
    *((unsigned char *)v3 + 56) |= 1u;
  }
  v7 = *(void **)(a1 + 24);
  if (v7)
  {
    -[BMPBTombstoneEvent setPolicyID:]((uint64_t)v8, v7);
    id v3 = v8;
  }
LABEL_14:
}

- (void)setSegmentName:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setProcessName:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setPolicyID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_segmentName copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_offset;
    *(unsigned char *)(v5 + 56) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_length;
  *(unsigned char *)(v5 + 56) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 40) = self->_reason;
    *(unsigned char *)(v5 + 56) |= 8u;
  }
LABEL_5:
  uint64_t v9 = [(NSString *)self->_processName copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_eventTimestamp;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v11 = [(NSString *)self->_policyID copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  segmentName = self->_segmentName;
  if ((unint64_t)segmentName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](segmentName, "isEqual:")) {
      goto LABEL_29;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_offset != *((_DWORD *)v4 + 5)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_length != *((_DWORD *)v4 + 4)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_reason != *((_DWORD *)v4 + 10)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_29;
  }
  processName = self->_processName;
  if ((unint64_t)processName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](processName, "isEqual:"))
    {
LABEL_29:
      char v9 = 0;
      goto LABEL_30;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_eventTimestamp != *((double *)v4 + 1)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_29;
  }
  policyID = self->_policyID;
  if ((unint64_t)policyID | *((void *)v4 + 3)) {
    char v9 = -[NSString isEqual:](policyID, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_30:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_segmentName hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v4 = 2654435761 * self->_offset;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_length;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_reason;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v6 = 0;
LABEL_8:
  NSUInteger v7 = [(NSString *)self->_processName hash];
  if (*(unsigned char *)&self->_has)
  {
    double eventTimestamp = self->_eventTimestamp;
    double v10 = -eventTimestamp;
    if (eventTimestamp >= 0.0) {
      double v10 = self->_eventTimestamp;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_policyID hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  NSUInteger v3 = a2;
  if (!a1) {
    goto LABEL_14;
  }
  uint64_t v4 = (void *)v3[6];
  unint64_t v8 = v3;
  if (v4)
  {
    objc_storeStrong((id *)(a1 + 48), v4);
    NSUInteger v3 = v8;
  }
  char v5 = *((unsigned char *)v3 + 56);
  if ((v5 & 4) == 0)
  {
    if ((v3[7] & 2) == 0) {
      goto LABEL_6;
    }
LABEL_18:
    *(_DWORD *)(a1 + 16) = *((_DWORD *)v3 + 4);
    *(unsigned char *)(a1 + 56) |= 2u;
    if ((v3[7] & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  *(_DWORD *)(a1 + 20) = *((_DWORD *)v3 + 5);
  *(unsigned char *)(a1 + 56) |= 4u;
  char v5 = *((unsigned char *)v3 + 56);
  if ((v5 & 2) != 0) {
    goto LABEL_18;
  }
LABEL_6:
  if ((v5 & 8) != 0)
  {
LABEL_7:
    *(_DWORD *)(a1 + 40) = *((_DWORD *)v3 + 10);
    *(unsigned char *)(a1 + 56) |= 8u;
  }
LABEL_8:
  uint64_t v6 = (void *)v3[4];
  if (v6)
  {
    objc_storeStrong((id *)(a1 + 32), v6);
    NSUInteger v3 = v8;
  }
  if (v3[7])
  {
    *(void *)(a1 + 8) = v3[1];
    *(unsigned char *)(a1 + 56) |= 1u;
  }
  NSUInteger v7 = (void *)v3[3];
  if (v7)
  {
    objc_storeStrong((id *)(a1 + 24), v7);
    NSUInteger v3 = v8;
  }
LABEL_14:
}

- (uint64_t)segmentName
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (uint64_t)offset
{
  if (result) {
    return *(unsigned int *)(result + 20);
  }
  return result;
}

- (uint64_t)length
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

- (uint64_t)processName
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (double)eventTimestamp
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)policyID
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentName, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_policyID, 0);
}

@end