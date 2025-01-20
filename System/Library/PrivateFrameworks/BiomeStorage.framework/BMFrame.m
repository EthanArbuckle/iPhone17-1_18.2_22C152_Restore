@interface BMFrame
- ($EB1A7079065BD7D3690F1B0E6AC9E6EB)frameHeader;
- (BMFrame)initWithHeader:(id *)a3 storePath:(id)a4 data:(id)a5 framePtr:(void *)a6 offset:(unint64_t)a7 nextOffset:(unint64_t)a8 timestamp:(double)a9 datastoreVersion:(unint64_t)a10 state:(unsigned int)a11;
- (NSData)data;
- (NSString)storePath;
- (double)creationTimestamp;
- (double)modifiedTimestamp;
- (unint64_t)datastoreVersion;
- (unint64_t)nextOffset;
- (unint64_t)offset;
- (unsigned)dataVersion;
- (unsigned)state;
- (void)framePtr;
@end

@implementation BMFrame

- (BMFrame)initWithHeader:(id *)a3 storePath:(id)a4 data:(id)a5 framePtr:(void *)a6 offset:(unint64_t)a7 nextOffset:(unint64_t)a8 timestamp:(double)a9 datastoreVersion:(unint64_t)a10 state:(unsigned int)a11
{
  id v19 = a4;
  id v20 = a5;
  v25.receiver = self;
  v25.super_class = (Class)BMFrame;
  v21 = [(BMFrame *)&v25 init];
  v22 = (BMFrame *)v21;
  if (v21)
  {
    *((void *)v21 + 2) = a6;
    long long v23 = *(_OWORD *)&a3->var0.var0.var0.var0;
    *(_OWORD *)(v21 + 88) = *((_OWORD *)&a3->var1 + 1);
    *(_OWORD *)(v21 + 72) = v23;
    objc_storeStrong((id *)v21 + 3, a4);
    objc_storeStrong((id *)&v22->_data, a5);
    v22->_offset = a7;
    v22->_nextOffset = a8;
    v22->_creationTimestamp = a9;
    v22->_datastoreVersion = a10;
    v22->_state = a11;
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storePath, 0);
}

- (double)creationTimestamp
{
  return self->_creationTimestamp;
}

- (unsigned)state
{
  return self->_state;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (unint64_t)nextOffset
{
  return self->_nextOffset;
}

- (NSData)data
{
  return self->_data;
}

- (unsigned)dataVersion
{
  if ([(BMFrame *)self datastoreVersion] == 9)
  {
    uint64_t v3 = 100;
    return *(_DWORD *)((char *)&self->super.isa + v3);
  }
  if ([(BMFrame *)self datastoreVersion] == 10)
  {
    uint64_t v3 = 76;
    return *(_DWORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (unint64_t)datastoreVersion
{
  return self->_datastoreVersion;
}

- (double)modifiedTimestamp
{
  unint64_t v3 = [(BMFrame *)self datastoreVersion];
  double result = 0.0;
  if (v3 == 9) {
    return self->_frameHeader.frameHeaderV1.otherInfo.modifiedTimestamp;
  }
  return result;
}

- (void)framePtr
{
  return self->_framePtr;
}

- ($EB1A7079065BD7D3690F1B0E6AC9E6EB)frameHeader
{
  long long v3 = *(_OWORD *)(&self[2].var1 + 3);
  *(_OWORD *)&retstr->var0.var0.var0.var0 = *(_OWORD *)(&self[2].var1 + 1);
  *((_OWORD *)&retstr->var1 + 1) = v3;
  return self;
}

- (NSString)storePath
{
  return self->_storePath;
}

@end