@interface GEOPDSearchBrandRelationship
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchBrandRelationship

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchBrandRelationship;
  v4 = [(GEOPDSearchBrandRelationship *)&v8 description];
  v5 = [(GEOPDSearchBrandRelationship *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchBrandRelationship _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v5 = 0;
    goto LABEL_17;
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v4;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v4, "setObject:forKey:");
  }
  char v6 = *(unsigned char *)(a1 + 40);
  if ((v6 & 2) == 0)
  {
    if ((*(unsigned char *)(a1 + 40) & 4) == 0) {
      goto LABEL_6;
    }
LABEL_9:
    objc_super v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
    if (a2) {
      v9 = @"parentMuid";
    }
    else {
      v9 = @"parent_muid";
    }
    [v5 setObject:v8 forKey:v9];

    if ((*(unsigned char *)(a1 + 40) & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  v7 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
  [v5 setObject:v7 forKey:@"muid"];

  char v6 = *(unsigned char *)(a1 + 40);
  if ((v6 & 4) != 0) {
    goto LABEL_9;
  }
LABEL_6:
  if (v6)
  {
LABEL_13:
    v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
    if (a2) {
      v11 = @"expandedParentMuid";
    }
    else {
      v11 = @"expanded_parent_muid";
    }
    [v5 setObject:v10 forKey:v11];
  }
LABEL_17:

  return v5;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchBrandRelationship _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      if (a3) {
        char v6 = @"relationshipType";
      }
      else {
        char v6 = @"relationship_type";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        id v9 = v8;
        objc_storeStrong((id *)(a1 + 32), v8);
      }
      v10 = [v5 objectForKeyedSubscript:@"muid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [v10 unsignedLongLongValue];
        *(unsigned char *)(a1 + 40) |= 2u;
        *(void *)(a1 + 16) = v11;
      }

      if (a3) {
        v12 = @"parentMuid";
      }
      else {
        v12 = @"parent_muid";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = [v13 unsignedLongLongValue];
        *(unsigned char *)(a1 + 40) |= 4u;
        *(void *)(a1 + 24) = v14;
      }

      if (a3) {
        v15 = @"expandedParentMuid";
      }
      else {
        v15 = @"expanded_parent_muid";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v17 = [v16 unsignedLongLongValue];
        *(unsigned char *)(a1 + 40) |= 1u;
        *(void *)(a1 + 8) = v17;
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchBrandRelationshipReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_relationshipType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_6:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_relationshipType copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v5 + 24) = self->_parentMuid;
    *(unsigned char *)(v5 + 40) |= 4u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 16) = self->_muid;
  *(unsigned char *)(v5 + 40) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    *(void *)(v5 + 8) = self->_expandedParentMuid;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  relationshipType = self->_relationshipType;
  if ((unint64_t)relationshipType | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](relationshipType, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_muid != *((void *)v4 + 2)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_parentMuid != *((void *)v4 + 3)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_expandedParentMuid != *((void *)v4 + 1)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_relationshipType hash];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v5 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  unint64_t v4 = 2654435761u * self->_muid;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_parentMuid;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v6 = 2654435761u * self->_expandedParentMuid;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
}

@end