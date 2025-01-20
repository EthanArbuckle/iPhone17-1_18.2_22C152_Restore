@interface UARPSuperBinaryAssetTLV
+ (id)decomposeTLVs:(id)a3;
+ (id)findTLVWithType:(unint64_t)a3 tlvs:(id)a4;
+ (id)findTLVsWithType:(unint64_t)a3 tlvs:(id)a4;
- (NSArray)valueAsTLVs;
- (NSData)valueAsData;
- (NSNumber)valueAsNumber;
- (NSString)valueAsString;
- (NSURL)valueAsURL;
- (UARPAssetVersion)valueAsVersion;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 dataValue:(id)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 stringValue:(id)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 tagValue:(id)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 tlvLength:(unint64_t)a4 tlvValue:(void *)a5;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt16:(unsigned __int16)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt32:(unsigned int)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt64:(unint64_t)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt8:(unsigned __int8)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 urlValue:(id)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 version:(UARPVersion *)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 versionInfo:(uarpPayloadVersionInfo *)a4;
- (id)description;
- (id)generateTLV:(id *)a3;
- (unint64_t)type;
@end

@implementation UARPSuperBinaryAssetTLV

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt8:(unsigned __int8)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSuperBinaryAssetTLV;
  result = [(UARPSuperBinaryAssetTLV *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_val8 = a4;
    result->_valueType = 0;
  }
  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt16:(unsigned __int16)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSuperBinaryAssetTLV;
  result = [(UARPSuperBinaryAssetTLV *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_val16 = a4;
    result->_valueType = 1;
  }
  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt32:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSuperBinaryAssetTLV;
  result = [(UARPSuperBinaryAssetTLV *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_val32 = a4;
    result->_valueType = 2;
  }
  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt64:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSuperBinaryAssetTLV;
  result = [(UARPSuperBinaryAssetTLV *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_val64 = a4;
    result->_valueType = 3;
  }
  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 dataValue:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UARPSuperBinaryAssetTLV;
  v8 = [(UARPSuperBinaryAssetTLV *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_data, a4);
    v9->_valueType = 4;
  }

  return v9;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 stringValue:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UARPSuperBinaryAssetTLV;
  id v7 = [(UARPSuperBinaryAssetTLV *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    uint64_t v9 = [v6 copy];
    string = v8->_string;
    v8->_string = (NSString *)v9;

    v8->_valueType = 5;
  }

  return v8;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 tagValue:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UARPSuperBinaryAssetTLV;
  id v7 = [(UARPSuperBinaryAssetTLV *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    uint64_t v9 = [v6 copy];
    string = v8->_string;
    v8->_string = (NSString *)v9;

    v8->_valueType = 7;
  }

  return v8;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 urlValue:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UARPSuperBinaryAssetTLV;
  id v7 = [(UARPSuperBinaryAssetTLV *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    uint64_t v9 = [v6 copy];
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    v8->_valueType = 6;
  }

  return v8;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 version:(UARPVersion *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSuperBinaryAssetTLV;
  result = [(UARPSuperBinaryAssetTLV *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_version = *a4;
    result->_valueType = 8;
  }
  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 versionInfo:(uarpPayloadVersionInfo *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UARPSuperBinaryAssetTLV;
  result = [(UARPSuperBinaryAssetTLV *)&v9 init];
  if (result)
  {
    result->_type = a3;
    long long v7 = *(_OWORD *)&a4->tag.char1;
    long long v8 = *(_OWORD *)&a4->activeVersion.build;
    result->_versionInfo.stagedVersion.build = a4->stagedVersion.build;
    *(_OWORD *)&result->_versionInfo.activeVersion.build = v8;
    *(_OWORD *)&result->_versionInfo.tag.char1 = v7;
    result->_valueType = 9;
  }
  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 tlvLength:(unint64_t)a4 tlvValue:(void *)a5
{
  if (!a5) {
    goto LABEL_41;
  }
  if ((uint64_t)a3 <= 2293403905)
  {
    if ((uint64_t)a3 <= 1155952128)
    {
      if ((uint64_t)a3 <= 272691968)
      {
        switch(a3)
        {
          case 0x488E200uLL:
          case 0x488E203uLL:
            goto LABEL_19;
          case 0x488E201uLL:
          case 0x488E202uLL:
            goto LABEL_44;
          case 0x488E207uLL:
            goto LABEL_38;
          default:
            goto LABEL_50;
        }
      }
      if ((uint64_t)a3 > 538280448)
      {
        if (a3 != 538280449)
        {
          if (a3 != 1155952128)
          {
LABEL_50:
            objc_super v12 = [MEMORY[0x263EFF8F8] dataWithBytes:a5 length:a4];
            objc_super v11 = [[UARPSuperBinaryAssetTLV alloc] initWithType:a3 dataValue:v12];
LABEL_48:

            goto LABEL_49;
          }
          long long v16 = 0u;
          *(_OWORD *)&v15[4] = 0u;
          *(_DWORD *)v15 = *(_DWORD *)a5;
          uarpVersionEndianSwap((unsigned int *)a5 + 1, &v15[4]);
          uarpVersionEndianSwap((unsigned int *)a5 + 5, &v16);
          long long v8 = [[UARPSuperBinaryAssetTLV alloc] initWithType:1155952128 versionInfo:v15];
          goto LABEL_37;
        }
LABEL_35:
        if (a4 == 4)
        {
          long long v8 = [[UARPSuperBinaryAssetTLV alloc] initWithType:a3 unsignedInt32:uarpHtonl(*(_DWORD *)a5)];
          goto LABEL_37;
        }
        goto LABEL_41;
      }
      if (a3 - 272691969 >= 2)
      {
        uint64_t v10 = 538280448;
LABEL_43:
        if (a3 != v10) {
          goto LABEL_50;
        }
      }
    }
    else
    {
      if ((uint64_t)a3 > 2158597887)
      {
        if (a3 - 2158597888u >= 3) {
          goto LABEL_50;
        }
        goto LABEL_44;
      }
      if (a3 - 1619725824 <= 8)
      {
        if (((1 << a3) & 0x109) != 0)
        {
LABEL_19:
          if (a4 == 2)
          {
            long long v8 = [[UARPSuperBinaryAssetTLV alloc] initWithType:a3 unsignedInt16:uarpHtons(*(unsigned __int16 *)a5)];
            goto LABEL_37;
          }
LABEL_41:
          objc_super v11 = 0;
          goto LABEL_49;
        }
        if (((1 << a3) & 6) != 0) {
          goto LABEL_44;
        }
        if (a3 == 1619725831)
        {
LABEL_38:
          *(void *)v15 = 0;
          *(void *)&v15[8] = 0;
          uarpVersionEndianSwap((unsigned int *)a5, v15);
          long long v8 = [[UARPSuperBinaryAssetTLV alloc] initWithType:a3 version:v15];
          goto LABEL_37;
        }
      }
      if (a3 != 1155952129)
      {
        uint64_t v9 = 1483412481;
LABEL_34:
        if (a3 != v9) {
          goto LABEL_50;
        }
        goto LABEL_35;
      }
    }
LABEL_44:
    objc_super v12 = [MEMORY[0x263EFF8F8] dataWithBytes:a5 length:a4];
    v13 = (void *)[[NSString alloc] initWithData:v12 encoding:4];
    if (v13) {
      objc_super v11 = [[UARPSuperBinaryAssetTLV alloc] initWithType:a3 stringValue:v13];
    }
    else {
      objc_super v11 = 0;
    }

    goto LABEL_48;
  }
  if ((uint64_t)a3 <= 3291140105)
  {
    switch(a3)
    {
      case 0x88B29102uLL:
      case 0x88B29115uLL:
      case 0x88B29116uLL:
      case 0x88B29117uLL:
      case 0x88B29119uLL:
      case 0x88B2911AuLL:
      case 0x88B29123uLL:
      case 0x88B29124uLL:
        goto LABEL_19;
      case 0x88B29103uLL:
      case 0x88B29112uLL:
      case 0x88B2911FuLL:
      case 0x88B29134uLL:
      case 0x88B29136uLL:
        goto LABEL_44;
      case 0x88B29104uLL:
      case 0x88B29105uLL:
      case 0x88B29109uLL:
      case 0x88B2910AuLL:
      case 0x88B2910BuLL:
      case 0x88B2911DuLL:
      case 0x88B2911EuLL:
      case 0x88B29120uLL:
      case 0x88B29125uLL:
        goto LABEL_35;
      case 0x88B29106uLL:
      case 0x88B2911BuLL:
        if (a4 != 8) {
          goto LABEL_41;
        }
        long long v8 = [[UARPSuperBinaryAssetTLV alloc] initWithType:a3 unsignedInt64:uarpHtonll(*(void *)a5)];
        goto LABEL_37;
      case 0x88B29107uLL:
      case 0x88B29108uLL:
      case 0x88B2910CuLL:
      case 0x88B2910DuLL:
      case 0x88B2910EuLL:
      case 0x88B2910FuLL:
      case 0x88B29110uLL:
      case 0x88B29111uLL:
      case 0x88B29113uLL:
      case 0x88B29114uLL:
      case 0x88B2911CuLL:
      case 0x88B29129uLL:
      case 0x88B2912AuLL:
      case 0x88B2912BuLL:
      case 0x88B2912CuLL:
      case 0x88B2912DuLL:
      case 0x88B2912EuLL:
      case 0x88B2912FuLL:
      case 0x88B29130uLL:
      case 0x88B29135uLL:
        goto LABEL_50;
      case 0x88B29118uLL:
      case 0x88B29121uLL:
      case 0x88B29122uLL:
      case 0x88B29126uLL:
      case 0x88B29127uLL:
      case 0x88B29128uLL:
      case 0x88B29131uLL:
      case 0x88B29132uLL:
      case 0x88B29133uLL:
        goto LABEL_5;
      default:
        if (a3 == 3291140096) {
          goto LABEL_35;
        }
        uint64_t v9 = 3291140105;
        goto LABEL_34;
    }
  }
  if ((uint64_t)a3 <= 4042160639)
  {
    switch(a3)
    {
      case 0xCCD28104uLL:
      case 0xCCD2810CuLL:
      case 0xCCD2810FuLL:
      case 0xCCD28119uLL:
        goto LABEL_35;
      case 0xCCD28105uLL:
      case 0xCCD28106uLL:
      case 0xCCD28107uLL:
      case 0xCCD28108uLL:
      case 0xCCD28109uLL:
      case 0xCCD2810AuLL:
      case 0xCCD28113uLL:
      case 0xCCD28115uLL:
      case 0xCCD28116uLL:
      case 0xCCD28118uLL:
        goto LABEL_50;
      case 0xCCD2810BuLL:
      case 0xCCD2810DuLL:
      case 0xCCD2810EuLL:
      case 0xCCD28110uLL:
      case 0xCCD28112uLL:
      case 0xCCD28117uLL:
        goto LABEL_19;
      case 0xCCD28111uLL:
      case 0xCCD28114uLL:
        goto LABEL_44;
      case 0xCCD2811AuLL:
        goto LABEL_5;
      default:
        uint64_t v10 = 3291140106;
        goto LABEL_43;
    }
  }
  if (a3 - 4042160640u < 2) {
    goto LABEL_44;
  }
  if (a3 != 4042160643) {
    goto LABEL_50;
  }
LABEL_5:
  if (a4 != 1) {
    goto LABEL_41;
  }
  long long v8 = [[UARPSuperBinaryAssetTLV alloc] initWithType:a3 unsignedInt8:*(unsigned __int8 *)a5];
LABEL_37:
  objc_super v11 = v8;
LABEL_49:

  return v11;
}

- (NSString)valueAsString
{
  if (self->_valueType == 5) {
    v2 = self->_string;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (NSURL)valueAsURL
{
  if (self->_valueType == 6) {
    v2 = self->_url;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (NSNumber)valueAsNumber
{
  switch(self->_valueType)
  {
    case 0:
      v2 = [NSNumber numberWithUnsignedChar:self->_val8];
      break;
    case 1:
      v2 = [NSNumber numberWithUnsignedShort:self->_val16];
      break;
    case 2:
      v2 = [NSNumber numberWithUnsignedInt:self->_val32];
      break;
    case 3:
      v2 = [NSNumber numberWithUnsignedLongLong:self->_val64];
      break;
    default:
      v2 = 0;
      break;
  }
  return (NSNumber *)v2;
}

- (NSData)valueAsData
{
  if (self->_valueType == 4) {
    v2 = self->_data;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (UARPAssetVersion)valueAsVersion
{
  if (self->_valueType == 8) {
    v2 = [[UARPAssetVersion alloc] initWithMajorVersion:self->_version.major minorVersion:self->_version.minor releaseVersion:self->_version.release buildVersion:self->_version.build];
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (NSArray)valueAsTLVs
{
  if (self->_valueType == 4)
  {
    v2 = +[UARPSuperBinaryAssetTLV decomposeTLVs:self->_data];
    v3 = [MEMORY[0x263EFF8C0] arrayWithArray:v2];
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (id)generateTLV:(id *)a3
{
  uint64_t v15 = 0;
  LODWORD(v15) = uarpHtonl(self->_type);
  switch(self->_valueType)
  {
    case 0:
      HIDWORD(v15) = uarpHtonl(1u);
      id v4 = objc_alloc_init(MEMORY[0x263EFF990]);
      [v4 appendBytes:&v15 length:8];
      p_val8 = &self->_val8;
      id v6 = v4;
      NSUInteger v7 = 1;
      goto LABEL_15;
    case 1:
      HIDWORD(v15) = uarpHtonl(2u);
      id v4 = objc_alloc_init(MEMORY[0x263EFF990]);
      [v4 appendBytes:&v15 length:8];
      *(_WORD *)v13 = uarpHtons(self->_val16);
      p_val8 = v13;
      id v6 = v4;
      NSUInteger v7 = 2;
      goto LABEL_15;
    case 2:
      HIDWORD(v15) = uarpHtonl(4u);
      id v4 = objc_alloc_init(MEMORY[0x263EFF990]);
      [v4 appendBytes:&v15 length:8];
      *(_DWORD *)v13 = uarpHtonl(self->_val32);
      goto LABEL_12;
    case 3:
      HIDWORD(v15) = uarpHtonl(8u);
      id v4 = objc_alloc_init(MEMORY[0x263EFF990]);
      [v4 appendBytes:&v15 length:8];
      *(void *)v13 = uarpHtonll(self->_val64);
      p_val8 = v13;
      id v6 = v4;
      NSUInteger v7 = 8;
      goto LABEL_15;
    case 4:
      HIDWORD(v15) = uarpHtonl([(NSData *)self->_data length]);
      id v4 = objc_alloc_init(MEMORY[0x263EFF990]);
      [v4 appendBytes:&v15 length:8];
      [v4 appendData:self->_data];
      break;
    case 5:
      HIDWORD(v15) = uarpHtonl([(NSString *)self->_string length]);
      id v4 = objc_alloc_init(MEMORY[0x263EFF990]);
      [v4 appendBytes:&v15 length:8];
      long long v8 = [(NSString *)self->_string UTF8String];
      NSUInteger v7 = [(NSString *)self->_string length];
      id v6 = v4;
      p_val8 = (unsigned __int8 *)v8;
      goto LABEL_15;
    case 6:
      uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:self->_url options:1 error:0];
      HIDWORD(v15) = uarpHtonl([v9 length]);
      id v4 = objc_alloc_init(MEMORY[0x263EFF990]);
      [v4 appendBytes:&v15 length:8];
      id v10 = v9;
      objc_msgSend(v4, "appendBytes:length:", objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));

      break;
    case 7:
      objc_super v11 = [(NSString *)self->_string UTF8String];
      if ([(NSString *)self->_string length] != 4) {
        goto LABEL_13;
      }
      *(_DWORD *)v13 = uarpPayloadTagPack((unsigned int *)v11);
      HIDWORD(v15) = uarpHtonl(4u);
      id v4 = objc_alloc_init(MEMORY[0x263EFF990]);
      objc_msgSend(v4, "appendBytes:length:", &v15, 8, *(void *)v13);
LABEL_12:
      p_val8 = v13;
      id v6 = v4;
      NSUInteger v7 = 4;
LABEL_15:
      objc_msgSend(v6, "appendBytes:length:", p_val8, v7, *(void *)v13);
      break;
    case 8:
      HIDWORD(v15) = uarpHtonl(0x10u);
      id v4 = objc_alloc_init(MEMORY[0x263EFF990]);
      [v4 appendBytes:&v15 length:8];
      *(_OWORD *)v13 = 0uLL;
      uarpVersionEndianSwap(&self->_version.major, v13);
      p_val8 = v13;
      id v6 = v4;
      NSUInteger v7 = 16;
      goto LABEL_15;
    case 9:
      HIDWORD(v15) = uarpHtonl(0x24u);
      id v4 = objc_alloc_init(MEMORY[0x263EFF990]);
      [v4 appendBytes:&v15 length:8];
      long long v14 = 0u;
      *(_OWORD *)&v13[4] = 0u;
      *(UARP4ccTag *)v13 = self->_versionInfo.tag;
      uarpVersionEndianSwap(&self->_versionInfo.activeVersion.major, &v13[4]);
      uarpVersionEndianSwap(&self->_versionInfo.stagedVersion.major, &v14);
      p_val8 = v13;
      id v6 = v4;
      NSUInteger v7 = 36;
      goto LABEL_15;
    default:
LABEL_13:
      id v4 = 0;
      break;
  }
  return v4;
}

+ (id)decomposeTLVs:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v20 = 0;
  id v4 = objc_opt_new();
  if ([v3 length])
  {
    unint64_t v6 = 0;
    NSUInteger v7 = &_os_log_internal;
    *(void *)&long long v5 = 67109634;
    long long v18 = v5;
    while (1)
    {
      objc_msgSend(v3, "getBytes:range:", &v20, v6, 8, v18);
      LODWORD(v20) = uarpHtonl(v20);
      unsigned int v8 = uarpHtonl(HIDWORD(v20));
      HIDWORD(v20) = v8;
      if (!(v20 | v8)) {
        break;
      }
      unint64_t v9 = v6 + 8;
      uint64_t v10 = v8;
      objc_super v11 = objc_msgSend(v3, "subdataWithRange:", v9, v8);
      objc_super v12 = [UARPSuperBinaryAssetTLV alloc];
      uint64_t v13 = v20;
      uint64_t v14 = HIDWORD(v20);
      id v15 = v11;
      long long v16 = -[UARPSuperBinaryAssetTLV initWithType:tlvLength:tlvValue:](v12, "initWithType:tlvLength:tlvValue:", v13, v14, [v15 bytes]);
      if (v16)
      {
        [v4 addObject:v16];
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v18;
        int v22 = v20;
        __int16 v23 = 1024;
        int v24 = HIDWORD(v20);
        __int16 v25 = 2112;
        id v26 = a1;
        _os_log_error_impl(&dword_21E079000, v7, OS_LOG_TYPE_ERROR, "attempting to add a nil tlv (T=0x%08x, L=%u) to superbinary %@", buf, 0x18u);
      }
      unint64_t v6 = v9 + v10;

      if (v6 >= [v3 length]) {
        goto LABEL_12;
      }
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[UARPSuperBinaryAssetTLV decomposeTLVs:]();
    }
  }
LABEL_12:

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"TLV - "];
  objc_msgSend(v3, "appendFormat:", @"Type = 0x%08x", self->_type);
  [v3 appendFormat:@", "];
  switch(self->_valueType)
  {
    case 0:
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", 1);
      [v3 appendFormat:@", "];
      objc_msgSend(v3, "appendFormat:", @"Value = %hhu", self->_val8, v8, v9, v10);
      break;
    case 1:
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", 2);
      [v3 appendFormat:@", "];
      objc_msgSend(v3, "appendFormat:", @"Value = %hu", self->_val16, v8, v9, v10);
      break;
    case 2:
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", 4);
      [v3 appendFormat:@", "];
      objc_msgSend(v3, "appendFormat:", @"Value = %u", self->_val32, v8, v9, v10);
      break;
    case 3:
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", 8);
      [v3 appendFormat:@", "];
      objc_msgSend(v3, "appendFormat:", @"Value = %llu", self->_val64, v8, v9, v10);
      break;
    case 4:
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", -[NSData length](self->_data, "length"));
      [v3 appendFormat:@", "];
      data = self->_data;
      goto LABEL_11;
    case 5:
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", -[NSString length](self->_string, "length"));
      goto LABEL_10;
    case 6:
      long long v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:self->_url options:1 error:0];
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", objc_msgSend(v5, "length"));
      [v3 appendFormat:@", "];
      [v3 appendFormat:@"Value = %@", self->_url];

      break;
    case 7:
      objc_msgSend(v3, "appendFormat:", @"Length = 4", v7);
LABEL_10:
      [v3 appendFormat:@", "];
      data = (NSData *)self->_string;
LABEL_11:
      [v3 appendFormat:@"Value = %@", data, v8, v9, v10];
      break;
    case 8:
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", 16);
      [v3 appendFormat:@", "];
      objc_msgSend(v3, "appendFormat:", @"Value = %d.%d.%d.%d", self->_version.major, self->_version.minor, self->_version.release, self->_version.build);
      break;
    case 9:
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", 36);
      [v3 appendFormat:@", "];
      [v3 appendFormat:@"Payload Tag = %c%c%c%c, ", self->_versionInfo.tag.char1, self->_versionInfo.tag.char2, self->_versionInfo.tag.char3, self->_versionInfo.tag.char4];
      [v3 appendFormat:@"Active Firmware Version = %d.%d.%d.%d, ", self->_versionInfo.activeVersion.major, self->_versionInfo.activeVersion.minor, self->_versionInfo.activeVersion.release, self->_versionInfo.activeVersion.build];
      objc_msgSend(v3, "appendFormat:", @"Staged Firmware Version = %d.%d.%d.%d,", self->_versionInfo.stagedVersion.major, self->_versionInfo.stagedVersion.minor, self->_versionInfo.stagedVersion.release, self->_versionInfo.stagedVersion.build);
      break;
    default:
      break;
  }
  return v3;
}

+ (id)findTLVWithType:(unint64_t)a3 tlvs:(id)a4
{
  id v4 = +[UARPSuperBinaryAssetTLV findTLVsWithType:a3 tlvs:a4];
  long long v5 = [v4 firstObject];

  return v5;
}

+ (id)findTLVsWithType:(unint64_t)a3 tlvs:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_super v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (void)v15) == a3) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];

  return v13;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

+ (void)decomposeTLVs:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "TLV type and length both equal to zero", v0, 2u);
}

@end