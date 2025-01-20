@interface _CHSRelevanceCacheBuf
- (BOOL)enumerateArchivedObjectsUsingBlock:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)verifyUTF8Fields;
- (NSArray)archivedObjects;
- (NSArray)groups;
- (NSData)archivedObjectsAsData;
- (_CHSRelevanceCacheBuf)initWithBufRef:(id)a3 cppPointer:(const RelevanceCacheBuf *)a4;
- (const)archivedObjectsAsCArrayWithCount:(unint64_t *)a3;
- (id)deepCopyUsingBufferBuilder:(id)a3;
- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4;
- (id)initVerifiedRootObjectFromData:(id)a3;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6;
- (unint64_t)hash;
@end

@implementation _CHSRelevanceCacheBuf

- (NSArray)archivedObjects
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v4 + *(unsigned int *)ptr[v4].var0].var0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke;
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

- (NSData)archivedObjectsAsData
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0)
  {
    v7 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    [(AFBBufRef *)self->_br retainBuf];
    CFDataRef v8 = CFDataCreateWithBytesNoCopy(0, v7[4].var0, *(unsigned int *)v7->var0, (CFAllocatorRef)[(AFBBufRef *)self->_br deallocator]);
    if (!v8)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"_CHSRelevanceCache_generated.mm" lineNumber:187 description:@"Failed to create CFData"];
    }
  }
  else
  {
    CFDataRef v8 = 0;
  }
  return (NSData *)v8;
}

- (const)archivedObjectsAsCArrayWithCount:(unint64_t *)a3
{
  if (a3) {
    *a3 = 0;
  }
  ptr = self->_ptr;
  uint64_t v4 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v4->var0 < 5u) {
    return 0;
  }
  uint64_t v5 = *(unsigned __int16 *)v4[4].var0;
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

- (BOOL)enumerateArchivedObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void, unint64_t, unsigned __int8 *))a3;
  ptr = self->_ptr;
  v6 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0)
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

- (NSArray)groups
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v4 + *(unsigned int *)ptr[v4].var0].var0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __31___CHSRelevanceCacheBuf_groups__block_invoke;
    v10[3] = &unk_1E56C8FD8;
    v10[4] = self;
    v10[5] = var0;
    uint64_t v7 = _Block_copy(v10);
    CFDataRef v8 = (void *)[objc_alloc(MEMORY[0x1E4F4D898]) initWithBufRef:self->_br count:*var0 objectAtIndex:v7];
  }
  else
  {
    CFDataRef v8 = 0;
  }
  return (NSArray *)v8;
}

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  v3 = [(_CHSRelevanceCacheBuf *)self deepCopyUsingBufferBuilder:a3 changes:0];
  return v3;
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7 = a3;
  CFDataRef v8 = a4;
  if (!v7)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 235, @"Invalid parameter not satisfying: %@", @"bufferBuilder" object file lineNumber description];
  }
  uint64_t v9 = (void *)MEMORY[0x192FD70A0]();
  if (!v8) {
    goto LABEL_6;
  }
  if (v8[8] == 1)
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:*((unsigned int *)v8 + 3)];
    goto LABEL_13;
  }
  if (v8[8])
  {
    uint64_t v11 = 0;
  }
  else
  {
LABEL_6:
    unint64_t v10 = [(_CHSRelevanceCacheBuf *)self archivedObjects];
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
  }
LABEL_13:
  if (v8[16] == 1)
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:*((unsigned int *)v8 + 5)];
  }
  else
  {
    if (!v8[16])
    {
LABEL_15:
      uint64_t v12 = [(_CHSRelevanceCacheBuf *)self groups];
      if (v12)
      {
        v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __60___CHSRelevanceCacheBuf_deepCopyUsingBufferBuilder_changes___block_invoke;
        v25[3] = &unk_1E56C9000;
        id v14 = v13;
        id v26 = v14;
        id v15 = v7;
        id v27 = v15;
        [v12 enumerateObjectsUsingBlock:v25];
        v16 = [v15 _chsCreateVectorOfWidgetRelevancePropertiesBufWithOffsets:v14];
      }
      else
      {
        v16 = 0;
      }

      goto LABEL_21;
    }
    v16 = 0;
  }
LABEL_21:
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __60___CHSRelevanceCacheBuf_deepCopyUsingBufferBuilder_changes___block_invoke_2;
  v22[3] = &unk_1E56C9028;
  id v17 = v11;
  id v23 = v17;
  id v24 = v16;
  id v18 = v16;
  v19 = [v7 _chsCreateRelevanceCacheBufUsingBlock:v22];

  return v19;
}

- (_CHSRelevanceCacheBuf)initWithBufRef:(id)a3 cppPointer:(const RelevanceCacheBuf *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CHSRelevanceCacheBuf;
  CFDataRef v8 = [(_CHSRelevanceCacheBuf *)&v11 init];
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
  return [(_CHSRelevanceCacheBuf *)self initVerifiedRootObjectFromData:a3 requireUTF8:1];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return [(_CHSRelevanceCacheBuf *)self initVerifiedRootObjectFromData:a3 requireUTF8:a4 maxDepth:64 maxTables:1000000];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6
{
  id v10 = a3;
  objc_super v11 = (void *)MEMORY[0x192FD70A0]();
  id v12 = v10;
  uint64_t v13 = [v12 bytes];
  if (v13) {
    id v14 = (unsigned int *)v13;
  }
  else {
    id v14 = (unsigned int *)&emptyCArrayStorage;
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
  if (apple::aiml::flatbuffers2::Verifier::VerifyBufferFromStart<RelevanceCacheBuf>((apple::aiml::flatbuffers2::Verifier *)&v21, "RECA", 0))
  {
    uint64_t v15 = *v14;
    id v16 = objc_alloc(MEMORY[0x1E4F4D8A0]);
    id v17 = objc_msgSend(v16, "initWithData:", v12, v21, v22, v23, v24, v25, v26);
    self = [(_CHSRelevanceCacheBuf *)self initWithBufRef:v17 cppPointer:(char *)v14 + v15];

    id v18 = self;
    if (a4)
    {
      if ([(_CHSRelevanceCacheBuf *)self verifyUTF8Fields]) {
        id v18 = self;
      }
      else {
        id v18 = 0;
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
  v2 = [(_CHSRelevanceCacheBuf *)self groups];
  v3 = v2;
  if (!v2) {
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  CFDataRef v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41___CHSRelevanceCacheBuf_verifyUTF8Fields__block_invoke;
  v6[3] = &unk_1E56C9050;
  v6[4] = &v7;
  [v2 enumerateObjectsUsingBlock:v6];
  int v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  if (v4) {
LABEL_3:
  }
    LOBYTE(v4) = 1;

  return v4;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x192FD70A0](self, a2);
  int v4 = [(_CHSRelevanceCacheBuf *)self archivedObjects];
  uint64_t v5 = [v4 hash];

  v6 = [(_CHSRelevanceCacheBuf *)self groups];
  unint64_t v7 = [v6 hash] + 37 * v5;

  return v7;
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
      unint64_t v7 = (void *)MEMORY[0x192FD70A0]();
      uint64_t v8 = [(_CHSRelevanceCacheBuf *)self archivedObjects];
      uint64_t v9 = [v6 archivedObjects];
      if (v8 | v9 && (int v10 = [(id)v8 isEqual:v9], (id)v9, (id)v8, !v10))
      {
        char v13 = 0;
      }
      else
      {
        uint64_t v11 = [(_CHSRelevanceCacheBuf *)self groups];
        uint64_t v12 = [v6 groups];
        if (v11 | v12) {
          char v13 = [(id)v11 isEqual:v12];
        }
        else {
          char v13 = 1;
        }
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
}

@end