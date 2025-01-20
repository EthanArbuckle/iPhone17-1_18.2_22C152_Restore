@interface _PFAbstractString
+ (BOOL)accessInstanceVariablesDirectly;
+ (Class)classForKeyedUnarchiver;
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
- (Class)classForCoder;
- (const)_fastCharacterContents;
- (const)cStringUsingEncoding:(unint64_t)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)fastestEncoding;
- (unint64_t)smallestEncoding;
@end

@implementation _PFAbstractString

- (const)_fastCharacterContents
{
  return 0;
}

- (unint64_t)fastestEncoding
{
  return 4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v5 = [(_PFAbstractString *)self UTF8String];

  return (id)[v4 initWithUTF8String:v5];
}

- (id)description
{
  v2 = (void *)[(_PFAbstractString *)self copy];

  return v2;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (const)cStringUsingEncoding:(unint64_t)a3
{
  if (a3 <= 5 && ((1 << a3) & 0x32) != 0)
  {
    return (const char *)[(_PFAbstractString *)self UTF8String];
  }
  else
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)_PFAbstractString;
    return -[_PFAbstractString cStringUsingEncoding:](&v6, sel_cStringUsingEncoding_);
  }
}

- (unint64_t)smallestEncoding
{
  return 4;
}

@end