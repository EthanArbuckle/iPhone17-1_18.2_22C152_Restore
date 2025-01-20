@interface BMPBMicroLocationRestrictedLocalizationEvent
+ (Class)numDevicesVectorType;
+ (Class)probabilityVectorType;
- (BOOL)hasAbsoluteTimeStamp;
- (BOOL)hasClientBundleId;
- (BOOL)hasMaxProbability;
- (BOOL)hasMaxProbabilityLabel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)numDevicesVectors;
- (NSMutableArray)probabilityVectors;
- (NSString)clientBundleId;
- (NSString)maxProbabilityLabel;
- (double)absoluteTimeStamp;
- (double)maxProbability;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)numDevicesVectorAtIndex:(unint64_t)a3;
- (id)probabilityVectorAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)numDevicesVectorsCount;
- (unint64_t)probabilityVectorsCount;
- (void)addNumDevicesVector:(id)a3;
- (void)addProbabilityVector:(id)a3;
- (void)clearNumDevicesVectors;
- (void)clearProbabilityVectors;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimeStamp:(double)a3;
- (void)setClientBundleId:(id)a3;
- (void)setHasAbsoluteTimeStamp:(BOOL)a3;
- (void)setHasMaxProbability:(BOOL)a3;
- (void)setMaxProbability:(double)a3;
- (void)setMaxProbabilityLabel:(id)a3;
- (void)setNumDevicesVectors:(id)a3;
- (void)setProbabilityVectors:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBMicroLocationRestrictedLocalizationEvent

- (void)setAbsoluteTimeStamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_absoluteTimeStamp = a3;
}

- (void)setHasAbsoluteTimeStamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimeStamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasClientBundleId
{
  return self->_clientBundleId != 0;
}

- (BOOL)hasMaxProbabilityLabel
{
  return self->_maxProbabilityLabel != 0;
}

- (void)setMaxProbability:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_maxProbability = a3;
}

- (void)setHasMaxProbability:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaxProbability
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearProbabilityVectors
{
}

- (void)addProbabilityVector:(id)a3
{
  id v4 = a3;
  probabilityVectors = self->_probabilityVectors;
  id v8 = v4;
  if (!probabilityVectors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_probabilityVectors;
    self->_probabilityVectors = v6;

    id v4 = v8;
    probabilityVectors = self->_probabilityVectors;
  }
  [(NSMutableArray *)probabilityVectors addObject:v4];
}

- (unint64_t)probabilityVectorsCount
{
  return [(NSMutableArray *)self->_probabilityVectors count];
}

- (id)probabilityVectorAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_probabilityVectors objectAtIndex:a3];
}

+ (Class)probabilityVectorType
{
  return (Class)objc_opt_class();
}

- (void)clearNumDevicesVectors
{
}

- (void)addNumDevicesVector:(id)a3
{
  id v4 = a3;
  numDevicesVectors = self->_numDevicesVectors;
  id v8 = v4;
  if (!numDevicesVectors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_numDevicesVectors;
    self->_numDevicesVectors = v6;

    id v4 = v8;
    numDevicesVectors = self->_numDevicesVectors;
  }
  [(NSMutableArray *)numDevicesVectors addObject:v4];
}

- (unint64_t)numDevicesVectorsCount
{
  return [(NSMutableArray *)self->_numDevicesVectors count];
}

- (id)numDevicesVectorAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_numDevicesVectors objectAtIndex:a3];
}

+ (Class)numDevicesVectorType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBMicroLocationRestrictedLocalizationEvent;
  id v4 = [(BMPBMicroLocationRestrictedLocalizationEvent *)&v8 description];
  v5 = [(BMPBMicroLocationRestrictedLocalizationEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithDouble:self->_absoluteTimeStamp];
    [v3 setObject:v4 forKey:@"absoluteTimeStamp"];
  }
  clientBundleId = self->_clientBundleId;
  if (clientBundleId) {
    [v3 setObject:clientBundleId forKey:@"clientBundleId"];
  }
  maxProbabilityLabel = self->_maxProbabilityLabel;
  if (maxProbabilityLabel) {
    [v3 setObject:maxProbabilityLabel forKey:@"maxProbabilityLabel"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v7 = [NSNumber numberWithDouble:self->_maxProbability];
    [v3 setObject:v7 forKey:@"maxProbability"];
  }
  if ([(NSMutableArray *)self->_probabilityVectors count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_probabilityVectors, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v9 = self->_probabilityVectors;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v27 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"probabilityVector"];
  }
  if ([(NSMutableArray *)self->_numDevicesVectors count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_numDevicesVectors, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v16 = self->_numDevicesVectors;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "dictionaryRepresentation", (void)v23);
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"numDevicesVector"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBMicroLocationRestrictedLocalizationEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_clientBundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_maxProbabilityLabel) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_probabilityVectors;
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
  uint64_t v10 = self->_numDevicesVectors;
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
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_absoluteTimeStamp;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  uint64_t v13 = v4;
  if (self->_clientBundleId)
  {
    objc_msgSend(v4, "setClientBundleId:");
    id v4 = v13;
  }
  if (self->_maxProbabilityLabel)
  {
    objc_msgSend(v13, "setMaxProbabilityLabel:");
    id v4 = v13;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[2] = *(void *)&self->_maxProbability;
    *((unsigned char *)v4 + 56) |= 2u;
  }
  if ([(BMPBMicroLocationRestrictedLocalizationEvent *)self probabilityVectorsCount])
  {
    [v13 clearProbabilityVectors];
    unint64_t v5 = [(BMPBMicroLocationRestrictedLocalizationEvent *)self probabilityVectorsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(BMPBMicroLocationRestrictedLocalizationEvent *)self probabilityVectorAtIndex:i];
        [v13 addProbabilityVector:v8];
      }
    }
  }
  if ([(BMPBMicroLocationRestrictedLocalizationEvent *)self numDevicesVectorsCount])
  {
    [v13 clearNumDevicesVectors];
    unint64_t v9 = [(BMPBMicroLocationRestrictedLocalizationEvent *)self numDevicesVectorsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(BMPBMicroLocationRestrictedLocalizationEvent *)self numDevicesVectorAtIndex:j];
        [v13 addNumDevicesVector:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimeStamp;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_clientBundleId copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  uint64_t v9 = [(NSString *)self->_maxProbabilityLabel copyWithZone:a3];
  unint64_t v10 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v9;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(double *)(v6 + 16) = self->_maxProbability;
    *(unsigned char *)(v6 + 56) |= 2u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v11 = self->_probabilityVectors;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * v15) copyWithZone:a3];
        [(id)v6 addProbabilityVector:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v13);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v17 = self->_numDevicesVectors;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v21), "copyWithZone:", a3, (void)v24);
        [(id)v6 addNumDevicesVector:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v19);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_absoluteTimeStamp != *((double *)v4 + 1)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_20:
    char v9 = 0;
    goto LABEL_21;
  }
  clientBundleId = self->_clientBundleId;
  if ((unint64_t)clientBundleId | *((void *)v4 + 3)
    && !-[NSString isEqual:](clientBundleId, "isEqual:"))
  {
    goto LABEL_20;
  }
  maxProbabilityLabel = self->_maxProbabilityLabel;
  if ((unint64_t)maxProbabilityLabel | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](maxProbabilityLabel, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_maxProbability != *((double *)v4 + 2)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_20;
  }
  probabilityVectors = self->_probabilityVectors;
  if ((unint64_t)probabilityVectors | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](probabilityVectors, "isEqual:"))
  {
    goto LABEL_20;
  }
  numDevicesVectors = self->_numDevicesVectors;
  if ((unint64_t)numDevicesVectors | *((void *)v4 + 5)) {
    char v9 = -[NSMutableArray isEqual:](numDevicesVectors, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double absoluteTimeStamp = self->_absoluteTimeStamp;
    double v5 = -absoluteTimeStamp;
    if (absoluteTimeStamp >= 0.0) {
      double v5 = self->_absoluteTimeStamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_clientBundleId hash];
  NSUInteger v9 = [(NSString *)self->_maxProbabilityLabel hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double maxProbability = self->_maxProbability;
    double v12 = -maxProbability;
    if (maxProbability >= 0.0) {
      double v12 = self->_maxProbability;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  NSUInteger v15 = v8 ^ v3 ^ v9 ^ v10;
  uint64_t v16 = [(NSMutableArray *)self->_probabilityVectors hash];
  return v15 ^ v16 ^ [(NSMutableArray *)self->_numDevicesVectors hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = (double *)a3;
  double v5 = v4;
  if ((_BYTE)v4[7])
  {
    self->_double absoluteTimeStamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3)) {
    -[BMPBMicroLocationRestrictedLocalizationEvent setClientBundleId:](self, "setClientBundleId:");
  }
  if (*((void *)v5 + 4)) {
    -[BMPBMicroLocationRestrictedLocalizationEvent setMaxProbabilityLabel:](self, "setMaxProbabilityLabel:");
  }
  if (((_BYTE)v5[7] & 2) != 0)
  {
    self->_double maxProbability = v5[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = *((id *)v5 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [(BMPBMicroLocationRestrictedLocalizationEvent *)self addProbabilityVector:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v5 + 5);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[BMPBMicroLocationRestrictedLocalizationEvent addNumDevicesVector:](self, "addNumDevicesVector:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (double)absoluteTimeStamp
{
  return self->_absoluteTimeStamp;
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (void)setClientBundleId:(id)a3
{
}

- (NSString)maxProbabilityLabel
{
  return self->_maxProbabilityLabel;
}

- (void)setMaxProbabilityLabel:(id)a3
{
}

- (double)maxProbability
{
  return self->_maxProbability;
}

- (NSMutableArray)probabilityVectors
{
  return self->_probabilityVectors;
}

- (void)setProbabilityVectors:(id)a3
{
}

- (NSMutableArray)numDevicesVectors
{
  return self->_numDevicesVectors;
}

- (void)setNumDevicesVectors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probabilityVectors, 0);
  objc_storeStrong((id *)&self->_numDevicesVectors, 0);
  objc_storeStrong((id *)&self->_maxProbabilityLabel, 0);

  objc_storeStrong((id *)&self->_clientBundleId, 0);
}

@end