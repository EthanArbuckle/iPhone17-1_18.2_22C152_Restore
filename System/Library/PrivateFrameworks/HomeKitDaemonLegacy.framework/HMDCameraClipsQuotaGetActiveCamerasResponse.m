@interface HMDCameraClipsQuotaGetActiveCamerasResponse
+ (Class)zoneNamesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)zoneNames;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)zoneNamesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)zoneNamesCount;
- (void)addZoneNames:(id)a3;
- (void)clearZoneNames;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setZoneNames:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMDCameraClipsQuotaGetActiveCamerasResponse

- (void).cxx_destruct
{
}

- (void)setZoneNames:(id)a3
{
}

- (NSMutableArray)zoneNames
{
  return self->_zoneNames;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[HMDCameraClipsQuotaGetActiveCamerasResponse addZoneNames:](self, "addZoneNames:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_zoneNames hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    zoneNames = self->_zoneNames;
    if ((unint64_t)zoneNames | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](zoneNames, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v6 = self->_zoneNames;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addZoneNames:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(HMDCameraClipsQuotaGetActiveCamerasResponse *)self zoneNamesCount])
  {
    [v8 clearZoneNames];
    unint64_t v4 = [(HMDCameraClipsQuotaGetActiveCamerasResponse *)self zoneNamesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HMDCameraClipsQuotaGetActiveCamerasResponse *)self zoneNamesAtIndex:i];
        [v8 addZoneNames:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = self->_zoneNames;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v8 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        if (v10++ >= 9)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      if ((v11 >> 3) == 1)
      {
        uint64_t v18 = PBReaderReadString();
        if (v18) {
          [(HMDCameraClipsQuotaGetActiveCamerasResponse *)self addZoneNames:v18];
        }
      }
      else
      {
        int v19 = PBReaderSkipValueWithTag();
        if (!v19) {
          return v19;
        }
      }
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v19) = *((unsigned char *)a3 + *v6) == 0;
  return v19;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  zoneNames = self->_zoneNames;
  if (zoneNames) {
    [v3 setObject:zoneNames forKey:@"zoneNames"];
  }
  return v4;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDCameraClipsQuotaGetActiveCamerasResponse;
  id v4 = [(HMDCameraClipsQuotaGetActiveCamerasResponse *)&v8 description];
  unint64_t v5 = [(HMDCameraClipsQuotaGetActiveCamerasResponse *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)zoneNamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_zoneNames objectAtIndex:a3];
}

- (unint64_t)zoneNamesCount
{
  return [(NSMutableArray *)self->_zoneNames count];
}

- (void)addZoneNames:(id)a3
{
  id v4 = a3;
  zoneNames = self->_zoneNames;
  id v8 = v4;
  if (!zoneNames)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_zoneNames;
    self->_zoneNames = v6;

    id v4 = v8;
    zoneNames = self->_zoneNames;
  }
  [(NSMutableArray *)zoneNames addObject:v4];
}

- (void)clearZoneNames
{
}

+ (Class)zoneNamesType
{
  return (Class)objc_opt_class();
}

@end