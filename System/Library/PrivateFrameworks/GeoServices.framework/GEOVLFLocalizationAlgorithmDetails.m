@interface GEOVLFLocalizationAlgorithmDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)hasNumberOfInliers;
- (BOOL)hasNumberOfKeypoints;
- (BOOL)hasNumberOfMatches;
- (BOOL)hasTKptsMs;
- (BOOL)hasTMatchMs;
- (BOOL)hasTPoseMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFLocalizationAlgorithmDetails)init;
- (GEOVLFLocalizationAlgorithmDetails)initWithData:(id)a3;
- (GEOVLFLocalizationAlgorithmDetails)initWithDictionary:(id)a3;
- (GEOVLFLocalizationAlgorithmDetails)initWithJSON:(id)a3;
- (double)fusedConfidenceAtIndex:(unint64_t)a3;
- (double)fusedConfidences;
- (double)solverConfidenceAtIndex:(unint64_t)a3;
- (double)solverConfidences;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)fusedConfidencesCount;
- (unint64_t)hash;
- (unint64_t)solverConfidencesCount;
- (unsigned)numberOfInliers;
- (unsigned)numberOfKeypoints;
- (unsigned)numberOfMatches;
- (unsigned)tKptsMs;
- (unsigned)tMatchMs;
- (unsigned)tPoseMs;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readFusedConfidences;
- (void)_readSolverConfidences;
- (void)addFusedConfidence:(double)a3;
- (void)addSolverConfidence:(double)a3;
- (void)clearFusedConfidences;
- (void)clearSolverConfidences;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setFusedConfidences:(double *)a3 count:(unint64_t)a4;
- (void)setHasNumberOfInliers:(BOOL)a3;
- (void)setHasNumberOfKeypoints:(BOOL)a3;
- (void)setHasNumberOfMatches:(BOOL)a3;
- (void)setHasTKptsMs:(BOOL)a3;
- (void)setHasTMatchMs:(BOOL)a3;
- (void)setHasTPoseMs:(BOOL)a3;
- (void)setNumberOfInliers:(unsigned int)a3;
- (void)setNumberOfKeypoints:(unsigned int)a3;
- (void)setNumberOfMatches:(unsigned int)a3;
- (void)setSolverConfidences:(double *)a3 count:(unint64_t)a4;
- (void)setTKptsMs:(unsigned int)a3;
- (void)setTMatchMs:(unsigned int)a3;
- (void)setTPoseMs:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFLocalizationAlgorithmDetails

- (GEOVLFLocalizationAlgorithmDetails)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOVLFLocalizationAlgorithmDetails;
  v2 = [(GEOVLFLocalizationAlgorithmDetails *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVLFLocalizationAlgorithmDetails)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOVLFLocalizationAlgorithmDetails;
  v3 = [(GEOVLFLocalizationAlgorithmDetails *)&v7 initWithData:a3];
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
  PBRepeatedDoubleClear();
  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)GEOVLFLocalizationAlgorithmDetails;
  [(GEOVLFLocalizationAlgorithmDetails *)&v3 dealloc];
}

- (unsigned)numberOfKeypoints
{
  return self->_numberOfKeypoints;
}

- (void)setNumberOfKeypoints:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_numberOfKeypoints = a3;
}

- (void)setHasNumberOfKeypoints:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 258;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasNumberOfKeypoints
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unsigned)numberOfMatches
{
  return self->_numberOfMatches;
}

- (void)setNumberOfMatches:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  self->_numberOfMatches = a3;
}

- (void)setHasNumberOfMatches:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 260;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasNumberOfMatches
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)numberOfInliers
{
  return self->_numberOfInliers;
}

- (void)setNumberOfInliers:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_numberOfInliers = a3;
}

- (void)setHasNumberOfInliers:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasNumberOfInliers
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readSolverConfidences
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 100) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationAlgorithmDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSolverConfidences_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)solverConfidencesCount
{
  return self->_solverConfidences.count;
}

- (double)solverConfidences
{
  return self->_solverConfidences.list;
}

- (void)clearSolverConfidences
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;

  PBRepeatedDoubleClear();
}

- (void)addSolverConfidence:(double)a3
{
  if (self) {
    PBRepeatedDoubleAdd();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (double)solverConfidenceAtIndex:(unint64_t)a3
{
  -[GEOVLFLocalizationAlgorithmDetails _readSolverConfidences]((uint64_t)self);
  p_solverConfidences = &self->_solverConfidences;
  unint64_t count = self->_solverConfidences.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_solverConfidences->list[a3];
}

- (void)setSolverConfidences:(double *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;

  MEMORY[0x1F4147320](&self->_solverConfidences, a3, a4);
}

- (void)_readFusedConfidences
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 100) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationAlgorithmDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFusedConfidences_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)fusedConfidencesCount
{
  return self->_fusedConfidences.count;
}

- (double)fusedConfidences
{
  return self->_fusedConfidences.list;
}

- (void)clearFusedConfidences
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;

  PBRepeatedDoubleClear();
}

- (void)addFusedConfidence:(double)a3
{
  if (self) {
    PBRepeatedDoubleAdd();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (double)fusedConfidenceAtIndex:(unint64_t)a3
{
  -[GEOVLFLocalizationAlgorithmDetails _readFusedConfidences]((uint64_t)self);
  p_fusedConfidences = &self->_fusedConfidences;
  unint64_t count = self->_fusedConfidences.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_fusedConfidences->list[a3];
}

- (void)setFusedConfidences:(double *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;

  MEMORY[0x1F4147320](&self->_fusedConfidences, a3, a4);
}

- (unsigned)tKptsMs
{
  return self->_tKptsMs;
}

- (void)setTKptsMs:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  self->_tKptsMs = a3;
}

- (void)setHasTKptsMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 264;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasTKptsMs
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unsigned)tMatchMs
{
  return self->_tMatchMs;
}

- (void)setTMatchMs:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  self->_tMatchMs = a3;
}

- (void)setHasTMatchMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 272;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasTMatchMs
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unsigned)tPoseMs
{
  return self->_tPoseMs;
}

- (void)setTPoseMs:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  self->_tPoseMs = a3;
}

- (void)setHasTPoseMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 288;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasTPoseMs
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLFLocalizationAlgorithmDetails;
  v4 = [(GEOVLFLocalizationAlgorithmDetails *)&v8 description];
  v5 = [(GEOVLFLocalizationAlgorithmDetails *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFLocalizationAlgorithmDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_43;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 100);
  if ((v5 & 2) != 0)
  {
    objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 80)];
    if (a2) {
      objc_super v7 = @"numberOfKeypoints";
    }
    else {
      objc_super v7 = @"number_of_keypoints";
    }
    [v4 setObject:v6 forKey:v7];

    __int16 v5 = *(_WORD *)(a1 + 100);
  }
  if ((v5 & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
    if (a2) {
      v9 = @"numberOfMatches";
    }
    else {
      v9 = @"number_of_matches";
    }
    [v4 setObject:v8 forKey:v9];

    __int16 v5 = *(_WORD *)(a1 + 100);
  }
  if (v5)
  {
    v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
    if (a2) {
      v11 = @"numberOfInliers";
    }
    else {
      v11 = @"number_of_inliers";
    }
    [v4 setObject:v10 forKey:v11];
  }
  if (*(void *)(a1 + 48))
  {
    v12 = PBRepeatedDoubleNSArray();
    if (a2) {
      v13 = @"solverConfidence";
    }
    else {
      v13 = @"solver_confidence";
    }
    [v4 setObject:v12 forKey:v13];
  }
  if (*(void *)(a1 + 24))
  {
    v14 = PBRepeatedDoubleNSArray();
    if (a2) {
      v15 = @"fusedConfidence";
    }
    else {
      v15 = @"fused_confidence";
    }
    [v4 setObject:v14 forKey:v15];
  }
  __int16 v16 = *(_WORD *)(a1 + 100);
  if ((v16 & 8) == 0)
  {
    if ((v16 & 0x10) == 0) {
      goto LABEL_29;
    }
LABEL_35:
    v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
    if (a2) {
      v20 = @"tMatchMs";
    }
    else {
      v20 = @"t_match_ms";
    }
    [v4 setObject:v19 forKey:v20];

    if ((*(_WORD *)(a1 + 100) & 0x20) == 0) {
      goto LABEL_43;
    }
    goto LABEL_39;
  }
  v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 88)];
  if (a2) {
    v18 = @"tKptsMs";
  }
  else {
    v18 = @"t_kpts_ms";
  }
  [v4 setObject:v17 forKey:v18];

  __int16 v16 = *(_WORD *)(a1 + 100);
  if ((v16 & 0x10) != 0) {
    goto LABEL_35;
  }
LABEL_29:
  if ((v16 & 0x20) != 0)
  {
LABEL_39:
    v21 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 96)];
    if (a2) {
      v22 = @"tPoseMs";
    }
    else {
      v22 = @"t_pose_ms";
    }
    [v4 setObject:v21 forKey:v22];
  }
LABEL_43:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFLocalizationAlgorithmDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFLocalizationAlgorithmDetails)initWithDictionary:(id)a3
{
  return (GEOVLFLocalizationAlgorithmDetails *)-[GEOVLFLocalizationAlgorithmDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"numberOfKeypoints";
      }
      else {
        objc_super v6 = @"number_of_keypoints";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNumberOfKeypoints:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"numberOfMatches";
      }
      else {
        objc_super v8 = @"number_of_matches";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNumberOfMatches:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        v10 = @"numberOfInliers";
      }
      else {
        v10 = @"number_of_inliers";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNumberOfInliers:", objc_msgSend(v11, "unsignedIntValue"));
      }

      if (a3) {
        v12 = @"solverConfidence";
      }
      else {
        v12 = @"solver_confidence";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v40;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v40 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v39 + 1) + 8 * v18);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v19 doubleValue];
                objc_msgSend(a1, "addSolverConfidence:");
              }
              ++v18;
            }
            while (v16 != v18);
            uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
          }
          while (v16);
        }
      }
      if (a3) {
        v20 = @"fusedConfidence";
      }
      else {
        v20 = @"fused_confidence";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v36;
          do
          {
            uint64_t v26 = 0;
            do
            {
              if (*(void *)v36 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = *(void **)(*((void *)&v35 + 1) + 8 * v26);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_msgSend(v27, "doubleValue", (void)v35);
                objc_msgSend(a1, "addFusedConfidence:");
              }
              ++v26;
            }
            while (v24 != v26);
            uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }
          while (v24);
        }
      }
      if (a3) {
        v28 = @"tKptsMs";
      }
      else {
        v28 = @"t_kpts_ms";
      }
      v29 = objc_msgSend(v5, "objectForKeyedSubscript:", v28, (void)v35);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTKptsMs:", objc_msgSend(v29, "unsignedIntValue"));
      }

      if (a3) {
        v30 = @"tMatchMs";
      }
      else {
        v30 = @"t_match_ms";
      }
      v31 = [v5 objectForKeyedSubscript:v30];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTMatchMs:", objc_msgSend(v31, "unsignedIntValue"));
      }

      if (a3) {
        v32 = @"tPoseMs";
      }
      else {
        v32 = @"t_pose_ms";
      }
      v33 = [v5 objectForKeyedSubscript:v32];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTPoseMs:", objc_msgSend(v33, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOVLFLocalizationAlgorithmDetails)initWithJSON:(id)a3
{
  return (GEOVLFLocalizationAlgorithmDetails *)-[GEOVLFLocalizationAlgorithmDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_11881;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_11882;
    }
    GEOVLFLocalizationAlgorithmDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFLocalizationAlgorithmDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFLocalizationAlgorithmDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x1C0) == 0)
    {
      v10 = self->_reader;
      objc_sync_enter(v10);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v12 writeData:v11];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v10);
      goto LABEL_23;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOVLFLocalizationAlgorithmDetails *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 flags = (__int16)self->_flags;
  }
  objc_super v6 = v12;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    objc_super v6 = v12;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    objc_super v6 = v12;
  }
  if (self->_solverConfidences.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      objc_super v6 = v12;
      ++v7;
    }
    while (v7 < self->_solverConfidences.count);
  }
  if (self->_fusedConfidences.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      objc_super v6 = v12;
      ++v8;
    }
    while (v8 < self->_fusedConfidences.count);
  }
  __int16 v9 = (__int16)self->_flags;
  if ((v9 & 8) == 0)
  {
    if ((v9 & 0x10) == 0) {
      goto LABEL_17;
    }
LABEL_20:
    PBDataWriterWriteUint32Field();
    objc_super v6 = v12;
    if ((*(_WORD *)&self->_flags & 0x20) == 0) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  PBDataWriterWriteUint32Field();
  objc_super v6 = v12;
  __int16 v9 = (__int16)self->_flags;
  if ((v9 & 0x10) != 0) {
    goto LABEL_20;
  }
LABEL_17:
  if ((v9 & 0x20) != 0)
  {
LABEL_21:
    PBDataWriterWriteUint32Field();
LABEL_23:
    objc_super v6 = v12;
  }
LABEL_24:
}

- (void)copyTo:(id)a3
{
  id v12 = (id *)a3;
  [(GEOVLFLocalizationAlgorithmDetails *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 16) = self->_readerMarkPos;
  *((_DWORD *)v12 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 4) == 0) {
      goto LABEL_3;
    }
LABEL_21:
    *((_DWORD *)v12 + 21) = self->_numberOfMatches;
    *((_WORD *)v12 + 50) |= 4u;
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)v12 + 20) = self->_numberOfKeypoints;
  *((_WORD *)v12 + 50) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_21;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    *((_DWORD *)v12 + 19) = self->_numberOfInliers;
    *((_WORD *)v12 + 50) |= 1u;
  }
LABEL_5:
  if ([(GEOVLFLocalizationAlgorithmDetails *)self solverConfidencesCount])
  {
    [v12 clearSolverConfidences];
    unint64_t v5 = [(GEOVLFLocalizationAlgorithmDetails *)self solverConfidencesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        [(GEOVLFLocalizationAlgorithmDetails *)self solverConfidenceAtIndex:i];
        objc_msgSend(v12, "addSolverConfidence:");
      }
    }
  }
  if ([(GEOVLFLocalizationAlgorithmDetails *)self fusedConfidencesCount])
  {
    [v12 clearFusedConfidences];
    unint64_t v8 = [(GEOVLFLocalizationAlgorithmDetails *)self fusedConfidencesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        [(GEOVLFLocalizationAlgorithmDetails *)self fusedConfidenceAtIndex:j];
        objc_msgSend(v12, "addFusedConfidence:");
      }
    }
  }
  __int16 v11 = (__int16)self->_flags;
  if ((v11 & 8) != 0)
  {
    *((_DWORD *)v12 + 22) = self->_tKptsMs;
    *((_WORD *)v12 + 50) |= 8u;
    __int16 v11 = (__int16)self->_flags;
    if ((v11 & 0x10) == 0)
    {
LABEL_15:
      if ((v11 & 0x20) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((v11 & 0x10) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v12 + 23) = self->_tMatchMs;
  *((_WORD *)v12 + 50) |= 0x10u;
  if ((*(_WORD *)&self->_flags & 0x20) != 0)
  {
LABEL_16:
    *((_DWORD *)v12 + 24) = self->_tPoseMs;
    *((_WORD *)v12 + 50) |= 0x20u;
  }
LABEL_17:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOVLFLocalizationAlgorithmDetails *)self readAll:0];
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v4 + 80) = self->_numberOfKeypoints;
      *(_WORD *)(v4 + 100) |= 2u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_7:
        if ((flags & 1) == 0) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
    else if ((flags & 4) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v4 + 84) = self->_numberOfMatches;
    *(_WORD *)(v4 + 100) |= 4u;
    if ((*(_WORD *)&self->_flags & 1) == 0)
    {
LABEL_9:
      PBRepeatedDoubleCopy();
      PBRepeatedDoubleCopy();
      __int16 v9 = (__int16)self->_flags;
      if ((v9 & 8) != 0)
      {
        *(_DWORD *)(v4 + 88) = self->_tKptsMs;
        *(_WORD *)(v4 + 100) |= 8u;
        __int16 v9 = (__int16)self->_flags;
        if ((v9 & 0x10) == 0)
        {
LABEL_11:
          if ((v9 & 0x20) == 0) {
            return (id)v4;
          }
LABEL_12:
          *(_DWORD *)(v4 + 96) = self->_tPoseMs;
          *(_WORD *)(v4 + 100) |= 0x20u;
          return (id)v4;
        }
      }
      else if ((v9 & 0x10) == 0)
      {
        goto LABEL_11;
      }
      *(_DWORD *)(v4 + 92) = self->_tMatchMs;
      *(_WORD *)(v4 + 100) |= 0x10u;
      if ((*(_WORD *)&self->_flags & 0x20) == 0) {
        return (id)v4;
      }
      goto LABEL_12;
    }
LABEL_8:
    *(_DWORD *)(v4 + 76) = self->_numberOfInliers;
    *(_WORD *)(v4 + 100) |= 1u;
    goto LABEL_9;
  }
  unint64_t v6 = reader;
  objc_sync_enter(v6);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v6);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOVLFLocalizationAlgorithmDetailsReadAllFrom(v4, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v7 = (id)v4;
  objc_sync_exit(v6);

  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  [(GEOVLFLocalizationAlgorithmDetails *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 50);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_numberOfKeypoints != *((_DWORD *)v4 + 20)) {
      goto LABEL_33;
    }
  }
  else if ((v6 & 2) != 0)
  {
LABEL_33:
    BOOL v9 = 0;
    goto LABEL_34;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_numberOfMatches != *((_DWORD *)v4 + 21)) {
      goto LABEL_33;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_33;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_numberOfInliers != *((_DWORD *)v4 + 19)) {
      goto LABEL_33;
    }
  }
  else if (v6)
  {
    goto LABEL_33;
  }
  if (!PBRepeatedDoubleIsEqual() || !PBRepeatedDoubleIsEqual()) {
    goto LABEL_33;
  }
  __int16 v7 = (__int16)self->_flags;
  __int16 v8 = *((_WORD *)v4 + 50);
  if ((v7 & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_tKptsMs != *((_DWORD *)v4 + 22)) {
      goto LABEL_33;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_33;
  }
  if ((v7 & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_tMatchMs != *((_DWORD *)v4 + 23)) {
      goto LABEL_33;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_33;
  }
  BOOL v9 = (v8 & 0x20) == 0;
  if ((v7 & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_tPoseMs != *((_DWORD *)v4 + 24)) {
      goto LABEL_33;
    }
    BOOL v9 = 1;
  }
LABEL_34:

  return v9;
}

- (unint64_t)hash
{
  [(GEOVLFLocalizationAlgorithmDetails *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    uint64_t v4 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if (flags) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v4 = 2654435761 * self->_numberOfKeypoints;
  if ((flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_numberOfMatches;
  if (flags)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_numberOfInliers;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v6 = 0;
LABEL_8:
  uint64_t v7 = PBRepeatedDoubleHash();
  uint64_t v8 = PBRepeatedDoubleHash();
  __int16 v9 = (__int16)self->_flags;
  if ((v9 & 8) == 0)
  {
    uint64_t v10 = 0;
    if ((v9 & 0x10) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v11 = 0;
    if ((v9 & 0x20) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v12 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v10 = 2654435761 * self->_tKptsMs;
  if ((v9 & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_tMatchMs;
  if ((v9 & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_tPoseMs;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v12 = (unsigned int *)a3;
  [v12 readAll:0];
  __int16 v4 = *((_WORD *)v12 + 50);
  if ((v4 & 2) != 0)
  {
    self->_numberOfKeypoints = v12[20];
    *(_WORD *)&self->_flags |= 2u;
    __int16 v4 = *((_WORD *)v12 + 50);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_numberOfMatches = v12[21];
  *(_WORD *)&self->_flags |= 4u;
  if (v12[25])
  {
LABEL_4:
    self->_numberOfInliers = v12[19];
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_5:
  uint64_t v5 = [v12 solverConfidencesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      [v12 solverConfidenceAtIndex:i];
      -[GEOVLFLocalizationAlgorithmDetails addSolverConfidence:](self, "addSolverConfidence:");
    }
  }
  uint64_t v8 = [v12 fusedConfidencesCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
    {
      [v12 fusedConfidenceAtIndex:j];
      -[GEOVLFLocalizationAlgorithmDetails addFusedConfidence:](self, "addFusedConfidence:");
    }
  }
  __int16 v11 = *((_WORD *)v12 + 50);
  if ((v11 & 8) != 0)
  {
    self->_tKptsMs = v12[22];
    *(_WORD *)&self->_flags |= 8u;
    __int16 v11 = *((_WORD *)v12 + 50);
    if ((v11 & 0x10) == 0)
    {
LABEL_13:
      if ((v11 & 0x20) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((v11 & 0x10) == 0)
  {
    goto LABEL_13;
  }
  self->_tMatchMs = v12[23];
  *(_WORD *)&self->_flags |= 0x10u;
  if ((v12[25] & 0x20) != 0)
  {
LABEL_14:
    self->_tPoseMs = v12[24];
    *(_WORD *)&self->_flags |= 0x20u;
  }
LABEL_15:
}

- (void).cxx_destruct
{
}

@end