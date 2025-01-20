@interface HDCloudSyncCodableMedicalID
+ (Class)medicalIDLogsType;
- (BOOL)hasMedicalIDData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableMedicalIDData)medicalIDData;
- (NSMutableArray)medicalIDLogs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)medicalIDLogsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)medicalIDLogsCount;
- (void)addMedicalIDLogs:(id)a3;
- (void)clearMedicalIDLogs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMedicalIDData:(id)a3;
- (void)setMedicalIDLogs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCloudSyncCodableMedicalID

- (BOOL)hasMedicalIDData
{
  return self->_medicalIDData != 0;
}

- (void)clearMedicalIDLogs
{
}

- (void)addMedicalIDLogs:(id)a3
{
  id v4 = a3;
  medicalIDLogs = self->_medicalIDLogs;
  id v8 = v4;
  if (!medicalIDLogs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_medicalIDLogs;
    self->_medicalIDLogs = v6;

    id v4 = v8;
    medicalIDLogs = self->_medicalIDLogs;
  }
  [(NSMutableArray *)medicalIDLogs addObject:v4];
}

- (unint64_t)medicalIDLogsCount
{
  return [(NSMutableArray *)self->_medicalIDLogs count];
}

- (id)medicalIDLogsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_medicalIDLogs objectAtIndex:a3];
}

+ (Class)medicalIDLogsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableMedicalID;
  id v4 = [(HDCloudSyncCodableMedicalID *)&v8 description];
  v5 = [(HDCloudSyncCodableMedicalID *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  medicalIDData = self->_medicalIDData;
  if (medicalIDData)
  {
    v5 = [(HDCodableMedicalIDData *)medicalIDData dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"medicalIDData"];
  }
  if ([(NSMutableArray *)self->_medicalIDLogs count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_medicalIDLogs, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_medicalIDLogs;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"medicalIDLogs"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableMedicalIDReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_medicalIDData) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_medicalIDLogs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_medicalIDData) {
    objc_msgSend(v8, "setMedicalIDData:");
  }
  if ([(HDCloudSyncCodableMedicalID *)self medicalIDLogsCount])
  {
    [v8 clearMedicalIDLogs];
    unint64_t v4 = [(HDCloudSyncCodableMedicalID *)self medicalIDLogsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCloudSyncCodableMedicalID *)self medicalIDLogsAtIndex:i];
        [v8 addMedicalIDLogs:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableMedicalIDData *)self->_medicalIDData copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_medicalIDLogs;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addMedicalIDLogs:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((medicalIDData = self->_medicalIDData, !((unint64_t)medicalIDData | v4[1]))
     || -[HDCodableMedicalIDData isEqual:](medicalIDData, "isEqual:")))
  {
    medicalIDLogs = self->_medicalIDLogs;
    if ((unint64_t)medicalIDLogs | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](medicalIDLogs, "isEqual:");
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
  unint64_t v3 = [(HDCodableMedicalIDData *)self->_medicalIDData hash];
  return [(NSMutableArray *)self->_medicalIDLogs hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  medicalIDData = self->_medicalIDData;
  uint64_t v6 = *((void *)v4 + 1);
  if (medicalIDData)
  {
    if (v6) {
      -[HDCodableMedicalIDData mergeFrom:](medicalIDData, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HDCloudSyncCodableMedicalID setMedicalIDData:](self, "setMedicalIDData:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[HDCloudSyncCodableMedicalID addMedicalIDLogs:](self, "addMedicalIDLogs:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (HDCodableMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
}

- (NSMutableArray)medicalIDLogs
{
  return self->_medicalIDLogs;
}

- (void)setMedicalIDLogs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDLogs, 0);

  objc_storeStrong((id *)&self->_medicalIDData, 0);
}

@end