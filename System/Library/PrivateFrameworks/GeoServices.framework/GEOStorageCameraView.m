@interface GEOStorageCameraView
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCamera;
- (BOOL)hasMapType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOStorageCameraView)initWithDictionary:(id)a3;
- (GEOStorageCameraView)initWithJSON:(id)a3;
- (GEOURLCamera)camera;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mapTypeAsString:(int)a3;
- (int)StringAsMapType:(id)a3;
- (int)mapType;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCamera:(id)a3;
- (void)setHasMapType:(BOOL)a3;
- (void)setMapType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOStorageCameraView

- (BOOL)hasCamera
{
  return self->_camera != 0;
}

- (GEOURLCamera)camera
{
  return self->_camera;
}

- (void)setCamera:(id)a3
{
}

- (int)mapType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_mapType;
  }
  else {
    return 0;
  }
}

- (void)setMapType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_mapType = a3;
}

- (void)setHasMapType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasMapType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)mapTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E0DE8[a3];
  }

  return v3;
}

- (int)StringAsMapType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Standard"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Satellite"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Hybrid"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Transit"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Driving"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOStorageCameraView;
  int v4 = [(GEOStorageCameraView *)&v8 description];
  v5 = [(GEOStorageCameraView *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStorageCameraView _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 camera];
    v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"camera"];
    }
    if (*(unsigned char *)(a1 + 28))
    {
      uint64_t v8 = *(int *)(a1 + 24);
      if (v8 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E53E0DE8[v8];
      }
      [v4 setObject:v9 forKey:@"mapType"];
    }
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = [v10 dictionaryRepresentation];
      v12 = v11;
      if (a2)
      {
        v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __50__GEOStorageCameraView__dictionaryRepresentation___block_invoke;
        v17[3] = &unk_1E53D8860;
        id v14 = v13;
        id v18 = v14;
        [v12 enumerateKeysAndObjectsUsingBlock:v17];
        id v15 = v14;

        v12 = v15;
      }
      [v4 setObject:v12 forKey:@"Unknown Fields"];
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
  return -[GEOStorageCameraView _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOStorageCameraView__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOStorageCameraView)initWithDictionary:(id)a3
{
  return (GEOStorageCameraView *)-[GEOStorageCameraView _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"camera"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [GEOURLCamera alloc];
        if (a3) {
          uint64_t v8 = [(GEOURLCamera *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOURLCamera *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setCamera:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"mapType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        if ([v11 isEqualToString:@"Standard"])
        {
          uint64_t v12 = 0;
        }
        else if ([v11 isEqualToString:@"Satellite"])
        {
          uint64_t v12 = 1;
        }
        else if ([v11 isEqualToString:@"Hybrid"])
        {
          uint64_t v12 = 2;
        }
        else if ([v11 isEqualToString:@"Transit"])
        {
          uint64_t v12 = 3;
        }
        else if ([v11 isEqualToString:@"Driving"])
        {
          uint64_t v12 = 4;
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_24:

          goto LABEL_25;
        }
        uint64_t v12 = [v10 intValue];
      }
      [a1 setMapType:v12];
      goto LABEL_24;
    }
  }
LABEL_25:

  return a1;
}

- (GEOStorageCameraView)initWithJSON:(id)a3
{
  return (GEOStorageCameraView *)-[GEOStorageCameraView _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStorageCameraViewIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStorageCameraViewReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_camera)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOStorageCameraView *)self readAll:0];
  if (self->_camera) {
    objc_msgSend(v4, "setCamera:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 6) = self->_mapType;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOURLCamera *)self->_camera copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_mapType;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEOStorageCameraView *)self readAll:1];
  [v4 readAll:1];
  camera = self->_camera;
  if ((unint64_t)camera | *((void *)v4 + 2))
  {
    if (!-[GEOURLCamera isEqual:](camera, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_mapType == *((_DWORD *)v4 + 6))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  [(GEOStorageCameraView *)self readAll:1];
  unint64_t v3 = [(GEOURLCamera *)self->_camera hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_mapType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v6 = (int *)a3;
  [v6 readAll:0];
  camera = self->_camera;
  uint64_t v5 = *((void *)v6 + 2);
  if (camera)
  {
    if (v5) {
      -[GEOURLCamera mergeFrom:](camera, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOStorageCameraView setCamera:](self, "setCamera:");
  }
  if (v6[7])
  {
    self->_mapType = v6[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
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
    [(GEOStorageCameraView *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_camera, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end