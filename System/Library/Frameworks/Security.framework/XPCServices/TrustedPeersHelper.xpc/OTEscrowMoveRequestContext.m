@interface OTEscrowMoveRequestContext
- (BOOL)hasCurrentFederation;
- (BOOL)hasEscrowRecordLabel;
- (BOOL)hasIntendedFederation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)currentFederation;
- (NSString)escrowRecordLabel;
- (NSString)intendedFederation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentFederation:(id)a3;
- (void)setEscrowRecordLabel:(id)a3;
- (void)setIntendedFederation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTEscrowMoveRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intendedFederation, 0);
  objc_storeStrong((id *)&self->_escrowRecordLabel, 0);

  objc_storeStrong((id *)&self->_currentFederation, 0);
}

- (void)setIntendedFederation:(id)a3
{
}

- (NSString)intendedFederation
{
  return self->_intendedFederation;
}

- (void)setCurrentFederation:(id)a3
{
}

- (NSString)currentFederation
{
  return self->_currentFederation;
}

- (void)setEscrowRecordLabel:(id)a3
{
}

- (NSString)escrowRecordLabel
{
  return self->_escrowRecordLabel;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[2]) {
    -[OTEscrowMoveRequestContext setEscrowRecordLabel:](self, "setEscrowRecordLabel:");
  }
  if (v4[1]) {
    -[OTEscrowMoveRequestContext setCurrentFederation:](self, "setCurrentFederation:");
  }
  if (v4[3]) {
    -[OTEscrowMoveRequestContext setIntendedFederation:](self, "setIntendedFederation:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_escrowRecordLabel hash];
  unint64_t v4 = [(NSString *)self->_currentFederation hash] ^ v3;
  return v4 ^ [(NSString *)self->_intendedFederation hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((escrowRecordLabel = self->_escrowRecordLabel, !((unint64_t)escrowRecordLabel | v4[2]))
     || -[NSString isEqual:](escrowRecordLabel, "isEqual:"))
    && ((currentFederation = self->_currentFederation, !((unint64_t)currentFederation | v4[1]))
     || -[NSString isEqual:](currentFederation, "isEqual:")))
  {
    intendedFederation = self->_intendedFederation;
    if ((unint64_t)intendedFederation | v4[3]) {
      unsigned __int8 v8 = -[NSString isEqual:](intendedFederation, "isEqual:");
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_escrowRecordLabel copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_currentFederation copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(NSString *)self->_intendedFederation copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_escrowRecordLabel)
  {
    objc_msgSend(v4, "setEscrowRecordLabel:");
    id v4 = v5;
  }
  if (self->_currentFederation)
  {
    objc_msgSend(v5, "setCurrentFederation:");
    id v4 = v5;
  }
  if (self->_intendedFederation)
  {
    objc_msgSend(v5, "setIntendedFederation:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_escrowRecordLabel)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_currentFederation)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_intendedFederation)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v5 = 0;
      unsigned int v6 = 0;
      unint64_t v7 = 0;
      while (1)
      {
        unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
        v7 |= (unint64_t)(v9 & 0x7F) << v5;
        if ((v9 & 0x80) == 0) {
          goto LABEL_11;
        }
        v5 += 7;
        if (v6++ >= 9)
        {
          unint64_t v7 = 0;
          int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v7 = 0;
      }
LABEL_13:
      if (v11 || (v7 & 7) == 4) {
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      unint64_t v13 = v7 >> 3;
      if ((v7 >> 3) == 3) {
        break;
      }
      if (v13 == 2)
      {
        uint64_t v14 = PBReaderReadString();
        uint64_t v15 = 8;
        goto LABEL_23;
      }
      if (v13 == 1)
      {
        uint64_t v14 = PBReaderReadString();
        uint64_t v15 = 16;
LABEL_23:
        v16 = *(void **)&self->PBCodable_opaque[v15];
        *(void *)&self->PBCodable_opaque[v15] = v14;

        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_25:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    uint64_t v14 = PBReaderReadString();
    uint64_t v15 = 24;
    goto LABEL_23;
  }
  return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  escrowRecordLabel = self->_escrowRecordLabel;
  if (escrowRecordLabel) {
    [v3 setObject:escrowRecordLabel forKey:@"escrowRecordLabel"];
  }
  currentFederation = self->_currentFederation;
  if (currentFederation) {
    [v4 setObject:currentFederation forKey:@"currentFederation"];
  }
  intendedFederation = self->_intendedFederation;
  if (intendedFederation) {
    [v4 setObject:intendedFederation forKey:@"intendedFederation"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)OTEscrowMoveRequestContext;
  NSUInteger v3 = [(OTEscrowMoveRequestContext *)&v7 description];
  id v4 = [(OTEscrowMoveRequestContext *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasIntendedFederation
{
  return self->_intendedFederation != 0;
}

- (BOOL)hasCurrentFederation
{
  return self->_currentFederation != 0;
}

- (BOOL)hasEscrowRecordLabel
{
  return self->_escrowRecordLabel != 0;
}

@end