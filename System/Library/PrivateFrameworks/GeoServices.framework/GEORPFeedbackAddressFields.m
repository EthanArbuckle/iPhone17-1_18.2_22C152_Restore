@interface GEORPFeedbackAddressFields
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAddressBasic;
- (BOOL)hasAddressBuilding;
- (BOOL)hasAddressFloor;
- (BOOL)hasAddressUnit;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackAddressFields)init;
- (GEORPFeedbackAddressFields)initWithData:(id)a3;
- (GEORPFeedbackAddressFields)initWithDictionary:(id)a3;
- (GEORPFeedbackAddressFields)initWithJSON:(id)a3;
- (NSString)addressBasic;
- (NSString)addressBuilding;
- (NSString)addressFloor;
- (NSString)addressUnit;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAddressBasic;
- (void)_readAddressBuilding;
- (void)_readAddressFloor;
- (void)_readAddressUnit;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddressBasic:(id)a3;
- (void)setAddressBuilding:(id)a3;
- (void)setAddressFloor:(id)a3;
- (void)setAddressUnit:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackAddressFields

- (GEORPFeedbackAddressFields)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackAddressFields;
  v2 = [(GEORPFeedbackAddressFields *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackAddressFields)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackAddressFields;
  v3 = [(GEORPFeedbackAddressFields *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAddressBasic
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackAddressFieldsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressBasic_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAddressBasic
{
  return self->_addressBasic != 0;
}

- (NSString)addressBasic
{
  -[GEORPFeedbackAddressFields _readAddressBasic]((uint64_t)self);
  addressBasic = self->_addressBasic;

  return addressBasic;
}

- (void)setAddressBasic:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_addressBasic, a3);
}

- (void)_readAddressUnit
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackAddressFieldsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressUnit_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAddressUnit
{
  return self->_addressUnit != 0;
}

- (NSString)addressUnit
{
  -[GEORPFeedbackAddressFields _readAddressUnit]((uint64_t)self);
  addressUnit = self->_addressUnit;

  return addressUnit;
}

- (void)setAddressUnit:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_addressUnit, a3);
}

- (void)_readAddressFloor
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackAddressFieldsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressFloor_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAddressFloor
{
  return self->_addressFloor != 0;
}

- (NSString)addressFloor
{
  -[GEORPFeedbackAddressFields _readAddressFloor]((uint64_t)self);
  addressFloor = self->_addressFloor;

  return addressFloor;
}

- (void)setAddressFloor:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_addressFloor, a3);
}

- (void)_readAddressBuilding
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackAddressFieldsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressBuilding_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAddressBuilding
{
  return self->_addressBuilding != 0;
}

- (NSString)addressBuilding
{
  -[GEORPFeedbackAddressFields _readAddressBuilding]((uint64_t)self);
  addressBuilding = self->_addressBuilding;

  return addressBuilding;
}

- (void)setAddressBuilding:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_addressBuilding, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackAddressFields;
  v4 = [(GEORPFeedbackAddressFields *)&v8 description];
  v5 = [(GEORPFeedbackAddressFields *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackAddressFields _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 addressBasic];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"addressBasic";
      }
      else {
        objc_super v6 = @"address_basic";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 addressUnit];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"addressUnit";
      }
      else {
        objc_super v8 = @"address_unit";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [a1 addressFloor];
    if (v9)
    {
      if (a2) {
        v10 = @"addressFloor";
      }
      else {
        v10 = @"address_floor";
      }
      [v4 setObject:v9 forKey:v10];
    }

    v11 = [a1 addressBuilding];
    if (v11)
    {
      if (a2) {
        v12 = @"addressBuilding";
      }
      else {
        v12 = @"address_building";
      }
      [v4 setObject:v11 forKey:v12];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackAddressFields _dictionaryRepresentation:](self, 1);
}

- (GEORPFeedbackAddressFields)initWithDictionary:(id)a3
{
  return (GEORPFeedbackAddressFields *)-[GEORPFeedbackAddressFields _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"addressBasic";
      }
      else {
        objc_super v6 = @"address_basic";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setAddressBasic:v8];
      }
      if (a3) {
        v9 = @"addressUnit";
      }
      else {
        v9 = @"address_unit";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setAddressUnit:v11];
      }
      if (a3) {
        v12 = @"addressFloor";
      }
      else {
        v12 = @"address_floor";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setAddressFloor:v14];
      }
      if (a3) {
        v15 = @"addressBuilding";
      }
      else {
        v15 = @"address_building";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = (void *)[v16 copy];
        [a1 setAddressBuilding:v17];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackAddressFields)initWithJSON:(id)a3
{
  return (GEORPFeedbackAddressFields *)-[GEORPFeedbackAddressFields _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_157;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_158;
    }
    GEORPFeedbackAddressFieldsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackAddressFieldsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackAddressFieldsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1F) == 0))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackAddressFields *)self readAll:0];
    if (self->_addressBasic) {
      PBDataWriterWriteStringField();
    }
    if (self->_addressUnit) {
      PBDataWriterWriteStringField();
    }
    if (self->_addressFloor) {
      PBDataWriterWriteStringField();
    }
    if (self->_addressBuilding) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPFeedbackAddressFields *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_addressBasic) {
    objc_msgSend(v5, "setAddressBasic:");
  }
  if (self->_addressUnit) {
    objc_msgSend(v5, "setAddressUnit:");
  }
  v4 = v5;
  if (self->_addressFloor)
  {
    objc_msgSend(v5, "setAddressFloor:");
    v4 = v5;
  }
  if (self->_addressBuilding)
  {
    objc_msgSend(v5, "setAddressBuilding:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackAddressFields *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_addressBasic copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;

    uint64_t v10 = [(NSString *)self->_addressUnit copyWithZone:a3];
    v11 = (void *)v5[5];
    v5[5] = v10;

    uint64_t v12 = [(NSString *)self->_addressFloor copyWithZone:a3];
    v13 = (void *)v5[4];
    v5[4] = v12;

    uint64_t v14 = [(NSString *)self->_addressBuilding copyWithZone:a3];
    id v7 = (PBDataReader *)v5[3];
    v5[3] = v14;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPFeedbackAddressFieldsReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPFeedbackAddressFields *)self readAll:1],
         [v4 readAll:1],
         addressBasic = self->_addressBasic,
         !((unint64_t)addressBasic | v4[2]))
     || -[NSString isEqual:](addressBasic, "isEqual:"))
    && ((addressUnit = self->_addressUnit, !((unint64_t)addressUnit | v4[5]))
     || -[NSString isEqual:](addressUnit, "isEqual:"))
    && ((addressFloor = self->_addressFloor, !((unint64_t)addressFloor | v4[4]))
     || -[NSString isEqual:](addressFloor, "isEqual:")))
  {
    addressBuilding = self->_addressBuilding;
    if ((unint64_t)addressBuilding | v4[3]) {
      char v9 = -[NSString isEqual:](addressBuilding, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  [(GEORPFeedbackAddressFields *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_addressBasic hash];
  NSUInteger v4 = [(NSString *)self->_addressUnit hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_addressFloor hash];
  return v4 ^ v5 ^ [(NSString *)self->_addressBuilding hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  [v4 readAll:0];
  if (v4[2]) {
    -[GEORPFeedbackAddressFields setAddressBasic:](self, "setAddressBasic:");
  }
  if (v4[5]) {
    -[GEORPFeedbackAddressFields setAddressUnit:](self, "setAddressUnit:");
  }
  if (v4[4]) {
    -[GEORPFeedbackAddressFields setAddressFloor:](self, "setAddressFloor:");
  }
  if (v4[3]) {
    -[GEORPFeedbackAddressFields setAddressBuilding:](self, "setAddressBuilding:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressUnit, 0);
  objc_storeStrong((id *)&self->_addressFloor, 0);
  objc_storeStrong((id *)&self->_addressBuilding, 0);
  objc_storeStrong((id *)&self->_addressBasic, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end