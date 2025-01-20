@interface CLPCellNeighborsGroup
+ (Class)cdmaNeighborsType;
+ (Class)gsmNeighborsType;
+ (Class)lteNeighborsType;
+ (Class)nrNeighborsType;
+ (Class)scdmaNeighborsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)cdmaNeighbors;
- (NSMutableArray)gsmNeighbors;
- (NSMutableArray)lteNeighbors;
- (NSMutableArray)nrNeighbors;
- (NSMutableArray)scdmaNeighbors;
- (id)cdmaNeighborsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)gsmNeighborsAtIndex:(unint64_t)a3;
- (id)lteNeighborsAtIndex:(unint64_t)a3;
- (id)nrNeighborsAtIndex:(unint64_t)a3;
- (id)scdmaNeighborsAtIndex:(unint64_t)a3;
- (unint64_t)cdmaNeighborsCount;
- (unint64_t)gsmNeighborsCount;
- (unint64_t)hash;
- (unint64_t)lteNeighborsCount;
- (unint64_t)nrNeighborsCount;
- (unint64_t)scdmaNeighborsCount;
- (void)addCdmaNeighbors:(id)a3;
- (void)addGsmNeighbors:(id)a3;
- (void)addLteNeighbors:(id)a3;
- (void)addNrNeighbors:(id)a3;
- (void)addScdmaNeighbors:(id)a3;
- (void)clearCdmaNeighbors;
- (void)clearGsmNeighbors;
- (void)clearLteNeighbors;
- (void)clearNrNeighbors;
- (void)clearScdmaNeighbors;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCdmaNeighbors:(id)a3;
- (void)setGsmNeighbors:(id)a3;
- (void)setLteNeighbors:(id)a3;
- (void)setNrNeighbors:(id)a3;
- (void)setScdmaNeighbors:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPCellNeighborsGroup

- (void)clearGsmNeighbors
{
}

- (void)addGsmNeighbors:(id)a3
{
  id v4 = a3;
  gsmNeighbors = self->_gsmNeighbors;
  id v8 = v4;
  if (!gsmNeighbors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_gsmNeighbors;
    self->_gsmNeighbors = v6;

    id v4 = v8;
    gsmNeighbors = self->_gsmNeighbors;
  }
  [(NSMutableArray *)gsmNeighbors addObject:v4];
}

- (unint64_t)gsmNeighborsCount
{
  return [(NSMutableArray *)self->_gsmNeighbors count];
}

- (id)gsmNeighborsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_gsmNeighbors objectAtIndex:a3];
}

+ (Class)gsmNeighborsType
{
  return (Class)objc_opt_class();
}

- (void)clearScdmaNeighbors
{
}

- (void)addScdmaNeighbors:(id)a3
{
  id v4 = a3;
  scdmaNeighbors = self->_scdmaNeighbors;
  id v8 = v4;
  if (!scdmaNeighbors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_scdmaNeighbors;
    self->_scdmaNeighbors = v6;

    id v4 = v8;
    scdmaNeighbors = self->_scdmaNeighbors;
  }
  [(NSMutableArray *)scdmaNeighbors addObject:v4];
}

- (unint64_t)scdmaNeighborsCount
{
  return [(NSMutableArray *)self->_scdmaNeighbors count];
}

- (id)scdmaNeighborsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_scdmaNeighbors objectAtIndex:a3];
}

+ (Class)scdmaNeighborsType
{
  return (Class)objc_opt_class();
}

- (void)clearCdmaNeighbors
{
}

- (void)addCdmaNeighbors:(id)a3
{
  id v4 = a3;
  cdmaNeighbors = self->_cdmaNeighbors;
  id v8 = v4;
  if (!cdmaNeighbors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_cdmaNeighbors;
    self->_cdmaNeighbors = v6;

    id v4 = v8;
    cdmaNeighbors = self->_cdmaNeighbors;
  }
  [(NSMutableArray *)cdmaNeighbors addObject:v4];
}

- (unint64_t)cdmaNeighborsCount
{
  return [(NSMutableArray *)self->_cdmaNeighbors count];
}

- (id)cdmaNeighborsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cdmaNeighbors objectAtIndex:a3];
}

+ (Class)cdmaNeighborsType
{
  return (Class)objc_opt_class();
}

- (void)clearLteNeighbors
{
}

- (void)addLteNeighbors:(id)a3
{
  id v4 = a3;
  lteNeighbors = self->_lteNeighbors;
  id v8 = v4;
  if (!lteNeighbors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_lteNeighbors;
    self->_lteNeighbors = v6;

    id v4 = v8;
    lteNeighbors = self->_lteNeighbors;
  }
  [(NSMutableArray *)lteNeighbors addObject:v4];
}

- (unint64_t)lteNeighborsCount
{
  return [(NSMutableArray *)self->_lteNeighbors count];
}

- (id)lteNeighborsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_lteNeighbors objectAtIndex:a3];
}

+ (Class)lteNeighborsType
{
  return (Class)objc_opt_class();
}

- (void)clearNrNeighbors
{
}

- (void)addNrNeighbors:(id)a3
{
  id v4 = a3;
  nrNeighbors = self->_nrNeighbors;
  id v8 = v4;
  if (!nrNeighbors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_nrNeighbors;
    self->_nrNeighbors = v6;

    id v4 = v8;
    nrNeighbors = self->_nrNeighbors;
  }
  [(NSMutableArray *)nrNeighbors addObject:v4];
}

- (unint64_t)nrNeighborsCount
{
  return [(NSMutableArray *)self->_nrNeighbors count];
}

- (id)nrNeighborsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_nrNeighbors objectAtIndex:a3];
}

+ (Class)nrNeighborsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPCellNeighborsGroup;
  id v4 = [(CLPCellNeighborsGroup *)&v8 description];
  v5 = [(CLPCellNeighborsGroup *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_gsmNeighbors count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_gsmNeighbors, "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v5 = self->_gsmNeighbors;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v57 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v56 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v56 objects:v64 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"gsmNeighbors"];
  }
  if ([(NSMutableArray *)self->_scdmaNeighbors count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_scdmaNeighbors, "count"));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v12 = self->_scdmaNeighbors;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v52 objects:v63 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v53 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v52 + 1) + 8 * j) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v52 objects:v63 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"scdmaNeighbors"];
  }
  if ([(NSMutableArray *)self->_cdmaNeighbors count])
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_cdmaNeighbors, "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v19 = self->_cdmaNeighbors;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v48 objects:v62 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v49;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v49 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [*(id *)(*((void *)&v48 + 1) + 8 * k) dictionaryRepresentation];
          [v18 addObject:v24];
        }
        uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v48 objects:v62 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKey:@"cdmaNeighbors"];
  }
  if ([(NSMutableArray *)self->_lteNeighbors count])
  {
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_lteNeighbors, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v26 = self->_lteNeighbors;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v44 objects:v61 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v45;
      do
      {
        for (uint64_t m = 0; m != v28; ++m)
        {
          if (*(void *)v45 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [*(id *)(*((void *)&v44 + 1) + 8 * m) dictionaryRepresentation];
          [v25 addObject:v31];
        }
        uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v44 objects:v61 count:16];
      }
      while (v28);
    }

    [v3 setObject:v25 forKey:@"lteNeighbors"];
  }
  if ([(NSMutableArray *)self->_nrNeighbors count])
  {
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_nrNeighbors, "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v33 = self->_nrNeighbors;
    uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v40 objects:v60 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v41;
      do
      {
        for (uint64_t n = 0; n != v35; ++n)
        {
          if (*(void *)v41 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * n), "dictionaryRepresentation", (void)v40);
          [v32 addObject:v38];
        }
        uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v40 objects:v60 count:16];
      }
      while (v35);
    }

    [v3 setObject:v32 forKey:@"nrNeighbors"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPCellNeighborsGroupReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v5 = self->_gsmNeighbors;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v10 = self->_scdmaNeighbors;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v12);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v15 = self->_cdmaNeighbors;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v17);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v20 = self->_lteNeighbors;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
    }
    while (v22);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v25 = self->_nrNeighbors;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
    }
    while (v27);
  }
}

- (void)copyTo:(id)a3
{
  id v24 = a3;
  if ([(CLPCellNeighborsGroup *)self gsmNeighborsCount])
  {
    [v24 clearGsmNeighbors];
    unint64_t v4 = [(CLPCellNeighborsGroup *)self gsmNeighborsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(CLPCellNeighborsGroup *)self gsmNeighborsAtIndex:i];
        [v24 addGsmNeighbors:v7];
      }
    }
  }
  if ([(CLPCellNeighborsGroup *)self scdmaNeighborsCount])
  {
    [v24 clearScdmaNeighbors];
    unint64_t v8 = [(CLPCellNeighborsGroup *)self scdmaNeighborsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(CLPCellNeighborsGroup *)self scdmaNeighborsAtIndex:j];
        [v24 addScdmaNeighbors:v11];
      }
    }
  }
  if ([(CLPCellNeighborsGroup *)self cdmaNeighborsCount])
  {
    [v24 clearCdmaNeighbors];
    unint64_t v12 = [(CLPCellNeighborsGroup *)self cdmaNeighborsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(CLPCellNeighborsGroup *)self cdmaNeighborsAtIndex:k];
        [v24 addCdmaNeighbors:v15];
      }
    }
  }
  if ([(CLPCellNeighborsGroup *)self lteNeighborsCount])
  {
    [v24 clearLteNeighbors];
    unint64_t v16 = [(CLPCellNeighborsGroup *)self lteNeighborsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(CLPCellNeighborsGroup *)self lteNeighborsAtIndex:m];
        [v24 addLteNeighbors:v19];
      }
    }
  }
  if ([(CLPCellNeighborsGroup *)self nrNeighborsCount])
  {
    [v24 clearNrNeighbors];
    unint64_t v20 = [(CLPCellNeighborsGroup *)self nrNeighborsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(CLPCellNeighborsGroup *)self nrNeighborsAtIndex:n];
        [v24 addNrNeighbors:v23];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v6 = self->_gsmNeighbors;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v54;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v54 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v53 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addGsmNeighbors:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v8);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  unint64_t v12 = self->_scdmaNeighbors;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v50;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(v12);
        }
        unint64_t v17 = (void *)[*(id *)(*((void *)&v49 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addScdmaNeighbors:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v14);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v18 = self->_cdmaNeighbors;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v45 objects:v59 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v46;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v46 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * v22) copyWithZone:a3];
        [v5 addCdmaNeighbors:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v45 objects:v59 count:16];
    }
    while (v20);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v24 = self->_lteNeighbors;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v41 objects:v58 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v42;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v42 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * v28) copyWithZone:a3];
        [v5 addLteNeighbors:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v41 objects:v58 count:16];
    }
    while (v26);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v30 = self->_nrNeighbors;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v37 objects:v57 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v38;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v38 != v33) {
          objc_enumerationMutation(v30);
        }
        long long v35 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v34), "copyWithZone:", a3, (void)v37);
        [v5 addNrNeighbors:v35];

        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v37 objects:v57 count:16];
    }
    while (v32);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((gsmNeighbors = self->_gsmNeighbors, !((unint64_t)gsmNeighbors | v4[2]))
     || -[NSMutableArray isEqual:](gsmNeighbors, "isEqual:"))
    && ((scdmaNeighbors = self->_scdmaNeighbors, !((unint64_t)scdmaNeighbors | v4[5]))
     || -[NSMutableArray isEqual:](scdmaNeighbors, "isEqual:"))
    && ((cdmaNeighbors = self->_cdmaNeighbors, !((unint64_t)cdmaNeighbors | v4[1]))
     || -[NSMutableArray isEqual:](cdmaNeighbors, "isEqual:"))
    && ((lteNeighbors = self->_lteNeighbors, !((unint64_t)lteNeighbors | v4[3]))
     || -[NSMutableArray isEqual:](lteNeighbors, "isEqual:")))
  {
    nrNeighbors = self->_nrNeighbors;
    if ((unint64_t)nrNeighbors | v4[4]) {
      char v10 = -[NSMutableArray isEqual:](nrNeighbors, "isEqual:");
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
  uint64_t v3 = [(NSMutableArray *)self->_gsmNeighbors hash];
  uint64_t v4 = [(NSMutableArray *)self->_scdmaNeighbors hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_cdmaNeighbors hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_lteNeighbors hash];
  return v6 ^ [(NSMutableArray *)self->_nrNeighbors hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CLPCellNeighborsGroup *)self addGsmNeighbors:*(void *)(*((void *)&v46 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = v4[5];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        [(CLPCellNeighborsGroup *)self addScdmaNeighbors:*(void *)(*((void *)&v42 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v12);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v15 = v4[1];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        [(CLPCellNeighborsGroup *)self addCdmaNeighbors:*(void *)(*((void *)&v38 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v17);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v20 = v4[3];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        [(CLPCellNeighborsGroup *)self addLteNeighbors:*(void *)(*((void *)&v34 + 1) + 8 * v24++)];
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
    }
    while (v22);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v25 = v4[4];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        -[CLPCellNeighborsGroup addNrNeighbors:](self, "addNrNeighbors:", *(void *)(*((void *)&v30 + 1) + 8 * v29++), (void)v30);
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
    }
    while (v27);
  }
}

- (NSMutableArray)gsmNeighbors
{
  return self->_gsmNeighbors;
}

- (void)setGsmNeighbors:(id)a3
{
}

- (NSMutableArray)scdmaNeighbors
{
  return self->_scdmaNeighbors;
}

- (void)setScdmaNeighbors:(id)a3
{
}

- (NSMutableArray)cdmaNeighbors
{
  return self->_cdmaNeighbors;
}

- (void)setCdmaNeighbors:(id)a3
{
}

- (NSMutableArray)lteNeighbors
{
  return self->_lteNeighbors;
}

- (void)setLteNeighbors:(id)a3
{
}

- (NSMutableArray)nrNeighbors
{
  return self->_nrNeighbors;
}

- (void)setNrNeighbors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scdmaNeighbors, 0);
  objc_storeStrong((id *)&self->_nrNeighbors, 0);
  objc_storeStrong((id *)&self->_lteNeighbors, 0);
  objc_storeStrong((id *)&self->_gsmNeighbors, 0);

  objc_storeStrong((id *)&self->_cdmaNeighbors, 0);
}

@end