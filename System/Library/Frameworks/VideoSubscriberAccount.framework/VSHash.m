@interface VSHash
- (BOOL)isFinalized;
- (CC_SHA256state_st)ctx;
- (NSData)finalData;
- (VSHash)init;
- (void)dealloc;
- (void)setCtx:(CC_SHA256state_st *)a3;
- (void)setFinalData:(id)a3;
- (void)setFinalized:(BOOL)a3;
- (void)updateWithData:(id)a3;
- (void)updateWithDate:(id)a3;
- (void)updateWithInteger:(int64_t)a3;
- (void)updateWithString:(id)a3;
- (void)updateWithUUID:(id)a3;
@end

@implementation VSHash

- (VSHash)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSHash;
  v2 = [(VSHash *)&v5 init];
  v3 = v2;
  if (v2) {
    CC_SHA256_Init(&v2->_ctx);
  }
  return v3;
}

- (void)dealloc
{
  if (!self->_finalized) {
    id v3 = [(VSHash *)self finalData];
  }
  v4.receiver = self;
  v4.super_class = (Class)VSHash;
  [(VSHash *)&v4 dealloc];
}

- (void)updateWithData:(id)a3
{
  id v4 = a3;
  if ([(VSHash *)self isFinalized]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot update a hash that has been finalized."];
  }
  id v5 = v4;
  v6 = (const void *)[v5 bytes];
  CC_LONG v7 = [v5 length];

  CC_SHA256_Update(&self->_ctx, v6, v7);
}

- (NSData)finalData
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (![(VSHash *)self isFinalized])
  {
    [(VSHash *)self setFinalized:1];
    CC_SHA256_Final(md, &self->_ctx);
    id v3 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:32];
    finalData = self->_finalData;
    self->_finalData = v3;
  }
  id v5 = self->_finalData;

  return v5;
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (void)setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (CC_SHA256state_st)ctx
{
  long long v3 = *(_OWORD *)&self->wbuf[8];
  long long v4 = *(_OWORD *)self[1].count;
  *(_OWORD *)&retstr->wbuf[6] = *(_OWORD *)&self->wbuf[12];
  *(_OWORD *)&retstr->wbuf[10] = v4;
  *(void *)&retstr->wbuf[14] = *(void *)&self[1].hash[2];
  long long v5 = *(_OWORD *)self->wbuf;
  *(_OWORD *)retstr->count = *(_OWORD *)&self->hash[4];
  *(_OWORD *)&retstr->hash[2] = v5;
  *(_OWORD *)&retstr->hash[6] = *(_OWORD *)&self->wbuf[4];
  *(_OWORD *)&retstr->wbuf[2] = v3;
  return self;
}

- (void)setCtx:(CC_SHA256state_st *)a3
{
  long long v3 = *(_OWORD *)a3->count;
  long long v4 = *(_OWORD *)&a3->hash[2];
  *(_OWORD *)&self->_ctx.hash[6] = *(_OWORD *)&a3->hash[6];
  *(_OWORD *)&self->_ctx.hash[2] = v4;
  *(_OWORD *)self->_ctx.count = v3;
  long long v5 = *(_OWORD *)&a3->wbuf[2];
  long long v6 = *(_OWORD *)&a3->wbuf[6];
  long long v7 = *(_OWORD *)&a3->wbuf[10];
  *(void *)&self->_ctx.wbuf[14] = *(void *)&a3->wbuf[14];
  *(_OWORD *)&self->_ctx.wbuf[10] = v7;
  *(_OWORD *)&self->_ctx.wbuf[6] = v6;
  *(_OWORD *)&self->_ctx.wbuf[2] = v5;
}

- (void)setFinalData:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)updateWithString:(id)a3
{
  long long v4 = (const char *)[a3 UTF8String];
  if (v4)
  {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v4 length:strlen(v4)];
    [(VSHash *)self updateWithData:v5];
  }
}

- (void)updateWithDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  objc_msgSend(NSString, "stringWithFormat:", @"%f", v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(VSHash *)self updateWithString:v5];
}

- (void)updateWithInteger:(int64_t)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(VSHash *)self updateWithString:v4];
}

- (void)updateWithUUID:(id)a3
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  v5[1] = 0;
  [a3 getUUIDBytes:v5];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v5 length:16];
  [(VSHash *)self updateWithData:v4];
}

@end