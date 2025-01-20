@interface FSMutableFileDataBuffer
+ (BOOL)supportsSecureCoding;
+ (id)dataWithCapacity:(unint64_t)a3;
+ (id)dataWithLength:(unint64_t)a3;
- (FSMutableFileDataBuffer)initWithCapacity:(unint64_t)a3;
- (FSMutableFileDataBuffer)initWithCoder:(id)a3;
- (unint64_t)capacity;
- (void)encodeWithCoder:(id)a3;
- (void)withMutableBytes:(id)a3;
@end

@implementation FSMutableFileDataBuffer

- (unint64_t)capacity
{
  v3.receiver = self;
  v3.super_class = (Class)FSMutableFileDataBuffer;
  return [(FSFileDataBuffer *)&v3 internalCapacity];
}

+ (id)dataWithLength:(unint64_t)a3
{
  objc_super v3 = [(FSFileDataBuffer *)[FSMutableFileDataBuffer alloc] initWithLength:a3];
  return v3;
}

+ (id)dataWithCapacity:(unint64_t)a3
{
  objc_super v3 = [[FSMutableFileDataBuffer alloc] initWithCapacity:a3];
  return v3;
}

- (FSMutableFileDataBuffer)initWithCapacity:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FSMutableFileDataBuffer;
  return [(FSFileDataBuffer *)&v4 initWithCapacity:a3 andLength:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FSMutableFileDataBuffer;
  [(FSFileDataBuffer *)&v6 encodeWithCoder:v4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be encoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v5);
  }
}

- (FSMutableFileDataBuffer)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FSMutableFileDataBuffer;
  return [(FSFileDataBuffer *)&v4 initWithCoder:a3];
}

- (void)withMutableBytes:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, void *))a3 + 2))(v5, [(FSMutableFileDataBuffer *)self mutableBytes]);
}

@end