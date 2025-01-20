@interface _CHSWidgetRelevancePropertiesBuf
- (BOOL)hasIsDeletion;
- (BOOL)hasLastRelevanceUpdate;
- (BOOL)hasSupportsBackgroundRefresh;
- (BOOL)isDeletion;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsBackgroundRefresh;
- (BOOL)verifyUTF8Fields;
- (NSArray)relevances;
- (NSData)kindAsData;
- (NSString)kind;
- (_CHSExtensionIdentityBuf)extensionIdentity;
- (_CHSWidgetRelevancePropertiesBuf)initWithBufRef:(id)a3 cppPointer:(const WidgetRelevancePropertiesBuf *)a4;
- (const)kindAsCString;
- (double)lastRelevanceUpdate;
- (id)deepCopyUsingBufferBuilder:(id)a3;
- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4;
- (id)initVerifiedRootObjectFromData:(id)a3;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6;
- (unint64_t)hash;
@end

@implementation _CHSWidgetRelevancePropertiesBuf

- (_CHSExtensionIdentityBuf)extensionIdentity
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    v5 = [[_CHSExtensionIdentityBuf alloc] initWithBufRef:self->_br cppPointer:&ptr[v4 + *(unsigned int *)ptr[v4].var0]];
  }
  else {
    v5 = 0;
  }
  return v5;
}

- (NSString)kind
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0)
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

- (const)kindAsCString
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

- (NSData)kindAsData
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

- (BOOL)hasSupportsBackgroundRefresh
{
  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 9u && *(_WORD *)v2[8].var0 != 0;
}

- (BOOL)supportsBackgroundRefresh
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  return *(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0 && ptr[v4].var0[0] != 0;
}

- (BOOL)hasIsDeletion
{
  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0xBu && *(_WORD *)v2[10].var0 != 0;
}

- (BOOL)isDeletion
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0 && ptr[v4].var0[0] != 0;
}

- (BOOL)hasLastRelevanceUpdate
{
  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0xDu && *(_WORD *)v2[12].var0 != 0;
}

- (double)lastRelevanceUpdate
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xDu)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[12].var0;
    if (v5) {
      return *(double *)ptr[v5].var0;
    }
  }
  return result;
}

- (NSArray)relevances
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (uint64_t v4 = *(unsigned __int16 *)v3[14].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v4 + *(unsigned int *)ptr[v4].var0].var0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46___CHSWidgetRelevancePropertiesBuf_relevances__block_invoke;
    v10[3] = &unk_1E56C8FD8;
    v10[4] = self;
    v10[5] = var0;
    uint64_t v7 = _Block_copy(v10);
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F4D898]) initWithBufRef:self->_br count:*var0 objectAtIndex:v7];
  }
  else
  {
    v8 = 0;
  }
  return (NSArray *)v8;
}

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  v3 = [(_CHSWidgetRelevancePropertiesBuf *)self deepCopyUsingBufferBuilder:a3 changes:0];
  return v3;
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 1186, @"Invalid parameter not satisfying: %@", @"bufferBuilder" object file lineNumber description];
  }
  id v9 = (void *)MEMORY[0x192FD70A0]();
  if (!v8)
  {
LABEL_6:
    v10 = [(_CHSWidgetRelevancePropertiesBuf *)self extensionIdentity];
    uint64_t v11 = v10;
    if (v10)
    {
      v12 = [v10 deepCopyUsingBufferBuilder:v7];
    }
    else
    {
      v12 = 0;
    }

    if (!v8) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v8[8] == 1)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:*((unsigned int *)v8 + 3)];
  }
  else
  {
    if (!v8[8]) {
      goto LABEL_6;
    }
    v12 = 0;
  }
LABEL_13:
  if (v8[16] == 1)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:*((unsigned int *)v8 + 5)];
    goto LABEL_21;
  }
  if (v8[16])
  {
    v15 = 0;
    goto LABEL_21;
  }
LABEL_15:
  v13 = (void *)MEMORY[0x192FD70A0]();
  v14 = [(_CHSWidgetRelevancePropertiesBuf *)self kindAsCString];
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
LABEL_21:
  if (v8[40] == 1)
  {
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:*((unsigned int *)v8 + 11)];
  }
  else
  {
    if (!v8[40])
    {
LABEL_23:
      v16 = [(_CHSWidgetRelevancePropertiesBuf *)self relevances];
      if (v16)
      {
        v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __71___CHSWidgetRelevancePropertiesBuf_deepCopyUsingBufferBuilder_changes___block_invoke;
        v34[3] = &unk_1E56C90C0;
        id v18 = v17;
        id v35 = v18;
        id v19 = v7;
        id v36 = v19;
        [v16 enumerateObjectsUsingBlock:v34];
        v20 = [v19 _chsCreateVectorOfWidgetRelevanceBufWithOffsets:v18];
      }
      else
      {
        v20 = 0;
      }

      goto LABEL_29;
    }
    v20 = 0;
  }
LABEL_29:
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __71___CHSWidgetRelevancePropertiesBuf_deepCopyUsingBufferBuilder_changes___block_invoke_2;
  v28[3] = &unk_1E56C90E8;
  id v21 = v12;
  id v29 = v21;
  id v22 = v15;
  id v30 = v22;
  v23 = v8;
  id v31 = v23;
  v32 = self;
  id v33 = v20;
  id v24 = v20;
  v25 = [v7 _chsCreateWidgetRelevancePropertiesBufUsingBlock:v28];

  return v25;
}

- (_CHSWidgetRelevancePropertiesBuf)initWithBufRef:(id)a3 cppPointer:(const WidgetRelevancePropertiesBuf *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CHSWidgetRelevancePropertiesBuf;
  v8 = [(_CHSWidgetRelevancePropertiesBuf *)&v11 init];
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
  return [(_CHSWidgetRelevancePropertiesBuf *)self initVerifiedRootObjectFromData:a3 requireUTF8:1];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return [(_CHSWidgetRelevancePropertiesBuf *)self initVerifiedRootObjectFromData:a3 requireUTF8:a4 maxDepth:64 maxTables:1000000];
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
  id v21 = v14;
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
  if (apple::aiml::flatbuffers2::Verifier::VerifyBufferFromStart<WidgetRelevancePropertiesBuf>((apple::aiml::flatbuffers2::Verifier *)&v21, "RECA", 0))
  {
    uint64_t v15 = *v14;
    id v16 = objc_alloc(MEMORY[0x1E4F4D8A0]);
    v17 = objc_msgSend(v16, "initWithData:", v12, v21, v22, v23, v24, v25, v26);
    self = [(_CHSWidgetRelevancePropertiesBuf *)self initWithBufRef:v17 cppPointer:(char *)v14 + v15];

    id v18 = self;
    if (a4)
    {
      if ([(_CHSWidgetRelevancePropertiesBuf *)self verifyUTF8Fields]) {
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
  v3 = [(_CHSWidgetRelevancePropertiesBuf *)self relevances];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 1;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52___CHSWidgetRelevancePropertiesBuf_verifyUTF8Fields__block_invoke;
    v11[3] = &unk_1E56C9110;
    v11[4] = &v12;
    [v3 enumerateObjectsUsingBlock:v11];
    int v5 = *((unsigned __int8 *)v13 + 24);
    _Block_object_dispose(&v12, 8);
    if (!v5)
    {

      return 0;
    }
  }

  v6 = [(_CHSWidgetRelevancePropertiesBuf *)self extensionIdentity];
  if (v6)
  {
    id v7 = v6;
    int v8 = [v6 verifyUTF8Fields];

    if (!v8) {
      return 0;
    }
  }
  id v9 = &self->_ptr[-*(int *)self->_ptr];
  if (*(unsigned __int16 *)v9->var0 >= 7u && *(_WORD *)v9[6].var0) {
    return AFBIsValidUTF8();
  }
  else {
    return 1;
  }
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x192FD70A0](self, a2);
  uint64_t v4 = [(_CHSWidgetRelevancePropertiesBuf *)self extensionIdentity];
  uint64_t v5 = [v4 hash];

  v6 = [(_CHSWidgetRelevancePropertiesBuf *)self kind];
  uint64_t v7 = [v6 hash];

  BOOL v8 = [(_CHSWidgetRelevancePropertiesBuf *)self supportsBackgroundRefresh];
  BOOL v9 = [(_CHSWidgetRelevancePropertiesBuf *)self isDeletion];
  [(_CHSWidgetRelevancePropertiesBuf *)self lastRelevanceUpdate];
  double v11 = v10;
  uint64_t v12 = [(_CHSWidgetRelevancePropertiesBuf *)self relevances];
  unint64_t v13 = [v12 hash] + 37 * ((unint64_t)v11 + 37 * (37 * (37 * (v7 + 37 * v5) + v8) + v9));

  return v13;
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
      uint64_t v8 = [(_CHSWidgetRelevancePropertiesBuf *)self extensionIdentity];
      uint64_t v9 = [v6 extensionIdentity];
      if (v8 | v9)
      {
        int v10 = [(id)v8 isEqual:v9];

        if (!v10) {
          goto LABEL_14;
        }
      }
      uint64_t v11 = [(_CHSWidgetRelevancePropertiesBuf *)self kind];
      uint64_t v12 = [v6 kind];
      if (v11 | v12)
      {
        int v13 = [(id)v11 isEqual:v12];

        if (!v13) {
          goto LABEL_14;
        }
      }
      int v14 = [(_CHSWidgetRelevancePropertiesBuf *)self supportsBackgroundRefresh];
      if (v14 == [v6 supportsBackgroundRefresh]
        && (int v15 = [(_CHSWidgetRelevancePropertiesBuf *)self isDeletion],
            v15 == [v6 isDeletion])
        && ([(_CHSWidgetRelevancePropertiesBuf *)self lastRelevanceUpdate],
            double v17 = v16,
            [v6 lastRelevanceUpdate],
            v17 == v18))
      {
        uint64_t v19 = [(_CHSWidgetRelevancePropertiesBuf *)self relevances];
        uint64_t v20 = [v6 relevances];
        if (v19 | v20) {
          char v21 = [(id)v19 isEqual:v20];
        }
        else {
          char v21 = 1;
        }
      }
      else
      {
LABEL_14:
        char v21 = 0;
      }
    }
    else
    {
      char v21 = 0;
    }
  }
  else
  {
    char v21 = 0;
  }

  return v21;
}

- (void).cxx_destruct
{
}

@end