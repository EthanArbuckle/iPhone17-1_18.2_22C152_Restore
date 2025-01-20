@interface MCPeerID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MCPeerID)init;
- (MCPeerID)initWithCoder:(id)a3;
- (MCPeerID)initWithDisplayName:(NSString *)myDisplayName;
- (MCPeerID)initWithIDString:(id)a3 displayName:(id)a4;
- (MCPeerID)initWithPID:(unsigned int)a3 displayName:(id)a4;
- (MCPeerID)initWithSerializedRepresentation:(id)a3;
- (NSString)displayName;
- (id)description;
- (id)displayNameAndPID;
- (id)idString;
- (id)internalDescription;
- (id)serializedRepresentation;
- (unint64_t)hash;
- (unint64_t)pid64;
- (unsigned)pid;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MCPeerID

- (unint64_t)pid64
{
  return [(MCPeerIDInternal *)self->_internal pid64];
}

- (id)idString
{
  v2 = (void *)[(NSString *)[(MCPeerIDInternal *)self->_internal idString] copy];

  return v2;
}

- (unsigned)pid
{
  return [(MCPeerIDInternal *)self->_internal pid64] & 0x7FFFFFFF;
}

- (NSString)displayName
{
  v2 = (void *)[(NSString *)[(MCPeerIDInternal *)self->_internal displayName] copy];

  return (NSString *)v2;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p DisplayName = %@>", NSStringFromClass(v4), self, -[MCPeerID displayName](self, "displayName")];
}

- (id)internalDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p> idString[%@] pid64[%016llX] displayName[%@]", NSStringFromClass(v4), self, -[MCPeerIDInternal idString](self->_internal, "idString"), -[MCPeerIDInternal pid64](self->_internal, "pid64"), -[MCPeerIDInternal displayName](self->_internal, "displayName")];
}

- (id)displayNameAndPID
{
  return (id)[NSString stringWithFormat:@"%@,%08X", -[MCPeerID displayName](self, "displayName"), -[MCPeerID pid](self, "pid")];
}

- (MCPeerID)initWithPID:(unsigned int)a3 displayName:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)MCPeerID;
  v6 = [(MCPeerID *)&v13 init];
  if (v6)
  {
    v7 = makebase36string(a3);
    uint64_t v8 = [NSString stringWithUTF8String:v7];
    free(v7);
    v6->_internal = [[MCPeerIDInternal alloc] initWithIDString:v8 pid64:a3 displayName:a4];
    v9 = mcpid_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(MCPeerID *)v6 idString];
      uint64_t v11 = [(MCPeerID *)v6 displayNameAndPID];
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "Created new peerID with idString [%@], displayNameAndPID [%@].", buf, 0x16u);
    }
  }
  return v6;
}

- (MCPeerID)initWithIDString:(id)a3 displayName:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MCPeerID;
  v6 = [(MCPeerID *)&v8 init];
  if (v6) {
    v6->_internal = -[MCPeerIDInternal initWithIDString:pid64:displayName:]([MCPeerIDInternal alloc], "initWithIDString:pid64:displayName:", a3, strtoull((const char *)[a3 UTF8String], 0, 36), a4);
  }
  return v6;
}

- (MCPeerID)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MCPeerID;
  v4 = [(MCPeerID *)&v10 init];
  if (v4)
  {
    unint64_t v5 = [a3 decodeInt64ForKey:@"id"];
    uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    v7 = makebase36string(v5);
    uint64_t v8 = [NSString stringWithUTF8String:v7];
    free(v7);
    v4->_internal = [[MCPeerIDInternal alloc] initWithIDString:v8 pid64:v5 displayName:v6];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[MCPeerIDInternal displayName](self->_internal, "displayName"), @"name");
  unint64_t v5 = [(MCPeerIDInternal *)self->_internal pid64];

  [a3 encodeInt64:v5 forKey:@"id"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MCPeerID;
  [(MCPeerID *)&v3 dealloc];
}

- (MCPeerID)init
{
  v3.receiver = self;
  v3.super_class = (Class)MCPeerID;
  [(MCPeerID *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

- (MCPeerID)initWithDisplayName:(NSString *)myDisplayName
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)MCPeerID;
  v4 = [(MCPeerID *)&v17 init];
  if (v4)
  {
    if (!myDisplayName
      || ![(NSString *)myDisplayName length]
      || [(NSString *)myDisplayName lengthOfBytesUsingEncoding:4] >= 0x40)
    {
      unint64_t v5 = (void *)MEMORY[0x263EFF940];
      uint64_t v6 = *MEMORY[0x263EFF4A0];
      v7 = (objc_class *)objc_opt_class();
      [v5 raise:v6, @"Invalid displayName passed to %@", NSStringFromClass(v7) format];
    }
    CFUUIDRef v8 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x263EFFB08]);
    CFUUIDBytes v9 = CFUUIDGetUUIDBytes(v8);
    unint64_t v10 = bswap64(*(void *)&v9.byte0 ^ *(void *)&v9.byte8);
    uint64_t v11 = makebase36string(v10);
    uint64_t v12 = [NSString stringWithUTF8String:v11];
    free(v11);
    CFRelease(v8);
    v4->_internal = [[MCPeerIDInternal alloc] initWithIDString:v12 pid64:v10 displayName:myDisplayName];
    objc_super v13 = mcpid_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(MCPeerID *)v4 idString];
      uint64_t v15 = [(MCPeerID *)v4 displayNameAndPID];
      *(_DWORD *)buf = 138412546;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      _os_log_impl(&dword_218756000, v13, OS_LOG_TYPE_DEFAULT, "Created new peerID with idString [%@], displayNameAndPID [%@].", buf, 0x16u);
    }
  }
  return v4;
}

- (MCPeerID)initWithSerializedRepresentation:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)MCPeerID;
  v4 = [(MCPeerID *)&v26 init];
  if (v4)
  {
    unint64_t v5 = [a3 length];
    uint64_t v6 = (uint64_t *)MEMORY[0x263EFF4A0];
    if (v5 <= 9)
    {
      v7 = (void *)MEMORY[0x263EFF940];
      uint64_t v8 = *MEMORY[0x263EFF4A0];
      CFUUIDBytes v9 = (objc_class *)objc_opt_class();
      [v7 raise:v8, @"Invalid serialized representation passed to %@", NSStringFromClass(v9) format];
    }
    uint64_t v10 = [a3 bytes];
    unint64_t v11 = bswap64(*(void *)v10);
    uint64_t v12 = *(unsigned __int8 *)(v10 + 8);
    if (v5 < v12 + 9)
    {
      objc_super v13 = (void *)MEMORY[0x263EFF940];
      uint64_t v14 = *MEMORY[0x263EFF4A0];
      uint64_t v15 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v15);
      uint64_t v16 = v14;
      uint64_t v6 = (uint64_t *)MEMORY[0x263EFF4A0];
      [v13 raise:v16, @"Invalid serialized representation passed to %@", v25 format];
    }
    objc_super v17 = (void *)[[NSString alloc] initWithBytes:v10 + 9 length:v12 encoding:4];
    if (v5 < v12 + 9)
    {
      uint64_t v18 = (void *)MEMORY[0x263EFF940];
      uint64_t v19 = *v6;
      __int16 v20 = (objc_class *)objc_opt_class();
      [v18 raise:v19, @"Invalid serialized representation passed to %@", NSStringFromClass(v20) format];
    }
    uint64_t v21 = makebase36string(v11);
    uint64_t v22 = [NSString stringWithUTF8String:v21];
    free(v21);
    v4->_internal = [[MCPeerIDInternal alloc] initWithIDString:v22 pid64:v11 displayName:v17];

    v23 = mcpid_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v28 = a3;
      __int16 v29 = 2112;
      uint64_t v30 = v22;
      __int16 v31 = 2048;
      uint64_t v32 = v5 - v12 - 9;
      _os_log_impl(&dword_218756000, v23, OS_LOG_TYPE_DEFAULT, "Created peerID from data[%@], idString[%@], leftover[%lu].", buf, 0x20u);
    }
  }
  return v4;
}

- (id)serializedRepresentation
{
  objc_super v3 = [(NSString *)[(MCPeerIDInternal *)self->_internal displayName] UTF8String];
  size_t v4 = [(NSString *)[(MCPeerIDInternal *)self->_internal displayName] lengthOfBytesUsingEncoding:4];
  unint64_t v5 = malloc_type_malloc(v4 + 9, 0x43BE824AuLL);
  if (!v5) {
    objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF570], objc_msgSend(NSString, "stringWithFormat:", @"Not enough memory %lu", v4 + 9), 0 reason userInfo]);
  }
  uint64_t v6 = v5;
  *unint64_t v5 = [(MCPeerIDInternal *)self->_internal pid64] >> 56;
  v6[1] = [(MCPeerIDInternal *)self->_internal pid64] >> 48;
  v6[2] = (unsigned __int16)([(MCPeerIDInternal *)self->_internal pid64] >> 32) >> 8;
  v6[3] = [(MCPeerIDInternal *)self->_internal pid64] >> 32;
  v6[4] = [(MCPeerIDInternal *)self->_internal pid64] >> 24;
  v6[5] = [(MCPeerIDInternal *)self->_internal pid64] >> 16;
  v6[6] = (unsigned __int16)[(MCPeerIDInternal *)self->_internal pid64] >> 8;
  v6[7] = [(MCPeerIDInternal *)self->_internal pid64];
  v6[8] = v4;
  memcpy(v6 + 9, v3, v4);
  v7 = (void *)MEMORY[0x263EFF8F8];

  return (id)[v7 dataWithBytesNoCopy:v6 length:v4 + 9 freeWhenDone:1];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unint64_t v5 = [(MCPeerIDInternal *)self->_internal pid64];
  return v5 == [*((id *)a3 + 1) pid64];
}

- (unint64_t)hash
{
  return [(MCPeerIDInternal *)self->_internal pid64];
}

@end