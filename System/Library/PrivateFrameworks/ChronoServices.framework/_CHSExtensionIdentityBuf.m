@interface _CHSExtensionIdentityBuf
- (BOOL)isEqual:(id)a3;
- (BOOL)verifyUTF8Fields;
- (NSData)containerBundleIdentifierAsData;
- (NSData)deviceIdentifierAsData;
- (NSData)extensionBundleIdentifierAsData;
- (NSData)tokenStringAsData;
- (NSString)containerBundleIdentifier;
- (NSString)deviceIdentifier;
- (NSString)extensionBundleIdentifier;
- (NSString)tokenString;
- (_CHSExtensionIdentityBuf)initWithBufRef:(id)a3 cppPointer:(const ExtensionIdentityBuf *)a4;
- (const)containerBundleIdentifierAsCString;
- (const)deviceIdentifierAsCString;
- (const)extensionBundleIdentifierAsCString;
- (const)tokenStringAsCString;
- (id)deepCopyUsingBufferBuilder:(id)a3;
- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4;
- (id)initVerifiedRootObjectFromData:(id)a3;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6;
- (unint64_t)hash;
@end

@implementation _CHSExtensionIdentityBuf

- (NSString)tokenString
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0)
  {
    v6 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    NSStringFromSelector(a2);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = makeNSString(v7, self->_br, (const char *)&v6[4]);
  }
  else
  {
    v8 = 0;
  }
  return (NSString *)v8;
}

- (const)tokenStringAsCString
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  }
  else {
    return 0;
  }
}

- (NSData)tokenStringAsData
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0)
  {
    v6 = &ptr[v4];
    uint64_t v7 = *(unsigned int *)ptr[v4].var0;
    v8 = (void *)MEMORY[0x192FD70A0]();
    id v9 = [(AFBBufRef *)self->_br data];
    var0 = (unsigned int *)v6[v7].var0;
    uint64_t v11 = (uint64_t)var0 - [v9 bytes] + 4;

    v12 = [(AFBBufRef *)self->_br data];
    v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);
  }
  else
  {
    v13 = 0;
  }
  return (NSData *)v13;
}

- (NSString)extensionBundleIdentifier
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0)
  {
    v6 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    NSStringFromSelector(a2);
    uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = makeNSString(v7, self->_br, (const char *)&v6[4]);
  }
  else
  {
    v8 = 0;
  }
  return (NSString *)v8;
}

- (const)extensionBundleIdentifierAsCString
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0) {
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  }
  else {
    return 0;
  }
}

- (NSData)extensionBundleIdentifierAsData
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0)
  {
    v6 = &ptr[v4];
    uint64_t v7 = *(unsigned int *)ptr[v4].var0;
    v8 = (void *)MEMORY[0x192FD70A0]();
    id v9 = [(AFBBufRef *)self->_br data];
    var0 = (unsigned int *)v6[v7].var0;
    uint64_t v11 = (uint64_t)var0 - [v9 bytes] + 4;

    v12 = [(AFBBufRef *)self->_br data];
    v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);
  }
  else
  {
    v13 = 0;
  }
  return (NSData *)v13;
}

- (NSString)containerBundleIdentifier
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0)
  {
    v6 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    NSStringFromSelector(a2);
    uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = makeNSString(v7, self->_br, (const char *)&v6[4]);
  }
  else
  {
    v8 = 0;
  }
  return (NSString *)v8;
}

- (const)containerBundleIdentifierAsCString
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0) {
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  }
  else {
    return 0;
  }
}

- (NSData)containerBundleIdentifierAsData
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0)
  {
    v6 = &ptr[v4];
    uint64_t v7 = *(unsigned int *)ptr[v4].var0;
    v8 = (void *)MEMORY[0x192FD70A0]();
    id v9 = [(AFBBufRef *)self->_br data];
    var0 = (unsigned int *)v6[v7].var0;
    uint64_t v11 = (uint64_t)var0 - [v9 bytes] + 4;

    v12 = [(AFBBufRef *)self->_br data];
    v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);
  }
  else
  {
    v13 = 0;
  }
  return (NSData *)v13;
}

- (NSString)deviceIdentifier
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0)
  {
    v6 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    NSStringFromSelector(a2);
    uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = makeNSString(v7, self->_br, (const char *)&v6[4]);
  }
  else
  {
    v8 = 0;
  }
  return (NSString *)v8;
}

- (const)deviceIdentifierAsCString
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0) {
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  }
  else {
    return 0;
  }
}

- (NSData)deviceIdentifierAsData
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0)
  {
    v6 = &ptr[v4];
    uint64_t v7 = *(unsigned int *)ptr[v4].var0;
    v8 = (void *)MEMORY[0x192FD70A0]();
    id v9 = [(AFBBufRef *)self->_br data];
    var0 = (unsigned int *)v6[v7].var0;
    uint64_t v11 = (uint64_t)var0 - [v9 bytes] + 4;

    v12 = [(AFBBufRef *)self->_br data];
    v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);
  }
  else
  {
    v13 = 0;
  }
  return (NSData *)v13;
}

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  v3 = [(_CHSExtensionIdentityBuf *)self deepCopyUsingBufferBuilder:a3 changes:0];
  return v3;
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 670, @"Invalid parameter not satisfying: %@", @"bufferBuilder" object file lineNumber description];
  }
  id v9 = (void *)MEMORY[0x192FD70A0]();
  if (!v8) {
    goto LABEL_6;
  }
  if (v8[8] == 1)
  {
    v12 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 3)];
    goto LABEL_13;
  }
  if (v8[8])
  {
    v12 = 0;
  }
  else
  {
LABEL_6:
    v10 = (void *)MEMORY[0x192FD70A0]();
    uint64_t v11 = [(_CHSExtensionIdentityBuf *)self tokenStringAsCString];
    if (v11)
    {
      v12 = [v7 createStringWithCString:v11];
    }
    else
    {
      v12 = 0;
    }
    if (!v8)
    {
LABEL_15:
      v13 = (void *)MEMORY[0x192FD70A0]();
      v14 = [(_CHSExtensionIdentityBuf *)self extensionBundleIdentifierAsCString];
      if (v14)
      {
        v15 = [v7 createStringWithCString:v14];
      }
      else
      {
        v15 = 0;
      }
      if (!v8) {
        goto LABEL_23;
      }
      goto LABEL_21;
    }
  }
LABEL_13:
  if (v8[16] == 1)
  {
    v15 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 5)];
  }
  else
  {
    if (!v8[16]) {
      goto LABEL_15;
    }
    v15 = 0;
  }
LABEL_21:
  if (v8[24] == 1)
  {
    v18 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 7)];
    goto LABEL_29;
  }
  if (v8[24])
  {
    v18 = 0;
    goto LABEL_29;
  }
LABEL_23:
  v16 = (void *)MEMORY[0x192FD70A0]();
  v17 = [(_CHSExtensionIdentityBuf *)self containerBundleIdentifierAsCString];
  if (v17)
  {
    v18 = [v7 createStringWithCString:v17];
  }
  else
  {
    v18 = 0;
  }
  if (!v8) {
    goto LABEL_31;
  }
LABEL_29:
  if (v8[32] == 1)
  {
    v21 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 9)];
  }
  else
  {
    if (!v8[32])
    {
LABEL_31:
      v19 = (void *)MEMORY[0x192FD70A0]();
      v20 = [(_CHSExtensionIdentityBuf *)self deviceIdentifierAsCString];
      if (v20)
      {
        v21 = [v7 createStringWithCString:v20];
      }
      else
      {
        v21 = 0;
      }
      goto LABEL_37;
    }
    v21 = 0;
  }
LABEL_37:
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __63___CHSExtensionIdentityBuf_deepCopyUsingBufferBuilder_changes___block_invoke;
  v29[3] = &unk_1E56C9098;
  id v22 = v12;
  id v30 = v22;
  id v23 = v15;
  id v31 = v23;
  id v24 = v18;
  id v32 = v24;
  id v33 = v21;
  id v25 = v21;
  v26 = [v7 _chsCreateExtensionIdentityBufUsingBlock:v29];

  return v26;
}

- (_CHSExtensionIdentityBuf)initWithBufRef:(id)a3 cppPointer:(const ExtensionIdentityBuf *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CHSExtensionIdentityBuf;
  v8 = [(_CHSExtensionIdentityBuf *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_br, a3);
    v9->_ptr = a4;
  }

  return v9;
}

- (id)initVerifiedRootObjectFromData:(id)a3
{
  return [(_CHSExtensionIdentityBuf *)self initVerifiedRootObjectFromData:a3 requireUTF8:1];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return [(_CHSExtensionIdentityBuf *)self initVerifiedRootObjectFromData:a3 requireUTF8:a4 maxDepth:64 maxTables:1000000];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6
{
  id v10 = a3;
  objc_super v11 = (void *)MEMORY[0x192FD70A0]();
  id v12 = v10;
  uint64_t v13 = [v12 bytes];
  if (v13) {
    v14 = (unsigned int *)v13;
  }
  else {
    v14 = (unsigned int *)&emptyCArrayStorage;
  }
  v21 = v14;
  unint64_t v22 = [v12 length];
  LODWORD(v23) = 0;
  HIDWORD(v23) = a5;
  LODWORD(v24) = 0;
  HIDWORD(v24) = a6;
  uint64_t v25 = 0;
  LOBYTE(v26) = 1;
  if (v22 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  if (apple::aiml::flatbuffers2::Verifier::VerifyBufferFromStart<ExtensionIdentityBuf>((apple::aiml::flatbuffers2::Verifier *)&v21, "RECA", 0))
  {
    uint64_t v15 = *v14;
    id v16 = objc_alloc(MEMORY[0x1E4F4D8A0]);
    v17 = objc_msgSend(v16, "initWithData:", v12, v21, v22, v23, v24, v25, v26);
    self = [(_CHSExtensionIdentityBuf *)self initWithBufRef:v17 cppPointer:(char *)v14 + v15];

    v18 = self;
    if (a4)
    {
      if ([(_CHSExtensionIdentityBuf *)self verifyUTF8Fields]) {
        v18 = self;
      }
      else {
        v18 = 0;
      }
    }
    v19 = v18;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)verifyUTF8Fields
{
  ptr = self->_ptr;
  uint64_t v4 = *(int *)ptr->var0;
  uint64_t v5 = -v4;
  v6 = &ptr[-v4];
  if (*(unsigned __int16 *)v6->var0 >= 5u && *(_WORD *)v6[4].var0)
  {
    int valid = AFBIsValidUTF8();
    if (!valid) {
      return valid;
    }
    ptr = self->_ptr;
    uint64_t v5 = -(uint64_t)*(int *)ptr->var0;
  }
  if (*(unsigned __int16 *)ptr[v5].var0 >= 7u && *(_WORD *)ptr[v5 + 6].var0)
  {
    int valid = AFBIsValidUTF8();
    if (!valid) {
      return valid;
    }
    ptr = self->_ptr;
    uint64_t v5 = -(uint64_t)*(int *)ptr->var0;
  }
  if (*(unsigned __int16 *)ptr[v5].var0 >= 9u && *(_WORD *)ptr[v5 + 8].var0)
  {
    int valid = AFBIsValidUTF8();
    if (!valid) {
      return valid;
    }
    ptr = self->_ptr;
    uint64_t v5 = -(uint64_t)*(int *)ptr->var0;
  }
  v8 = &ptr[v5];
  if (*(unsigned __int16 *)v8->var0 >= 0xBu && *(_WORD *)v8[10].var0)
  {
    LOBYTE(valid) = AFBIsValidUTF8();
  }
  else
  {
    LOBYTE(valid) = 1;
  }
  return valid;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x192FD70A0](self, a2);
  uint64_t v4 = [(_CHSExtensionIdentityBuf *)self tokenString];
  uint64_t v5 = [v4 hash];

  v6 = [(_CHSExtensionIdentityBuf *)self extensionBundleIdentifier];
  uint64_t v7 = [v6 hash];

  v8 = [(_CHSExtensionIdentityBuf *)self containerBundleIdentifier];
  uint64_t v9 = [v8 hash];

  id v10 = [(_CHSExtensionIdentityBuf *)self deviceIdentifier];
  unint64_t v11 = [v10 hash] + 37 * (v9 + 37 * (v7 + 37 * v5));

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (void *)MEMORY[0x192FD70A0]();
      uint64_t v8 = [(_CHSExtensionIdentityBuf *)self tokenString];
      uint64_t v9 = [v6 tokenString];
      if (v8 | v9)
      {
        int v10 = [(id)v8 isEqual:v9];

        if (!v10) {
          goto LABEL_13;
        }
      }
      uint64_t v11 = [(_CHSExtensionIdentityBuf *)self extensionBundleIdentifier];
      uint64_t v12 = [v6 extensionBundleIdentifier];
      if (v11 | v12)
      {
        int v13 = [(id)v11 isEqual:v12];

        if (!v13) {
          goto LABEL_13;
        }
      }
      uint64_t v14 = [(_CHSExtensionIdentityBuf *)self containerBundleIdentifier];
      uint64_t v15 = [v6 containerBundleIdentifier];
      if (v14 | v15
        && (int v16 = [(id)v14 isEqual:v15], (id)v15, (id)v14, !v16))
      {
LABEL_13:
        char v19 = 0;
      }
      else
      {
        uint64_t v17 = [(_CHSExtensionIdentityBuf *)self deviceIdentifier];
        uint64_t v18 = [v6 deviceIdentifier];
        if (v17 | v18) {
          char v19 = [(id)v17 isEqual:v18];
        }
        else {
          char v19 = 1;
        }
      }
    }
    else
    {
      char v19 = 0;
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (void).cxx_destruct
{
}

@end