@interface GKARC4RandomSource
+ (BOOL)supportsSecureCoding;
- (BOOL)nextBool;
- (GKARC4RandomSource)init;
- (GKARC4RandomSource)initWithCoder:(id)a3;
- (GKARC4RandomSource)initWithSeed:(NSData *)seed;
- (NSData)seed;
- (float)nextUniform;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)nextInt;
- (unint64_t)nextBits:(int)a3;
- (unint64_t)nextIntWithUpperBound:(unint64_t)a3;
- (void)dealloc;
- (void)dropValuesWithCount:(NSUInteger)count;
- (void)encodeWithCoder:(id)a3;
- (void)setSeed:(NSData *)seed;
@end

@implementation GKARC4RandomSource

- (GKARC4RandomSource)init
{
  v3 = malloc_type_malloc(0x10uLL, 0x2472FFD7uLL);
  if (SecRandomCopyBytes(0, 0x10uLL, v3))
  {
    id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"failed to generate secure random bytes" userInfo:MEMORY[0x263EFFA78]];
    objc_exception_throw(v7);
  }
  v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v3 length:16 freeWhenDone:1];
  v5 = [(GKARC4RandomSource *)self initWithSeed:v4];

  return v5;
}

- (GKARC4RandomSource)initWithSeed:(NSData *)seed
{
  v4 = seed;
  v11.receiver = self;
  v11.super_class = (Class)GKARC4RandomSource;
  v5 = [(GKRandomSource *)&v11 init];
  if (v5)
  {
    v6 = (Arc4State *)malloc_type_malloc(0x10uLL, 0x1010040466105CCuLL);
    v5->_state = v6;
    if (v6)
    {
      id v7 = v6;
      *(void *)&v6->var0 = 0;
      v8 = (char *)malloc_type_malloc(0x100uLL, 0x716D9976uLL);
      uint64_t v9 = 0;
      v7->var2 = v8;
      do
      {
        v7->var2[v9] = v9;
        ++v9;
      }
      while (v9 != 256);
    }
    [(GKARC4RandomSource *)v5 setSeed:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[objc_alloc((Class)objc_opt_class()) initWithSeed:self->_seed];
  state = self->_state;
  v6 = (void *)*((void *)result + 1);
  void *v6 = *(void *)&state->var0;
  id v7 = (_OWORD *)v6[1];
  var2 = state->var2;
  long long v10 = *((_OWORD *)var2 + 8);
  long long v9 = *((_OWORD *)var2 + 9);
  long long v11 = *((_OWORD *)var2 + 11);
  v7[10] = *((_OWORD *)var2 + 10);
  v7[11] = v11;
  v7[8] = v10;
  v7[9] = v9;
  long long v13 = *((_OWORD *)var2 + 4);
  long long v12 = *((_OWORD *)var2 + 5);
  long long v14 = *((_OWORD *)var2 + 7);
  v7[6] = *((_OWORD *)var2 + 6);
  v7[7] = v14;
  v7[4] = v13;
  v7[5] = v12;
  long long v16 = *(_OWORD *)var2;
  long long v15 = *((_OWORD *)var2 + 1);
  long long v17 = *((_OWORD *)var2 + 3);
  v7[2] = *((_OWORD *)var2 + 2);
  v7[3] = v17;
  *id v7 = v16;
  v7[1] = v15;
  long long v18 = *((_OWORD *)var2 + 15);
  long long v20 = *((_OWORD *)var2 + 12);
  long long v19 = *((_OWORD *)var2 + 13);
  v7[14] = *((_OWORD *)var2 + 14);
  v7[15] = v18;
  v7[12] = v20;
  v7[13] = v19;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKARC4RandomSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(GKARC4RandomSource *)self init];
  if (v5)
  {
    v6 = (Arc4State *)malloc_type_malloc(0x10uLL, 0x1010040466105CCuLL);
    v5->_state = v6;
    if (v6)
    {
      id v7 = v6;
      *(void *)&v6->var0 = 0;
      v8 = (char *)malloc_type_malloc(0x100uLL, 0x716D9976uLL);
      uint64_t v9 = 0;
      v7->var2 = v8;
      do
      {
        v7->var2[v9] = v9;
        ++v9;
      }
      while (v9 != 256);
    }
    v5->_state->var0 = [v4 decodeIntForKey:@"i"];
    v5->_state->var1 = [v4 decodeIntForKey:@"j"];
    unint64_t v13 = 0;
    long long v10 = (const void *)[v4 decodeBytesForKey:@"bytes" returnedLength:&v13];
    if (v13 >= 0x100) {
      size_t v11 = 256;
    }
    else {
      size_t v11 = v13;
    }
    memcpy(v5->_state->var2, v10, v11);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKARC4RandomSource;
  id v4 = a3;
  [(GKRandomSource *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt:forKey:", self->_state->var0, @"i", v5.receiver, v5.super_class);
  [v4 encodeInt:self->_state->var1 forKey:@"j"];
  [v4 encodeBytes:self->_state->var2 length:256 forKey:@"bytes"];
}

- (void)dealloc
{
  state = self->_state;
  if (state->var2)
  {
    free(state->var2);
    state = self->_state;
  }
  free(state);
  v4.receiver = self;
  v4.super_class = (Class)GKARC4RandomSource;
  [(GKARC4RandomSource *)&v4 dealloc];
}

- (NSData)seed
{
  return self->_seed;
}

- (void)setSeed:(NSData *)seed
{
  unint64_t v13 = seed;
  objc_super v4 = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithData:v13];
  objc_super v5 = self->_seed;
  self->_seed = v4;

  state = self->_state;
  id v7 = [(NSData *)self->_seed bytes];
  NSUInteger v8 = [(NSData *)self->_seed length];
  unint64_t v9 = 0;
  int v10 = 0;
  var2 = state->var2;
  do
  {
    int v12 = var2[v9];
    v10 += v12 + v7[v9 % v8];
    var2[v9] = var2[v10];
    var2[v10] = v12;
    ++v9;
  }
  while (v9 != 255);
}

- (unint64_t)nextBits:(int)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a3 < 1) {
    return 0;
  }
  if (a3 >= 64) {
    int v3 = 64;
  }
  else {
    int v3 = a3;
  }
  state = self->_state;
  uint64_t v5 = (v3 + 7) >> 3;
  var2 = state->var2;
  unsigned int var0 = state->var0;
  uint64_t v8 = (state->var0 + 1);
  char v9 = var2[v8];
  unsigned __int8 v10 = v9 + LOBYTE(state->var1);
  var2[v8] = var2[v10];
  var2[v10] = v9;
  v21[0] = var2[(var2[v8] + v9)];
  if (v5 != 1)
  {
    uint64_t v8 = (var0 + 2);
    char v11 = var2[v8];
    v10 += v11;
    var2[v8] = var2[v10];
    var2[v10] = v11;
    v21[1] = var2[(var2[v8] + v11)];
    if (v5 != 2)
    {
      uint64_t v8 = (var0 + 3);
      char v12 = var2[v8];
      v10 += v12;
      var2[v8] = var2[v10];
      var2[v10] = v12;
      v21[2] = var2[(var2[v8] + v12)];
      if (v5 != 3)
      {
        uint64_t v8 = (var0 + 4);
        char v13 = var2[v8];
        v10 += v13;
        var2[v8] = var2[v10];
        var2[v10] = v13;
        v21[3] = var2[(var2[v8] + v13)];
        if (v5 != 4)
        {
          uint64_t v8 = (var0 + 5);
          char v14 = var2[v8];
          v10 += v14;
          var2[v8] = var2[v10];
          var2[v10] = v14;
          v21[4] = var2[(var2[v8] + v14)];
          if (v5 != 5)
          {
            uint64_t v8 = (var0 + 6);
            char v15 = var2[v8];
            v10 += v15;
            var2[v8] = var2[v10];
            var2[v10] = v15;
            v21[5] = var2[(var2[v8] + v15)];
            if (v5 != 6)
            {
              uint64_t v8 = (var0 + 7);
              char v16 = var2[v8];
              v10 += v16;
              var2[v8] = var2[v10];
              var2[v10] = v16;
              v21[6] = var2[(var2[v8] + v16)];
              if (v5 != 7)
              {
                uint64_t v8 = (var0 + 8);
                char v17 = var2[v8];
                v10 += v17;
                var2[v8] = var2[v10];
                var2[v10] = v17;
                v21[7] = var2[(var2[v8] + v17)];
              }
            }
          }
        }
      }
    }
  }
  uint64_t v18 = 0;
  unint64_t v19 = 0;
  state->unsigned int var0 = v8;
  state->var1 = v10;
  do
    unint64_t v19 = v21[v18++] | (v19 << 8);
  while (v5 != v18);
  return v19 >> (((v3 + 7) & 0xF8u) - v3);
}

- (int64_t)nextInt
{
  state = self->_state;
  var2 = state->var2;
  char var0 = state->var0;
  uint64_t v5 = (var0 + 1);
  char v6 = var2[v5];
  unsigned __int8 v7 = v6 + LOBYTE(state->var1);
  var2[v5] = var2[v7];
  var2[v7] = v6;
  uint64_t v8 = (var2[v5] + v6);
  uint64_t v9 = (var0 + 2);
  char v10 = var2[v9];
  unsigned __int8 v11 = v10 + v7;
  LODWORD(v8) = var2[v8];
  var2[v9] = var2[v11];
  var2[v11] = v10;
  uint64_t v12 = var2[(var2[v9] + v10)];
  uint64_t v13 = (var0 + 3);
  char v14 = var2[v13];
  unsigned __int8 v15 = v14 + v11;
  var2[v13] = var2[v15];
  var2[v15] = v14;
  uint64_t v16 = var2[(var2[v13] + v14)];
  uint64_t v17 = (var0 + 4);
  char v18 = var2[v17];
  unsigned __int8 v19 = v18 + v15;
  var2[v17] = var2[v19];
  var2[v19] = v18;
  uint64_t v20 = var2[(var2[v17] + v18)];
  state->char var0 = v17;
  state->var1 = v19;
  return (int)(v8 << 24) | (unint64_t)(v12 << 16) | (v16 << 8) | v20;
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  if (a3 < 2) {
    return 0;
  }
  if ((a3 & (a3 - 1)) != 0)
  {
    do
    {
      state = self->_state;
      var2 = state->var2;
      char var0 = state->var0;
      uint64_t v26 = (var0 + 1);
      char v27 = var2[v26];
      unsigned __int8 v28 = v27 + LOBYTE(state->var1);
      var2[v26] = var2[v28];
      var2[v28] = v27;
      uint64_t v29 = var2[(var2[v26] + v27)];
      uint64_t v30 = (var0 + 2);
      char v31 = var2[v30];
      unsigned __int8 v32 = v31 + v28;
      var2[v30] = var2[v32];
      var2[v32] = v31;
      uint64_t v33 = var2[(var2[v30] + v31)];
      uint64_t v34 = (var0 + 3);
      char v35 = var2[v34];
      unsigned __int8 v36 = v35 + v32;
      var2[v34] = var2[v36];
      var2[v36] = v35;
      uint64_t v37 = var2[(var2[v34] + v35)];
      uint64_t v38 = (var0 + 4);
      char v39 = var2[v38];
      unsigned __int8 v40 = v39 + v36;
      var2[v38] = var2[v40];
      var2[v40] = v39;
      uint64_t v41 = var2[(var2[v38] + v39)];
      state->char var0 = v38;
      state->var1 = v40;
      unint64_t v42 = (v29 << 24) | (v33 << 16) | (v37 << 8) | v41;
    }
    while (a3 - 1 + v42 < v42 % a3);
    return v42 % a3;
  }
  else
  {
    objc_super v4 = self->_state;
    uint64_t v5 = v4->var2;
    char v6 = v4->var0;
    uint64_t v7 = (v6 + 1);
    char v8 = v5[v7];
    unsigned __int8 v9 = v8 + LOBYTE(v4->var1);
    v5[v7] = v5[v9];
    v5[v9] = v8;
    uint64_t v10 = v5[(v5[v7] + v8)];
    uint64_t v11 = (v6 + 2);
    char v12 = v5[v11];
    unsigned __int8 v13 = v12 + v9;
    v5[v11] = v5[v13];
    v5[v13] = v12;
    uint64_t v14 = v5[(v5[v11] + v12)];
    uint64_t v15 = (v6 + 3);
    char v16 = v5[v15];
    unsigned __int8 v17 = v16 + v13;
    v5[v15] = v5[v17];
    v5[v17] = v16;
    uint64_t v18 = v5[(v5[v15] + v16)];
    uint64_t v19 = (v6 + 4);
    char v20 = v5[v19];
    unsigned __int8 v21 = v20 + v17;
    v5[v19] = v5[v21];
    v5[v21] = v20;
    uint64_t v22 = v5[(v5[v19] + v20)];
    v4->char var0 = v19;
    v4->var1 = v21;
    return (((v10 << 24) | (v14 << 16) | (v18 << 8) | v22) * a3) >> 32;
  }
}

- (float)nextUniform
{
  state = self->_state;
  var2 = state->var2;
  char var0 = state->var0;
  uint64_t v5 = (var0 + 1);
  char v6 = var2[v5];
  unsigned __int8 v7 = v6 + LOBYTE(state->var1);
  var2[v5] = var2[v7];
  var2[v7] = v6;
  LODWORD(v5) = var2[(var2[v5] + v6)];
  uint64_t v8 = (var0 + 2);
  char v9 = var2[v8];
  unsigned __int8 v10 = v9 + v7;
  var2[v8] = var2[v10];
  var2[v10] = v9;
  LODWORD(v8) = var2[(var2[v8] + v9)];
  uint64_t v11 = (var0 + 3);
  char v12 = var2[v11];
  unsigned __int8 v13 = v12 + v10;
  var2[v11] = var2[v13];
  var2[v13] = v12;
  LODWORD(var2) = var2[(var2[v11] + v12)];
  state->char var0 = v11;
  state->var1 = v13;
  return (float)((v5 << 16) | (v8 << 8) | var2) * 0.000000059605;
}

- (BOOL)nextBool
{
  state = self->_state;
  var2 = state->var2;
  uint64_t v4 = (state->var0 + 1);
  char v5 = var2[v4];
  unsigned __int8 v6 = v5 + LOBYTE(state->var1);
  var2[v4] = var2[v6];
  var2[v6] = v5;
  LOBYTE(var2) = var2[(var2[v4] + v5)];
  state->char var0 = v4;
  state->var1 = v6;
  return var2 & 1;
}

- (void)dropValuesWithCount:(NSUInteger)count
{
  state = self->_state;
  LODWORD(v5) = state->var0;
  unsigned int var1 = state->var1;
  if (count)
  {
    var2 = state->var2;
    do
    {
      uint64_t v5 = (v5 + 1);
      char v7 = var2[v5];
      LOBYTE(var1) = v7 + var1;
      var2[v5] = var2[var1];
      var2[var1] = v7;
      --count;
    }
    while (count);
    unsigned int var1 = var1;
  }
  state->char var0 = v5;
  state->unsigned int var1 = var1;
}

- (void).cxx_destruct
{
}

@end