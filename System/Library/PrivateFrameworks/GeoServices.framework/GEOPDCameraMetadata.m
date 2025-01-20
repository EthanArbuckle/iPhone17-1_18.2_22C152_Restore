@interface GEOPDCameraMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDCameraMetadata)init;
- (GEOPDCameraMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)lensProjection;
- (id)position;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)_readLensProjection;
- (void)_readPosition;
- (void)_readTextureIds;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDCameraMetadata

- (GEOPDCameraMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDCameraMetadata;
  v2 = [(GEOPDCameraMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDCameraMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDCameraMetadata;
  v3 = [(GEOPDCameraMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDCameraMetadata;
  [(GEOPDCameraMetadata *)&v3 dealloc];
}

- (void)_readLensProjection
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCameraMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLensProjection_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)lensProjection
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCameraMetadata _readLensProjection]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPosition
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCameraMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPosition_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)position
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCameraMetadata _readPosition]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readTextureIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCameraMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTextureIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDCameraMetadata;
  v4 = [(GEOPDCameraMetadata *)&v8 description];
  v5 = [(GEOPDCameraMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCameraMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_33;
  }
  -[GEOPDCameraMetadata readAll:](a1, 1);
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 80);
  if ((v5 & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 80) & 4) == 0) {
      goto LABEL_4;
    }
LABEL_16:
    v14 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
    if (a2) {
      v15 = @"imageWidth";
    }
    else {
      v15 = @"image_width";
    }
    [v4 setObject:v14 forKey:v15];

    if ((*(unsigned char *)(a1 + 80) & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  v12 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  if (a2) {
    v13 = @"cameraNumber";
  }
  else {
    v13 = @"camera_number";
  }
  [v4 setObject:v12 forKey:v13];

  char v5 = *(unsigned char *)(a1 + 80);
  if ((v5 & 4) != 0) {
    goto LABEL_16;
  }
LABEL_4:
  if ((v5 & 2) != 0)
  {
LABEL_5:
    objc_super v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
    if (a2) {
      objc_super v7 = @"imageHeight";
    }
    else {
      objc_super v7 = @"image_height";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_9:
  objc_super v8 = -[GEOPDCameraMetadata lensProjection]((id *)a1);
  v9 = v8;
  if (v8)
  {
    if (a2)
    {
      v10 = [v8 jsonRepresentation];
      v11 = @"lensProjection";
    }
    else
    {
      v10 = [v8 dictionaryRepresentation];
      v11 = @"lens_projection";
    }
    [v4 setObject:v10 forKey:v11];
  }
  v16 = -[GEOPDCameraMetadata position]((id *)a1);
  v17 = v16;
  if (v16)
  {
    if (a2) {
      [v16 jsonRepresentation];
    }
    else {
    v18 = [v16 dictionaryRepresentation];
    }
    [v4 setObject:v18 forKey:@"position"];
  }
  if (*(void *)(a1 + 24))
  {
    v19 = PBRepeatedUInt32NSArray();
    if (a2) {
      v20 = @"textureId";
    }
    else {
      v20 = @"texture_id";
    }
    [v4 setObject:v19 forKey:v20];
  }
LABEL_33:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDCameraMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_59;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_59;
      }
      GEOPDCameraMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 48) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      objc_super v7 = @"cameraNumber";
    }
    else {
      objc_super v7 = @"camera_number";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [v8 intValue];
      *(unsigned char *)(v6 + 80) |= 0x40u;
      *(unsigned char *)(v6 + 80) |= 1u;
      *(_DWORD *)(v6 + 68) = v9;
    }

    if (a3) {
      v10 = @"imageWidth";
    }
    else {
      v10 = @"image_width";
    }
    v11 = [v5 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v12 = [v11 intValue];
      *(unsigned char *)(v6 + 80) |= 0x40u;
      *(unsigned char *)(v6 + 80) |= 4u;
      *(_DWORD *)(v6 + 76) = v12;
    }

    if (a3) {
      v13 = @"imageHeight";
    }
    else {
      v13 = @"image_height";
    }
    v14 = [v5 objectForKeyedSubscript:v13];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v15 = [v14 intValue];
      *(unsigned char *)(v6 + 80) |= 0x40u;
      *(unsigned char *)(v6 + 80) |= 2u;
      *(_DWORD *)(v6 + 72) = v15;
    }

    if (a3) {
      v16 = @"lensProjection";
    }
    else {
      v16 = @"lens_projection";
    }
    v17 = [v5 objectForKeyedSubscript:v16];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [GEOPDLensProjection alloc];
      if (v18)
      {
        id v19 = v17;
        v18 = [(GEOPDLensProjection *)v18 init];
        if (v18)
        {
          v20 = [v19 objectForKeyedSubscript:@"type"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v21 = [v20 intValue];
            *(_WORD *)&v18->_flags |= 0x200u;
            v18->_type = v21;
          }

          if (a3) {
            v22 = @"fovS";
          }
          else {
            v22 = @"fov_s";
          }
          v23 = [v19 objectForKeyedSubscript:v22];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v23 doubleValue];
            *(_WORD *)&v18->_flags |= 8u;
            v18->_fovS = v24;
          }

          if (a3) {
            v25 = @"fovH";
          }
          else {
            v25 = @"fov_h";
          }
          v26 = [v19 objectForKeyedSubscript:v25];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v26 doubleValue];
            *(_WORD *)&v18->_flags |= 4u;
            v18->_fovH = v27;
          }

          v28 = [v19 objectForKeyedSubscript:@"k2"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v28 doubleValue];
            *(_WORD *)&v18->_flags |= 0x10u;
            v18->_k2 = v29;
          }

          v30 = [v19 objectForKeyedSubscript:@"k3"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v30 doubleValue];
            *(_WORD *)&v18->_flags |= 0x20u;
            v18->_k3 = v31;
          }

          v32 = [v19 objectForKeyedSubscript:@"k4"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v32 doubleValue];
            *(_WORD *)&v18->_flags |= 0x40u;
            v18->_k4 = v33;
          }

          v34 = [v19 objectForKeyedSubscript:@"cx"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v34 doubleValue];
            *(_WORD *)&v18->_flags |= 1u;
            v18->_cx = v35;
          }

          v36 = [v19 objectForKeyedSubscript:@"cy"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v36 doubleValue];
            *(_WORD *)&v18->_flags |= 2u;
            v18->_cy = v37;
          }

          v38 = [v19 objectForKeyedSubscript:@"lx"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v38 doubleValue];
            *(_WORD *)&v18->_flags |= 0x80u;
            v18->_lx = v39;
          }

          v40 = [v19 objectForKeyedSubscript:@"ly"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v40 doubleValue];
            *(_WORD *)&v18->_flags |= 0x100u;
            v18->_ly = v41;
          }
        }
      }
      v42 = v18;
      *(unsigned char *)(v6 + 80) |= 0x10u;
      *(unsigned char *)(v6 + 80) |= 0x40u;
      objc_storeStrong((id *)(v6 + 40), v18);
    }
    v43 = [v5 objectForKeyedSubscript:@"position"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v44 = [GEOPDOrientedPosition alloc];
      if (a3) {
        v45 = [(GEOPDOrientedPosition *)v44 initWithJSON:v43];
      }
      else {
        v45 = [(GEOPDOrientedPosition *)v44 initWithDictionary:v43];
      }
      v46 = v45;
      v47 = v45;
      *(unsigned char *)(v6 + 80) |= 0x20u;
      *(unsigned char *)(v6 + 80) |= 0x40u;
      objc_storeStrong((id *)(v6 + 48), v46);
    }
    if (a3) {
      v48 = @"textureId";
    }
    else {
      v48 = @"texture_id";
    }
    v49 = [v5 objectForKeyedSubscript:v48];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v57 = v49;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v50 = v49;
      uint64_t v51 = [v50 countByEnumeratingWithState:&v58 objects:v62 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v52; ++i)
          {
            if (*(void *)v59 != v53) {
              objc_enumerationMutation(v50);
            }
            v55 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v55 unsignedIntValue];
              -[GEOPDCameraMetadata _readTextureIds](v6);
              PBRepeatedUInt32Add();
              os_unfair_lock_lock_with_options();
              *(unsigned char *)(v6 + 80) |= 8u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 64));
              *(unsigned char *)(v6 + 80) |= 0x40u;
            }
          }
          uint64_t v52 = [v50 countByEnumeratingWithState:&v58 objects:v62 count:16];
        }
        while (v52);
      }

      v49 = v57;
    }
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDCameraMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x78) == 0))
  {
    int v9 = self->_reader;
    objc_sync_enter(v9);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v11 writeData:v10];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
    uint64_t v6 = v11;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDCameraMetadata readAll:]((uint64_t)self, 0);
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    uint64_t v6 = v11;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      uint64_t v6 = v11;
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      uint64_t v6 = v11;
    }
    if (self->_lensProjection)
    {
      PBDataWriterWriteSubmessage();
      uint64_t v6 = v11;
    }
    if (self->_position)
    {
      PBDataWriterWriteSubmessage();
      uint64_t v6 = v11;
    }
    p_textureIds = &self->_textureIds;
    if (p_textureIds->count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        uint64_t v6 = v11;
        ++v8;
      }
      while (v8 < p_textureIds->count);
    }
  }
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
    -[GEOPDCameraMetadata readAll:]((uint64_t)self, 0);
    char flags = (char)self->_flags;
    if (flags)
    {
      *(_DWORD *)(v5 + 68) = self->_cameraNumber;
      *(unsigned char *)(v5 + 80) |= 1u;
      char flags = (char)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_7:
        if ((flags & 2) == 0)
        {
LABEL_9:
          id v10 = [(GEOPDLensProjection *)self->_lensProjection copyWithZone:a3];
          id v11 = *(void **)(v5 + 40);
          *(void *)(v5 + 40) = v10;

          id v12 = [(GEOPDOrientedPosition *)self->_position copyWithZone:a3];
          v13 = *(void **)(v5 + 48);
          *(void *)(v5 + 48) = v12;

          PBRepeatedUInt32Copy();
          return (id)v5;
        }
LABEL_8:
        *(_DWORD *)(v5 + 72) = self->_imageHeight;
        *(unsigned char *)(v5 + 80) |= 2u;
        goto LABEL_9;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 76) = self->_imageWidth;
    *(unsigned char *)(v5 + 80) |= 4u;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
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
  GEOPDCameraMetadataReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  -[GEOPDCameraMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDCameraMetadata readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_cameraNumber != *((_DWORD *)v4 + 17)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_22:
    char IsEqual = 0;
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_imageWidth != *((_DWORD *)v4 + 19)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_imageHeight != *((_DWORD *)v4 + 18)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_22;
  }
  lensProjection = self->_lensProjection;
  if ((unint64_t)lensProjection | *((void *)v4 + 5)
    && !-[GEOPDLensProjection isEqual:](lensProjection, "isEqual:"))
  {
    goto LABEL_22;
  }
  position = self->_position;
  if ((unint64_t)position | *((void *)v4 + 6))
  {
    if (!-[GEOPDOrientedPosition isEqual:](position, "isEqual:")) {
      goto LABEL_22;
    }
  }
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_23:

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOPDCameraMetadata readAll:]((uint64_t)self, 1);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_cameraNumber;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_imageWidth;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_imageHeight;
LABEL_8:
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(GEOPDLensProjection *)self->_lensProjection hash];
  unint64_t v7 = [(GEOPDOrientedPosition *)self->_position hash];
  return v6 ^ v7 ^ PBRepeatedUInt32Hash();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_lensProjection, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end