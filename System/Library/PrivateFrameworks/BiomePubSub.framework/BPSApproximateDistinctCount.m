@interface BPSApproximateDistinctCount
+ (BOOL)supportsSecureCoding;
- (BOOL)countMapFull;
- (BPSApproximateDistinctCount)init;
- (BPSApproximateDistinctCount)initWithCoder:(id)a3;
- (BPSApproximateDistinctCount)initWithHllState:(hll_state *)a3;
- (double)approximateDistinctCount;
- (void)addData:(id)a3;
- (void)addValue:(unsigned int)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)printState;
- (void)setApproximateDistinctCount:(double)a3;
- (void)setCountMapFull:(BOOL)a3;
@end

@implementation BPSApproximateDistinctCount

- (BPSApproximateDistinctCount)initWithHllState:(hll_state *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BPSApproximateDistinctCount;
  v4 = [(BPSApproximateDistinctCount *)&v8 init];
  if (v4)
  {
    v5 = (hll_state *)malloc_type_calloc(1uLL, 0x20uLL, 0x1000040E0EAB150uLL);
    v4->_hllState = v5;
    if (!v5) {
      abort();
    }
    if (a3)
    {
      long long v6 = *(_OWORD *)&a3->var0[16];
      *(_OWORD *)v5->var0 = *(_OWORD *)a3->var0;
      *(_OWORD *)&v5->var0[16] = v6;
    }
    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (BPSApproximateDistinctCount)init
{
  return [(BPSApproximateDistinctCount *)self initWithHllState:0];
}

- (void)dealloc
{
  free(self->_hllState);
  v3.receiver = self;
  v3.super_class = (Class)BPSApproximateDistinctCount;
  [(BPSApproximateDistinctCount *)&v3 dealloc];
}

- (void)addValue:(unsigned int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v5 = _PASMurmur3_x86_32();
  hllState = self->_hllState;
  unint64_t v7 = (unint64_t)v5 >> 27;
  unsigned int v8 = (__clz(v5 & 0x7FFFFFF) - 4);
  if (v8 <= hllState->var0[v7]) {
    LOBYTE(v8) = hllState->var0[v7];
  }
  hllState->var0[v7] = v8;
  os_unfair_lock_unlock(p_lock);
}

- (void)addData:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [v5 bytes];
  [v5 length];

  unsigned int v6 = _PASMurmur3_x86_32();
  hllState = self->_hllState;
  unint64_t v8 = (unint64_t)v6 >> 27;
  unsigned int v9 = (__clz(v6 & 0x7FFFFFF) - 4);
  if (v9 <= hllState->var0[v8]) {
    LOBYTE(v9) = hllState->var0[v8];
  }
  hllState->var0[v8] = v9;
  os_unfair_lock_unlock(p_lock);
}

- (double)approximateDistinctCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  hllState = self->_hllState;
  double v7 = 0.0;
  do
  {
    if (!hllState->var0[v4]) {
      ++v5;
    }
    double v7 = v7 + exp2(-(double)hllState->var0[v4++]);
  }
  while (v4 != 32);
  double v8 = 0.697 / v7 * 32.0 * 32.0;
  if (v8 <= 80.0 && v5 != 0) {
    double v8 = log(32.0 / (double)v5) * 32.0;
  }
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)countMapFull
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  hllState = self->_hllState;
  if (hllState->var0[0] == 31)
  {
    unint64_t v5 = 0;
    unsigned int v6 = &hllState->var0[1];
    do
    {
      unint64_t v7 = v5;
      if (v5 == 31) {
        break;
      }
      int v8 = v6[v5++];
    }
    while (v8 == 31);
    BOOL v9 = v7 > 0x1E;
  }
  else
  {
    BOOL v9 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)printState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = 0;
  hllState = self->_hllState;
  do
  {
    printf("%d:\t%u\n", v4, hllState->var0[v4]);
    ++v4;
  }
  while (v4 != 32);
  os_unfair_lock_unlock(p_lock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [v5 encodeInt:5 forKey:@"hllRegisterBitWidth"];
  [v5 encodeInt:32 forKey:@"hllRegisterCount"];
  [v5 encodeBytes:self->_hllState length:32 forKey:@"hllData"];

  os_unfair_lock_unlock(p_lock);
}

- (BPSApproximateDistinctCount)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeIntForKey:@"hllRegisterBitWidth"] != 5)
  {
    unint64_t v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BPSApproximateDistinctCount initWithCoder:]();
    }
    goto LABEL_9;
  }
  if ([v4 decodeIntForKey:@"hllRegisterCount"] != 32)
  {
    unint64_t v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BPSApproximateDistinctCount initWithCoder:]();
    }
LABEL_9:

LABEL_10:
    unsigned int v6 = 0;
    goto LABEL_11;
  }
  uint64_t v10 = 0;
  uint64_t v5 = [v4 decodeBytesForKey:@"hllData" returnedLength:&v10];
  if (v10 != 32)
  {
    BOOL v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BPSApproximateDistinctCount initWithCoder:](&v10, v9);
    }

    goto LABEL_10;
  }
  self = [(BPSApproximateDistinctCount *)self initWithHllState:v5];
  unsigned int v6 = self;
LABEL_11:

  return v6;
}

- (void)setApproximateDistinctCount:(double)a3
{
  self->_approximateDistinctCount = a3;
}

- (void)setCountMapFull:(BOOL)a3
{
  self->_countMapFull = a3;
}

- (void)initWithCoder:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134218240;
  uint64_t v4 = v2;
  __int16 v5 = 2048;
  uint64_t v6 = 32;
  _os_log_error_impl(&dword_1AD01F000, a2, OS_LOG_TYPE_ERROR, "Mismatch between encoded HyperLogLog data size %zu and current expected size %lu", (uint8_t *)&v3, 0x16u);
}

- (void)initWithCoder:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  int v2 = 32;
  _os_log_error_impl(&dword_1AD01F000, v0, OS_LOG_TYPE_ERROR, "Mismatch between encoded HyperLogLog register count %u and current count %u", v1, 0xEu);
}

- (void)initWithCoder:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  int v2 = 5;
  _os_log_error_impl(&dword_1AD01F000, v0, OS_LOG_TYPE_ERROR, "Mismatch between encoded HyperLogLog register width %u and current width %u", v1, 0xEu);
}

@end