@interface ASCodableFriend
+ (Class)achievementsType;
+ (Class)competitionsType;
+ (Class)snapshotsType;
+ (Class)workoutsType;
- (ASCodableContact)contact;
- (BOOL)hasContact;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)achievements;
- (NSMutableArray)competitions;
- (NSMutableArray)snapshots;
- (NSMutableArray)workouts;
- (id)achievementsAtIndex:(unint64_t)a3;
- (id)competitionsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)snapshotsAtIndex:(unint64_t)a3;
- (id)workoutsAtIndex:(unint64_t)a3;
- (unint64_t)achievementsCount;
- (unint64_t)competitionsCount;
- (unint64_t)hash;
- (unint64_t)snapshotsCount;
- (unint64_t)workoutsCount;
- (void)addAchievements:(id)a3;
- (void)addCompetitions:(id)a3;
- (void)addSnapshots:(id)a3;
- (void)addWorkouts:(id)a3;
- (void)clearAchievements;
- (void)clearCompetitions;
- (void)clearSnapshots;
- (void)clearWorkouts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAchievements:(id)a3;
- (void)setCompetitions:(id)a3;
- (void)setContact:(id)a3;
- (void)setSnapshots:(id)a3;
- (void)setWorkouts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableFriend

- (BOOL)hasContact
{
  return self->_contact != 0;
}

- (void)clearSnapshots
{
}

- (void)addSnapshots:(id)a3
{
  id v4 = a3;
  snapshots = self->_snapshots;
  id v8 = v4;
  if (!snapshots)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_snapshots;
    self->_snapshots = v6;

    id v4 = v8;
    snapshots = self->_snapshots;
  }
  [(NSMutableArray *)snapshots addObject:v4];
}

- (unint64_t)snapshotsCount
{
  return [(NSMutableArray *)self->_snapshots count];
}

- (id)snapshotsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_snapshots objectAtIndex:a3];
}

+ (Class)snapshotsType
{
  return (Class)objc_opt_class();
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

- (void)clearCompetitions
{
}

- (void)addCompetitions:(id)a3
{
  id v4 = a3;
  competitions = self->_competitions;
  id v8 = v4;
  if (!competitions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_competitions;
    self->_competitions = v6;

    id v4 = v8;
    competitions = self->_competitions;
  }
  [(NSMutableArray *)competitions addObject:v4];
}

- (unint64_t)competitionsCount
{
  return [(NSMutableArray *)self->_competitions count];
}

- (id)competitionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_competitions objectAtIndex:a3];
}

+ (Class)competitionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableFriend;
  id v4 = [(ASCodableFriend *)&v8 description];
  v5 = [(ASCodableFriend *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  contact = self->_contact;
  if (contact)
  {
    v5 = [(ASCodableContact *)contact dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"contact"];
  }
  if ([(NSMutableArray *)self->_snapshots count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_snapshots, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v7 = self->_snapshots;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v48 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v47 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v47 objects:v54 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"snapshots"];
  }
  if ([(NSMutableArray *)self->_workouts count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_workouts, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v14 = self->_workouts;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v43 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"workouts"];
  }
  if ([(NSMutableArray *)self->_achievements count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_achievements, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v21 = self->_achievements;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v39 objects:v52 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v39 + 1) + 8 * k) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v39 objects:v52 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKey:@"achievements"];
  }
  if ([(NSMutableArray *)self->_competitions count])
  {
    v27 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_competitions, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v28 = self->_competitions;
    uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v51 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v36;
      do
      {
        for (uint64_t m = 0; m != v30; ++m)
        {
          if (*(void *)v36 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * m), "dictionaryRepresentation", (void)v35);
          [v27 addObject:v33];
        }
        uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v51 count:16];
      }
      while (v30);
    }

    [v3 setObject:v27 forKey:@"competitions"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableFriendReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_contact) {
    PBDataWriterWriteSubmessage();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = self->_snapshots;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = self->_workouts;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v15 = self->_achievements;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self->_competitions;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (void)copyTo:(id)a3
{
  id v20 = a3;
  if (self->_contact) {
    objc_msgSend(v20, "setContact:");
  }
  if ([(ASCodableFriend *)self snapshotsCount])
  {
    [v20 clearSnapshots];
    unint64_t v4 = [(ASCodableFriend *)self snapshotsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ASCodableFriend *)self snapshotsAtIndex:i];
        [v20 addSnapshots:v7];
      }
    }
  }
  if ([(ASCodableFriend *)self workoutsCount])
  {
    [v20 clearWorkouts];
    unint64_t v8 = [(ASCodableFriend *)self workoutsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(ASCodableFriend *)self workoutsAtIndex:j];
        [v20 addWorkouts:v11];
      }
    }
  }
  if ([(ASCodableFriend *)self achievementsCount])
  {
    [v20 clearAchievements];
    unint64_t v12 = [(ASCodableFriend *)self achievementsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(ASCodableFriend *)self achievementsAtIndex:k];
        [v20 addAchievements:v15];
      }
    }
  }
  if ([(ASCodableFriend *)self competitionsCount])
  {
    [v20 clearCompetitions];
    unint64_t v16 = [(ASCodableFriend *)self competitionsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(ASCodableFriend *)self competitionsAtIndex:m];
        [v20 addCompetitions:v19];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ASCodableContact *)self->_contact copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  unint64_t v8 = self->_snapshots;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v46;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addSnapshots:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v10);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v14 = self->_workouts;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v42;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * v18) copyWithZone:a3];
        [v5 addWorkouts:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v16);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v20 = self->_achievements;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * v24) copyWithZone:a3];
        [v5 addAchievements:v25];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v22);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v26 = self->_competitions;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v34;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v30), "copyWithZone:", a3, (void)v33);
        [v5 addCompetitions:v31];

        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v28);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((contact = self->_contact, !((unint64_t)contact | v4[3]))
     || -[ASCodableContact isEqual:](contact, "isEqual:"))
    && ((snapshots = self->_snapshots, !((unint64_t)snapshots | v4[4]))
     || -[NSMutableArray isEqual:](snapshots, "isEqual:"))
    && ((workouts = self->_workouts, !((unint64_t)workouts | v4[5]))
     || -[NSMutableArray isEqual:](workouts, "isEqual:"))
    && ((achievements = self->_achievements, !((unint64_t)achievements | v4[1]))
     || -[NSMutableArray isEqual:](achievements, "isEqual:")))
  {
    competitions = self->_competitions;
    if ((unint64_t)competitions | v4[2]) {
      char v10 = -[NSMutableArray isEqual:](competitions, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ASCodableContact *)self->_contact hash];
  uint64_t v4 = [(NSMutableArray *)self->_snapshots hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_workouts hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_achievements hash];
  return v6 ^ [(NSMutableArray *)self->_competitions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  contact = self->_contact;
  uint64_t v6 = *((void *)v4 + 3);
  if (contact)
  {
    if (v6) {
      -[ASCodableContact mergeFrom:](contact, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ASCodableFriend setContact:](self, "setContact:");
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = *((id *)v4 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        [(ASCodableFriend *)self addSnapshots:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v9);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = *((id *)v4 + 5);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        [(ASCodableFriend *)self addWorkouts:*(void *)(*((void *)&v35 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v14);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = *((id *)v4 + 1);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        [(ASCodableFriend *)self addAchievements:*(void *)(*((void *)&v31 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v19);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v22 = *((id *)v4 + 2);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        -[ASCodableFriend addCompetitions:](self, "addCompetitions:", *(void *)(*((void *)&v27 + 1) + 8 * m), (void)v27);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v24);
  }
}

- (ASCodableContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (NSMutableArray)snapshots
{
  return self->_snapshots;
}

- (void)setSnapshots:(id)a3
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

- (NSMutableArray)competitions
{
  return self->_competitions;
}

- (void)setCompetitions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workouts, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_competitions, 0);

  objc_storeStrong((id *)&self->_achievements, 0);
}

@end