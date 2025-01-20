@interface CLPIndoorCollectionRequest
+ (Class)bundleIdType;
+ (Class)indoorCMAttitudeType;
+ (Class)indoorCMPedometerType;
+ (Class)indoorLocationsType;
+ (Class)indoorMotionActivityType;
+ (Class)indoorPressureType;
+ (Class)indoorWifisType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPMeta)meta;
- (Class)responseClass;
- (NSMutableArray)bundleIds;
- (NSMutableArray)indoorCMAttitudes;
- (NSMutableArray)indoorCMPedometers;
- (NSMutableArray)indoorLocations;
- (NSMutableArray)indoorMotionActivitys;
- (NSMutableArray)indoorPressures;
- (NSMutableArray)indoorWifis;
- (id)bundleIdAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)indoorCMAttitudeAtIndex:(unint64_t)a3;
- (id)indoorCMPedometerAtIndex:(unint64_t)a3;
- (id)indoorLocationsAtIndex:(unint64_t)a3;
- (id)indoorMotionActivityAtIndex:(unint64_t)a3;
- (id)indoorPressureAtIndex:(unint64_t)a3;
- (id)indoorWifisAtIndex:(unint64_t)a3;
- (unint64_t)bundleIdsCount;
- (unint64_t)hash;
- (unint64_t)indoorCMAttitudesCount;
- (unint64_t)indoorCMPedometersCount;
- (unint64_t)indoorLocationsCount;
- (unint64_t)indoorMotionActivitysCount;
- (unint64_t)indoorPressuresCount;
- (unint64_t)indoorWifisCount;
- (unsigned)requestTypeCode;
- (void)addBundleId:(id)a3;
- (void)addIndoorCMAttitude:(id)a3;
- (void)addIndoorCMPedometer:(id)a3;
- (void)addIndoorLocations:(id)a3;
- (void)addIndoorMotionActivity:(id)a3;
- (void)addIndoorPressure:(id)a3;
- (void)addIndoorWifis:(id)a3;
- (void)clearBundleIds;
- (void)clearIndoorCMAttitudes;
- (void)clearIndoorCMPedometers;
- (void)clearIndoorLocations;
- (void)clearIndoorMotionActivitys;
- (void)clearIndoorPressures;
- (void)clearIndoorWifis;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleIds:(id)a3;
- (void)setIndoorCMAttitudes:(id)a3;
- (void)setIndoorCMPedometers:(id)a3;
- (void)setIndoorLocations:(id)a3;
- (void)setIndoorMotionActivitys:(id)a3;
- (void)setIndoorPressures:(id)a3;
- (void)setIndoorWifis:(id)a3;
- (void)setMeta:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPIndoorCollectionRequest

- (void)clearIndoorWifis
{
}

- (void)addIndoorWifis:(id)a3
{
  id v4 = a3;
  indoorWifis = self->_indoorWifis;
  id v8 = v4;
  if (!indoorWifis)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_indoorWifis;
    self->_indoorWifis = v6;

    id v4 = v8;
    indoorWifis = self->_indoorWifis;
  }
  [(NSMutableArray *)indoorWifis addObject:v4];
}

- (unint64_t)indoorWifisCount
{
  return [(NSMutableArray *)self->_indoorWifis count];
}

- (id)indoorWifisAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_indoorWifis objectAtIndex:a3];
}

+ (Class)indoorWifisType
{
  return (Class)objc_opt_class();
}

- (void)clearIndoorLocations
{
}

- (void)addIndoorLocations:(id)a3
{
  id v4 = a3;
  indoorLocations = self->_indoorLocations;
  id v8 = v4;
  if (!indoorLocations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_indoorLocations;
    self->_indoorLocations = v6;

    id v4 = v8;
    indoorLocations = self->_indoorLocations;
  }
  [(NSMutableArray *)indoorLocations addObject:v4];
}

- (unint64_t)indoorLocationsCount
{
  return [(NSMutableArray *)self->_indoorLocations count];
}

- (id)indoorLocationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_indoorLocations objectAtIndex:a3];
}

+ (Class)indoorLocationsType
{
  return (Class)objc_opt_class();
}

- (void)clearIndoorCMAttitudes
{
}

- (void)addIndoorCMAttitude:(id)a3
{
  id v4 = a3;
  indoorCMAttitudes = self->_indoorCMAttitudes;
  id v8 = v4;
  if (!indoorCMAttitudes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_indoorCMAttitudes;
    self->_indoorCMAttitudes = v6;

    id v4 = v8;
    indoorCMAttitudes = self->_indoorCMAttitudes;
  }
  [(NSMutableArray *)indoorCMAttitudes addObject:v4];
}

- (unint64_t)indoorCMAttitudesCount
{
  return [(NSMutableArray *)self->_indoorCMAttitudes count];
}

- (id)indoorCMAttitudeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_indoorCMAttitudes objectAtIndex:a3];
}

+ (Class)indoorCMAttitudeType
{
  return (Class)objc_opt_class();
}

- (void)clearIndoorCMPedometers
{
}

- (void)addIndoorCMPedometer:(id)a3
{
  id v4 = a3;
  indoorCMPedometers = self->_indoorCMPedometers;
  id v8 = v4;
  if (!indoorCMPedometers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_indoorCMPedometers;
    self->_indoorCMPedometers = v6;

    id v4 = v8;
    indoorCMPedometers = self->_indoorCMPedometers;
  }
  [(NSMutableArray *)indoorCMPedometers addObject:v4];
}

- (unint64_t)indoorCMPedometersCount
{
  return [(NSMutableArray *)self->_indoorCMPedometers count];
}

- (id)indoorCMPedometerAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_indoorCMPedometers objectAtIndex:a3];
}

+ (Class)indoorCMPedometerType
{
  return (Class)objc_opt_class();
}

- (void)clearIndoorMotionActivitys
{
}

- (void)addIndoorMotionActivity:(id)a3
{
  id v4 = a3;
  indoorMotionActivitys = self->_indoorMotionActivitys;
  id v8 = v4;
  if (!indoorMotionActivitys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_indoorMotionActivitys;
    self->_indoorMotionActivitys = v6;

    id v4 = v8;
    indoorMotionActivitys = self->_indoorMotionActivitys;
  }
  [(NSMutableArray *)indoorMotionActivitys addObject:v4];
}

- (unint64_t)indoorMotionActivitysCount
{
  return [(NSMutableArray *)self->_indoorMotionActivitys count];
}

- (id)indoorMotionActivityAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_indoorMotionActivitys objectAtIndex:a3];
}

+ (Class)indoorMotionActivityType
{
  return (Class)objc_opt_class();
}

- (void)clearIndoorPressures
{
}

- (void)addIndoorPressure:(id)a3
{
  id v4 = a3;
  indoorPressures = self->_indoorPressures;
  id v8 = v4;
  if (!indoorPressures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_indoorPressures;
    self->_indoorPressures = v6;

    id v4 = v8;
    indoorPressures = self->_indoorPressures;
  }
  [(NSMutableArray *)indoorPressures addObject:v4];
}

- (unint64_t)indoorPressuresCount
{
  return [(NSMutableArray *)self->_indoorPressures count];
}

- (id)indoorPressureAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_indoorPressures objectAtIndex:a3];
}

+ (Class)indoorPressureType
{
  return (Class)objc_opt_class();
}

- (void)clearBundleIds
{
}

- (void)addBundleId:(id)a3
{
  id v4 = a3;
  bundleIds = self->_bundleIds;
  id v8 = v4;
  if (!bundleIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_bundleIds;
    self->_bundleIds = v6;

    id v4 = v8;
    bundleIds = self->_bundleIds;
  }
  [(NSMutableArray *)bundleIds addObject:v4];
}

- (unint64_t)bundleIdsCount
{
  return [(NSMutableArray *)self->_bundleIds count];
}

- (id)bundleIdAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_bundleIds objectAtIndex:a3];
}

+ (Class)bundleIdType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPIndoorCollectionRequest;
  id v4 = [(CLPIndoorCollectionRequest *)&v8 description];
  v5 = [(CLPIndoorCollectionRequest *)self dictionaryRepresentation];
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
  if ([(NSMutableArray *)self->_indoorWifis count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_indoorWifis, "count"));
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    v7 = self->_indoorWifis;
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

    [v3 setObject:v6 forKey:@"indoorWifis"];
  }
  if ([(NSMutableArray *)self->_indoorLocations count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_indoorLocations, "count"));
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v14 = self->_indoorLocations;
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

    [v3 setObject:v13 forKey:@"indoorLocations"];
  }
  if ([(NSMutableArray *)self->_indoorCMAttitudes count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_indoorCMAttitudes, "count"));
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v21 = self->_indoorCMAttitudes;
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

    [v3 setObject:v20 forKey:@"indoorCMAttitude"];
  }
  if ([(NSMutableArray *)self->_indoorCMPedometers count])
  {
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_indoorCMPedometers, "count"));
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v28 = self->_indoorCMPedometers;
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

    [v3 setObject:v27 forKey:@"indoorCMPedometer"];
  }
  if ([(NSMutableArray *)self->_indoorMotionActivitys count])
  {
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_indoorMotionActivitys, "count"));
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v35 = self->_indoorMotionActivitys;
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

    [v3 setObject:v34 forKey:@"indoorMotionActivity"];
  }
  if ([(NSMutableArray *)self->_indoorPressures count])
  {
    v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_indoorPressures, "count"));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v42 = self->_indoorPressures;
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

    [v3 setObject:v41 forKey:@"indoorPressure"];
  }
  if ([(NSMutableArray *)self->_bundleIds count])
  {
    v48 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_bundleIds, "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v49 = self->_bundleIds;
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

    [v3 setObject:v48 forKey:@"bundleId"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPIndoorCollectionRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_meta) {
    -[CLPIndoorCollectionRequest writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteSubmessage();
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v6 = self->_indoorWifis;
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
  v11 = self->_indoorLocations;
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
  uint64_t v16 = self->_indoorCMAttitudes;
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
  v21 = self->_indoorCMPedometers;
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
  v26 = self->_indoorMotionActivitys;
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
  uint64_t v31 = self->_indoorPressures;
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
  uint64_t v36 = self->_bundleIds;
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
  return 105;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v32 = a3;
  [v32 setMeta:self->_meta];
  if ([(CLPIndoorCollectionRequest *)self indoorWifisCount])
  {
    [v32 clearIndoorWifis];
    unint64_t v4 = [(CLPIndoorCollectionRequest *)self indoorWifisCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(CLPIndoorCollectionRequest *)self indoorWifisAtIndex:i];
        [v32 addIndoorWifis:v7];
      }
    }
  }
  if ([(CLPIndoorCollectionRequest *)self indoorLocationsCount])
  {
    [v32 clearIndoorLocations];
    unint64_t v8 = [(CLPIndoorCollectionRequest *)self indoorLocationsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        v11 = [(CLPIndoorCollectionRequest *)self indoorLocationsAtIndex:j];
        [v32 addIndoorLocations:v11];
      }
    }
  }
  if ([(CLPIndoorCollectionRequest *)self indoorCMAttitudesCount])
  {
    [v32 clearIndoorCMAttitudes];
    unint64_t v12 = [(CLPIndoorCollectionRequest *)self indoorCMAttitudesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(CLPIndoorCollectionRequest *)self indoorCMAttitudeAtIndex:k];
        [v32 addIndoorCMAttitude:v15];
      }
    }
  }
  if ([(CLPIndoorCollectionRequest *)self indoorCMPedometersCount])
  {
    [v32 clearIndoorCMPedometers];
    unint64_t v16 = [(CLPIndoorCollectionRequest *)self indoorCMPedometersCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(CLPIndoorCollectionRequest *)self indoorCMPedometerAtIndex:m];
        [v32 addIndoorCMPedometer:v19];
      }
    }
  }
  if ([(CLPIndoorCollectionRequest *)self indoorMotionActivitysCount])
  {
    [v32 clearIndoorMotionActivitys];
    unint64_t v20 = [(CLPIndoorCollectionRequest *)self indoorMotionActivitysCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(CLPIndoorCollectionRequest *)self indoorMotionActivityAtIndex:n];
        [v32 addIndoorMotionActivity:v23];
      }
    }
  }
  if ([(CLPIndoorCollectionRequest *)self indoorPressuresCount])
  {
    [v32 clearIndoorPressures];
    unint64_t v24 = [(CLPIndoorCollectionRequest *)self indoorPressuresCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (iuint64_t i = 0; ii != v25; ++ii)
      {
        uint64_t v27 = [(CLPIndoorCollectionRequest *)self indoorPressureAtIndex:ii];
        [v32 addIndoorPressure:v27];
      }
    }
  }
  if ([(CLPIndoorCollectionRequest *)self bundleIdsCount])
  {
    [v32 clearBundleIds];
    unint64_t v28 = [(CLPIndoorCollectionRequest *)self bundleIdsCount];
    if (v28)
    {
      unint64_t v29 = v28;
      for (juint64_t j = 0; jj != v29; ++jj)
      {
        uint64_t v31 = [(CLPIndoorCollectionRequest *)self bundleIdAtIndex:jj];
        [v32 addBundleId:v31];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPMeta *)self->_meta copyWithZone:a3];
  uint64_t v7 = (void *)v5[8];
  v5[8] = v6;

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  unint64_t v8 = self->_indoorWifis;
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
        [v5 addIndoorWifis:v13];

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
  uint64_t v14 = self->_indoorLocations;
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
        [v5 addIndoorLocations:v19];

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
  unint64_t v20 = self->_indoorCMAttitudes;
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
        [v5 addIndoorCMAttitude:v25];

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
  v26 = self->_indoorCMPedometers;
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
        [v5 addIndoorCMPedometer:v31];

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
  id v32 = self->_indoorMotionActivitys;
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
        [v5 addIndoorMotionActivity:v37];

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
  uint64_t v38 = self->_indoorPressures;
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
        [v5 addIndoorPressure:v43];

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
  long long v44 = self->_bundleIds;
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
        [v5 addBundleId:v49];

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
    && ((meta = self->_meta, !((unint64_t)meta | v4[8])) || -[CLPMeta isEqual:](meta, "isEqual:"))
    && ((indoorWifis = self->_indoorWifis, !((unint64_t)indoorWifis | v4[7]))
     || -[NSMutableArray isEqual:](indoorWifis, "isEqual:"))
    && ((indoorLocations = self->_indoorLocations, !((unint64_t)indoorLocations | v4[4]))
     || -[NSMutableArray isEqual:](indoorLocations, "isEqual:"))
    && ((indoorCMAttitudes = self->_indoorCMAttitudes, !((unint64_t)indoorCMAttitudes | v4[2]))
     || -[NSMutableArray isEqual:](indoorCMAttitudes, "isEqual:"))
    && ((indoorCMPedometers = self->_indoorCMPedometers, !((unint64_t)indoorCMPedometers | v4[3]))
     || -[NSMutableArray isEqual:](indoorCMPedometers, "isEqual:"))
    && ((indoorMotionActivitys = self->_indoorMotionActivitys, !((unint64_t)indoorMotionActivitys | v4[5]))
     || -[NSMutableArray isEqual:](indoorMotionActivitys, "isEqual:"))
    && ((indoorPressures = self->_indoorPressures, !((unint64_t)indoorPressures | v4[6]))
     || -[NSMutableArray isEqual:](indoorPressures, "isEqual:")))
  {
    bundleIds = self->_bundleIds;
    if ((unint64_t)bundleIds | v4[1]) {
      char v13 = -[NSMutableArray isEqual:](bundleIds, "isEqual:");
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
  uint64_t v4 = [(NSMutableArray *)self->_indoorWifis hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_indoorLocations hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_indoorCMAttitudes hash];
  uint64_t v7 = [(NSMutableArray *)self->_indoorCMPedometers hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_indoorMotionActivitys hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_indoorPressures hash];
  return v9 ^ [(NSMutableArray *)self->_bundleIds hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  meta = self->_meta;
  uint64_t v6 = *((void *)v4 + 8);
  if (meta)
  {
    if (v6) {
      -[CLPMeta mergeFrom:](meta, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[CLPIndoorCollectionRequest setMeta:](self, "setMeta:");
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v7 = *((id *)v4 + 7);
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
        [(CLPIndoorCollectionRequest *)self addIndoorWifis:*(void *)(*((void *)&v66 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v9);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v12 = *((id *)v4 + 4);
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
        [(CLPIndoorCollectionRequest *)self addIndoorLocations:*(void *)(*((void *)&v62 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v62 objects:v75 count:16];
    }
    while (v14);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v17 = *((id *)v4 + 2);
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
        [(CLPIndoorCollectionRequest *)self addIndoorCMAttitude:*(void *)(*((void *)&v58 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v58 objects:v74 count:16];
    }
    while (v19);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v22 = *((id *)v4 + 3);
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
        [(CLPIndoorCollectionRequest *)self addIndoorCMPedometer:*(void *)(*((void *)&v54 + 1) + 8 * m)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v54 objects:v73 count:16];
    }
    while (v24);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v27 = *((id *)v4 + 5);
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
        [(CLPIndoorCollectionRequest *)self addIndoorMotionActivity:*(void *)(*((void *)&v50 + 1) + 8 * n)];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v50 objects:v72 count:16];
    }
    while (v29);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v32 = *((id *)v4 + 6);
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
        [(CLPIndoorCollectionRequest *)self addIndoorPressure:*(void *)(*((void *)&v46 + 1) + 8 * ii)];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v46 objects:v71 count:16];
    }
    while (v34);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v37 = *((id *)v4 + 1);
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
        -[CLPIndoorCollectionRequest addBundleId:](self, "addBundleId:", *(void *)(*((void *)&v42 + 1) + 8 * jj), (void)v42);
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

- (NSMutableArray)indoorWifis
{
  return self->_indoorWifis;
}

- (void)setIndoorWifis:(id)a3
{
}

- (NSMutableArray)indoorLocations
{
  return self->_indoorLocations;
}

- (void)setIndoorLocations:(id)a3
{
}

- (NSMutableArray)indoorCMAttitudes
{
  return self->_indoorCMAttitudes;
}

- (void)setIndoorCMAttitudes:(id)a3
{
}

- (NSMutableArray)indoorCMPedometers
{
  return self->_indoorCMPedometers;
}

- (void)setIndoorCMPedometers:(id)a3
{
}

- (NSMutableArray)indoorMotionActivitys
{
  return self->_indoorMotionActivitys;
}

- (void)setIndoorMotionActivitys:(id)a3
{
}

- (NSMutableArray)indoorPressures
{
  return self->_indoorPressures;
}

- (void)setIndoorPressures:(id)a3
{
}

- (NSMutableArray)bundleIds
{
  return self->_bundleIds;
}

- (void)setBundleIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_indoorWifis, 0);
  objc_storeStrong((id *)&self->_indoorPressures, 0);
  objc_storeStrong((id *)&self->_indoorMotionActivitys, 0);
  objc_storeStrong((id *)&self->_indoorLocations, 0);
  objc_storeStrong((id *)&self->_indoorCMPedometers, 0);
  objc_storeStrong((id *)&self->_indoorCMAttitudes, 0);

  objc_storeStrong((id *)&self->_bundleIds, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPIndoorCollectionRequest writeTo:]", "CLPCollectionRequest.gen.m", 9490, "self->_meta != nil");
}

@end