@interface HMAccessoryInfoProtoPrimaryUserInfoEvent
- (BOOL)hasSelectionType;
- (BOOL)hasUuidString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)uuidString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)selectionTypeAsString:(int)a3;
- (int)StringAsSelectionType:(id)a3;
- (int)selectionType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSelectionType:(BOOL)a3;
- (void)setSelectionType:(int)a3;
- (void)setUuidString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAccessoryInfoProtoPrimaryUserInfoEvent

- (void).cxx_destruct
{
}

- (void)setUuidString:(id)a3
{
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  if (*((void *)v4 + 2))
  {
    v5 = v4;
    -[HMAccessoryInfoProtoPrimaryUserInfoEvent setUuidString:](self, "setUuidString:");
    v4 = v5;
  }
  if (v4[6])
  {
    self->_selectionType = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuidString hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_selectionType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](uuidString, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_selectionType == *((_DWORD *)v4 + 2))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuidString copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_selectionType;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_uuidString)
  {
    id v5 = v4;
    objc_msgSend(v4, "setUuidString:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_selectionType;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uuidString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryInfoProtoPrimaryUserInfoEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuidString = self->_uuidString;
  if (uuidString) {
    [v3 setObject:uuidString forKey:@"uuidString"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int selectionType = self->_selectionType;
    if (selectionType)
    {
      if (selectionType == 1)
      {
        v7 = @"selectionTypeHomeUser";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_selectionType);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = @"selectionTypeHomePodAccount";
    }
    [v4 setObject:v7 forKey:@"selectionType"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryInfoProtoPrimaryUserInfoEvent;
  id v4 = [(HMAccessoryInfoProtoPrimaryUserInfoEvent *)&v8 description];
  id v5 = [(HMAccessoryInfoProtoPrimaryUserInfoEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsSelectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"selectionTypeHomePodAccount"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"selectionTypeHomeUser"];
  }

  return v4;
}

- (id)selectionTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"selectionTypeHomeUser";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"selectionTypeHomePodAccount";
  }
  return v4;
}

- (BOOL)hasSelectionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasSelectionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setSelectionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int selectionType = a3;
}

- (int)selectionType
{
  if (*(unsigned char *)&self->_has) {
    return self->_selectionType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasUuidString
{
  return self->_uuidString != 0;
}

@end