@interface _CHSWidgetRelevanceBuf
- (BOOL)isEqual:(id)a3;
- (BOOL)verifyUTF8Fields;
- (NSData)attributeKeyAsData;
- (NSString)attributeKey;
- (_CHSIntentReferenceBuf)intentReference;
- (_CHSWidgetRelevanceBuf)initWithBufRef:(id)a3 cppPointer:(const WidgetRelevanceBuf *)a4;
- (const)attributeKeyAsCString;
- (id)deepCopyUsingBufferBuilder:(id)a3;
- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4;
- (id)initVerifiedRootObjectFromData:(id)a3;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6;
- (unint64_t)hash;
@end

@implementation _CHSWidgetRelevanceBuf

- (NSString)attributeKey
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

- (const)attributeKeyAsCString
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

- (NSData)attributeKeyAsData
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

- (_CHSIntentReferenceBuf)intentReference
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0) {
    v5 = [[_CHSIntentReferenceBuf alloc] initWithBufRef:self->_br cppPointer:&ptr[v4 + *(unsigned int *)ptr[v4].var0]];
  }
  else {
    v5 = 0;
  }
  return v5;
}

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  v3 = [(_CHSWidgetRelevanceBuf *)self deepCopyUsingBufferBuilder:a3 changes:0];
  return v3;
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 1734, @"Invalid parameter not satisfying: %@", @"bufferBuilder" object file lineNumber description];
  }
  id v9 = (void *)MEMORY[0x192FD70A0]();
  if (!v8) {
    goto LABEL_6;
  }
  if (v8[8] == 1)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:*((unsigned int *)v8 + 3)];
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
    uint64_t v11 = [(_CHSWidgetRelevanceBuf *)self attributeKeyAsCString];
    if (v11)
    {
      v12 = [v7 createStringWithCString:v11];
    }
    else
    {
      v12 = 0;
    }
    if (!v8) {
      goto LABEL_15;
    }
  }
LABEL_13:
  if (v8[16] == 1)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:*((unsigned int *)v8 + 5)];
  }
  else
  {
    if (!v8[16])
    {
LABEL_15:
      v13 = [(_CHSWidgetRelevanceBuf *)self intentReference];
      v14 = v13;
      if (v13)
      {
        v15 = [v13 deepCopyUsingBufferBuilder:v7];
      }
      else
      {
        v15 = 0;
      }

      goto LABEL_21;
    }
    v15 = 0;
  }
LABEL_21:
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61___CHSWidgetRelevanceBuf_deepCopyUsingBufferBuilder_changes___block_invoke;
  v21[3] = &unk_1E56C9138;
  id v16 = v12;
  id v22 = v16;
  id v23 = v15;
  id v17 = v15;
  v18 = [v7 _chsCreateWidgetRelevanceBufUsingBlock:v21];

  return v18;
}

- (_CHSWidgetRelevanceBuf)initWithBufRef:(id)a3 cppPointer:(const WidgetRelevanceBuf *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CHSWidgetRelevanceBuf;
  v8 = [(_CHSWidgetRelevanceBuf *)&v11 init];
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
  return [(_CHSWidgetRelevanceBuf *)self initVerifiedRootObjectFromData:a3 requireUTF8:1];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return [(_CHSWidgetRelevanceBuf *)self initVerifiedRootObjectFromData:a3 requireUTF8:a4 maxDepth:64 maxTables:1000000];
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
  if (apple::aiml::flatbuffers2::Verifier::VerifyBufferFromStart<WidgetRelevanceBuf>((apple::aiml::flatbuffers2::Verifier *)&v21, "RECA", 0))
  {
    uint64_t v15 = *v14;
    id v16 = objc_alloc(MEMORY[0x1E4F4D8A0]);
    id v17 = objc_msgSend(v16, "initWithData:", v12, v21, v22, v23, v24, v25, v26);
    self = [(_CHSWidgetRelevanceBuf *)self initWithBufRef:v17 cppPointer:(char *)v14 + v15];

    v18 = self;
    if (a4)
    {
      if ([(_CHSWidgetRelevanceBuf *)self verifyUTF8Fields]) {
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
  v3 = &self->_ptr[-*(int *)self->_ptr];
  if (*(unsigned __int16 *)v3->var0 >= 5u && *(_WORD *)v3[4].var0 && !AFBIsValidUTF8()) {
    return 0;
  }
  uint64_t v4 = [(_CHSWidgetRelevanceBuf *)self intentReference];
  v5 = v4;
  if (v4) {
    char v6 = [v4 verifyUTF8Fields];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x192FD70A0](self, a2);
  uint64_t v4 = [(_CHSWidgetRelevanceBuf *)self attributeKey];
  uint64_t v5 = [v4 hash];

  char v6 = [(_CHSWidgetRelevanceBuf *)self intentReference];
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
      uint64_t v8 = [(_CHSWidgetRelevanceBuf *)self attributeKey];
      uint64_t v9 = [v6 attributeKey];
      if (v8 | v9 && (int v10 = [(id)v8 isEqual:v9], (id)v9, (id)v8, !v10))
      {
        char v13 = 0;
      }
      else
      {
        uint64_t v11 = [(_CHSWidgetRelevanceBuf *)self intentReference];
        uint64_t v12 = [v6 intentReference];
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