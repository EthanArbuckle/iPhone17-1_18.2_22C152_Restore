@interface GEOPDGroupParams
+ (BOOL)isValid:(id)a3;
- (BOOL)hasActionDataItemIndex;
- (BOOL)hasGroupButtonType;
- (BOOL)hasGroupData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDGroupData)groupData;
- (GEOPDGroupParams)initWithDictionary:(id)a3;
- (GEOPDGroupParams)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groupButtonTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsGroupButtonType:(id)a3;
- (int)actionDataItemIndex;
- (int)groupButtonType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionDataItemIndex:(int)a3;
- (void)setGroupButtonType:(int)a3;
- (void)setGroupData:(id)a3;
- (void)setHasActionDataItemIndex:(BOOL)a3;
- (void)setHasGroupButtonType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDGroupParams

- (int)groupButtonType
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_groupButtonType;
  }
  else {
    return 0;
  }
}

- (void)setGroupButtonType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_groupButtonType = a3;
}

- (void)setHasGroupButtonType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasGroupButtonType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)groupButtonTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"GROUP_BUTTON_TYPE_GROUP";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"GROUP_BUTTON_TYPE_ACTION";
  }
  return v4;
}

- (int)StringAsGroupButtonType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GROUP_BUTTON_TYPE_ACTION"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"GROUP_BUTTON_TYPE_GROUP"];
  }

  return v4;
}

- (int)actionDataItemIndex
{
  return self->_actionDataItemIndex;
}

- (void)setActionDataItemIndex:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_actionDataItemIndex = a3;
}

- (void)setHasActionDataItemIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasActionDataItemIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasGroupData
{
  return self->_groupData != 0;
}

- (GEOPDGroupData)groupData
{
  return self->_groupData;
}

- (void)setGroupData:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGroupParams;
  int v4 = [(GEOPDGroupParams *)&v8 description];
  v5 = [(GEOPDGroupParams *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGroupParams _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 32);
    if ((v5 & 2) != 0)
    {
      int v6 = *(_DWORD *)(a1 + 28);
      if (v6)
      {
        if (v6 == 1)
        {
          v7 = @"GROUP_BUTTON_TYPE_GROUP";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 28));
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v7 = @"GROUP_BUTTON_TYPE_ACTION";
      }
      if (a2) {
        objc_super v8 = @"groupButtonType";
      }
      else {
        objc_super v8 = @"group_button_type";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 32);
    }
    if (v5)
    {
      v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 24)];
      if (a2) {
        v10 = @"actionDataItemIndex";
      }
      else {
        v10 = @"action_data_item_index";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = [(id)a1 groupData];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"groupData";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"group_data";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = *(void **)(a1 + 8);
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __46__GEOPDGroupParams__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDGroupParams _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOPDGroupParams__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDGroupParams)initWithDictionary:(id)a3
{
  return (GEOPDGroupParams *)-[GEOPDGroupParams _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_28;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_28;
  }
  if (a3) {
    int v6 = @"groupButtonType";
  }
  else {
    int v6 = @"group_button_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"GROUP_BUTTON_TYPE_ACTION"]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = [v8 isEqualToString:@"GROUP_BUTTON_TYPE_GROUP"];
    }

    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_13:
    [a1 setGroupButtonType:v9];
  }

  if (a3) {
    id v10 = @"actionDataItemIndex";
  }
  else {
    id v10 = @"action_data_item_index";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setActionDataItemIndex:", objc_msgSend(v11, "intValue"));
  }

  if (a3) {
    v12 = @"groupData";
  }
  else {
    v12 = @"group_data";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [GEOPDGroupData alloc];
    if (a3) {
      uint64_t v15 = [(GEOPDGroupData *)v14 initWithJSON:v13];
    }
    else {
      uint64_t v15 = [(GEOPDGroupData *)v14 initWithDictionary:v13];
    }
    v16 = (void *)v15;
    [a1 setGroupData:v15];
  }
LABEL_28:

  return a1;
}

- (GEOPDGroupParams)initWithJSON:(id)a3
{
  return (GEOPDGroupParams *)-[GEOPDGroupParams _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDGroupParamsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGroupParamsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_groupData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEOPDGroupParams *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 7) = self->_groupButtonType;
    *((unsigned char *)v6 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v6 + 6) = self->_actionDataItemIndex;
    *((unsigned char *)v6 + 32) |= 1u;
  }
  if (self->_groupData)
  {
    objc_msgSend(v6, "setGroupData:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_groupButtonType;
    *(unsigned char *)(v5 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_actionDataItemIndex;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v8 = [(GEOPDGroupData *)self->_groupData copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOPDGroupParams *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_groupButtonType != *((_DWORD *)v4 + 7)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_actionDataItemIndex != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_14;
  }
  groupData = self->_groupData;
  if ((unint64_t)groupData | *((void *)v4 + 2)) {
    char v6 = -[GEOPDGroupData isEqual:](groupData, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPDGroupParams *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_groupButtonType;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3 ^ [(GEOPDGroupData *)self->_groupData hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_actionDataItemIndex;
  return v4 ^ v3 ^ [(GEOPDGroupData *)self->_groupData hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = (int *)a3;
  [v8 readAll:0];
  uint64_t v4 = v8;
  char v5 = *((unsigned char *)v8 + 32);
  if ((v5 & 2) != 0)
  {
    self->_groupButtonType = v8[7];
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v8 + 32);
  }
  if (v5)
  {
    self->_actionDataItemIndex = v8[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
  groupData = self->_groupData;
  uint64_t v7 = *((void *)v8 + 2);
  if (groupData)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOPDGroupData mergeFrom:](groupData, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOPDGroupParams setGroupData:](self, "setGroupData:");
  }
  uint64_t v4 = v8;
LABEL_11:
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDGroupParams *)self readAll:0];
    groupData = self->_groupData;
    [(GEOPDGroupData *)groupData clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupData, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end