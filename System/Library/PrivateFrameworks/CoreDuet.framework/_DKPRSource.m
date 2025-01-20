@interface _DKPRSource
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)bundleID;
- (uint64_t)deviceID;
- (uint64_t)groupID;
- (uint64_t)itemID;
- (uint64_t)setUserID:(uint64_t)result;
- (uint64_t)sourceID;
- (uint64_t)userID;
- (unint64_t)hash;
- (void)setBundleID:(uint64_t)a1;
- (void)setDeviceID:(uint64_t)a1;
- (void)setGroupID:(uint64_t)a1;
- (void)setItemID:(uint64_t)a1;
- (void)setSourceID:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _DKPRSource

- (uint64_t)setUserID:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 52) |= 1u;
    *(_DWORD *)(result + 48) = a2;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_DKPRSource;
  v4 = [(_DKPRSource *)&v8 description];
  v5 = [(_DKPRSource *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  sourceID = self->_sourceID;
  if (sourceID) {
    [v3 setObject:sourceID forKey:@"sourceID"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v4 setObject:bundleID forKey:@"bundleID"];
  }
  itemID = self->_itemID;
  if (itemID) {
    [v4 setObject:itemID forKey:@"itemID"];
  }
  groupID = self->_groupID;
  if (groupID) {
    [v4 setObject:groupID forKey:@"groupID"];
  }
  deviceID = self->_deviceID;
  if (deviceID) {
    [v4 setObject:deviceID forKey:@"deviceID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = [NSNumber numberWithInt:self->_userID];
    [v4 setObject:v10 forKey:@"userID"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _DKPRSourceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sourceID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_itemID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_groupID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceID)
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

- (void)setSourceID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setBundleID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void)setItemID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setGroupID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setDeviceID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sourceID copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_bundleID copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSString *)self->_itemID copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_groupID copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  uint64_t v14 = [(NSString *)self->_deviceID copyWithZone:a3];
  v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_userID;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  sourceID = self->_sourceID;
  if ((unint64_t)sourceID | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](sourceID, "isEqual:")) {
      goto LABEL_16;
    }
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:")) {
      goto LABEL_16;
    }
  }
  itemID = self->_itemID;
  if ((unint64_t)itemID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](itemID, "isEqual:")) {
      goto LABEL_16;
    }
  }
  groupID = self->_groupID;
  if ((unint64_t)groupID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](groupID, "isEqual:")) {
      goto LABEL_16;
    }
  }
  deviceID = self->_deviceID;
  if ((unint64_t)deviceID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](deviceID, "isEqual:")) {
      goto LABEL_16;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) != 0 && self->_userID == *((_DWORD *)v4 + 12))
    {
      BOOL v10 = 1;
      goto LABEL_17;
    }
LABEL_16:
    BOOL v10 = 0;
  }
LABEL_17:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sourceID hash];
  NSUInteger v4 = [(NSString *)self->_bundleID hash];
  NSUInteger v5 = [(NSString *)self->_itemID hash];
  NSUInteger v6 = [(NSString *)self->_groupID hash];
  NSUInteger v7 = [(NSString *)self->_deviceID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_userID;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (uint64_t)sourceID
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (uint64_t)bundleID
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)itemID
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)groupID
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)deviceID
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)userID
{
  if (result) {
    return *(unsigned int *)(result + 48);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end