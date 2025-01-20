@interface ASDTIOA2OffsetStream
- (id)readInputBlock;
- (int64_t)sampleTimeOffset;
- (void)setSampleTimeOffset:(int64_t)a3;
@end

@implementation ASDTIOA2OffsetStream

- (id)readInputBlock
{
  v9.receiver = self;
  v9.super_class = (Class)ASDTIOA2OffsetStream;
  v3 = [(ASDTExclavesStream *)&v9 readInputBlock];
  uint64_t v4 = [(ASDTIOA2OffsetStream *)self sampleTimeOffset];
  v5 = ASDTIOA2LogType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(ASDTIOA2LegacyOffsetStream *)v5 readInputBlock];
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__ASDTIOA2OffsetStream_readInputBlock__block_invoke;
  v8[3] = &unk_265246418;
  *(double *)&v8[5] = (double)v4;
  v8[4] = v3;
  v6 = (void *)MEMORY[0x24C588C90](v8);

  return v6;
}

uint64_t __38__ASDTIOA2OffsetStream_readInputBlock__block_invoke(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  long long v8 = a3[11];
  long long v22 = a3[10];
  long long v23 = v8;
  long long v9 = a3[13];
  long long v24 = a3[12];
  long long v25 = v9;
  long long v10 = a3[7];
  long long v18 = a3[6];
  long long v19 = v10;
  long long v11 = a3[9];
  long long v20 = a3[8];
  long long v21 = v11;
  long long v12 = a3[3];
  v16[2] = a3[2];
  v16[3] = v12;
  long long v13 = a3[5];
  v16[4] = a3[4];
  long long v17 = v13;
  long long v14 = a3[1];
  v16[0] = *a3;
  v16[1] = v14;
  *(double *)&long long v17 = *(double *)&v17 - *(double *)(a1 + 40);
  return (*(uint64_t (**)(void, uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, v16, a4, a5, a6, a7, a8);
}

- (int64_t)sampleTimeOffset
{
  return self->_sampleTimeOffset;
}

- (void)setSampleTimeOffset:(int64_t)a3
{
  self->_sampleTimeOffset = a3;
}

@end