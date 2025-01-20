@interface ASCodableActivityDataPreview
+ (Class)achievementsType;
+ (Class)workoutsType;
- (ASCodableCloudKitActivitySnapshot)activitySnapshot;
- (BOOL)hasActivitySnapshot;
- (BOOL)hasDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)achievements;
- (NSMutableArray)workouts;
- (double)date;
- (id)achievementsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)workoutsAtIndex:(unint64_t)a3;
- (unint64_t)achievementsCount;
- (unint64_t)hash;
- (unint64_t)workoutsCount;
- (void)addAchievements:(id)a3;
- (void)addWorkouts:(id)a3;
- (void)clearAchievements;
- (void)clearWorkouts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAchievements:(id)a3;
- (void)setActivitySnapshot:(id)a3;
- (void)setDate:(double)a3;
- (void)setHasDate:(BOOL)a3;
- (void)setWorkouts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableActivityDataPreview

- (BOOL)hasActivitySnapshot
{
  return self->_activitySnapshot != 0;
}

- (void)clearWorkouts
{
}

- (void)addWorkouts:(id)a3
{
  id v4 = a3;
  workouts = self->_workouts;
  id v8 = v4;
  if (!workouts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_workouts;
    self->_workouts = v6;

    id v4 = v8;
    workouts = self->_workouts;
  }
  [(NSMutableArray *)workouts addObject:v4];
}

- (unint64_t)workoutsCount
{
  return [(NSMutableArray *)self->_workouts count];
}

- (id)workoutsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_workouts objectAtIndex:a3];
}

+ (Class)workoutsType
{
  return (Class)objc_opt_class();
}

- (void)clearAchievements
{
}

- (void)addAchievements:(id)a3
{
  id v4 = a3;
  achievements = self->_achievements;
  id v8 = v4;
  if (!achievements)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_achievements;
    self->_achievements = v6;

    id v4 = v8;
    achievements = self->_achievements;
  }
  [(NSMutableArray *)achievements addObject:v4];
}

- (unint64_t)achievementsCount
{
  return [(NSMutableArray *)self->_achievements count];
}

- (id)achievementsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_achievements objectAtIndex:a3];
}

+ (Class)achievementsType
{
  return (Class)objc_opt_class();
}

- (void)setDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableActivityDataPreview;
  id v4 = [(ASCodableActivityDataPreview *)&v8 description];
  v5 = [(ASCodableActivityDataPreview *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  activitySnapshot = self->_activitySnapshot;
  if (activitySnapshot)
  {
    v5 = [(ASCodableCloudKitActivitySnapshot *)activitySnapshot dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"activitySnapshot"];
  }
  if ([(NSMutableArray *)self->_workouts count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_workouts, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v7 = self->_workouts;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v26 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"workouts"];
  }
  if ([(NSMutableArray *)self->_achievements count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_achievements, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v14 = self->_achievements;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "dictionaryRepresentation", (void)v22);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"achievements"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v20 = [NSNumber numberWithDouble:self->_date];
    [v3 setObject:v20 forKey:@"date"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableActivityDataPreviewReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_activitySnapshot) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_workouts;
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
  uint64_t v10 = self->_achievements;
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_activitySnapshot) {
    objc_msgSend(v12, "setActivitySnapshot:");
  }
  if ([(ASCodableActivityDataPreview *)self workoutsCount])
  {
    [v12 clearWorkouts];
    unint64_t v4 = [(ASCodableActivityDataPreview *)self workoutsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ASCodableActivityDataPreview *)self workoutsAtIndex:i];
        [v12 addWorkouts:v7];
      }
    }
  }
  if ([(ASCodableActivityDataPreview *)self achievementsCount])
  {
    [v12 clearAchievements];
    unint64_t v8 = [(ASCodableActivityDataPreview *)self achievementsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(ASCodableActivityDataPreview *)self achievementsAtIndex:j];
        [v12 addAchievements:v11];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v12 + 1) = *(void *)&self->_date;
    *((unsigned char *)v12 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ASCodableCloudKitActivitySnapshot *)self->_activitySnapshot copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v8 = self->_workouts;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v12) copyWithZone:a3];
        [(id)v5 addWorkouts:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = self->_achievements;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [(id)v5 addAchievements:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_date;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  activitySnapshot = self->_activitySnapshot;
  if ((unint64_t)activitySnapshot | *((void *)v4 + 3))
  {
    if (!-[ASCodableCloudKitActivitySnapshot isEqual:](activitySnapshot, "isEqual:")) {
      goto LABEL_12;
    }
  }
  workouts = self->_workouts;
  if ((unint64_t)workouts | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](workouts, "isEqual:")) {
      goto LABEL_12;
    }
  }
  achievements = self->_achievements;
  if ((unint64_t)achievements | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](achievements, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_date == *((double *)v4 + 1))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ASCodableCloudKitActivitySnapshot *)self->_activitySnapshot hash];
  uint64_t v4 = [(NSMutableArray *)self->_workouts hash];
  uint64_t v5 = [(NSMutableArray *)self->_achievements hash];
  if (*(unsigned char *)&self->_has)
  {
    double date = self->_date;
    double v8 = -date;
    if (date >= 0.0) {
      double v8 = self->_date;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  activitySnapshot = self->_activitySnapshot;
  uint64_t v6 = *((void *)v4 + 3);
  if (activitySnapshot)
  {
    if (v6) {
      -[ASCodableCloudKitActivitySnapshot mergeFrom:](activitySnapshot, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ASCodableActivityDataPreview setActivitySnapshot:](self, "setActivitySnapshot:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v4 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(ASCodableActivityDataPreview *)self addWorkouts:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 2);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[ASCodableActivityDataPreview addAchievements:](self, "addAchievements:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  if (*((unsigned char *)v4 + 40))
  {
    self->_double date = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (ASCodableCloudKitActivitySnapshot)activitySnapshot
{
  return self->_activitySnapshot;
}

- (void)setActivitySnapshot:(id)a3
{
}

- (NSMutableArray)workouts
{
  return self->_workouts;
}

- (void)setWorkouts:(id)a3
{
}

- (NSMutableArray)achievements
{
  return self->_achievements;
}

- (void)setAchievements:(id)a3
{
}

- (double)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workouts, 0);
  objc_storeStrong((id *)&self->_activitySnapshot, 0);

  objc_storeStrong((id *)&self->_achievements, 0);
}

@end