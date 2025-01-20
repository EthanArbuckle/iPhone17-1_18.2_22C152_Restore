@interface NSConstantData
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)new;
- (BOOL)_copyWillRetain;
- (BOOL)_isCompact;
- (BOOL)_isDeallocating;
- (BOOL)_providesConcreteBacking;
- (BOOL)_tryRetain;
- (NSConstantData)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (NSConstantData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6;
- (NSConstantData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4;
- (NSConstantData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5;
- (NSConstantData)initWithData:(id)a3;
- (const)bytes;
- (unint64_t)length;
- (unint64_t)retainCount;
@end

@implementation NSConstantData

- (unint64_t)length
{
  return self->_length;
}

- (const)bytes
{
  return self->_bytes;
}

- (BOOL)_copyWillRetain
{
  return 1;
}

- (BOOL)_isCompact
{
  return 1;
}

- (BOOL)_providesConcreteBacking
{
  return 1;
}

+ (id)new
{
  return (id)objc_opt_new();
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return +[NSData allocWithZone:a3];
}

- (NSConstantData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6
{
  qword_1EC093AA8 = (uint64_t)"attempting to allocate a constant object";
  __break(1u);
  return self;
}

- (NSConstantData)initWithData:(id)a3
{
  qword_1EC093AA8 = (uint64_t)"attempting to allocate a constant object";
  __break(1u);
  return self;
}

- (NSConstantData)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  qword_1EC093AA8 = (uint64_t)"attempting to allocate a constant object";
  __break(1u);
  return self;
}

- (NSConstantData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4
{
  qword_1EC093AA8 = (uint64_t)"attempting to allocate a constant object";
  __break(1u);
  return self;
}

- (NSConstantData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  qword_1EC093AA8 = (uint64_t)"attempting to allocate a constant object";
  __break(1u);
  return self;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end