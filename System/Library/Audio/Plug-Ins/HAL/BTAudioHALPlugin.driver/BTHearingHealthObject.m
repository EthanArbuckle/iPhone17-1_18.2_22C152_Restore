@interface BTHearingHealthObject
- (BTHearingHealthObject)initWithUUID:(id)a3 productID:(unsigned int)a4 vendorID:(unsigned int)a5 EURegionBit:(unsigned __int8)a6 audioDevice:(void *)a7 readCharacteristics:(id)a8;
- (CBCentralManager)centralManager;
- (CBCharacteristic)dosimetrySensitivityCharacteristic;
- (CBCharacteristic)dosimetryVolumeCurveCharacteristic;
- (CBPeripheral)peripheral;
- (NSMutableArray)characteristics;
- (NSUUID)uuid;
- (float)getRegionalDosimetryVolumeCurve:(unsigned __int8)a3 productID:(unsigned int)a4;
- (id)centralManagerStateString;
- (void)audioDevice;
- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)connectPeripheral:(id)a3;
- (void)dealloc;
- (void)disconnectPeripheral:(id)a3 force:(BOOL)a4;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)readData:(id)a3;
- (void)registerService;
- (void)setAudioDevice:(void *)a3;
- (void)setCentralManager:(id)a3;
- (void)setCharacteristics:(id)a3;
- (void)setDosimetrySensitivityCharacteristic:(id)a3;
- (void)setDosimetryVolumeCurveCharacteristic:(id)a3;
- (void)setPeripheral:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateRegionalDosimetryVolumeCurve:(unsigned __int8)a3 productID:(unsigned int)a4 audioDevice:(void *)a5;
- (void)writeData:(id)a3 forCharacteristic:(id)a4;
@end

@implementation BTHearingHealthObject

- (BTHearingHealthObject)initWithUUID:(id)a3 productID:(unsigned int)a4 vendorID:(unsigned int)a5 EURegionBit:(unsigned __int8)a6 audioDevice:(void *)a7 readCharacteristics:(id)a8
{
  uint64_t v10 = a6;
  v46.receiver = self;
  v46.super_class = (Class)BTHearingHealthObject;
  v14 = [(BTHearingHealthObject *)&v46 init];
  v15 = v14;
  if (v14)
  {
    if (a5 == 76)
    {
      unsigned int v20 = a4 - 8194;
      char v17 = 0;
      v18 = (float *)&dword_96AC0;
      float v19 = 98.0;
      switch(v20)
      {
        case 0u:
        case 0xCu:
        case 0xDu:
          break;
        case 1u:
          v18 = [(BTHearingHealthObject *)v14 getRegionalDosimetryVolumeCurve:v10 productID:8195];
          char v17 = 0;
          *(float *)&int v21 = 99.0;
          goto LABEL_17;
        case 3u:
          v18 = [(BTHearingHealthObject *)v14 getRegionalDosimetryVolumeCurve:v10 productID:8197];
          char v17 = 0;
          *(float *)&int v21 = 98.0;
          goto LABEL_17;
        case 4u:
          v18 = [(BTHearingHealthObject *)v14 getRegionalDosimetryVolumeCurve:v10 productID:8198];
          char v17 = 0;
          *(float *)&int v21 = 101.0;
          goto LABEL_17;
        case 7u:
          v18 = [(BTHearingHealthObject *)v14 getRegionalDosimetryVolumeCurve:v10 productID:8201];
          char v17 = 0;
          *(float *)&int v21 = 102.0;
          goto LABEL_17;
        case 9u:
        case 0xBu:
          char v17 = 0;
          *(float *)&int v21 = 97.5;
          goto LABEL_17;
        case 0xAu:
          char v17 = 0;
          float v19 = 97.75;
          break;
        case 0xEu:
          v18 = [(BTHearingHealthObject *)v14 getRegionalDosimetryVolumeCurve:v10 productID:8208];
          char v17 = 0;
          float v19 = 98.7;
          break;
        default:
          char v17 = 1;
          v18 = (float *)&dword_96AC0;
          *(float *)&int v21 = 100.0;
          goto LABEL_17;
      }
    }
    else
    {
      if (a5 == 158)
      {
        HIDWORD(v16) = a4;
        LODWORD(v16) = a4 - 16402;
        char v17 = 0;
        v18 = (float *)&dword_96C14;
        float v19 = 95.4;
        switch((v16 >> 1))
        {
          case 0u:
          case 3u:
            char v17 = 0;
            goto LABEL_16;
          case 1u:
            char v17 = 0;
            float v19 = 95.7;
            goto LABEL_18;
          case 7u:
            goto LABEL_18;
          case 9u:
            char v17 = 0;
            v18 = (float *)&dword_96C58;
LABEL_16:
            *(float *)&int v21 = 97.0;
            goto LABEL_17;
          default:
            return v15;
        }
      }
      if (a4 == 4110 && a5 == 259)
      {
        char v17 = 0;
        v18 = (float *)&dword_96C9C;
        *(float *)&int v21 = 92.0;
LABEL_17:
        float v19 = *(float *)&v21;
      }
      else
      {
        if (a4 != 771 || a5 != 474) {
          return v15;
        }
        char v17 = 0;
        v18 = (float *)&dword_96CE0;
        float v19 = 92.8;
      }
    }
LABEL_18:
    v22 = qword_A1AD8;
    if (os_log_type_enabled((os_log_t)qword_A1AD8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = v19;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Dosimetry sensitivity = %f", buf, 0xCu);
      v22 = qword_A1AD8;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      double v23 = *v18;
      double v24 = v18[1];
      double v25 = v18[2];
      double v26 = v18[3];
      double v27 = v18[4];
      double v28 = v18[5];
      double v29 = v18[6];
      double v30 = v18[7];
      double v31 = v18[8];
      double v32 = v18[9];
      double v33 = v18[10];
      double v34 = v18[11];
      double v35 = v18[12];
      double v36 = v18[13];
      double v37 = v18[14];
      double v38 = v18[15];
      double v39 = v18[16];
      *(_DWORD *)buf = 134222080;
      *(double *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = v25;
      *(_WORD *)&buf[32] = 2048;
      *(double *)&buf[34] = v26;
      *(_WORD *)&buf[42] = 2048;
      *(double *)&buf[44] = v27;
      *(_WORD *)&buf[52] = 2048;
      *(double *)&buf[54] = v28;
      *(_WORD *)&buf[62] = 2048;
      *(double *)&buf[64] = v29;
      *(_WORD *)&buf[72] = 2048;
      *(double *)&buf[74] = v30;
      *(_WORD *)&buf[82] = 2048;
      *(double *)&buf[84] = v31;
      *(_WORD *)&buf[92] = 2048;
      *(double *)&buf[94] = v32;
      *(_WORD *)&buf[102] = 2048;
      *(double *)&buf[104] = v33;
      *(_WORD *)&buf[112] = 2048;
      *(double *)&buf[114] = v34;
      *(_WORD *)&buf[122] = 2048;
      *(double *)&buf[124] = v35;
      *(_WORD *)&buf[132] = 2048;
      *(double *)&buf[134] = v36;
      __int16 v50 = 2048;
      double v51 = v37;
      __int16 v52 = 2048;
      double v53 = v38;
      __int16 v54 = 2048;
      double v55 = v39;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Dosimetry volume curve = [%f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f]", buf, 0xACu);
    }
    (*(void (**)(void *, float))(*(void *)a7 + 1352))(a7, v19);
    uint64_t v40 = 0;
    memset(buf, 0, 136);
    do
    {
      *(void *)&buf[v40] = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloat32Type, v18);
      v40 += 8;
      ++v18;
    }
    while (v40 != 136);
    CFArrayRef v41 = CFArrayCreate(kCFAllocatorDefault, (const void **)buf, 17, &kCFTypeArrayCallBacks);
    (*(void (**)(void *, CFArrayRef))(*(void *)a7 + 1360))(a7, v41);
    for (uint64_t i = 0; i != 136; i += 8)
    {
      v43 = *(const void **)&buf[i];
      if (v43) {
        CFRelease(v43);
      }
    }
    CFRelease(v41);
    if (v17)
    {
      id v44 = objc_alloc((Class)CBCentralManager);
      v47[0] = CBCentralManagerOptionReceiveSystemEvents;
      v47[1] = CBManagerNeedsRestrictedStateOperation;
      v48[0] = &__kCFBooleanTrue;
      v48[1] = &__kCFBooleanTrue;
      v15->_centralManager = (CBCentralManager *)objc_msgSend(v44, "initWithDelegate:queue:options:", v15, &_dispatch_main_q, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 2));
      [(BTHearingHealthObject *)v15 setUuid:a3];
      [(BTHearingHealthObject *)v15 setCharacteristics:a8];
      [(BTHearingHealthObject *)v15 setAudioDevice:a7];
    }
  }
  return v15;
}

- (void)dealloc
{
  self->_audioDevice = 0;

  self->_centralManager = 0;
  self->_peripheral = 0;

  self->_uuid = 0;
  self->_dosimetrySensitivityCharacteristic = 0;

  self->_dosimetryVolumeCurveCharacteristic = 0;
  self->_characteristics = 0;
  v3.receiver = self;
  v3.super_class = (Class)BTHearingHealthObject;
  [(BTHearingHealthObject *)&v3 dealloc];
}

- (void)registerService
{
  if ([(BTHearingHealthObject *)self centralManager]
    && [(CBCentralManager *)[(BTHearingHealthObject *)self centralManager] state] == (char *)&dword_4 + 1)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    id v3 = objc_alloc_init((Class)NSMutableArray);
    objc_msgSend(v3, "addObject:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDAppleHeadsetPropertyServiceString));
    [v4 setObject:v3 forKeyedSubscript:CBConnectionEventMatchingOptionServiceUUIDs];
    [(CBCentralManager *)[(BTHearingHealthObject *)self centralManager] registerForConnectionEventsWithOptions:v4];
  }
}

- (void)connectPeripheral:(id)a3
{
  if ([(CBCentralManager *)[(BTHearingHealthObject *)self centralManager] state] == (char *)&dword_4 + 1)
  {
    v5 = [(BTHearingHealthObject *)self centralManager];
    [(CBCentralManager *)v5 connectPeripheral:a3 options:0];
  }
}

- (void)disconnectPeripheral:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(CBCentralManager *)[(BTHearingHealthObject *)self centralManager] state] == (char *)&dword_4 + 1
    && [a3 state])
  {
    v7 = &__kCFBooleanTrue;
    if (!v4) {
      v7 = &__kCFBooleanFalse;
    }
    v8[0] = CBCancelPeripheralConnectionOptionForce;
    v8[1] = CBCancelPeripheralConnectionOptionDoNotAutoConnectBuiltInServices;
    v9[0] = v7;
    v9[1] = &__kCFBooleanFalse;
    [(CBCentralManager *)[(BTHearingHealthObject *)self centralManager] cancelPeripheralConnection:a3 options:+[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2]];
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  if ([(CBCentralManager *)[(BTHearingHealthObject *)self centralManager] state] == (char *)&dword_4 + 1)
  {
    [(BTHearingHealthObject *)self registerService];
  }
  else if ([(CBCentralManager *)[(BTHearingHealthObject *)self centralManager] state] == &dword_4 {
         || [(CBCentralManager *)[(BTHearingHealthObject *)self centralManager] state] == (char *)&dword_0 + 1)
  }
  {
    [(BTHearingHealthObject *)self setPeripheral:0];
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  if (objc_msgSend(objc_msgSend(a4, "identifier", a3), "isEqual:", -[BTHearingHealthObject uuid](self, "uuid")))
  {
    v6 = qword_A1AD8;
    if (os_log_type_enabled((os_log_t)qword_A1AD8, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      v8 = [(BTHearingHealthObject *)self uuid];
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Connected AHPS peripheral - UUID=%@", (uint8_t *)&v7, 0xCu);
    }
    [a4 setDelegate:self];
    [(CBPeripheral *)[(BTHearingHealthObject *)self peripheral] discoverServices:0];
  }
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = objc_msgSend(a3, "services", 0);
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = CBUUIDAppleHeadsetPropertyServiceString;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v9)))
        {
          v12 = qword_A1AD8;
          if (os_log_type_enabled((os_log_t)qword_A1AD8, OS_LOG_TYPE_DEFAULT))
          {
            v13 = [(BTHearingHealthObject *)self uuid];
            *(_DWORD *)buf = 138412290;
            float v19 = v13;
            _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Discovered AHPS - UUID=%@", buf, 0xCu);
          }
          [(CBPeripheral *)[(BTHearingHealthObject *)self peripheral] discoverCharacteristics:0 forService:v11];
          return;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(a4, "characteristics", a3, 0);
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    uint64_t v10 = CBUUIDDosimetrySensitivityCharacteristicString;
    uint64_t v11 = CBUUIDDosimetryVolumeCurveCharacteristicString;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v13, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v10)))
        {
          [(BTHearingHealthObject *)self setDosimetrySensitivityCharacteristic:v13];
        }
        else if (objc_msgSend(objc_msgSend(v13, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v11)))
        {
          [(BTHearingHealthObject *)self setDosimetryVolumeCurveCharacteristic:v13];
        }
        if (-[NSMutableArray containsObject:](-[BTHearingHealthObject characteristics](self, "characteristics"), "containsObject:", [v13 UUID]))-[BTHearingHealthObject readData:](self, "readData:", v13); {
      }
        }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v6 = qword_A1AD8;
  if (os_log_type_enabled((os_log_t)qword_A1AD8, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = [(BTHearingHealthObject *)self uuid];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Failed to connect AHPS peripheral - UUID=%@", (uint8_t *)&v7, 0xCu);
  }
  [(BTHearingHealthObject *)self setPeripheral:0];
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v6 = qword_A1AD8;
  if (os_log_type_enabled((os_log_t)qword_A1AD8, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = [(BTHearingHealthObject *)self uuid];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Disconnected AHPS peripheral - UUID=%@", (uint8_t *)&v7, 0xCu);
  }
  [(BTHearingHealthObject *)self setPeripheral:0];
}

- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5
{
  if (a4)
  {
    if (a4 == 1
      && objc_msgSend(objc_msgSend(a5, "identifier", a3), "isEqual:", -[BTHearingHealthObject uuid](self, "uuid"))&& !-[BTHearingHealthObject peripheral](self, "peripheral"))
    {
      [(BTHearingHealthObject *)self setPeripheral:a5];
      [(BTHearingHealthObject *)self connectPeripheral:a5];
    }
  }
  else
  {
    -[BTHearingHealthObject disconnectPeripheral:force:](self, "disconnectPeripheral:force:", a5);
  }
}

- (id)centralManagerStateString
{
  v2 = (char *)[(CBCentralManager *)[(BTHearingHealthObject *)self centralManager] state];
  if ((unint64_t)(v2 - 1) > 9) {
    return @"unknown";
  }
  else {
    return off_8E240[(void)(v2 - 1)];
  }
}

- (void)writeData:(id)a3 forCharacteristic:(id)a4
{
  id v6 = [(BTHearingHealthObject *)self peripheral];

  [(CBPeripheral *)v6 writeValue:a3 forCharacteristic:a4 type:1];
}

- (void)readData:(id)a3
{
  BOOL v4 = [(BTHearingHealthObject *)self peripheral];

  [(CBPeripheral *)v4 readValueForCharacteristic:a3];
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  if ([(BTHearingHealthObject *)self audioDevice])
  {
    id v9 = [a4 UUID];
    if (objc_msgSend(v9, "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDDosimetrySensitivityCharacteristicString)))
    {
      if (a5)
      {
        if (os_log_type_enabled((os_log_t)qword_A1AD8, OS_LOG_TYPE_ERROR)) {
          sub_66F68(a3);
        }
      }
      else if ((unint64_t)objc_msgSend(objc_msgSend(a4, "value"), "length") < 4)
      {
        if (os_log_type_enabled((os_log_t)qword_A1AD8, OS_LOG_TYPE_ERROR)) {
          sub_66ECC(a3);
        }
      }
      else
      {
        LODWORD(v18) = 0;
        objc_msgSend(objc_msgSend(a4, "value"), "getBytes:length:", &v18, 4);
        uint64_t v11 = [(BTHearingHealthObject *)self audioDevice];
        v12.n128_u32[0] = v18;
        (*(void (**)(__n128))(*(void *)v11 + 1352))(v12);
      }
    }
    else
    {
      id v10 = [a4 UUID];
      if (objc_msgSend(v10, "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDDosimetryVolumeCurveCharacteristicString)))
      {
        if (a5)
        {
          if (os_log_type_enabled((os_log_t)qword_A1AD8, OS_LOG_TYPE_ERROR)) {
            sub_67080(a3);
          }
        }
        else if ((unint64_t)objc_msgSend(objc_msgSend(a4, "value"), "length") < 0x44)
        {
          if (os_log_type_enabled((os_log_t)qword_A1AD8, OS_LOG_TYPE_ERROR)) {
            sub_66FE4(a3);
          }
        }
        else
        {
          int v28 = 0;
          memset(v27, 0, sizeof(v27));
          v13 = v27;
          objc_msgSend(objc_msgSend(a4, "value"), "getBytes:length:", v27, 68);
          uint64_t v14 = 0;
          uint64_t v26 = 0;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          do
          {
            *(void *)((char *)&v18 + v14) = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloat32Type, v13);
            v14 += 8;
            v13 = (_OWORD *)((char *)v13 + 4);
          }
          while (v14 != 136);
          CFArrayRef v15 = CFArrayCreate(kCFAllocatorDefault, (const void **)&v18, 17, &kCFTypeArrayCallBacks);
          (*(void (**)(void))(*(void *)[(BTHearingHealthObject *)self audioDevice]+ 1360))();
          for (uint64_t i = 0; i != 136; i += 8)
          {
            long long v17 = *(const void **)((char *)&v18 + i);
            if (v17) {
              CFRelease(v17);
            }
          }
          if (v15) {
            CFRelease(v15);
          }
        }
      }
    }
  }
}

- (float)getRegionalDosimetryVolumeCurve:(unsigned __int8)a3 productID:(unsigned int)a4
{
  result = (float *)&dword_96AC0;
  switch(a4)
  {
    case 0x2003u:
    case 0x2005u:
      id v5 = (float *)&unk_96BD0;
      goto LABEL_10;
    case 0x2004u:
    case 0x2007u:
    case 0x2008u:
      return result;
    case 0x2006u:
      id v5 = (float *)&unk_96B8C;
      goto LABEL_10;
    case 0x2009u:
      id v5 = (float *)&unk_96B48;
LABEL_10:
      if (a3) {
        result = v5;
      }
      else {
        result = (float *)&unk_96B04;
      }
      break;
    default:
      id v6 = (float *)&unk_96BD0;
      if (!a3) {
        id v6 = (float *)&unk_96B04;
      }
      if (a4 == 8208) {
        result = v6;
      }
      break;
  }
  return result;
}

- (void)updateRegionalDosimetryVolumeCurve:(unsigned __int8)a3 productID:(unsigned int)a4 audioDevice:(void *)a5
{
  if (a5)
  {
    id v6 = [(BTHearingHealthObject *)self getRegionalDosimetryVolumeCurve:a3 productID:*(void *)&a4];
    uint64_t v7 = 0;
    uint64_t v12 = 0;
    memset(v11, 0, sizeof(v11));
    do
    {
      *(void *)((char *)v11 + v7) = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloat32Type, v6);
      v7 += 8;
      ++v6;
    }
    while (v7 != 136);
    CFArrayRef v8 = CFArrayCreate(kCFAllocatorDefault, (const void **)v11, 17, &kCFTypeArrayCallBacks);
    (*(void (**)(void *, CFArrayRef))(*(void *)a5 + 1360))(a5, v8);
    for (uint64_t i = 0; i != 136; i += 8)
    {
      id v10 = *(const void **)((char *)v11 + i);
      if (v10) {
        CFRelease(v10);
      }
    }
    CFRelease(v8);
  }
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (CBCharacteristic)dosimetrySensitivityCharacteristic
{
  return self->_dosimetrySensitivityCharacteristic;
}

- (void)setDosimetrySensitivityCharacteristic:(id)a3
{
}

- (CBCharacteristic)dosimetryVolumeCurveCharacteristic
{
  return self->_dosimetryVolumeCurveCharacteristic;
}

- (void)setDosimetryVolumeCurveCharacteristic:(id)a3
{
}

- (NSMutableArray)characteristics
{
  return self->_characteristics;
}

- (void)setCharacteristics:(id)a3
{
}

- (void)audioDevice
{
  return self->_audioDevice;
}

- (void)setAudioDevice:(void *)a3
{
  self->_audioDevice = a3;
}

@end