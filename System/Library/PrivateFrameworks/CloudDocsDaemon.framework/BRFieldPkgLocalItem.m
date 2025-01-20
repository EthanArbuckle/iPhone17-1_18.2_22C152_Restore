@interface BRFieldPkgLocalItem
- (BOOL)hasGenerationID;
- (BOOL)hasSize;
- (BOOL)hasXattrs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BRFieldPkgItem)item;
- (NSData)xattrs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)fileID;
- (int64_t)size;
- (unint64_t)hash;
- (unsigned)generationID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFileID:(int64_t)a3;
- (void)setGenerationID:(unsigned int)a3;
- (void)setHasGenerationID:(BOOL)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)setXattrs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BRFieldPkgLocalItem

- (void)setGenerationID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_generationID = a3;
}

- (void)setHasGenerationID:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGenerationID
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSize:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasXattrs
{
  return self->_xattrs != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BRFieldPkgLocalItem;
  v4 = [(BRFieldPkgLocalItem *)&v8 description];
  v5 = [(BRFieldPkgLocalItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  item = self->_item;
  if (item)
  {
    v5 = [(BRFieldPkgItem *)item dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"item"];
  }
  v6 = [NSNumber numberWithLongLong:self->_fileID];
  [v3 setObject:v6 forKey:@"fileID"];

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_generationID];
    [v3 setObject:v8 forKey:@"generationID"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithLongLong:self->_size];
    [v3 setObject:v9 forKey:@"size"];
  }
  xattrs = self->_xattrs;
  if (xattrs) {
    [v3 setObject:xattrs forKey:@"xattrs"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BRFieldPkgLocalItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_item) {
    -[BRFieldPkgLocalItem writeTo:]();
  }
  id v7 = v4;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt64Field();
  }
  v6 = v7;
  if (self->_xattrs)
  {
    PBDataWriterWriteDataField();
    v6 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [v6 setItem:self->_item];
  id v4 = v6;
  *((void *)v6 + 1) = self->_fileID;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_generationID;
    *((unsigned char *)v6 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v6 + 2) = self->_size;
    *((unsigned char *)v6 + 48) |= 1u;
  }
  if (self->_xattrs)
  {
    objc_msgSend(v6, "setXattrs:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(BRFieldPkgItem *)self->_item copyWithZone:a3];
  id v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  *(void *)(v5 + 8) = self->_fileID;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_generationID;
    *(unsigned char *)(v5 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 16) = self->_size;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v9 = [(NSData *)self->_xattrs copyWithZone:a3];
  v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  item = self->_item;
  if ((unint64_t)item | *((void *)v4 + 4))
  {
    if (!-[BRFieldPkgItem isEqual:](item, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (self->_fileID != *((void *)v4 + 1)) {
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_generationID != *((_DWORD *)v4 + 6)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
LABEL_17:
    char v7 = 0;
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_size != *((void *)v4 + 2)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_17;
  }
  xattrs = self->_xattrs;
  if ((unint64_t)xattrs | *((void *)v4 + 5)) {
    char v7 = -[NSData isEqual:](xattrs, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BRFieldPkgItem *)self->_item hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_generationID;
  }
  else {
    uint64_t v4 = 0;
  }
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_size;
  }
  else {
    uint64_t v6 = 0;
  }
  int64_t fileID = self->_fileID;
  return (2654435761 * fileID) ^ v3 ^ v4 ^ v6 ^ [(NSData *)self->_xattrs hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  item = self->_item;
  uint64_t v6 = *((void *)v4 + 4);
  id v8 = v4;
  if (item)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[BRFieldPkgItem mergeFrom:](item, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[BRFieldPkgLocalItem setItem:](self, "setItem:");
  }
  id v4 = v8;
LABEL_7:
  self->_int64_t fileID = *((void *)v4 + 1);
  char v7 = *((unsigned char *)v4 + 48);
  if ((v7 & 2) != 0)
  {
    self->_generationID = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 48);
  }
  if (v7)
  {
    self->_size = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5))
  {
    -[BRFieldPkgLocalItem setXattrs:](self, "setXattrs:");
    id v4 = v8;
  }
}

- (BRFieldPkgItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (int64_t)fileID
{
  return self->_fileID;
}

- (void)setFileID:(int64_t)a3
{
  self->_int64_t fileID = a3;
}

- (unsigned)generationID
{
  return self->_generationID;
}

- (int64_t)size
{
  return self->_size;
}

- (NSData)xattrs
{
  return self->_xattrs;
}

- (void)setXattrs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xattrs, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[BRFieldPkgLocalItem writeTo:]", "BRFieldPkgLocalItem.m", 156, "self->_item != nil");
}

@end