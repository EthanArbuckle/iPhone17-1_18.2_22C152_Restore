@interface GEOComponentAction
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)actionsAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation GEOComponentAction

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOComponentAction;
  [(GEOComponentAction *)&v3 dealloc];
}

- (uint64_t)actionsAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    unint64_t v4 = *(void *)(result + 24);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(unsigned int *)(*(void *)(v3 + 16) + 4 * a2);
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOComponentAction;
  unint64_t v4 = [(GEOComponentAction *)&v8 description];
  v5 = [(GEOComponentAction *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOComponentAction _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v5 = *(int *)(a1 + 40);
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 40));
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v6 = off_1E53E80B0[v5];
      }
      [v4 setObject:v6 forKey:@"component"];
    }
    if (*(void *)(a1 + 24))
    {
      v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v8 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v9 = 0;
        do
        {
          uint64_t v10 = *(int *)(*v8 + 4 * v9);
          if (v10 >= 5)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
            v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v11 = off_1E53E8058[v10];
          }
          [v7 addObject:v11];

          ++v9;
          objc_super v8 = (void *)(a1 + 16);
        }
        while (v9 < *(void *)(a1 + 24));
      }
      [v4 setObject:v7 forKey:@"actions"];
    }
    if ((*(unsigned char *)(a1 + 48) & 2) != 0)
    {
      v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 44)];
      [v4 setObject:v12 forKey:@"handleLocally"];
    }
    v13 = *(void **)(a1 + 8);
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __48__GEOComponentAction__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOComponentAction _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOComponentAction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    unint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOComponentActionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_actions.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v6;
      ++v5;
    }
    while (v5 < self->_actions.count);
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v4 + 40) = self->_component;
    *(unsigned char *)(v4 + 48) |= 1u;
  }
  PBRepeatedInt32Copy();
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 44) = self->_handleLocally;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_component != *((_DWORD *)v4 + 10)) {
      goto LABEL_10;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_10;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_10;
  }
  BOOL v5 = (*((unsigned char *)v4 + 48) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) != 0)
    {
      if (self->_handleLocally)
      {
        if (!*((unsigned char *)v4 + 44)) {
          goto LABEL_10;
        }
      }
      else if (*((unsigned char *)v4 + 44))
      {
        goto LABEL_10;
      }
      BOOL v5 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v5 = 0;
  }
LABEL_11:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_component;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_handleLocally;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
}

@end