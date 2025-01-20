@interface NSObservationBuffer
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)bufferWithMaximumObjectCount:(unint64_t)a3 fullPolicy:(int64_t)a4 outputQueue:(id)a5;
+ (id)bufferWithOutputQueue:(id)a3;
- (BOOL)automaticallyEmitsObjects;
- (BOOL)isMemoryPressureSensitive;
- (NSObservationBuffer)initWithMaximumObjectCount:(unint64_t)a3 fullPolicy:(int64_t)a4 outputQueue:(id)a5;
- (id)bufferFullHandler;
- (void)emitAllObjects;
- (void)emitObject;
- (void)setAutomaticallyEmitsObjects:(BOOL)a3;
- (void)setBufferFullHandler:(id)a3;
- (void)setMemoryPressureSensitive:(BOOL)a3;
@end

@implementation NSObservationBuffer

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (NSObservationBuffer == a1)
  {
    return +[NSObservationBuffer allocWithZone:a3];
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___NSObservationBuffer;
    return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
  }
}

+ (id)bufferWithOutputQueue:(id)a3
{
  v3 = (void *)[a1 bufferWithMaximumObjectCount:0 fullPolicy:0 outputQueue:a3];
  [v3 setMemoryPressureSensitive:1];
  [v3 setAutomaticallyEmitsObjects:1];
  return v3;
}

+ (id)bufferWithMaximumObjectCount:(unint64_t)a3 fullPolicy:(int64_t)a4 outputQueue:(id)a5
{
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithMaximumObjectCount:a3 fullPolicy:a4 outputQueue:a5];

  return v5;
}

- (NSObservationBuffer)initWithMaximumObjectCount:(unint64_t)a3 fullPolicy:(int64_t)a4 outputQueue:(id)a5
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSObservationBuffer;
  return [(NSObservationBuffer *)&v6 init];
}

- (BOOL)isMemoryPressureSensitive
{
  objc_super v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setMemoryPressureSensitive:(BOOL)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (id)bufferFullHandler
{
  objc_super v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setBufferFullHandler:(id)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)automaticallyEmitsObjects
{
  objc_super v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setAutomaticallyEmitsObjects:(BOOL)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)emitObject
{
  objc_super v4 = (objc_class *)objc_opt_class();

  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)emitAllObjects
{
  objc_super v4 = (objc_class *)objc_opt_class();

  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

@end