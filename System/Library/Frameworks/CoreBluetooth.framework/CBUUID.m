@interface CBUUID
+ (CBUUID)UUIDWithCFUUID:(CFUUIDRef)theUUID;
+ (CBUUID)UUIDWithData:(NSData *)theData;
+ (CBUUID)UUIDWithNSUUID:(NSUUID *)theUUID;
+ (CBUUID)UUIDWithString:(NSString *)theString;
- (BOOL)isEqual:(id)a3;
- (CBUUID)initWithCFUUID:(__CFUUID *)a3;
- (CBUUID)initWithData:(id)a3;
- (CBUUID)initWithNSUUID:(id)a3;
- (CBUUID)initWithString:(id)a3;
- (CBUUID)initWithString:(id)a3 safe:(BOOL)a4;
- (NSData)data;
- (NSString)UUIDString;
- (id)description;
- (unint64_t)hash;
@end

@implementation CBUUID

- (NSData)data
{
  unint64_t type = self->_type;
  if (type > 2)
  {
    v3 = 0;
  }
  else
  {
    v3 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:(char *)self + qword_1ABA90598[type] length:qword_1ABA905B0[type] freeWhenDone:0];
  }
  return (NSData *)v3;
}

+ (CBUUID)UUIDWithString:(NSString *)theString
{
  v3 = theString;
  v4 = [[CBUUID alloc] initWithString:v3];

  return v4;
}

- (CBUUID)initWithString:(id)a3 safe:(BOOL)a4
{
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CBUUID;
  v8 = [(CBUUID *)&v18 init];
  if (!v8) {
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "compare:options:range:", @"0x", 1, 0, 2))
  {
    id v9 = v7;
    uint64_t v10 = [v9 length];
    if (v10 != 36) {
      goto LABEL_4;
    }
LABEL_9:
    v8->_unint64_t type = 2;
    id v12 = v9;
    v13 = (const char *)[v12 UTF8String];
    if (!v13) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v9 = [v7 substringFromIndex:2];
  uint64_t v10 = [v9 length];
  if (v10 == 36) {
    goto LABEL_9;
  }
LABEL_4:
  if (v10 == 8)
  {
    v14 = objc_msgSend(@"00000000-0000-1000-8000-00805F9B34FB", "stringByReplacingCharactersInRange:withString:", 0, 8, v9);

    v8->_unint64_t type = 1;
    id v12 = v14;
    v13 = (const char *)[v12 UTF8String];
    if (!v13) {
      goto LABEL_15;
    }
  }
  else if (v10 == 4)
  {
    v11 = objc_msgSend(@"00000000-0000-1000-8000-00805F9B34FB", "stringByReplacingCharactersInRange:withString:", 4, 4, v9);

    v8->_unint64_t type = 0;
    id v12 = v11;
    v13 = (const char *)[v12 UTF8String];
    if (!v13) {
      goto LABEL_15;
    }
  }
  else
  {

    id v12 = 0;
    v13 = (const char *)[v12 UTF8String];
    if (!v13) {
      goto LABEL_15;
    }
  }
LABEL_14:
  if (!uuid_parse(v13, v8->_bytes))
  {
LABEL_18:

LABEL_19:
    v15 = v8;
    goto LABEL_20;
  }
LABEL_15:
  if (!a4)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, v8, @"CBUUID.m", 330, @"String %@ does not represent a valid UUID", v7 object file lineNumber description];

    goto LABEL_18;
  }

  v15 = 0;
LABEL_20:

  return v15;
}

- (CBUUID)initWithString:(id)a3
{
  return [(CBUUID *)self initWithString:a3 safe:0];
}

- (CBUUID)initWithData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CBUUID;
  v6 = [(CBUUID *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [v5 length];
    switch(v7)
    {
      case 16:
        [v5 getBytes:v6 + 8 length:16];
        v6[24] = 2;
        break;
      case 4:
        *(_OWORD *)(v6 + 8) = CBBluetoothBaseUUIDData;
        [v5 getBytes:v6 + 8 length:4];
        v6[24] = 1;
        break;
      case 2:
        *(_OWORD *)(v6 + 8) = CBBluetoothBaseUUIDData;
        [v5 getBytes:v6 + 10 length:2];
        v6[24] = 0;
        break;
      default:
        v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a2, v6, @"CBUUID.m", 357, @"Data %@ does not represent a valid UUID", v5 object file lineNumber description];

        break;
    }
  }

  return (CBUUID *)v6;
}

- (CBUUID)initWithCFUUID:(__CFUUID *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CBUUID;
  v4 = [(CBUUID *)&v6 init];
  if (v4)
  {
    *(CFUUIDBytes *)(v4 + 8) = CFUUIDGetUUIDBytes(a3);
    v4[24] = 2;
  }
  return (CBUUID *)v4;
}

- (CBUUID)initWithNSUUID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CBUUID;
  id v5 = [(CBUUID *)&v8 init];
  objc_super v6 = v5;
  if (v5)
  {
    [v4 getUUIDBytes:v5->_bytes];
    v6->_unint64_t type = 2;
  }

  return v6;
}

+ (CBUUID)UUIDWithData:(NSData *)theData
{
  v3 = theData;
  id v4 = [[CBUUID alloc] initWithData:v3];

  return v4;
}

+ (CBUUID)UUIDWithCFUUID:(CFUUIDRef)theUUID
{
  v3 = [[CBUUID alloc] initWithCFUUID:theUUID];

  return v3;
}

+ (CBUUID)UUIDWithNSUUID:(NSUUID *)theUUID
{
  v3 = theUUID;
  id v4 = [[CBUUID alloc] initWithNSUUID:v3];

  return v4;
}

- (NSString)UUIDString
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int type = self->_type;
  if (type == 2)
  {
    memset(out, 0, 37);
    uuid_unparse_upper(self->_bytes, out);
    v3 = [NSString stringWithUTF8String:out];
    goto LABEL_8;
  }
  if (type == 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%02X%02X%02X%02X", self->_bytes[0], self->_bytes[1], self->_bytes[2], self->_bytes[3]);
    goto LABEL_7;
  }
  if (!self->_type)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%02X%02X", self->_bytes[2], self->_bytes[3], v5, v6);
    v3 = LABEL_7:;
    goto LABEL_8;
  }
  v3 = 0;
LABEL_8:

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v6 = *(void *)self->_bytes == v4[1] && *(void *)&self->_bytes[8] == v4[2];

    return v6;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  return *(void *)&self->_bytes[8] ^ *(void *)self->_bytes;
}

- (id)description
{
  if (qword_1EB479250 != -1) {
    dispatch_once(&qword_1EB479250, &__block_literal_global_2);
  }
  v3 = [(CBUUID *)self UUIDString];
  id v4 = [(id)_MergedGlobals_1 objectForKeyedSubscript:v3];
  uint64_t v5 = v4;
  if (!v4) {
    id v4 = v3;
  }
  id v6 = v4;

  return v6;
}

void __21__CBUUID_description__block_invoke()
{
  v3[107] = *MEMORY[0x1E4F143B8];
  v2[0] = @"1800";
  v2[1] = @"1801";
  v3[0] = @"Generic Access Profile";
  v3[1] = @"Generic Attribute Profile";
  v2[2] = @"2900";
  v2[3] = @"2901";
  v3[2] = @"Characteristic Extended Properties";
  v3[3] = @"Characteristic User Description";
  v2[4] = @"2902";
  v2[5] = @"2903";
  v3[4] = @"Client Characteristic Configuration";
  v3[5] = @"Server Characteristic Configuration";
  v2[6] = @"2904";
  v2[7] = @"2905";
  v3[6] = @"Characteristic Format";
  v3[7] = @"Characteristic Aggregate Format";
  v2[8] = @"2A00";
  v2[9] = @"2A01";
  v3[8] = @"Device Name";
  v3[9] = @"Appearence";
  v2[10] = @"2A02";
  v2[11] = @"2A03";
  v3[10] = @"Peripheral Privacy Flag";
  v3[11] = @"Reconnection Address";
  v2[12] = @"2A04";
  v2[13] = @"2A05";
  v3[12] = @"Peripheral Preferred Connection Parameters";
  v3[13] = @"Service Changed";
  v2[14] = @"1805";
  v2[15] = @"2A2B";
  v3[14] = @"Current Time";
  v3[15] = @"Current Time";
  v2[16] = @"2A0F";
  v2[17] = @"180A";
  v3[16] = @"Local Time Information";
  v3[17] = @"Device Information";
  v2[18] = @"2A29";
  v2[19] = @"2A24";
  v3[18] = @"Manufacturer Name String";
  v3[19] = @"Model Number String";
  v2[20] = @"2A25";
  v2[21] = @"2A27";
  v3[20] = @"Serial Number String";
  v3[21] = @"Hardware Revision String";
  v2[22] = @"2A26";
  v2[23] = @"2A28";
  v3[22] = @"Firmware Revision String";
  v3[23] = @"Software Revision String";
  v2[24] = @"2A23";
  v2[25] = @"2A2A";
  v3[24] = @"System ID";
  v3[25] = @"IEEE Regulatory Certification";
  v2[26] = @"2A50";
  v2[27] = @"2BFF";
  v3[26] = @"PnP ID";
  v3[27] = @"UDI For Medical Device";
  v2[28] = @"180F";
  v2[29] = @"2A19";
  v3[28] = @"Battery";
  v3[29] = @"Battery Level";
  v2[30] = @"2A1A";
  v2[31] = @"1812";
  v3[30] = @"Battery Power State";
  v3[31] = @"Human Interface Device";
  v2[32] = @"2A4E";
  v2[33] = @"2A4D";
  v3[32] = @"Protocol Mode";
  v3[33] = @"Report";
  v2[34] = @"2A4B";
  v2[35] = @"2A22";
  v3[34] = @"Report Map";
  v3[35] = @"Boot Keyboard Input Report";
  v2[36] = @"2A32";
  v2[37] = @"2A33";
  v3[36] = @"Boot Keyboard Output Report";
  v3[37] = @"Boot Mouse Input Report";
  v2[38] = @"2A4A";
  v2[39] = @"2A4C";
  v3[38] = @"HID Information";
  v3[39] = @"HID Control Point";
  v2[40] = @"2908";
  v2[41] = @"7905F431-B5CE-4E99-A40F-4B1E122D00D0";
  v3[40] = @"Report Reference";
  v3[41] = @"Apple Notification Center";
  v2[42] = @"69D1D8F3-45E1-49A8-9821-9BBDFDAAD9D9";
  v2[43] = @"9FBF120D-6301-42D9-8C58-25E699A21DBD";
  v3[42] = @"ANCS Control Point";
  v3[43] = @"ANCS Notification Source";
  v2[44] = @"22EAC6E9-24D6-4BB5-BE44-B36ACE7C7BFB";
  v2[45] = @"89D3502B-0F36-433A-8EF4-C502AD55F8DC";
  v3[44] = @"ANCS Data Source";
  v3[45] = @"Apple Media";
  v2[46] = @"9B3C81D8-57B1-4A8A-B8DF-0E56F7CA51C2";
  v2[47] = @"2F7CABCE-808D-411F-9A0C-BB92BA96C102";
  v3[46] = @"AMS Remote Command";
  v3[47] = @"AMS Entity Update";
  v2[48] = @"C6B2F38C-23AB-46D8-A6AB-A3A870BBD5D7";
  v2[49] = @"4715650B-5E9D-4AC2-B898-A4FC0AA5DF78";
  v3[48] = @"AMS Entity Attribute";
  v3[49] = @"Unified Accessory Restore";
  v2[50] = @"94110001-6D9B-4225-A4F1-6A4A7F01B0DE";
  v2[51] = @"1810";
  v3[50] = @"UARP Data Control Point";
  v3[51] = @"Blood Pressure";
  v2[52] = @"1816";
  v2[53] = @"1814";
  v3[52] = @"Cycling Speed and Cadence";
  v3[53] = @"Running Speed and Cadence";
  v2[54] = @"1818";
  v2[55] = @"1808";
  v3[54] = @"Cycling Power";
  v3[55] = @"Glucose";
  v2[56] = @"1809";
  v2[57] = @"180D";
  v3[56] = @"Health Thermometer";
  v3[57] = @"Heart Rate";
  v2[58] = @"181B";
  v2[59] = @"181D";
  v3[58] = @"Body Composition";
  v3[59] = @"Weight Scale";
  v2[60] = @"181F";
  v2[61] = @"1822";
  v3[60] = @"Continuous Glucose Monitoring";
  v3[61] = @"Pulse Oximeter";
  v2[62] = @"183A";
  v2[63] = @"183E";
  v3[62] = @"Insulin Delivery";
  v3[63] = @"Physical Activity Monitor";
  v2[64] = @"1840";
  v3[64] = @"Generic Health Sensor";
  v2[65] = @"2BF3";
  v3[65] = @"Health Sensor Features";
  v2[66] = @"2B8B";
  v3[66] = @"Live Health Observations";
  v2[67] = @"2BDD";
  v3[67] = @"Stored Health Observations";
  v2[68] = @"2A52";
  v3[68] = @"RACP";
  v2[69] = @"2BF4";
  v3[69] = @"GHS Control Point";
  v2[70] = @"2BF1";
  v3[70] = @"Observation Schedule Changed";
  v2[71] = @"183F";
  v3[71] = @"Elapsed Time";
  v2[72] = @"2BF2";
  v3[72] = @"Current Elapsed Time";
  v2[73] = @"181C";
  v3[73] = @"User Data";
  v2[74] = @"2A99";
  v3[74] = @"Database Change Increment";
  v2[75] = @"2A9A";
  v3[75] = @"User Index";
  v2[76] = @"2A9F";
  v3[76] = @"User Control Point";
  v2[77] = @"2B37";
  v3[77] = @"Registered User";
  v2[78] = @"0x2A37";
  v3[78] = @"Heart Rate Measurement";
  v2[79] = @"0x2A38";
  v3[79] = @"Body Sensor Location";
  v2[80] = @"0x2A39";
  v3[80] = @"Heart Rate Control Point";
  v2[81] = @"181E";
  v3[81] = @"Bond Management";
  v2[82] = @"D0611E78-BBB4-4591-A5F8-487910AE4366";
  v3[82] = @"Continuity";
  v2[83] = @"8667556C-9A37-4C91-84ED-54EE27D90049";
  v3[83] = @"Continuity";
  v2[84] = @"03B80E5A-EDE8-4B33-A751-6CE34EC4C700";
  v3[84] = @"BLE MIDI";
  v2[85] = @"9bd708d7-64c7-4e9f-9ded-f6b6c4551967";
  v3[85] = @"DoAP";
  v2[86] = @"f195b8fb-a9e2-4401-858b-2f87a06928a8";
  v3[86] = @"DoAP Supported Codec";
  v2[87] = @"e1f9b835-7e47-413d-af94-c68e574b8f7e";
  v3[87] = @"DoAP Select Codec";
  v2[88] = @"a08ce5ef-698a-42a2-b980-7f3ac00b3845";
  v3[88] = @"DoAP Start Streaming";
  v2[89] = @"6288ea2d-7b89-47ad-890b-9fa6bf3cfc58";
  v3[89] = @"DoAP Stop Streaming";
  v2[90] = @"3f1c161d-6473-4746-91f5-6d27610780c6";
  v3[90] = @"DoAP Send Data";
  v2[91] = @"c7c6947d-3165-4bcb-8eaf-b328896cb531";
  v3[91] = @"DoAP Event Indicator";
  v2[92] = @"7798082b-b7b7-45a6-9933-563492efe04e";
  v3[92] = @"Apple Headset Property";
  v2[93] = @"82f6bc0a-1bca-4873-afc9-ec5890e3469a";
  v3[93] = @"Dosimetry Sensitivity";
  v2[94] = @"d5f96afa-2f2c-41bb-a7e6-f54abe6235b4";
  v3[94] = @"Dosimetry Volume Curve";
  v2[95] = @"1853";
  v3[95] = @"Common Audio Service";
  v2[96] = @"1850";
  v3[96] = @"Published Audio Capabilities Service";
  v2[97] = @"2BC9";
  v3[97] = @"Sink PAC";
  v2[98] = @"2BCB";
  v3[98] = @"Source PAC";
  v2[99] = @"2BCA";
  v3[99] = @"Sink Audio Locations";
  v2[100] = @"2BCC";
  v3[100] = @"Source Audio Locations";
  v2[101] = @"2BCD";
  v3[101] = @"Available Audio Contexts";
  v2[102] = @"2BCE";
  v3[102] = @"Supported Audio Contexts";
  v2[103] = @"184E";
  v3[103] = @"Audio Stream Control Service";
  v2[104] = @"2BC4";
  v3[104] = @"Sink ASE";
  v2[105] = @"2BC5";
  v3[105] = @"Source ASE";
  v2[106] = @"2BC6";
  v3[106] = @"ASE Control Point";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:107];
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v0;
}

@end