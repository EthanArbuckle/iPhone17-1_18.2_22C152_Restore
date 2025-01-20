@interface ABCPbSigConfigWhitelist
+ (Class)sigConfigType;
- (BOOL)hasBuild;
- (BOOL)hasBuildVariant;
- (BOOL)hasDeviceModel;
- (BOOL)hasGlobalDecision;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)sigConfigs;
- (NSString)build;
- (NSString)buildVariant;
- (NSString)deviceModel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)globalDecisionAsString:(int)a3;
- (id)sigConfigAtIndex:(unint64_t)a3;
- (int)StringAsGlobalDecision:(id)a3;
- (int)globalDecision;
- (unint64_t)hash;
- (unint64_t)sigConfigsCount;
- (void)addSigConfig:(id)a3;
- (void)clearSigConfigs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuild:(id)a3;
- (void)setBuildVariant:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setGlobalDecision:(int)a3;
- (void)setHasGlobalDecision:(BOOL)a3;
- (void)setSigConfigs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABCPbSigConfigWhitelist

- (int)globalDecision
{
  if (*(unsigned char *)&self->_has) {
    return self->_globalDecision;
  }
  else {
    return 0;
  }
}

- (void)setGlobalDecision:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_globalDecision = a3;
}

- (void)setHasGlobalDecision:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGlobalDecision
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)globalDecisionAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_263FC4450[a3];
  }

  return v3;
}

- (int)StringAsGlobalDecision:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NO_WHITELIST"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"USE_OLD_ONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FOLLOW_SIG_CONFIG"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (BOOL)hasBuildVariant
{
  return self->_buildVariant != 0;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (void)clearSigConfigs
{
}

- (void)addSigConfig:(id)a3
{
  id v4 = a3;
  sigConfigs = self->_sigConfigs;
  id v8 = v4;
  if (!sigConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_sigConfigs;
    self->_sigConfigs = v6;

    id v4 = v8;
    sigConfigs = self->_sigConfigs;
  }
  [(NSMutableArray *)sigConfigs addObject:v4];
}

- (unint64_t)sigConfigsCount
{
  return [(NSMutableArray *)self->_sigConfigs count];
}

- (id)sigConfigAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sigConfigs objectAtIndex:a3];
}

+ (Class)sigConfigType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ABCPbSigConfigWhitelist;
  id v4 = [(ABCPbSigConfigWhitelist *)&v8 description];
  v5 = [(ABCPbSigConfigWhitelist *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t globalDecision = self->_globalDecision;
    if (globalDecision >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_globalDecision);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_263FC4450[globalDecision];
    }
    [v3 setObject:v5 forKey:@"global_decision"];
  }
  build = self->_build;
  if (build) {
    [v3 setObject:build forKey:@"build"];
  }
  buildVariant = self->_buildVariant;
  if (buildVariant) {
    [v3 setObject:buildVariant forKey:@"build_variant"];
  }
  deviceModel = self->_deviceModel;
  if (deviceModel) {
    [v3 setObject:deviceModel forKey:@"device_model"];
  }
  if ([(NSMutableArray *)self->_sigConfigs count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_sigConfigs, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = self->_sigConfigs;
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
          v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"sig_config"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSigConfigWhitelistReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_build) {
    PBDataWriterWriteStringField();
  }
  if (self->_buildVariant) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceModel) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_sigConfigs;
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
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[8] = self->_globalDecision;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v9 = v4;
  if (self->_build) {
    objc_msgSend(v4, "setBuild:");
  }
  if (self->_buildVariant) {
    objc_msgSend(v9, "setBuildVariant:");
  }
  if (self->_deviceModel) {
    objc_msgSend(v9, "setDeviceModel:");
  }
  if ([(ABCPbSigConfigWhitelist *)self sigConfigsCount])
  {
    [v9 clearSigConfigs];
    unint64_t v5 = [(ABCPbSigConfigWhitelist *)self sigConfigsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ABCPbSigConfigWhitelist *)self sigConfigAtIndex:i];
        [v9 addSigConfig:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_globalDecision;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_build copyWithZone:a3];
  uint64_t v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = [(NSString *)self->_buildVariant copyWithZone:a3];
  long long v10 = (void *)v6[2];
  v6[2] = v9;

  uint64_t v11 = [(NSString *)self->_deviceModel copyWithZone:a3];
  long long v12 = (void *)v6[3];
  v6[3] = v11;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = self->_sigConfigs;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (void)v20);
        [v6 addSigConfig:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_globalDecision != *((_DWORD *)v4 + 8)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  build = self->_build;
  if ((unint64_t)build | *((void *)v4 + 1) && !-[NSString isEqual:](build, "isEqual:")) {
    goto LABEL_15;
  }
  buildVariant = self->_buildVariant;
  if ((unint64_t)buildVariant | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](buildVariant, "isEqual:")) {
      goto LABEL_15;
    }
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:")) {
      goto LABEL_15;
    }
  }
  sigConfigs = self->_sigConfigs;
  if ((unint64_t)sigConfigs | *((void *)v4 + 5)) {
    char v9 = -[NSMutableArray isEqual:](sigConfigs, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_globalDecision;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_build hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_buildVariant hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_deviceModel hash];
  return v6 ^ [(NSMutableArray *)self->_sigConfigs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  NSUInteger v4 = a3;
  id v5 = v4;
  if (v4[12])
  {
    self->_uint64_t globalDecision = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1)) {
    -[ABCPbSigConfigWhitelist setBuild:](self, "setBuild:");
  }
  if (*((void *)v5 + 2)) {
    -[ABCPbSigConfigWhitelist setBuildVariant:](self, "setBuildVariant:");
  }
  if (*((void *)v5 + 3)) {
    -[ABCPbSigConfigWhitelist setDeviceModel:](self, "setDeviceModel:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v5 + 5);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[ABCPbSigConfigWhitelist addSigConfig:](self, "addSigConfig:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
}

- (NSString)buildVariant
{
  return self->_buildVariant;
}

- (void)setBuildVariant:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSMutableArray)sigConfigs
{
  return self->_sigConfigs;
}

- (void)setSigConfigs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigConfigs, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_buildVariant, 0);

  objc_storeStrong((id *)&self->_build, 0);
}

@end