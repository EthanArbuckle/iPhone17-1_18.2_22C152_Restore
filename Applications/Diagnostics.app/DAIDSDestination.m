@interface DAIDSDestination
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIDSDevice:(id)a3;
- (BOOL)isEqualToNRDevice:(id)a3;
- (BOOL)isEqualToSFDevice:(id)a3;
- (DAIDSDestination)initWithCoder:(id)a3;
- (DAIDSDestination)initWithIDSDevice:(id)a3;
- (NSNumber)locallyPaired;
- (NSString)idsDestination;
- (NSString)uniqueID;
- (NSString)uniqueIDOverride;
- (NSUUID)bluetoothID;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBluetoothID:(id)a3;
- (void)setLocallyPaired:(id)a3;
- (void)setUniqueID:(id)a3;
- (void)setUniqueIDOverride:(id)a3;
@end

@implementation DAIDSDestination

- (DAIDSDestination)initWithIDSDevice:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DAIDSDestination;
  v5 = [(DAIDSDestination *)&v17 init];
  if (v5)
  {
    uint64_t v6 = IDSCopyIDForDevice();
    idsDestination = v5->_idsDestination;
    v5->_idsDestination = (NSString *)v6;

    uint64_t v8 = [v4 nsuuid];
    bluetoothID = v5->_bluetoothID;
    v5->_bluetoothID = (NSUUID *)v8;

    uint64_t v10 = [v4 uniqueID];
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v10;

    uint64_t v12 = [v4 uniqueIDOverride];
    uniqueIDOverride = v5->_uniqueIDOverride;
    v5->_uniqueIDOverride = (NSString *)v12;

    uint64_t v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isLocallyPaired]);
    locallyPaired = v5->_locallyPaired;
    v5->_locallyPaired = (NSNumber *)v14;
  }
  return v5;
}

- (DAIDSDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DAIDSDestination *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destination"];
    idsDestination = v5->_idsDestination;
    v5->_idsDestination = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bluetoothID"];
    bluetoothID = v5->_bluetoothID;
    v5->_bluetoothID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueID"];
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIDOverride"];
    uniqueIDOverride = v5->_uniqueIDOverride;
    v5->_uniqueIDOverride = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locallyPaired"];
    locallyPaired = v5->_locallyPaired;
    v5->_locallyPaired = (NSNumber *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DAIDSDestination *)self idsDestination];
  [v4 encodeObject:v5 forKey:@"destination"];

  uint64_t v6 = [(DAIDSDestination *)self bluetoothID];
  [v4 encodeObject:v6 forKey:@"bluetoothID"];

  v7 = [(DAIDSDestination *)self uniqueID];
  [v4 encodeObject:v7 forKey:@"uniqueID"];

  uint64_t v8 = [(DAIDSDestination *)self uniqueIDOverride];
  [v4 encodeObject:v8 forKey:@"uniqueIDOverride"];

  id v9 = [(DAIDSDestination *)self locallyPaired];
  [v4 encodeObject:v9 forKey:@"locallyPaired"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v2 = [(DAIDSDestination *)self uniqueIDOverride];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(DAIDSDestination *)self uniqueIDOverride];
    uint64_t v6 = [v4 uniqueIDOverride];
    unsigned __int8 v7 = [v5 isEqualToString:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v8 = [(DAIDSDestination *)self isEqualToIDSDevice:v4];
    }
    else
    {
      if (!sub_10002CCC8()) {
        goto LABEL_20;
      }
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2050000000;
      id v9 = (void *)qword_1001869A0;
      uint64_t v22 = qword_1001869A0;
      if (!qword_1001869A0)
      {
        uint64_t v14 = _NSConcreteStackBlock;
        uint64_t v15 = 3221225472;
        v16 = sub_10002CE0C;
        objc_super v17 = &unk_10014C370;
        v18 = &v19;
        sub_10002CE0C((uint64_t)&v14);
        id v9 = (void *)v20[3];
      }
      id v10 = v9;
      _Block_object_dispose(&v19, 8);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned __int8 v8 = [(DAIDSDestination *)self isEqualToNRDevice:v4];
      }
      else
      {
LABEL_20:
        if (!sub_10002CEC0()) {
          goto LABEL_16;
        }
        uint64_t v19 = 0;
        v20 = &v19;
        uint64_t v21 = 0x2050000000;
        v11 = (void *)qword_1001869B0;
        uint64_t v22 = qword_1001869B0;
        if (!qword_1001869B0)
        {
          uint64_t v14 = _NSConcreteStackBlock;
          uint64_t v15 = 3221225472;
          v16 = sub_10002D004;
          objc_super v17 = &unk_10014C370;
          v18 = &v19;
          sub_10002D004((uint64_t)&v14);
          v11 = (void *)v20[3];
        }
        id v12 = v11;
        _Block_object_dispose(&v19, 8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_16:
          unsigned __int8 v7 = 0;
          goto LABEL_17;
        }
        unsigned __int8 v8 = [(DAIDSDestination *)self isEqualToSFDevice:v4];
      }
    }
    unsigned __int8 v7 = v8;
  }
LABEL_17:

  return v7;
}

- (BOOL)isEqualToNRDevice:(id)a3
{
  id v4 = a3;
  if (sub_10002CCC8())
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    v5 = (void *)qword_1001869B8;
    uint64_t v25 = qword_1001869B8;
    if (!qword_1001869B8)
    {
      objc_super v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      uint64_t v19 = sub_10002D094;
      v20 = &unk_10014C370;
      uint64_t v21 = &v22;
      uint64_t v6 = (void *)sub_10002CE64();
      v23[3] = (uint64_t)dlsym(v6, "NRDevicePropertyIsPaired");
      qword_1001869B8 = *(void *)(v21[1] + 24);
      v5 = (void *)v23[3];
    }
    _Block_object_dispose(&v22, 8);
    if (!v5)
    {
      v16 = (_Unwind_Exception *)sub_100102964();
      _Block_object_dispose(&v22, 8);
      _Unwind_Resume(v16);
    }
    unsigned __int8 v7 = [v4 valueForProperty:*v5];
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    unsigned __int8 v8 = (void *)qword_1001869C0;
    uint64_t v25 = qword_1001869C0;
    if (!qword_1001869C0)
    {
      objc_super v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      uint64_t v19 = sub_10002D0E4;
      v20 = &unk_10014C370;
      uint64_t v21 = &v22;
      sub_10002D0E4((uint64_t)&v17);
      unsigned __int8 v8 = (void *)v23[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v22, 8);
    id v10 = [v9 sharedInstance];
    v11 = [v10 deviceIDForNRDevice:v4];

    id v12 = [(DAIDSDestination *)self locallyPaired];
    if ([v7 isEqualToNumber:v12])
    {
      v13 = [(DAIDSDestination *)self bluetoothID];
      unsigned __int8 v14 = [v11 isEqual:v13];
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (BOOL)isEqualToIDSDevice:(id)a3
{
  id v4 = [a3 uniqueIDOverride];
  v5 = [(DAIDSDestination *)self uniqueIDOverride];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)isEqualToSFDevice:(id)a3
{
  id v4 = a3;
  if (sub_10002CEC0())
  {
    v5 = [v4 bleDevice];
    unsigned __int8 v6 = [v5 identifier];
    unsigned __int8 v7 = [(DAIDSDestination *)self bluetoothID];
    unsigned __int8 v8 = [v6 isEqual:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)description
{
  id v3 = [(DAIDSDestination *)self idsDestination];
  id v4 = [(DAIDSDestination *)self bluetoothID];
  v5 = [(DAIDSDestination *)self uniqueID];
  unsigned __int8 v6 = [(DAIDSDestination *)self uniqueIDOverride];
  unsigned __int8 v7 = [(DAIDSDestination *)self locallyPaired];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"idsDestination: %@; bluetoothID: %@; unqiueID: %@; uniqueIDOverride: %@; isLocallyPaired: %@",
    v3,
    v4,
    v5,
    v6,
  unsigned __int8 v8 = v7);

  return v8;
}

- (NSUUID)bluetoothID
{
  return self->_bluetoothID;
}

- (void)setBluetoothID:(id)a3
{
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (NSString)uniqueIDOverride
{
  return self->_uniqueIDOverride;
}

- (void)setUniqueIDOverride:(id)a3
{
}

- (NSNumber)locallyPaired
{
  return self->_locallyPaired;
}

- (void)setLocallyPaired:(id)a3
{
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDestination, 0);
  objc_storeStrong((id *)&self->_locallyPaired, 0);
  objc_storeStrong((id *)&self->_uniqueIDOverride, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);

  objc_storeStrong((id *)&self->_bluetoothID, 0);
}

@end