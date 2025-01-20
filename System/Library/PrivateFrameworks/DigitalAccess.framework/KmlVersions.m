@interface KmlVersions
- (KmlTlv)appletSupportedVersionsTlvForPairing;
- (KmlTlv)kmlSupportedVersionsTlvForPairing;
- (KmlTlv)kmlSupportedVersionsTlvForShareInitiator;
- (NSData)vehicleSupportedAppletVersionsTlvAsData;
- (NSData)vehicleSupportedBluetoothtVersionsTlvAsData;
- (NSData)vehicleSupportedFrameworkVersionsTlvAsData;
- (NSString)vehicleSupportedFrameworkVersionsForCA;
- (id)description;
- (id)updateVehicleServerSupportedVersions:(uint64_t)a1;
- (id)updateVehicleSupportedAppletVersions:(uint64_t)a1;
- (id)updateVehicleSupportedFrameworkVersions:(uint64_t)a1;
- (uint64_t)generateFrameworkSupportedSharingVersions;
- (uint64_t)getAppletSupportedVersionForValue:(uint64_t)a1;
- (uint64_t)getKmlSupportedVersionForValue:(uint64_t)a1;
- (uint64_t)getVehicleServerSupportedVersionForValue:(uint64_t)a1;
- (uint64_t)initWithEndpoint:(void *)a3 downgradeFrameworkSetting:;
- (unsigned)agreedAppletVehicleVersion;
- (unsigned)agreedKmlBluetoothVersion;
- (unsigned)agreedKmlSharingVersion;
- (unsigned)agreedKmlVehicleServerVersion;
- (unsigned)agreedKmlVehicleVersion;
- (unsigned)keyRoleToShare;
- (unsigned)ourPreferredKmlVersion;
- (unsigned)ourPreferredVehicleServerVersion;
- (void)downgradePreferredVersion_internal;
- (void)generateAllData;
- (void)generateAppletSupportedVersions;
- (void)generateFrameworkSupportedPairingVersions;
- (void)parseVehicleSupportedVersions;
@end

@implementation KmlVersions

- (uint64_t)initWithEndpoint:(void *)a3 downgradeFrameworkSetting:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v35.receiver = (id)a1;
    v35.super_class = (Class)KmlVersions;
    v8 = (char *)objc_msgSendSuper2(&v35, sel_init);
    a1 = (uint64_t)v8;
    if (v8)
    {
      *((_WORD *)v8 + 8) = 0;
      v9 = (id *)(v8 + 8);
      objc_storeStrong((id *)v8 + 1, a2);
      v10 = *(void **)(a1 + 8);
      if (v10)
      {
        *(unsigned char *)(a1 + 17) = 1;
        v11 = [v10 readerInfo];
        v12 = (void *)[objc_alloc(MEMORY[0x263F8BD80]) initWithReaderInformation:v11];
        v13 = objc_opt_new();
        if (v7) {
          goto LABEL_6;
        }
        v14 = [v12 manufacturer];
        v15 = [v12 brand];
        v16 = [*v9 readerConfigID];
        id v7 = [v13 BOOLValueForSetting:1 manufacturer:v14 brand:v15 uuid:v16 error:0];

        if (v7) {
LABEL_6:
        }
          *(unsigned char *)(a1 + 17) = [v7 BOOLValue];
        v17 = [v12 manufacturer];
        v18 = [v12 brand];
        v19 = [*v9 readerConfigID];
        v20 = [v13 BOOLValueForSetting:3 manufacturer:v17 brand:v18 uuid:v19 error:0];

        if (v20) {
          *(unsigned char *)(a1 + 16) = [v20 BOOLValue];
        }
      }
      v21 = +[KmlVersionOverride sharedVersionsOverrides];
      *(_WORD *)(a1 + 32) = [v21 keyRoleToShare];
      v22 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = &unk_26C5BD648;

      *(_WORD *)(a1 + 22) = 256;
      if ([v21 kmlOverrideVersion] == 768 && !*(unsigned char *)(a1 + 17))
      {
        v30 = *(void **)(a1 + 96);
        *(void *)(a1 + 96) = &unk_26C5BD660;

        v31 = *(void **)(a1 + 104);
        *(void *)(a1 + 104) = &unk_26C5BD678;

        *(_WORD *)(a1 + 18) = 768;
        v32 = *(void **)(a1 + 120);
        *(void *)(a1 + 120) = &unk_26C5BD690;

        v33 = *(void **)(a1 + 128);
        *(void *)(a1 + 128) = &unk_26C5BD6A8;

        *(_WORD *)(a1 + 26) = 768;
      }
      else
      {
        -[KmlVersions downgradePreferredVersion_internal](a1);
      }
      [(KmlVersions *)a1 generateAllData];
    }
  }

  return a1;
}

- (void)downgradePreferredVersion_internal
{
  if (a1)
  {
    v2 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = &unk_26C5BD6C0;

    v3 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = &unk_26C5BD6D8;

    *(_WORD *)(a1 + 18) = 256;
    v4 = *(void **)(a1 + 120);
    *(void *)(a1 + 120) = &unk_26C5BD6F0;

    v5 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = &unk_26C5BD708;

    *(_WORD *)(a1 + 26) = 256;
  }
}

- (void)generateAllData
{
  if (a1)
  {
    -[KmlVersions generateFrameworkSupportedPairingVersions](a1);
    -[KmlVersions generateFrameworkSupportedSharingVersions](a1);
    -[KmlVersions generateAppletSupportedVersions](a1);
    [(KmlVersions *)a1 parseVehicleSupportedVersions];
  }
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  v4 = [NSString stringWithFormat:@"VehicleSupportedFrameworkVersions   : %@\n", self->_vehicleSupportedFrameworkVersionsTlvAsData];
  [v3 appendString:v4];

  v5 = [NSString stringWithFormat:@"VehicleSupportedAppletVersions      : %@\n", self->_vehicleSupportedAppletVersionsTlvAsData];
  [v3 appendString:v5];

  id v6 = [NSString stringWithFormat:@"VehicleSupportedBTVersions          : %@\n", self->_vehicleSupportedBluetoothVersionsTlvAsData];
  [v3 appendString:v6];

  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"PreferredFrameworkVersion           : 0x%02X\n", self->_ourPreferredKmlVersion);
  [v3 appendString:v7];

  v8 = objc_msgSend(NSString, "stringWithFormat:", @"AgreedFrameworkVersion              : 0x%02X\n", self->_agreedKmlVehicleVersion);
  [v3 appendString:v8];

  v9 = objc_msgSend(NSString, "stringWithFormat:", @"AgreedAppletVersion                 : 0x%02X\n", self->_agreedAppletVehicleVersion);
  [v3 appendString:v9];

  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"AgreedSharingFrameworkVersion       : 0x%02X\n", self->_agreedKmlSharingVersion);
  [v3 appendString:v10];

  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"AgreedVehicleServerVersion          : 0x%02X\n", self->_agreedKmlVehicleServerVersion);
  [v3 appendString:v11];

  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"AgreedBluetoothVersion              : 0x%02X\n", self->_agreedKmlBluetoothVersion);
  [v3 appendString:v12];

  return v3;
}

- (id)updateVehicleServerSupportedVersions:(uint64_t)a1
{
  v25[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ([v3 length])
    {
      +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v4);
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = (id)[v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v18;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v18 != v7) {
              objc_enumerationMutation(v5);
            }
            v9 = *(id **)(*((void *)&v17 + 1) + 8 * i);
            if (-[KmlTlv tag]((uint64_t)v9) == 93)
            {
              -[KmlTlv value](v9);
              id v6 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_13;
            }
          }
          id v6 = (id)[v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_13:

      if ((unint64_t)objc_msgSend(v6, "length", (void)v17) > 1)
      {
        id v6 = v6;
        uint64_t v14 = 0;
        *(_WORD *)(a1 + 28) = -[KmlVersions getVehicleServerSupportedVersionForValue:](a1, bswap32(*(unsigned __int16 *)[v6 bytes]) >> 16);
        goto LABEL_18;
      }
      uint64_t v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v11 = [NSString stringWithUTF8String:"com.apple.sesd.kml.pairing"];
      uint64_t v21 = *MEMORY[0x263F08320];
      uint64_t v12 = [NSString stringWithUTF8String:KmlErrorString(22)];
      v22 = v12;
      uint64_t v13 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v14 = [v10 errorWithDomain:v11 code:22 userInfo:v13];
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x263F087E8];
      id v5 = [NSString stringWithUTF8String:"com.apple.sesd.kml.pairing"];
      uint64_t v24 = *MEMORY[0x263F08320];
      id v6 = [NSString stringWithUTF8String:KmlErrorString(22)];
      v25[0] = v6;
      uint64_t v11 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
      uint64_t v14 = [v15 errorWithDomain:v5 code:22 userInfo:v11];
    }

LABEL_18:
    goto LABEL_19;
  }
  uint64_t v14 = 0;
LABEL_19:

  return v14;
}

- (uint64_t)getVehicleServerSupportedVersionForValue:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(a1 + 120);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v3);
      }
      if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "unsignedShortValue", (void)v9) == a2) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    a2 = 768;
  }

  return a2;
}

- (id)updateVehicleSupportedAppletVersions:(uint64_t)a1
{
  v35[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if ([v3 length])
    {
      +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v4);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v28;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v28 != v7) {
              objc_enumerationMutation(v5);
            }
            long long v9 = *(id **)(*((void *)&v27 + 1) + 8 * i);
            if (-[KmlTlv tag]((uint64_t)v9) == 92)
            {
              uint64_t v6 = -[KmlTlv value](v9);
              uint64_t v10 = -[KmlTlv asData]((uint64_t)v9);
              long long v11 = *(void **)(a1 + 80);
              *(void *)(a1 + 80) = v10;

              goto LABEL_13;
            }
          }
          uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_13:

      if ((unint64_t)[v6 length] > 1)
      {
        id v19 = v6;
        int v20 = -[KmlVersions getAppletSupportedVersionForValue:](a1, bswap32(*(unsigned __int16 *)[v19 bytes]) >> 16);
        *(_WORD *)(a1 + 24) = v20;
        if (v20)
        {
          long long v17 = 0;
          uint64_t v6 = v19;
LABEL_21:

          goto LABEL_22;
        }
        KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlVersions updateVehicleSupportedAppletVersions:]", 270, @"Treating unknown vehicle applet version as v1", v21, v22, v23, v24, v27);
        *(_WORD *)(a1 + 24) = 256;
        uint64_t v14 = +[KmlTlv TLVWithTag:unsignedShort:]((uint64_t)KmlTlv, 92, 0x100u);
        uint64_t v25 = -[KmlTlv asData]((uint64_t)v14);
        long long v17 = 0;
        uint64_t v15 = *(void **)(a1 + 80);
        *(void *)(a1 + 80) = v25;
      }
      else
      {
        long long v12 = *(void **)(a1 + 80);
        *(void *)(a1 + 80) = 0;

        uint64_t v13 = (void *)MEMORY[0x263F087E8];
        uint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", "com.apple.sesd.kml.pairing", (void)v27);
        uint64_t v31 = *MEMORY[0x263F08320];
        uint64_t v15 = [NSString stringWithUTF8String:KmlErrorString(22)];
        v32 = v15;
        uint64_t v16 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        long long v17 = [v13 errorWithDomain:v14 code:22 userInfo:v16];
      }
    }
    else
    {
      long long v18 = (void *)MEMORY[0x263F087E8];
      id v5 = [NSString stringWithUTF8String:"com.apple.sesd.kml.pairing"];
      uint64_t v34 = *MEMORY[0x263F08320];
      uint64_t v6 = [NSString stringWithUTF8String:KmlErrorString(22)];
      v35[0] = v6;
      uint64_t v14 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
      long long v17 = [v18 errorWithDomain:v5 code:22 userInfo:v14];
    }

    goto LABEL_21;
  }
  long long v17 = 0;
LABEL_22:

  return v17;
}

- (uint64_t)getAppletSupportedVersionForValue:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(a1 + 112);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v3);
      }
      if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "unsignedShortValue", (void)v9) == a2) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    a2 = 0;
  }

  return a2;
}

- (id)updateVehicleSupportedFrameworkVersions:(uint64_t)a1
{
  v39[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if ([v3 length])
    {
      +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v4);
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = (id)[v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v32;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v32 != v7) {
              objc_enumerationMutation(v5);
            }
            long long v9 = *(id **)(*((void *)&v31 + 1) + 8 * i);
            if (-[KmlTlv tag]((uint64_t)v9) == 91)
            {
              -[KmlTlv value](v9);
              id v6 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v10 = -[KmlTlv asData]((uint64_t)v9);
              long long v11 = *(void **)(a1 + 64);
              *(void *)(a1 + 64) = v10;

              goto LABEL_13;
            }
          }
          id v6 = (id)[v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_13:

      if ((unint64_t)[v6 length] > 1)
      {
        long long v18 = [MEMORY[0x263F089D8] string];
        id v6 = v6;
        id v19 = (unsigned __int16 *)[v6 bytes];
        unsigned int v20 = -[KmlVersions getKmlSupportedVersionForValue:](a1, bswap32(*v19) >> 16);
        *(_WORD *)(a1 + 20) = v20;
        if (!v20)
        {
          KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlVersions updateVehicleSupportedFrameworkVersions:]", 308, @"Treating unknown vehicle version as v1", v21, v22, v23, v24, v30);
          *(_WORD *)(a1 + 20) = 256;
          uint64_t v25 = +[KmlTlv TLVWithTag:unsignedShort:]((uint64_t)KmlTlv, 91, 0x100u);
          uint64_t v26 = -[KmlTlv asData]((uint64_t)v25);
          long long v27 = *(void **)(a1 + 64);
          *(void *)(a1 + 64) = v26;

          unsigned int v20 = *(unsigned __int16 *)(a1 + 20);
        }
        objc_msgSend(v18, "appendFormat:", @"%04X", v20);
        if ((unint64_t)[v6 length] >= 4) {
          objc_msgSend(v18, "appendFormat:", @",%04X", __rev16(v19[1]));
        }
        long long v28 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = v18;

        if (*(_WORD *)(a1 + 20) == 768) {
          *(_WORD *)(a1 + 28) = 768;
        }
        -[KmlVersions generateFrameworkSupportedSharingVersions](a1);
        a1 = 0;
        goto LABEL_24;
      }
      long long v12 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = 0;

      uint64_t v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = [NSString stringWithUTF8String:"com.apple.sesd.kml.pairing"];
      uint64_t v35 = *MEMORY[0x263F08320];
      uint64_t v15 = [NSString stringWithUTF8String:KmlErrorString(22)];
      v36 = v15;
      uint64_t v16 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      a1 = [v13 errorWithDomain:v14 code:22 userInfo:v16];
    }
    else
    {
      long long v17 = (void *)MEMORY[0x263F087E8];
      id v5 = [NSString stringWithUTF8String:"com.apple.sesd.kml.pairing"];
      uint64_t v38 = *MEMORY[0x263F08320];
      id v6 = [NSString stringWithUTF8String:KmlErrorString(22)];
      v39[0] = v6;
      uint64_t v14 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
      a1 = [v17 errorWithDomain:v5 code:22 userInfo:v14];
    }

LABEL_24:
  }

  return (id)a1;
}

- (uint64_t)getKmlSupportedVersionForValue:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(a1 + 96);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v3);
      }
      if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "unsignedShortValue", (void)v9) == a2) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    a2 = 0;
  }

  return a2;
}

- (uint64_t)generateFrameworkSupportedSharingVersions
{
  if (result)
  {
    uint64_t v1 = result;
    *(void *)(v1 + 48) = +[KmlTlv TLVWithTag:unsignedShort:]((uint64_t)KmlTlv, 84, *(unsigned __int16 *)(result + 20));
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)parseVehicleSupportedVersions
{
  if (a1)
  {
    *(_WORD *)(a1 + 20) = 256;
    *(_WORD *)(a1 + 24) = 256;
    *(_DWORD *)(a1 + 28) = 256;
    long long v10 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0;

    long long v11 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;

    long long v12 = *(void **)(a1 + 136);
    *(void *)(a1 + 136) = 0;

    long long v17 = *(void **)(a1 + 8);
    if (v17
      && ([v17 revocationAttestation],
          long long v18 = objc_claimAutoreleasedReturnValue(),
          v18,
          !v18))
    {
      id v19 = [*(id *)(a1 + 8) vehicleSupportedVersionsData];
      id v28 = v19;
      if (v19 && [v19 length])
      {
        id v24 = -[KmlVersions updateVehicleSupportedFrameworkVersions:](a1, v28);
        id v25 = -[KmlVersions updateVehicleSupportedAppletVersions:](a1, v28);
        id v26 = -[KmlVersions updateVehicleServerSupportedVersions:](a1, v28);
      }
      else
      {
        KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlVersions parseVehicleSupportedVersions]", 566, @"No vehicle supported versions data", v20, v21, v22, v23, v27);
      }
    }
    else
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlVersions parseVehicleSupportedVersions]", 559, @"Valid endpoint not set", v13, v14, v15, v16, a9);
    }
  }
}

- (void)generateFrameworkSupportedPairingVersions
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = [MEMORY[0x263EFF990] data];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v3 = *(id *)(a1 + 96);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v8, "unsignedShortValue", (void)v11) != 257) {
            objc_msgSend(v2, "appendU16BE:", objc_msgSend(v8, "unsignedShortValue"));
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }

    uint64_t v9 = +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 90, v2);
    long long v10 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v9;
  }
}

- (void)generateAppletSupportedVersions
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = [MEMORY[0x263EFF990] data];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = *(id *)(a1 + 112);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(v2, "appendU16BE:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7++), "unsignedShortValue", (void)v10));
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    uint64_t v8 = +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 92, v2);
    uint64_t v9 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v8;
  }
}

- (KmlTlv)kmlSupportedVersionsTlvForPairing
{
  return self->_kmlSupportedVersionsTlvForPairing;
}

- (KmlTlv)kmlSupportedVersionsTlvForShareInitiator
{
  return self->_kmlSupportedVersionsTlvForShareInitiator;
}

- (KmlTlv)appletSupportedVersionsTlvForPairing
{
  return self->_appletSupportedVersionsTlvForPairing;
}

- (NSData)vehicleSupportedFrameworkVersionsTlvAsData
{
  return self->_vehicleSupportedFrameworkVersionsTlvAsData;
}

- (NSString)vehicleSupportedFrameworkVersionsForCA
{
  return self->_vehicleSupportedFrameworkVersionsForCA;
}

- (NSData)vehicleSupportedAppletVersionsTlvAsData
{
  return self->_vehicleSupportedAppletVersionsTlvAsData;
}

- (NSData)vehicleSupportedBluetoothtVersionsTlvAsData
{
  return self->_vehicleSupportedBluetoothtVersionsTlvAsData;
}

- (unsigned)ourPreferredKmlVersion
{
  return self->_ourPreferredKmlVersion;
}

- (unsigned)agreedKmlVehicleVersion
{
  return self->_agreedKmlVehicleVersion;
}

- (unsigned)agreedKmlSharingVersion
{
  return self->_agreedKmlSharingVersion;
}

- (unsigned)agreedAppletVehicleVersion
{
  return self->_agreedAppletVehicleVersion;
}

- (unsigned)ourPreferredVehicleServerVersion
{
  return self->_ourPreferredVehicleServerVersion;
}

- (unsigned)agreedKmlVehicleServerVersion
{
  return self->_agreedKmlVehicleServerVersion;
}

- (unsigned)agreedKmlBluetoothVersion
{
  return self->_agreedKmlBluetoothVersion;
}

- (unsigned)keyRoleToShare
{
  return self->_keyRoleToShare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleSupportedBluetoothVersionsTlvAsData, 0);
  objc_storeStrong((id *)&self->_vehicleServerVersionsUpgradeReadyList, 0);
  objc_storeStrong((id *)&self->_kmlSupportedVehicleServerVersionsList, 0);
  objc_storeStrong((id *)&self->_appletSupportedVersionsList, 0);
  objc_storeStrong((id *)&self->_kmlUpgradeReadyVersionsList, 0);
  objc_storeStrong((id *)&self->_kmlSupportedVersionsList, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedBluetoothtVersionsTlvAsData, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedAppletVersionsTlvAsData, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedFrameworkVersionsForCA, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedFrameworkVersionsTlvAsData, 0);
  objc_storeStrong((id *)&self->_appletSupportedVersionsTlvForPairing, 0);
  objc_storeStrong((id *)&self->_kmlSupportedVersionsTlvForShareInitiator, 0);
  objc_storeStrong((id *)&self->_kmlSupportedVersionsTlvForPairing, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end