@interface BLTPBRemoveSectionRequest
- (BOOL)hasSectionID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sectionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSectionID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBRemoveSectionRequest

- (BOOL)hasSectionID
{
  return self->_sectionID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBRemoveSectionRequest;
  v4 = [(BLTPBRemoveSectionRequest *)&v8 description];
  v5 = [(BLTPBRemoveSectionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  sectionID = self->_sectionID;
  if (sectionID) {
    [v3 setObject:sectionID forKey:@"sectionID"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBRemoveSectionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_sectionID) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  sectionID = self->_sectionID;
  if (sectionID) {
    [a3 setSectionID:sectionID];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sectionID copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    sectionID = self->_sectionID;
    if ((unint64_t)sectionID | v4[1]) {
      char v6 = -[NSString isEqual:](sectionID, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_sectionID hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[BLTPBRemoveSectionRequest setSectionID:](self, "setSectionID:");
  }
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end