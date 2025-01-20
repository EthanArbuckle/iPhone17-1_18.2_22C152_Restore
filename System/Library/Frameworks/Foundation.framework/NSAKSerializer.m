@interface NSAKSerializer
- (id)initForSerializerStream:(id)a3;
- (id)serializerStream;
- (unint64_t)serializeData:(id)a3;
- (unint64_t)serializeList:(id)a3;
- (unint64_t)serializeListItemIn:(id)a3 at:(unint64_t)a4;
- (unint64_t)serializeObject:(id)a3;
- (unint64_t)serializePListKeyIn:(id)a3 key:(id)a4 value:(id)a5;
- (unint64_t)serializePListValueIn:(id)a3 key:(id)a4 value:(id)a5;
- (unint64_t)serializePropertyList:(id)a3;
- (unint64_t)serializeString:(id)a3;
- (void)dealloc;
@end

@implementation NSAKSerializer

- (id)initForSerializerStream:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSAKSerializer;
  v4 = [(NSAKSerializer *)&v6 init];
  v4->ss = a3;
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSAKSerializer;
  [(NSAKSerializer *)&v3 dealloc];
}

- (id)serializerStream
{
  return self->ss;
}

- (unint64_t)serializeObject:(id)a3
{
  if (_NSIsNSData())
  {
    uint64_t v5 = [self->ss writeInt:1];
    unint64_t v6 = [(NSAKSerializer *)self serializeData:a3];
    return v6 + v5;
  }
  if (_NSIsNSArray())
  {
    uint64_t v5 = [self->ss writeInt:2];
    unint64_t v6 = [(NSAKSerializer *)self serializeList:a3];
    return v6 + v5;
  }
  if (_NSIsNSDictionary())
  {
    uint64_t v5 = [self->ss writeInt:3];
    unint64_t v6 = [(NSAKSerializer *)self serializePropertyList:a3];
    return v6 + v5;
  }
  if (_NSIsNSString())
  {
    uint64_t v5 = [self->ss writeInt:4];
    unint64_t v6 = [(NSAKSerializer *)self serializeString:a3];
    return v6 + v5;
  }
  if (a3)
  {
    uint64_t v8 = objc_opt_class();
    NSLog((NSString *)@"Serializing object of class %@\n", v8);
  }
  id ss = self->ss;

  return [ss writeInt:0];
}

- (unint64_t)serializeData:(id)a3
{
  uint64_t v5 = [a3 length];
  uint64_t v6 = [a3 bytes];
  uint64_t v7 = [self->ss writeAlignedDataSize:v5];
  return [self->ss writeData:v6 length:v5] + v7;
}

- (unint64_t)serializeString:(id)a3
{
  uint64_t v4 = (void *)[a3 dataUsingEncoding:4 allowLossyConversion:1];
  uint64_t v5 = [v4 length];
  uint64_t v6 = [self->ss writeAlignedDataSize:v5];
  return objc_msgSend(self->ss, "writeData:length:", objc_msgSend(v4, "bytes"), v5) + v6;
}

- (unint64_t)serializeList:(id)a3
{
  uint64_t v5 = [a3 count];
  unint64_t v6 = [self->ss writeInt:v5];
  uint64_t v7 = (unsigned int *)malloc_type_malloc(4 * v5, 0x100004052888210uLL);
  if (!v7) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSSerializeException" reason:@"unable to allocate memory" userInfo:0]);
  }
  uint64_t v8 = v7;
  if (v5)
  {
    v9 = (char *)v7;
    uint64_t v10 = v5;
    do
    {
      v6 += [self->ss writeRoomForInt:v9];
      v9 += 4;
      --v10;
    }
    while (v10);
    for (uint64_t i = 0; i != v5; ++i)
    {
      unint64_t v12 = [(NSAKSerializer *)self serializeListItemIn:a3 at:i];
      [self->ss writeDelayedInt:v12 for:v8[i]];
      v6 += v12;
    }
  }
  free(v8);
  return v6;
}

- (unint64_t)serializeListItemIn:(id)a3 at:(unint64_t)a4
{
  uint64_t v5 = [a3 objectAtIndex:a4];

  return [(NSAKSerializer *)self serializeObject:v5];
}

- (unint64_t)serializePropertyList:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 count];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v17 = [self->ss writeInt:v5];
  unint64_t v6 = (char *)malloc_type_malloc(4 * v5, 0x546FFFFFuLL);
  if (!v6) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSSerializeException" reason:@"unable to allocate memory" userInfo:0]);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__NSAKSerializer_serializePropertyList___block_invoke;
  v13[3] = &unk_1E51FBB28;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = &v14;
  [a3 enumerateKeysAndObjectsUsingBlock:v13];
  bzero(v6, 4 * v5);
  if (v5)
  {
    uint64_t v7 = v6;
    do
    {
      uint64_t v8 = [self->ss writeRoomForInt:v7];
      v15[3] += v8;
      v7 += 4;
      --v5;
    }
    while (v5);
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__NSAKSerializer_serializePropertyList___block_invoke_2;
  v11[3] = &unk_1E51FBB50;
  v11[4] = self;
  v11[5] = a3;
  v11[7] = v12;
  v11[8] = v6;
  v11[6] = &v14;
  [a3 enumerateKeysAndObjectsUsingBlock:v11];
  free(v6);
  unint64_t v9 = v15[3];
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t __40__NSAKSerializer_serializePropertyList___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) serializePListKeyIn:*(void *)(a1 + 40) key:a2 value:a3];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += result;
  return result;
}

uint64_t __40__NSAKSerializer_serializePropertyList___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a1 + 32) serializePListValueIn:*(void *)(a1 + 40) key:a2 value:a3];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v4;
  return [*(id *)(*(void *)(a1 + 32) + 8) writeDelayedInt:v4 for:*(unsigned int *)(*(void *)(a1 + 64) + 4* (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))++)];
}

- (unint64_t)serializePListKeyIn:(id)a3 key:(id)a4 value:(id)a5
{
  return [(NSAKSerializer *)self serializeString:a4];
}

- (unint64_t)serializePListValueIn:(id)a3 key:(id)a4 value:(id)a5
{
  return -[NSAKSerializer serializeObject:](self, "serializeObject:", a5, a4);
}

@end