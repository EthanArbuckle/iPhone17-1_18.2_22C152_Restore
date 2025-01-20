@interface GEOPDViewportFrame
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDViewportFrame)init;
- (GEOPDViewportFrame)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)targetPoint;
- (id)viewTargetBounds;
- (unint64_t)hash;
- (void)_readTargetPoint;
- (void)_readViewTargetBounds;
- (void)readAll:(uint64_t)a1;
- (void)setTargetPoint:(uint64_t)a1;
- (void)setViewTargetBounds:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDViewportFrame

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_9829;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_9830;
      }
      GEOPDViewportFrameReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      [*(id *)(a1 + 24) readAll:1];
      -[GEOPDBoundingCube readAll:](*(void *)(a1 + 32), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (GEOPDViewportFrame)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDViewportFrame;
  v2 = [(GEOPDViewportFrame *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDViewportFrame)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDViewportFrame;
  v3 = [(GEOPDViewportFrame *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readTargetPoint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDViewportFrameReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTargetPoint_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)targetPoint
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDViewportFrame _readTargetPoint]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setTargetPoint:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 64) |= 0x10u;
  *(unsigned char *)(a1 + 64) |= 0x40u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)_readViewTargetBounds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 64) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDViewportFrameReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewTargetBounds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)viewTargetBounds
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDViewportFrame _readViewTargetBounds]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setViewTargetBounds:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 64) |= 0x20u;
  *(unsigned char *)(a1 + 64) |= 0x40u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDViewportFrame;
  id v4 = [(GEOPDViewportFrame *)&v8 description];
  id v5 = [(GEOPDViewportFrame *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDViewportFrame _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_23;
  }
  -[GEOPDViewportFrame readAll:](a1, 1);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = -[GEOPDViewportFrame targetPoint]((id *)a1);
  objc_super v6 = v5;
  if (v5)
  {
    if (a2)
    {
      objc_super v7 = [v5 jsonRepresentation];
      objc_super v8 = @"targetPoint";
    }
    else
    {
      objc_super v7 = [v5 dictionaryRepresentation];
      objc_super v8 = @"target_point";
    }
    [v4 setObject:v7 forKey:v8];
  }
  char v10 = *(unsigned char *)(a1 + 64);
  if ((v10 & 2) == 0)
  {
    if ((*(unsigned char *)(a1 + 64) & 4) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    LODWORD(v9) = *(_DWORD *)(a1 + 60);
    v17 = [NSNumber numberWithFloat:v9];
    [v4 setObject:v17 forKey:@"pitch"];

    if ((*(unsigned char *)(a1 + 64) & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  LODWORD(v9) = *(_DWORD *)(a1 + 56);
  v16 = [NSNumber numberWithFloat:v9];
  [v4 setObject:v16 forKey:@"heading"];

  char v10 = *(unsigned char *)(a1 + 64);
  if ((v10 & 4) != 0) {
    goto LABEL_15;
  }
LABEL_9:
  if (v10)
  {
LABEL_10:
    LODWORD(v9) = *(_DWORD *)(a1 + 52);
    v11 = [NSNumber numberWithFloat:v9];
    [v4 setObject:v11 forKey:@"distance"];
  }
LABEL_11:
  v12 = -[GEOPDViewportFrame viewTargetBounds]((id *)a1);
  v13 = v12;
  if (v12)
  {
    if (a2)
    {
      v14 = [v12 jsonRepresentation];
      v15 = @"viewTargetBounds";
    }
    else
    {
      v14 = [v12 dictionaryRepresentation];
      v15 = @"view_target_bounds";
    }
    [v4 setObject:v14 forKey:v15];
  }
  v18 = *(void **)(a1 + 16);
  if (v18)
  {
    v19 = [v18 dictionaryRepresentation];
    v20 = v19;
    if (a2)
    {
      v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __48__GEOPDViewportFrame__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E53D8860;
      id v22 = v21;
      id v26 = v22;
      [v20 enumerateKeysAndObjectsUsingBlock:v25];
      id v23 = v22;

      v20 = v23;
    }
    [v4 setObject:v20 forKey:@"Unknown Fields"];
  }
LABEL_23:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDViewportFrame _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOPDViewportFrame__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    double v9 = [v10 description];
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
  return GEOPDViewportFrameReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDViewportFrameIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_16;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDViewportFrame readAll:]((uint64_t)self, 0);
  if (self->_targetPoint) {
    PBDataWriterWriteSubmessage();
  }
  char flags = (char)self->_flags;
  id v6 = v9;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    PBDataWriterWriteFloatField();
    id v6 = v9;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  PBDataWriterWriteFloatField();
  id v6 = v9;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_13;
  }
LABEL_7:
  if (flags)
  {
LABEL_8:
    PBDataWriterWriteFloatField();
    id v6 = v9;
  }
LABEL_9:
  if (self->_viewTargetBounds)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v9;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
LABEL_16:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDViewportFrame readAll:]((uint64_t)self, 0);
    id v9 = [(GEOPDGeographicCoordinate *)self->_targetPoint copyWithZone:a3];
    id v10 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v9;

    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      *(float *)(v5 + 56) = self->_heading;
      *(unsigned char *)(v5 + 64) |= 2u;
      char flags = (char)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_7:
        if ((flags & 1) == 0)
        {
LABEL_9:
          id v12 = [(GEOPDBoundingCube *)self->_viewTargetBounds copyWithZone:a3];
          v13 = *(void **)(v5 + 32);
          *(void *)(v5 + 32) = v12;

          v14 = self->_unknownFields;
          id v8 = *(id *)(v5 + 16);
          *(void *)(v5 + 16) = v14;
          goto LABEL_10;
        }
LABEL_8:
        *(float *)(v5 + 52) = self->_distance;
        *(unsigned char *)(v5 + 64) |= 1u;
        goto LABEL_9;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      goto LABEL_7;
    }
    *(float *)(v5 + 60) = self->_pitch;
    *(unsigned char *)(v5 + 64) |= 4u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDViewportFrameReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_10:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  -[GEOPDViewportFrame readAll:]((uint64_t)self, 1);
  -[GEOPDViewportFrame readAll:]((uint64_t)v4, 1);
  targetPoint = self->_targetPoint;
  if ((unint64_t)targetPoint | *((void *)v4 + 3))
  {
    if (!-[GEOPDGeographicCoordinate isEqual:](targetPoint, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_heading != *((float *)v4 + 14)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
LABEL_21:
    char v7 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_pitch != *((float *)v4 + 15)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_distance != *((float *)v4 + 13)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_21;
  }
  viewTargetBounds = self->_viewTargetBounds;
  if ((unint64_t)viewTargetBounds | *((void *)v4 + 4)) {
    char v7 = -[GEOPDBoundingCube isEqual:](viewTargetBounds, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDViewportFrame readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDGeographicCoordinate *)self->_targetPoint hash];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    float heading = self->_heading;
    double v7 = heading;
    if (heading < 0.0) {
      double v7 = -heading;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((flags & 4) != 0)
  {
    float pitch = self->_pitch;
    double v12 = pitch;
    if (pitch < 0.0) {
      double v12 = -pitch;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if (flags)
  {
    float distance = self->_distance;
    double v17 = distance;
    if (distance < 0.0) {
      double v17 = -distance;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15 ^ [(GEOPDBoundingCube *)self->_viewTargetBounds hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewTargetBounds, 0);
  objc_storeStrong((id *)&self->_targetPoint, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end