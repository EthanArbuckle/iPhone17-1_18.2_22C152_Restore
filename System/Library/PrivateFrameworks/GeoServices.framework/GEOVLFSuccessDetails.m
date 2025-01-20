@interface GEOVLFSuccessDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCorrection;
- (BOOL)hasPoseConfidence;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFCorrection)correction;
- (GEOVLFSuccessDetails)init;
- (GEOVLFSuccessDetails)initWithData:(id)a3;
- (GEOVLFSuccessDetails)initWithDictionary:(id)a3;
- (GEOVLFSuccessDetails)initWithJSON:(id)a3;
- (double)poseConfidence;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)inlierSuccessIndicesCount;
- (unsigned)inlierSuccessIndices;
- (unsigned)inlierSuccessIndicesAtIndex:(unint64_t)a3;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCorrection;
- (void)_readInlierSuccessIndices;
- (void)addInlierSuccessIndices:(unsigned int)a3;
- (void)clearInlierSuccessIndices;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCorrection:(id)a3;
- (void)setHasPoseConfidence:(BOOL)a3;
- (void)setInlierSuccessIndices:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPoseConfidence:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFSuccessDetails

- (GEOVLFSuccessDetails)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOVLFSuccessDetails;
  v2 = [(GEOVLFSuccessDetails *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVLFSuccessDetails)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOVLFSuccessDetails;
  v3 = [(GEOVLFSuccessDetails *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEOVLFSuccessDetails;
  [(GEOVLFSuccessDetails *)&v3 dealloc];
}

- (void)_readCorrection
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFSuccessDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrection_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasCorrection
{
  return self->_correction != 0;
}

- (GEOVLFCorrection)correction
{
  -[GEOVLFSuccessDetails _readCorrection]((uint64_t)self);
  correction = self->_correction;

  return correction;
}

- (void)setCorrection:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_correction, a3);
}

- (double)poseConfidence
{
  return self->_poseConfidence;
}

- (void)setPoseConfidence:(double)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  self->_poseConfidence = a3;
}

- (void)setHasPoseConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasPoseConfidence
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readInlierSuccessIndices
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFSuccessDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInlierSuccessIndices_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)inlierSuccessIndicesCount
{
  return self->_inlierSuccessIndices.count;
}

- (unsigned)inlierSuccessIndices
{
  return self->_inlierSuccessIndices.list;
}

- (void)clearInlierSuccessIndices
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  PBRepeatedUInt32Clear();
}

- (void)addInlierSuccessIndices:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (unsigned)inlierSuccessIndicesAtIndex:(unint64_t)a3
{
  -[GEOVLFSuccessDetails _readInlierSuccessIndices]((uint64_t)self);
  p_inlierSuccessIndices = &self->_inlierSuccessIndices;
  unint64_t count = self->_inlierSuccessIndices.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_inlierSuccessIndices->list[a3];
}

- (void)setInlierSuccessIndices:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  MEMORY[0x1F4147400](&self->_inlierSuccessIndices, a3, a4);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLFSuccessDetails;
  v4 = [(GEOVLFSuccessDetails *)&v8 description];
  v5 = [(GEOVLFSuccessDetails *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFSuccessDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 correction];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"correction"];
    }
    if (*(unsigned char *)(a1 + 68))
    {
      objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      if (a2) {
        v9 = @"poseConfidence";
      }
      else {
        v9 = @"pose_confidence";
      }
      [v4 setObject:v8 forKey:v9];
    }
    if (*(void *)(a1 + 24))
    {
      v10 = PBRepeatedUInt32NSArray();
      if (a2) {
        v11 = @"inlierSuccessIndices";
      }
      else {
        v11 = @"inlier_success_indices";
      }
      [v4 setObject:v10 forKey:v11];
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
  return -[GEOVLFSuccessDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFSuccessDetails)initWithDictionary:(id)a3
{
  return (GEOVLFSuccessDetails *)-[GEOVLFSuccessDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"correction"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOVLFCorrection alloc];
        if (a3) {
          uint64_t v8 = [(GEOVLFCorrection *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOVLFCorrection *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setCorrection:v8];
      }
      if (a3) {
        v10 = @"poseConfidence";
      }
      else {
        v10 = @"pose_confidence";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v11 doubleValue];
        objc_msgSend(a1, "setPoseConfidence:");
      }

      if (a3) {
        v12 = @"inlierSuccessIndices";
      }
      else {
        v12 = @"inlier_success_indices";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v22 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addInlierSuccessIndices:", objc_msgSend(v19, "unsignedIntValue", (void)v21));
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v16);
        }
      }
    }
  }

  return a1;
}

- (GEOVLFSuccessDetails)initWithJSON:(id)a3
{
  return (GEOVLFSuccessDetails *)-[GEOVLFSuccessDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_12241;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_12242;
    }
    GEOVLFSuccessDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOVLFCorrection *)self->_correction readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFSuccessDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFSuccessDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    uint64_t v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
    id v5 = v10;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOVLFSuccessDetails *)self readAll:0];
    if (self->_correction) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v10;
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteDoubleField();
      id v5 = v10;
    }
    p_inlierSuccessIndices = &self->_inlierSuccessIndices;
    if (p_inlierSuccessIndices->count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        id v5 = v10;
        ++v7;
      }
      while (v7 < p_inlierSuccessIndices->count);
    }
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v7 = (id *)a3;
  [(GEOVLFSuccessDetails *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 14) = self->_readerMarkPos;
  *((_DWORD *)v7 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_correction) {
    objc_msgSend(v7, "setCorrection:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    v7[6] = *(id *)&self->_poseConfidence;
    *((unsigned char *)v7 + 68) |= 1u;
  }
  if ([(GEOVLFSuccessDetails *)self inlierSuccessIndicesCount])
  {
    [v7 clearInlierSuccessIndices];
    unint64_t v4 = [(GEOVLFSuccessDetails *)self inlierSuccessIndicesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addInlierSuccessIndices:", -[GEOVLFSuccessDetails inlierSuccessIndicesAtIndex:](self, "inlierSuccessIndicesAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOVLFSuccessDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOVLFSuccessDetails *)self readAll:0];
  id v9 = [(GEOVLFCorrection *)self->_correction copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 48) = self->_poseConfidence;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  PBRepeatedUInt32Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  [(GEOVLFSuccessDetails *)self readAll:1];
  [v4 readAll:1];
  correction = self->_correction;
  if ((unint64_t)correction | *((void *)v4 + 5))
  {
    if (!-[GEOVLFCorrection isEqual:](correction, "isEqual:")) {
      goto LABEL_10;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_poseConfidence != *((double *)v4 + 6)) {
      goto LABEL_10;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_10:
    char IsEqual = 0;
    goto LABEL_11;
  }
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_11:

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOVLFSuccessDetails *)self readAll:1];
  unint64_t v3 = [(GEOVLFCorrection *)self->_correction hash];
  if (*(unsigned char *)&self->_flags)
  {
    double poseConfidence = self->_poseConfidence;
    double v6 = -poseConfidence;
    if (poseConfidence >= 0.0) {
      double v6 = self->_poseConfidence;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4 ^ PBRepeatedUInt32Hash() ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v9 = (double *)a3;
  [v9 readAll:0];
  correction = self->_correction;
  uint64_t v5 = *((void *)v9 + 5);
  if (correction)
  {
    if (v5) {
      -[GEOVLFCorrection mergeFrom:](correction, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOVLFSuccessDetails setCorrection:](self, "setCorrection:");
  }
  if (*((unsigned char *)v9 + 68))
  {
    self->_double poseConfidence = v9[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
  uint64_t v6 = [v9 inlierSuccessIndicesCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[GEOVLFSuccessDetails addInlierSuccessIndices:](self, "addInlierSuccessIndices:", [v9 inlierSuccessIndicesAtIndex:i]);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correction, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end