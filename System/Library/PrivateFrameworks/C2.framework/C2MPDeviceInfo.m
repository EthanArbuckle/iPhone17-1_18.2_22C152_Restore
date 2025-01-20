@interface C2MPDeviceInfo
+ (Class)internalTestConfigType;
- (BOOL)hasIsAppleInternal;
- (BOOL)hasProcessName;
- (BOOL)hasProcessUuid;
- (BOOL)hasProcessVersion;
- (BOOL)hasProductBuild;
- (BOOL)hasProductName;
- (BOOL)hasProductType;
- (BOOL)hasProductVersion;
- (BOOL)hasUserDefaultTestName;
- (BOOL)isAppleInternal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)internalTestConfigs;
- (NSString)processName;
- (NSString)processUuid;
- (NSString)processVersion;
- (NSString)productBuild;
- (NSString)productName;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)userDefaultTestName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)internalTestConfigAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)internalTestConfigsCount;
- (void)addInternalTestConfig:(id)a3;
- (void)clearInternalTestConfigs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsAppleInternal:(BOOL)a3;
- (void)setInternalTestConfigs:(id)a3;
- (void)setIsAppleInternal:(BOOL)a3;
- (void)setProcessName:(id)a3;
- (void)setProcessUuid:(id)a3;
- (void)setProcessVersion:(id)a3;
- (void)setProductBuild:(id)a3;
- (void)setProductName:(id)a3;
- (void)setProductType:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setUserDefaultTestName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation C2MPDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultTestName, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_productBuild, 0);
  objc_storeStrong((id *)&self->_processVersion, 0);
  objc_storeStrong((id *)&self->_processUuid, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_internalTestConfigs, 0);
}

- (void)setProcessUuid:(id)a3
{
}

- (void)setUserDefaultTestName:(id)a3
{
}

- (void)setProductVersion:(id)a3
{
}

- (void)setProductType:(id)a3
{
}

- (void)setProductName:(id)a3
{
}

- (void)setProductBuild:(id)a3
{
}

- (void)setProcessVersion:(id)a3
{
}

- (void)setProcessName:(id)a3
{
}

- (void)setIsAppleInternal:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isAppleInternal = a3;
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  productName = self->_productName;
  if (productName) {
    [v3 setObject:productName forKey:@"product_name"];
  }
  productType = self->_productType;
  if (productType) {
    [v4 setObject:productType forKey:@"product_type"];
  }
  productVersion = self->_productVersion;
  if (productVersion) {
    [v4 setObject:productVersion forKey:@"product_version"];
  }
  productBuild = self->_productBuild;
  if (productBuild) {
    [v4 setObject:productBuild forKey:@"product_build"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithBool:self->_isAppleInternal];
    [v4 setObject:v9 forKey:@"is_apple_internal"];
  }
  processName = self->_processName;
  if (processName) {
    [v4 setObject:processName forKey:@"process_name"];
  }
  processVersion = self->_processVersion;
  if (processVersion) {
    [v4 setObject:processVersion forKey:@"process_version"];
  }
  processUuid = self->_processUuid;
  if (processUuid) {
    [v4 setObject:processUuid forKey:@"process_uuid"];
  }
  userDefaultTestName = self->_userDefaultTestName;
  if (userDefaultTestName) {
    [v4 setObject:userDefaultTestName forKey:@"user_default_test_name"];
  }
  if ([(NSMutableArray *)self->_internalTestConfigs count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_internalTestConfigs, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = self->_internalTestConfigs;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (void)v22);
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }

    [v4 setObject:v14 forKey:@"internal_test_config"];
  }
  return v4;
}

- (BOOL)hasProductName
{
  return self->_productName != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (BOOL)hasProductVersion
{
  return self->_productVersion != 0;
}

- (BOOL)hasProductBuild
{
  return self->_productBuild != 0;
}

- (void)setHasIsAppleInternal:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsAppleInternal
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasProcessName
{
  return self->_processName != 0;
}

- (BOOL)hasProcessVersion
{
  return self->_processVersion != 0;
}

- (BOOL)hasProcessUuid
{
  return self->_processUuid != 0;
}

- (BOOL)hasUserDefaultTestName
{
  return self->_userDefaultTestName != 0;
}

- (void)clearInternalTestConfigs
{
}

- (void)addInternalTestConfig:(id)a3
{
  id v4 = a3;
  internalTestConfigs = self->_internalTestConfigs;
  id v8 = v4;
  if (!internalTestConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_internalTestConfigs;
    self->_internalTestConfigs = v6;

    id v4 = v8;
    internalTestConfigs = self->_internalTestConfigs;
  }
  [(NSMutableArray *)internalTestConfigs addObject:v4];
}

- (unint64_t)internalTestConfigsCount
{
  return [(NSMutableArray *)self->_internalTestConfigs count];
}

- (id)internalTestConfigAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_internalTestConfigs objectAtIndex:a3];
}

+ (Class)internalTestConfigType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)C2MPDeviceInfo;
  id v4 = [(C2MPDeviceInfo *)&v8 description];
  v5 = [(C2MPDeviceInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return C2MPDeviceInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_productName) {
    PBDataWriterWriteStringField();
  }
  if (self->_productType) {
    PBDataWriterWriteStringField();
  }
  if (self->_productVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_productBuild) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_processName) {
    PBDataWriterWriteStringField();
  }
  if (self->_processVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_processUuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_userDefaultTestName) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_internalTestConfigs;
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
  uint64_t v9 = v4;
  if (self->_productName)
  {
    objc_msgSend(v4, "setProductName:");
    id v4 = v9;
  }
  if (self->_productType)
  {
    objc_msgSend(v9, "setProductType:");
    id v4 = v9;
  }
  if (self->_productVersion)
  {
    objc_msgSend(v9, "setProductVersion:");
    id v4 = v9;
  }
  if (self->_productBuild)
  {
    objc_msgSend(v9, "setProductBuild:");
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[80] = self->_isAppleInternal;
    v4[84] |= 1u;
  }
  if (self->_processName) {
    objc_msgSend(v9, "setProcessName:");
  }
  if (self->_processVersion) {
    objc_msgSend(v9, "setProcessVersion:");
  }
  if (self->_processUuid) {
    objc_msgSend(v9, "setProcessUuid:");
  }
  if (self->_userDefaultTestName) {
    objc_msgSend(v9, "setUserDefaultTestName:");
  }
  if ([(C2MPDeviceInfo *)self internalTestConfigsCount])
  {
    [v9 clearInternalTestConfigs];
    unint64_t v5 = [(C2MPDeviceInfo *)self internalTestConfigsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(C2MPDeviceInfo *)self internalTestConfigAtIndex:i];
        [v9 addInternalTestConfig:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_productName copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_productType copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  uint64_t v10 = [(NSString *)self->_productVersion copyWithZone:a3];
  long long v11 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v10;

  uint64_t v12 = [(NSString *)self->_productBuild copyWithZone:a3];
  long long v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 80) = self->_isAppleInternal;
    *(unsigned char *)(v5 + 84) |= 1u;
  }
  uint64_t v14 = [(NSString *)self->_processName copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  uint64_t v16 = [(NSString *)self->_processVersion copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  uint64_t v18 = [(NSString *)self->_processUuid copyWithZone:a3];
  v19 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v18;

  uint64_t v20 = [(NSString *)self->_userDefaultTestName copyWithZone:a3];
  v21 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v20;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v22 = self->_internalTestConfigs;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v26), "copyWithZone:", a3, (void)v29);
        [(id)v5 addInternalTestConfig:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v24);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  productName = self->_productName;
  if ((unint64_t)productName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](productName, "isEqual:")) {
      goto LABEL_28;
    }
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](productType, "isEqual:")) {
      goto LABEL_28;
    }
  }
  productVersion = self->_productVersion;
  if ((unint64_t)productVersion | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](productVersion, "isEqual:")) {
      goto LABEL_28;
    }
  }
  productBuild = self->_productBuild;
  if ((unint64_t)productBuild | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](productBuild, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 84))
    {
      if (self->_isAppleInternal)
      {
        if (!*((unsigned char *)v4 + 80)) {
          goto LABEL_28;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_18;
      }
    }
LABEL_28:
    char v14 = 0;
    goto LABEL_29;
  }
  if (*((unsigned char *)v4 + 84)) {
    goto LABEL_28;
  }
LABEL_18:
  processName = self->_processName;
  if ((unint64_t)processName | *((void *)v4 + 2)
    && !-[NSString isEqual:](processName, "isEqual:"))
  {
    goto LABEL_28;
  }
  processVersion = self->_processVersion;
  if ((unint64_t)processVersion | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](processVersion, "isEqual:")) {
      goto LABEL_28;
    }
  }
  processUuid = self->_processUuid;
  if ((unint64_t)processUuid | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](processUuid, "isEqual:")) {
      goto LABEL_28;
    }
  }
  userDefaultTestName = self->_userDefaultTestName;
  if ((unint64_t)userDefaultTestName | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](userDefaultTestName, "isEqual:")) {
      goto LABEL_28;
    }
  }
  internalTestConfigs = self->_internalTestConfigs;
  if ((unint64_t)internalTestConfigs | *((void *)v4 + 1)) {
    char v14 = -[NSMutableArray isEqual:](internalTestConfigs, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_29:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_productName hash];
  NSUInteger v4 = [(NSString *)self->_productType hash];
  NSUInteger v5 = [(NSString *)self->_productVersion hash];
  NSUInteger v6 = [(NSString *)self->_productBuild hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_isAppleInternal;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v9 = v7 ^ [(NSString *)self->_processName hash];
  NSUInteger v10 = v8 ^ v9 ^ [(NSString *)self->_processVersion hash];
  NSUInteger v11 = [(NSString *)self->_processUuid hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_userDefaultTestName hash];
  return v10 ^ v12 ^ [(NSMutableArray *)self->_internalTestConfigs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 6)) {
    -[C2MPDeviceInfo setProductName:](self, "setProductName:");
  }
  if (*((void *)v4 + 7)) {
    -[C2MPDeviceInfo setProductType:](self, "setProductType:");
  }
  if (*((void *)v4 + 8)) {
    -[C2MPDeviceInfo setProductVersion:](self, "setProductVersion:");
  }
  if (*((void *)v4 + 5)) {
    -[C2MPDeviceInfo setProductBuild:](self, "setProductBuild:");
  }
  if (*((unsigned char *)v4 + 84))
  {
    self->_isAppleInternal = *((unsigned char *)v4 + 80);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[C2MPDeviceInfo setProcessName:](self, "setProcessName:");
  }
  if (*((void *)v4 + 4)) {
    -[C2MPDeviceInfo setProcessVersion:](self, "setProcessVersion:");
  }
  if (*((void *)v4 + 3)) {
    -[C2MPDeviceInfo setProcessUuid:](self, "setProcessUuid:");
  }
  if (*((void *)v4 + 9)) {
    -[C2MPDeviceInfo setUserDefaultTestName:](self, "setUserDefaultTestName:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
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
        -[C2MPDeviceInfo addInternalTestConfig:](self, "addInternalTestConfig:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)productName
{
  return self->_productName;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (NSString)productBuild
{
  return self->_productBuild;
}

- (BOOL)isAppleInternal
{
  return self->_isAppleInternal;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)processVersion
{
  return self->_processVersion;
}

- (NSString)processUuid
{
  return self->_processUuid;
}

- (NSString)userDefaultTestName
{
  return self->_userDefaultTestName;
}

- (NSMutableArray)internalTestConfigs
{
  return self->_internalTestConfigs;
}

- (void)setInternalTestConfigs:(id)a3
{
}

@end