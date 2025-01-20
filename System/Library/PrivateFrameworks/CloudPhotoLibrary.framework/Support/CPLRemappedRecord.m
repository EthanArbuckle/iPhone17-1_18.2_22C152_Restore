@interface CPLRemappedRecord
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation CPLRemappedRecord

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CPLRemappedRecord;
  v3 = [(CPLRemappedRecord *)&v7 description];
  v4 = [(CPLRemappedRecord *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  createdByUserID = self->_createdByUserID;
  if (createdByUserID) {
    [v3 setObject:createdByUserID forKey:@"createdByUserID"];
  }
  recordID = self->_recordID;
  if (recordID) {
    [v4 setObject:recordID forKey:@"recordID"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CPLRemappedRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_createdByUserID) {
    sub_1001C7DC0();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_recordID) {
    sub_1001C7DEC();
  }
  PBDataWriterWriteStringField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_createdByUserID copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_recordID copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((createdByUserID = self->_createdByUserID, !((unint64_t)createdByUserID | v4[1]))
     || -[NSString isEqual:](createdByUserID, "isEqual:")))
  {
    recordID = self->_recordID;
    if ((unint64_t)recordID | v4[2]) {
      unsigned __int8 v7 = -[NSString isEqual:](recordID, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_createdByUserID hash];
  return [(NSString *)self->_recordID hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_createdByUserID, 0);
}

@end