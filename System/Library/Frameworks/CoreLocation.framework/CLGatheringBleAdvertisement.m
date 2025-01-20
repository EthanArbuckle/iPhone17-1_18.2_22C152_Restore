@interface CLGatheringBleAdvertisement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLGatheringBleAdvertisement)initWithAddress:(id)a3 contactId:(id)a4 flags:(int64_t)a5 eFlags:(int64_t)a6 authTag:(id)a7 iTag:(id)a8 rssi:(int64_t)a9 count:(int64_t)a10 unixTime:(double)a11;
- (CLGatheringBleAdvertisement)initWithAddress:(id)a3 withAuthTag:(id)a4 withRssi:(int64_t)a5 withCount:(int64_t)a6 withTime:(double)a7;
- (CLGatheringBleAdvertisement)initWithCoder:(id)a3;
- (CLGatheringBleAdvertisement)initWithData:(id)a3;
- (CLGatheringBleAdvertisement)initWithPersistenceBytes:(id *)a3;
- (NSData)address;
- (NSData)authTag;
- (NSData)iTag;
- (NSString)contactId;
- (double)unixTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodedBytes;
- (id)getDateString:(double)a3;
- (id)hexString:(id)a3;
- (int64_t)count;
- (int64_t)eFlags;
- (int64_t)flags;
- (int64_t)rssi;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLGatheringBleAdvertisement

- (CLGatheringBleAdvertisement)initWithAddress:(id)a3 withAuthTag:(id)a4 withRssi:(int64_t)a5 withCount:(int64_t)a6 withTime:(double)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    if ((a5 & 0x80000000) == 0)
    {
      if (qword_1E929F5F0 != -1) {
        dispatch_once(&qword_1E929F5F0, &unk_1EE0061C0);
      }
      v13 = qword_1E929F610;
      if (os_log_type_enabled((os_log_t)qword_1E929F610, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        int v24 = a5;
        _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEBUG, "CLGatheringBleAdvertisement has RSSI %d!", buf, 8u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F5F0 != -1) {
          dispatch_once(&qword_1E929F5F0, &unk_1EE0061C0);
        }
        int v21 = 67109120;
        int v22 = a5;
        v19 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLGatheringBleAdvertisement initWithAddress:withAuthTag:withRssi:withCount:withTime:]", "CoreLocation: %s\n", v19);
        if (v19 != (char *)buf) {
          free(v19);
        }
      }
    }
    v20.receiver = self;
    v20.super_class = (Class)CLGatheringBleAdvertisement;
    v14 = [(CLGatheringBleAdvertisement *)&v20 init];
    if (v14)
    {
      v14->_address = (NSData *)[a3 copy];
      v14->_authTag = (NSData *)[a4 copy];
      int64_t v15 = -80;
      if ((int)a5 < 0) {
        int64_t v15 = a5;
      }
      v14->_rssi = v15;
      v14->_count = a6;
      v14->_unixTime = a7;
    }
  }
  else
  {
    if (qword_1E929F5F0 != -1) {
      dispatch_once(&qword_1E929F5F0, &unk_1EE0061C0);
    }
    v16 = qword_1E929F610;
    if (os_log_type_enabled((os_log_t)qword_1E929F610, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_ERROR, "CLGatheringBleAdvertisement cannot init if address is NULL!", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F5F0 != -1) {
        dispatch_once(&qword_1E929F5F0, &unk_1EE0061C0);
      }
      LOWORD(v21) = 0;
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLGatheringBleAdvertisement initWithAddress:withAuthTag:withRssi:withCount:withTime:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
    return 0;
  }
  return v14;
}

- (CLGatheringBleAdvertisement)initWithAddress:(id)a3 contactId:(id)a4 flags:(int64_t)a5 eFlags:(int64_t)a6 authTag:(id)a7 iTag:(id)a8 rssi:(int64_t)a9 count:(int64_t)a10 unixTime:(double)a11
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((a9 & 0x80000000) == 0)
    {
      if (qword_1E929F5F0 != -1) {
        dispatch_once(&qword_1E929F5F0, &unk_1EE0061C0);
      }
      v19 = qword_1E929F610;
      if (os_log_type_enabled((os_log_t)qword_1E929F610, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        int v33 = a9;
        _os_log_impl(&dword_1906B8000, v19, OS_LOG_TYPE_DEBUG, "CLGatheringBleAdvertisement has RSSI %d!", buf, 8u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F5F0 != -1) {
          dispatch_once(&qword_1E929F5F0, &unk_1EE0061C0);
        }
        int v30 = 67109120;
        int v31 = a9;
        v27 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLGatheringBleAdvertisement initWithAddress:contactId:flags:eFlags:authTag:iTag:rssi:count:unixTime:]", "CoreLocation: %s\n", v27);
        if (v27 != (char *)buf) {
          free(v27);
        }
      }
    }
    v29.receiver = self;
    v29.super_class = (Class)CLGatheringBleAdvertisement;
    objc_super v20 = [(CLGatheringBleAdvertisement *)&v29 init];
    if (v20)
    {
      v20->_address = (NSData *)[a3 copy];
      if (a4) {
        uint64_t v21 = [a4 copy];
      }
      else {
        uint64_t v21 = 0;
      }
      v20->_contactId = (NSString *)v21;
      v20->_flags = a5;
      v20->_eFlags = a6;
      if (a7) {
        uint64_t v23 = [a7 copy];
      }
      else {
        uint64_t v23 = 0;
      }
      v20->_authTag = (NSData *)v23;
      if (a8) {
        uint64_t v24 = [a8 copy];
      }
      else {
        uint64_t v24 = 0;
      }
      int64_t v25 = -80;
      if ((int)a9 < 0) {
        int64_t v25 = a9;
      }
      v20->_iTag = (NSData *)v24;
      v20->_rssi = v25;
      v20->_count = a10;
      v20->_unixTime = a11;
    }
  }
  else
  {
    if (qword_1E929F5F0 != -1) {
      dispatch_once(&qword_1E929F5F0, &unk_1EE0061C0);
    }
    int v22 = qword_1E929F610;
    if (os_log_type_enabled((os_log_t)qword_1E929F610, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v22, OS_LOG_TYPE_ERROR, "CLGatheringBleAdvertisement cannot init if address is NULL!", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F5F0 != -1) {
        dispatch_once(&qword_1E929F5F0, &unk_1EE0061C0);
      }
      LOWORD(v30) = 0;
      v28 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLGatheringBleAdvertisement initWithAddress:contactId:flags:eFlags:authTag:iTag:rssi:count:unixTime:]", "CoreLocation: %s\n", v28);
      if (v28 != (char *)buf) {
        free(v28);
      }
    }
    return 0;
  }
  return v20;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLGatheringBleAdvertisement;
  [(CLGatheringBleAdvertisement *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  address = self->_address;
  uint64_t v6 = [a3 address];

  return [(NSData *)address isEqualToData:v6];
}

- (unint64_t)hash
{
  return [(NSData *)self->_address hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@,%@,%@,%02x,%02x,%@,%@,%d,%d", -[CLGatheringBleAdvertisement getDateString:](self, "getDateString:", self->_unixTime), -[CLGatheringBleAdvertisement hexString:](self, "hexString:", self->_address), self->_contactId, LOBYTE(self->_flags), LOBYTE(self->_eFlags), -[CLGatheringBleAdvertisement hexString:](self, "hexString:", self->_authTag), -[CLGatheringBleAdvertisement hexString:](self, "hexString:", self->_iTag), self->_rssi, self->_count];
}

- (id)hexString:(id)a3
{
  if (!a3 || ![a3 length] || !objc_msgSend(a3, "bytes")) {
    return &stru_1EE006720;
  }
  uint64_t v4 = 2 * [a3 length];
  v5 = (char *)malloc_type_malloc(v4 | 1, 0xD7D9A0AAuLL);
  v5[v4] = 0;
  uint64_t v6 = [a3 bytes];
  if ([a3 length])
  {
    unint64_t v7 = 0;
    v8 = v5;
    do
    {
      sprintf(v8, "%02X", *(unsigned __int8 *)(v6 + v7++));
      v8 += 2;
    }
    while ([a3 length] > v7);
  }
  v9 = (void *)[[NSString alloc] initWithBytesNoCopy:v5 length:v4 encoding:1 freeWhenDone:1];

  return v9;
}

- (id)getDateString:(double)a3
{
  if (qword_1EB272528 != -1) {
    dispatch_once(&qword_1EB272528, &unk_1EE0059C0);
  }
  uint64_t v4 = (void *)qword_1EB272520;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:a3];

  return (id)[v4 stringFromDate:v5];
}

- (CLGatheringBleAdvertisement)initWithData:(id)a3
{
  if ([a3 length] != 84) {
    return 0;
  }
  [a3 bytes];

  return (CLGatheringBleAdvertisement *)MEMORY[0x1F4181798](self, sel_initWithPersistenceBytes_);
}

- (CLGatheringBleAdvertisement)initWithPersistenceBytes:(id *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CLGatheringBleAdvertisement;
  uint64_t v4 = [(CLGatheringBleAdvertisement *)&v16 init];
  if (v4)
  {
    *((void *)v4 + 1) = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3->var1 length:6];
    size_t v5 = strlen(a3->var2);
    uint64_t v6 = 50;
    if (v5 < 0x32) {
      uint64_t v6 = v5;
    }
    if (v6) {
      uint64_t v7 = [[NSString alloc] initWithUTF8String:a3->var2];
    }
    else {
      uint64_t v7 = 0;
    }
    *((void *)v4 + 2) = v7;
    int var5 = a3->var5;
    uint64_t v9 = *(void *)&a3->var3;
    *(void *)&long long v10 = (int)v9;
    *((void *)&v10 + 1) = SHIDWORD(v9);
    *(_OWORD *)(v4 + 24) = v10;
    if (var5) {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&a3->var5 length:3];
    }
    else {
      uint64_t v11 = 0;
    }
    *((void *)v4 + 5) = v11;
    if (a3->var6) {
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&a3->var6 length:3];
    }
    else {
      uint64_t v12 = 0;
    }
    *((void *)v4 + 6) = v12;
    int var8 = a3->var8;
    if (var8 >= 0) {
      int var8 = -80;
    }
    uint64_t var7 = a3->var7;
    *((void *)v4 + 7) = var8;
    *((void *)v4 + 8) = var7;
    *((void *)v4 + 9) = *(void *)&a3->var0;
  }
  return (CLGatheringBleAdvertisement *)v4;
}

- (id)encodedBytes
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v6 = 0;
  long long v5 = 0u;
  memset(v4, 0, sizeof(v4));
  -[NSData getBytes:length:](self->_address, "getBytes:length:", (char *)v4 + 8, 6, 0);
  [(NSString *)self->_contactId getCString:(unint64_t)v4 | 0xE maxLength:50 encoding:4];
  *(int8x8_t *)&long long v5 = vand_s8((int8x8_t)vmovn_s64(*(int64x2_t *)&self->_flags), (int8x8_t)0xFF000000FFLL);
  [(NSData *)self->_authTag getBytes:(char *)&v5 + 8 length:3];
  [(NSData *)self->_iTag getBytes:(char *)&v5 + 12 length:3];
  HIWORD(v6) = SLOBYTE(self->_rssi);
  LOWORD(v6) = self->_count;
  *(double *)uint64_t v4 = self->_unixTime;
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:84];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_address forKey:@"Address"];
  [a3 encodeObject:self->_contactId forKey:@"ContactId"];
  [a3 encodeInteger:self->_flags forKey:@"Flags"];
  [a3 encodeInteger:self->_eFlags forKey:@"EncryptedFlags"];
  [a3 encodeObject:self->_authTag forKey:@"AuthTag"];
  [a3 encodeObject:self->_iTag forKey:@"IntegrityTag"];
  [a3 encodeInteger:self->_rssi forKey:@"RSSI"];
  [a3 encodeInteger:self->_count forKey:@"Count"];
  double unixTime = self->_unixTime;

  [a3 encodeDouble:@"Date" forKey:unixTime];
}

- (CLGatheringBleAdvertisement)initWithCoder:(id)a3
{
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"Address"];
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"ContactId"];
  uint64_t v7 = [a3 decodeIntegerForKey:@"Flags"];
  uint64_t v8 = [a3 decodeIntegerForKey:@"EncryptedFlags"];
  uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"AuthTag"];
  uint64_t v10 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"IntegrityTag"];
  uint64_t v11 = [a3 decodeIntegerForKey:@"RSSI"];
  uint64_t v12 = [a3 decodeIntegerForKey:@"Count"];
  [a3 decodeDoubleForKey:@"Date"];
  return -[CLGatheringBleAdvertisement initWithAddress:contactId:flags:eFlags:authTag:iTag:rssi:count:unixTime:](self, "initWithAddress:contactId:flags:eFlags:authTag:iTag:rssi:count:unixTime:", v5, v6, v7, v8, v9, v10, v11, v12);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [[CLGatheringBleAdvertisement alloc] initWithAddress:self->_address contactId:self->_contactId flags:self->_flags eFlags:self->_eFlags authTag:self->_authTag iTag:self->_iTag rssi:self->_unixTime count:self->_rssi unixTime:self->_count];
}

- (NSData)address
{
  return self->_address;
}

- (NSString)contactId
{
  return self->_contactId;
}

- (int64_t)flags
{
  return self->_flags;
}

- (int64_t)eFlags
{
  return self->_eFlags;
}

- (NSData)authTag
{
  return self->_authTag;
}

- (NSData)iTag
{
  return self->_iTag;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (int64_t)count
{
  return self->_count;
}

- (double)unixTime
{
  return self->_unixTime;
}

@end