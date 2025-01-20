@interface SYChange
+ (id)changeWithChangeObject:(id)a3 serializer:(id)a4;
+ (id)changeWithChangeObject:(id)a3 serializer:(id)a4 encodeUsingVersion:(int64_t)a5;
+ (id)changeWithObject:(id)a3 updateType:(int)a4 store:(id)a5;
- (BOOL)hasChangeData;
- (BOOL)hasSequencer;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)changeData;
- (NSString)description;
- (NSString)objectId;
- (NSString)sequencer;
- (id)changeObjectWithSerializer:(id)a3;
- (id)changeObjectWithSerializer:(id)a3 encodedByVersion:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)objectForStore:(id)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (int64_t)changeType;
- (unint64_t)hash;
- (unint64_t)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChangeData:(id)a3;
- (void)setObjectId:(id)a3;
- (void)setSequencer:(id)a3;
- (void)setType:(int)a3;
- (void)setVersion:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYChange

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_264423FE0[a3];
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ObjectAdded"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ObjectUpdated"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ObjectDeleted"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasChangeData
{
  return self->_changeData != 0;
}

- (BOOL)hasSequencer
{
  return self->_sequencer != 0;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYChange;
  int v4 = [(SYChange *)&v8 description];
  v5 = [(SYChange *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t type = self->_type;
  if (type >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_264423FE0[type];
  }
  [v3 setObject:v5 forKey:@"type"];

  objectId = self->_objectId;
  if (objectId) {
    [v3 setObject:objectId forKey:@"objectId"];
  }
  v7 = [NSNumber numberWithUnsignedLongLong:self->_version];
  [v3 setObject:v7 forKey:@"version"];

  changeData = self->_changeData;
  if (changeData) {
    [v3 setObject:changeData forKey:@"changeData"];
  }
  sequencer = self->_sequencer;
  if (sequencer) {
    [v3 setObject:sequencer forKey:@"sequencer"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_objectId) {
    -[SYChange writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint64Field();
  if (self->_changeData) {
    PBDataWriterWriteDataField();
  }
  if (self->_sequencer) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  v5[10] = self->_type;
  [v5 setObjectId:self->_objectId];
  id v4 = v5;
  *((void *)v5 + 1) = self->_version;
  if (self->_changeData)
  {
    objc_msgSend(v5, "setChangeData:");
    id v4 = v5;
  }
  if (self->_sequencer)
  {
    objc_msgSend(v5, "setSequencer:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 40) = self->_type;
  uint64_t v6 = [(NSString *)self->_objectId copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  *(void *)(v5 + 8) = self->_version;
  uint64_t v8 = [(NSData *)self->_changeData copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_sequencer copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_type == *((_DWORD *)v4 + 10)
    && ((objectId = self->_objectId, !((unint64_t)objectId | v4[3]))
     || -[NSString isEqual:](objectId, "isEqual:"))
    && self->_version == v4[1]
    && ((changeData = self->_changeData, !((unint64_t)changeData | v4[2]))
     || -[NSData isEqual:](changeData, "isEqual:")))
  {
    sequencer = self->_sequencer;
    if ((unint64_t)sequencer | v4[4]) {
      char v8 = -[NSString isEqual:](sequencer, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_type;
  NSUInteger v4 = [(NSString *)self->_objectId hash] ^ v3;
  unint64_t v5 = 2654435761u * self->_version;
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_changeData hash];
  return v6 ^ [(NSString *)self->_sequencer hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unint64_t *)a3;
  self->_uint64_t type = *((_DWORD *)v4 + 10);
  unint64_t v5 = v4;
  if (v4[3]) {
    -[SYChange setObjectId:](self, "setObjectId:");
  }
  self->_version = v5[1];
  if (v5[2]) {
    -[SYChange setChangeData:](self, "setChangeData:");
  }
  if (v5[4]) {
    -[SYChange setSequencer:](self, "setSequencer:");
  }
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_uint64_t type = a3;
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSData)changeData
{
  return self->_changeData;
}

- (void)setChangeData:(id)a3
{
}

- (NSString)sequencer
{
  return self->_sequencer;
}

- (void)setSequencer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequencer, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_changeData, 0);
}

+ (id)changeWithObject:(id)a3 updateType:(int)a4 store:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = a5;
  v9 = [v7 syncId];

  if (!v9)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v10 = qword_26AB047A8;
    if (os_log_type_enabled((os_log_t)qword_26AB047A8, OS_LOG_TYPE_FAULT)) {
      +[SYChange(Additions) changeWithObject:updateType:store:]((uint64_t)v7, v10);
    }
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"SYObject %@ does not provide the required syncId!", v7 format];
  }
  v11 = objc_alloc_init(SYChange);
  [(SYChange *)v11 setType:v6];
  v12 = [v7 syncId];
  [(SYChange *)v11 setObjectId:v12];

  if (v7)
  {
    if (v6 != 2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v13 = [v8 encodeSYObject:v7];
      [(SYChange *)v11 setChangeData:v13];
    }
  }

  return v11;
}

- (id)objectForStore:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SYChange *)self changeData];

  if (v5)
  {
    uint64_t v6 = [(SYChange *)self changeData];
    id v7 = [v4 decodeSYObject:v6];
  }
  else if ([(SYChange *)self type] == 2)
  {
    id v8 = [SYDeletedObject alloc];
    v9 = [(SYChange *)self objectId];
    id v7 = [(SYDeletedObject *)v8 initWithSyncId:v9];
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v10 = qword_26AB047A8;
    if (os_log_type_enabled((os_log_t)qword_26AB047A8, OS_LOG_TYPE_ERROR)) {
      -[SYChange(Additions) objectForStore:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
    id v7 = 0;
  }

  return v7;
}

+ (id)changeWithChangeObject:(id)a3 serializer:(id)a4
{
  return (id)[a1 changeWithChangeObject:a3 serializer:a4 encodeUsingVersion:2];
}

+ (id)changeWithChangeObject:(id)a3 serializer:(id)a4 encodeUsingVersion:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = (SYChange *)v7;
    goto LABEL_29;
  }
  uint64_t v10 = [v7 objectIdentifier];

  if (!v10)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v11 = (void *)qword_26AB047A8;
    if (os_log_type_enabled((os_log_t)qword_26AB047A8, OS_LOG_TYPE_ERROR)) {
      +[SYChange(SYSessionAdditions) changeWithChangeObject:serializer:encodeUsingVersion:](v11, v7);
    }
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"SYChange object %@ does not provide the required objectIdentifier!", v7 format];
  }
  v9 = objc_alloc_init(SYChange);
  uint64_t v12 = [v7 objectIdentifier];
  [(SYChange *)v9 setObjectId:v12];

  uint64_t v13 = [v7 changeType];
  if (v13 == 3) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = v13 == 2;
  }
  [(SYChange *)v9 setType:v14];
  uint64_t v15 = [v7 sequencer];
  [(SYChange *)v9 setSequencer:v15];

  if ([(SYChange *)v9 type] != 3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (a5 != 1)
    {
      uint64_t v16 = [v8 dataFromChange:v7];
      goto LABEL_28;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v16 = [v8 encodeSYChangeForBackwardCompatibility:v7 protocolVersion:1];
LABEL_28:
      v19 = (void *)v16;
      [(SYChange *)v9 setChangeData:v16];

      goto LABEL_29;
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v17 = qword_26AB047A8;
    if (os_log_type_enabled((os_log_t)qword_26AB047A8, OS_LOG_TYPE_ERROR)) {
      +[SYChange(SYSessionAdditions) changeWithChangeObject:serializer:encodeUsingVersion:](v17);
    }
    if (objc_opt_respondsToSelector())
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      v18 = qword_26AB047A8;
      if (os_log_type_enabled((os_log_t)qword_26AB047A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C7C9000, v18, OS_LOG_TYPE_DEFAULT, "Serializing via -dataWithSYObject:, which may fail spectacularly", buf, 2u);
      }
      uint64_t v16 = [v8 dataWithSYObject:v7];
      goto LABEL_28;
    }
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"SYChangeSerializer does not implement -encodeSYChangeForBackwardCompatibility:protocolVersion: or -dataWithSYObject:"];
  }
LABEL_29:

  return v9;
}

- (id)changeObjectWithSerializer:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SYChange *)self changeData];

  if (v5)
  {
    uint64_t v6 = [(SYChange *)self changeData];
    int v7 = [(SYChange *)self type];
    uint64_t v8 = 1;
    if (v7 == 1) {
      uint64_t v8 = 2;
    }
    if (v7 == 2) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = v8;
    }
    uint64_t v10 = [v4 changeFromData:v6 ofType:v9];
  }
  else if ([(SYChange *)self type] == 2)
  {
    uint64_t v11 = [SYDeletedObject alloc];
    uint64_t v12 = [(SYChange *)self objectId];
    uint64_t v13 = [(SYChange *)self sequencer];
    uint64_t v10 = [(SYDeletedObject *)v11 initWithObjectID:v12 sequencer:v13];
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v14 = qword_26AB047A8;
    if (os_log_type_enabled((os_log_t)qword_26AB047A8, OS_LOG_TYPE_ERROR)) {
      -[SYChange(SYSessionAdditions) changeObjectWithSerializer:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)changeObjectWithSerializer:(id)a3 encodedByVersion:(int64_t)a4
{
  id v6 = a3;
  int v7 = [(SYChange *)self changeData];

  if (v7)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [(SYChange *)self changeData];
      int v9 = [(SYChange *)self type];
      uint64_t v10 = 1;
      if (v9 == 1) {
        uint64_t v10 = 2;
      }
      if (v9 == 2) {
        uint64_t v11 = 3;
      }
      else {
        uint64_t v11 = v10;
      }
      uint64_t v12 = [v6 decodeChangeData:v8 fromProtocolVersion:a4 ofType:v11];
      goto LABEL_20;
    }
    if (a4 <= 1 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v16 = [_SYObjectCompatibilityWrapper alloc];
      uint64_t v8 = [(SYChange *)self changeData];
      uint64_t v14 = [v6 SYObjectWithData:v8];
      int v17 = [(SYChange *)self type];
      uint64_t v18 = 1;
      if (v17 == 1) {
        uint64_t v18 = 2;
      }
      if (v17 == 2) {
        uint64_t v19 = 3;
      }
      else {
        uint64_t v19 = v18;
      }
      uint64_t v15 = [(_SYObjectCompatibilityWrapper *)v16 initWithSYObject:v14 changeType:v19];
      goto LABEL_19;
    }
  }
  else
  {
    if ([(SYChange *)self type] == 2)
    {
      uint64_t v13 = [SYDeletedObject alloc];
      uint64_t v8 = [(SYChange *)self objectId];
      uint64_t v14 = [(SYChange *)self sequencer];
      uint64_t v15 = [(SYDeletedObject *)v13 initWithObjectID:v8 sequencer:v14];
LABEL_19:
      uint64_t v12 = (void *)v15;

LABEL_20:
      goto LABEL_26;
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v20 = qword_26AB047A8;
    if (os_log_type_enabled((os_log_t)qword_26AB047A8, OS_LOG_TYPE_ERROR)) {
      -[SYChange(SYSessionAdditions) changeObjectWithSerializer:](v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
  uint64_t v12 = 0;
LABEL_26:

  return v12;
}

- (int64_t)changeType
{
  int v2 = [(SYChange *)self type];
  int64_t v3 = 1;
  if (v2 == 1) {
    int64_t v3 = 2;
  }
  if (v2 == 2) {
    return 3;
  }
  else {
    return v3;
  }
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYChange writeTo:]", "SYChange.m", 128, "nil != self->_objectId");
}

@end