@interface IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange
- (BOOL)hasGroupTitle;
- (BOOL)hasOtherHandle;
- (BOOL)hasPadding;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)padding;
- (NSString)groupTitle;
- (NSString)otherHandle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setGroupTitle:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setOtherHandle:(id)a3;
- (void)setPadding:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange

- (void)dealloc
{
  [(IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange *)self setGroupTitle:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange *)self setOtherHandle:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange *)self setPadding:0];
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange;
  [(IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange *)&v3 dealloc];
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasGroupTitle
{
  return self->_groupTitle != 0;
}

- (BOOL)hasOtherHandle
{
  return self->_otherHandle != 0;
}

- (BOOL)hasPadding
{
  return self->_padding != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange;
  return (id)[NSString stringWithFormat:@"%@ %@", -[IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange description](&v3, sel_description), -[IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_version), @"version");
  }
  groupTitle = self->_groupTitle;
  if (groupTitle) {
    [v3 setObject:groupTitle forKey:@"group_title"];
  }
  otherHandle = self->_otherHandle;
  if (otherHandle) {
    [v3 setObject:otherHandle forKey:@"other_handle"];
  }
  padding = self->_padding;
  if (padding) {
    [v3 setObject:padding forKey:@"padding"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_groupTitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_otherHandle) {
    PBDataWriterWriteStringField();
  }
  if (self->_padding)
  {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 8) = self->_version;
    *((unsigned char *)a3 + 36) |= 1u;
  }
  if (self->_groupTitle) {
    objc_msgSend(a3, "setGroupTitle:");
  }
  if (self->_otherHandle) {
    objc_msgSend(a3, "setOtherHandle:");
  }
  if (self->_padding)
  {
    objc_msgSend(a3, "setPadding:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_version;
    *(unsigned char *)(v5 + 36) |= 1u;
  }

  *(void *)(v6 + 8) = [(NSString *)self->_groupTitle copyWithZone:a3];
  *(void *)(v6 + 16) = [(NSString *)self->_otherHandle copyWithZone:a3];

  *(void *)(v6 + 24) = [(NSData *)self->_padding copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_version != *((_DWORD *)a3 + 8)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
LABEL_13:
      LOBYTE(v5) = 0;
      return v5;
    }
    groupTitle = self->_groupTitle;
    if (!((unint64_t)groupTitle | *((void *)a3 + 1))
      || (int v5 = -[NSString isEqual:](groupTitle, "isEqual:")) != 0)
    {
      otherHandle = self->_otherHandle;
      if (!((unint64_t)otherHandle | *((void *)a3 + 2))
        || (int v5 = -[NSString isEqual:](otherHandle, "isEqual:")) != 0)
      {
        padding = self->_padding;
        if ((unint64_t)padding | *((void *)a3 + 3))
        {
          LOBYTE(v5) = -[NSData isEqual:](padding, "isEqual:");
        }
        else
        {
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_groupTitle hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_otherHandle hash];
  return v4 ^ v5 ^ [(NSData *)self->_padding hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 36))
  {
    self->_version = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 1)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange setGroupTitle:](self, "setGroupTitle:");
  }
  if (*((void *)a3 + 2)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange setOtherHandle:](self, "setOtherHandle:");
  }
  if (*((void *)a3 + 3))
  {
    -[IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange setPadding:](self, "setPadding:");
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)groupTitle
{
  return self->_groupTitle;
}

- (void)setGroupTitle:(id)a3
{
}

- (NSString)otherHandle
{
  return self->_otherHandle;
}

- (void)setOtherHandle:(id)a3
{
}

- (NSData)padding
{
  return self->_padding;
}

- (void)setPadding:(id)a3
{
}

@end