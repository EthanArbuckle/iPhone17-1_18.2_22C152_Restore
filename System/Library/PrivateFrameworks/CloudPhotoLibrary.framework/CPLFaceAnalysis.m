@interface CPLFaceAnalysis
+ (Class)faceInstancesType;
+ (Class)petFaceInstancesType;
+ (Class)torsoFaceInstancesType;
- (BOOL)completed;
- (BOOL)hasCompleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)faceInstances;
- (NSMutableArray)petFaceInstances;
- (NSMutableArray)torsoFaceInstances;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)faceInstancesAtIndex:(unint64_t)a3;
- (id)petFaceInstancesAtIndex:(unint64_t)a3;
- (id)torsoFaceInstancesAtIndex:(unint64_t)a3;
- (unint64_t)faceInstancesCount;
- (unint64_t)hash;
- (unint64_t)petFaceInstancesCount;
- (unint64_t)torsoFaceInstancesCount;
- (void)addFaceInstances:(id)a3;
- (void)addPetFaceInstances:(id)a3;
- (void)addTorsoFaceInstances:(id)a3;
- (void)clearFaceInstances;
- (void)clearPetFaceInstances;
- (void)clearTorsoFaceInstances;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setFaceInstances:(id)a3;
- (void)setHasCompleted:(BOOL)a3;
- (void)setPetFaceInstances:(id)a3;
- (void)setTorsoFaceInstances:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLFaceAnalysis

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torsoFaceInstances, 0);
  objc_storeStrong((id *)&self->_petFaceInstances, 0);
  objc_storeStrong((id *)&self->_faceInstances, 0);
}

- (void)setTorsoFaceInstances:(id)a3
{
}

- (NSMutableArray)torsoFaceInstances
{
  return self->_torsoFaceInstances;
}

- (void)setPetFaceInstances:(id)a3
{
}

- (NSMutableArray)petFaceInstances
{
  return self->_petFaceInstances;
}

- (void)setFaceInstances:(id)a3
{
}

- (NSMutableArray)faceInstances
{
  return self->_faceInstances;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (id *)v4;
  if (*((unsigned char *)v4 + 36))
  {
    self->_completed = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = *((id *)v4 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        [(CPLFaceAnalysis *)self addFaceInstances:*(void *)(*((void *)&v29 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v5[2];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        [(CPLFaceAnalysis *)self addPetFaceInstances:*(void *)(*((void *)&v25 + 1) + 8 * v15++)];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = v5[3];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[CPLFaceAnalysis addTorsoFaceInstances:](self, "addTorsoFaceInstances:", *(void *)(*((void *)&v21 + 1) + 8 * v20++), (void)v21);
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_completed;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_faceInstances hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_petFaceInstances hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_torsoFaceInstances hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 36))
    {
      if (self->_completed)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_16;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_10;
      }
    }
LABEL_16:
    char v8 = 0;
    goto LABEL_17;
  }
  if (*((unsigned char *)v4 + 36)) {
    goto LABEL_16;
  }
LABEL_10:
  faceInstances = self->_faceInstances;
  if ((unint64_t)faceInstances | *((void *)v4 + 1)
    && !-[NSMutableArray isEqual:](faceInstances, "isEqual:"))
  {
    goto LABEL_16;
  }
  petFaceInstances = self->_petFaceInstances;
  if ((unint64_t)petFaceInstances | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](petFaceInstances, "isEqual:")) {
      goto LABEL_16;
    }
  }
  torsoFaceInstances = self->_torsoFaceInstances;
  if ((unint64_t)torsoFaceInstances | *((void *)v4 + 3)) {
    char v8 = -[NSMutableArray isEqual:](torsoFaceInstances, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_17:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 32) = self->_completed;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v7 = self->_faceInstances;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v35;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addFaceInstances:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v9);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v13 = self->_petFaceInstances;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * v17) copyWithZone:a3];
        [v6 addPetFaceInstances:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v15);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v19 = self->_torsoFaceInstances;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v23), "copyWithZone:", a3, (void)v26);
        [v6 addTorsoFaceInstances:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v21);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[32] = self->_completed;
    v4[36] |= 1u;
  }
  id v17 = v4;
  if ([(CPLFaceAnalysis *)self faceInstancesCount])
  {
    [v17 clearFaceInstances];
    unint64_t v5 = [(CPLFaceAnalysis *)self faceInstancesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(CPLFaceAnalysis *)self faceInstancesAtIndex:i];
        [v17 addFaceInstances:v8];
      }
    }
  }
  if ([(CPLFaceAnalysis *)self petFaceInstancesCount])
  {
    [v17 clearPetFaceInstances];
    unint64_t v9 = [(CPLFaceAnalysis *)self petFaceInstancesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(CPLFaceAnalysis *)self petFaceInstancesAtIndex:j];
        [v17 addPetFaceInstances:v12];
      }
    }
  }
  if ([(CPLFaceAnalysis *)self torsoFaceInstancesCount])
  {
    [v17 clearTorsoFaceInstances];
    unint64_t v13 = [(CPLFaceAnalysis *)self torsoFaceInstancesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(CPLFaceAnalysis *)self torsoFaceInstancesAtIndex:k];
        [v17 addTorsoFaceInstances:v16];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v5 = self->_faceInstances;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unint64_t v10 = self->_petFaceInstances;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_torsoFaceInstances;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (BOOL)readFrom:(id)a3
{
  return CPLFaceAnalysisReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithBool:self->_completed];
    [v3 setObject:v4 forKey:@"completed"];
  }
  if ([(NSMutableArray *)self->_faceInstances count])
  {
    unint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_faceInstances, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v6 = self->_faceInstances;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v35 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"faceInstances"];
  }
  if ([(NSMutableArray *)self->_petFaceInstances count])
  {
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_petFaceInstances, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v13 = self->_petFaceInstances;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = [*(id *)(*((void *)&v31 + 1) + 8 * j) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"petFaceInstances"];
  }
  if ([(NSMutableArray *)self->_torsoFaceInstances count])
  {
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_torsoFaceInstances, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v20 = self->_torsoFaceInstances;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v28;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * k), "dictionaryRepresentation", (void)v27);
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKey:@"torsoFaceInstances"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CPLFaceAnalysis;
  id v4 = [(CPLFaceAnalysis *)&v8 description];
  unint64_t v5 = [(CPLFaceAnalysis *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)torsoFaceInstancesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_torsoFaceInstances objectAtIndex:a3];
}

- (unint64_t)torsoFaceInstancesCount
{
  return [(NSMutableArray *)self->_torsoFaceInstances count];
}

- (void)addTorsoFaceInstances:(id)a3
{
  id v4 = a3;
  torsoFaceInstances = self->_torsoFaceInstances;
  id v8 = v4;
  if (!torsoFaceInstances)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_torsoFaceInstances;
    self->_torsoFaceInstances = v6;

    id v4 = v8;
    torsoFaceInstances = self->_torsoFaceInstances;
  }
  [(NSMutableArray *)torsoFaceInstances addObject:v4];
}

- (void)clearTorsoFaceInstances
{
}

- (id)petFaceInstancesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_petFaceInstances objectAtIndex:a3];
}

- (unint64_t)petFaceInstancesCount
{
  return [(NSMutableArray *)self->_petFaceInstances count];
}

- (void)addPetFaceInstances:(id)a3
{
  id v4 = a3;
  petFaceInstances = self->_petFaceInstances;
  id v8 = v4;
  if (!petFaceInstances)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_petFaceInstances;
    self->_petFaceInstances = v6;

    id v4 = v8;
    petFaceInstances = self->_petFaceInstances;
  }
  [(NSMutableArray *)petFaceInstances addObject:v4];
}

- (void)clearPetFaceInstances
{
}

- (id)faceInstancesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_faceInstances objectAtIndex:a3];
}

- (unint64_t)faceInstancesCount
{
  return [(NSMutableArray *)self->_faceInstances count];
}

- (void)addFaceInstances:(id)a3
{
  id v4 = a3;
  faceInstances = self->_faceInstances;
  id v8 = v4;
  if (!faceInstances)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_faceInstances;
    self->_faceInstances = v6;

    id v4 = v8;
    faceInstances = self->_faceInstances;
  }
  [(NSMutableArray *)faceInstances addObject:v4];
}

- (void)clearFaceInstances
{
}

- (BOOL)hasCompleted
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCompleted:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCompleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_completed = a3;
}

+ (Class)torsoFaceInstancesType
{
  return (Class)objc_opt_class();
}

+ (Class)petFaceInstancesType
{
  return (Class)objc_opt_class();
}

+ (Class)faceInstancesType
{
  return (Class)objc_opt_class();
}

@end