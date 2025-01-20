@interface GEOPDLabelGeometry
+ (GEOPDLabelGeometry)labelGeometryWithPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)labelShapes;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1;
- (unint64_t)hash;
- (void)addLabelShape:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDLabelGeometry

+ (GEOPDLabelGeometry)labelGeometryWithPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__GEOPDLabelGeometry_PlaceDataExtras__labelGeometryWithPlaceData___block_invoke;
  v6[3] = &unk_1E53E1740;
  v6[4] = &v7;
  [v3 enumerateComponentOfType:87 enumerationOptions:1 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (GEOPDLabelGeometry *)v4;
}

void __66__GEOPDLabelGeometry_PlaceDataExtras__labelGeometryWithPlaceData___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = -[GEOPDComponent values](a2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        if (v10 && *(void *)(v10 + 320))
        {
          uint64_t v11 = -[GEOPDComponentValue labelGeometry]((id *)v10);
          uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
          v13 = *(void **)(v12 + 40);
          *(void *)(v12 + 40) = v11;

          *a3 = 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = *(id *)(a1 + 16);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (v8)
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v9 = *(id *)(v8 + 16);
          uint64_t v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16, (void)v16);
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v21;
            while (2)
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v21 != v12) {
                  objc_enumerationMutation(v9);
                }
                if ([*(id *)(*((void *)&v20 + 1) + 8 * j) hasGreenTeaWithValue:a2])
                {

                  uint64_t v14 = 1;
                  goto LABEL_22;
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
      uint64_t v14 = 0;
    }
    while (v5);
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_22:

  return v14;
}

- (id)labelShapes
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addLabelShape:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      uint64_t v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDLabelGeometry;
  uint64_t v4 = [(GEOPDLabelGeometry *)&v8 description];
  id v5 = [(GEOPDLabelGeometry *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDLabelGeometry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 16) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v6 = *(id *)(a1 + 16);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v26 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            uint64_t v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"labelShape";
      }
      else {
        v13 = @"label_shape";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if (*(unsigned char *)(a1 + 28))
    {
      uint64_t v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
      if (a2) {
        long long v15 = @"hasSelectionPolygon";
      }
      else {
        long long v15 = @"has_selection_polygon";
      }
      [v4 setObject:v14 forKey:v15];
    }
    long long v16 = *(void **)(a1 + 8);
    if (v16)
    {
      long long v17 = [v16 dictionaryRepresentation];
      long long v18 = v17;
      if (a2)
      {
        long long v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __48__GEOPDLabelGeometry__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        long long v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDLabelGeometry _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOPDLabelGeometry__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDLabelGeometryReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_labelShapes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteBOOLField();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_labelShapes;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        -[GEOPDLabelGeometry addLabelShape:](v5, v11);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 24) = self->_hasSelectionPolygon;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  labelShapes = self->_labelShapes;
  if ((unint64_t)labelShapes | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](labelShapes, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_hasSelectionPolygon)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_labelShapes hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_hasSelectionPolygon;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelShapes, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end