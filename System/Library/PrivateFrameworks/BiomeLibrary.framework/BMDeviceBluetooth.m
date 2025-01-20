@interface BMDeviceBluetooth
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceBluetooth)initWithAddress:(id)a3 name:(id)a4 productID:(id)a5 starting:(id)a6 deviceType:(int)a7 batteryLevelHeadphoneCase:(id)a8 batteryLevelHeadphoneRight:(id)a9 batteryLevelHeadphoneLeft:(id)a10 appleAudioDevice:(id)a11 userWearing:(id)a12;
- (BMDeviceBluetooth)initWithAddress:(id)a3 name:(id)a4 productID:(id)a5 starting:(id)a6 deviceType:(int)a7 batteryLevelHeadphoneCase:(id)a8 batteryLevelHeadphoneRight:(id)a9 batteryLevelHeadphoneLeft:(id)a10 appleAudioDevice:(id)a11 userWearing:(id)a12 vendorID:(id)a13;
- (BMDeviceBluetooth)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)appleAudioDevice;
- (BOOL)hasAppleAudioDevice;
- (BOOL)hasBatteryLevelHeadphoneCase;
- (BOOL)hasBatteryLevelHeadphoneLeft;
- (BOOL)hasBatteryLevelHeadphoneRight;
- (BOOL)hasProductID;
- (BOOL)hasStarting;
- (BOOL)hasUserWearing;
- (BOOL)hasVendorID;
- (BOOL)isEqual:(id)a3;
- (BOOL)starting;
- (BOOL)userWearing;
- (NSString)address;
- (NSString)description;
- (NSString)name;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)batteryLevelHeadphoneCase;
- (int)batteryLevelHeadphoneLeft;
- (int)batteryLevelHeadphoneRight;
- (int)deviceType;
- (int)productID;
- (unsigned)dataVersion;
- (unsigned)vendorID;
- (void)setHasAppleAudioDevice:(BOOL)a3;
- (void)setHasBatteryLevelHeadphoneCase:(BOOL)a3;
- (void)setHasBatteryLevelHeadphoneLeft:(BOOL)a3;
- (void)setHasBatteryLevelHeadphoneRight:(BOOL)a3;
- (void)setHasProductID:(BOOL)a3;
- (void)setHasStarting:(BOOL)a3;
- (void)setHasUserWearing:(BOOL)a3;
- (void)setHasVendorID:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceBluetooth

+ (id)columns
{
  v15[11] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"address" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"name" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"productID" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceType" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"batteryLevelHeadphoneCase" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:2 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"batteryLevelHeadphoneRight" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:2 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"batteryLevelHeadphoneLeft" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:2 convertedType:0];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appleAudioDevice" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:12 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userWearing" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"vendorID" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:4 convertedType:0];
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v6;
  v15[5] = v13;
  v15[6] = v7;
  v15[7] = v8;
  v15[8] = v14;
  v15[9] = v9;
  v15[10] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

- (void)setHasVendorID:(BOOL)a3
{
  self->_hasVendorID = a3;
}

- (BOOL)hasVendorID
{
  return self->_hasVendorID;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (void)setHasUserWearing:(BOOL)a3
{
  self->_hasUserWearing = a3;
}

- (BOOL)hasUserWearing
{
  return self->_hasUserWearing;
}

- (BOOL)userWearing
{
  return self->_userWearing;
}

- (void)setHasAppleAudioDevice:(BOOL)a3
{
  self->_hasAppleAudioDevice = a3;
}

- (BOOL)hasAppleAudioDevice
{
  return self->_hasAppleAudioDevice;
}

- (BOOL)appleAudioDevice
{
  return self->_appleAudioDevice;
}

- (void)setHasBatteryLevelHeadphoneLeft:(BOOL)a3
{
  self->_hasBatteryLevelHeadphoneLeft = a3;
}

- (BOOL)hasBatteryLevelHeadphoneLeft
{
  return self->_hasBatteryLevelHeadphoneLeft;
}

- (int)batteryLevelHeadphoneLeft
{
  return self->_batteryLevelHeadphoneLeft;
}

- (void)setHasBatteryLevelHeadphoneRight:(BOOL)a3
{
  self->_hasBatteryLevelHeadphoneRight = a3;
}

- (BOOL)hasBatteryLevelHeadphoneRight
{
  return self->_hasBatteryLevelHeadphoneRight;
}

- (int)batteryLevelHeadphoneRight
{
  return self->_batteryLevelHeadphoneRight;
}

- (void)setHasBatteryLevelHeadphoneCase:(BOOL)a3
{
  self->_hasBatteryLevelHeadphoneCase = a3;
}

- (BOOL)hasBatteryLevelHeadphoneCase
{
  return self->_hasBatteryLevelHeadphoneCase;
}

- (int)batteryLevelHeadphoneCase
{
  return self->_batteryLevelHeadphoneCase;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (void)setHasStarting:(BOOL)a3
{
  self->_hasStarting = a3;
}

- (BOOL)hasStarting
{
  return self->_hasStarting;
}

- (BOOL)starting
{
  return self->_starting;
}

- (void)setHasProductID:(BOOL)a3
{
  self->_hasProductID = a3;
}

- (BOOL)hasProductID
{
  return self->_hasProductID;
}

- (int)productID
{
  return self->_productID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)address
{
  return self->_address;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMDeviceBluetooth *)self address];
    uint64_t v7 = [v5 address];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMDeviceBluetooth *)self address];
      v10 = [v5 address];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_52;
      }
    }
    v13 = [(BMDeviceBluetooth *)self name];
    uint64_t v14 = [v5 name];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMDeviceBluetooth *)self name];
      v17 = [v5 name];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_52;
      }
    }
    if (!-[BMDeviceBluetooth hasProductID](self, "hasProductID") && ![v5 hasProductID]
      || [(BMDeviceBluetooth *)self hasProductID]
      && [v5 hasProductID]
      && (int v19 = -[BMDeviceBluetooth productID](self, "productID"), v19 == [v5 productID]))
    {
      if (!-[BMDeviceBluetooth hasStarting](self, "hasStarting") && ![v5 hasStarting]
        || [(BMDeviceBluetooth *)self hasStarting]
        && [v5 hasStarting]
        && (int v20 = -[BMDeviceBluetooth starting](self, "starting"), v20 == [v5 starting]))
      {
        int v21 = [(BMDeviceBluetooth *)self deviceType];
        if (v21 == [v5 deviceType])
        {
          if (![(BMDeviceBluetooth *)self hasBatteryLevelHeadphoneCase]
            && ![v5 hasBatteryLevelHeadphoneCase]
            || [(BMDeviceBluetooth *)self hasBatteryLevelHeadphoneCase]
            && [v5 hasBatteryLevelHeadphoneCase]
            && (int v22 = [(BMDeviceBluetooth *)self batteryLevelHeadphoneCase],
                v22 == [v5 batteryLevelHeadphoneCase]))
          {
            if (![(BMDeviceBluetooth *)self hasBatteryLevelHeadphoneRight]
              && ![v5 hasBatteryLevelHeadphoneRight]
              || [(BMDeviceBluetooth *)self hasBatteryLevelHeadphoneRight]
              && [v5 hasBatteryLevelHeadphoneRight]
              && (int v23 = [(BMDeviceBluetooth *)self batteryLevelHeadphoneRight],
                  v23 == [v5 batteryLevelHeadphoneRight]))
            {
              if (![(BMDeviceBluetooth *)self hasBatteryLevelHeadphoneLeft]
                && ![v5 hasBatteryLevelHeadphoneLeft]
                || [(BMDeviceBluetooth *)self hasBatteryLevelHeadphoneLeft]
                && [v5 hasBatteryLevelHeadphoneLeft]
                && (int v24 = [(BMDeviceBluetooth *)self batteryLevelHeadphoneLeft],
                    v24 == [v5 batteryLevelHeadphoneLeft]))
              {
                if (![(BMDeviceBluetooth *)self hasAppleAudioDevice]
                  && ![v5 hasAppleAudioDevice]
                  || [(BMDeviceBluetooth *)self hasAppleAudioDevice]
                  && [v5 hasAppleAudioDevice]
                  && (int v25 = [(BMDeviceBluetooth *)self appleAudioDevice],
                      v25 == [v5 appleAudioDevice]))
                {
                  if (![(BMDeviceBluetooth *)self hasUserWearing]
                    && ![v5 hasUserWearing]
                    || [(BMDeviceBluetooth *)self hasUserWearing]
                    && [v5 hasUserWearing]
                    && (int v26 = [(BMDeviceBluetooth *)self userWearing],
                        v26 == [v5 userWearing]))
                  {
                    if (![(BMDeviceBluetooth *)self hasVendorID]
                      && ![v5 hasVendorID])
                    {
                      BOOL v12 = 1;
                      goto LABEL_53;
                    }
                    if ([(BMDeviceBluetooth *)self hasVendorID]
                      && [v5 hasVendorID])
                    {
                      unsigned int v27 = [(BMDeviceBluetooth *)self vendorID];
                      BOOL v12 = v27 == [v5 vendorID];
LABEL_53:

                      goto LABEL_54;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_52:
    BOOL v12 = 0;
    goto LABEL_53;
  }
  BOOL v12 = 0;
LABEL_54:

  return v12;
}

- (id)jsonDictionary
{
  v39[11] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMDeviceBluetooth *)self address];
  uint64_t v4 = [(BMDeviceBluetooth *)self name];
  if ([(BMDeviceBluetooth *)self hasProductID])
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBluetooth productID](self, "productID"));
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ([(BMDeviceBluetooth *)self hasStarting])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBluetooth starting](self, "starting"));
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBluetooth deviceType](self, "deviceType"));
  if ([(BMDeviceBluetooth *)self hasBatteryLevelHeadphoneCase])
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBluetooth batteryLevelHeadphoneCase](self, "batteryLevelHeadphoneCase"));
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([(BMDeviceBluetooth *)self hasBatteryLevelHeadphoneRight])
  {
    v37 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBluetooth batteryLevelHeadphoneRight](self, "batteryLevelHeadphoneRight"));
  }
  else
  {
    v37 = 0;
  }
  if ([(BMDeviceBluetooth *)self hasBatteryLevelHeadphoneLeft])
  {
    v36 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBluetooth batteryLevelHeadphoneLeft](self, "batteryLevelHeadphoneLeft"));
  }
  else
  {
    v36 = 0;
  }
  if ([(BMDeviceBluetooth *)self hasAppleAudioDevice])
  {
    v35 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBluetooth appleAudioDevice](self, "appleAudioDevice"));
  }
  else
  {
    v35 = 0;
  }
  if ([(BMDeviceBluetooth *)self hasUserWearing])
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBluetooth userWearing](self, "userWearing"));
  }
  else
  {
    v9 = 0;
  }
  if ([(BMDeviceBluetooth *)self hasVendorID])
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceBluetooth vendorID](self, "vendorID"));
  }
  else
  {
    v10 = 0;
  }
  v38[0] = @"address";
  uint64_t v11 = v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v11;
  v39[0] = v11;
  v38[1] = @"name";
  uint64_t v12 = v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v12;
  v39[1] = v12;
  v38[2] = @"productID";
  uint64_t v13 = v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v3;
  unsigned int v27 = (void *)v13;
  v39[2] = v13;
  v38[3] = @"starting";
  uint64_t v14 = v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v4;
  int v26 = (void *)v14;
  v39[3] = v14;
  v38[4] = @"deviceType";
  uint64_t v15 = v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = (void *)v5;
  int v25 = (void *)v15;
  v39[4] = v15;
  v38[5] = @"batteryLevelHeadphoneCase";
  v16 = (void *)v8;
  if (!v8)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v6;
  v39[5] = v16;
  v38[6] = @"batteryLevelHeadphoneRight";
  v17 = v37;
  if (!v37)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  int v18 = (void *)v7;
  v39[6] = v17;
  v38[7] = @"batteryLevelHeadphoneLeft";
  int v19 = v36;
  if (!v36)
  {
    int v19 = [MEMORY[0x1E4F1CA98] null];
  }
  int v20 = (void *)v8;
  v39[7] = v19;
  v38[8] = @"appleAudioDevice";
  int v21 = v35;
  if (!v35)
  {
    int v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v39[8] = v21;
  v38[9] = @"userWearing";
  int v22 = v9;
  if (!v9)
  {
    int v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v39[9] = v22;
  v38[10] = @"vendorID";
  int v23 = v10;
  if (!v10)
  {
    int v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v39[10] = v23;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:11];
  if (v10)
  {
    if (v9) {
      goto LABEL_49;
    }
  }
  else
  {

    if (v9) {
      goto LABEL_49;
    }
  }

LABEL_49:
  if (!v35) {

  }
  if (!v36) {
  if (!v37)
  }

  if (!v20) {
  if (!v18)
  }

  if (!v31) {
  if (v32)
  }
  {
    if (v33) {
      goto LABEL_63;
    }
LABEL_70:

    if (v34) {
      goto LABEL_64;
    }
    goto LABEL_71;
  }

  if (!v33) {
    goto LABEL_70;
  }
LABEL_63:
  if (v34) {
    goto LABEL_64;
  }
LABEL_71:

LABEL_64:

  return v30;
}

- (BMDeviceBluetooth)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v152[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"address"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"name"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          v17 = 0;
          goto LABEL_70;
        }
        v125 = v7;
        int v22 = a4;
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v24 = *MEMORY[0x1E4F502C8];
        uint64_t v149 = *MEMORY[0x1E4F28568];
        id v129 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"name"];
        id v150 = v129;
        uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v150 forKeys:&v149 count:1];
        uint64_t v26 = v24;
        uint64_t v11 = (void *)v25;
        id v10 = 0;
        v17 = 0;
        *int v22 = (id)[v23 initWithDomain:v26 code:2 userInfo:v25];
        uint64_t v7 = v125;
        goto LABEL_69;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:@"productID"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v129 = 0;
          v17 = 0;
          goto LABEL_69;
        }
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        v121 = v9;
        v126 = v7;
        v28 = a4;
        v29 = self;
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v147 = *MEMORY[0x1E4F28568];
        id v31 = v10;
        id v32 = [NSString alloc];
        uint64_t v96 = objc_opt_class();
        v33 = v32;
        id v10 = v31;
        id v127 = (id)[v33 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v96, @"productID"];
        id v148 = v127;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
        uint64_t v35 = v30;
        self = v29;
        id v36 = (id)[v27 initWithDomain:v35 code:2 userInfo:v34];
        id v129 = 0;
        v17 = 0;
        id *v28 = v36;
        uint64_t v7 = v126;
        v9 = v121;
LABEL_68:

LABEL_69:
        goto LABEL_70;
      }
      id v128 = v8;
      id v129 = v11;
    }
    else
    {
      id v128 = v8;
      id v129 = 0;
    }
    uint64_t v12 = [v6 objectForKeyedSubscript:@"starting"];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v127 = 0;
          v17 = 0;
          v34 = v12;
          id v8 = v128;
          goto LABEL_68;
        }
        v103 = a4;
        id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
        v112 = v11;
        uint64_t v38 = *MEMORY[0x1E4F502C8];
        uint64_t v145 = *MEMORY[0x1E4F28568];
        v39 = v7;
        id v40 = v10;
        id v41 = [NSString alloc];
        uint64_t v97 = objc_opt_class();
        v42 = v41;
        id v10 = v40;
        uint64_t v7 = v39;
        id v123 = (id)[v42 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v97, @"starting"];
        id v146 = v123;
        uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
        v44 = v37;
        v45 = (void *)v43;
        v34 = v12;
        uint64_t v46 = v38;
        uint64_t v11 = v112;
        id v127 = 0;
        v17 = 0;
        id *v103 = (id)[v44 initWithDomain:v46 code:2 userInfo:v43];
        goto LABEL_105;
      }
      v118 = v12;
      id v127 = v12;
    }
    else
    {
      v118 = v12;
      id v127 = 0;
    }
    uint64_t v13 = [v6 objectForKeyedSubscript:@"deviceType"];
    v124 = v7;
    v120 = v9;
    v117 = (void *)v13;
    if (!v13 || (uint64_t v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v15 = v10;
      id v123 = 0;
LABEL_37:
      uint64_t v47 = [v6 objectForKeyedSubscript:@"batteryLevelHeadphoneCase"];
      id v8 = v128;
      v119 = (void *)v47;
      if (v47 && (v48 = (void *)v47, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v122 = 0;
            v17 = 0;
            v45 = v117;
            v34 = v118;
            id v10 = v15;
            uint64_t v7 = v124;
            goto LABEL_66;
          }
          v105 = a4;
          id v61 = objc_alloc(MEMORY[0x1E4F28C58]);
          v108 = self;
          v62 = v11;
          uint64_t v63 = *MEMORY[0x1E4F502C8];
          uint64_t v141 = *MEMORY[0x1E4F28568];
          id v64 = [NSString alloc];
          uint64_t v98 = objc_opt_class();
          v65 = v64;
          id v10 = v15;
          v114 = (void *)[v65 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v98, @"batteryLevelHeadphoneCase"];
          v142 = v114;
          uint64_t v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v142 forKeys:&v141 count:1];
          uint64_t v67 = v63;
          uint64_t v11 = v62;
          self = v108;
          v115 = (void *)v66;
          v17 = 0;
          id v122 = 0;
          id *v105 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v67, 2);
          v45 = v117;
          v34 = v118;
          uint64_t v7 = v124;
          goto LABEL_65;
        }
        v130 = v6;
        id v122 = v48;
      }
      else
      {
        v130 = v6;
        id v122 = 0;
      }
      id v49 = [v130 objectForKeyedSubscript:@"batteryLevelHeadphoneRight"];
      v115 = v49;
      v116 = v15;
      if (v49)
      {
        id v10 = v15;
        objc_opt_class();
        uint64_t v7 = v124;
        if (objc_opt_isKindOfClass())
        {
          v104 = a4;
          id v49 = 0;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v114 = 0;
              v17 = 0;
              v45 = v117;
              v34 = v118;
              id v6 = v130;
              goto LABEL_65;
            }
            v68 = a4;
            id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
            v109 = self;
            v70 = v11;
            uint64_t v71 = *MEMORY[0x1E4F502C8];
            uint64_t v139 = *MEMORY[0x1E4F28568];
            uint64_t v7 = v124;
            v59 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"batteryLevelHeadphoneRight"];
            v140 = v59;
            uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
            uint64_t v73 = v71;
            uint64_t v11 = v70;
            self = v109;
            v111 = (void *)v72;
            v17 = 0;
            v114 = 0;
            id *v68 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v73, 2);
            goto LABEL_101;
          }
          v104 = a4;
          id v49 = v49;
        }
      }
      else
      {
        v104 = a4;
        uint64_t v7 = v124;
      }
      uint64_t v50 = [v130 objectForKeyedSubscript:@"batteryLevelHeadphoneLeft"];
      v114 = v49;
      v111 = (void *)v50;
      if (!v50 || (v51 = (void *)v50, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v107 = 0;
        goto LABEL_51;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v107 = v51;
LABEL_51:
        v52 = [v130 objectForKeyedSubscript:@"appleAudioDevice"];
        v113 = v11;
        if (!v52 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v53 = 0;
          goto LABEL_54;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v53 = v52;
LABEL_54:
          v54 = [v130 objectForKeyedSubscript:@"userWearing"];
          if (!v54 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v55 = self;
            id v56 = 0;
            goto LABEL_57;
          }
          objc_opt_class();
          v55 = self;
          if (objc_opt_isKindOfClass())
          {
            id v56 = v54;
LABEL_57:
            v57 = [v130 objectForKeyedSubscript:@"vendorID"];
            if (v57 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              id v6 = v130;
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v17 = (BMDeviceBluetooth *)v104;
                if (v104)
                {
                  id v102 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v101 = *MEMORY[0x1E4F502C8];
                  uint64_t v131 = *MEMORY[0x1E4F28568];
                  v94 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"vendorID"];
                  v132 = v94;
                  v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v132 forKeys:&v131 count:1];
                  id *v104 = (id)[v102 initWithDomain:v101 code:2 userInfo:v95];

                  uint64_t v7 = v124;
                  id v58 = 0;
                  v17 = 0;
                }
                else
                {
                  id v58 = 0;
                }
                goto LABEL_61;
              }
              id v58 = v57;
            }
            else
            {
              id v58 = 0;
              id v6 = v130;
            }
            v17 = -[BMDeviceBluetooth initWithAddress:name:productID:starting:deviceType:batteryLevelHeadphoneCase:batteryLevelHeadphoneRight:batteryLevelHeadphoneLeft:appleAudioDevice:userWearing:vendorID:](v55, "initWithAddress:name:productID:starting:deviceType:batteryLevelHeadphoneCase:batteryLevelHeadphoneRight:batteryLevelHeadphoneLeft:appleAudioDevice:userWearing:vendorID:", v128, v116, v129, v127, [v123 intValue], v122, v49, v107, v53, v56, v58);
            v55 = v17;
LABEL_61:

LABEL_62:
            v59 = v107;

            self = v55;
            uint64_t v11 = v113;
LABEL_63:

            id v8 = v128;
            v9 = v120;
            v45 = v117;
            v34 = v118;
LABEL_64:

            id v10 = v116;
LABEL_65:

LABEL_66:
LABEL_67:

            goto LABEL_68;
          }
          if (v104)
          {
            id v90 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v91 = *MEMORY[0x1E4F502C8];
            uint64_t v133 = *MEMORY[0x1E4F28568];
            id v58 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"userWearing"];
            id v134 = v58;
            v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
            v92 = v90;
            uint64_t v7 = v124;
            id v93 = (id)[v92 initWithDomain:v91 code:2 userInfo:v57];
            v17 = 0;
            id v56 = 0;
            id *v104 = v93;
            id v6 = v130;
            goto LABEL_61;
          }
          id v56 = 0;
          v17 = 0;
LABEL_107:
          id v6 = v130;
          goto LABEL_62;
        }
        if (v104)
        {
          v55 = self;
          id v81 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v82 = *MEMORY[0x1E4F502C8];
          uint64_t v135 = *MEMORY[0x1E4F28568];
          id v83 = [NSString alloc];
          uint64_t v100 = objc_opt_class();
          v84 = v83;
          uint64_t v7 = v124;
          id v56 = (id)[v84 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v100, @"appleAudioDevice"];
          id v136 = v56;
          v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
          v17 = 0;
          id v53 = 0;
          id *v104 = (id)[v81 initWithDomain:v82 code:2 userInfo:v54];
          goto LABEL_107;
        }
        v59 = v107;
        id v53 = 0;
        v17 = 0;
LABEL_103:
        id v6 = v130;
        goto LABEL_63;
      }
      if (v104)
      {
        v110 = self;
        v74 = v11;
        id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v76 = *MEMORY[0x1E4F502C8];
        uint64_t v137 = *MEMORY[0x1E4F28568];
        id v77 = [NSString alloc];
        uint64_t v99 = objc_opt_class();
        v78 = v77;
        uint64_t v7 = v124;
        id v53 = (id)[v78 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v99, @"batteryLevelHeadphoneLeft"];
        id v138 = v53;
        v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
        v79 = v75;
        uint64_t v11 = v74;
        self = v110;
        id v80 = (id)[v79 initWithDomain:v76 code:2 userInfo:v52];
        v17 = 0;
        v59 = 0;
        id *v104 = v80;
        goto LABEL_103;
      }
      v59 = 0;
      v17 = 0;
LABEL_101:
      v45 = v117;
      v34 = v118;
      id v6 = v130;
      goto LABEL_64;
    }
    v16 = v7;
    v17 = (BMDeviceBluetooth *)a4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v10;
      id v123 = v14;
LABEL_36:
      v9 = v120;
      goto LABEL_37;
    }
    v106 = self;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v123 = [NSNumber numberWithInt:BMDeviceBluetoothDeviceTypeFromString(v14)];
      id v15 = v10;
      goto LABEL_36;
    }
    if (a4)
    {
      v85 = a4;
      id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v87 = *MEMORY[0x1E4F502C8];
      uint64_t v143 = *MEMORY[0x1E4F28568];
      id v122 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"deviceType"];
      id v144 = v122;
      uint64_t v88 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
      v89 = v86;
      v45 = v14;
      v119 = (void *)v88;
      id v123 = 0;
      v17 = 0;
      id *v85 = (id)objc_msgSend(v89, "initWithDomain:code:userInfo:", v87, 2);
      self = v106;
      uint64_t v7 = v16;
      v9 = v120;
      v34 = v118;
      id v8 = v128;
      goto LABEL_66;
    }
    id v123 = 0;
    v9 = v120;
    v34 = v118;
    v45 = v14;
LABEL_105:
    id v8 = v128;
    goto LABEL_67;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v8 = 0;
    v17 = 0;
    goto LABEL_71;
  }
  int v18 = a4;
  id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v20 = *MEMORY[0x1E4F502C8];
  uint64_t v151 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"address"];
  v152[0] = v10;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v152 forKeys:&v151 count:1];
  id v8 = 0;
  v17 = 0;
  *int v18 = (id)[v19 initWithDomain:v20 code:2 userInfo:v21];
  v9 = (void *)v21;
LABEL_70:

LABEL_71:
  return v17;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMDeviceBluetooth *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_address) {
    PBDataWriterWriteStringField();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasProductID) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasStarting) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasBatteryLevelHeadphoneCase) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasBatteryLevelHeadphoneRight) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v4 = v5;
  if (self->_hasBatteryLevelHeadphoneLeft)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v4 = v5;
  }
  if (self->_hasAppleAudioDevice)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v4 = v5;
  }
  if (self->_hasUserWearing)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v4 = v5;
  }
  if (self->_hasVendorID)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  uint64_t v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)BMDeviceBluetooth;
  id v5 = [(BMEventBase *)&v77 init];
  if (!v5) {
    goto LABEL_131;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        unint64_t v14 = *(void *)&v4[v13];
        if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v16 = v11++ >= 9;
        if (v16)
        {
          unint64_t v12 = 0;
          int v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v17 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v17 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 56;
          goto LABEL_24;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 64;
LABEL_24:
          uint64_t v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 3u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          v5->_hasProductID = 1;
          while (2)
          {
            uint64_t v25 = *v6;
            unint64_t v26 = *(void *)&v4[v25];
            if (v26 == -1 || v26 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
              *(void *)&v4[v25] = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                BOOL v16 = v23++ >= 9;
                if (v16)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_91:
          uint64_t v72 = 32;
          goto LABEL_127;
        case 4u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          v5->_hasStarting = 1;
          while (2)
          {
            uint64_t v31 = *v6;
            unint64_t v32 = *(void *)&v4[v31];
            if (v32 == -1 || v32 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
              *(void *)&v4[v31] = v32 + 1;
              v30 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                BOOL v16 = v29++ >= 9;
                if (v16)
                {
                  uint64_t v30 = 0;
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v30 = 0;
          }
LABEL_95:
          BOOL v73 = v30 != 0;
          uint64_t v74 = 17;
          goto LABEL_122;
        case 5u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          while (2)
          {
            uint64_t v37 = *v6;
            unint64_t v38 = *(void *)&v4[v37];
            if (v38 == -1 || v38 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)&v4[*v9] + v38);
              *(void *)&v4[v37] = v38 + 1;
              v36 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                BOOL v16 = v35++ >= 9;
                if (v16)
                {
                  LODWORD(v36) = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v36) = 0;
          }
LABEL_99:
          if (v36 >= 0x33) {
            LODWORD(v36) = 0;
          }
          v5->_deviceType = v36;
          continue;
        case 6u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v24 = 0;
          v5->_hasBatteryLevelHeadphoneCase = 1;
          while (2)
          {
            uint64_t v42 = *v6;
            unint64_t v43 = *(void *)&v4[v42];
            if (v43 == -1 || v43 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v44 = *(unsigned char *)(*(void *)&v4[*v9] + v43);
              *(void *)&v4[v42] = v43 + 1;
              v24 |= (unint64_t)(v44 & 0x7F) << v40;
              if (v44 < 0)
              {
                v40 += 7;
                BOOL v16 = v41++ >= 9;
                if (v16)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_105;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_105:
          uint64_t v72 = 40;
          goto LABEL_127;
        case 7u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v24 = 0;
          v5->_hasBatteryLevelHeadphoneRight = 1;
          while (2)
          {
            uint64_t v47 = *v6;
            unint64_t v48 = *(void *)&v4[v47];
            if (v48 == -1 || v48 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)&v4[*v9] + v48);
              *(void *)&v4[v47] = v48 + 1;
              v24 |= (unint64_t)(v49 & 0x7F) << v45;
              if (v49 < 0)
              {
                v45 += 7;
                BOOL v16 = v46++ >= 9;
                if (v16)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_109;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_109:
          uint64_t v72 = 44;
          goto LABEL_127;
        case 8u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v24 = 0;
          v5->_hasBatteryLevelHeadphoneLeft = 1;
          while (2)
          {
            uint64_t v52 = *v6;
            unint64_t v53 = *(void *)&v4[v52];
            if (v53 == -1 || v53 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v54 = *(unsigned char *)(*(void *)&v4[*v9] + v53);
              *(void *)&v4[v52] = v53 + 1;
              v24 |= (unint64_t)(v54 & 0x7F) << v50;
              if (v54 < 0)
              {
                v50 += 7;
                BOOL v16 = v51++ >= 9;
                if (v16)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_113;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_113:
          uint64_t v72 = 48;
          goto LABEL_127;
        case 9u:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v57 = 0;
          v5->_hasAppleAudioDevice = 1;
          while (2)
          {
            uint64_t v58 = *v6;
            unint64_t v59 = *(void *)&v4[v58];
            if (v59 == -1 || v59 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v60 = *(unsigned char *)(*(void *)&v4[*v9] + v59);
              *(void *)&v4[v58] = v59 + 1;
              v57 |= (unint64_t)(v60 & 0x7F) << v55;
              if (v60 < 0)
              {
                v55 += 7;
                BOOL v16 = v56++ >= 9;
                if (v16)
                {
                  uint64_t v57 = 0;
                  goto LABEL_117;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v57 = 0;
          }
LABEL_117:
          BOOL v73 = v57 != 0;
          uint64_t v74 = 22;
          goto LABEL_122;
        case 0xAu:
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v63 = 0;
          v5->_hasUserWearing = 1;
          while (2)
          {
            uint64_t v64 = *v6;
            unint64_t v65 = *(void *)&v4[v64];
            if (v65 == -1 || v65 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v66 = *(unsigned char *)(*(void *)&v4[*v9] + v65);
              *(void *)&v4[v64] = v65 + 1;
              v63 |= (unint64_t)(v66 & 0x7F) << v61;
              if (v66 < 0)
              {
                v61 += 7;
                BOOL v16 = v62++ >= 9;
                if (v16)
                {
                  uint64_t v63 = 0;
                  goto LABEL_121;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v63 = 0;
          }
LABEL_121:
          BOOL v73 = v63 != 0;
          uint64_t v74 = 24;
LABEL_122:
          *((unsigned char *)&v5->super.super.isa + v74) = v73;
          continue;
        case 0xBu:
          char v67 = 0;
          unsigned int v68 = 0;
          uint64_t v24 = 0;
          v5->_hasVendorID = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_130;
          }
          continue;
      }
      while (1)
      {
        uint64_t v69 = *v6;
        unint64_t v70 = *(void *)&v4[v69];
        if (v70 == -1 || v70 >= *(void *)&v4[*v7]) {
          break;
        }
        char v71 = *(unsigned char *)(*(void *)&v4[*v9] + v70);
        *(void *)&v4[v69] = v70 + 1;
        v24 |= (unint64_t)(v71 & 0x7F) << v67;
        if ((v71 & 0x80) == 0) {
          goto LABEL_124;
        }
        v67 += 7;
        BOOL v16 = v68++ >= 9;
        if (v16)
        {
          LODWORD(v24) = 0;
          goto LABEL_126;
        }
      }
      v4[*v8] = 1;
LABEL_124:
      if (v4[*v8]) {
        LODWORD(v24) = 0;
      }
LABEL_126:
      uint64_t v72 = 52;
LABEL_127:
      *(_DWORD *)((char *)&v5->super.super.isa + v72) = v24;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_130:
  }
    id v75 = 0;
  else {
LABEL_131:
  }
    id v75 = v5;

  return v75;
}

- (NSString)description
{
  id v15 = [NSString alloc];
  unint64_t v14 = [(BMDeviceBluetooth *)self address];
  uint64_t v13 = [(BMDeviceBluetooth *)self name];
  unint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBluetooth productID](self, "productID"));
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBluetooth starting](self, "starting"));
  uint64_t v4 = BMDeviceBluetoothDeviceTypeAsString([(BMDeviceBluetooth *)self deviceType]);
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBluetooth batteryLevelHeadphoneCase](self, "batteryLevelHeadphoneCase"));
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBluetooth batteryLevelHeadphoneRight](self, "batteryLevelHeadphoneRight"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBluetooth batteryLevelHeadphoneLeft](self, "batteryLevelHeadphoneLeft"));
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBluetooth appleAudioDevice](self, "appleAudioDevice"));
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBluetooth userWearing](self, "userWearing"));
  char v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceBluetooth vendorID](self, "vendorID"));
  BOOL v16 = (void *)[v15 initWithFormat:@"BMDeviceBluetooth with address: %@, name: %@, productID: %@, starting: %@, deviceType: %@, batteryLevelHeadphoneCase: %@, batteryLevelHeadphoneRight: %@, batteryLevelHeadphoneLeft: %@, appleAudioDevice: %@, userWearing: %@, vendorID: %@", v14, v13, v12, v3, v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v16;
}

- (BMDeviceBluetooth)initWithAddress:(id)a3 name:(id)a4 productID:(id)a5 starting:(id)a6 deviceType:(int)a7 batteryLevelHeadphoneCase:(id)a8 batteryLevelHeadphoneRight:(id)a9 batteryLevelHeadphoneLeft:(id)a10 appleAudioDevice:(id)a11 userWearing:(id)a12 vendorID:(id)a13
{
  id v38 = a3;
  id v35 = a4;
  id v37 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  uint64_t v21 = v19;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  id v26 = a13;
  v39.receiver = self;
  v39.super_class = (Class)BMDeviceBluetooth;
  char v27 = [(BMEventBase *)&v39 init];
  if (v27)
  {
    v27->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v27->_address, a3);
    objc_storeStrong((id *)&v27->_name, v35);
    if (v18)
    {
      v27->_hasProductID = 1;
      int v28 = [v18 intValue];
    }
    else
    {
      v27->_hasProductID = 0;
      int v28 = -1;
    }
    v27->_productID = v28;
    if (v21)
    {
      v27->_hasStarting = 1;
      v27->_starting = [v21 BOOLValue];
    }
    else
    {
      v27->_hasStarting = 0;
      v27->_starting = 0;
    }
    v27->_deviceType = a7;
    if (v20)
    {
      v27->_hasBatteryLevelHeadphoneCase = 1;
      int v29 = [v20 intValue];
    }
    else
    {
      v27->_hasBatteryLevelHeadphoneCase = 0;
      int v29 = -1;
    }
    v27->_batteryLevelHeadphoneCase = v29;
    if (v22)
    {
      v27->_hasBatteryLevelHeadphoneRight = 1;
      int v30 = [v22 intValue];
    }
    else
    {
      v27->_hasBatteryLevelHeadphoneRight = 0;
      int v30 = -1;
    }
    v27->_batteryLevelHeadphoneRight = v30;
    if (v23)
    {
      v27->_hasBatteryLevelHeadphoneLeft = 1;
      int v31 = [v23 intValue];
    }
    else
    {
      v27->_hasBatteryLevelHeadphoneLeft = 0;
      int v31 = -1;
    }
    v27->_batteryLevelHeadphoneLeft = v31;
    if (v24)
    {
      v27->_hasAppleAudioDevice = 1;
      v27->_appleAudioDevice = [v24 BOOLValue];
    }
    else
    {
      v27->_hasAppleAudioDevice = 0;
      v27->_appleAudioDevice = 0;
    }
    if (v25)
    {
      v27->_hasUserWearing = 1;
      v27->_userWearing = [v25 BOOLValue];
    }
    else
    {
      v27->_hasUserWearing = 0;
      v27->_userWearing = 0;
    }
    if (v26)
    {
      v27->_hasVendorID = 1;
      unsigned int v32 = [v26 unsignedIntValue];
    }
    else
    {
      unsigned int v32 = 0;
      v27->_hasVendorID = 0;
    }
    v27->_vendorID = v32;
  }

  return v27;
}

+ (id)protoFields
{
  v15[11] = *MEMORY[0x1E4F143B8];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"address" number:1 type:13 subMessageClass:0];
  v15[0] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"name" number:2 type:13 subMessageClass:0];
  v15[1] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"productID" number:3 type:2 subMessageClass:0];
  v15[2] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:4 type:12 subMessageClass:0];
  v15[3] = v3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceType" number:5 type:4 subMessageClass:0];
  v15[4] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"batteryLevelHeadphoneCase" number:6 type:2 subMessageClass:0];
  v15[5] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"batteryLevelHeadphoneRight" number:7 type:2 subMessageClass:0];
  v15[6] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"batteryLevelHeadphoneLeft" number:8 type:2 subMessageClass:0];
  v15[7] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appleAudioDevice" number:9 type:12 subMessageClass:0];
  v15[8] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userWearing" number:10 type:12 subMessageClass:0];
  v15[9] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"vendorID" number:11 type:4 subMessageClass:0];
  v15[10] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5760;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMDeviceBluetooth alloc] initByReadFrom:v7];
    uint64_t v4 = v8;
    if (v8) {
      v8[7] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (BMDeviceBluetooth)initWithAddress:(id)a3 name:(id)a4 productID:(id)a5 starting:(id)a6 deviceType:(int)a7 batteryLevelHeadphoneCase:(id)a8 batteryLevelHeadphoneRight:(id)a9 batteryLevelHeadphoneLeft:(id)a10 appleAudioDevice:(id)a11 userWearing:(id)a12
{
  return [(BMDeviceBluetooth *)self initWithAddress:a3 name:a4 productID:a5 starting:a6 deviceType:*(void *)&a7 batteryLevelHeadphoneCase:a8 batteryLevelHeadphoneRight:a9 batteryLevelHeadphoneLeft:a10 appleAudioDevice:a11 userWearing:a12 vendorID:0];
}

@end