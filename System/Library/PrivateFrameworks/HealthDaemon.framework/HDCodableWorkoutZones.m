@interface HDCodableWorkoutZones
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasSample;
- (BOOL)hasZones;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (NSData)zones;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSample:(id)a3;
- (void)setZones:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableWorkoutZones

- (BOOL)applyToObject:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(HDCodableWorkoutZones *)self sample],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 applyToObject:v4],
        v5,
        v6))
  {
    v7 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v8 = objc_opt_class();
    v9 = [(HDCodableWorkoutZones *)self zones];
    id v15 = 0;
    v10 = [v7 unarchivedArrayOfObjectsOfClass:v8 fromData:v9 error:&v15];
    id v11 = v15;

    BOOL v12 = v10 != 0;
    if (v10)
    {
      [v4 _setZones:v10];
    }
    else
    {
      _HKInitializeLogging();
      v13 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v11;
        _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "Error unarchiving zones: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (BOOL)hasZones
{
  return self->_zones != 0;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableWorkoutZones;
  id v4 = [(HDCodableWorkoutZones *)&v8 description];
  v5 = [(HDCodableWorkoutZones *)self dictionaryRepresentation];
  int v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sample = self->_sample;
  if (sample)
  {
    v5 = [(HDCodableSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }
  zones = self->_zones;
  if (zones) {
    [v3 setObject:zones forKey:@"zones"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutZonesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_zones)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    id v4 = v5;
  }
  if (self->_zones)
  {
    objc_msgSend(v5, "setZones:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_zones copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((sample = self->_sample, !((unint64_t)sample | v4[1])) || -[HDCodableSample isEqual:](sample, "isEqual:")))
  {
    zones = self->_zones;
    if ((unint64_t)zones | v4[2]) {
      char v7 = -[NSData isEqual:](zones, "isEqual:");
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
  unint64_t v3 = [(HDCodableSample *)self->_sample hash];
  return [(NSData *)self->_zones hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = v4[1];
  char v7 = v4;
  if (sample)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableWorkoutZones setSample:](self, "setSample:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[HDCodableWorkoutZones setZones:](self, "setZones:");
    id v4 = v7;
  }
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (NSData)zones
{
  return self->_zones;
}

- (void)setZones:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zones, 0);

  objc_storeStrong((id *)&self->_sample, 0);
}

@end