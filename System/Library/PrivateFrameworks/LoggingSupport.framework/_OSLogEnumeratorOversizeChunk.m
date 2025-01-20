@interface _OSLogEnumeratorOversizeChunk
- (BOOL)matches:(unsigned int)a3 procinfo:(catalog_procinfo_s *)a4;
- (_OSLogEnumeratorOversizeChunk)initWithSubchunk:(id)a3 chunk:(tracev3_chunk_s *)a4;
- (int64_t)compare:(id)a3;
- (unint64_t)timestamp;
- (void)fillMessage:(os_log_message_s *)a3;
- (void)fillProxy:(id)a3;
@end

@implementation _OSLogEnumeratorOversizeChunk

- (void).cxx_destruct
{
}

- (void)fillProxy:(id)a3
{
  chunk = self->_chunk;
  if (chunk->var0.var0 == 24578)
  {
    var6 = chunk->var1.var8.var6;
    uint64_t v6 = chunk->var1.var6.var6;
    v7 = &chunk->var1.var8.var6[v6];
    uint64_t var7 = chunk->var1.var6.var7;
  }
  else
  {
    var6 = &chunk->var1.var10[16];
    uint64_t v6 = chunk->var1.var2.var5[1];
    v7 = &chunk->var1.var10[v6 + 16];
    uint64_t var7 = chunk->var1.var2.var5[2];
  }
  [a3 _setBuffer:var6 size:v6 privateBuffer:v7 privateSize:var7];
}

- (void)fillMessage:(os_log_message_s *)a3
{
  chunk = self->_chunk;
  if (chunk->var0.var0 == 24578)
  {
    var6 = (char *)chunk->var1.var8.var6;
    unint64_t v5 = chunk->var1.var6.var6;
    uint64_t v6 = (char *)&chunk->var1.var8.var6[v5];
    uint64_t v7 = 46;
  }
  else
  {
    var6 = (char *)&chunk->var1.var10[16];
    unint64_t v5 = chunk->var1.var2.var5[1];
    uint64_t v6 = (char *)&chunk->var1.var10[v5 + 16];
    uint64_t v7 = 30;
  }
  unint64_t v8 = *(unsigned __int16 *)((char *)&chunk->var0.var0 + v7);
  a3->var11 = var6;
  a3->var12 = v5;
  a3->var13 = v6;
  a3->var14 = v8;
}

- (BOOL)matches:(unsigned int)a3 procinfo:(catalog_procinfo_s *)a4
{
  chunk = self->_chunk;
  unint64_t var0 = chunk->var1.var3.var0;
  unint64_t var3 = a4->var3;
  if (chunk->var0.var0 == 24578)
  {
    if (var0 == var3 && chunk->var1.var3.var1 == a4->var4)
    {
      p_unint64_t var3 = &chunk->var1.var0.var3;
      return *p_var3 == a3;
    }
  }
  else if (var0 == var3)
  {
    p_unint64_t var3 = &chunk->var1.var3.var1;
    return *p_var3 == a3;
  }
  return 0;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_OSLogEnumeratorOversizeChunk *)self timestamp];
  if (v5 == [v4 timestamp])
  {
    int64_t v6 = 0;
  }
  else
  {
    unint64_t v7 = [(_OSLogEnumeratorOversizeChunk *)self timestamp];
    if (v7 < [v4 timestamp]) {
      int64_t v6 = -1;
    }
    else {
      int64_t v6 = 1;
    }
  }

  return v6;
}

- (unint64_t)timestamp
{
  chunk = self->_chunk;
  if (chunk->var0.var0 == 24578) {
    return chunk->var1.var2.var6;
  }
  else {
    return -1;
  }
}

- (_OSLogEnumeratorOversizeChunk)initWithSubchunk:(id)a3 chunk:(tracev3_chunk_s *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_OSLogEnumeratorOversizeChunk;
  unint64_t v8 = [(_OSLogEnumeratorOversizeChunk *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_subchunk, a3);
    v9->_chunk = a4;
  }

  return v9;
}

@end