@interface HMDCameraClipsQuotaEnableCameraMessage
- (BOOL)hasZoneName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)description;
- (NSString)zoneName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setZoneName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMDCameraClipsQuotaEnableCameraMessage

- (void).cxx_destruct
{
}

- (void)setZoneName:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[HMDCameraClipsQuotaEnableCameraMessage setZoneName:](self, "setZoneName:");
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_zoneName hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    zoneName = self->_zoneName;
    if ((unint64_t)zoneName | v4[1]) {
      char v6 = -[NSString isEqual:](zoneName, "isEqual:");
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
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_zoneName copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  zoneName = self->_zoneName;
  if (zoneName) {
    [a3 setZoneName:zoneName];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_zoneName) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x1E4F940E8];
  v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v8 = (int *)MEMORY[0x1E4F940B8];
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
        PBReaderReadString();
        v18 = (NSString *)objc_claimAutoreleasedReturnValue();
        zoneName = self->_zoneName;
        self->_zoneName = v18;
      }
      else
      {
        int v20 = PBReaderSkipValueWithTag();
        if (!v20) {
          return v20;
        }
      }
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v20) = *((unsigned char *)a3 + *v6) == 0;
  return v20;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  zoneName = self->_zoneName;
  if (zoneName) {
    [v3 setObject:zoneName forKey:@"zoneName"];
  }
  return v4;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDCameraClipsQuotaEnableCameraMessage;
  v4 = [(HMDCameraClipsQuotaEnableCameraMessage *)&v8 description];
  v5 = [(HMDCameraClipsQuotaEnableCameraMessage *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (BOOL)hasZoneName
{
  return self->_zoneName != 0;
}

@end