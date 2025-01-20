@interface ASCHasher
+ (unint64_t)executionSeed;
- (ASCHasher)init;
- (BOOL)isFinalized;
- (NSMutableData)buffer;
- (unint64_t)finalizeHash;
- (void)combineBool:(BOOL)a3;
- (void)combineBytes:(const void *)a3 length:(unint64_t)a4;
- (void)combineDouble:(double)a3;
- (void)combineInteger:(int64_t)a3;
- (void)combineObject:(id)a3;
- (void)combineUnsignedInteger:(unint64_t)a3;
- (void)setIsFinalized:(BOOL)a3;
@end

@implementation ASCHasher

+ (unint64_t)executionSeed
{
  if (executionSeed_onceToken != -1) {
    dispatch_once(&executionSeed_onceToken, &__block_literal_global_8);
  }
  return executionSeed_executionSeed;
}

void __26__ASCHasher_executionSeed__block_invoke()
{
}

- (ASCHasher)init
{
  v7.receiver = self;
  v7.super_class = (Class)ASCHasher;
  v2 = [(ASCHasher *)&v7 init];
  if (v2)
  {
    unint64_t v6 = +[ASCHasher executionSeed];
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:&v6 length:8];
    buffer = v2->_buffer;
    v2->_buffer = (NSMutableData *)v3;

    v2->_isFinalized = 0;
  }
  return v2;
}

- (void)combineBytes:(const void *)a3 length:(unint64_t)a4
{
  if ([(ASCHasher *)self isFinalized])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CA00]);
    objc_exception_throw((id)[v7 initWithName:*MEMORY[0x1E4F1C3B8] reason:@"Cannot combine additional values into finalized hasher" userInfo:0]);
  }
  id v8 = [(ASCHasher *)self buffer];
  [v8 appendBytes:a3 length:a4];
}

- (void)combineBool:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(ASCHasher *)self combineObject:v4];
}

- (void)combineDouble:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(ASCHasher *)self combineObject:v4];
}

- (void)combineInteger:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(ASCHasher *)self combineObject:v4];
}

- (void)combineUnsignedInteger:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(ASCHasher *)self combineObject:v4];
}

- (void)combineObject:(id)a3
{
  uint64_t v4 = [a3 hash];
  [(ASCHasher *)self combineBytes:&v4 length:8];
}

- (unint64_t)finalizeHash
{
  if ([(ASCHasher *)self isFinalized])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CA00]);
    objc_exception_throw((id)[v7 initWithName:*MEMORY[0x1E4F1C3B8] reason:@"Cannot finalize hasher multiple times" userInfo:0]);
  }
  uint64_t v3 = [(ASCHasher *)self buffer];
  unint64_t v4 = [v3 hash];

  [(ASCHasher *)self setIsFinalized:1];
  v5 = [(ASCHasher *)self buffer];
  [v5 setLength:0];

  return v4;
}

- (NSMutableData)buffer
{
  return self->_buffer;
}

- (BOOL)isFinalized
{
  return self->_isFinalized;
}

- (void)setIsFinalized:(BOOL)a3
{
  self->_isFinalized = a3;
}

- (void).cxx_destruct
{
}

@end