@interface DNDSMeDeviceStore
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSMeDeviceStore)init;
- (NSNumber)meDeviceStatus;
- (NSString)description;
- (NSString)meDeviceName;
- (id)_initWithStatus:(id)a3 name:(id)a4;
- (id)_initWithStore:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation DNDSMeDeviceStore

- (DNDSMeDeviceStore)init
{
  return (DNDSMeDeviceStore *)[(DNDSMeDeviceStore *)self _initWithStore:0];
}

- (id)_initWithStore:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DNDSMeDeviceStore;
  v5 = [(DNDSMeDeviceStore *)&v14 init];
  if (v5)
  {
    v6 = [v4 meDeviceStatus];
    uint64_t v7 = [v6 copy];
    v8 = (void *)v7;
    if (v7) {
      v9 = (void *)v7;
    }
    else {
      v9 = &unk_1F2A5D8B0;
    }
    objc_storeStrong((id *)&v5->_meDeviceStatus, v9);

    v10 = [v4 meDeviceName];
    uint64_t v11 = [v10 copy];
    meDeviceName = v5->_meDeviceName;
    v5->_meDeviceName = (NSString *)v11;
  }
  return v5;
}

- (id)_initWithStatus:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DNDSMeDeviceStore;
  v9 = [(DNDSMeDeviceStore *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_meDeviceStatus, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (unint64_t)hash
{
  v3 = [(DNDSMeDeviceStore *)self meDeviceStatus];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDSMeDeviceStore *)self meDeviceName];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDSMeDeviceStore *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(DNDSMeDeviceStore *)self meDeviceStatus];
      id v7 = [(DNDSMeDeviceStore *)v5 meDeviceStatus];
      if (v6 != v7)
      {
        uint64_t v8 = [(DNDSMeDeviceStore *)self meDeviceStatus];
        if (!v8)
        {
          char v13 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v9 = (void *)v8;
        v10 = [(DNDSMeDeviceStore *)v5 meDeviceStatus];
        if (!v10)
        {
          char v13 = 0;
LABEL_23:

          goto LABEL_24;
        }
        uint64_t v11 = [(DNDSMeDeviceStore *)self meDeviceStatus];
        objc_super v12 = [(DNDSMeDeviceStore *)v5 meDeviceStatus];
        if (![v11 isEqual:v12])
        {
          char v13 = 0;
LABEL_22:

          goto LABEL_23;
        }
        v23 = v12;
        v24 = v11;
        v25 = v10;
        v26 = v9;
      }
      objc_super v14 = [(DNDSMeDeviceStore *)self meDeviceName];
      uint64_t v15 = [(DNDSMeDeviceStore *)v5 meDeviceName];
      if (v14 == (void *)v15)
      {

        char v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        uint64_t v17 = [(DNDSMeDeviceStore *)self meDeviceName];
        if (v17)
        {
          v18 = (void *)v17;
          v19 = [(DNDSMeDeviceStore *)v5 meDeviceName];
          if (v19)
          {
            v22 = [(DNDSMeDeviceStore *)self meDeviceName];
            v20 = [(DNDSMeDeviceStore *)v5 meDeviceName];
            char v13 = [v22 isEqual:v20];
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {

          char v13 = 0;
        }
      }
      v10 = v25;
      v9 = v26;
      objc_super v12 = v23;
      uint64_t v11 = v24;
      if (v6 == v7) {
        goto LABEL_24;
      }
      goto LABEL_22;
    }
    char v13 = 0;
  }
LABEL_25:

  return v13;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDSMeDeviceStore *)self meDeviceStatus];
  [v5 unsignedIntegerValue];
  unint64_t v6 = DNDMeDeviceStatusToString();
  id v7 = [(DNDSMeDeviceStore *)self meDeviceName];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p; meDeviceStatus: %@; meDeviceName: %@>", v4, self, v6, v7];

  return (NSString *)v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableMeDeviceStore alloc];
  return [(DNDSMeDeviceStore *)v4 _initWithStore:self];
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5 = a3;
  unint64_t v6 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"meDeviceStatus", objc_opt_class());
  id v7 = objc_msgSend(v5, "bs_safeStringForKey:", @"meDeviceName");

  uint64_t v8 = (void *)[objc_alloc((Class)a1) _initWithStatus:v6 name:v7];
  return v8;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  [v4 setObject:self->_meDeviceStatus forKey:@"meDeviceStatus"];
  meDeviceName = self->_meDeviceName;
  if (meDeviceName) {
    [v4 setObject:meDeviceName forKey:@"meDeviceName"];
  }
  return v4;
}

- (NSNumber)meDeviceStatus
{
  return self->_meDeviceStatus;
}

- (NSString)meDeviceName
{
  return self->_meDeviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meDeviceName, 0);
  objc_storeStrong((id *)&self->_meDeviceStatus, 0);
}

@end