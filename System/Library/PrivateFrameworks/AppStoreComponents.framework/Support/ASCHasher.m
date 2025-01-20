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
  if (qword_1001A6030 != -1) {
    dispatch_once(&qword_1001A6030, &stru_100184018);
  }
  return qword_1001A6038;
}

- (ASCHasher)init
{
  v7.receiver = self;
  v7.super_class = (Class)ASCHasher;
  v2 = [(ASCHasher *)&v7 init];
  if (v2)
  {
    unint64_t v6 = +[ASCHasher executionSeed];
    v3 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithBytes:&v6 length:8];
    buffer = v2->_buffer;
    v2->_buffer = v3;

    v2->_isFinalized = 0;
  }
  return v2;
}

- (void)combineBytes:(const void *)a3 length:(unint64_t)a4
{
  if ([(ASCHasher *)self isFinalized]) {
    objc_exception_throw([objc_alloc((Class)NSException) initWithName:NSInternalInconsistencyException reason:@"Cannot combine additional values into finalized hasher" userInfo:0]);
  }
  id v7 = [(ASCHasher *)self buffer];
  [v7 appendBytes:a3 length:a4];
}

- (void)combineBool:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(ASCHasher *)self combineObject:v4];
}

- (void)combineDouble:(double)a3
{
  id v4 = +[NSNumber numberWithDouble:a3];
  [(ASCHasher *)self combineObject:v4];
}

- (void)combineInteger:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  [(ASCHasher *)self combineObject:v4];
}

- (void)combineUnsignedInteger:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [(ASCHasher *)self combineObject:v4];
}

- (void)combineObject:(id)a3
{
  id v4 = [a3 hash];
  [(ASCHasher *)self combineBytes:&v4 length:8];
}

- (unint64_t)finalizeHash
{
  if ([(ASCHasher *)self isFinalized]) {
    objc_exception_throw([objc_alloc((Class)NSException) initWithName:NSInternalInconsistencyException reason:@"Cannot finalize hasher multiple times" userInfo:0]);
  }
  v3 = [(ASCHasher *)self buffer];
  id v4 = [v3 hash];

  [(ASCHasher *)self setIsFinalized:1];
  v5 = [(ASCHasher *)self buffer];
  [v5 setLength:0];

  return (unint64_t)v4;
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