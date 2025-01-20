@interface AFBBufferBuilder
- (AFBBufferBuilder)init;
- (AFBBufferBuilder)initWithCapacity:(unint64_t)a3;
- (AFBBufferBuilder)initWithConfig:(const Config *)a3 path:(id)a4 protectionClass:(int)a5 capacity:(unint64_t)a6 error:(id *)a7;
- (AFBBufferBuilder)initWithFileAtPath:(id)a3 capacity:(unint64_t)a4 error:(id *)a5;
- (AFBBufferBuilder)initWithFileAtPath:(id)a3 protection:(id)a4 capacity:(unint64_t)a5 error:(id *)a6;
- (BOOL)finalizeWithSelector:(SEL)a3 allocatorBufferAddr:(void *)a4 size:(unint64_t)a5 error:(id *)a6;
- (NSError)firstError;
- (NSString)path;
- (id)createString:(id)a3;
- (id)createString:(id)a3 alignment:(unint64_t)a4;
- (id)createStringWithCString:(const char *)a3;
- (id)createStringWithCString:(const char *)a3 alignment:(unint64_t)a4;
- (id)createStringWithData:(id)a3;
- (id)createStringWithData:(id)a3 alignment:(unint64_t)a4;
- (id)createVectorOfBoolWithArray:(id)a3;
- (id)createVectorOfBoolWithArray:(id)a3 alignment:(unint64_t)a4;
- (id)createVectorOfBoolWithCArray:(const BOOL *)a3 count:(unint64_t)a4;
- (id)createVectorOfBoolWithCArray:(const BOOL *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5;
- (id)createVectorOfBoolWithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5;
- (id)createVectorOfBoolWithCount:(unint64_t)a3 block:(id)a4;
- (id)createVectorOfFloat32WithArray:(id)a3;
- (id)createVectorOfFloat32WithArray:(id)a3 alignment:(unint64_t)a4;
- (id)createVectorOfFloat32WithCArray:(const float *)a3 count:(unint64_t)a4;
- (id)createVectorOfFloat32WithCArray:(const float *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5;
- (id)createVectorOfFloat32WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5;
- (id)createVectorOfFloat32WithCount:(unint64_t)a3 block:(id)a4;
- (id)createVectorOfFloat64WithArray:(id)a3;
- (id)createVectorOfFloat64WithArray:(id)a3 alignment:(unint64_t)a4;
- (id)createVectorOfFloat64WithCArray:(const double *)a3 count:(unint64_t)a4;
- (id)createVectorOfFloat64WithCArray:(const double *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5;
- (id)createVectorOfFloat64WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5;
- (id)createVectorOfFloat64WithCount:(unint64_t)a3 block:(id)a4;
- (id)createVectorOfInt16WithArray:(id)a3;
- (id)createVectorOfInt16WithArray:(id)a3 alignment:(unint64_t)a4;
- (id)createVectorOfInt16WithCArray:(const signed __int16 *)a3 count:(unint64_t)a4;
- (id)createVectorOfInt16WithCArray:(const signed __int16 *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5;
- (id)createVectorOfInt16WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5;
- (id)createVectorOfInt16WithCount:(unint64_t)a3 block:(id)a4;
- (id)createVectorOfInt32WithArray:(id)a3;
- (id)createVectorOfInt32WithArray:(id)a3 alignment:(unint64_t)a4;
- (id)createVectorOfInt32WithCArray:(const int *)a3 count:(unint64_t)a4;
- (id)createVectorOfInt32WithCArray:(const int *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5;
- (id)createVectorOfInt32WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5;
- (id)createVectorOfInt32WithCount:(unint64_t)a3 block:(id)a4;
- (id)createVectorOfInt64WithArray:(id)a3;
- (id)createVectorOfInt64WithArray:(id)a3 alignment:(unint64_t)a4;
- (id)createVectorOfInt64WithCArray:(const int64_t *)a3 count:(unint64_t)a4;
- (id)createVectorOfInt64WithCArray:(const int64_t *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5;
- (id)createVectorOfInt64WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5;
- (id)createVectorOfInt64WithCount:(unint64_t)a3 block:(id)a4;
- (id)createVectorOfInt8WithArray:(id)a3;
- (id)createVectorOfInt8WithArray:(id)a3 alignment:(unint64_t)a4;
- (id)createVectorOfInt8WithCArray:(const char *)a3 count:(unint64_t)a4;
- (id)createVectorOfInt8WithCArray:(const char *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5;
- (id)createVectorOfInt8WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5;
- (id)createVectorOfInt8WithCount:(unint64_t)a3 block:(id)a4;
- (id)createVectorOfStringWithArray:(id)a3;
- (id)createVectorOfStringWithArray:(id)a3 alignment:(unint64_t)a4;
- (id)createVectorOfStringWithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5;
- (id)createVectorOfStringWithCount:(unint64_t)a3 block:(id)a4;
- (id)createVectorOfStringWithOffsets:(id)a3;
- (id)createVectorOfUInt16WithArray:(id)a3;
- (id)createVectorOfUInt16WithArray:(id)a3 alignment:(unint64_t)a4;
- (id)createVectorOfUInt16WithCArray:(const unsigned __int16 *)a3 count:(unint64_t)a4;
- (id)createVectorOfUInt16WithCArray:(const unsigned __int16 *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5;
- (id)createVectorOfUInt16WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5;
- (id)createVectorOfUInt16WithCount:(unint64_t)a3 block:(id)a4;
- (id)createVectorOfUInt32WithArray:(id)a3;
- (id)createVectorOfUInt32WithArray:(id)a3 alignment:(unint64_t)a4;
- (id)createVectorOfUInt32WithCArray:(const unsigned int *)a3 count:(unint64_t)a4;
- (id)createVectorOfUInt32WithCArray:(const unsigned int *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5;
- (id)createVectorOfUInt32WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5;
- (id)createVectorOfUInt32WithCount:(unint64_t)a3 block:(id)a4;
- (id)createVectorOfUInt64WithArray:(id)a3;
- (id)createVectorOfUInt64WithArray:(id)a3 alignment:(unint64_t)a4;
- (id)createVectorOfUInt64WithCArray:(const unint64_t *)a3 count:(unint64_t)a4;
- (id)createVectorOfUInt64WithCArray:(const unint64_t *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5;
- (id)createVectorOfUInt64WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5;
- (id)createVectorOfUInt64WithCount:(unint64_t)a3 block:(id)a4;
- (id)createVectorOfUInt8WithArray:(id)a3;
- (id)createVectorOfUInt8WithArray:(id)a3 alignment:(unint64_t)a4;
- (id)createVectorOfUInt8WithCArray:(const char *)a3 count:(unint64_t)a4;
- (id)createVectorOfUInt8WithCArray:(const char *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5;
- (id)createVectorOfUInt8WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5;
- (id)createVectorOfUInt8WithCount:(unint64_t)a3 block:(id)a4;
- (id)createVectorOfUInt8WithData:(id)a3;
- (id)createVectorOfUInt8WithData:(id)a3 alignment:(unint64_t)a4;
- (uint64_t)_fbb;
- (void)dealloc;
- (void)fbb;
- (void)finalizeWithSelector:(SEL)a3;
- (void)setError:(id)a3;
- (void)throwIfFinalizedWithSelector:(SEL)a3;
@end

@implementation AFBBufferBuilder

- (void)setError:(id)a3
{
  id v5 = a3;
  firstError = self->_firstError;
  p_firstError = &self->_firstError;
  if (!firstError)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_firstError, a3);
    id v5 = v8;
  }
}

- (AFBBufferBuilder)initWithConfig:(const Config *)a3 path:(id)a4 protectionClass:(int)a5 capacity:(unint64_t)a6 error:(id *)a7
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFBBufferBuilder;
  v11 = [(AFBBufferBuilder *)&v14 init];
  if (v11)
  {
    if (v10) {
      operator new();
    }
    *((void *)v11 + 1) = *((void *)v11 + 13);
    v11[16] = 0;
    *((void *)v11 + 3) = a6;
    *((void *)v11 + 4) = 8;
    *(_OWORD *)(v11 + 40) = 0u;
    *(_OWORD *)(v11 + 56) = 0u;
    *((void *)v11 + 9) = 0;
    *((void *)v11 + 10) = 1;
    *((_WORD *)v11 + 44) = 256;
    *((void *)v11 + 12) = 0;
    objc_storeStrong((id *)v11 + 15, a4);
    v11[112] = 1;
  }
  v12 = v11;

  return v12;
}

- (AFBBufferBuilder)init
{
  int v3 = 0;
  uint64_t v4 = 0x4000;
  uint64_t v5 = 0;
  return [(AFBBufferBuilder *)self initWithConfig:&v3 path:0 protectionClass:0xFFFFFFFFLL capacity:1024 error:0];
}

- (AFBBufferBuilder)initWithCapacity:(unint64_t)a3
{
  int v4 = 0;
  uint64_t v5 = 0x4000;
  uint64_t v6 = 0;
  return [(AFBBufferBuilder *)self initWithConfig:&v4 path:0 protectionClass:0xFFFFFFFFLL capacity:1024 error:0];
}

- (AFBBufferBuilder)initWithFileAtPath:(id)a3 protection:(id)a4 capacity:(unint64_t)a5 error:(id *)a6
{
  v23[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  if ([v11 isEqualToString:*MEMORY[0x263F08080]])
  {
    uint64_t v12 = 1;
LABEL_9:
    int v19 = 0;
    uint64_t v20 = 0x4000;
    uint64_t v21 = 0;
    self = [(AFBBufferBuilder *)self initWithConfig:&v19 path:v10 protectionClass:v12 capacity:a5 error:a6];
    v13 = self;
    goto LABEL_10;
  }
  if ([v11 isEqualToString:*MEMORY[0x263F08088]])
  {
    uint64_t v12 = 2;
    goto LABEL_9;
  }
  if ([v11 isEqualToString:*MEMORY[0x263F08098]])
  {
    uint64_t v12 = 3;
    goto LABEL_9;
  }
  if ([v11 isEqualToString:*MEMORY[0x263F080B0]])
  {
    uint64_t v12 = 4;
    goto LABEL_9;
  }
  uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"Unrecognized file protection: %@", v11];
  uint64_t v22 = *MEMORY[0x263F08320];
  v23[0] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
  v17 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"AFBErrorDomain" code:1 userInfo:v16];
  v18 = v17;
  if (a6) {
    *a6 = v17;
  }

  v13 = 0;
LABEL_10:

  return v13;
}

- (AFBBufferBuilder)initWithFileAtPath:(id)a3 capacity:(unint64_t)a4 error:(id *)a5
{
  int v6 = 0;
  uint64_t v7 = 0x4000;
  uint64_t v8 = 0;
  return [(AFBBufferBuilder *)self initWithConfig:&v6 path:a3 protectionClass:0xFFFFFFFFLL capacity:a4 error:a5];
}

- (void)dealloc
{
  if (self->_initOk) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&self->_fbbStorage);
  }
  fileAllocator = self->_fileAllocator;
  if (fileAllocator) {
    (*(void (**)(void *, SEL))(*(void *)fileAllocator + 8))(fileAllocator, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)AFBBufferBuilder;
  [(AFBBufferBuilder *)&v4 dealloc];
}

- (uint64_t)_fbb
{
  if (a1) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

- (void)throwIfFinalizedWithSelector:(SEL)a3
{
  if (self->_isFinalized)
  {
    id v4 = [NSString alloc];
    uint64_t v5 = NSStringFromSelector(a3);
    uint64_t v6 = [v4 initWithFormat:@"%@: AFBBufferBuilder misuse: instance already finalized", v5];

    id v7 = [MEMORY[0x263EFF940] exceptionWithName:@"AFBMisuseException" reason:v6 userInfo:0];
    objc_exception_throw(v7);
  }
}

- (void)finalizeWithSelector:(SEL)a3
{
  self->_isFinalized = 1;
}

- (BOOL)finalizeWithSelector:(SEL)a3 allocatorBufferAddr:(void *)a4 size:(unint64_t)a5 error:(id *)a6
{
  v23[1] = *MEMORY[0x263EF8340];
  id v11 = [(AFBBufferBuilder *)self firstError];

  if (v11)
  {
    if (a6)
    {
      [(AFBBufferBuilder *)self firstError];
      char v12 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    [(AFBBufferBuilder *)self finalizeWithSelector:a3];
    fileAllocator = (apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *)self->_fileAllocator;
    if (fileAllocator)
    {
      int __errnum = 0;
      char v12 = apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::truncate_to_region(fileAllocator, (unsigned __int8 *)a4, a5, &__errnum);
      if ((v12 & 1) == 0)
      {
        id v14 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v15 = __errnum;
        uint64_t v22 = *MEMORY[0x263F08320];
        id v16 = [NSString alloc];
        v17 = objc_msgSend(v16, "initWithFormat:", @"%s (errno %d)", strerror(__errnum), __errnum);
        v23[0] = v17;
        v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
        int v19 = (void *)[v14 initWithDomain:*MEMORY[0x263F08438] code:v15 userInfo:v18];

        if (a6) {
          *a6 = v19;
        }
      }
    }
    else
    {
      return 1;
    }
  }
  return v12;
}

- (void)fbb
{
  if (self) {
    return &self->_fbbStorage;
  }
  else {
    return 0;
  }
}

- (id)createVectorOfBoolWithArray:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v14 = [NSString alloc];
    uint64_t v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v6 = [(AFBBufferBuilder *)self firstError];

  if (v6)
  {
    id v7 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, [v5 count], 1uLL);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = [v5 reverseObjectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<BOOL>((uint64_t)p_fbbStorage, [*(id *)(*((void *)&v18 + 1) + 8 * i) BOOLValue]);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfBoolWithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v14 = [NSString alloc];
    uint64_t v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    v9 = &unk_26E020030;
  }
  else
  {
    uint64_t v10 = [v7 count];
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    if (a4 <= 1) {
      unint64_t v12 = 1;
    }
    else {
      unint64_t v12 = a4;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 1, v12);
    v9 = [(AFBBufferBuilder *)self createVectorOfBoolWithArray:v7];
  }

  return v9;
}

- (id)createVectorOfBoolWithCArray:(const BOOL *)a3 count:(unint64_t)a4
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 1uLL);
    uint64_t v11 = a3 - 1;
    for (unint64_t i = a4; i; unint64_t i = v13)
    {
      unint64_t v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<BOOL>((uint64_t)p_fbbStorage, v11[i]);
    }
    v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfBoolWithCArray:(const BOOL *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  v9 = [(AFBBufferBuilder *)self firstError];

  if (v9)
  {
    uint64_t v10 = &unk_26E020030;
  }
  else
  {
    if (a5 <= 1) {
      unint64_t v11 = 1;
    }
    else {
      unint64_t v11 = a5;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 1, v11);
    uint64_t v10 = [(AFBBufferBuilder *)self createVectorOfBoolWithCArray:a3 count:a4];
  }
  return v10;
}

- (id)createVectorOfBoolWithCount:(unint64_t)a3 block:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, unint64_t, char *))a4;
  if (!v7)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 1uLL);
    if (a3)
    {
      unint64_t v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        unint64_t v13 = (void *)MEMORY[0x230F71520](started);
        v7[2](v7, v12, v19);
        unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<BOOL>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfBoolWithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v10 = [(AFBBufferBuilder *)self firstError];

  if (v10)
  {
    unint64_t v11 = &unk_26E020030;
  }
  else
  {
    if (a4 <= 1) {
      unint64_t v12 = 1;
    }
    else {
      unint64_t v12 = a4;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 1, v12);
    unint64_t v11 = [(AFBBufferBuilder *)self createVectorOfBoolWithCount:a3 block:v9];
  }

  return v11;
}

- (id)createVectorOfInt8WithArray:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v6 = [(AFBBufferBuilder *)self firstError];

  if (v6)
  {
    id v7 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, [v5 count], 1uLL);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = [v5 reverseObjectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<signed char>((uint64_t)p_fbbStorage, [*(id *)(*((void *)&v18 + 1) + 8 * i) intValue]);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfInt8WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    uint64_t v10 = [v7 count];
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    if (a4 <= 1) {
      unint64_t v12 = 1;
    }
    else {
      unint64_t v12 = a4;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 1, v12);
    id v9 = [(AFBBufferBuilder *)self createVectorOfInt8WithArray:v7];
  }

  return v9;
}

- (id)createVectorOfInt8WithCArray:(const char *)a3 count:(unint64_t)a4
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 1uLL);
    uint64_t v11 = a3 - 1;
    for (unint64_t i = a4; i; unint64_t i = v13)
    {
      unint64_t v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<signed char>((uint64_t)p_fbbStorage, v11[i]);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfInt8WithCArray:(const char *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  id v9 = [(AFBBufferBuilder *)self firstError];

  if (v9)
  {
    uint64_t v10 = &unk_26E020030;
  }
  else
  {
    if (a5 <= 1) {
      unint64_t v11 = 1;
    }
    else {
      unint64_t v11 = a5;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 1, v11);
    uint64_t v10 = [(AFBBufferBuilder *)self createVectorOfInt8WithCArray:a3 count:a4];
  }
  return v10;
}

- (id)createVectorOfInt8WithCount:(unint64_t)a3 block:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, unint64_t, char *))a4;
  if (!v7)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 1uLL);
    if (a3)
    {
      unint64_t v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        unint64_t v13 = (void *)MEMORY[0x230F71520](started);
        v7[2](v7, v12, v19);
        unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<signed char>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfInt8WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v10 = [(AFBBufferBuilder *)self firstError];

  if (v10)
  {
    unint64_t v11 = &unk_26E020030;
  }
  else
  {
    if (a4 <= 1) {
      unint64_t v12 = 1;
    }
    else {
      unint64_t v12 = a4;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 1, v12);
    unint64_t v11 = [(AFBBufferBuilder *)self createVectorOfInt8WithCount:a3 block:v9];
  }

  return v11;
}

- (id)createVectorOfUInt8WithArray:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v6 = [(AFBBufferBuilder *)self firstError];

  if (v6)
  {
    id v7 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, [v5 count], 1uLL);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = [v5 reverseObjectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<signed char>((uint64_t)p_fbbStorage, [*(id *)(*((void *)&v18 + 1) + 8 * i) intValue]);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfUInt8WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    uint64_t v10 = [v7 count];
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    if (a4 <= 1) {
      unint64_t v12 = 1;
    }
    else {
      unint64_t v12 = a4;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 1, v12);
    id v9 = [(AFBBufferBuilder *)self createVectorOfUInt8WithArray:v7];
  }

  return v9;
}

- (id)createVectorOfUInt8WithCArray:(const char *)a3 count:(unint64_t)a4
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 1uLL);
    uint64_t v11 = a3 - 1;
    for (unint64_t i = a4; i; unint64_t i = v13)
    {
      unint64_t v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<signed char>((uint64_t)p_fbbStorage, v11[i]);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfUInt8WithCArray:(const char *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  id v9 = [(AFBBufferBuilder *)self firstError];

  if (v9)
  {
    uint64_t v10 = &unk_26E020030;
  }
  else
  {
    if (a5 <= 1) {
      unint64_t v11 = 1;
    }
    else {
      unint64_t v11 = a5;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 1, v11);
    uint64_t v10 = [(AFBBufferBuilder *)self createVectorOfUInt8WithCArray:a3 count:a4];
  }
  return v10;
}

- (id)createVectorOfUInt8WithCount:(unint64_t)a3 block:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, unint64_t, char *))a4;
  if (!v7)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 1uLL);
    if (a3)
    {
      unint64_t v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        unint64_t v13 = (void *)MEMORY[0x230F71520](started);
        v7[2](v7, v12, v19);
        unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<signed char>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfUInt8WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v10 = [(AFBBufferBuilder *)self firstError];

  if (v10)
  {
    unint64_t v11 = &unk_26E020030;
  }
  else
  {
    if (a4 <= 1) {
      unint64_t v12 = 1;
    }
    else {
      unint64_t v12 = a4;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 1, v12);
    unint64_t v11 = [(AFBBufferBuilder *)self createVectorOfUInt8WithCount:a3 block:v9];
  }

  return v11;
}

- (id)createVectorOfUInt8WithData:(id)a3
{
  id v5 = a3;
  uint64_t v6 = MEMORY[0x230F71520]();
  if (!v5)
  {
    id v12 = [NSString alloc];
    unint64_t v13 = NSStringFromSelector(a2);
    uint64_t v14 = [v12 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v13, @"data"];

    id v15 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v14 userInfo:0];
    objc_exception_throw(v15);
  }
  id v7 = (void *)v6;
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    id v10 = v5;
    id v9 = -[AFBBufferBuilder createVectorOfUInt8WithCArray:count:](self, "createVectorOfUInt8WithCArray:count:", [v10 bytes], objc_msgSend(v10, "length"));
  }

  return v9;
}

- (id)createVectorOfUInt8WithData:(id)a3 alignment:(unint64_t)a4
{
  id v7 = a3;
  uint64_t v8 = MEMORY[0x230F71520]();
  if (!v7)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"data"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  id v9 = (void *)v8;
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  id v10 = [(AFBBufferBuilder *)self firstError];

  if (v10)
  {
    unint64_t v11 = &unk_26E020030;
  }
  else
  {
    id v12 = v7;
    unint64_t v11 = -[AFBBufferBuilder createVectorOfUInt8WithCArray:count:alignment:](self, "createVectorOfUInt8WithCArray:count:alignment:", [v12 bytes], objc_msgSend(v12, "length"), a4);
  }

  return v11;
}

- (id)createVectorOfInt16WithArray:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v6 = [(AFBBufferBuilder *)self firstError];

  if (v6)
  {
    id v7 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, [v5 count], 2uLL);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = [v5 reverseObjectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<short>((uint64_t)p_fbbStorage, [*(id *)(*((void *)&v18 + 1) + 8 * i) intValue]);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfInt16WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    uint64_t v10 = [v7 count];
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    if (a4 <= 2) {
      unint64_t v12 = 2;
    }
    else {
      unint64_t v12 = a4;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 2, v12);
    id v9 = [(AFBBufferBuilder *)self createVectorOfInt16WithArray:v7];
  }

  return v9;
}

- (id)createVectorOfInt16WithCArray:(const signed __int16 *)a3 count:(unint64_t)a4
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 2uLL);
    uint64_t v11 = a3 - 1;
    for (unint64_t i = a4; i; unint64_t i = v13)
    {
      unint64_t v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<short>((uint64_t)p_fbbStorage, v11[i]);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfInt16WithCArray:(const signed __int16 *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  id v9 = [(AFBBufferBuilder *)self firstError];

  if (v9)
  {
    uint64_t v10 = &unk_26E020030;
  }
  else
  {
    if (a5 <= 2) {
      unint64_t v11 = 2;
    }
    else {
      unint64_t v11 = a5;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 2, v11);
    uint64_t v10 = [(AFBBufferBuilder *)self createVectorOfInt16WithCArray:a3 count:a4];
  }
  return v10;
}

- (id)createVectorOfInt16WithCount:(unint64_t)a3 block:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, unint64_t, __int16 *))a4;
  if (!v7)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 2uLL);
    if (a3)
    {
      unint64_t v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        unint64_t v13 = (void *)MEMORY[0x230F71520](started);
        v7[2](v7, v12, v19);
        unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<short>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfInt16WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v10 = [(AFBBufferBuilder *)self firstError];

  if (v10)
  {
    unint64_t v11 = &unk_26E020030;
  }
  else
  {
    if (a4 <= 2) {
      unint64_t v12 = 2;
    }
    else {
      unint64_t v12 = a4;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 2, v12);
    unint64_t v11 = [(AFBBufferBuilder *)self createVectorOfInt16WithCount:a3 block:v9];
  }

  return v11;
}

- (id)createVectorOfUInt16WithArray:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v6 = [(AFBBufferBuilder *)self firstError];

  if (v6)
  {
    id v7 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, [v5 count], 2uLL);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = [v5 reverseObjectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<short>((uint64_t)p_fbbStorage, [*(id *)(*((void *)&v18 + 1) + 8 * i) intValue]);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfUInt16WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    uint64_t v10 = [v7 count];
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    if (a4 <= 2) {
      unint64_t v12 = 2;
    }
    else {
      unint64_t v12 = a4;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 2, v12);
    id v9 = [(AFBBufferBuilder *)self createVectorOfUInt16WithArray:v7];
  }

  return v9;
}

- (id)createVectorOfUInt16WithCArray:(const unsigned __int16 *)a3 count:(unint64_t)a4
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 2uLL);
    uint64_t v11 = a3 - 1;
    for (unint64_t i = a4; i; unint64_t i = v13)
    {
      unint64_t v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<short>((uint64_t)p_fbbStorage, v11[i]);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfUInt16WithCArray:(const unsigned __int16 *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  id v9 = [(AFBBufferBuilder *)self firstError];

  if (v9)
  {
    uint64_t v10 = &unk_26E020030;
  }
  else
  {
    if (a5 <= 2) {
      unint64_t v11 = 2;
    }
    else {
      unint64_t v11 = a5;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 2, v11);
    uint64_t v10 = [(AFBBufferBuilder *)self createVectorOfUInt16WithCArray:a3 count:a4];
  }
  return v10;
}

- (id)createVectorOfUInt16WithCount:(unint64_t)a3 block:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, unint64_t, __int16 *))a4;
  if (!v7)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 2uLL);
    if (a3)
    {
      unint64_t v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        unint64_t v13 = (void *)MEMORY[0x230F71520](started);
        v7[2](v7, v12, v19);
        unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<short>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfUInt16WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v10 = [(AFBBufferBuilder *)self firstError];

  if (v10)
  {
    unint64_t v11 = &unk_26E020030;
  }
  else
  {
    if (a4 <= 2) {
      unint64_t v12 = 2;
    }
    else {
      unint64_t v12 = a4;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 2, v12);
    unint64_t v11 = [(AFBBufferBuilder *)self createVectorOfUInt16WithCount:a3 block:v9];
  }

  return v11;
}

- (id)createVectorOfInt32WithArray:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v6 = [(AFBBufferBuilder *)self firstError];

  if (v6)
  {
    id v7 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, [v5 count], 4uLL);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = [v5 reverseObjectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)p_fbbStorage, [*(id *)(*((void *)&v18 + 1) + 8 * i) intValue]);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfInt32WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    uint64_t v10 = [v7 count];
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    if (a4 <= 4) {
      unint64_t v12 = 4;
    }
    else {
      unint64_t v12 = a4;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 4, v12);
    id v9 = [(AFBBufferBuilder *)self createVectorOfInt32WithArray:v7];
  }

  return v9;
}

- (id)createVectorOfInt32WithCArray:(const int *)a3 count:(unint64_t)a4
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 4uLL);
    uint64_t v11 = a3 - 1;
    for (unint64_t i = a4; i; unint64_t i = v13)
    {
      unint64_t v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)p_fbbStorage, v11[i]);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfInt32WithCArray:(const int *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  id v9 = [(AFBBufferBuilder *)self firstError];

  if (v9)
  {
    uint64_t v10 = &unk_26E020030;
  }
  else
  {
    if (a5 <= 4) {
      unint64_t v11 = 4;
    }
    else {
      unint64_t v11 = a5;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 4, v11);
    uint64_t v10 = [(AFBBufferBuilder *)self createVectorOfInt32WithCArray:a3 count:a4];
  }
  return v10;
}

- (id)createVectorOfInt32WithCount:(unint64_t)a3 block:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, unint64_t, int *))a4;
  if (!v7)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 4uLL);
    if (a3)
    {
      unint64_t v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        unint64_t v13 = (void *)MEMORY[0x230F71520](started);
        v7[2](v7, v12, v19);
        unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfInt32WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v10 = [(AFBBufferBuilder *)self firstError];

  if (v10)
  {
    unint64_t v11 = &unk_26E020030;
  }
  else
  {
    if (a4 <= 4) {
      unint64_t v12 = 4;
    }
    else {
      unint64_t v12 = a4;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 4, v12);
    unint64_t v11 = [(AFBBufferBuilder *)self createVectorOfInt32WithCount:a3 block:v9];
  }

  return v11;
}

- (id)createVectorOfUInt32WithArray:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v6 = [(AFBBufferBuilder *)self firstError];

  if (v6)
  {
    id v7 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, [v5 count], 4uLL);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = [v5 reverseObjectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)p_fbbStorage, [*(id *)(*((void *)&v18 + 1) + 8 * i) unsignedIntValue]);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfUInt32WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    uint64_t v10 = [v7 count];
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    if (a4 <= 4) {
      unint64_t v12 = 4;
    }
    else {
      unint64_t v12 = a4;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 4, v12);
    id v9 = [(AFBBufferBuilder *)self createVectorOfUInt32WithArray:v7];
  }

  return v9;
}

- (id)createVectorOfUInt32WithCArray:(const unsigned int *)a3 count:(unint64_t)a4
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 4uLL);
    uint64_t v11 = a3 - 1;
    for (unint64_t i = a4; i; unint64_t i = v13)
    {
      unint64_t v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)p_fbbStorage, v11[i]);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfUInt32WithCArray:(const unsigned int *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  id v9 = [(AFBBufferBuilder *)self firstError];

  if (v9)
  {
    uint64_t v10 = &unk_26E020030;
  }
  else
  {
    if (a5 <= 4) {
      unint64_t v11 = 4;
    }
    else {
      unint64_t v11 = a5;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 4, v11);
    uint64_t v10 = [(AFBBufferBuilder *)self createVectorOfUInt32WithCArray:a3 count:a4];
  }
  return v10;
}

- (id)createVectorOfUInt32WithCount:(unint64_t)a3 block:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, unint64_t, int *))a4;
  if (!v7)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 4uLL);
    if (a3)
    {
      unint64_t v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        unint64_t v13 = (void *)MEMORY[0x230F71520](started);
        v7[2](v7, v12, v19);
        unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfUInt32WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v10 = [(AFBBufferBuilder *)self firstError];

  if (v10)
  {
    unint64_t v11 = &unk_26E020030;
  }
  else
  {
    if (a4 <= 4) {
      unint64_t v12 = 4;
    }
    else {
      unint64_t v12 = a4;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 4, v12);
    unint64_t v11 = [(AFBBufferBuilder *)self createVectorOfUInt32WithCount:a3 block:v9];
  }

  return v11;
}

- (id)createVectorOfInt64WithArray:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v6 = [(AFBBufferBuilder *)self firstError];

  if (v6)
  {
    id v7 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, [v5 count], 8uLL);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = [v5 reverseObjectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<long long>((uint64_t)p_fbbStorage, [*(id *)(*((void *)&v18 + 1) + 8 * i) longLongValue]);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfInt64WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    uint64_t v10 = [v7 count];
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    if (a4 <= 8) {
      unint64_t v12 = 8;
    }
    else {
      unint64_t v12 = a4;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 8, v12);
    id v9 = [(AFBBufferBuilder *)self createVectorOfInt64WithArray:v7];
  }

  return v9;
}

- (id)createVectorOfInt64WithCArray:(const int64_t *)a3 count:(unint64_t)a4
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 8uLL);
    uint64_t v11 = a3 - 1;
    for (unint64_t i = a4; i; unint64_t i = v13)
    {
      unint64_t v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<long long>((uint64_t)p_fbbStorage, v11[i]);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfInt64WithCArray:(const int64_t *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  id v9 = [(AFBBufferBuilder *)self firstError];

  if (v9)
  {
    uint64_t v10 = &unk_26E020030;
  }
  else
  {
    if (a5 <= 8) {
      unint64_t v11 = 8;
    }
    else {
      unint64_t v11 = a5;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 8, v11);
    uint64_t v10 = [(AFBBufferBuilder *)self createVectorOfInt64WithCArray:a3 count:a4];
  }
  return v10;
}

- (id)createVectorOfInt64WithCount:(unint64_t)a3 block:(id)a4
{
  v19[3] = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, unint64_t, uint64_t *))a4;
  if (!v7)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 8uLL);
    if (a3)
    {
      unint64_t v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        unint64_t v13 = (void *)MEMORY[0x230F71520](started);
        v7[2](v7, v12, v19);
        unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<long long>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfInt64WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v10 = [(AFBBufferBuilder *)self firstError];

  if (v10)
  {
    unint64_t v11 = &unk_26E020030;
  }
  else
  {
    if (a4 <= 8) {
      unint64_t v12 = 8;
    }
    else {
      unint64_t v12 = a4;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 8, v12);
    unint64_t v11 = [(AFBBufferBuilder *)self createVectorOfInt64WithCount:a3 block:v9];
  }

  return v11;
}

- (id)createVectorOfUInt64WithArray:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v6 = [(AFBBufferBuilder *)self firstError];

  if (v6)
  {
    id v7 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, [v5 count], 8uLL);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = [v5 reverseObjectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<long long>((uint64_t)p_fbbStorage, [*(id *)(*((void *)&v18 + 1) + 8 * i) unsignedLongLongValue]);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfUInt64WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    uint64_t v10 = [v7 count];
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    if (a4 <= 8) {
      unint64_t v12 = 8;
    }
    else {
      unint64_t v12 = a4;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 8, v12);
    id v9 = [(AFBBufferBuilder *)self createVectorOfUInt64WithArray:v7];
  }

  return v9;
}

- (id)createVectorOfUInt64WithCArray:(const unint64_t *)a3 count:(unint64_t)a4
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 8uLL);
    uint64_t v11 = a3 - 1;
    for (unint64_t i = a4; i; unint64_t i = v13)
    {
      unint64_t v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<long long>((uint64_t)p_fbbStorage, v11[i]);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfUInt64WithCArray:(const unint64_t *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  id v9 = [(AFBBufferBuilder *)self firstError];

  if (v9)
  {
    uint64_t v10 = &unk_26E020030;
  }
  else
  {
    if (a5 <= 8) {
      unint64_t v11 = 8;
    }
    else {
      unint64_t v11 = a5;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 8, v11);
    uint64_t v10 = [(AFBBufferBuilder *)self createVectorOfUInt64WithCArray:a3 count:a4];
  }
  return v10;
}

- (id)createVectorOfUInt64WithCount:(unint64_t)a3 block:(id)a4
{
  v19[3] = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, unint64_t, uint64_t *))a4;
  if (!v7)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 8uLL);
    if (a3)
    {
      unint64_t v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        unint64_t v13 = (void *)MEMORY[0x230F71520](started);
        v7[2](v7, v12, v19);
        unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<long long>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfUInt64WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v10 = [(AFBBufferBuilder *)self firstError];

  if (v10)
  {
    unint64_t v11 = &unk_26E020030;
  }
  else
  {
    if (a4 <= 8) {
      unint64_t v12 = 8;
    }
    else {
      unint64_t v12 = a4;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 8, v12);
    unint64_t v11 = [(AFBBufferBuilder *)self createVectorOfUInt64WithCount:a3 block:v9];
  }

  return v11;
}

- (id)createVectorOfFloat32WithArray:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v6 = [(AFBBufferBuilder *)self firstError];

  if (v6)
  {
    id v7 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, [v5 count], 4uLL);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = [v5 reverseObjectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * i) floatValue];
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<float>((uint64_t)p_fbbStorage, v13);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    id v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfFloat32WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    uint64_t v10 = [v7 count];
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    if (a4 <= 4) {
      unint64_t v12 = 4;
    }
    else {
      unint64_t v12 = a4;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 4, v12);
    id v9 = [(AFBBufferBuilder *)self createVectorOfFloat32WithArray:v7];
  }

  return v9;
}

- (id)createVectorOfFloat32WithCArray:(const float *)a3 count:(unint64_t)a4
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 4uLL);
    uint64_t v11 = a3 - 1;
    for (unint64_t i = a4; i; unint64_t i = v13)
    {
      unint64_t v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<float>((uint64_t)p_fbbStorage, v11[i]);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfFloat32WithCArray:(const float *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  id v9 = [(AFBBufferBuilder *)self firstError];

  if (v9)
  {
    uint64_t v10 = &unk_26E020030;
  }
  else
  {
    if (a5 <= 4) {
      unint64_t v11 = 4;
    }
    else {
      unint64_t v11 = a5;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 4, v11);
    uint64_t v10 = [(AFBBufferBuilder *)self createVectorOfFloat32WithCArray:a3 count:a4];
  }
  return v10;
}

- (id)createVectorOfFloat32WithCount:(unint64_t)a3 block:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, unint64_t, float *))a4;
  if (!v7)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 4uLL);
    if (a3)
    {
      unint64_t v12 = a3 - 1;
      do
      {
        v19[0] = 0.0;
        unint64_t v13 = (void *)MEMORY[0x230F71520](started);
        v7[2](v7, v12, v19);
        unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<float>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfFloat32WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v10 = [(AFBBufferBuilder *)self firstError];

  if (v10)
  {
    unint64_t v11 = &unk_26E020030;
  }
  else
  {
    if (a4 <= 4) {
      unint64_t v12 = 4;
    }
    else {
      unint64_t v12 = a4;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 4, v12);
    unint64_t v11 = [(AFBBufferBuilder *)self createVectorOfFloat32WithCount:a3 block:v9];
  }

  return v11;
}

- (id)createVectorOfFloat64WithArray:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v6 = [(AFBBufferBuilder *)self firstError];

  if (v6)
  {
    id v7 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, [v5 count], 8uLL);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = [v5 reverseObjectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * i) doubleValue];
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<double>((uint64_t)p_fbbStorage, v13);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    id v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfFloat64WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"array"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    uint64_t v10 = [v7 count];
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    if (a4 <= 8) {
      unint64_t v12 = 8;
    }
    else {
      unint64_t v12 = a4;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 8, v12);
    id v9 = [(AFBBufferBuilder *)self createVectorOfFloat64WithArray:v7];
  }

  return v9;
}

- (id)createVectorOfFloat64WithCArray:(const double *)a3 count:(unint64_t)a4
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 8uLL);
    uint64_t v11 = a3 - 1;
    for (unint64_t i = a4; i; unint64_t i = v13)
    {
      unint64_t v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<double>((uint64_t)p_fbbStorage, v11[i]);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfFloat64WithCArray:(const double *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  if (!a3)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"array"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  id v9 = [(AFBBufferBuilder *)self firstError];

  if (v9)
  {
    uint64_t v10 = &unk_26E020030;
  }
  else
  {
    if (a5 <= 8) {
      unint64_t v11 = 8;
    }
    else {
      unint64_t v11 = a5;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 8, v11);
    uint64_t v10 = [(AFBBufferBuilder *)self createVectorOfFloat64WithCArray:a3 count:a4];
  }
  return v10;
}

- (id)createVectorOfFloat64WithCount:(unint64_t)a3 block:(id)a4
{
  v19[3] = *(double *)MEMORY[0x263EF8340];
  id v7 = (void (**)(id, unint64_t, double *))a4;
  if (!v7)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    id v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 8uLL);
    if (a3)
    {
      unint64_t v12 = a3 - 1;
      do
      {
        v19[0] = 0.0;
        unint64_t v13 = (void *)MEMORY[0x230F71520](started);
        v7[2](v7, v12, v19);
        unint64_t started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<double>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfFloat64WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    id v15 = [NSString alloc];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v15 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v16, @"block"];

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v10 = [(AFBBufferBuilder *)self firstError];

  if (v10)
  {
    unint64_t v11 = &unk_26E020030;
  }
  else
  {
    if (a4 <= 8) {
      unint64_t v12 = 8;
    }
    else {
      unint64_t v12 = a4;
    }
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 8, v12);
    unint64_t v11 = [(AFBBufferBuilder *)self createVectorOfFloat64WithCount:a3 block:v9];
  }

  return v11;
}

- (id)createString:(id)a3
{
  id v5 = a3;
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v6 = [(AFBBufferBuilder *)self createString:v5 alignment:1];

  return v6;
}

- (id)createString:(id)a3 alignment:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v12 = [NSString alloc];
    unint64_t v13 = NSStringFromSelector(a2);
    uint64_t v14 = [v12 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v13, @"string"];

    id v15 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v14 userInfo:0];
    objc_exception_throw(v15);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  id v8 = v7;
  uint64_t v9 = [v8 UTF8String];
  if (!v9)
  {
    id v16 = [NSString alloc];
    uint64_t v17 = NSStringFromSelector(a2);
    uint64_t v18 = [v16 initWithFormat:@"%@: string is not valid unicode: \"%@\"", v17, v8];

    id v19 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v18 userInfo:0];
    objc_exception_throw(v19);
  }
  uint64_t v10 = [(AFBBufferBuilder *)self createStringWithCString:v9 alignment:a4];

  return v10;
}

- (id)createStringWithCString:(const char *)a3
{
  if (!a3)
  {
    id v7 = [NSString alloc];
    id v8 = NSStringFromSelector(a2);
    uint64_t v9 = [v7 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v8, @"cString"];

    id v10 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v9 userInfo:0];
    objc_exception_throw(v10);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  return [(AFBBufferBuilder *)self createStringWithCString:a3 alignment:1];
}

- (id)createStringWithCString:(const char *)a3 alignment:(unint64_t)a4
{
  if (!a3)
  {
    id v14 = [NSString alloc];
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v15, @"cString"];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  id v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    uint64_t v9 = &unk_26E020030;
  }
  else
  {
    if (a4 <= 1) {
      unint64_t v10 = 1;
    }
    else {
      unint64_t v10 = a4;
    }
    size_t v11 = strlen(a3);
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceStringAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v11, v10);
    uint64_t v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, v11));
  }
  return v9;
}

- (id)createStringWithData:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [NSString alloc];
    uint64_t v9 = NSStringFromSelector(a2);
    uint64_t v10 = [v8 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v9, @"data"];

    id v11 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v10 userInfo:0];
    objc_exception_throw(v11);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v6 = [(AFBBufferBuilder *)self createStringWithData:v5 alignment:1];

  return v6;
}

- (id)createStringWithData:(id)a3 alignment:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v18 = [NSString alloc];
    id v19 = NSStringFromSelector(a2);
    uint64_t v20 = [v18 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v19, @"data"];

    id v21 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v20 userInfo:0];
    objc_exception_throw(v21);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  id v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    uint64_t v9 = &unk_26E020030;
  }
  else
  {
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    uint64_t v11 = [v7 length];
    if (a4 <= 1) {
      unint64_t v12 = 1;
    }
    else {
      unint64_t v12 = a4;
    }
    unint64_t v13 = apple::aiml::flatbuffers2::FlatBufferBuilder::ForceStringAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v11, v12);
    id v14 = (void *)MEMORY[0x230F71520](v13);
    id v15 = v7;
    uint64_t String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, (const char *)[v15 bytes], objc_msgSend(v15, "length"));
    uint64_t v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:String];
  }

  return v9;
}

- (id)createVectorOfStringWithArray:(id)a3
{
  id v5 = a3;
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v6 = [(AFBBufferBuilder *)self createVectorOfStringWithArray:v5 alignment:1];

  return v6;
}

- (id)createVectorOfStringWithArray:(id)a3 alignment:(unint64_t)a4
{
  v51[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    id v45 = [NSString alloc];
    v46 = NSStringFromSelector(a2);
    uint64_t v47 = [v45 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v46, @"array"];

    id v48 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v47 userInfo:0];
    objc_exception_throw(v48);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  id v8 = [(AFBBufferBuilder *)self firstError];

  if (v8)
  {
    uint64_t v9 = &unk_26E020030;
  }
  else
  {
    if (a4 <= 1) {
      unint64_t v10 = 1;
    }
    else {
      unint64_t v10 = a4;
    }
    __p = 0;
    v50 = 0;
    v51[0] = 0;
    std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::reserve(&__p, [v7 count]);
    uint64_t v11 = [v7 count];
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    while (v11)
    {
      unint64_t v13 = (void *)MEMORY[0x230F71520]();
      id v14 = [v7 objectAtIndexedSubscript:--v11];
      id v15 = (const char *)[v14 UTF8String];
      uint64_t v16 = v15;
      if (!v15)
      {
        id v41 = [NSString alloc];
        v42 = NSStringFromSelector(a2);
        uint64_t v43 = [v41 initWithFormat:@"%@: string is not valid unicode: \"%@\"", v42, v14];

        id v44 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v43 userInfo:0];
        objc_exception_throw(v44);
      }
      size_t v17 = strlen(v15);
      apple::aiml::flatbuffers2::FlatBufferBuilder::ForceStringAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v17, v10);
      size_t v18 = strlen(v16);
      int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v16, v18);
      int v20 = String;
      id v21 = v50;
      if ((unint64_t)v50 >= v51[0])
      {
        uint64_t v23 = (char *)__p;
        uint64_t v24 = (v50 - (unsigned char *)__p) >> 2;
        unint64_t v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 62) {
          std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v26 = v51[0] - (void)__p;
        if ((uint64_t)(v51[0] - (void)__p) >> 1 > v25) {
          unint64_t v25 = v26 >> 1;
        }
        if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v27 = v25;
        }
        if (v27)
        {
          v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>((uint64_t)v51, v27);
          uint64_t v23 = (char *)__p;
          id v21 = v50;
        }
        else
        {
          v28 = 0;
        }
        v29 = &v28[4 * v24];
        *(_DWORD *)v29 = v20;
        long long v22 = v29 + 4;
        while (v21 != v23)
        {
          int v30 = *((_DWORD *)v21 - 1);
          v21 -= 4;
          *((_DWORD *)v29 - 1) = v30;
          v29 -= 4;
        }
        __p = v29;
        v50 = v22;
        v51[0] = &v28[4 * v27];
        if (v23) {
          operator delete(v23);
        }
      }
      else
      {
        *(_DWORD *)v50 = String;
        long long v22 = v21 + 4;
      }
      v50 = v22;
    }
    v31 = __p;
    v32 = v50;
    v33 = v50 - 4;
    if (__p != v50 && v33 > __p)
    {
      v35 = (char *)__p + 4;
      do
      {
        int v36 = *((_DWORD *)v35 - 1);
        *((_DWORD *)v35 - 1) = *(_DWORD *)v33;
        *(_DWORD *)v33 = v36;
        v33 -= 4;
        BOOL v37 = v35 >= v33;
        v35 += 4;
      }
      while (!v37);
    }
    uint64_t v38 = v32 - v31;
    if (v38) {
      v39 = v31;
    }
    else {
      v39 = &apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
    }
    uint64_t v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, (uint64_t)v39, v38 >> 2));
    if (__p)
    {
      v50 = (char *)__p;
      operator delete(__p);
    }
  }

  return v9;
}

- (id)createVectorOfStringWithCount:(unint64_t)a3 block:(id)a4
{
  id v7 = a4;
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  id v8 = [(AFBBufferBuilder *)self createVectorOfStringWithCount:a3 alignment:1 block:v7];

  return v8;
}

- (id)createVectorOfStringWithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  v53[3] = *MEMORY[0x263EF8340];
  uint64_t v9 = (void (**)(id, unint64_t))a5;
  if (!v9)
  {
    v46 = a2;
    id v47 = [NSString alloc];
    id v48 = NSStringFromSelector(v46);
    uint64_t v49 = [v47 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v48, @"block"];

    id v50 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v49 userInfo:0];
    objc_exception_throw(v50);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  unint64_t v10 = [(AFBBufferBuilder *)self firstError];

  if (v10)
  {
    uint64_t v11 = &unk_26E020030;
  }
  else
  {
    if (a4 <= 1) {
      unint64_t v12 = 1;
    }
    else {
      unint64_t v12 = a4;
    }
    __p = 0;
    v52 = 0;
    v53[0] = 0;
    std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::reserve(&__p, a3);
    if (self) {
      p_fbbStorage = &self->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    while (a3)
    {
      id v14 = (void *)MEMORY[0x230F71520]();
      v9[2](v9, --a3);
      id v15 = objc_claimAutoreleasedReturnValue();
      uint64_t v16 = (const char *)[v15 UTF8String];
      size_t v17 = v16;
      if (!v16)
      {
        id v42 = [NSString alloc];
        uint64_t v43 = NSStringFromSelector(a2);
        uint64_t v44 = [v42 initWithFormat:@"%@: string is not valid unicode: \"%@\"", v43, v15];

        id v45 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v44 userInfo:0];
        objc_exception_throw(v45);
      }
      size_t v18 = strlen(v16);
      apple::aiml::flatbuffers2::FlatBufferBuilder::ForceStringAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v18, v12);
      size_t v19 = strlen(v17);
      int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v17, v19);
      int v21 = String;
      long long v22 = v52;
      if ((unint64_t)v52 >= v53[0])
      {
        uint64_t v24 = (char *)__p;
        uint64_t v25 = (v52 - (unsigned char *)__p) >> 2;
        unint64_t v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 62) {
          std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v27 = v53[0] - (void)__p;
        if ((uint64_t)(v53[0] - (void)__p) >> 1 > v26) {
          unint64_t v26 = v27 >> 1;
        }
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v28 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v28 = v26;
        }
        if (v28)
        {
          v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>((uint64_t)v53, v28);
          uint64_t v24 = (char *)__p;
          long long v22 = v52;
        }
        else
        {
          v29 = 0;
        }
        int v30 = &v29[4 * v25];
        *(_DWORD *)int v30 = v21;
        uint64_t v23 = v30 + 4;
        while (v22 != v24)
        {
          int v31 = *((_DWORD *)v22 - 1);
          v22 -= 4;
          *((_DWORD *)v30 - 1) = v31;
          v30 -= 4;
        }
        __p = v30;
        v52 = v23;
        v53[0] = &v29[4 * v28];
        if (v24) {
          operator delete(v24);
        }
      }
      else
      {
        *(_DWORD *)v52 = String;
        uint64_t v23 = v22 + 4;
      }
      v52 = v23;
    }
    v32 = __p;
    v33 = v52;
    v34 = v52 - 4;
    if (__p != v52 && v34 > __p)
    {
      int v36 = (char *)__p + 4;
      do
      {
        int v37 = *((_DWORD *)v36 - 1);
        *((_DWORD *)v36 - 1) = *(_DWORD *)v34;
        *(_DWORD *)v34 = v37;
        v34 -= 4;
        BOOL v38 = v36 >= v34;
        v36 += 4;
      }
      while (!v38);
    }
    uint64_t v39 = v33 - v32;
    if (v39) {
      v40 = v32;
    }
    else {
      v40 = &apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
    }
    uint64_t v11 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, (uint64_t)v40, v39 >> 2));
    if (__p)
    {
      v52 = (char *)__p;
      operator delete(__p);
    }
  }

  return v11;
}

- (id)createVectorOfStringWithOffsets:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v35 = [NSString alloc];
    int v36 = NSStringFromSelector(a2);
    uint64_t v37 = [v35 initWithFormat:@"%@: Invalid parameter not satisfying: %@ != nil", v36, @"offsets"];

    id v38 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v37 userInfo:0];
    objc_exception_throw(v38);
  }
  [(AFBBufferBuilder *)self throwIfFinalizedWithSelector:a2];
  uint64_t v6 = [(AFBBufferBuilder *)self firstError];

  if (v6)
  {
    id v7 = &unk_26E020030;
  }
  else
  {
    v40 = self;
    id v41 = v5;
    __p = 0;
    id v47 = 0;
    id v48 = 0;
    std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::reserve(&__p, [v5 count]);
    context = (void *)MEMORY[0x230F71520]();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v8 = [v5 reverseObjectEnumerator];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v43 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(id *)(*((void *)&v42 + 1) + 8 * i);
          int v13 = [v12 unsignedIntValue];
          int v14 = v13;
          id v15 = v47;
          if (v47 >= v48)
          {
            size_t v17 = (char *)__p;
            uint64_t v18 = (v47 - (unsigned char *)__p) >> 2;
            unint64_t v19 = v18 + 1;
            if ((unint64_t)(v18 + 1) >> 62) {
              std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v20 = v48 - (unsigned char *)__p;
            if ((v48 - (unsigned char *)__p) >> 1 > v19) {
              unint64_t v19 = v20 >> 1;
            }
            if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v21 = v19;
            }
            if (v21)
            {
              long long v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>((uint64_t)&v48, v21);
              size_t v17 = (char *)__p;
              id v15 = v47;
            }
            else
            {
              long long v22 = 0;
            }
            uint64_t v23 = &v22[4 * v18];
            *(_DWORD *)uint64_t v23 = v14;
            uint64_t v16 = v23 + 4;
            while (v15 != v17)
            {
              int v24 = *((_DWORD *)v15 - 1);
              v15 -= 4;
              *((_DWORD *)v23 - 1) = v24;
              v23 -= 4;
            }
            __p = v23;
            id v47 = v16;
            id v48 = &v22[4 * v21];
            if (v17) {
              operator delete(v17);
            }
          }
          else
          {
            *(_DWORD *)id v47 = v13;
            uint64_t v16 = v15 + 4;
          }
          id v47 = v16;
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v49 count:16];
      }
      while (v9);
    }

    uint64_t v25 = __p;
    unint64_t v26 = v47;
    id v5 = v41;
    if (__p != v47)
    {
      uint64_t v27 = v47 - 4;
      if (v47 - 4 > __p)
      {
        unint64_t v28 = (char *)__p + 4;
        do
        {
          int v29 = *((_DWORD *)v28 - 1);
          *((_DWORD *)v28 - 1) = *(_DWORD *)v27;
          *(_DWORD *)uint64_t v27 = v29;
          v27 -= 4;
          BOOL v30 = v28 >= v27;
          v28 += 4;
        }
        while (!v30);
      }
    }
    if (v40) {
      p_fbbStorage = (apple::aiml::flatbuffers2::FlatBufferBuilder *)&v40->_fbbStorage;
    }
    else {
      p_fbbStorage = 0;
    }
    uint64_t v32 = v26 - v25;
    if (v32) {
      v33 = v25;
    }
    else {
      v33 = &apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
    }
    id v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>(p_fbbStorage, (uint64_t)v33, v32 >> 2));
    if (__p)
    {
      id v47 = (char *)__p;
      operator delete(__p);
    }
  }

  return v7;
}

- (NSString)path
{
  return self->_path;
}

- (NSError)firstError
{
  return self->_firstError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstError, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end