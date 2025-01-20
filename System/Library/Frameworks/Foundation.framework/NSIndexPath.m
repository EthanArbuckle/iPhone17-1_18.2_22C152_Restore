@interface NSIndexPath
+ (BOOL)supportsSecureCoding;
+ (NSIndexPath)indexPathWithIndex:(NSUInteger)index;
+ (NSIndexPath)indexPathWithIndexes:(const NSUInteger *)indexes length:(NSUInteger)length;
+ (id)indexPath;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSComparisonResult)compare:(NSIndexPath *)otherObject;
- (NSIndexPath)indexPathByAddingIndex:(NSUInteger)index;
- (NSIndexPath)indexPathByRemovingLastIndex;
- (NSIndexPath)init;
- (NSIndexPath)initWithCoder:(id)a3;
- (NSIndexPath)initWithIndex:(NSUInteger)index;
- (NSIndexPath)initWithIndexes:(const NSUInteger *)indexes length:(NSUInteger)length;
- (NSUInteger)indexAtPosition:(NSUInteger)position;
- (NSUInteger)length;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getIndexes:(NSUInteger *)indexes;
- (void)getIndexes:(NSUInteger *)indexes range:(NSRange)positionRange;
@end

@implementation NSIndexPath

- (unint64_t)hash
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    uint64_t v3 = *MEMORY[0x1E4FBA8E0];
    if ((~(unint64_t)self & 0xC000000000000007) == 0) {
      uint64_t v3 = 0;
    }
    unint64_t v4 = v3 ^ (unint64_t)self;
    uint64_t v5 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v4 & 7) == 0) {
      uint64_t v5 = 0xFFFFFFFFFFFFFLL;
    }
    return v5 & (v4 >> 3);
  }
  else
  {
    unint64_t result = self->_inlinePayload;
    if ((result & 7) != 6)
    {
      NSUInteger v7 = [(NSIndexPath *)self length];
      if (v7 > 4
        || (uint64_t v8 = v7, Class = (__objc2_class *)object_getClass(self), Class == NSIndexPath)
        || (MEMORY[0x1F4188790](Class),
            v11 = (void *)((char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)),
            -[NSIndexPath getIndexes:range:](self, "getIndexes:range:", v11, 0, v8),
            (unint64_t result = _makeInlinePayload(v11, v8)) == 0))
      {
        unint64_t result = [(NSIndexPath *)self length];
        if (result)
        {
          unint64_t v12 = result;
          unint64_t v13 = result + ([(NSIndexPath *)self indexAtPosition:0] << 8);
          return v13 + ([(NSIndexPath *)self indexAtPosition:v12 - 1] << 36);
        }
      }
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v19 = v8;
  uint64_t v20 = v7;
  uint64_t v21 = v6;
  uint64_t v22 = v5;
  uint64_t v23 = v4;
  uint64_t v24 = v3;
  uint64_t v25 = v9;
  uint64_t v26 = v10;
  if (!a3 || ((unint64_t)self & 0x8000000000000000) != 0 && ((unint64_t)a3 & 0x8000000000000000) != 0) {
    return 0;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  NSUInteger v13 = [(NSIndexPath *)self length];
  if (v13 != [a3 length]) {
    return 0;
  }
  if (v13)
  {
    if (v13 != 2)
    {
      uint64_t v17 = 0;
      while (1)
      {
        NSUInteger v18 = -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", v17, v19, v20, v21, v22, v23, v24, v25, v26);
        if (v18 != [a3 indexAtPosition:v17]) {
          break;
        }
        if (v13 == ++v17) {
          return 1;
        }
      }
      return 0;
    }
    NSUInteger v14 = [(NSIndexPath *)self indexAtPosition:1];
    if (v14 != [a3 indexAtPosition:1]) {
      return 0;
    }
    NSUInteger v15 = [(NSIndexPath *)self indexAtPosition:0];
    if (v15 != [a3 indexAtPosition:0]) {
      return 0;
    }
  }
  return 1;
}

- (NSUInteger)indexAtPosition:(NSUInteger)position
{
  NSUInteger v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (position == 0x7FFFFFFFFFFFFFFFLL) {
    return v3;
  }
  if ((self & 0x8000000000000000) != 0)
  {
    uint64_t v4 = *MEMORY[0x1E4FBA8E0];
    if ((~self & 0xC000000000000007) == 0) {
      uint64_t v4 = 0;
    }
    NSUInteger v5 = v4 ^ self;
    uint64_t v6 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v5 & 7) == 0) {
      uint64_t v6 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger v7 = v6 & (v5 >> 3);
  }
  else
  {
    NSUInteger v7 = *(void *)(self + 24);
    if ((v7 & 7) != 6)
    {
      if (*(void *)(self + 16) > position) {
        return *(void *)(*(void *)(self + 8) + 8 * position);
      }
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  if (((v7 >> 3) & 7) <= position) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (position < 4) {
    return (v7 >> (13 * position + 8)) & 0x1FFF;
  }
  __break(1u);
  return self;
}

- (void)getIndexes:(NSUInteger *)indexes range:(NSRange)positionRange
{
  NSUInteger length = positionRange.length;
  NSUInteger location = positionRange.location;
  NSUInteger v9 = [(NSIndexPath *)self length];
  if (v9 < length || location > v9 - length) {
    goto LABEL_23;
  }
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    uint64_t v10 = *MEMORY[0x1E4FBA8E0];
    if ((~(unint64_t)self & 0xC000000000000007) == 0) {
      uint64_t v10 = 0;
    }
    unint64_t v11 = v10 ^ (unint64_t)self;
    uint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v11 & 7) == 0) {
      uint64_t v12 = 0xFFFFFFFFFFFFFLL;
    }
    unint64_t inlinePayload = v12 & (v11 >> 3);
  }
  else
  {
    unint64_t inlinePayload = self->_inlinePayload;
    if ((inlinePayload & 7) != 6)
    {
      if (object_getClass(self) == (Class)NSIndexPath)
      {
        NSUInteger v15 = &self->_indexes[location];
        memmove(indexes, v15, 8 * length);
      }
      else
      {
        for (; length; --length)
          *indexes++ = [(NSIndexPath *)self indexAtPosition:location++];
      }
      return;
    }
  }
  if (length)
  {
    uint64_t v14 = 13 * location + 8;
    while (location < 4)
    {
      *indexes++ = (inlinePayload >> v14) & 0x1FFF;
      v14 += 13;
      ++location;
      if (!--length) {
        return;
      }
    }
    __break(1u);
LABEL_23:
    NSUInteger v16 = v9;
    uint64_t v17 = _NSMethodExceptionProem((objc_class *)self, a2);
    v20.NSUInteger location = location;
    v20.NSUInteger length = length;
    NSUInteger v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: range %@ beyond bounds (%lu)", v17, NSStringFromRange(v20), v16), 0 reason userInfo];
    objc_exception_throw(v18);
  }
}

- (NSUInteger)length
{
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    uint64_t v2 = *MEMORY[0x1E4FBA8E0];
    if ((~(unint64_t)self & 0xC000000000000007) == 0) {
      uint64_t v2 = 0;
    }
    unint64_t v3 = v2 ^ (unint64_t)self;
    uint64_t v4 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v3 & 7) == 0) {
      uint64_t v4 = 0xFFFFFFFFFFFFFLL;
    }
    unint64_t inlinePayload = v4 & (v3 >> 3);
    return (inlinePayload >> 3) & 7;
  }
  unint64_t inlinePayload = self->_inlinePayload;
  if ((inlinePayload & 7) == 6) {
    return (inlinePayload >> 3) & 7;
  }
  return self->_length;
}

- (NSIndexPath)initWithIndex:(NSUInteger)index
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = index;
  return [(NSIndexPath *)self initWithIndexes:v4 length:1];
}

- (NSIndexPath)indexPathByAddingIndex:(NSUInteger)index
{
  v16[1] = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = [(NSIndexPath *)self length];
  unint64_t v6 = v5 + 1;
  if ((v5 + 1) >> 61)
  {
    NSUInteger v13 = +[NSString stringWithFormat:@"*** attempt to create an NSUInteger buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6];
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    NSUInteger v15 = (void *)MEMORY[0x1E4F1C3A8];
    goto LABEL_13;
  }
  NSUInteger v7 = v5;
  if (v6 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v5 + 1;
  }
  MEMORY[0x1F4188790](v5);
  uint64_t v10 = (char *)v16 - v9;
  if (v6 <= 0x100)
  {
    bzero((char *)v16 - v9, 8 * v8);
    goto LABEL_8;
  }
  uint64_t v10 = (char *)malloc_type_malloc(8 * v8, 0x100004000313F17uLL);
  if (!v10)
  {
    NSUInteger v13 = +[NSString stringWithFormat:@"*** attempt to create an NSUInteger buffer of length (%lu) failed", v8];
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    NSUInteger v15 = (void *)MEMORY[0x1E4F1C4A0];
LABEL_13:
    objc_exception_throw((id)[v14 exceptionWithName:*v15 reason:v13 userInfo:0]);
  }
LABEL_8:
  -[NSIndexPath getIndexes:range:](self, "getIndexes:range:", v10, 0, v7);
  *(void *)&v10[8 * v7] = index;
  unint64_t v11 = +[NSIndexPath indexPathWithIndexes:v10 length:v6];
  if (v6 >= 0x101) {
    free(v10);
  }
  return v11;
}

- (NSIndexPath)initWithIndexes:(const NSUInteger *)indexes length:(NSUInteger)length
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)NSIndexPath;
  unint64_t v6 = [(NSIndexPath *)&v14 init];
  unint64_t v7 = (unint64_t)v6;
  if (length >> 30 || !v6)
  {

    return 0;
  }
  uint64_t InlinePayload = _makeInlinePayload((unint64_t *)indexes, length);
  if (!InlinePayload) {
    goto LABEL_9;
  }
  unint64_t v9 = InlinePayload;
  if (__objc2_class *)objc_opt_class() != NSIndexPath || (_NSIndexSetTaggedPointersDisabled)
  {
    if ([(id)v7 isMemberOfClass:NSIndexPath])
    {
      *(void *)(v7 + 24) = v9;
      return (NSIndexPath *)v7;
    }
LABEL_9:
    uint64_t v10 = malloc_default_zone();
    unint64_t v11 = (unint64_t *)malloc_type_zone_malloc(v10, 8 * length, 0x4A6F13AEuLL);
    *(void *)(v7 + 8) = v11;
    memmove(v11, indexes, 8 * length);
    *(void *)(v7 + 16) = length;
    return (NSIndexPath *)v7;
  }

  unint64_t v7 = (8 * v9) | 0x8000000000000004;
  unint64_t v13 = *MEMORY[0x1E4FBA8E0] ^ v7;
  if ((~v13 & 0xC000000000000007) != 0) {
    return (NSIndexPath *)(v13 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v13 & 7)));
  }
  return (NSIndexPath *)v7;
}

+ (NSIndexPath)indexPathWithIndexes:(const NSUInteger *)indexes length:(NSUInteger)length
{
  if (NSIndexPath == a1
    && (_NSIndexSetTaggedPointersDisabled & 1) == 0
    && (uint64_t InlinePayload = _makeInlinePayload((unint64_t *)indexes, length)) != 0)
  {
    unint64_t result = (NSIndexPath *)((8 * InlinePayload) | 0x8000000000000004);
    unint64_t v9 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v9 & 0xC000000000000007) != 0) {
      return (NSIndexPath *)(v9 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v9 & 7)));
    }
  }
  else
  {
    uint64_t v10 = (void *)[objc_alloc((Class)a1) initWithIndexes:indexes length:length];
    return (NSIndexPath *)v10;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  indexes = self->_indexes;
  if (indexes)
  {
    self->_indexes = 0;
    free(indexes);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSIndexPath;
  [(NSIndexPath *)&v4 dealloc];
}

- (NSComparisonResult)compare:(NSIndexPath *)otherObject
{
  if (!otherObject) {
    return 1;
  }
  if (otherObject == self) {
    return 0;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Unable to compare %@ with object of different class: %@", self, otherObject), 0 reason userInfo]);
  }
  NSUInteger v5 = [(NSIndexPath *)self length];
  NSUInteger v6 = [(NSIndexPath *)otherObject length];
  NSUInteger v7 = v6;
  if (v5 >= v6) {
    NSUInteger v8 = v6;
  }
  else {
    NSUInteger v8 = v5;
  }
  if (v8)
  {
    uint64_t v9 = 0;
    NSComparisonResult v10 = NSOrderedDescending;
    while (1)
    {
      unint64_t v11 = [(NSIndexPath *)otherObject indexAtPosition:v9];
      if ([(NSIndexPath *)self indexAtPosition:v9] < v11) {
        return -1;
      }
      if ([(NSIndexPath *)self indexAtPosition:v9] > v11) {
        return v10;
      }
      if (v8 == ++v9) {
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    if (v5 >= v7) {
      NSComparisonResult v12 = NSOrderedSame;
    }
    else {
      NSComparisonResult v12 = NSOrderedAscending;
    }
    if (v5 <= v7) {
      return v12;
    }
    else {
      return 1;
    }
  }
}

- (void)getIndexes:(NSUInteger *)indexes
{
  NSUInteger v5 = [(NSIndexPath *)self length];

  -[NSIndexPath getIndexes:range:](self, "getIndexes:range:", indexes, 0, v5);
}

+ (NSIndexPath)indexPathWithIndex:(NSUInteger)index
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = index;
  if (NSIndexPath != a1 || index >> 13 || (_NSIndexSetTaggedPointersDisabled & 1) != 0) {
    return (NSIndexPath *)(id)[objc_alloc((Class)a1) initWithIndexes:v5 length:1];
  }
  unint64_t result = (NSIndexPath *)((index << 11) | 0x8000000000000074);
  unint64_t v4 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007) != 0) {
    return (NSIndexPath *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v4 & 7)));
  }
  return result;
}

+ (void)initialize
{
  if (NSIndexPath == a1)
  {
    if (*MEMORY[0x1E4FBA8D8] && _CFExecutableLinkedOnOrAfter())
    {
      _objc_registerTaggedPointerClass();
    }
    else
    {
      _NSIndexSetTaggedPointersDisabled = 1;
    }
  }
}

+ (id)indexPath
{
  if (NSIndexPath == a1 && (_NSIndexSetTaggedPointersDisabled & 1) == 0)
  {
    id result = (id)0x8000000000000034;
    unint64_t v4 = *MEMORY[0x1E4FBA8E0] ^ 0x8000000000000034;
    if ((~v4 & 0xC000000000000007) != 0) {
      return (id)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v4 & 7)));
    }
  }
  else
  {
    uint64_t v2 = (void *)[objc_alloc((Class)a1) initWithIndexes:0 length:0];
    return v2;
  }
  return result;
}

- (NSIndexPath)init
{
  return [(NSIndexPath *)self initWithIndexes:0 length:0];
}

- (NSIndexPath)indexPathByRemovingLastIndex
{
  v14[1] = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSIndexPath *)self length];
  NSUInteger v4 = v3 - 1;
  if (v3 <= 1)
  {
    return +[NSIndexPath indexPathWithIndexes:0 length:0];
  }
  if (v4 >> 61)
  {
    unint64_t v11 = +[NSString stringWithFormat:@"*** attempt to create an NSUInteger buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v4];
    NSComparisonResult v12 = (void *)MEMORY[0x1E4F1CA00];
    unint64_t v13 = (void *)MEMORY[0x1E4F1C3A8];
    goto LABEL_14;
  }
  unint64_t v6 = v3;
  MEMORY[0x1F4188790](v3);
  NSUInteger v8 = (char *)v14 - v7;
  if (v9 > 0x101)
  {
    NSUInteger v8 = (char *)malloc_type_malloc(8 * v4, 0x100004000313F17uLL);
    if (v8) {
      goto LABEL_9;
    }
    unint64_t v11 = +[NSString stringWithFormat:@"*** attempt to create an NSUInteger buffer of length (%lu) failed", v4];
    NSComparisonResult v12 = (void *)MEMORY[0x1E4F1CA00];
    unint64_t v13 = (void *)MEMORY[0x1E4F1C4A0];
LABEL_14:
    objc_exception_throw((id)[v12 exceptionWithName:*v13 reason:v11 userInfo:0]);
  }
  bzero((char *)v14 - v7, 8 * v4);
LABEL_9:
  -[NSIndexPath getIndexes:range:](self, "getIndexes:range:", v8, 0, v4);
  NSComparisonResult v10 = +[NSIndexPath indexPathWithIndexes:v8 length:v4];
  if (v6 >= 0x102) {
    free(v8);
  }
  return v10;
}

- (id)description
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSIndexPath *)self length];
  v9.receiver = self;
  v9.super_class = (Class)NSIndexPath;
  NSUInteger v4 = +[NSString stringWithFormat:@"%@ {length = %lu, path = ", [(NSIndexPath *)&v9 description], v3];
  if (v3)
  {
    NSUInteger v5 = 0;
    do
    {
      NSUInteger v6 = [(NSIndexPath *)self indexAtPosition:v5++];
      if (v5 >= v3) {
        uint64_t v7 = "";
      }
      else {
        uint64_t v7 = " - ";
      }
      [(NSMutableString *)v4 appendFormat:@"%lu%s", v6, v7];
    }
    while (v3 != v5);
  }
  [(NSMutableString *)v4 appendString:@"}"];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)NSIndexPath;
    unint64_t v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ cannot be serialized with a coder that does not support keyed archiving", -[NSIndexPath description](&v14, sel_description)), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  NSUInteger v5 = [(NSIndexPath *)self length];
  [a3 encodeInteger:v5 forKey:@"NSIndexPathLength"];
  if (v5)
  {
    if (v5 == 1)
    {
      NSUInteger v6 = [(NSIndexPath *)self indexAtPosition:0];
      [a3 encodeInteger:v6 forKey:@"NSIndexPathValue"];
    }
    else
    {
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:2 * v5 + 16];
      for (uint64_t i = 0; i != v5; ++i)
      {
        NSUInteger v9 = [(NSIndexPath *)self indexAtPosition:i];
        uint64_t v10 = v15;
        if (v9 >= 0x80)
        {
          NSUInteger v11 = v9;
          do
          {
            *v10++ = v11 | 0x80;
            NSUInteger v9 = v11 >> 7;
            NSUInteger v12 = v11 >> 14;
            v11 >>= 7;
          }
          while (v12);
        }
        *uint64_t v10 = v9;
        [v7 appendBytes:v15 length:v10 - v15 + 1];
      }
      [a3 encodeObject:v7 forKey:@"NSIndexPathData"];
    }
  }
}

- (NSIndexPath)initWithCoder:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v31.receiver = self;
    v31.super_class = (Class)NSIndexPath;
    uint64_t v25 = +[NSString stringWithFormat:@"%@ cannot be serialized with a coder that does not support keyed archives", [(NSIndexPath *)&v31 description]];

    uint64_t v26 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v27 = *MEMORY[0x1E4F1C3C8];
    v28 = v25;
    goto LABEL_44;
  }
  if (([a3 containsValueForKey:@"NSIndexPathLength"] & 1) == 0)
  {

    v40 = @"NSLocalizedDescription";
    v41[0] = @"-[NSIndexPath initWithCoder:] decoder did not provide a length value for the indexPath.";
    uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v16 = (__CFString **)v41;
    uint64_t v17 = &v40;
    goto LABEL_17;
  }
  unint64_t v5 = [a3 decodeIntegerForKey:@"NSIndexPathLength"];
  NSUInteger v6 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSIndexPathData"];
  uint64_t v7 = [v6 bytes];
  NSUInteger v8 = (unsigned __int8 *)v7;
  uint64_t v30 = v7;
  if (v5 < 2) {
    goto LABEL_11;
  }
  uint64_t v7 = objc_msgSend(a3, "requiresSecureCoding", v30);
  if (v7)
  {
    if (v8)
    {
      uint64_t v7 = [v6 length];
      uint64_t v9 = 0;
      if (v7)
      {
        uint64_t v10 = v8;
        do
        {
          unsigned int v11 = *v10++;
          v9 += (v11 >> 7) ^ 1;
          --v7;
        }
        while (v7);
      }
      if (v9 == v5) {
        goto LABEL_10;
      }

      v36 = @"NSLocalizedDescription";
      v37 = @"Range data did not match expected length.";
      uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v16 = &v37;
      uint64_t v17 = &v36;
    }
    else
    {

      v38 = @"NSLocalizedDescription";
      v39 = @"Range data missing.";
      uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v16 = &v39;
      uint64_t v17 = &v38;
    }
LABEL_17:
    objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1)));
    return 0;
  }
LABEL_10:
  if (v5 >> 61)
  {
    v28 = +[NSString stringWithFormat:@"*** attempt to create an NSUInteger buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v5];
    uint64_t v26 = (void *)MEMORY[0x1E4F1CA00];
    v29 = (uint64_t *)MEMORY[0x1E4F1C3A8];
    goto LABEL_43;
  }
LABEL_11:
  if (v5 <= 1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v5;
  }
  MEMORY[0x1F4188790](v7);
  objc_super v14 = (uint64_t *)((char *)&v30 - v13);
  if (v5 <= 0x100)
  {
    bzero((char *)&v30 - v13, 8 * v12);
    goto LABEL_19;
  }
  objc_super v14 = (uint64_t *)malloc_type_malloc(8 * v12, 0x100004000313F17uLL);
  if (!v14)
  {
    v28 = +[NSString stringWithFormat:@"*** attempt to create an NSUInteger buffer of length (%lu) failed", v12];
    uint64_t v26 = (void *)MEMORY[0x1E4F1CA00];
    v29 = (uint64_t *)MEMORY[0x1E4F1C4A0];
LABEL_43:
    uint64_t v27 = *v29;
LABEL_44:
    objc_exception_throw((id)objc_msgSend(v26, "exceptionWithName:reason:userInfo:", v27, v28, 0, v30));
  }
LABEL_19:
  if (v5)
  {
    if (v5 == 1)
    {
      if ([a3 containsValueForKey:@"NSIndexPathValue"])
      {
        *objc_super v14 = [a3 decodeIntegerForKey:@"NSIndexPathValue"];
        goto LABEL_27;
      }

      v34 = @"NSLocalizedDescription";
      v35 = @"-[NSIndexPath initWithCoder:] decoder did not provide indexPath data.";
      uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v22 = &v35;
      uint64_t v23 = &v34;
    }
    else
    {
      if ([a3 containsValueForKey:@"NSIndexPathData"])
      {
        if (v8)
        {
          uint64_t v19 = v14;
          unint64_t v20 = v5;
          do
          {
            *v19++ = _NSGetUnsignedInt2(&v30);
            --v20;
          }
          while (v20);
        }
        goto LABEL_27;
      }

      if (v5 >= 0x101) {
        free(v14);
      }
      v32 = @"NSLocalizedDescription";
      v33 = @"-[NSIndexPath initWithCoder:] decoder did not provide indexPath data.";
      uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v22 = &v33;
      uint64_t v23 = &v32;
    }
    objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, 1, v30)));
    return 0;
  }
LABEL_27:
  if (objc_msgSend(a3, "error", v30))
  {

    NSUInteger v18 = 0;
  }
  else
  {
    NSUInteger v18 = [(NSIndexPath *)self initWithIndexes:v14 length:v5];
  }
  if (v5 >= 0x101) {
    free(v14);
  }
  return v18;
}

@end