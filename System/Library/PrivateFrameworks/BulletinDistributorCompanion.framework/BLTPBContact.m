@interface BLTPBContact
- (BOOL)cnContactIdentifierSuggested;
- (BOOL)displayNameSuggested;
- (BOOL)hasCnContactFullname;
- (BOOL)hasCnContactIdentifier;
- (BOOL)hasCustomIdentifier;
- (BOOL)hasDisplayName;
- (BOOL)hasDisplayNameSuggested;
- (BOOL)hasHandle;
- (BOOL)hasServiceName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)cnContactFullname;
- (NSString)cnContactIdentifier;
- (NSString)customIdentifier;
- (NSString)displayName;
- (NSString)handle;
- (NSString)serviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)handleType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCnContactFullname:(id)a3;
- (void)setCnContactIdentifier:(id)a3;
- (void)setCnContactIdentifierSuggested:(BOOL)a3;
- (void)setCustomIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplayNameSuggested:(BOOL)a3;
- (void)setHandle:(id)a3;
- (void)setHandleType:(unsigned int)a3;
- (void)setHasDisplayNameSuggested:(BOOL)a3;
- (void)setServiceName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBContact

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasCnContactIdentifier
{
  return self->_cnContactIdentifier != 0;
}

- (BOOL)hasCnContactFullname
{
  return self->_cnContactFullname != 0;
}

- (void)setDisplayNameSuggested:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_displayNameSuggested = a3;
}

- (void)setHasDisplayNameSuggested:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisplayNameSuggested
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCustomIdentifier
{
  return self->_customIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBContact;
  v4 = [(BLTPBContact *)&v8 description];
  v5 = [(BLTPBContact *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  handle = self->_handle;
  if (handle) {
    [v3 setObject:handle forKey:@"handle"];
  }
  v6 = [NSNumber numberWithUnsignedInt:self->_handleType];
  [v4 setObject:v6 forKey:@"handleType"];

  serviceName = self->_serviceName;
  if (serviceName) {
    [v4 setObject:serviceName forKey:@"serviceName"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKey:@"displayName"];
  }
  cnContactIdentifier = self->_cnContactIdentifier;
  if (cnContactIdentifier) {
    [v4 setObject:cnContactIdentifier forKey:@"cnContactIdentifier"];
  }
  cnContactFullname = self->_cnContactFullname;
  if (cnContactFullname) {
    [v4 setObject:cnContactFullname forKey:@"cnContactFullname"];
  }
  v11 = [NSNumber numberWithBool:self->_cnContactIdentifierSuggested];
  [v4 setObject:v11 forKey:@"cnContactIdentifierSuggested"];

  if (*(unsigned char *)&self->_has)
  {
    v12 = [NSNumber numberWithBool:self->_displayNameSuggested];
    [v4 setObject:v12 forKey:@"displayNameSuggested"];
  }
  customIdentifier = self->_customIdentifier;
  if (customIdentifier) {
    [v4 setObject:customIdentifier forKey:@"customIdentifier"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBContactReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_handle) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_serviceName) {
    PBDataWriterWriteStringField();
  }
  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  if (self->_cnContactIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_cnContactFullname) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  v4 = v5;
  if (self->_customIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_handle)
  {
    objc_msgSend(v4, "setHandle:");
    id v4 = v5;
  }
  *((_DWORD *)v4 + 12) = self->_handleType;
  if (self->_serviceName)
  {
    objc_msgSend(v5, "setServiceName:");
    id v4 = v5;
  }
  if (self->_displayName)
  {
    objc_msgSend(v5, "setDisplayName:");
    id v4 = v5;
  }
  if (self->_cnContactIdentifier)
  {
    objc_msgSend(v5, "setCnContactIdentifier:");
    id v4 = v5;
  }
  if (self->_cnContactFullname)
  {
    objc_msgSend(v5, "setCnContactFullname:");
    id v4 = v5;
  }
  *((unsigned char *)v4 + 64) = self->_cnContactIdentifierSuggested;
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v4 + 65) = self->_displayNameSuggested;
    *((unsigned char *)v4 + 68) |= 1u;
  }
  if (self->_customIdentifier)
  {
    objc_msgSend(v5, "setCustomIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_handle copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  *(_DWORD *)(v5 + 48) = self->_handleType;
  uint64_t v8 = [(NSString *)self->_serviceName copyWithZone:a3];
  v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  uint64_t v10 = [(NSString *)self->_displayName copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_cnContactIdentifier copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  uint64_t v14 = [(NSString *)self->_cnContactFullname copyWithZone:a3];
  v15 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v14;

  *(unsigned char *)(v5 + 64) = self->_cnContactIdentifierSuggested;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 65) = self->_displayNameSuggested;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  uint64_t v16 = [(NSString *)self->_customIdentifier copyWithZone:a3];
  v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  handle = self->_handle;
  if ((unint64_t)handle | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](handle, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (self->_handleType != *((_DWORD *)v4 + 12)) {
    goto LABEL_21;
  }
  serviceName = self->_serviceName;
  if ((unint64_t)serviceName | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](serviceName, "isEqual:")) {
      goto LABEL_21;
    }
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_21;
    }
  }
  cnContactIdentifier = self->_cnContactIdentifier;
  if ((unint64_t)cnContactIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](cnContactIdentifier, "isEqual:")) {
      goto LABEL_21;
    }
  }
  cnContactFullname = self->_cnContactFullname;
  if ((unint64_t)cnContactFullname | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](cnContactFullname, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (self->_cnContactIdentifierSuggested)
  {
    if (!*((unsigned char *)v4 + 64)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0) {
      goto LABEL_27;
    }
LABEL_21:
    char v10 = 0;
    goto LABEL_22;
  }
  if ((*((unsigned char *)v4 + 68) & 1) == 0) {
    goto LABEL_21;
  }
  if (!self->_displayNameSuggested)
  {
    if (!*((unsigned char *)v4 + 65)) {
      goto LABEL_27;
    }
    goto LABEL_21;
  }
  if (!*((unsigned char *)v4 + 65)) {
    goto LABEL_21;
  }
LABEL_27:
  customIdentifier = self->_customIdentifier;
  if ((unint64_t)customIdentifier | *((void *)v4 + 3)) {
    char v10 = -[NSString isEqual:](customIdentifier, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_22:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_handle hash];
  unsigned int handleType = self->_handleType;
  NSUInteger v5 = [(NSString *)self->_serviceName hash];
  NSUInteger v6 = [(NSString *)self->_displayName hash];
  NSUInteger v7 = [(NSString *)self->_cnContactIdentifier hash];
  NSUInteger v8 = [(NSString *)self->_cnContactFullname hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v10 = 2654435761 * self->_displayNameSuggested;
  }
  else {
    uint64_t v10 = 0;
  }
  BOOL cnContactIdentifierSuggested = self->_cnContactIdentifierSuggested;
  return (2654435761 * handleType) ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ (2654435761 * cnContactIdentifierSuggested) ^ v10 ^ [(NSString *)self->_customIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 5))
  {
    -[BLTPBContact setHandle:](self, "setHandle:");
    id v4 = v5;
  }
  self->_unsigned int handleType = *((_DWORD *)v4 + 12);
  if (*((void *)v4 + 7))
  {
    -[BLTPBContact setServiceName:](self, "setServiceName:");
    id v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[BLTPBContact setDisplayName:](self, "setDisplayName:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[BLTPBContact setCnContactIdentifier:](self, "setCnContactIdentifier:");
    id v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[BLTPBContact setCnContactFullname:](self, "setCnContactFullname:");
    id v4 = v5;
  }
  self->_BOOL cnContactIdentifierSuggested = *((unsigned char *)v4 + 64);
  if (*((unsigned char *)v4 + 68))
  {
    self->_displayNameSuggested = *((unsigned char *)v4 + 65);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[BLTPBContact setCustomIdentifier:](self, "setCustomIdentifier:");
    id v4 = v5;
  }
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (unsigned)handleType
{
  return self->_handleType;
}

- (void)setHandleType:(unsigned int)a3
{
  self->_unsigned int handleType = a3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)cnContactIdentifier
{
  return self->_cnContactIdentifier;
}

- (void)setCnContactIdentifier:(id)a3
{
}

- (NSString)cnContactFullname
{
  return self->_cnContactFullname;
}

- (void)setCnContactFullname:(id)a3
{
}

- (BOOL)cnContactIdentifierSuggested
{
  return self->_cnContactIdentifierSuggested;
}

- (void)setCnContactIdentifierSuggested:(BOOL)a3
{
  self->_BOOL cnContactIdentifierSuggested = a3;
}

- (BOOL)displayNameSuggested
{
  return self->_displayNameSuggested;
}

- (NSString)customIdentifier
{
  return self->_customIdentifier;
}

- (void)setCustomIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong((id *)&self->_cnContactIdentifier, 0);
  objc_storeStrong((id *)&self->_cnContactFullname, 0);
}

@end