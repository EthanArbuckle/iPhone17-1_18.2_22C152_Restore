@interface NIDiscoveryToken
+ (BOOL)supportsSecureCoding;
+ (id)_identifyingSequenceFromBytes:(id)a3;
+ (id)deserialize:(id)a3;
+ (id)generateFindingTokenWithIRK:(id)a3;
+ (id)generateFindingTokenWithIRK:(id)a3 forExternalUse:(BOOL)a4;
+ (id)serialize:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NIDiscoveryToken)initWithBytes:(id)a3;
- (NIDiscoveryToken)initWithCoder:(id)a3;
- (NIDiscoveryToken)initWithDeviceAddress:(unsigned __int16)a3;
- (NSData)rawToken;
- (NSString)rawTokenAsString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (id)deviceCapabilities;
- (id)getIRK;
- (id)getSessionIdentifier;
- (id)objectInRawTokenOPACKDictForKey:(id)a3;
- (id)shortDeviceAddress;
- (int64_t)tokenVariant;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NIDiscoveryToken

+ (id)generateFindingTokenWithIRK:(id)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NIFindingSupport.mm", 29, @"Invalid parameter not satisfying: %@", @"IRK" object file lineNumber description];
  }
  if ([v5 length] != 16)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"NIFindingSupport.mm", 30, @"Invalid parameter not satisfying: %@", @"IRK.length == NIDiscoveryTokenIRKLengthBytes" object file lineNumber description];
  }
  v14[0] = &unk_1EF5DB818;
  v14[1] = &unk_1EF5DB848;
  v15[0] = &unk_1EF5DB830;
  v15[1] = v5;
  v14[2] = &unk_1EF5DB860;
  v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&kFixedSessionIdentifierBytes length:3];
  v15[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  v8 = (void *)MEMORY[0x1A623D5F0](v7, 8, 0);
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"NIFindingSupport.mm", 38, @"Invalid parameter not satisfying: %@", @"tokenData" object file lineNumber description];
  }
  v9 = [[NIDiscoveryToken alloc] initWithBytes:v8];

  return v9;
}

+ (id)generateFindingTokenWithIRK:(id)a3 forExternalUse:(BOOL)a4
{
  v4 = +[NIDiscoveryToken generateFindingTokenWithIRK:](NIDiscoveryToken, "generateFindingTokenWithIRK:", a3, a4);

  return v4;
}

- (NIDiscoveryToken)initWithBytes:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 58, @"Invalid parameter not satisfying: %@", @"bytes" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)NIDiscoveryToken;
  v7 = [(NIDiscoveryToken *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_rawToken, a3);
    uint64_t v9 = +[NIDiscoveryToken _identifyingSequenceFromBytes:v6];
    identifyingSequence = v8->_identifyingSequence;
    v8->_identifyingSequence = (NSData *)v9;
  }
  return v8;
}

+ (id)_identifyingSequenceFromBytes:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    __assert_rtn("+[NIDiscoveryToken _identifyingSequenceFromBytes:]", "NIConfiguration.mm", 68, "bytes");
  }
  id v5 = (void *)[v3 copy];
  id v6 = (void *)OPACKDecodeData();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__0;
    v18 = __Block_byref_object_dispose__0;
    id v19 = (id)objc_opt_new();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__NIDiscoveryToken__identifyingSequenceFromBytes___block_invoke;
    v11[3] = &unk_1E5AC2C68;
    id v12 = v6;
    objc_super v13 = &v14;
    [&unk_1EF5DB950 enumerateObjectsUsingBlock:v11];
    uint64_t v7 = [(id)v15[5] length];
    v8 = v5;
    if (v7) {
      v8 = (void *)v15[5];
    }
    id v9 = v8;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

void __50__NIDiscoveryToken__identifyingSequenceFromBytes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKey:a2];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v3 length]) {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendData:v3];
      }
    }
  }
}

- (id)objectInRawTokenOPACKDictForKey:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 111, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  id v6 = (void *)OPACKDecodeData();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = [v6 objectForKey:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (int64_t)tokenVariant
{
  v2 = [(NIDiscoveryToken *)self objectInRawTokenOPACKDictForKey:&unk_1EF5DB8F0];
  if (v2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t)[v2 integerValue] <= 1)
  {
    int64_t v3 = [v2 integerValue];
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (id)deviceCapabilities
{
  v2 = [(NIDiscoveryToken *)self objectInRawTokenOPACKDictForKey:&unk_1EF5DB908];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int64_t v3 = -[NIDeviceCapabilities initWithBitmap:]([NIDeviceCapabilities alloc], "initWithBitmap:", [v2 unsignedCharValue]);
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (id)getIRK
{
  v2 = [(NIDiscoveryToken *)self rawToken];
  int64_t v3 = (void *)OPACKDecodeData();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = [v3 objectForKey:&unk_1EF5DB890];
    id v5 = v4;
    if (v4 && [v4 length] == 16) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)getSessionIdentifier
{
  v2 = [(NIDiscoveryToken *)self rawToken];
  int64_t v3 = (void *)OPACKDecodeData();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = [v3 objectForKey:&unk_1EF5DB878];
    id v5 = v4;
    if (v4 && [v4 length] == 3) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)serialize:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] <= 0x3E8)
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__0;
    v11 = __Block_byref_object_dispose__0;
    id v12 = (id)objc_opt_new();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __30__NIDiscoveryToken_serialize___block_invoke;
    v6[3] = &unk_1E5AC2C90;
    v6[4] = &v7;
    [v3 enumerateObjectsUsingBlock:v6];
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __30__NIDiscoveryToken_serialize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 rawToken];
  unint64_t v5 = [v4 length];

  if (v5 >= 0x100) {
    __assert_rtn("+[NIDiscoveryToken serialize:]_block_invoke", "NIConfiguration.mm", 196, "tokenLength <= std::numeric_limits<uint8_t>::max()");
  }
  char v8 = v5;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendBytes:&v8 length:1];
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v7 = [v3 rawToken];
  [v6 appendData:v7];
}

+ (id)deserialize:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] <= 0xF4240)
  {
    id v4 = objc_opt_new();
    unint64_t v5 = 0;
    do
    {
      if (v5 >= [v3 length]) {
        break;
      }
      id v6 = v3;
      uint64_t v7 = [v6 bytes];
      uint64_t v8 = *(unsigned __int8 *)(v7 + v5);
      unint64_t v9 = v5 + 1;
      if (*(unsigned char *)(v7 + v5))
      {
        if (v5 + v8 >= [v6 length]) {
          break;
        }
        v10 = objc_msgSend(v6, "subdataWithRange:", v5 + 1, v8);
        v11 = [[NIDiscoveryToken alloc] initWithBytes:v10];
        [v4 addObject:v11];
        v9 += v8;
      }
      unint64_t v5 = v9;
    }
    while (v9 < 0xF4240);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSString)rawTokenAsString
{
  return (NSString *)PRCommonConvertNSDataToHexNSString(self->_rawToken, 0);
}

- (NIDiscoveryToken)initWithDeviceAddress:(unsigned __int16)a3
{
  unsigned __int16 v9 = a3;
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v9 length:2];
  unint64_t v5 = [[NIDiscoveryToken alloc] initWithBytes:v4];

  if (v5)
  {
    uint64_t v6 = [NSNumber numberWithUnsignedShort:v9];
    shortDeviceAddress = v5->_shortDeviceAddress;
    v5->_shortDeviceAddress = (NSNumber *)v6;
  }
  return v5;
}

- (id)shortDeviceAddress
{
  return self->_shortDeviceAddress;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  shortDeviceAddress = self->_shortDeviceAddress;
  unint64_t v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = v5;
  if (shortDeviceAddress)
  {
    uint64_t v7 = (unsigned __int16)[(NSNumber *)self->_shortDeviceAddress intValue];
    return (id)[v6 initWithDeviceAddress:v7];
  }
  else
  {
    rawToken = self->_rawToken;
    return (id)[v5 initWithBytes:rawToken];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_rawToken forKey:@"rawToken"];
  [v4 encodeObject:self->_shortDeviceAddress forKey:@"shortDeviceAddress"];
}

- (NIDiscoveryToken)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawToken"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortDeviceAddress"];
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v8 = 0;
          goto LABEL_10;
        }
        uint64_t v7 = -[NIDiscoveryToken initWithDeviceAddress:](self, "initWithDeviceAddress:", (unsigned __int16)[v6 intValue]);
      }
      else
      {
        uint64_t v7 = [(NIDiscoveryToken *)self initWithBytes:v5];
      }
      self = v7;
      uint64_t v8 = self;
LABEL_10:

      goto LABEL_11;
    }
  }
  uint64_t v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NIDiscoveryToken *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    BOOL v5 = v4 == self || [(NSData *)self->_identifyingSequence isEqualToData:v4->_identifyingSequence];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSData *)self->_identifyingSequence hash];
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  uint64_t v6 = [(NIDiscoveryToken *)self descriptionInternal];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  return (id)MEMORY[0x1F4116180](self->_identifyingSequence, a2);
}

- (NSData)rawToken
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifyingSequence, 0);
  objc_storeStrong((id *)&self->_shortDeviceAddress, 0);

  objc_storeStrong((id *)&self->_rawToken, 0);
}

@end