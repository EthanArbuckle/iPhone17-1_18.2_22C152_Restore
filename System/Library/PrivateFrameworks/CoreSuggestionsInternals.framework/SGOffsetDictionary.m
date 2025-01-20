@interface SGOffsetDictionary
- ($540B417C6688EA6D30870DDF6F7BDD26)carrierEntryForKey:(const char *)a3;
- (SGOffsetDictionary)initWithFilehandle:(id)a3 sizeFactor:(unint64_t)a4 keyLength:(int)a5 singleByteOffset:(BOOL)a6;
- (id)fullMappingFromFile:(id)a3;
- (id)stringValueForKey:(const char *)a3 fromFile:(id)a4;
- (int)payloadCountForKey:(const char *)a3;
- (unint64_t)payloadLengthForKey:(const char *)a3;
- (unint64_t)seekLocationForKey:(const char *)a3;
- (void)dealloc;
@end

@implementation SGOffsetDictionary

- (id)fullMappingFromFile:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:self->_count];
  if (self->_count)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      $540B417C6688EA6D30870DDF6F7BDD26 v11 = ($540B417C6688EA6D30870DDF6F7BDD26)0;
      $540B417C6688EA6D30870DDF6F7BDD26 v11 = self->_carrierEntries[v6];
      v8 = objCStringForCarrierKey((uint64_t)v11.var2);
      [v4 seekToFileOffset:v11.var0 + self->_payloadOffset];
      v9 = readUtf8String(v4, self->_sizeFactor * v11.var1);
      [v5 setObject:v9 forKeyedSubscript:v8];

      ++v7;
      ++v6;
    }
    while (v7 < self->_count);
  }

  return v5;
}

- (id)stringValueForKey:(const char *)a3 fromFile:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(SGOffsetDictionary *)self seekLocationForKey:a3];
  if (v7)
  {
    unint64_t v8 = v7;
    v9 = self;
    v10 = [(SGOffsetDictionary *)v9 carrierEntryForKey:a3];
    if (v10)
    {
      [v6 seekToFileOffset:v8];
      readUtf8String(v6, v9->_sizeFactor * v10[4]);
      v10 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int)payloadCountForKey:(const char *)a3
{
  v3 = [(SGOffsetDictionary *)self carrierEntryForKey:a3];
  if (v3) {
    LODWORD(v3) = v3->var1;
  }
  return (int)v3;
}

- (unint64_t)seekLocationForKey:(const char *)a3
{
  id v4 = self;
  unint64_t result = [(SGOffsetDictionary *)v4 carrierEntryForKey:a3];
  if (result) {
    return *(void *)result + v4->_payloadOffset;
  }
  return result;
}

- (unint64_t)payloadLengthForKey:(const char *)a3
{
  id v4 = self;
  unint64_t result = [(SGOffsetDictionary *)v4 carrierEntryForKey:a3];
  if (result) {
    return v4->_sizeFactor * *(unsigned __int16 *)(result + 8);
  }
  return result;
}

- ($540B417C6688EA6D30870DDF6F7BDD26)carrierEntryForKey:(const char *)a3
{
  if (strnlen(a3, 3uLL) <= 1) {
    [MEMORY[0x1E4F1CA00] raise:@"KeyTooShort" format:@"The key was too short."];
  }
  unint64_t result = self->_mruCarrierEntry;
  if (!result
    || (*(unsigned __int16 *)result->var2 == *(unsigned __int16 *)a3
      ? (BOOL v6 = result->var2[2] == *((unsigned __int8 *)a3 + 2))
      : (BOOL v6 = 0),
        !v6))
  {
    carrierEntries = self->_carrierEntries;
    size_t count = self->_count;
    __compar[0] = MEMORY[0x1E4F143A8];
    __compar[1] = 3221225472;
    __compar[2] = __41__SGOffsetDictionary_carrierEntryForKey___block_invoke;
    __compar[3] = &__block_descriptor_40_e15_i24__0r_v8r_v16l;
    __compar[4] = a3;
    return ($540B417C6688EA6D30870DDF6F7BDD26 *)bsearch_b(a3, carrierEntries, count, 0x10uLL, __compar);
  }
  return result;
}

uint64_t __41__SGOffsetDictionary_carrierEntryForKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(unsigned __int16 **)(a1 + 32);
  unsigned int v4 = bswap32(*v3) >> 16;
  unsigned int v5 = bswap32(*(unsigned __int16 *)(a3 + 10));
  if (v4 == HIWORD(v5)) {
    return *((unsigned __int8 *)v3 + 2) - *(unsigned __int8 *)(a3 + 12);
  }
  if (v4 < HIWORD(v5)) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

- (void)dealloc
{
  free(self->_carrierEntries);
  v3.receiver = self;
  v3.super_class = (Class)SGOffsetDictionary;
  [(SGOffsetDictionary *)&v3 dealloc];
}

- (SGOffsetDictionary)initWithFilehandle:(id)a3 sizeFactor:(unint64_t)a4 keyLength:(int)a5 singleByteOffset:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v37.receiver = self;
  v37.super_class = (Class)SGOffsetDictionary;
  $540B417C6688EA6D30870DDF6F7BDD26 v11 = [(SGOffsetDictionary *)&v37 init];
  if (v11)
  {
    SEL v36 = a2;
    [v10 seekToFileOffset:0];
    id v12 = v10;
    unsigned int v13 = bswap32(*(unsigned __int16 *)[v12 dataOfLength:2]) >> 16;
    v11->_size_t count = v13;
    v14 = ($540B417C6688EA6D30870DDF6F7BDD26 *)malloc_type_malloc(16 * v13, 0x10000408B6DE1C6uLL);
    if (!v14)
    {
      id v34 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v34);
    }
    v15 = v14;
    if (v11->_count)
    {
      uint64_t v16 = 0;
      unint64_t v17 = 0;
      do
      {
        id v18 = v12;
        uint64_t v19 = [v18 dataOfLength:3];
        char v20 = *(unsigned char *)(v19 + 2);
        *(_WORD *)v15[v16].var2 = *(_WORD *)v19;
        var2 = v15[v16].var2;
        v15[v16].var2[2] = v20;
        id v22 = v18;
        if (v6) {
          uint64_t v23 = *(unsigned __int8 *)[v22 dataOfLength:1];
        }
        else {
          uint64_t v23 = bswap32(*(unsigned __int16 *)[v22 dataOfLength:2]) >> 16;
        }
        v24 = &v15[v16];
        v24->var0 = v11->_totalPayloadSize;
        v24->var1 = v23;
        v11->_totalPayloadSize += v23 * a4;
        if (v16 * 16)
        {
          v25 = &v15[(v17 - 1)];
          unsigned int v27 = *(unsigned __int16 *)v25->var2;
          v26 = v25->var2;
          unsigned int v28 = bswap32(v27) >> 16;
          unsigned int v29 = bswap32(*(unsigned __int16 *)var2);
          if (v28 == HIWORD(v29))
          {
            int v30 = v26[2] - v15[v16].var2[2];
          }
          else if (v28 < HIWORD(v29))
          {
            int v30 = -1;
          }
          else
          {
            int v30 = 1;
          }
          if ((v30 & 0x80000000) == 0)
          {
            v35 = [MEMORY[0x1E4F28B00] currentHandler];
            v31 = objCStringForCarrierKey((uint64_t)v15[v16 - 1].var2);
            v32 = objCStringForCarrierKey((uint64_t)var2);
            [v35 handleFailureInMethod:v36, v11, @"SGFlightData.m", 96, @"Expected keys to be unique and in ascending order. That constraint was violated by this sequence of keys:\n%d: %@\n%d: %@", v17 - 1, v31, v17, v32 object file lineNumber description];
          }
        }
        ++v17;
        ++v16;
      }
      while (v17 < v11->_count);
    }
    v11->_carrierEntries = v15;
    v11->_payloadOffset = [v12 offsetInFile];
    v11->_sizeFactor = a4;
  }

  return v11;
}

@end