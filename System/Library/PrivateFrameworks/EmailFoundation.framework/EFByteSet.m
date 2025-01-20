@interface EFByteSet
+ (id)asciiWhitespaceSet;
- (BOOL)byteIsMember:(unsigned __int8)a3;
- (EFByteSet)init;
- (EFByteSet)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (EFByteSet)initWithCString:(const char *)a3;
- (EFByteSet)initWithRange:(_NSRange)a3;
- (id).cxx_construct;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation EFByteSet

+ (id)asciiWhitespaceSet
{
  if (+[EFByteSet asciiWhitespaceSet]::onceToken != -1) {
    dispatch_once(&+[EFByteSet asciiWhitespaceSet]::onceToken, &__block_literal_global_1);
  }
  v2 = (void *)+[EFByteSet asciiWhitespaceSet]::set;
  return v2;
}

void __31__EFByteSet_asciiWhitespaceSet__block_invoke()
{
  v0 = [[EFByteSet alloc] initWithCString:"\t\n\v\f\r "];
  v1 = (void *)+[EFByteSet asciiWhitespaceSet]::set;
  +[EFByteSet asciiWhitespaceSet]::set = (uint64_t)v0;
}

- (EFByteSet)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v6 = a3.location + a3.length;
  if (a3.location + a3.length >= 0x101)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    v8 = NSStringFromRange(a3);
    [v7 raise:*MEMORY[0x1E4F1C3C8], @"range extends beyond {0..255}: (NSRange) %@", v8 format];
  }
  v12.receiver = self;
  v12.super_class = (Class)EFByteSet;
  result = [(EFByteSet *)&v12 init];
  if (result) {
    BOOL v10 = location >= v6;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    uint64_t v11 = 256;
    if (location > 0x100) {
      uint64_t v11 = location;
    }
    do
    {
      if (v11 == location) {
        std::__throw_out_of_range[abi:ne180100]("bitset set argument out of range");
      }
      *(unint64_t *)((char *)result->_bitString.__first_ + ((location >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << location;
      ++location;
      --length;
    }
    while (length);
  }
  return result;
}

- (EFByteSet)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)EFByteSet;
  result = [(EFByteSet *)&v9 init];
  if (result) {
    BOOL v7 = a4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    do
    {
      unsigned int v8 = *(unsigned __int8 *)a3;
      a3 = (char *)a3 + 1;
      *(unint64_t *)((char *)result->_bitString.__first_ + (((unint64_t)v8 >> 3) & 0x18)) |= 1 << v8;
      --a4;
    }
    while (a4);
  }
  return result;
}

- (EFByteSet)init
{
  v3.receiver = self;
  v3.super_class = (Class)EFByteSet;
  return [(EFByteSet *)&v3 init];
}

- (EFByteSet)initWithCString:(const char *)a3
{
  size_t v5 = strlen(a3);
  return [(EFByteSet *)self initWithBytes:a3 length:v5];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  for (unint64_t i = 0; i != 256; ++i)
  {
    if ((*(unint64_t *)((char *)self->_bitString.__first_ + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) >> i))
    {
      size_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%02zX", i);
      [v3 addObject:v5];
    }
  }
  NSUInteger v6 = NSString;
  uint64_t v7 = objc_opt_class();
  unsigned int v8 = [v3 componentsJoinedByString:@", "];
  objc_super v9 = [v6 stringWithFormat:@"<%@: %p> {%@}", v7, self, v8];

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(EFMutableByteSet);
  if (result)
  {
    long long v5 = *(_OWORD *)self->_bitString.__first_;
    *(_OWORD *)((char *)result + 24) = *(_OWORD *)&self->_bitString.__first_[2];
    *(_OWORD *)((char *)result + 8) = v5;
  }
  return result;
}

- (BOOL)byteIsMember:(unsigned __int8)a3
{
  return (*(unint64_t *)((char *)self->_bitString.__first_ + (((unint64_t)a3 >> 3) & 0x18)) >> a3) & 1;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end