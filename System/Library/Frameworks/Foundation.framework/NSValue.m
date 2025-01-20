@interface NSValue
+ (BOOL)supportsSecureCoding;
+ (NSValue)allocWithZone:(_NSZone *)a3;
+ (NSValue)valueWithBytes:(const void *)value objCType:(const char *)type;
+ (NSValue)valueWithEdgeInsets:(NSEdgeInsets)insets;
+ (NSValue)valueWithNonretainedObject:(id)anObject;
+ (NSValue)valueWithPoint:(NSPoint)point;
+ (NSValue)valueWithPointer:(const void *)pointer;
+ (NSValue)valueWithRange:(NSRange)range;
+ (NSValue)valueWithRect:(NSRect)rect;
+ (NSValue)valueWithSize:(NSSize)size;
+ (NSValue)valueWithWeakObject:(id)a3;
- (BOOL)_matchType:(const char *)a3 size:(unint64_t)a4;
- (BOOL)_matchType:(const char *)a3 size:(unint64_t)a4 strict:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToValue:(NSValue *)value;
- (BOOL)isNSValue__;
- (Class)classForCoder;
- (NSEdgeInsets)edgeInsetsValue;
- (NSPoint)pointValue;
- (NSRange)rangeValue;
- (NSRect)rectValue;
- (NSSize)sizeValue;
- (NSValue)init;
- (NSValue)initWithBytes:(const void *)value objCType:(const char *)type;
- (NSValue)initWithCoder:(NSCoder *)coder;
- (const)objCType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)nonretainedObjectValue;
- (id)weakObjectValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)getValue:(void *)value;
- (void)getValue:(void *)value size:(NSUInteger)size;
- (void)pointerValue;
@end

@implementation NSValue

- (NSValue)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ((__objc2_class *)objc_opt_class() == NSValue) {
    NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)NSValue);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSValue;
  return [(NSValue *)&v5 init];
}

- (BOOL)isNSValue__
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  NSGetSizeAndAlignment([(NSValue *)self objCType], v6, 0);
  v3 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA58]) initWithLength:v6[0]];
  -[NSValue getValue:](self, "getValue:", [v3 mutableBytes]);
  v4 = (void *)[v3 description];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else if (a3)
  {
    if (objc_opt_class() == __NSConcreteValueClass || (int v5 = _NSIsNSValue()) != 0)
    {
      LOBYTE(v5) = [(NSValue *)self isEqualToValue:a3];
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (Class)classForCoder
{
  return (Class)NSValue;
}

- (BOOL)isEqualToValue:(NSValue *)value
{
  sizep[128] = *MEMORY[0x1E4F143B8];
  if (self == value) {
    return 1;
  }
  int v5 = [(NSValue *)self objCType];
  if (strcmp(v5, [(NSValue *)value objCType])) {
    return 0;
  }
  sizep[0] = 0;
  NSGetSizeAndAlignment(v5, sizep, 0);
  size_t v7 = sizep[0];
  if (sizep[0] < 0x401)
  {
    v9 = &v11;
    v8 = sizep;
  }
  else
  {
    v8 = malloc_type_malloc(sizep[0], 0x7A5C2353uLL);
    v9 = (char *)malloc_type_malloc(v7, 0x5824A3B1uLL);
  }
  [(NSValue *)self getValue:v8];
  [(NSValue *)value getValue:v9];
  BOOL v6 = memcmp(v8, v9, v7) == 0;
  if (v7 > 0x400)
  {
    free(v8);
    free(v9);
  }
  return v6;
}

- (id)nonretainedObjectValue
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (![(NSValue *)self _matchType:"^v" size:8]) {
    return 0;
  }
  v4[0] = 0;
  [(NSValue *)self getValue:v4];
  return (id)v4[0];
}

- (NSPoint)pointValue
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NSValue *)self _matchType:"{CGPoint=dd}" size:16 strict:1];
  double v4 = 0.0;
  double v5 = 0.0;
  if (v3)
  {
    double v6 = 0.0;
    double v7 = 0.0;
    -[NSValue getValue:](self, "getValue:", &v6, 0.0, 0.0);
    double v5 = v6;
    double v4 = v7;
  }
  result.y = v4;
  result.x = v5;
  return result;
}

- (void)pointerValue
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (![(NSValue *)self _matchType:"^v" size:8]) {
    return 0;
  }
  v4[0] = 0;
  [(NSValue *)self getValue:v4];
  return (void *)v4[0];
}

- (NSSize)sizeValue
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NSValue *)self _matchType:"{CGSize=dd}" size:16 strict:1];
  double v4 = 0.0;
  double v5 = 0.0;
  if (v3)
  {
    double v6 = 0.0;
    double v7 = 0.0;
    -[NSValue getValue:](self, "getValue:", &v6, 0.0, 0.0);
    double v5 = v6;
    double v4 = v7;
  }
  result.height = v4;
  result.width = v5;
  return result;
}

- (NSRange)rangeValue
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(NSValue *)self _matchType:"{_NSRange=QQ}" size:16 strict:1])
  {
    NSUInteger v5 = 0;
    NSUInteger v6 = 0;
    [(NSValue *)self getValue:&v5];
    NSUInteger v3 = v5;
    NSUInteger v4 = v6;
  }
  else
  {
    NSUInteger v4 = 0;
    NSUInteger v3 = 0;
  }
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSRect)rectValue
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NSValue *)self _matchType:"{CGRect={CGPoint=dd}{CGSize=dd}}" size:32 strict:1];
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if (v3)
  {
    long long v8 = 0u;
    *(_OWORD *)v9 = 0u;
    [(NSValue *)self getValue:&v8];
    double v6 = *((double *)&v8 + 1);
    double v7 = *(double *)&v8;
    double v4 = v9[1];
    double v5 = v9[0];
  }
  result.size.height = v4;
  result.size.width = v5;
  result.origin.y = v6;
  result.origin.x = v7;
  return result;
}

- (BOOL)_matchType:(const char *)a3 size:(unint64_t)a4
{
  return [(NSValue *)self _matchType:a3 size:a4 strict:0];
}

- (void)encodeWithCoder:(id)a3
{
  sizep[128] = *MEMORY[0x1E4F143B8];
  double v5 = [(NSValue *)self objCType];
  v9 = v5;
  sizep[0] = 0;
  NSGetSizeAndAlignment(v5, sizep, 0);
  NSUInteger v6 = sizep[0];
  if (sizep[0] < 0x401) {
    double v7 = sizep;
  }
  else {
    double v7 = malloc_type_malloc(sizep[0], 0xEBCFD26AuLL);
  }
  if (*v5 == 94 && v5[1] == 118)
  {
    long long v8 = +[NSString stringWithFormat:@"cannot encode (void *) value: %@", self];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v8 userInfo:0]);
  }
  [(NSValue *)self getValue:v7];
  [a3 encodeValueOfObjCType:"*" at:&v9];
  [a3 encodeValueOfObjCType:v9 at:v7];
  if (v6 > 0x400) {
    free(v7);
  }
}

+ (NSValue)valueWithNonretainedObject:(id)anObject
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = anObject;
  return +[NSValue valueWithBytes:v4 objCType:"^v"];
}

+ (NSValue)valueWithPointer:(const void *)pointer
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = pointer;
  return +[NSValue valueWithBytes:v4 objCType:"^v"];
}

+ (NSValue)valueWithSize:(NSSize)size
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  NSSize v4 = size;
  return +[NSValue valueWithBytes:&v4 objCType:"{CGSize=dd}"];
}

+ (NSValue)valueWithRange:(NSRange)range
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  NSRange v4 = range;
  return +[NSValue valueWithBytes:&v4 objCType:"{_NSRange=QQ}"];
}

+ (NSValue)valueWithRect:(NSRect)rect
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  NSRect v4 = rect;
  return +[NSValue valueWithBytes:&v4 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
}

+ (NSValue)valueWithPoint:(NSPoint)point
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  NSPoint v4 = point;
  return +[NSValue valueWithBytes:&v4 objCType:"{CGPoint=dd}"];
}

+ (NSValue)valueWithBytes:(const void *)value objCType:(const char *)type
{
  NSPoint v4 = _NSNewValue((float64x2_t *)value, (char *)type, 0);

  return (NSValue *)v4;
}

- (void)getValue:(void *)value size:(NSUInteger)size
{
  sizep[1] = *MEMORY[0x1E4F143B8];
  long long v8 = objc_opt_class();
  uint64_t v9 = [v8 instanceMethodForSelector:sel_getValue_];
  if (v9 == +[NSValue instanceMethodForSelector:sel_getValue_]
    || (uint64_t v10 = [v8 instanceMethodForSelector:sel_getValue_size_],
        v10 != +[NSValue instanceMethodForSelector:sel_getValue_size_]))
  {
    NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)NSValue);
  }
  sizep[0] = 0;
  char v11 = [(NSValue *)self objCType];
  NSGetSizeAndAlignment(v11, sizep, 0);
  if (sizep[0] != size)
  {
    v12 = +[NSString stringWithFormat:@"Cannot get value with size %zu. The type encoded as %s is expected to be %zu bytes", size, v11, sizep[0]];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v12 userInfo:0]);
  }
  [(NSValue *)self getValue:value];
}

+ (NSValue)valueWithWeakObject:(id)a3
{
  BOOL v3 = [[NSWeakObjectValue alloc] initWithObject:a3];

  return (NSValue *)v3;
}

+ (NSValue)allocWithZone:(_NSZone *)a3
{
  if (NSValue == a1) {
    return (NSValue *)&__placeholderValue;
  }
  else {
    return (NSValue *)NSAllocateObject((Class)a1, 0, a3);
  }
}

- (void)getValue:(void *)value
{
  v9[1] = *MEMORY[0x1E4F143B8];
  NSUInteger v6 = objc_opt_class();
  uint64_t v7 = [v6 instanceMethodForSelector:sel_getValue_size_];
  if (v7 == +[NSValue instanceMethodForSelector:](NSValue, "instanceMethodForSelector:", sel_getValue_size_)|| (uint64_t v8 = [v6 instanceMethodForSelector:sel_getValue_], v8 != +[NSValue instanceMethodForSelector:](NSValue, "instanceMethodForSelector:", sel_getValue_)))
  {
    NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)NSValue);
  }
  v9[0] = 0;
  NSGetSizeAndAlignment([(NSValue *)self objCType], v9, 0);
  [(NSValue *)self getValue:value size:v9[0]];
}

- (const)objCType
{
}

- (BOOL)_matchType:(const char *)a3 size:(unint64_t)a4 strict:(BOOL)a5
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [(NSValue *)self objCType];
  v10[0] = 0;
  NSGetSizeAndAlignment(v8, v10, 0);
  BOOL result = v10[0] == a4 && !a5;
  if (a5 && v10[0] == a4) {
    return matchTypeEncoding(v8, (char *)a3, a4);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  sizep[128] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSValue *)self objCType];
  sizep[0] = 0;
  NSGetSizeAndAlignment(v5, sizep, 0);
  NSUInteger v6 = sizep[0];
  if (sizep[0] < 0x401) {
    uint64_t v7 = (float64x2_t *)sizep;
  }
  else {
    uint64_t v7 = (float64x2_t *)malloc_type_malloc(sizep[0], 0xD10E9699uLL);
  }
  [(NSValue *)self getValue:v7];
  uint64_t v8 = _NSNewValue(v7, v5, a3);
  if (v6 > 0x400) {
    free(v7);
  }
  return v8;
}

- (unint64_t)hash
{
  sizep[128] = *MEMORY[0x1E4F143B8];
  sizep[0] = 0;
  NSGetSizeAndAlignment([(NSValue *)self objCType], sizep, 0);
  NSUInteger v3 = sizep[0];
  if (sizep[0] >= 0x401)
  {
    NSPoint v4 = (uint64_t *)malloc_type_malloc(sizep[0], 0x1D06C794uLL);
    [(NSValue *)self getValue:v4];
LABEL_5:
    unint64_t v5 = 0;
    uint64_t v6 = 32;
    if (v3 < 0x20) {
      uint64_t v6 = v3;
    }
    unint64_t v7 = v6 + 8;
    uint64_t v8 = v4;
    do
    {
      uint64_t v9 = *v8++;
      v5 ^= v9;
      v7 -= 8;
    }
    while (v7 > 0xF);
    goto LABEL_9;
  }
  [(NSValue *)self getValue:sizep];
  if (v3 > 7)
  {
    NSPoint v4 = (uint64_t *)sizep;
    goto LABEL_5;
  }
  if (!v3) {
    return 0;
  }
  uint64_t v11 = 0;
  unint64_t v5 = 0;
  do
  {
    NSPoint v4 = (uint64_t *)sizep;
    unint64_t v5 = *((unsigned __int8 *)sizep + v11++) | (v5 << 8);
  }
  while (v3 != v11);
LABEL_9:
  if (v3 >= 0x401) {
    free(v4);
  }
  return v5;
}

- (id)weakObjectValue
{
  return 0;
}

+ (NSValue)valueWithEdgeInsets:(NSEdgeInsets)insets
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  NSEdgeInsets v4 = insets;
  return +[NSValue valueWithBytes:&v4 objCType:"{NSEdgeInsets=dddd}"];
}

- (NSEdgeInsets)edgeInsetsValue
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NSValue *)self _matchType:"{NSEdgeInsets=dddd}" size:32 strict:1];
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if (v3)
  {
    long long v8 = 0u;
    *(_OWORD *)uint64_t v9 = 0u;
    [(NSValue *)self getValue:&v8];
    double v6 = *((double *)&v8 + 1);
    double v7 = *(double *)&v8;
    double v4 = v9[1];
    double v5 = v9[0];
  }
  result.right = v4;
  result.bottom = v5;
  result.left = v6;
  result.top = v7;
  return result;
}

- (NSValue)initWithCoder:(NSCoder *)coder
{
  double v5 = (NSZone *)[(NSValue *)self zone];

  return newDecodedValue(coder, v5);
}

- (NSValue)initWithBytes:(const void *)value objCType:(const char *)type
{
}

@end