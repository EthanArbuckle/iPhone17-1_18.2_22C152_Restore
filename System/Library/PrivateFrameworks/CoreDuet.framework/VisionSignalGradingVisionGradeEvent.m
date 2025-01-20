@interface VisionSignalGradingVisionGradeEvent
+ (Class)popularityEntriesType;
+ (Class)visionGradesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)popularityEntries;
- (NSMutableArray)visionGrades;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)popularityEntriesAtIndex:(unint64_t)a3;
- (id)visionGradesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)popularityEntriesCount;
- (unint64_t)visionGradesCount;
- (void)addPopularityEntries:(id)a3;
- (void)addVisionGrades:(id)a3;
- (void)clearPopularityEntries;
- (void)clearVisionGrades;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPopularityEntries:(id)a3;
- (void)setVisionGrades:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VisionSignalGradingVisionGradeEvent

- (void)clearVisionGrades
{
}

- (void)addVisionGrades:(id)a3
{
  id v4 = a3;
  visionGrades = self->_visionGrades;
  id v8 = v4;
  if (!visionGrades)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_visionGrades;
    self->_visionGrades = v6;

    id v4 = v8;
    visionGrades = self->_visionGrades;
  }
  [(NSMutableArray *)visionGrades addObject:v4];
}

- (unint64_t)visionGradesCount
{
  return [(NSMutableArray *)self->_visionGrades count];
}

- (id)visionGradesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_visionGrades objectAtIndex:a3];
}

+ (Class)visionGradesType
{
  return (Class)objc_opt_class();
}

- (void)clearPopularityEntries
{
}

- (void)addPopularityEntries:(id)a3
{
  id v4 = a3;
  popularityEntries = self->_popularityEntries;
  id v8 = v4;
  if (!popularityEntries)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_popularityEntries;
    self->_popularityEntries = v6;

    id v4 = v8;
    popularityEntries = self->_popularityEntries;
  }
  [(NSMutableArray *)popularityEntries addObject:v4];
}

- (unint64_t)popularityEntriesCount
{
  return [(NSMutableArray *)self->_popularityEntries count];
}

- (id)popularityEntriesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_popularityEntries objectAtIndex:a3];
}

+ (Class)popularityEntriesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VisionSignalGradingVisionGradeEvent;
  id v4 = [(VisionSignalGradingVisionGradeEvent *)&v8 description];
  v5 = [(VisionSignalGradingVisionGradeEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_visionGrades count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_visionGrades, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v5 = self->_visionGrades;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"visionGrades"];
  }
  if ([(NSMutableArray *)self->_popularityEntries count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_popularityEntries, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = self->_popularityEntries;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "dictionaryRepresentation", (void)v19);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"popularityEntries"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VisionSignalGradingVisionGradeEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_visionGrades;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_popularityEntries;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(VisionSignalGradingVisionGradeEvent *)self visionGradesCount])
  {
    [v12 clearVisionGrades];
    unint64_t v4 = [(VisionSignalGradingVisionGradeEvent *)self visionGradesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(VisionSignalGradingVisionGradeEvent *)self visionGradesAtIndex:i];
        [v12 addVisionGrades:v7];
      }
    }
  }
  if ([(VisionSignalGradingVisionGradeEvent *)self popularityEntriesCount])
  {
    [v12 clearPopularityEntries];
    unint64_t v8 = [(VisionSignalGradingVisionGradeEvent *)self popularityEntriesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(VisionSignalGradingVisionGradeEvent *)self popularityEntriesAtIndex:j];
        [v12 addPopularityEntries:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_visionGrades;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addVisionGrades:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = self->_popularityEntries;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [v5 addPopularityEntries:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((visionGrades = self->_visionGrades, !((unint64_t)visionGrades | v4[2]))
     || -[NSMutableArray isEqual:](visionGrades, "isEqual:")))
  {
    popularityEntries = self->_popularityEntries;
    if ((unint64_t)popularityEntries | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](popularityEntries, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_visionGrades hash];
  return [(NSMutableArray *)self->_popularityEntries hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(VisionSignalGradingVisionGradeEvent *)self addVisionGrades:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[1];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[VisionSignalGradingVisionGradeEvent addPopularityEntries:](self, "addPopularityEntries:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)visionGrades
{
  return self->_visionGrades;
}

- (void)setVisionGrades:(id)a3
{
}

- (NSMutableArray)popularityEntries
{
  return self->_popularityEntries;
}

- (void)setPopularityEntries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionGrades, 0);
  objc_storeStrong((id *)&self->_popularityEntries, 0);
}

@end