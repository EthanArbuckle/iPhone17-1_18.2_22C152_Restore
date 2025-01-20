@interface CLPCellWifiCollectionRequest
+ (Class)cdmaCellTowerLocationType;
+ (Class)cellOutOfServiceInfoType;
+ (Class)cellTowerLocationType;
+ (Class)lteCellTowerLocationType;
+ (Class)nrCellTowerLocationType;
+ (Class)scdmaCellTowerLocationType;
+ (Class)wifiAPLocationType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPMeta)meta;
- (Class)responseClass;
- (NSMutableArray)cdmaCellTowerLocations;
- (NSMutableArray)cellOutOfServiceInfos;
- (NSMutableArray)cellTowerLocations;
- (NSMutableArray)lteCellTowerLocations;
- (NSMutableArray)nrCellTowerLocations;
- (NSMutableArray)scdmaCellTowerLocations;
- (NSMutableArray)wifiAPLocations;
- (id)cdmaCellTowerLocationAtIndex:(unint64_t)a3;
- (id)cellOutOfServiceInfoAtIndex:(unint64_t)a3;
- (id)cellTowerLocationAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)lteCellTowerLocationAtIndex:(unint64_t)a3;
- (id)nrCellTowerLocationAtIndex:(unint64_t)a3;
- (id)scdmaCellTowerLocationAtIndex:(unint64_t)a3;
- (id)wifiAPLocationAtIndex:(unint64_t)a3;
- (unint64_t)cdmaCellTowerLocationsCount;
- (unint64_t)cellOutOfServiceInfosCount;
- (unint64_t)cellTowerLocationsCount;
- (unint64_t)hash;
- (unint64_t)lteCellTowerLocationsCount;
- (unint64_t)nrCellTowerLocationsCount;
- (unint64_t)scdmaCellTowerLocationsCount;
- (unint64_t)wifiAPLocationsCount;
- (unsigned)requestTypeCode;
- (void)addCdmaCellTowerLocation:(id)a3;
- (void)addCellOutOfServiceInfo:(id)a3;
- (void)addCellTowerLocation:(id)a3;
- (void)addLteCellTowerLocation:(id)a3;
- (void)addNrCellTowerLocation:(id)a3;
- (void)addScdmaCellTowerLocation:(id)a3;
- (void)addWifiAPLocation:(id)a3;
- (void)clearCdmaCellTowerLocations;
- (void)clearCellOutOfServiceInfos;
- (void)clearCellTowerLocations;
- (void)clearLteCellTowerLocations;
- (void)clearNrCellTowerLocations;
- (void)clearScdmaCellTowerLocations;
- (void)clearWifiAPLocations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCdmaCellTowerLocations:(id)a3;
- (void)setCellOutOfServiceInfos:(id)a3;
- (void)setCellTowerLocations:(id)a3;
- (void)setLteCellTowerLocations:(id)a3;
- (void)setMeta:(id)a3;
- (void)setNrCellTowerLocations:(id)a3;
- (void)setScdmaCellTowerLocations:(id)a3;
- (void)setWifiAPLocations:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPCellWifiCollectionRequest

- (void)clearCellTowerLocations
{
}

- (void)addCellTowerLocation:(id)a3
{
  id v4 = a3;
  cellTowerLocations = self->_cellTowerLocations;
  id v8 = v4;
  if (!cellTowerLocations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_cellTowerLocations;
    self->_cellTowerLocations = v6;

    id v4 = v8;
    cellTowerLocations = self->_cellTowerLocations;
  }
  [(NSMutableArray *)cellTowerLocations addObject:v4];
}

- (unint64_t)cellTowerLocationsCount
{
  return [(NSMutableArray *)self->_cellTowerLocations count];
}

- (id)cellTowerLocationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellTowerLocations objectAtIndex:a3];
}

+ (Class)cellTowerLocationType
{
  return (Class)objc_opt_class();
}

- (void)clearCdmaCellTowerLocations
{
}

- (void)addCdmaCellTowerLocation:(id)a3
{
  id v4 = a3;
  cdmaCellTowerLocations = self->_cdmaCellTowerLocations;
  id v8 = v4;
  if (!cdmaCellTowerLocations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_cdmaCellTowerLocations;
    self->_cdmaCellTowerLocations = v6;

    id v4 = v8;
    cdmaCellTowerLocations = self->_cdmaCellTowerLocations;
  }
  [(NSMutableArray *)cdmaCellTowerLocations addObject:v4];
}

- (unint64_t)cdmaCellTowerLocationsCount
{
  return [(NSMutableArray *)self->_cdmaCellTowerLocations count];
}

- (id)cdmaCellTowerLocationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cdmaCellTowerLocations objectAtIndex:a3];
}

+ (Class)cdmaCellTowerLocationType
{
  return (Class)objc_opt_class();
}

- (void)clearLteCellTowerLocations
{
}

- (void)addLteCellTowerLocation:(id)a3
{
  id v4 = a3;
  lteCellTowerLocations = self->_lteCellTowerLocations;
  id v8 = v4;
  if (!lteCellTowerLocations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_lteCellTowerLocations;
    self->_lteCellTowerLocations = v6;

    id v4 = v8;
    lteCellTowerLocations = self->_lteCellTowerLocations;
  }
  [(NSMutableArray *)lteCellTowerLocations addObject:v4];
}

- (unint64_t)lteCellTowerLocationsCount
{
  return [(NSMutableArray *)self->_lteCellTowerLocations count];
}

- (id)lteCellTowerLocationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_lteCellTowerLocations objectAtIndex:a3];
}

+ (Class)lteCellTowerLocationType
{
  return (Class)objc_opt_class();
}

- (void)clearNrCellTowerLocations
{
}

- (void)addNrCellTowerLocation:(id)a3
{
  id v4 = a3;
  nrCellTowerLocations = self->_nrCellTowerLocations;
  id v8 = v4;
  if (!nrCellTowerLocations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_nrCellTowerLocations;
    self->_nrCellTowerLocations = v6;

    id v4 = v8;
    nrCellTowerLocations = self->_nrCellTowerLocations;
  }
  [(NSMutableArray *)nrCellTowerLocations addObject:v4];
}

- (unint64_t)nrCellTowerLocationsCount
{
  return [(NSMutableArray *)self->_nrCellTowerLocations count];
}

- (id)nrCellTowerLocationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_nrCellTowerLocations objectAtIndex:a3];
}

+ (Class)nrCellTowerLocationType
{
  return (Class)objc_opt_class();
}

- (void)clearWifiAPLocations
{
}

- (void)addWifiAPLocation:(id)a3
{
  id v4 = a3;
  wifiAPLocations = self->_wifiAPLocations;
  id v8 = v4;
  if (!wifiAPLocations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_wifiAPLocations;
    self->_wifiAPLocations = v6;

    id v4 = v8;
    wifiAPLocations = self->_wifiAPLocations;
  }
  [(NSMutableArray *)wifiAPLocations addObject:v4];
}

- (unint64_t)wifiAPLocationsCount
{
  return [(NSMutableArray *)self->_wifiAPLocations count];
}

- (id)wifiAPLocationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_wifiAPLocations objectAtIndex:a3];
}

+ (Class)wifiAPLocationType
{
  return (Class)objc_opt_class();
}

- (void)clearScdmaCellTowerLocations
{
}

- (void)addScdmaCellTowerLocation:(id)a3
{
  id v4 = a3;
  scdmaCellTowerLocations = self->_scdmaCellTowerLocations;
  id v8 = v4;
  if (!scdmaCellTowerLocations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_scdmaCellTowerLocations;
    self->_scdmaCellTowerLocations = v6;

    id v4 = v8;
    scdmaCellTowerLocations = self->_scdmaCellTowerLocations;
  }
  [(NSMutableArray *)scdmaCellTowerLocations addObject:v4];
}

- (unint64_t)scdmaCellTowerLocationsCount
{
  return [(NSMutableArray *)self->_scdmaCellTowerLocations count];
}

- (id)scdmaCellTowerLocationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_scdmaCellTowerLocations objectAtIndex:a3];
}

+ (Class)scdmaCellTowerLocationType
{
  return (Class)objc_opt_class();
}

- (void)clearCellOutOfServiceInfos
{
}

- (void)addCellOutOfServiceInfo:(id)a3
{
  id v4 = a3;
  cellOutOfServiceInfos = self->_cellOutOfServiceInfos;
  id v8 = v4;
  if (!cellOutOfServiceInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_cellOutOfServiceInfos;
    self->_cellOutOfServiceInfos = v6;

    id v4 = v8;
    cellOutOfServiceInfos = self->_cellOutOfServiceInfos;
  }
  [(NSMutableArray *)cellOutOfServiceInfos addObject:v4];
}

- (unint64_t)cellOutOfServiceInfosCount
{
  return [(NSMutableArray *)self->_cellOutOfServiceInfos count];
}

- (id)cellOutOfServiceInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellOutOfServiceInfos objectAtIndex:a3];
}

+ (Class)cellOutOfServiceInfoType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPCellWifiCollectionRequest;
  id v4 = [(CLPCellWifiCollectionRequest *)&v8 description];
  v5 = [(CLPCellWifiCollectionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  meta = self->_meta;
  if (meta)
  {
    v5 = [(CLPMeta *)meta dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"meta"];
  }
  if ([(NSMutableArray *)self->_cellTowerLocations count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_cellTowerLocations, "count"));
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    v7 = self->_cellTowerLocations;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v80 objects:v90 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v81 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v80 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v80 objects:v90 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"cellTowerLocation"];
  }
  if ([(NSMutableArray *)self->_cdmaCellTowerLocations count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_cdmaCellTowerLocations, "count"));
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v14 = self->_cdmaCellTowerLocations;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v76 objects:v89 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v77;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v77 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v76 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v76 objects:v89 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"cdmaCellTowerLocation"];
  }
  if ([(NSMutableArray *)self->_lteCellTowerLocations count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_lteCellTowerLocations, "count"));
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v21 = self->_lteCellTowerLocations;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v72 objects:v88 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v73;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v73 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v72 + 1) + 8 * k) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v72 objects:v88 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKey:@"lteCellTowerLocation"];
  }
  if ([(NSMutableArray *)self->_nrCellTowerLocations count])
  {
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_nrCellTowerLocations, "count"));
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v28 = self->_nrCellTowerLocations;
    uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v68 objects:v87 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v69;
      do
      {
        for (uint64_t m = 0; m != v30; ++m)
        {
          if (*(void *)v69 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v68 + 1) + 8 * m) dictionaryRepresentation];
          [v27 addObject:v33];
        }
        uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v68 objects:v87 count:16];
      }
      while (v30);
    }

    [v3 setObject:v27 forKey:@"nrCellTowerLocation"];
  }
  if ([(NSMutableArray *)self->_wifiAPLocations count])
  {
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_wifiAPLocations, "count"));
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v35 = self->_wifiAPLocations;
    uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v64 objects:v86 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v65;
      do
      {
        for (uint64_t n = 0; n != v37; ++n)
        {
          if (*(void *)v65 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = [*(id *)(*((void *)&v64 + 1) + 8 * n) dictionaryRepresentation];
          [v34 addObject:v40];
        }
        uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v64 objects:v86 count:16];
      }
      while (v37);
    }

    [v3 setObject:v34 forKey:@"wifiAPLocation"];
  }
  if ([(NSMutableArray *)self->_scdmaCellTowerLocations count])
  {
    v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_scdmaCellTowerLocations, "count"));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v42 = self->_scdmaCellTowerLocations;
    uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v60 objects:v85 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v61;
      do
      {
        for (iuint64_t i = 0; ii != v44; ++ii)
        {
          if (*(void *)v61 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = [*(id *)(*((void *)&v60 + 1) + 8 * ii) dictionaryRepresentation];
          [v41 addObject:v47];
        }
        uint64_t v44 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v60 objects:v85 count:16];
      }
      while (v44);
    }

    [v3 setObject:v41 forKey:@"scdmaCellTowerLocation"];
  }
  if ([(NSMutableArray *)self->_cellOutOfServiceInfos count])
  {
    v48 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_cellOutOfServiceInfos, "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v49 = self->_cellOutOfServiceInfos;
    uint64_t v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v56 objects:v84 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v57;
      do
      {
        for (juint64_t j = 0; jj != v51; ++jj)
        {
          if (*(void *)v57 != v52) {
            objc_enumerationMutation(v49);
          }
          v54 = objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * jj), "dictionaryRepresentation", (void)v56);
          [v48 addObject:v54];
        }
        uint64_t v51 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v56 objects:v84 count:16];
      }
      while (v51);
    }

    [v3 setObject:v48 forKey:@"cellOutOfServiceInfo"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPCellWifiCollectionRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_meta) {
    -[CLPCellWifiCollectionRequest writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteSubmessage();
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v6 = self->_cellTowerLocations;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v66;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v66 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v65 objects:v75 count:16];
    }
    while (v8);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v11 = self->_wifiAPLocations;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v62;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v62 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v61 objects:v74 count:16];
    }
    while (v13);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v16 = self->_cdmaCellTowerLocations;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v57 objects:v73 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v58;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v58 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v57 objects:v73 count:16];
    }
    while (v18);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v21 = self->_lteCellTowerLocations;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v53 objects:v72 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v54;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v54 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v53 objects:v72 count:16];
    }
    while (v23);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v26 = self->_scdmaCellTowerLocations;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v49 objects:v71 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v50;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v50 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteSubmessage();
        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v49 objects:v71 count:16];
    }
    while (v28);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v31 = self->_cellOutOfServiceInfos;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v45 objects:v70 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v46;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(v31);
        }
        PBDataWriterWriteSubmessage();
        ++v35;
      }
      while (v33 != v35);
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v45 objects:v70 count:16];
    }
    while (v33);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v36 = self->_nrCellTowerLocations;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v41 objects:v69 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v42;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v42 != v39) {
          objc_enumerationMutation(v36);
        }
        PBDataWriterWriteSubmessage();
        ++v40;
      }
      while (v38 != v40);
      uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v41 objects:v69 count:16];
    }
    while (v38);
  }
}

- (unsigned)requestTypeCode
{
  return 100;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v32 = a3;
  [v32 setMeta:self->_meta];
  if ([(CLPCellWifiCollectionRequest *)self cellTowerLocationsCount])
  {
    [v32 clearCellTowerLocations];
    unint64_t v4 = [(CLPCellWifiCollectionRequest *)self cellTowerLocationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(CLPCellWifiCollectionRequest *)self cellTowerLocationAtIndex:i];
        [v32 addCellTowerLocation:v7];
      }
    }
  }
  if ([(CLPCellWifiCollectionRequest *)self wifiAPLocationsCount])
  {
    [v32 clearWifiAPLocations];
    unint64_t v8 = [(CLPCellWifiCollectionRequest *)self wifiAPLocationsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        v11 = [(CLPCellWifiCollectionRequest *)self wifiAPLocationAtIndex:j];
        [v32 addWifiAPLocation:v11];
      }
    }
  }
  if ([(CLPCellWifiCollectionRequest *)self cdmaCellTowerLocationsCount])
  {
    [v32 clearCdmaCellTowerLocations];
    unint64_t v12 = [(CLPCellWifiCollectionRequest *)self cdmaCellTowerLocationsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(CLPCellWifiCollectionRequest *)self cdmaCellTowerLocationAtIndex:k];
        [v32 addCdmaCellTowerLocation:v15];
      }
    }
  }
  if ([(CLPCellWifiCollectionRequest *)self lteCellTowerLocationsCount])
  {
    [v32 clearLteCellTowerLocations];
    unint64_t v16 = [(CLPCellWifiCollectionRequest *)self lteCellTowerLocationsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(CLPCellWifiCollectionRequest *)self lteCellTowerLocationAtIndex:m];
        [v32 addLteCellTowerLocation:v19];
      }
    }
  }
  if ([(CLPCellWifiCollectionRequest *)self scdmaCellTowerLocationsCount])
  {
    [v32 clearScdmaCellTowerLocations];
    unint64_t v20 = [(CLPCellWifiCollectionRequest *)self scdmaCellTowerLocationsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(CLPCellWifiCollectionRequest *)self scdmaCellTowerLocationAtIndex:n];
        [v32 addScdmaCellTowerLocation:v23];
      }
    }
  }
  if ([(CLPCellWifiCollectionRequest *)self cellOutOfServiceInfosCount])
  {
    [v32 clearCellOutOfServiceInfos];
    unint64_t v24 = [(CLPCellWifiCollectionRequest *)self cellOutOfServiceInfosCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (iuint64_t i = 0; ii != v25; ++ii)
      {
        uint64_t v27 = [(CLPCellWifiCollectionRequest *)self cellOutOfServiceInfoAtIndex:ii];
        [v32 addCellOutOfServiceInfo:v27];
      }
    }
  }
  if ([(CLPCellWifiCollectionRequest *)self nrCellTowerLocationsCount])
  {
    [v32 clearNrCellTowerLocations];
    unint64_t v28 = [(CLPCellWifiCollectionRequest *)self nrCellTowerLocationsCount];
    if (v28)
    {
      unint64_t v29 = v28;
      for (juint64_t j = 0; jj != v29; ++jj)
      {
        uint64_t v31 = [(CLPCellWifiCollectionRequest *)self nrCellTowerLocationAtIndex:jj];
        [v32 addNrCellTowerLocation:v31];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPMeta *)self->_meta copyWithZone:a3];
  uint64_t v7 = (void *)v5[5];
  v5[5] = v6;

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  unint64_t v8 = self->_cellTowerLocations;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v76;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v76 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v75 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addCellTowerLocation:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v75 objects:v85 count:16];
    }
    while (v10);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v14 = self->_wifiAPLocations;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v71 objects:v84 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v72;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v72 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v71 + 1) + 8 * v18) copyWithZone:a3];
        [v5 addWifiAPLocation:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v71 objects:v84 count:16];
    }
    while (v16);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  unint64_t v20 = self->_cdmaCellTowerLocations;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v67 objects:v83 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v68;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v68 != v23) {
          objc_enumerationMutation(v20);
        }
        unint64_t v25 = (void *)[*(id *)(*((void *)&v67 + 1) + 8 * v24) copyWithZone:a3];
        [v5 addCdmaCellTowerLocation:v25];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v67 objects:v83 count:16];
    }
    while (v22);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v26 = self->_lteCellTowerLocations;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v63 objects:v82 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v64;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v64 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = (void *)[*(id *)(*((void *)&v63 + 1) + 8 * v30) copyWithZone:a3];
        [v5 addLteCellTowerLocation:v31];

        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v63 objects:v82 count:16];
    }
    while (v28);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v32 = self->_scdmaCellTowerLocations;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v59 objects:v81 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v60;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v60 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = (void *)[*(id *)(*((void *)&v59 + 1) + 8 * v36) copyWithZone:a3];
        [v5 addScdmaCellTowerLocation:v37];

        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v59 objects:v81 count:16];
    }
    while (v34);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v38 = self->_cellOutOfServiceInfos;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v55 objects:v80 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v56;
    do
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v56 != v41) {
          objc_enumerationMutation(v38);
        }
        long long v43 = (void *)[*(id *)(*((void *)&v55 + 1) + 8 * v42) copyWithZone:a3];
        [v5 addCellOutOfServiceInfo:v43];

        ++v42;
      }
      while (v40 != v42);
      uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v55 objects:v80 count:16];
    }
    while (v40);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v44 = self->_nrCellTowerLocations;
  uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v51 objects:v79 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v52;
    do
    {
      uint64_t v48 = 0;
      do
      {
        if (*(void *)v52 != v47) {
          objc_enumerationMutation(v44);
        }
        long long v49 = objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * v48), "copyWithZone:", a3, (void)v51);
        [v5 addNrCellTowerLocation:v49];

        ++v48;
      }
      while (v46 != v48);
      uint64_t v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v51 objects:v79 count:16];
    }
    while (v46);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((meta = self->_meta, !((unint64_t)meta | v4[5])) || -[CLPMeta isEqual:](meta, "isEqual:"))
    && ((cellTowerLocations = self->_cellTowerLocations, !((unint64_t)cellTowerLocations | v4[3]))
     || -[NSMutableArray isEqual:](cellTowerLocations, "isEqual:"))
    && ((wifiAPLocations = self->_wifiAPLocations, !((unint64_t)wifiAPLocations | v4[8]))
     || -[NSMutableArray isEqual:](wifiAPLocations, "isEqual:"))
    && ((cdmaCellTowerLocations = self->_cdmaCellTowerLocations, !((unint64_t)cdmaCellTowerLocations | v4[1]))
     || -[NSMutableArray isEqual:](cdmaCellTowerLocations, "isEqual:"))
    && ((lteCellTowerLocations = self->_lteCellTowerLocations, !((unint64_t)lteCellTowerLocations | v4[4]))
     || -[NSMutableArray isEqual:](lteCellTowerLocations, "isEqual:"))
    && ((scdmaCellTowerLocations = self->_scdmaCellTowerLocations, !((unint64_t)scdmaCellTowerLocations | v4[7]))
     || -[NSMutableArray isEqual:](scdmaCellTowerLocations, "isEqual:"))
    && ((cellOutOfServiceInfos = self->_cellOutOfServiceInfos, !((unint64_t)cellOutOfServiceInfos | v4[2]))
     || -[NSMutableArray isEqual:](cellOutOfServiceInfos, "isEqual:")))
  {
    nrCellTowerLocations = self->_nrCellTowerLocations;
    if ((unint64_t)nrCellTowerLocations | v4[6]) {
      char v13 = -[NSMutableArray isEqual:](nrCellTowerLocations, "isEqual:");
    }
    else {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CLPMeta *)self->_meta hash];
  uint64_t v4 = [(NSMutableArray *)self->_cellTowerLocations hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_wifiAPLocations hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_cdmaCellTowerLocations hash];
  uint64_t v7 = [(NSMutableArray *)self->_lteCellTowerLocations hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_scdmaCellTowerLocations hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_cellOutOfServiceInfos hash];
  return v9 ^ [(NSMutableArray *)self->_nrCellTowerLocations hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  meta = self->_meta;
  uint64_t v6 = *((void *)v4 + 5);
  if (meta)
  {
    if (v6) {
      -[CLPMeta mergeFrom:](meta, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[CLPCellWifiCollectionRequest setMeta:](self, "setMeta:");
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v7 = *((id *)v4 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v67 != v10) {
          objc_enumerationMutation(v7);
        }
        [(CLPCellWifiCollectionRequest *)self addCellTowerLocation:*(void *)(*((void *)&v66 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v9);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v12 = *((id *)v4 + 8);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v62 objects:v75 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v63 != v15) {
          objc_enumerationMutation(v12);
        }
        [(CLPCellWifiCollectionRequest *)self addWifiAPLocation:*(void *)(*((void *)&v62 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v62 objects:v75 count:16];
    }
    while (v14);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v17 = *((id *)v4 + 1);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:v74 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v59;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v59 != v20) {
          objc_enumerationMutation(v17);
        }
        [(CLPCellWifiCollectionRequest *)self addCdmaCellTowerLocation:*(void *)(*((void *)&v58 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v58 objects:v74 count:16];
    }
    while (v19);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v22 = *((id *)v4 + 4);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v54 objects:v73 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v55;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v55 != v25) {
          objc_enumerationMutation(v22);
        }
        [(CLPCellWifiCollectionRequest *)self addLteCellTowerLocation:*(void *)(*((void *)&v54 + 1) + 8 * m)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v54 objects:v73 count:16];
    }
    while (v24);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v27 = *((id *)v4 + 7);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:v72 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v51;
    do
    {
      for (uint64_t n = 0; n != v29; ++n)
      {
        if (*(void *)v51 != v30) {
          objc_enumerationMutation(v27);
        }
        [(CLPCellWifiCollectionRequest *)self addScdmaCellTowerLocation:*(void *)(*((void *)&v50 + 1) + 8 * n)];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v50 objects:v72 count:16];
    }
    while (v29);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v32 = *((id *)v4 + 2);
  uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v71 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v47;
    do
    {
      for (iuint64_t i = 0; ii != v34; ++ii)
      {
        if (*(void *)v47 != v35) {
          objc_enumerationMutation(v32);
        }
        [(CLPCellWifiCollectionRequest *)self addCellOutOfServiceInfo:*(void *)(*((void *)&v46 + 1) + 8 * ii)];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v46 objects:v71 count:16];
    }
    while (v34);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v37 = *((id *)v4 + 6);
  uint64_t v38 = [v37 countByEnumeratingWithState:&v42 objects:v70 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v43;
    do
    {
      for (juint64_t j = 0; jj != v39; ++jj)
      {
        if (*(void *)v43 != v40) {
          objc_enumerationMutation(v37);
        }
        -[CLPCellWifiCollectionRequest addNrCellTowerLocation:](self, "addNrCellTowerLocation:", *(void *)(*((void *)&v42 + 1) + 8 * jj), (void)v42);
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v42 objects:v70 count:16];
    }
    while (v39);
  }
}

- (CLPMeta)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
}

- (NSMutableArray)cellTowerLocations
{
  return self->_cellTowerLocations;
}

- (void)setCellTowerLocations:(id)a3
{
}

- (NSMutableArray)cdmaCellTowerLocations
{
  return self->_cdmaCellTowerLocations;
}

- (void)setCdmaCellTowerLocations:(id)a3
{
}

- (NSMutableArray)lteCellTowerLocations
{
  return self->_lteCellTowerLocations;
}

- (void)setLteCellTowerLocations:(id)a3
{
}

- (NSMutableArray)nrCellTowerLocations
{
  return self->_nrCellTowerLocations;
}

- (void)setNrCellTowerLocations:(id)a3
{
}

- (NSMutableArray)wifiAPLocations
{
  return self->_wifiAPLocations;
}

- (void)setWifiAPLocations:(id)a3
{
}

- (NSMutableArray)scdmaCellTowerLocations
{
  return self->_scdmaCellTowerLocations;
}

- (void)setScdmaCellTowerLocations:(id)a3
{
}

- (NSMutableArray)cellOutOfServiceInfos
{
  return self->_cellOutOfServiceInfos;
}

- (void)setCellOutOfServiceInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiAPLocations, 0);
  objc_storeStrong((id *)&self->_scdmaCellTowerLocations, 0);
  objc_storeStrong((id *)&self->_nrCellTowerLocations, 0);
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_lteCellTowerLocations, 0);
  objc_storeStrong((id *)&self->_cellTowerLocations, 0);
  objc_storeStrong((id *)&self->_cellOutOfServiceInfos, 0);

  objc_storeStrong((id *)&self->_cdmaCellTowerLocations, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPCellWifiCollectionRequest writeTo:]", "CLPCollectionRequest.gen.m", 7473, "self->_meta != nil");
}

@end