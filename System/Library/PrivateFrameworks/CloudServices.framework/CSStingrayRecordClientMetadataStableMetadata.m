@interface CSStingrayRecordClientMetadataStableMetadata
+ (id)parseFromStableMetadataPlist:(id)a3 error:(id *)a4;
- (BOOL)hasStableEscrow;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)stableEscrow;
- (id)convertToPList;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setStableEscrow:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSStingrayRecordClientMetadataStableMetadata

+ (id)parseFromStableMetadataPlist:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = objc_alloc_init(CSStingrayRecordClientMetadataStableMetadata);
  v7 = objc_msgSend_objectForKeyedSubscript_(v4, v6, @"EscrowKey");

  objc_msgSend_setStableEscrow_(v5, v8, (uint64_t)v7);

  return v5;
}

- (id)convertToPList
{
  id v4 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  v7 = objc_msgSend_stableEscrow(self, v5, v6);
  if (objc_msgSend_length(v7, v8, v9))
  {
    v12 = objc_msgSend_stableEscrow(self, v10, v11);
    objc_msgSend_setObject_forKeyedSubscript_(v4, v13, (uint64_t)v12, @"SecureBackupStableMetadata");
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v4, v10, 0, @"SecureBackupStableMetadata");
  }

  return v4;
}

- (BOOL)hasStableEscrow
{
  return self->_stableEscrow != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CSStingrayRecordClientMetadataStableMetadata;
  id v4 = [(CSStingrayRecordClientMetadataStableMetadata *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  uint64_t v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  id v4 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  uint64_t v6 = v4;
  stableEscrow = self->_stableEscrow;
  if (stableEscrow) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)stableEscrow, @"stableEscrow");
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CSStingrayRecordClientMetadataStableMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_stableEscrow) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  stableEscrow = self->_stableEscrow;
  if (stableEscrow) {
    objc_msgSend_setStableEscrow_(a3, a2, (uint64_t)stableEscrow);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_stableEscrow, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5))
  {
    stableEscrow = self->_stableEscrow;
    uint64_t v9 = v4[1];
    if ((unint64_t)stableEscrow | v9) {
      char isEqual = objc_msgSend_isEqual_(stableEscrow, v7, v9);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_stableEscrow, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3 = *((void *)a3 + 1);
  if (v3) {
    objc_msgSend_setStableEscrow_(self, a2, v3);
  }
}

- (NSString)stableEscrow
{
  return self->_stableEscrow;
}

- (void)setStableEscrow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end