@interface _CHSIntentReferenceBuf
- (BOOL)enumerateIntentDataUsingBlock:(id)a3;
- (BOOL)enumeratePartialIntentDataUsingBlock:(id)a3;
- (BOOL)enumerateSchemaDataUsingBlock:(id)a3;
- (BOOL)hasStableHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)verifyUTF8Fields;
- (NSArray)intentData;
- (NSArray)partialIntentData;
- (NSArray)schemaData;
- (NSData)intentDataAsData;
- (NSData)partialIntentDataAsData;
- (NSData)schemaDataAsData;
- (_CHSIntentReferenceBuf)initWithBufRef:(id)a3 cppPointer:(const IntentReferenceBuf *)a4;
- (const)intentDataAsCArrayWithCount:(unint64_t *)a3;
- (const)partialIntentDataAsCArrayWithCount:(unint64_t *)a3;
- (const)schemaDataAsCArrayWithCount:(unint64_t *)a3;
- (id)deepCopyUsingBufferBuilder:(id)a3;
- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4;
- (id)initVerifiedRootObjectFromData:(id)a3;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6;
- (int64_t)stableHash;
- (unint64_t)hash;
@end

@implementation _CHSIntentReferenceBuf

- (BOOL)hasStableHash
{
  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 5u && *(_WORD *)v2[4].var0 != 0;
}

- (int64_t)stableHash
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return *(void *)ptr[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSArray)intentData
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v4 + *(unsigned int *)ptr[v4].var0].var0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __36___CHSIntentReferenceBuf_intentData__block_invoke;
    aBlock[3] = &__block_descriptor_40_e18___NSNumber_16__0Q8l;
    aBlock[4] = var0;
    v7 = _Block_copy(aBlock);
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F4D898]) initWithBufRef:self->_br count:*var0 objectAtIndex:v7];
  }
  else
  {
    v8 = 0;
  }
  return (NSArray *)v8;
}

- (NSData)intentDataAsData
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0)
  {
    v7 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    [(AFBBufRef *)self->_br retainBuf];
    CFDataRef v8 = CFDataCreateWithBytesNoCopy(0, v7[4].var0, *(unsigned int *)v7->var0, (CFAllocatorRef)[(AFBBufRef *)self->_br deallocator]);
    if (!v8)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"_CHSRelevanceCache_generated.mm" lineNumber:2092 description:@"Failed to create CFData"];
    }
  }
  else
  {
    CFDataRef v8 = 0;
  }
  return (NSData *)v8;
}

- (const)intentDataAsCArrayWithCount:(unint64_t *)a3
{
  if (a3) {
    *a3 = 0;
  }
  ptr = self->_ptr;
  uint64_t v4 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v4->var0 < 7u) {
    return 0;
  }
  uint64_t v5 = *(unsigned __int16 *)v4[6].var0;
  if (!v5) {
    return 0;
  }
  v6 = &ptr[v5 + *(unsigned int *)ptr[v5].var0];
  unint64_t v7 = *(unsigned int *)v6->var0;
  if (a3) {
    *a3 = v7;
  }
  CFDataRef v8 = (const char *)&v6[4];
  if (v7) {
    return v8;
  }
  else {
    return (const char *)&emptyCArrayStorage;
  }
}

- (BOOL)enumerateIntentDataUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void, unint64_t, unsigned __int8 *))a3;
  ptr = self->_ptr;
  v6 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0)
  {
    CFDataRef v8 = &ptr[v7];
    uint64_t v9 = *(unsigned int *)ptr[v7].var0;
    if (*(_DWORD *)ptr[v7 + v9].var0)
    {
      unint64_t v10 = 0;
      uint64_t v11 = (uint64_t)&ptr[v7 + 4 + v9];
      do
      {
        uint64_t v12 = MEMORY[0x192FD70A0]();
        unsigned __int8 v17 = 0;
        if (v10 >= *(unsigned int *)v8[v9].var0) {
          __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
        }
        v13 = (void *)v12;
        v4[2](v4, *(unsigned __int8 *)(v11 + v10), v10, &v17);
        int v14 = v17;
        if (v14) {
          break;
        }
        ++v10;
      }
      while (v10 < *(unsigned int *)v8[v9].var0);
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (NSArray)schemaData
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v4 + *(unsigned int *)ptr[v4].var0].var0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __36___CHSIntentReferenceBuf_schemaData__block_invoke;
    aBlock[3] = &__block_descriptor_40_e18___NSNumber_16__0Q8l;
    aBlock[4] = var0;
    uint64_t v7 = _Block_copy(aBlock);
    CFDataRef v8 = (void *)[objc_alloc(MEMORY[0x1E4F4D898]) initWithBufRef:self->_br count:*var0 objectAtIndex:v7];
  }
  else
  {
    CFDataRef v8 = 0;
  }
  return (NSArray *)v8;
}

- (NSData)schemaDataAsData
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0)
  {
    uint64_t v7 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    [(AFBBufRef *)self->_br retainBuf];
    CFDataRef v8 = CFDataCreateWithBytesNoCopy(0, v7[4].var0, *(unsigned int *)v7->var0, (CFAllocatorRef)[(AFBBufRef *)self->_br deallocator]);
    if (!v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"_CHSRelevanceCache_generated.mm" lineNumber:2138 description:@"Failed to create CFData"];
    }
  }
  else
  {
    CFDataRef v8 = 0;
  }
  return (NSData *)v8;
}

- (const)schemaDataAsCArrayWithCount:(unint64_t *)a3
{
  if (a3) {
    *a3 = 0;
  }
  ptr = self->_ptr;
  uint64_t v4 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v4->var0 < 9u) {
    return 0;
  }
  uint64_t v5 = *(unsigned __int16 *)v4[8].var0;
  if (!v5) {
    return 0;
  }
  v6 = &ptr[v5 + *(unsigned int *)ptr[v5].var0];
  unint64_t v7 = *(unsigned int *)v6->var0;
  if (a3) {
    *a3 = v7;
  }
  CFDataRef v8 = (const char *)&v6[4];
  if (v7) {
    return v8;
  }
  else {
    return (const char *)&emptyCArrayStorage;
  }
}

- (BOOL)enumerateSchemaDataUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void, unint64_t, unsigned __int8 *))a3;
  ptr = self->_ptr;
  v6 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v6->var0 >= 9u && (uint64_t v7 = *(unsigned __int16 *)v6[8].var0) != 0)
  {
    CFDataRef v8 = &ptr[v7];
    uint64_t v9 = *(unsigned int *)ptr[v7].var0;
    if (*(_DWORD *)ptr[v7 + v9].var0)
    {
      unint64_t v10 = 0;
      uint64_t v11 = (uint64_t)&ptr[v7 + 4 + v9];
      do
      {
        uint64_t v12 = MEMORY[0x192FD70A0]();
        unsigned __int8 v17 = 0;
        if (v10 >= *(unsigned int *)v8[v9].var0) {
          __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
        }
        v13 = (void *)v12;
        v4[2](v4, *(unsigned __int8 *)(v11 + v10), v10, &v17);
        int v14 = v17;
        if (v14) {
          break;
        }
        ++v10;
      }
      while (v10 < *(unsigned int *)v8[v9].var0);
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (NSArray)partialIntentData
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v4 + *(unsigned int *)ptr[v4].var0].var0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __43___CHSIntentReferenceBuf_partialIntentData__block_invoke;
    aBlock[3] = &__block_descriptor_40_e18___NSNumber_16__0Q8l;
    aBlock[4] = var0;
    uint64_t v7 = _Block_copy(aBlock);
    CFDataRef v8 = (void *)[objc_alloc(MEMORY[0x1E4F4D898]) initWithBufRef:self->_br count:*var0 objectAtIndex:v7];
  }
  else
  {
    CFDataRef v8 = 0;
  }
  return (NSArray *)v8;
}

- (NSData)partialIntentDataAsData
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0)
  {
    uint64_t v7 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    [(AFBBufRef *)self->_br retainBuf];
    CFDataRef v8 = CFDataCreateWithBytesNoCopy(0, v7[4].var0, *(unsigned int *)v7->var0, (CFAllocatorRef)[(AFBBufRef *)self->_br deallocator]);
    if (!v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"_CHSRelevanceCache_generated.mm" lineNumber:2184 description:@"Failed to create CFData"];
    }
  }
  else
  {
    CFDataRef v8 = 0;
  }
  return (NSData *)v8;
}

- (const)partialIntentDataAsCArrayWithCount:(unint64_t *)a3
{
  if (a3) {
    *a3 = 0;
  }
  ptr = self->_ptr;
  uint64_t v4 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v4->var0 < 0xBu) {
    return 0;
  }
  uint64_t v5 = *(unsigned __int16 *)v4[10].var0;
  if (!v5) {
    return 0;
  }
  v6 = &ptr[v5 + *(unsigned int *)ptr[v5].var0];
  unint64_t v7 = *(unsigned int *)v6->var0;
  if (a3) {
    *a3 = v7;
  }
  CFDataRef v8 = (const char *)&v6[4];
  if (v7) {
    return v8;
  }
  else {
    return (const char *)&emptyCArrayStorage;
  }
}

- (BOOL)enumeratePartialIntentDataUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void, unint64_t, unsigned __int8 *))a3;
  ptr = self->_ptr;
  v6 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0)
  {
    CFDataRef v8 = &ptr[v7];
    uint64_t v9 = *(unsigned int *)ptr[v7].var0;
    if (*(_DWORD *)ptr[v7 + v9].var0)
    {
      unint64_t v10 = 0;
      uint64_t v11 = (uint64_t)&ptr[v7 + 4 + v9];
      do
      {
        uint64_t v12 = MEMORY[0x192FD70A0]();
        unsigned __int8 v17 = 0;
        if (v10 >= *(unsigned int *)v8[v9].var0) {
          __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
        }
        v13 = (void *)v12;
        v4[2](v4, *(unsigned __int8 *)(v11 + v10), v10, &v17);
        int v14 = v17;
        if (v14) {
          break;
        }
        ++v10;
      }
      while (v10 < *(unsigned int *)v8[v9].var0);
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  v3 = [(_CHSIntentReferenceBuf *)self deepCopyUsingBufferBuilder:a3 changes:0];
  return v3;
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7 = a3;
  CFDataRef v8 = a4;
  if (!v7)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 2219, @"Invalid parameter not satisfying: %@", @"bufferBuilder" object file lineNumber description];
  }
  uint64_t v9 = (void *)MEMORY[0x192FD70A0]();
  if (!v8)
  {
LABEL_6:
    unint64_t v10 = [(_CHSIntentReferenceBuf *)self intentData];
    if (v10)
    {
      uint64_t v11 = [v7 createVectorOfUInt8WithArray:v10];
    }
    else
    {
      uint64_t v11 = 0;
    }

    if (!v8) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v8[24] == 1)
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:*((unsigned int *)v8 + 7)];
  }
  else
  {
    if (!v8[24]) {
      goto LABEL_6;
    }
    uint64_t v11 = 0;
  }
LABEL_13:
  if (v8[32] == 1)
  {
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:*((unsigned int *)v8 + 9)];
    goto LABEL_21;
  }
  if (v8[32])
  {
    v13 = 0;
    goto LABEL_21;
  }
LABEL_15:
  uint64_t v12 = [(_CHSIntentReferenceBuf *)self schemaData];
  if (v12)
  {
    v13 = [v7 createVectorOfUInt8WithArray:v12];
  }
  else
  {
    v13 = 0;
  }

  if (!v8) {
    goto LABEL_23;
  }
LABEL_21:
  if (v8[40] == 1)
  {
    BOOL v15 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:*((unsigned int *)v8 + 11)];
  }
  else
  {
    if (!v8[40])
    {
LABEL_23:
      int v14 = [(_CHSIntentReferenceBuf *)self partialIntentData];
      if (v14)
      {
        BOOL v15 = [v7 createVectorOfUInt8WithArray:v14];
      }
      else
      {
        BOOL v15 = 0;
      }

      goto LABEL_29;
    }
    BOOL v15 = 0;
  }
LABEL_29:
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __61___CHSIntentReferenceBuf_deepCopyUsingBufferBuilder_changes___block_invoke;
  v23[3] = &unk_1E56C9160;
  v16 = v8;
  id v24 = v16;
  v25 = self;
  id v17 = v11;
  id v26 = v17;
  id v18 = v13;
  id v27 = v18;
  id v28 = v15;
  id v19 = v15;
  v20 = [v7 _chsCreateIntentReferenceBufUsingBlock:v23];

  return v20;
}

- (_CHSIntentReferenceBuf)initWithBufRef:(id)a3 cppPointer:(const IntentReferenceBuf *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CHSIntentReferenceBuf;
  CFDataRef v8 = [(_CHSIntentReferenceBuf *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_br, a3);
    v9->_ptr = a4;
  }

  return v9;
}

- (id)initVerifiedRootObjectFromData:(id)a3
{
  return [(_CHSIntentReferenceBuf *)self initVerifiedRootObjectFromData:a3 requireUTF8:1];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return [(_CHSIntentReferenceBuf *)self initVerifiedRootObjectFromData:a3 requireUTF8:a4 maxDepth:64 maxTables:1000000];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6
{
  id v10 = a3;
  objc_super v11 = (void *)MEMORY[0x192FD70A0]();
  id v12 = v10;
  uint64_t v13 = [v12 bytes];
  if (v13) {
    int v14 = (unsigned int *)v13;
  }
  else {
    int v14 = (unsigned int *)&emptyCArrayStorage;
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
  if (apple::aiml::flatbuffers2::Verifier::VerifyBufferFromStart<IntentReferenceBuf>((apple::aiml::flatbuffers2::Verifier *)&v21, "RECA", 0))
  {
    uint64_t v15 = *v14;
    id v16 = objc_alloc(MEMORY[0x1E4F4D8A0]);
    id v17 = objc_msgSend(v16, "initWithData:", v12, v21, v22, v23, v24, v25, v26);
    self = [(_CHSIntentReferenceBuf *)self initWithBufRef:v17 cppPointer:(char *)v14 + v15];

    id v18 = self;
    if (a4)
    {
      if ([(_CHSIntentReferenceBuf *)self verifyUTF8Fields]) {
        id v18 = self;
      }
      else {
        id v18 = 0;
      }
    }
    id v19 = v18;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (BOOL)verifyUTF8Fields
{
  return 1;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x192FD70A0](self, a2);
  int64_t v4 = [(_CHSIntentReferenceBuf *)self stableHash];
  uint64_t v5 = [(_CHSIntentReferenceBuf *)self intentData];
  uint64_t v6 = [v5 hash];

  id v7 = [(_CHSIntentReferenceBuf *)self schemaData];
  uint64_t v8 = [v7 hash];

  uint64_t v9 = [(_CHSIntentReferenceBuf *)self partialIntentData];
  unint64_t v10 = [v9 hash] + 37 * (v8 + 37 * (v6 + 37 * v4));

  return v10;
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
      id v7 = (void *)MEMORY[0x192FD70A0]();
      int64_t v8 = [(_CHSIntentReferenceBuf *)self stableHash];
      if (v8 != [v6 stableHash]) {
        goto LABEL_12;
      }
      uint64_t v9 = [(_CHSIntentReferenceBuf *)self intentData];
      uint64_t v10 = [v6 intentData];
      if (v9 | v10)
      {
        int v11 = [(id)v9 isEqual:v10];

        if (!v11) {
          goto LABEL_12;
        }
      }
      uint64_t v12 = [(_CHSIntentReferenceBuf *)self schemaData];
      uint64_t v13 = [v6 schemaData];
      if (!(v12 | v13)
        || (int v14 = [(id)v12 isEqual:v13], (id)v13, (id)v12, v14))
      {
        uint64_t v15 = [(_CHSIntentReferenceBuf *)self partialIntentData];
        uint64_t v16 = [v6 partialIntentData];
        if (v15 | v16) {
          char v17 = [(id)v15 isEqual:v16];
        }
        else {
          char v17 = 1;
        }
      }
      else
      {
LABEL_12:
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (void).cxx_destruct
{
}

@end