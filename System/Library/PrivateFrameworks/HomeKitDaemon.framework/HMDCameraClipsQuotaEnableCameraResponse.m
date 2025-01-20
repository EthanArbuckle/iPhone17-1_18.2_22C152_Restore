@interface HMDCameraClipsQuotaEnableCameraResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation HMDCameraClipsQuotaEnableCameraResponse

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v3 init];
}

- (BOOL)readFrom:(id)a3
{
  char v4 = (int *)MEMORY[0x263F62298];
  v5 = (int *)MEMORY[0x263F62288];
  v6 = (int *)MEMORY[0x263F62270];
  v7 = (int *)MEMORY[0x263F62268];
  while (1)
  {
    int v8 = *((unsigned __int8 *)a3 + *v6);
    if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
      return v8 == 0;
    }
    if (*((unsigned char *)a3 + *v6))
    {
      int v8 = 1;
      return v8 == 0;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = *v4;
      unint64_t v13 = *(void *)((char *)a3 + v12);
      if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v13);
      *(void *)((char *)a3 + v12) = v13 + 1;
      v11 |= (unint64_t)(v14 & 0x7F) << v9;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v9 += 7;
      if (v10++ >= 9)
      {
        LOBYTE(v11) = 0;
        int v8 = *((unsigned __int8 *)a3 + *v6);
        goto LABEL_14;
      }
    }
    *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
    int v8 = *((unsigned __int8 *)a3 + *v6);
    if (*((unsigned char *)a3 + *v6)) {
      LOBYTE(v11) = 0;
    }
LABEL_14:
    if (v8) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = (v11 & 7) == 4;
    }
    if (v16) {
      return v8 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

- (id)dictionaryRepresentation
{
  return (id)[MEMORY[0x263EFF9A0] dictionary];
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDCameraClipsQuotaEnableCameraResponse;
  char v4 = [(HMDCameraClipsQuotaEnableCameraResponse *)&v8 description];
  v5 = [(HMDCameraClipsQuotaEnableCameraResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

@end