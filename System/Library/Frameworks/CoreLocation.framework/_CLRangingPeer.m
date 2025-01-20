@interface _CLRangingPeer
+ (BOOL)supportsSecureCoding;
+ (id)hexStringMacAddressFromUInt:(unint64_t)a3;
+ (unint64_t)uintMacAddressFromString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeer:(id)a3;
- (NSData)secureRangingKeyID;
- (_CLRangingPeer)init;
- (_CLRangingPeer)initWithCoder:(id)a3;
- (_CLRangingPeer)initWithMacAddressAsData:(id)a3 secureRangingKeyID:(id)a4;
- (_CLRangingPeer)initWithMacAddressAsString:(id)a3 secureRangingKeyID:(id)a4;
- (_CLRangingPeer)initWithMacAddressAsUInt:(unint64_t)a3 secureRangingKeyID:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getMacAddressAsString;
- (unint64_t)hash;
- (unint64_t)macAddress;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CLRangingPeer

- (_CLRangingPeer)init
{
  return 0;
}

- (_CLRangingPeer)initWithMacAddressAsUInt:(unint64_t)a3 secureRangingKeyID:(id)a4
{
  if (HIWORD(a3)) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLRangingPeer.m", 161, @"Invalid parameter not satisfying: %@", @"(macAddress & 0xFFFF000000000000) == 0");
  }
  v9.receiver = self;
  v9.super_class = (Class)_CLRangingPeer;
  v7 = [(_CLRangingPeer *)&v9 init];
  if (v7) {
    v7->_internal = [[_CLRangingPeerInternal alloc] initWithMacAddressAsUInt:a3 secureRangingKeyID:a4];
  }
  return v7;
}

- (_CLRangingPeer)initWithMacAddressAsString:(id)a3 secureRangingKeyID:(id)a4
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLRangingPeer.m", 172, @"Invalid parameter not satisfying: %@", @"macAddress");
  }
  unint64_t v7 = +[_CLRangingPeer uintMacAddressFromString:a3];
  if (v7 == -1) {
    return 0;
  }

  return [(_CLRangingPeer *)self initWithMacAddressAsUInt:v7 secureRangingKeyID:a4];
}

- (_CLRangingPeer)initWithMacAddressAsData:(id)a3 secureRangingKeyID:(id)a4
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLRangingPeer.m", 183, @"Invalid parameter not satisfying: %@", @"macAddress");
  }
  *(_WORD *)&v8.octet[4] = 0;
  *(_DWORD *)v8.octet = 0;
  [a3 getBytes:&v8 length:6];
  return -[_CLRangingPeer initWithMacAddressAsString:secureRangingKeyID:](self, "initWithMacAddressAsString:secureRangingKeyID:", [NSString stringWithUTF8String:ether_ntoa(&v8)], a4);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CLRangingPeer;
  [(_CLRangingPeer *)&v3 dealloc];
}

- (unint64_t)macAddress
{
  return *((void *)self->_internal + 1);
}

- (NSData)secureRangingKeyID
{
  return (NSData *)*((void *)self->_internal + 2);
}

- (id)getMacAddressAsString
{
  [(_CLRangingPeer *)self macAddress];

  return (id)MEMORY[0x1F4181798](_CLRangingPeer, sel_hexStringMacAddressFromUInt_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  internal = self->_internal;
  uint64_t v6 = internal[1];
  uint64_t v7 = internal[2];

  return (id)[v4 initWithMacAddressAsUInt:v6 secureRangingKeyID:v7];
}

- (_CLRangingPeer)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLRangingPeer.m", 231, @"Invalid parameter not satisfying: %@", @"[aDecoder allowsKeyedCoding]");
  }
  uint64_t v6 = [a3 decodeInt64ForKey:@"kCLCodingKeyRangingPeerMacAddress"];
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLCodingKeyRangingPeerSecureRangingKeyID"];

  return [(_CLRangingPeer *)self initWithMacAddressAsUInt:v6 secureRangingKeyID:v7];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLRangingPeer.m", 241, @"Invalid parameter not satisfying: %@", @"[aCoder allowsKeyedCoding]");
  }
  internal = self->_internal;
  [a3 encodeInt64:internal[1] forKey:@"kCLCodingKeyRangingPeerMacAddress"];
  uint64_t v7 = internal[2];

  [a3 encodeObject:v7 forKey:@"kCLCodingKeyRangingPeerSecureRangingKeyID"];
}

- (id)description
{
  internal = self->_internal;
  objc_super v3 = NSString;
  id v4 = [(_CLRangingPeer *)self getMacAddressAsString];
  if (internal[2]) {
    v5 = "Yes";
  }
  else {
    v5 = "No";
  }
  return (id)[v3 stringWithFormat:@"Peer:%@ hasKey:%s", v4, v5];
}

- (unint64_t)hash
{
  unint64_t v3 = [(_CLRangingPeer *)self macAddress];
  return [(NSData *)[(_CLRangingPeer *)self secureRangingKeyID] hash] ^ v3;
}

- (BOOL)isEqualToPeer:(id)a3
{
  if (self == a3) {
    return 1;
  }
  unint64_t v5 = [(_CLRangingPeer *)self macAddress];
  return v5 == [a3 macAddress]
      && ([a3 secureRangingKeyID]
       && -[NSData isEqualToData:](-[_CLRangingPeer secureRangingKeyID](self, "secureRangingKeyID"), "isEqualToData:", [a3 secureRangingKeyID])|| !objc_msgSend(a3, "secureRangingKeyID") && !-[_CLRangingPeer secureRangingKeyID](self, "secureRangingKeyID"));
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return MEMORY[0x1F4181798](self, sel_isEqualToPeer_);
}

+ (unint64_t)uintMacAddressFromString:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CLRangingPeer.m", 291, @"Invalid parameter not satisfying: %@", @"macAddress");
  }
  uint64_t v6 = [a3 length];
  if ((unint64_t)(v6 - 18) <= 0xFFFFFFFFFFFFFFF8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CLRangingPeer.m", 300, @"Invalid parameter not satisfying: %@", @"(len >= 11) && (len <= 17)");
  }
  objc_msgSend(a3, "getCharacters:range:", v16, 0, v6);
  if ((int)v6 >= 1)
  {
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    char v10 = 0;
    uint64_t v11 = v6 - 1;
    while (1)
    {
      int v12 = (unsigned __int16)v16[v11] << 24;
      if (v12 == 973078528)
      {
        ++v8;
        if (v9 == 2)
        {
          uint64_t v9 = 0;
          goto LABEL_16;
        }
        if (v9 != 1) {
          goto LABEL_20;
        }
        uint64_t v9 = 0;
      }
      else
      {
        unsigned int v15 = 0;
        if (![(id)objc_msgSend(MEMORY[0x1E4F28FE8] scannerWithString:objc_msgSend(NSString, "stringWithFormat:", @"%c", (v12 >> 24))), "scanHexInt:", &v15]|| v15 == -1)
        {
LABEL_20:
          char v13 = 0;
          goto LABEL_21;
        }
        v7 += (unint64_t)v15 << v10;
        ++v9;
      }
      v10 += 4;
LABEL_16:
      if ((unint64_t)--v11 >= 0xFFFFFFFFFFFFFFFELL) {
        goto LABEL_19;
      }
    }
  }
  unint64_t v7 = 0;
  uint64_t v8 = 0;
LABEL_19:
  char v13 = 1;
LABEL_21:
  if ((v13 & (v8 == 5)) != 0) {
    return v7;
  }
  else {
    return -1;
  }
}

+ (id)hexStringMacAddressFromUInt:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (HIWORD(a3)) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CLRangingPeer.m", 341, @"Invalid parameter not satisfying: %@", @"(macAddress & 0xFFFF000000000000) == 0");
  }
  uint64_t v4 = 0;
  int64x2_t v5 = (int64x2_t)xmmword_190886750;
  uint64_t v6 = v11;
  uint64x2_t v7 = (uint64x2_t)vdupq_n_s64(6uLL);
  int64x2_t v8 = vdupq_n_s64(2uLL);
  do
  {
    if (vmovn_s64((int64x2_t)vcgtq_u64(v7, (uint64x2_t)v5)).u8[0]) {
      *(v6 - 1) = (a3 >> v4);
    }
    if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(6uLL), *(uint64x2_t *)&v5)).i32[1]) {
      *uint64_t v6 = (a3 >> (v4 + 8));
    }
    int64x2_t v5 = vaddq_s64(v5, v8);
    v4 += 16;
    v6 += 2;
  }
  while (v4 != 48);
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%02X:%02X:%02X:%02X:%02X:%02X", *(double *)v5.i64, v11[4], v11[3], v11[2], v11[1], v11[0], v10);
}

@end