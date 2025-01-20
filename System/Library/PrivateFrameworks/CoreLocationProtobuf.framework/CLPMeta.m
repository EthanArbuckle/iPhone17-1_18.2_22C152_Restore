@interface CLPMeta
+ (Class)regulatoryDomainEstimatesType;
- (BOOL)hasProbeId;
- (BOOL)hasSubmissionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)regulatoryDomainEstimates;
- (NSString)probeId;
- (NSString)productId;
- (NSString)softwareVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)regulatoryDomainEstimatesAtIndex:(unint64_t)a3;
- (int64_t)submissionId;
- (unint64_t)hash;
- (unint64_t)regulatoryDomainEstimatesCount;
- (void)addRegulatoryDomainEstimates:(id)a3;
- (void)clearRegulatoryDomainEstimates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSubmissionId:(BOOL)a3;
- (void)setProbeId:(id)a3;
- (void)setProductId:(id)a3;
- (void)setRegulatoryDomainEstimates:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setSubmissionId:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPMeta

- (void)setSubmissionId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_submissionId = a3;
}

- (void)setHasSubmissionId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSubmissionId
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasProbeId
{
  return self->_probeId != 0;
}

- (void)clearRegulatoryDomainEstimates
{
}

- (void)addRegulatoryDomainEstimates:(id)a3
{
  id v4 = a3;
  regulatoryDomainEstimates = self->_regulatoryDomainEstimates;
  id v8 = v4;
  if (!regulatoryDomainEstimates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_regulatoryDomainEstimates;
    self->_regulatoryDomainEstimates = v6;

    id v4 = v8;
    regulatoryDomainEstimates = self->_regulatoryDomainEstimates;
  }
  [(NSMutableArray *)regulatoryDomainEstimates addObject:v4];
}

- (unint64_t)regulatoryDomainEstimatesCount
{
  return [(NSMutableArray *)self->_regulatoryDomainEstimates count];
}

- (id)regulatoryDomainEstimatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_regulatoryDomainEstimates objectAtIndex:a3];
}

+ (Class)regulatoryDomainEstimatesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPMeta;
  id v4 = [(CLPMeta *)&v8 description];
  v5 = [(CLPMeta *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  productId = self->_productId;
  if (productId) {
    [v3 setObject:productId forKey:@"productId"];
  }
  softwareVersion = self->_softwareVersion;
  if (softwareVersion) {
    [v4 setObject:softwareVersion forKey:@"softwareVersion"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithLongLong:self->_submissionId];
    [v4 setObject:v7 forKey:@"submissionId"];
  }
  probeId = self->_probeId;
  if (probeId) {
    [v4 setObject:probeId forKey:@"probeId"];
  }
  if ([(NSMutableArray *)self->_regulatoryDomainEstimates count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_regulatoryDomainEstimates, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = self->_regulatoryDomainEstimates;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v4 setObject:v9 forKey:@"regulatoryDomainEstimates"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CLPMetaReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_productId) {
    -[CLPMeta writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_softwareVersion) {
    -[CLPMeta writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_probeId) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_regulatoryDomainEstimates;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setProductId:self->_productId];
  [v8 setSoftwareVersion:self->_softwareVersion];
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v8 + 1) = self->_submissionId;
    *((unsigned char *)v8 + 48) |= 1u;
  }
  if (self->_probeId) {
    objc_msgSend(v8, "setProbeId:");
  }
  if ([(CLPMeta *)self regulatoryDomainEstimatesCount])
  {
    [v8 clearRegulatoryDomainEstimates];
    unint64_t v4 = [(CLPMeta *)self regulatoryDomainEstimatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(CLPMeta *)self regulatoryDomainEstimatesAtIndex:i];
        [v8 addRegulatoryDomainEstimates:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_productId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_softwareVersion copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_submissionId;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_probeId copyWithZone:a3];
  long long v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_regulatoryDomainEstimates;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
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
        [(id)v5 addRegulatoryDomainEstimates:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  productId = self->_productId;
  if ((unint64_t)productId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](productId, "isEqual:")) {
      goto LABEL_15;
    }
  }
  softwareVersion = self->_softwareVersion;
  if ((unint64_t)softwareVersion | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](softwareVersion, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_submissionId != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  probeId = self->_probeId;
  if ((unint64_t)probeId | *((void *)v4 + 2) && !-[NSString isEqual:](probeId, "isEqual:")) {
    goto LABEL_15;
  }
  regulatoryDomainEstimates = self->_regulatoryDomainEstimates;
  if ((unint64_t)regulatoryDomainEstimates | *((void *)v4 + 4)) {
    char v9 = -[NSMutableArray isEqual:](regulatoryDomainEstimates, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_productId hash];
  NSUInteger v4 = [(NSString *)self->_softwareVersion hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_submissionId;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_probeId hash];
  return v6 ^ [(NSMutableArray *)self->_regulatoryDomainEstimates hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[CLPMeta setProductId:](self, "setProductId:");
  }
  if (*((void *)v4 + 5)) {
    -[CLPMeta setSoftwareVersion:](self, "setSoftwareVersion:");
  }
  if (*((unsigned char *)v4 + 48))
  {
    self->_submissionId = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[CLPMeta setProbeId:](self, "setProbeId:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CLPMeta addRegulatoryDomainEstimates:](self, "addRegulatoryDomainEstimates:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)productId
{
  return self->_productId;
}

- (void)setProductId:(id)a3
{
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(id)a3
{
}

- (int64_t)submissionId
{
  return self->_submissionId;
}

- (NSString)probeId
{
  return self->_probeId;
}

- (void)setProbeId:(id)a3
{
}

- (NSMutableArray)regulatoryDomainEstimates
{
  return self->_regulatoryDomainEstimates;
}

- (void)setRegulatoryDomainEstimates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_regulatoryDomainEstimates, 0);
  objc_storeStrong((id *)&self->_productId, 0);

  objc_storeStrong((id *)&self->_probeId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPMeta writeTo:]", "CLPCollectionRequest.gen.m", 25685, "nil != self->_productId");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[CLPMeta writeTo:]", "CLPCollectionRequest.gen.m", 25690, "nil != self->_softwareVersion");
}

@end