@interface NSIndexSet
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (BOOL)supportsSecureCoding;
+ (NSIndexSet)allocWithZone:(_NSZone *)a3;
+ (NSIndexSet)indexSet;
+ (NSIndexSet)indexSetWithBitfield:(unint64_t)a3;
+ (NSIndexSet)indexSetWithIndex:(NSUInteger)value;
+ (NSIndexSet)indexSetWithIndexes:(const unint64_t *)a3 count:(unint64_t)a4;
+ (NSIndexSet)indexSetWithIndexesInRange:(NSRange)range;
+ (id)_alloc;
+ (void)initialize;
- (BOOL)containsIndex:(NSUInteger)value;
- (BOOL)containsIndexes:(NSIndexSet *)indexSet;
- (BOOL)containsIndexesInRange:(NSRange)range;
- (BOOL)getBitfield:(unint64_t *)a3;
- (BOOL)intersectsIndexesInRange:(NSRange)range;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIndexSet:(NSIndexSet *)indexSet;
- (Class)classForCoder;
- (NSIndexSet)indexesInRange:(NSRange)range options:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSIndexSet)indexesPassingTest:(void *)predicate;
- (NSIndexSet)indexesWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSIndexSet)initWithBitfield:(unint64_t)a3;
- (NSIndexSet)initWithCoder:(id)a3;
- (NSIndexSet)initWithIndex:(NSUInteger)value;
- (NSIndexSet)initWithIndexSet:(NSIndexSet *)indexSet;
- (NSIndexSet)initWithIndexes:(const unint64_t *)a3 count:(unint64_t)a4;
- (NSIndexSet)initWithIndexesInRange:(NSRange)range;
- (NSUInteger)count;
- (NSUInteger)countOfIndexesInRange:(NSRange)range;
- (NSUInteger)firstIndex;
- (NSUInteger)getIndexes:(NSUInteger *)indexBuffer maxCount:(NSUInteger)bufferSize inIndexRange:(NSRangePointer)range;
- (NSUInteger)indexGreaterThanIndex:(NSUInteger)value;
- (NSUInteger)indexGreaterThanOrEqualToIndex:(NSUInteger)value;
- (NSUInteger)indexInRange:(NSRange)range options:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSUInteger)indexLessThanIndex:(NSUInteger)value;
- (NSUInteger)indexLessThanOrEqualToIndex:(NSUInteger)value;
- (NSUInteger)indexPassingTest:(void *)predicate;
- (NSUInteger)indexWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSUInteger)lastIndex;
- (_NSRange)rangeAtIndex:(unint64_t)a3;
- (id)_init;
- (id)_numberEnumerator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)replacementObjectForPortCoder:(id)a3;
- (uint64_t)_indexClosestToIndex:(int)a3 equalAllowed:(int)a4 following:;
- (unint64_t)__getContainmentVector:(BOOL *)a3 inRange:(_NSRange)a4;
- (unint64_t)_indexAtIndex:(unint64_t)a3;
- (unint64_t)_indexOfRangeAfterOrContainingIndex:(unint64_t)a3;
- (unint64_t)_indexOfRangeBeforeOrContainingIndex:(unint64_t)a3;
- (unint64_t)_indexOfRangeContainingIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)rangeCount;
- (void)__forwardEnumerateRanges:(id)a3;
- (void)_setContentToContentFromIndexSet:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateIndexesInRange:(NSRange)range options:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)enumerateIndexesUsingBlock:(void *)block;
- (void)enumerateIndexesWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)enumerateRangesInRange:(NSRange)range options:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)enumerateRangesUsingBlock:(void *)block;
- (void)enumerateRangesWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block;
@end

@implementation NSIndexSet

- (NSIndexSet)initWithCoder:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v5 = objc_alloc_init(NSMutableIndexSet);
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    LODWORD(v21) = 0;
    [a3 decodeValueOfObjCType:"I" at:&v21 size:4];
    uint64_t v8 = v21;
    if (v21)
    {
      do
      {
        uint64_t v20 = 0;
        [a3 decodeValueOfObjCType:"I" at:(char *)&v20 + 4 size:4];
        [a3 decodeValueOfObjCType:"I" at:&v20 size:4];
        -[NSMutableIndexSet addIndexesInRange:](v5, "addIndexesInRange:", HIDWORD(v20), v20);
        --v8;
      }
      while (v8);
    }
    goto LABEL_17;
  }
  uint64_t v6 = [a3 decodeIntegerForKey:@"NSRangeCount"];
  if (v6)
  {
    uint64_t v7 = v6;
    if (v6 == 1)
    {
      -[NSMutableIndexSet addIndexesInRange:](v5, "addIndexesInRange:", [a3 decodeIntegerForKey:@"NSLocation"], objc_msgSend(a3, "decodeIntegerForKey:", @"NSLength"));
      goto LABEL_17;
    }
    if (([a3 containsValueForKey:@"NSRangeData"] & 1) == 0)
    {

      v26 = @"NSLocalizedDescription";
      v27[0] = @"-[NSIndexSet initWithCoder:] decoder did not provide range data";
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1)));
      self = 0;
      goto LABEL_17;
    }
    v9 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSRangeData"];
    v10 = (unsigned __int8 *)[v9 bytes];
    v21 = v10;
    if ([a3 requiresSecureCoding])
    {
      if (v9)
      {
        uint64_t v11 = [v9 length];
        for (uint64_t i = 0; v11; --v11)
        {
          unsigned int v13 = *v10++;
          i += (v13 >> 7) ^ 1;
        }
        if (i == 2 * v7) {
          goto LABEL_14;
        }

        v22 = @"NSLocalizedDescription";
        v23 = @"Range data did not match expected length.";
        v17 = (void *)MEMORY[0x1E4F1C9E8];
        v18 = &v23;
        v19 = &v22;
      }
      else
      {

        v24 = @"NSLocalizedDescription";
        v25 = @"Range data did not match expected length.";
        v17 = (void *)MEMORY[0x1E4F1C9E8];
        v18 = &v25;
        v19 = &v24;
      }
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1)));
      return 0;
    }
    do
    {
LABEL_14:
      uint64_t v14 = _NSGetUnsignedInt2(&v21);
      -[NSMutableIndexSet addIndexesInRange:](v5, "addIndexesInRange:", v14, _NSGetUnsignedInt2(&v21));
      --v7;
    }
    while (v7);
  }
LABEL_17:
  v15 = [(NSIndexSet *)self initWithIndexSet:v5];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(NSIndexSet *)self rangeCount];
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeInteger:v5 forKey:@"NSRangeCount"];
    if (v5)
    {
      if (v5 == 1)
      {
        uint64_t v6 = [(NSIndexSet *)self rangeAtIndex:0];
        uint64_t v8 = v7;
        [a3 encodeInteger:v6 forKey:@"NSLocation"];
        [a3 encodeInteger:v8 forKey:@"NSLength"];
      }
      else
      {
        v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:2 * v5 + 16];
        for (uint64_t i = 0; i != v5; ++i)
        {
          unint64_t v14 = [(NSIndexSet *)self rangeAtIndex:i];
          v16 = v24;
          if (v14 >= 0x80)
          {
            unint64_t v17 = v14;
            do
            {
              *v16++ = v17 | 0x80;
              unint64_t v14 = v17 >> 7;
              unint64_t v18 = v17 >> 14;
              v17 >>= 7;
            }
            while (v18);
          }
          unsigned char *v16 = v14;
          v19 = v16 + 1;
          if (v15 < 0x80)
          {
            LOBYTE(v20) = v15;
          }
          else
          {
            do
            {
              *v19++ = v15 | 0x80;
              unint64_t v20 = v15 >> 7;
              unint64_t v21 = v15 >> 14;
              v15 >>= 7;
            }
            while (v21);
          }
          unsigned char *v19 = v20;
          [v12 appendBytes:v24 length:v19 - (unsigned char *)v24 + 1];
        }
        [a3 encodeObject:v12 forKey:@"NSRangeData"];
      }
    }
  }
  else
  {
    v24[0] = v5;
    [a3 encodeValueOfObjCType:"I" at:v24];
    if (v5)
    {
      for (uint64_t j = 0; j != v5; ++j)
      {
        int v10 = [(NSIndexSet *)self rangeAtIndex:j];
        int v22 = v11;
        int v23 = v10;
        [a3 encodeValueOfObjCType:"I" at:&v23];
        [a3 encodeValueOfObjCType:"I" at:&v22];
      }
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)_indexOfRangeBeforeOrContainingIndex:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (((unint64_t)self & 0x8000000000000000) != 0
    || ($A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags, (*(unsigned char *)&indexSetFlags & 2) != 0))
  {
    uint64_t v17 = 0;
    unint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__NSIndexSet__indexOfRangeBeforeOrContainingIndex___block_invoke;
    v15[3] = &unk_1E51F8538;
    v15[5] = v16;
    v15[6] = a3;
    v15[4] = &v17;
    [(NSIndexSet *)self enumerateRangesUsingBlock:v15];
    unint64_t v8 = v18[3];
    _Block_object_dispose(v16, 8);
    _Block_object_dispose(&v17, 8);
    return v8;
  }
  if (*(unsigned char *)&indexSetFlags)
  {
    if (self->_internal._singleRange._range.length)
    {
      unint64_t v7 = 0;
      goto LABEL_10;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v6 = *(void *)(self->_internal._singleRange._range.location + 8);
  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v7 = v6 - 1;
LABEL_10:
  if ([(NSIndexSet *)self lastIndex] <= a3) {
    return v7;
  }
  if ([(NSIndexSet *)self firstIndex] > a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  p_internal = &self->_internal;
  if ((*(unsigned char *)&self->_indexSetFlags & 1) == 0) {
    p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
  }
                                                     + 16 * *(void *)(p_internal->_singleRange._range.location + 24)
                                                     + 64);
  unint64_t v11 = 0;
  while (v11 < v7)
  {
    unint64_t v8 = (v11 + v7) >> 1;
    v12 = &p_internal[v8];
    if (v12->_singleRange._range.location <= a3)
    {
      if (v12->_singleRange._range.location + v12->_singleRange._range.length - 1 >= a3) {
        return v8;
      }
      unint64_t v11 = v8 + 1;
    }
    else
    {
      unint64_t v7 = (v11 + v7) >> 1;
    }
  }
  unint64_t location = p_internal[v11]._singleRange._range.location;
  unint64_t v14 = v11 - 1;
  if (!v11) {
    unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (location > a3) {
    return v14;
  }
  else {
    return v11;
  }
}

- (NSUInteger)lastIndex
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
    NSUInteger location = v4 & (v3 >> 3);
    if (!location) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    return __clz(location) ^ 0x3F;
  }
  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
  if ((*(unsigned char *)&indexSetFlags & 2) != 0)
  {
    NSUInteger location = self->_internal._singleRange._range.location;
    if (location) {
      return __clz(location) ^ 0x3F;
    }
  }
  else if (*(unsigned char *)&indexSetFlags)
  {
    if (self->_internal._singleRange._range.length)
    {
      uint64_t v10 = 0;
      p_internal = &self->_internal;
      return p_internal[v10]._singleRange._range.location + p_internal[v10]._singleRange._range.length - 1;
    }
  }
  else
  {
    NSUInteger v7 = self->_internal._singleRange._range.location;
    uint64_t v8 = *(void *)(v7 + 8);
    if (v8)
    {
      p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(v7 + 16 * *(void *)(v7 + 24) + 64);
      uint64_t v10 = v8 - 1;
      return p_internal[v10]._singleRange._range.location + p_internal[v10]._singleRange._range.length - 1;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)containsIndex:(NSUInteger)value
{
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    uint64_t v5 = *MEMORY[0x1E4FBA8E0];
    if ((~(unint64_t)self & 0xC000000000000007) == 0) {
      uint64_t v5 = 0;
    }
    unint64_t v6 = v5 ^ (unint64_t)self;
    uint64_t v7 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v6 & 7) == 0) {
      uint64_t v7 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger location = v7 & (v6 >> 3);
LABEL_13:
    if (value <= 0x3F) {
      return (location >> value) & 1;
    }
    goto LABEL_17;
  }
  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
  if ((*(unsigned char *)&indexSetFlags & 2) != 0)
  {
    NSUInteger location = self->_internal._singleRange._range.location;
    goto LABEL_13;
  }
  if (*(unsigned char *)&indexSetFlags)
  {
    NSUInteger length = self->_internal._singleRange._range.length;
    if (length)
    {
      NSUInteger v15 = self->_internal._singleRange._range.location;
      if (v15 <= value)
      {
        LOBYTE(v13) = v15 + length - 1 >= value;
        return v13;
      }
    }
    goto LABEL_17;
  }
  p_internal = &self->_internal;
  NSUInteger v10 = self->_internal._singleRange._range.location;
  if (!*(void *)(v10 + 8))
  {
LABEL_17:
    LOBYTE(v13) = 0;
    return v13;
  }
  v12 = (_opaque_pthread_t *)atomic_load((unint64_t *)(v10 + 56));
  if (pthread_self() != v12) {
    goto LABEL_11;
  }
  NSUInteger v16 = p_internal->_singleRange._range.location;
  if (*(void *)(p_internal->_singleRange._range.location + 32) == value) {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_indexSetFlags & 1) == 0) {
    p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(v16 + 16 * *(void *)(v16 + 24) + 64);
  }
  uint64_t v17 = &p_internal[*(void *)(v16 + 40)];
  if (v17->_singleRange._range.location <= value
    && v17->_singleRange._range.location + v17->_singleRange._range.length - 1 >= value)
  {
LABEL_24:
    LOBYTE(v13) = 1;
  }
  else
  {
LABEL_11:
    LOBYTE(v13) = [(NSIndexSet *)self _indexOfRangeContainingIndex:value] != 0x7FFFFFFFFFFFFFFFLL;
  }
  return v13;
}

- (unint64_t)_indexOfRangeAfterOrContainingIndex:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (((unint64_t)self & 0x8000000000000000) != 0
    || ($A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags, (*(unsigned char *)&indexSetFlags & 2) != 0))
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__NSIndexSet__indexOfRangeAfterOrContainingIndex___block_invoke;
    v16[3] = &unk_1E51F8538;
    v16[5] = v17;
    v16[6] = a3;
    void v16[4] = &v18;
    [(NSIndexSet *)self enumerateRangesUsingBlock:v16];
    unint64_t v8 = v19[3];
    _Block_object_dispose(v17, 8);
    _Block_object_dispose(&v18, 8);
    return v8;
  }
  if (*(unsigned char *)&indexSetFlags)
  {
    if (self->_internal._singleRange._range.length)
    {
      unint64_t v7 = 0;
      goto LABEL_10;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v6 = *(void *)(self->_internal._singleRange._range.location + 8);
  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v7 = v6 - 1;
LABEL_10:
  if ([(NSIndexSet *)self firstIndex] >= a3) {
    return 0;
  }
  if ([(NSIndexSet *)self lastIndex] < a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  p_internal = &self->_internal;
  if ((*(unsigned char *)&self->_indexSetFlags & 1) == 0) {
    p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
  }
                                                     + 16 * *(void *)(p_internal->_singleRange._range.location + 24)
                                                     + 64);
  unint64_t v11 = 0;
  if (v7)
  {
    unint64_t v12 = v7;
    do
    {
      unint64_t v8 = (v11 + v12) >> 1;
      BOOL v13 = &p_internal[v8];
      if (v13->_singleRange._range.location <= a3)
      {
        if (v13->_singleRange._range.location + v13->_singleRange._range.length - 1 >= a3) {
          return v8;
        }
        unint64_t v11 = v8 + 1;
      }
      else
      {
        unint64_t v12 = (v11 + v12) >> 1;
      }
    }
    while (v11 < v12);
  }
  unint64_t v14 = p_internal[v11]._singleRange._range.location + p_internal[v11]._singleRange._range.length - 1;
  unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (v11 < v7) {
    unint64_t v15 = v11 + 1;
  }
  if (v14 < a3) {
    return v15;
  }
  else {
    return v11;
  }
}

- (NSUInteger)firstIndex
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
    NSUInteger v5 = v4 & (v3 >> 3);
    goto LABEL_12;
  }
  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
  if ((*(unsigned char *)&indexSetFlags & 2) == 0)
  {
    if (*(unsigned char *)&indexSetFlags)
    {
      if (self->_internal._singleRange._range.length)
      {
        p_internal = &self->_internal;
        return p_internal->_singleRange._range.location;
      }
    }
    else
    {
      NSUInteger location = self->_internal._singleRange._range.location;
      if (*(void *)(location + 8))
      {
        p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(location + 16 * *(void *)(location + 24) + 64);
        return p_internal->_singleRange._range.location;
      }
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v5 = self->_internal._singleRange._range.location;
LABEL_12:
  int v9 = __clz(__rbit64(v5));
  if (v5) {
    int v10 = v9;
  }
  else {
    int v10 = -1;
  }
  if (v10 < 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v10;
  }
}

- (NSUInteger)count
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
    NSUInteger location = v4 & (v3 >> 3);
    goto LABEL_12;
  }
  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
  if ((*(unsigned char *)&indexSetFlags & 2) != 0)
  {
    NSUInteger location = self->_internal._singleRange._range.location;
LABEL_12:
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)location);
    v9.i16[0] = vaddlv_u8(v9);
    return v9.u32[0];
  }
  if (*(unsigned char *)&indexSetFlags) {
    return self->_internal._singleRange._range.length;
  }
  NSUInteger v7 = self->_internal._singleRange._range.location;
  if (*(void *)(v7 + 8)) {
    return *(void *)(v7 + 16);
  }
  else {
    return 0;
  }
}

- (unint64_t)_indexOfRangeContainingIndex:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (((unint64_t)self & 0x8000000000000000) != 0
    || ($A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags, (*(unsigned char *)&indexSetFlags & 2) != 0))
  {
    uint64_t v15 = 0;
    NSUInteger v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__NSIndexSet__indexOfRangeContainingIndex___block_invoke;
    v13[3] = &unk_1E51F8538;
    v13[5] = v14;
    v13[6] = a3;
    v13[4] = &v15;
    [(NSIndexSet *)self enumerateRangesUsingBlock:v13];
    unint64_t v9 = v16[3];
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(&v15, 8);
    return v9;
  }
  if (*(unsigned char *)&indexSetFlags)
  {
    if (self->_internal._singleRange._range.length)
    {
      unint64_t v9 = 0;
      p_internal = &self->_internal;
      goto LABEL_17;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger location = self->_internal._singleRange._range.location;
  uint64_t v5 = *(void *)(location + 8);
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(location + 16 * *(void *)(location + 24) + 64);
  unint64_t v7 = v5 - 1;
  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      unint64_t v9 = (v8 + v7) >> 1;
      int v10 = &p_internal[v9];
      if (v10->_singleRange._range.location <= a3)
      {
        if (v10->_singleRange._range.location + v10->_singleRange._range.length - 1 >= a3) {
          return v9;
        }
        unint64_t v8 = v9 + 1;
      }
      else
      {
        unint64_t v7 = (v8 + v7) >> 1;
      }
    }
    while (v8 < v7);
    unint64_t v9 = v8;
  }
  else
  {
    unint64_t v9 = 0;
  }
LABEL_17:
  unint64_t v11 = &p_internal[v9];
  if (v11->_singleRange._range.location > a3
    || v11->_singleRange._range.location + v11->_singleRange._range.length - 1 < a3)
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v9;
}

- (NSUInteger)countOfIndexesInRange:(NSRange)range
{
  NSUInteger length = range.length;
  if (!range.length) {
    return length;
  }
  NSUInteger location = range.location;
  if (((unint64_t)self & 0x8000000000000000) == 0)
  {
    $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
    if ((*(unsigned char *)&indexSetFlags & 2) != 0)
    {
      NSUInteger v9 = self->_internal._singleRange._range.location;
      if (v9) {
        goto LABEL_13;
      }
    }
    else
    {
      if (*(unsigned char *)&indexSetFlags) {
        p_NSUInteger length = &self->_internal._singleRange._range.length;
      }
      else {
        p_NSUInteger length = (NSUInteger *)(self->_internal._singleRange._range.location + 8);
      }
      if (*p_length)
      {
        unint64_t v19 = [(NSIndexSet *)self _indexOfRangeAfterOrContainingIndex:range.location];
        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        {
          p_internal = &self->_internal;
          if (*(_DWORD *)&self->_indexSetFlags)
          {
            uint64_t v25 = 16;
            if ((*(_DWORD *)&self->_indexSetFlags & 2) == 0) {
              uint64_t v25 = 24;
            }
            unint64_t v24 = *(Class *)((char *)&self->super.isa + v25) != 0;
          }
          else
          {
            NSUInteger v21 = p_internal->_singleRange._range.location;
            p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
                                                             + 16
                                                             * *(void *)(p_internal->_singleRange._range.location + 24)
                                                             + 64);
            unint64_t v22 = *(void *)(v21 + 8);
            if (v22) {
              BOOL v23 = 0;
            }
            else {
              BOOL v23 = (*(_DWORD *)&self->_indexSetFlags & 2) == 0;
            }
            if (v23) {
              unint64_t v24 = 0;
            }
            else {
              unint64_t v24 = v22;
            }
          }
          NSUInteger v26 = location + length;
          unint64_t v27 = location + length - 1;
          v28 = &p_internal[v19];
          if (v28->_singleRange._range.location >= location)
          {
            NSUInteger length = 0;
          }
          else
          {
            NSUInteger v29 = v28->_singleRange._range.length + v28->_singleRange._range.location;
            if (v29 - 1 >= v27) {
              return length;
            }
            NSUInteger length = v29 - location;
            ++v19;
          }
          BOOL v30 = v24 > v19;
          unint64_t v31 = v24 - v19;
          if (v30)
          {
            for (uint64_t i = &p_internal[v19]._singleRange._range.length; ; i += 2)
            {
              unint64_t v33 = *(i - 1);
              NSUInteger v34 = *i;
              if (v33 + *i - 1 > v27) {
                break;
              }
              length += v34;
              if (!--v31) {
                return length;
              }
            }
            if (v33 <= v27) {
              return length + v26 - v33;
            }
          }
          return length;
        }
      }
    }
    return 0;
  }
  uint64_t v6 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v6 ^ (unint64_t)self;
  uint64_t v8 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v7 & 7) == 0) {
    uint64_t v8 = 0xFFFFFFFFFFFFFLL;
  }
  NSUInteger v9 = v8 & (v7 >> 3);
  if (!v9) {
    return 0;
  }
LABEL_13:
  NSUInteger v12 = range.location + range.length;
  if (range.location + range.length >= 0x40) {
    NSUInteger v12 = 64;
  }
  NSUInteger v13 = v12 - range.location;
  if (range.location <= 0x3F) {
    char v14 = range.location;
  }
  else {
    char v14 = 0;
  }
  if (range.location > 0x3F) {
    NSUInteger v13 = 0;
  }
  unint64_t v15 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v13 << v14;
  if (v13) {
    unint64_t v16 = v15;
  }
  else {
    unint64_t v16 = 0;
  }
  uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)(v16 & v9));
  v17.i16[0] = vaddlv_u8(v17);
  return v17.u32[0];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_indexSetFlags & 1) == 0) {
    free(self->_internal._multipleRanges._data);
  }
  v3.receiver = self;
  v3.super_class = (Class)NSIndexSet;
  [(NSIndexSet *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (((unint64_t)self & 0x8000000000000000) == 0)
  {
    id v5 = self;
    if ((__objc2_class *)objc_opt_class() == NSIndexSet)
    {
      return v5;
    }
    else
    {
      uint64_t v4 = +[NSIndexSet allocWithZone:a3];
      return [(NSIndexSet *)v4 initWithIndexSet:v5];
    }
  }
  return self;
}

+ (NSIndexSet)allocWithZone:(_NSZone *)a3
{
  uint64_t v4 = (__objc2_class *)objc_opt_class();
  if (v4 == NSIndexSet) {
    return (NSIndexSet *)&___placeholderIndexSet;
  }

  return (NSIndexSet *)NSAllocateObject((Class)v4, 0, a3);
}

- (void)enumerateIndexesUsingBlock:(void *)block
{
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, 0, 0, 0x7FFFFFFFFFFFFFFFLL);

  __NSIndexSetEnumerate((uint64_t)self, 0, 0, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)block);
}

- (NSIndexSet)initWithIndexSet:(NSIndexSet *)indexSet
{
  uint64_t v4 = [(NSIndexSet *)self _init];
  id v5 = v4;
  if (v4) {
    [(NSIndexSet *)v4 _setContentToContentFromIndexSet:indexSet];
  }
  return v5;
}

- (NSIndexSet)initWithIndexesInRange:(NSRange)range
{
  unint64_t length = range.length;
  NSUInteger location = range.location;
  result = [(NSIndexSet *)self _init];
  if (result)
  {
    unint64_t v7 = location + length;
    if (length && (v7 & 0x8000000000000000) != 0)
    {
      NSUInteger v9 = result;
      int v10 = _NSMethodExceptionProem((objc_class *)result, a2);
      v12.NSUInteger location = location;
      v12.unint64_t length = length;
      unint64_t v11 = +[NSString stringWithFormat:@"%@: Range %@ exceeds maximum index value of NSNotFound - 1", v10, NSStringFromRange(v12)];

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:v11 userInfo:0]);
    }
    if (length && (location > 0x3F || v7 > 0x40 || v7 < location))
    {
      *(_DWORD *)&result->_indexSetFlags &= ~2u;
      result->_internal._singleRange._range.NSUInteger location = location;
      uint64_t v8 = 24;
    }
    else
    {
      if (length) {
        unint64_t length = 0xFFFFFFFFFFFFFFFFLL >> -(char)length << location;
      }
      else {
        unint64_t length = 0;
      }
      uint64_t v8 = 16;
    }
    *(Class *)((char *)&result->super.isa + v8) = (Class)length;
  }
  return result;
}

+ (NSIndexSet)indexSet
{
  if (_NSTaggedIndexSetAllowed == 1 && NSIndexSet == a1)
  {
    result = (NSIndexSet *)0x8580000000000007;
    unint64_t v4 = *MEMORY[0x1E4FBA8E0] ^ 0x8580000000000007;
    if ((~v4 & 0xC000000000000007) != 0) {
      return (NSIndexSet *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v4 & 7)));
    }
  }
  else
  {
    id v2 = objc_alloc_init((Class)a1);
    return (NSIndexSet *)v2;
  }
  return result;
}

- (id)_init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSIndexSet;
  id result = [(NSIndexSet *)&v3 init];
  if (result) {
    *((_DWORD *)result + 2) |= 3u;
  }
  return result;
}

- (void)_setContentToContentFromIndexSet:(id)a3
{
  if (!a3) {
    return;
  }
  id v5 = (__objc2_class *)objc_opt_class();
  if (NSIndexSet != v5
    && _NSConstantIndexSet != v5
    && NSMutableIndexSet != v5)
  {
    v37 = [[NSIndexSet alloc] initWithIndexSet:a3];
    [(NSIndexSet *)self _setContentToContentFromIndexSet:v37];

    return;
  }
  $A8859644891BA8F5A580113D622AC538 indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&self->_indexSetFlags | 1);
  self->_$A8859644891BA8F5A580113D622AC538 indexSetFlags = indexSetFlags;
  if (((unint64_t)a3 & 0x8000000000000000) != 0)
  {
    uint64_t v7 = *MEMORY[0x1E4FBA8E0];
    if ((~(unint64_t)a3 & 0xC000000000000007) == 0) {
      uint64_t v7 = 0;
    }
    unint64_t v8 = v7 ^ (unint64_t)a3;
    uint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v8 & 7) == 0) {
      uint64_t v9 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger v10 = v9 & (v8 >> 3);
    goto LABEL_37;
  }
  if ((*((unsigned char *)a3 + 8) & 2) != 0)
  {
    NSUInteger v10 = *((void *)a3 + 2);
LABEL_37:
    self->_$A8859644891BA8F5A580113D622AC538 indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&indexSetFlags | 2);
    self->_internal._singleRange._range.NSUInteger location = v10;
    return;
  }
  unint64_t v11 = [a3 lastIndex];
  int v12 = *((_DWORD *)a3 + 2);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL || v11 <= 0x3F)
  {
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    NSUInteger v10 = 0;
    uint64_t v18 = (char *)a3 + 16;
    unint64_t v19 = (char *)a3 + 24;
    if ((v12 & 2) != 0) {
      unint64_t v19 = (char *)a3 + 16;
    }
    while (1)
    {
      uint64_t v20 = (uint64_t *)v19;
      if ((v12 & 3) == 0) {
        uint64_t v20 = (uint64_t *)(*(void *)v18 + 8);
      }
      uint64_t v21 = *v20;
      unint64_t v22 = *v20 != 0;
      if ((v12 & 1) == 0 && v21) {
        unint64_t v22 = *(void *)(*(void *)v18 + 8);
      }
      if (v17 >= v22) {
        break;
      }
      BOOL v23 = (char *)a3 + 16;
      if ((v12 & 1) == 0) {
        BOOL v23 = (char *)(*(void *)v18 + 16 * *(void *)(*(void *)v18 + 24) + 64);
      }
      unint64_t v24 = &v23[v16];
      uint64_t v26 = *(void *)v24;
      uint64_t v25 = *((void *)v24 + 1);
      unint64_t v27 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v25 << v26;
      if (v25) {
        unint64_t v28 = v27;
      }
      else {
        unint64_t v28 = 0;
      }
      v10 |= v28;
      ++v17;
      v16 += 16;
    }
    $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
    goto LABEL_37;
  }
  $A8859644891BA8F5A580113D622AC538 v13 = self->_indexSetFlags;
  if (v12)
  {
    self->_$A8859644891BA8F5A580113D622AC538 indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&v13 & 0xFFFFFFFD);
    NSUInteger v29 = ($228E88DFACDD67E146FBAE62E08A49BD *)((char *)a3 + 16);
    if ((*((unsigned char *)a3 + 8) & 1) == 0) {
      NSUInteger v29 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v29->_singleRange._range.location
    }
                                                + 16 * *(void *)(v29->_singleRange._range.location + 24)
                                                + 64);
    self->_internal = *v29;
  }
  else
  {
    self->_$A8859644891BA8F5A580113D622AC538 indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&v13 & 0xFFFFFFFC);
    int v14 = *((_DWORD *)a3 + 2);
    if ((v14 & 2) != 0)
    {
      unint64_t v15 = (char *)a3 + 16;
    }
    else if (v14)
    {
      unint64_t v15 = (char *)a3 + 24;
    }
    else
    {
      unint64_t v15 = (char *)(*((void *)a3 + 2) + 8);
    }
    if (*(void *)v15)
    {
      if (v14) {
        uint64_t v30 = 1;
      }
      else {
        uint64_t v30 = *(void *)(*((void *)a3 + 2) + 8);
      }
    }
    else
    {
      uint64_t v30 = 0;
    }
    unint64_t v31 = (unint64_t *)malloc_type_malloc(16 * v30 + 64, 0xF8ABEA1BuLL);
    self->_internal._singleRange._range.NSUInteger location = (NSUInteger)v31;
    p_internal = &self->_internal;
    atomic_store(0, v31 + 7);
    *(void *)p_internal->_singleRange._range.NSUInteger location = v30;
    *(void *)(p_internal->_singleRange._range.location + 8) = v30;
    *(void *)(p_internal->_singleRange._range.location + 16) = 0;
    *(void *)(p_internal->_singleRange._range.location + 24) = 0;
    unint64_t v33 = p_internal;
    if ((*(unsigned char *)(&p_internal[-1]._singleBitfield + 1) & 1) == 0) {
      unint64_t v33 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
    }
                                                + 16 * *(void *)(p_internal->_singleRange._range.location + 24)
                                                + 64);
    NSUInteger v34 = (char *)a3 + 16;
    if ((*((unsigned char *)a3 + 8) & 1) == 0) {
      NSUInteger v34 = (char *)(*(void *)v34 + 16 * *(void *)(*(void *)v34 + 24) + 64);
    }
    memcpy(v33, v34, 16 * v30);
    if (v30)
    {
      p_unint64_t length = &v33->_singleRange._range.length;
      do
      {
        NSUInteger v36 = *p_length;
        p_length += 2;
        *(void *)(p_internal->_singleRange._range.location + 16) += v36;
        --v30;
      }
      while (v30);
    }
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[NSIndexSet allocWithZone:a3];

  return [(NSIndexSet *)v4 initWithIndexSet:self];
}

- (unint64_t)rangeCount
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
    NSUInteger location = v4 & (v3 >> 3);
    if (location) {
      goto LABEL_7;
    }
    return 0;
  }
  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
  if ((*(unsigned char *)&indexSetFlags & 2) == 0)
  {
    if (*(unsigned char *)&indexSetFlags) {
      return self->_internal._singleRange._range.length != 0;
    }
    else {
      return *(void *)(self->_internal._singleRange._range.location + 8);
    }
  }
  NSUInteger location = self->_internal._singleRange._range.location;
  if (!location) {
    return 0;
  }
LABEL_7:
  unint64_t result = 1;
  unint64_t v7 = location;
  while (1)
  {
    unint64_t v8 = (-1 << __clz(__rbit64(v7))) & ~location;
    if (!v8) {
      break;
    }
    ++result;
    unint64_t v7 = (-1 << __clz(__rbit64(v8))) & location;
    if (!v7) {
      return --result;
    }
  }
  return result;
}

- (BOOL)getBitfield:(unint64_t *)a3
{
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
    NSUInteger location = v5 & (v4 >> 3);
    if (!a3) {
      return 1;
    }
LABEL_7:
    *a3 = location;
    return 1;
  }
  if ((*(unsigned char *)&self->_indexSetFlags & 2) != 0)
  {
    NSUInteger location = self->_internal._singleRange._range.location;
    if (!a3) {
      return 1;
    }
    goto LABEL_7;
  }
  return 0;
}

void __45__NSIndexSet_indexesWithOptions_passingTest___block_invoke(uint64_t a1, unint64_t a2)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 56));
    if (a2 > 0x3F)
    {
      unint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (!v4)
      {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [(NSIndexSet *)[NSMutableIndexSet alloc] initWithBitfield:*(void *)(*(void *)(*(void *)(a1 + 40)+ 8)+ 24)];
        unint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
      [v4 addIndex:a2];
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 1 << a2;
    }
    uint64_t v5 = *(os_unfair_lock_s **)(a1 + 56);
    os_unfair_lock_unlock(v5);
  }
}

+ (NSIndexSet)indexSetWithIndexesInRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  if (NSIndexSet != a1) {
    goto LABEL_15;
  }
  NSUInteger v5 = range.location + range.length;
  if (range.length && (v5 & 0x8000000000000000) != 0)
  {
    uint64_t v9 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v12.NSUInteger location = location;
    v12.NSUInteger length = length;
    NSUInteger v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range %@ exceeds maximum index value of NSNotFound - 1", v9, NSStringFromRange(v12)), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  if (_NSTaggedIndexSetAllowed == 1 && (!range.length || range.location <= 0x33 && v5 <= 0x34 && v5 >= range.location))
  {
    if (range.length) {
      unint64_t result = (NSIndexSet *)((8
    }
                             * ((0xFFFFFFFFFFFFFFFFLL >> -LOBYTE(range.length) << SLOBYTE(range.location)) & 0xFFFFFFFFFFFFFLL)) | 0x8580000000000007);
    else {
      unint64_t result = (NSIndexSet *)0x8580000000000007;
    }
    unint64_t v7 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v7 & 0xC000000000000007) != 0) {
      return (NSIndexSet *)(v7 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v7 & 7)));
    }
  }
  else
  {
LABEL_15:
    unint64_t v8 = objc_msgSend(objc_alloc((Class)a1), "initWithIndexesInRange:", range.location, range.length);
    return (NSIndexSet *)v8;
  }
  return result;
}

+ (NSIndexSet)indexSetWithIndex:(NSUInteger)value
{
  if (_NSTaggedIndexSetAllowed == 1 && value <= 0x33 && NSIndexSet == a1)
  {
    unint64_t result = (NSIndexSet *)((8 << value) & 0x7FFFFFFFFFFFF8 | 0x8580000000000007);
    unint64_t v4 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v4 & 0xC000000000000007) != 0) {
      return (NSIndexSet *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v4 & 7)));
    }
  }
  else
  {
    NSUInteger v5 = (void *)[objc_alloc((Class)a1) initWithIndex:value];
    return (NSIndexSet *)v5;
  }
  return result;
}

+ (id)_alloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___NSIndexSet;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

- (NSIndexSet)initWithBitfield:(unint64_t)a3
{
  if (_NSTaggedIndexSetAllowed == 1
    && (__objc2_class *)objc_opt_class() == NSIndexSet
    && (!a3 || (__clz(a3) ^ 0x3C) <= 0x33))
  {

    unint64_t result = (NSIndexSet *)((8 * (a3 & 0xFFFFFFFFFFFFFLL)) | 0x8580000000000007);
    unint64_t v6 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v6 & 0xC000000000000007) != 0) {
      return (NSIndexSet *)(v6 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v6 & 7)));
    }
  }
  else
  {
    unint64_t result = [(NSIndexSet *)self _init];
    if (result) {
      result->_internal._singleRange._range.NSUInteger location = a3;
    }
  }
  return result;
}

- (NSIndexSet)initWithIndex:(NSUInteger)value
{
  char v3 = value;
  if (value > 0x3F)
  {
    return -[NSIndexSet initWithIndexesInRange:](self, "initWithIndexesInRange:");
  }
  else
  {
    unint64_t result = [(NSIndexSet *)self _init];
    if (result) {
      result->_internal._singleRange._range.NSUInteger location = 1 << v3;
    }
  }
  return result;
}

- (NSIndexSet)indexesPassingTest:(void *)predicate
{
  return [(NSIndexSet *)self indexesWithOptions:0 passingTest:predicate];
}

- (Class)classForCoder
{
  return (Class)NSIndexSet;
}

- (void)enumerateRangesWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  NSEnumerationOptions v6 = opts & 0xBFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v6 = opts;
  }
  uint64_t v7 = v6 | 0x4000000000000000;
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, v6 | 0x4000000000000000, 0, 0x7FFFFFFFFFFFFFFFLL);

  __NSIndexSetEnumerate((uint64_t)self, v7, 0, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)block);
}

- (void)__forwardEnumerateRanges:(id)a3
{
  NSUInteger v5 = (__objc2_class *)objc_opt_class();
  if (NSIndexSet != v5
    && _NSConstantIndexSet != v5
    && NSMutableIndexSet != v5)
  {
    [(NSIndexSet *)self enumerateRangesUsingBlock:a3];
    return;
  }
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    uint64_t v6 = *MEMORY[0x1E4FBA8E0];
    if ((~(unint64_t)self & 0xC000000000000007) == 0) {
      uint64_t v6 = 0;
    }
    unint64_t v7 = v6 ^ (unint64_t)self;
    uint64_t v8 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v7 & 7) == 0) {
      uint64_t v8 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger location = v8 & (v7 >> 3);
    goto LABEL_18;
  }
  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
  if ((*(unsigned char *)&indexSetFlags & 2) != 0)
  {
    NSUInteger location = self->_internal._singleRange._range.location;
LABEL_18:
    __NSIndexSetEnumerateBitfield(location, 0x4000000000000000, 0, 64, (uint64_t)a3);
    return;
  }
  p_internal = &self->_internal;
  if (*(unsigned char *)&indexSetFlags)
  {
    if (!self->_internal._singleRange._range.length) {
      return;
    }
    unint64_t v12 = 1;
  }
  else
  {
    unint64_t v12 = *(void *)(p_internal->_singleRange._range.location + 8);
    if (!v12) {
      return;
    }
    p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
                                                     + 16 * *(void *)(p_internal->_singleRange._range.location + 24)
                                                     + 64);
  }
  for (unint64_t i = 0; i < v12; ++i)
  {
    while (p_internal[i]._singleRange._range.length)
    {
      __NSINDEXSET_IS_CALLING_OUT_TO_A_RANGE_BLOCK__((uint64_t)a3);
      if (++i >= v12) {
        return;
      }
    }
  }
}

- (unint64_t)hash
{
  unint64_t result = [(NSIndexSet *)self count];
  if (result)
  {
    unint64_t v4 = result;
    NSUInteger v5 = [(NSIndexSet *)self firstIndex];
    return v5 + v4 + [(NSIndexSet *)self lastIndex];
  }
  return result;
}

+ (void)initialize
{
  if (NSIndexSet == a1)
  {
    _objc_registerTaggedPointerClass();
    _NSTaggedIndexSetAllowed = 1;
  }
}

- (void)enumerateRangesUsingBlock:(void *)block
{
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, 0x4000000000000000, 0, 0x7FFFFFFFFFFFFFFFLL);

  __NSIndexSetEnumerate((uint64_t)self, 0x4000000000000000, 0, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)block);
}

- (NSIndexSet)indexesWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((opts & 2) != 0) {
    NSEnumerationOptions v6 = opts & 0xFFFFFFFFFFFFFFFELL;
  }
  else {
    NSEnumerationOptions v6 = opts;
  }
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v6, 0, 0x7FFFFFFFFFFFFFFFLL);
  uint64_t v18 = 0;
  unint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000;
  uint64_t v21 = __Block_byref_object_copy__6;
  unint64_t v22 = __Block_byref_object_dispose__6;
  uint64_t v23 = 0;
  uint64_t v14 = 0;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  int v13 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__NSIndexSet_indexesWithOptions_passingTest___block_invoke;
  v12[3] = &unk_1E51F8560;
  v12[4] = predicate;
  v12[5] = &v14;
  v12[6] = &v18;
  v12[7] = &v13;
  __NSIndexSetEnumerate((uint64_t)self, v6, 0, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)v12);
  unint64_t v7 = (void *)v19[5];
  if (v7)
  {
    uint64_t v8 = (void *)[v7 copy];

    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = +[NSIndexSet indexSetWithBitfield:v15[3]];
  }
  NSUInteger v10 = v9;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v10;
}

+ (NSIndexSet)indexSetWithBitfield:(unint64_t)a3
{
  if (_NSTaggedIndexSetAllowed == 1
    && NSIndexSet == a1
    && (!a3 || (__clz(a3) ^ 0x3C) <= 0x33))
  {
    unint64_t result = (NSIndexSet *)((8 * (a3 & 0xFFFFFFFFFFFFFLL)) | 0x8580000000000007);
    unint64_t v5 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v5 & 0xC000000000000007) != 0) {
      return (NSIndexSet *)(v5 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v5 & 7)));
    }
  }
  else
  {
    char v3 = (void *)[objc_alloc((Class)a1) initWithBitfield:a3];
    return (NSIndexSet *)v3;
  }
  return result;
}

- (NSUInteger)indexLessThanIndex:(NSUInteger)value
{
  return -[NSIndexSet _indexClosestToIndex:equalAllowed:following:]((uint64_t)self, value, 0, 0);
}

- (uint64_t)_indexClosestToIndex:(int)a3 equalAllowed:(int)a4 following:
{
  if (!a1) {
    return 0;
  }
  char v5 = a3;
  unint64_t v6 = a2;
  if (a1 < 0)
  {
    uint64_t v8 = *MEMORY[0x1E4FBA8E0];
    if ((~a1 & 0xC000000000000007) == 0) {
      uint64_t v8 = 0;
    }
    unint64_t v9 = v8 ^ a1;
    uint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v9 & 7) == 0) {
      uint64_t v10 = 0xFFFFFFFFFFFFFLL;
    }
    uint64_t v11 = v10 & (v9 >> 3);
    if (!v11) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
LABEL_17:
    uint64_t v18 = 1;
    if (!a4) {
      uint64_t v18 = -1;
    }
    if (a3) {
      uint64_t v18 = 0;
    }
    uint64_t v19 = v18 + a2;
    if (a4)
    {
      unint64_t v20 = v19 & ~(v19 >> 63);
      if (v20 > 0x3F) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      unint64_t v22 = v11 & (-1 << v20);
      BOOL v21 = v22 == 0;
      unint64_t v23 = __clz(__rbit64(v22));
    }
    else
    {
      if (v19 < 0) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v19 >= 63) {
        LOBYTE(v19) = 63;
      }
      unint64_t v24 = v11 & (0xFFFFFFFFFFFFFFFFLL >> ~(_BYTE)v19);
      BOOL v21 = v24 == 0;
      unint64_t v23 = __clz(v24) ^ 0x3F;
    }
    if (v21) {
      unint64_t v17 = -1;
    }
    else {
      unint64_t v17 = v23;
    }
    if (v17 < 0x40) {
      return v17;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int v12 = *(_DWORD *)(a1 + 8);
  if ((v12 & 2) != 0)
  {
    uint64_t v11 = *(void *)(a1 + 16);
    if (!v11) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    goto LABEL_17;
  }
  if (v12)
  {
    uint64_t v25 = *(void *)(a1 + 24);
    if (!v25) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    unint64_t v26 = *(void *)(a1 + 16);
    unint64_t v27 = v26 + v25 - 1;
    if (a4)
    {
      unint64_t v17 = *(void *)(a1 + 16);
      if (a3)
      {
        if (v26 >= a2) {
          return v17;
        }
        unint64_t v17 = a2;
        if (v27 >= a2) {
          return v17;
        }
        goto LABEL_53;
      }
      if (v26 > a2) {
        return v17;
      }
      if (v27 > a2) {
        return a2 + 1;
      }
LABEL_51:
      if (v6 > 0x7FFFFFFFFFFFFFFELL) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      ++v6;
LABEL_53:
      uint64_t v28 = a1 + 16;
      uint64_t v29 = a1 + 16;
      if ((*(unsigned char *)(a1 + 8) & 1) == 0) {
        uint64_t v29 = *(void *)v28 + 16 * *(void *)(*(void *)v28 + 24) + 64;
      }
      uint64_t v30 = [(id)a1 _indexOfRangeAfterOrContainingIndex:v6];
      unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v31 = v30;
        unint64_t v32 = *(void *)(v29 + 16 * v30);
        if (v6 <= v32) {
          unint64_t v17 = v32;
        }
        else {
          unint64_t v17 = v6;
        }
        goto LABEL_70;
      }
      return v17;
    }
    unint64_t v17 = v27;
    if (a3)
    {
      if (v27 <= a2) {
        return v17;
      }
      unint64_t v17 = a2;
      if (v26 <= a2) {
        return v17;
      }
      goto LABEL_64;
    }
    if (v27 < a2) {
      return v17;
    }
    if (v26 < a2) {
      return a2 - 1;
    }
    goto LABEL_62;
  }
  uint64_t v13 = a1 + 16;
  if (!*(void *)(*(void *)(a1 + 16) + 8)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  pthread_t v14 = pthread_self();
  unint64_t v15 = atomic_load((unint64_t *)(*(void *)v13 + 56));
  if (v14 == (pthread_t)v15)
  {
    uint64_t v16 = *(void **)v13;
    if (*(void *)(*(void *)v13 + 32) == v6)
    {
      if (v5) {
        return v6;
      }
      int v40 = *(_DWORD *)(a1 + 8);
      uint64_t v41 = a1 + 16;
      if ((v40 & 1) == 0) {
        uint64_t v41 = (uint64_t)&v16[2 * v16[3] + 8];
      }
      if (a4)
      {
        uint64_t v42 = v16[5];
        if ((unint64_t)(*(void *)(v41 + 16 * v42 + 8) - 1) > v16[6])
        {
          void v16[4] = v6 + 1;
          uint64_t v43 = *(void *)v13;
          uint64_t v44 = *(void *)(*(void *)v13 + 48) + 1;
LABEL_80:
          *(void *)(v43 + 48) = v44;
          return *(void *)(*(void *)v13 + 32);
        }
        if (!_isEmpty(a1))
        {
          unint64_t v45 = (v40 & 1) != 0 ? 1 : v16[1];
          if (v42 + 1 < v45)
          {
            v16[5] = v42 + 1;
            uint64_t v50 = *(void *)(v41 + 16 * *(void *)(*(void *)v13 + 40));
            *(void *)(*(void *)v13 + 48) = 0;
            uint64_t v49 = *(void *)v13;
            goto LABEL_89;
          }
        }
      }
      else
      {
        if (v16[6])
        {
          void v16[4] = v6 - 1;
          uint64_t v43 = *(void *)v13;
          uint64_t v44 = *(void *)(*(void *)v13 + 48) - 1;
          goto LABEL_80;
        }
        uint64_t v46 = v16[5];
        if (v46)
        {
          v16[5] = v46 - 1;
          v47 = (uint64_t *)(v41 + 16 * *(void *)(*(void *)v13 + 40));
          uint64_t v48 = *v47;
          *(void *)(*(void *)v13 + 48) = v47[1] - 1;
          uint64_t v49 = *(void *)v13;
          uint64_t v50 = *(void *)(*(void *)v13 + 48) + v48;
LABEL_89:
          *(void *)(v49 + 32) = v50;
          return *(void *)(*(void *)v13 + 32);
        }
      }
      atomic_store(0, v16 + 7);
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  if (a4)
  {
    if (v5) {
      goto LABEL_53;
    }
    goto LABEL_51;
  }
  if ((v5 & 1) == 0)
  {
LABEL_62:
    if (!v6) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    --v6;
  }
LABEL_64:
  uint64_t v28 = a1 + 16;
  uint64_t v33 = a1 + 16;
  if ((*(unsigned char *)(a1 + 8) & 1) == 0) {
    uint64_t v33 = *(void *)v28 + 16 * *(void *)(*(void *)v28 + 24) + 64;
  }
  uint64_t v34 = [(id)a1 _indexOfRangeBeforeOrContainingIndex:v6];
  unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  if (v34 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v31 = v34;
    v35 = (unint64_t *)(v33 + 16 * v34);
    unint64_t v32 = *v35;
    unint64_t v36 = *v35 + v35[1] - 1;
    if (v6 >= v36) {
      unint64_t v17 = v36;
    }
    else {
      unint64_t v17 = v6;
    }
LABEL_70:
    pthread_t v37 = pthread_self();
    unint64_t v38 = atomic_load((unint64_t *)(*(void *)v28 + 56));
    if (v37 == (pthread_t)v38
      || (uint64_t v39 = 0,
          atomic_compare_exchange_strong((atomic_ullong *volatile)(*(void *)v28 + 56), (unint64_t *)&v39, (unint64_t)v37), !v39))
    {
      *(void *)(*(void *)v28 + 40) = v31;
      *(void *)(*(void *)v28 + 48) = v17 - v32;
      *(void *)(*(void *)v28 + 32) = v17;
    }
  }
  return v17;
}

- (NSUInteger)indexGreaterThanIndex:(NSUInteger)value
{
  return -[NSIndexSet _indexClosestToIndex:equalAllowed:following:]((uint64_t)self, value, 0, 1);
}

- (BOOL)containsIndexes:(NSIndexSet *)indexSet
{
  LOBYTE(v3) = 1;
  if (!indexSet || indexSet == self) {
    return v3;
  }
  unint64_t v6 = (__objc2_class *)objc_opt_class();
  if (NSIndexSet != v6
    && _NSConstantIndexSet != v6
    && NSMutableIndexSet != v6)
  {
    NSUInteger v7 = [(NSIndexSet *)indexSet firstIndex];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (NSUInteger i = v7;
            i != 0x7FFFFFFFFFFFFFFFLL;
            NSUInteger i = [(NSIndexSet *)indexSet indexGreaterThanIndex:i])
      {
        BOOL v3 = [(NSIndexSet *)self containsIndex:i];
        if (!v3) {
          break;
        }
      }
    }
    return v3;
  }
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    uint64_t v9 = *MEMORY[0x1E4FBA8E0];
    if ((~(unint64_t)self & 0xC000000000000007) == 0) {
      uint64_t v9 = 0;
    }
    unint64_t v10 = v9 ^ (unint64_t)self;
    uint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v10 & 7) == 0) {
      uint64_t v11 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger location = v11 & (v10 >> 3);
    if (((unint64_t)indexSet & 0x8000000000000000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_indexSetFlags & 2) != 0)
  {
    NSUInteger location = self->_internal._singleRange._range.location;
    if (((unint64_t)indexSet & 0x8000000000000000) != 0)
    {
LABEL_17:
      uint64_t v13 = *MEMORY[0x1E4FBA8E0];
      if ((~(unint64_t)indexSet & 0xC000000000000007) == 0) {
        uint64_t v13 = 0;
      }
      unint64_t v14 = v13 ^ (unint64_t)indexSet;
      uint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v14 & 7) == 0) {
        uint64_t v15 = 0xFFFFFFFFFFFFFLL;
      }
      NSUInteger v16 = v15 & (v14 >> 3);
      goto LABEL_35;
    }
LABEL_30:
    if ((*(unsigned char *)&indexSet->_indexSetFlags & 2) != 0)
    {
      NSUInteger v16 = indexSet->_internal._singleRange._range.location;
    }
    else
    {
      NSUInteger v21 = [(NSIndexSet *)indexSet lastIndex];
      if (v21 != 0x7FFFFFFFFFFFFFFFLL && v21 > 0x3F)
      {
        NSUInteger v16 = 0;
        char v22 = 0;
        goto LABEL_36;
      }
      uint64_t v29 = 0;
      unint64_t v30 = 0;
      NSUInteger v16 = 0;
      $A8859644891BA8F5A580113D622AC538 indexSetFlags = indexSet->_indexSetFlags;
      p_internal = &indexSet->_internal;
      uint64_t v33 = ($228E88DFACDD67E146FBAE62E08A49BD *)(&indexSet->_internal._singleBitfield + 1);
      if ((*(unsigned char *)&indexSetFlags & 2) != 0) {
        uint64_t v33 = &indexSet->_internal;
      }
      while (1)
      {
        uint64_t v34 = v33;
        if ((*(unsigned char *)&indexSetFlags & 3) == 0) {
          uint64_t v34 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location + 8);
        }
        NSUInteger v35 = v34->_singleRange._range.location;
        unint64_t v36 = v34->_singleRange._range.location != 0;
        if ((*(unsigned char *)&indexSetFlags & 1) == 0 && v35) {
          unint64_t v36 = *(void *)(p_internal->_singleRange._range.location + 8);
        }
        if (v30 >= v36) {
          break;
        }
        pthread_t v37 = &indexSet->_internal;
        if ((*(unsigned char *)&indexSetFlags & 1) == 0) {
          pthread_t v37 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
        }
                                                    + 16 * *(void *)(p_internal->_singleRange._range.location + 24)
                                                    + 64);
        unint64_t v38 = &v37[v29];
        NSUInteger v40 = v38->_singleRange._range.location;
        NSUInteger length = v38->_singleRange._range.length;
        unint64_t v41 = 0xFFFFFFFFFFFFFFFFLL >> -(char)length << v40;
        if (length) {
          unint64_t v42 = v41;
        }
        else {
          unint64_t v42 = 0;
        }
        v16 |= v42;
        ++v30;
        ++v29;
      }
    }
LABEL_35:
    char v22 = 1;
LABEL_36:
    if ((v16 & ~location) != 0) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = v22;
    }
    return v3;
  }
  if (((unint64_t)indexSet & 0x8000000000000000) != 0)
  {
    uint64_t v17 = *MEMORY[0x1E4FBA8E0];
    if ((~(unint64_t)indexSet & 0xC000000000000007) == 0) {
      uint64_t v17 = 0;
    }
    unint64_t v18 = v17 ^ (unint64_t)indexSet;
    uint64_t v19 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v18 & 7) == 0) {
      uint64_t v19 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger v20 = v19 & (v18 >> 3);
    goto LABEL_61;
  }
  if ((*(unsigned char *)&indexSet->_indexSetFlags & 2) != 0)
  {
    NSUInteger v20 = indexSet->_internal._singleRange._range.location;
LABEL_61:
    NSUInteger v43 = [(NSIndexSet *)self lastIndex];
    if (v43 == 0x7FFFFFFFFFFFFFFFLL || v43 <= 0x3F)
    {
      uint64_t v57 = 0;
      unint64_t v58 = 0;
      uint64_t v45 = 0;
      $A8859644891BA8F5A580113D622AC538 v59 = self->_indexSetFlags;
      v60 = &self->_internal;
      v61 = ($228E88DFACDD67E146FBAE62E08A49BD *)(&self->_internal._singleBitfield + 1);
      if ((*(unsigned char *)&v59 & 2) != 0) {
        v61 = &self->_internal;
      }
      while (1)
      {
        v62 = v61;
        if ((*(unsigned char *)&v59 & 3) == 0) {
          v62 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v60->_singleRange._range.location + 8);
        }
        NSUInteger v63 = v62->_singleRange._range.location;
        unint64_t v64 = v62->_singleRange._range.location != 0;
        if ((*(unsigned char *)&v59 & 1) == 0 && v63) {
          unint64_t v64 = *(void *)(v60->_singleRange._range.location + 8);
        }
        if (v58 >= v64) {
          break;
        }
        v65 = &self->_internal;
        if ((*(unsigned char *)&v59 & 1) == 0) {
          v65 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v60->_singleRange._range.location
        }
                                                    + 16 * *(void *)(v60->_singleRange._range.location + 24)
                                                    + 64);
        v66 = &v65[v57];
        NSUInteger v68 = v66->_singleRange._range.location;
        NSUInteger v67 = v66->_singleRange._range.length;
        unint64_t v69 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v67 << v68;
        if (v67) {
          unint64_t v70 = v69;
        }
        else {
          unint64_t v70 = 0;
        }
        v45 |= v70;
        ++v58;
        ++v57;
      }
    }
    else
    {
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      unint64_t v46 = 0;
      v47 = &self->_internal;
      uint64_t v48 = ($228E88DFACDD67E146FBAE62E08A49BD *)(&self->_internal._singleBitfield + 1);
      $A8859644891BA8F5A580113D622AC538 v49 = self->_indexSetFlags;
      if ((*(unsigned char *)&v49 & 2) != 0) {
        uint64_t v48 = &self->_internal;
      }
      while (1)
      {
        uint64_t v50 = v48;
        if ((*(unsigned char *)&v49 & 3) == 0) {
          uint64_t v50 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v47->_singleRange._range.location + 8);
        }
        NSUInteger v51 = v50->_singleRange._range.location;
        unint64_t v52 = v50->_singleRange._range.location != 0;
        if ((*(unsigned char *)&v49 & 1) == 0 && v51) {
          unint64_t v52 = *(void *)(v47->_singleRange._range.location + 8);
        }
        if (v46 >= v52) {
          break;
        }
        v53 = &self->_internal;
        if ((*(unsigned char *)&v49 & 1) == 0) {
          v53 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v47->_singleRange._range.location
        }
                                                    + 16 * *(void *)(v47->_singleRange._range.location + 24)
                                                    + 64);
        unint64_t v54 = v53[v44]._singleRange._range.location;
        if (v54 > 0x3F)
        {
          LOBYTE(v54) = 0;
          unint64_t v56 = 0;
        }
        else
        {
          unint64_t v55 = v53[v44]._singleRange._range.length + v54;
          if (v55 >= 0x40) {
            unint64_t v55 = 64;
          }
          unint64_t v56 = v55 - v54;
        }
        if (!v56) {
          break;
        }
        v45 |= 0xFFFFFFFFFFFFFFFFLL >> -(char)v56 << v54;
        ++v46;
        ++v44;
      }
    }
    LOBYTE(v3) = (v20 & ~v45) == 0;
    return v3;
  }
  unint64_t v23 = [(NSIndexSet *)indexSet rangeCount];
  if (v23)
  {
    uint64_t v24 = 0;
    unint64_t v25 = v23 - 1;
    do
    {
      uint64_t v26 = [(NSIndexSet *)indexSet rangeAtIndex:v24];
      BOOL v3 = -[NSIndexSet containsIndexesInRange:](self, "containsIndexesInRange:", v26, v27);
      if (!v3) {
        break;
      }
    }
    while (v25 != v24++);
  }
  return v3;
}

- (_NSRange)rangeAtIndex:(unint64_t)a3
{
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
    NSUInteger v6 = v5 & (v4 >> 3);
    goto LABEL_13;
  }
  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
  if ((*(unsigned char *)&indexSetFlags & 2) == 0)
  {
    if (*(unsigned char *)&indexSetFlags)
    {
      unint64_t v9 = self->_internal._singleRange._range.length != 0;
      if (v9 >= a3)
      {
        p_internal = &self->_internal;
LABEL_25:
        uint64_t v17 = &p_internal[a3];
        unint64_t location = v17->_singleRange._range.location;
        NSUInteger length = v17->_singleRange._range.length;
        goto LABEL_26;
      }
    }
    else
    {
      NSUInteger v8 = self->_internal._singleRange._range.location;
      unint64_t v9 = *(void *)(v8 + 8);
      if (v9)
      {
        if (v9 < a3) {
          goto LABEL_28;
        }
        goto LABEL_24;
      }
      if (!a3)
      {
LABEL_24:
        p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(v8 + 16 * *(void *)(v8 + 24) + 64);
        goto LABEL_25;
      }
      unint64_t v9 = 0;
    }
LABEL_28:
    unint64_t v14 = +[NSString stringWithFormat:@"Index %ld out of bounds [0...%ld]", a3, v9];
LABEL_19:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0]);
  }
  NSUInteger v6 = self->_internal._singleRange._range.location;
LABEL_13:
  LOBYTE(v10) = 0;
  uint64_t v11 = -1;
  while (1)
  {
    if (((-1 << v10) & v6) == 0)
    {
LABEL_18:
      unint64_t v14 = +[NSString stringWithFormat:@"Index %ld out of bounds [0...%ld]", a3, _bitfieldSetRangesCount(v6)];
      goto LABEL_19;
    }
    unint64_t location = __clz(__rbit64((-1 << v10) & v6));
    unint64_t v13 = (-1 << location) & ~v6;
    unint64_t v10 = __clz(__rbit64(v13));
    if (a3 == ++v11) {
      break;
    }
    if (!v13 || v10 >= 0x40) {
      goto LABEL_18;
    }
  }
  NSUInteger length = v10 - location;
LABEL_26:
  NSUInteger v18 = location;
  result.NSUInteger length = length;
  result.unint64_t location = v18;
  return result;
}

- (BOOL)containsIndexesInRange:(NSRange)range
{
  if (!range.length) {
    return 0;
  }
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    uint64_t v6 = *MEMORY[0x1E4FBA8E0];
    if ((~(unint64_t)self & 0xC000000000000007) == 0) {
      uint64_t v6 = 0;
    }
    unint64_t v7 = v6 ^ (unint64_t)self;
    uint64_t v8 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v7 & 7) == 0) {
      uint64_t v8 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger v9 = v8 & (v7 >> 3);
LABEL_15:
    if (range.location <= 0x3F)
    {
      BOOL result = 0;
      BOOL v13 = __CFADD__(range.location, range.length);
      if (range.location + range.length <= 0x40 && !v13) {
        return ((0xFFFFFFFFFFFFFFFFLL >> -LOBYTE(range.length) << SLOBYTE(range.location)) & ~v9) == 0;
      }
      return result;
    }
    return 0;
  }
  if ((*(unsigned char *)&self->_indexSetFlags & 2) != 0)
  {
    NSUInteger v9 = self->_internal._singleRange._range.location;
    goto LABEL_15;
  }
  unint64_t v11 = [(NSIndexSet *)self _indexOfRangeContainingIndex:range.location];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  p_internal = &self->_internal;
  if ((*(unsigned char *)&self->_indexSetFlags & 1) == 0) {
    p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
  }
                                                     + 16 * *(void *)(p_internal->_singleRange._range.location + 24)
                                                     + 64);
  return p_internal[v11]._singleRange._range.length + p_internal[v11]._singleRange._range.location >= location + length;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(NSIndexSet *)self isEqualToIndexSet:a3];
}

- (BOOL)isEqualToIndexSet:(NSIndexSet *)indexSet
{
  if (indexSet == self) {
    goto LABEL_116;
  }
  if (!indexSet)
  {
LABEL_117:
    char v10 = 0;
    return v10 & 1;
  }
  uint64_t v5 = (__objc2_class *)objc_opt_class();
  if (NSIndexSet != v5
    && _NSConstantIndexSet != v5
    && NSMutableIndexSet != v5
    || (uint64_t v6 = (__objc2_class *)objc_opt_class(), NSIndexSet != v6)
    && _NSConstantIndexSet != v6
    && NSMutableIndexSet != v6)
  {
    NSUInteger v7 = [(NSIndexSet *)self count];
    if (v7 == [(NSIndexSet *)indexSet count])
    {
      if (v7)
      {
        NSUInteger v8 = [(NSIndexSet *)self firstIndex];
        NSUInteger v9 = [(NSIndexSet *)indexSet firstIndex];
        do
        {
          char v10 = v8 == v9;
          if (v8 != v9) {
            break;
          }
          NSUInteger v8 = [(NSIndexSet *)self indexGreaterThanIndex:v9];
          NSUInteger v9 = [(NSIndexSet *)indexSet indexGreaterThanIndex:v9];
          --v7;
        }
        while (v7);
        return v10 & 1;
      }
LABEL_116:
      char v10 = 1;
      return v10 & 1;
    }
    goto LABEL_117;
  }
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    uint64_t v11 = *MEMORY[0x1E4FBA8E0];
    if ((~(unint64_t)self & 0xC000000000000007) == 0) {
      uint64_t v11 = 0;
    }
    unint64_t v12 = v11 ^ (unint64_t)self;
    uint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v12 & 7) == 0) {
      uint64_t v13 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger location = v13 & (v12 >> 3);
    if (((unint64_t)indexSet & 0x8000000000000000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_34;
  }
  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
  if ((*(unsigned char *)&indexSetFlags & 2) != 0)
  {
    NSUInteger location = self->_internal._singleRange._range.location;
    if (((unint64_t)indexSet & 0x8000000000000000) != 0)
    {
LABEL_21:
      uint64_t v15 = *MEMORY[0x1E4FBA8E0];
      if ((~(unint64_t)indexSet & 0xC000000000000007) == 0) {
        uint64_t v15 = 0;
      }
      unint64_t v16 = v15 ^ (unint64_t)indexSet;
      uint64_t v17 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v16 & 7) == 0) {
        uint64_t v17 = 0xFFFFFFFFFFFFFLL;
      }
      NSUInteger v18 = v17 & (v16 >> 3);
      goto LABEL_39;
    }
LABEL_34:
    if ((*(unsigned char *)&indexSet->_indexSetFlags & 2) != 0)
    {
      NSUInteger v18 = indexSet->_internal._singleRange._range.location;
    }
    else
    {
      NSUInteger v24 = [(NSIndexSet *)indexSet lastIndex];
      if (v24 != 0x7FFFFFFFFFFFFFFFLL && v24 > 0x3F)
      {
        NSUInteger v18 = 0;
        char v25 = 0;
        goto LABEL_40;
      }
      uint64_t v28 = 0;
      unint64_t v29 = 0;
      NSUInteger v18 = 0;
      $A8859644891BA8F5A580113D622AC538 v30 = indexSet->_indexSetFlags;
      p_internal = &indexSet->_internal;
      unint64_t v32 = ($228E88DFACDD67E146FBAE62E08A49BD *)(&indexSet->_internal._singleBitfield + 1);
      if ((*(unsigned char *)&v30 & 2) != 0) {
        unint64_t v32 = &indexSet->_internal;
      }
      while (1)
      {
        uint64_t v33 = v32;
        if ((*(unsigned char *)&v30 & 3) == 0) {
          uint64_t v33 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location + 8);
        }
        NSUInteger v34 = v33->_singleRange._range.location;
        unint64_t v35 = v33->_singleRange._range.location != 0;
        if ((*(unsigned char *)&v30 & 1) == 0 && v34) {
          unint64_t v35 = *(void *)(p_internal->_singleRange._range.location + 8);
        }
        if (v29 >= v35) {
          break;
        }
        unint64_t v36 = &indexSet->_internal;
        if ((*(unsigned char *)&v30 & 1) == 0) {
          unint64_t v36 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
        }
                                                    + 16 * *(void *)(p_internal->_singleRange._range.location + 24)
                                                    + 64);
        pthread_t v37 = &v36[v28];
        NSUInteger v39 = v37->_singleRange._range.location;
        NSUInteger length = v37->_singleRange._range.length;
        unint64_t v40 = 0xFFFFFFFFFFFFFFFFLL >> -(char)length << v39;
        if (length) {
          unint64_t v41 = v40;
        }
        else {
          unint64_t v41 = 0;
        }
        v18 |= v41;
        ++v29;
        ++v28;
      }
    }
LABEL_39:
    char v25 = 1;
LABEL_40:
    if (location == v18) {
      char v10 = v25;
    }
    else {
      char v10 = 0;
    }
    return v10 & 1;
  }
  if (((unint64_t)indexSet & 0x8000000000000000) != 0)
  {
    uint64_t v20 = *MEMORY[0x1E4FBA8E0];
    if ((~(unint64_t)indexSet & 0xC000000000000007) == 0) {
      uint64_t v20 = 0;
    }
    unint64_t v21 = v20 ^ (unint64_t)indexSet;
    uint64_t v22 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v21 & 7) == 0) {
      uint64_t v22 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger v23 = v22 & (v21 >> 3);
    goto LABEL_61;
  }
  $A8859644891BA8F5A580113D622AC538 v26 = indexSet->_indexSetFlags;
  if ((*(unsigned char *)&v26 & 2) != 0)
  {
    NSUInteger v23 = indexSet->_internal._singleRange._range.location;
LABEL_61:
    NSUInteger v42 = [(NSIndexSet *)self lastIndex];
    BOOL v43 = v42 != 0x7FFFFFFFFFFFFFFFLL && v42 >= 0x40;
    int v44 = !v43;
    if (v44 == 1)
    {
      uint64_t v45 = 0;
      unint64_t v46 = 0;
      uint64_t v47 = 0;
      $A8859644891BA8F5A580113D622AC538 v48 = self->_indexSetFlags;
      $A8859644891BA8F5A580113D622AC538 v49 = &self->_internal;
      uint64_t v50 = ($228E88DFACDD67E146FBAE62E08A49BD *)(&self->_internal._singleBitfield + 1);
      if ((*(unsigned char *)&v48 & 2) != 0) {
        uint64_t v50 = &self->_internal;
      }
      while (1)
      {
        NSUInteger v51 = v50;
        if ((*(unsigned char *)&v48 & 3) == 0) {
          NSUInteger v51 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v49->_singleRange._range.location + 8);
        }
        NSUInteger v52 = v51->_singleRange._range.location;
        unint64_t v53 = v51->_singleRange._range.location != 0;
        if ((*(unsigned char *)&v48 & 1) == 0 && v52) {
          unint64_t v53 = *(void *)(v49->_singleRange._range.location + 8);
        }
        if (v46 >= v53) {
          break;
        }
        unint64_t v54 = &self->_internal;
        if ((*(unsigned char *)&v48 & 1) == 0) {
          unint64_t v54 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v49->_singleRange._range.location
        }
                                                    + 16 * *(void *)(v49->_singleRange._range.location + 24)
                                                    + 64);
        unint64_t v55 = &v54[v45];
        NSUInteger v56 = v55->_singleRange._range.location;
        NSUInteger v57 = v55->_singleRange._range.length;
        unint64_t v58 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v57 << v56;
        if (v57) {
          unint64_t v59 = v58;
        }
        else {
          unint64_t v59 = 0;
        }
        v47 |= v59;
        ++v46;
        ++v45;
      }
    }
    else
    {
      uint64_t v47 = 0;
    }
    if (v47 == v23) {
      char v10 = v44;
    }
    else {
      char v10 = 0;
    }
    return v10 & 1;
  }
  if (*(unsigned char *)&indexSetFlags) {
    uint64_t v27 = self->_internal._singleRange._range.length != 0;
  }
  else {
    uint64_t v27 = *(void *)(self->_internal._singleRange._range.location + 8);
  }
  if (*(unsigned char *)&v26) {
    uint64_t v60 = indexSet->_internal._singleRange._range.length != 0;
  }
  else {
    uint64_t v60 = *(void *)(indexSet->_internal._singleRange._range.location + 8);
  }
  if (v27 != v60) {
    goto LABEL_117;
  }
  if (_isEmpty((uint64_t)self))
  {
    unint64_t bitfield = 0;
  }
  else
  {
    v62 = (*(unsigned char *)&indexSetFlags & 1) != 0
        ? &self->_internal._singleBitfield + 1
        : ($246AE1437D6384FE1219915B69C5C0EF *)(self->_internal._singleRange._range.location + 16);
    unint64_t bitfield = v62->_bitfield;
  }
  if (_isEmpty((uint64_t)indexSet))
  {
    unint64_t v63 = 0;
  }
  else
  {
    unint64_t v64 = (*(unsigned char *)&v26 & 1) != 0
        ? &indexSet->_internal._singleBitfield + 1
        : ($246AE1437D6384FE1219915B69C5C0EF *)(indexSet->_internal._singleRange._range.location + 16);
    unint64_t v63 = v64->_bitfield;
  }
  if (bitfield != v63) {
    goto LABEL_117;
  }
  v65 = &self->_internal;
  if ((*(unsigned char *)&indexSetFlags & 1) == 0) {
    v65 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v65->_singleRange._range.location
  }
                                              + 16 * *(void *)(v65->_singleRange._range.location + 24)
                                              + 64);
  v66 = &indexSet->_internal;
  if ((*(unsigned char *)&v26 & 1) == 0) {
    v66 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v66->_singleRange._range.location
  }
                                              + 16 * *(void *)(v66->_singleRange._range.location + 24)
                                              + 64);
  if (!v27) {
    goto LABEL_116;
  }
  uint64_t v67 = v27 - 1;
  do
  {
    int64x2_t v68 = *(int64x2_t *)v65++;
    int64x2_t v69 = v68;
    int64x2_t v70 = *(int64x2_t *)v66++;
    int32x2_t v71 = vmovn_s64(vceqq_s64(v69, v70));
    char v10 = v71.i8[0] & v71.i8[4];
    BOOL v43 = v67-- != 0;
    char v72 = v43;
  }
  while ((v71.i8[0] & v71.i8[4] & 1) != 0 && (v72 & 1) != 0);
  return v10 & 1;
}

- (void)enumerateIndexesWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  if ((opts & 2) != 0) {
    NSEnumerationOptions v6 = opts & 0xFFFFFFFFFFFFFFFELL;
  }
  else {
    NSEnumerationOptions v6 = opts;
  }
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, v6, 0, 0x7FFFFFFFFFFFFFFFLL);

  __NSIndexSetEnumerate((uint64_t)self, v6, 0, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)block);
}

- (BOOL)intersectsIndexesInRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    uint64_t v6 = *MEMORY[0x1E4FBA8E0];
    if ((~(unint64_t)self & 0xC000000000000007) == 0) {
      uint64_t v6 = 0;
    }
    unint64_t v7 = v6 ^ (unint64_t)self;
    uint64_t v8 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v7 & 7) == 0) {
      uint64_t v8 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger v9 = v8 & (v7 >> 3);
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_indexSetFlags & 2) != 0)
  {
    NSUInteger v9 = self->_internal._singleRange._range.location;
LABEL_19:
    NSUInteger v15 = range.location + range.length;
    if (range.location + range.length >= 0x40) {
      NSUInteger v15 = 64;
    }
    NSUInteger v16 = v15 - range.location;
    if (range.location <= 0x3F) {
      char v17 = range.location;
    }
    else {
      char v17 = 0;
    }
    if (range.location > 0x3F) {
      NSUInteger v16 = 0;
    }
    unint64_t v18 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v16 << v17;
    if (v16) {
      unint64_t v19 = v18;
    }
    else {
      unint64_t v19 = 0;
    }
    return (v19 & v9) != 0;
  }
  if (!range.length) {
    return 0;
  }
  unint64_t v10 = [(NSIndexSet *)self _indexOfRangeBeforeOrContainingIndex:range.location];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    p_internal = &self->_internal;
    if ((*(unsigned char *)&self->_indexSetFlags & 1) == 0) {
      p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
    }
                                                       + 16
                                                       * *(void *)(p_internal->_singleRange._range.location + 24)
                                                       + 64);
    if (p_internal[v10]._singleRange._range.location + p_internal[v10]._singleRange._range.length - 1 >= location) {
      return 1;
    }
  }
  unint64_t v12 = [(NSIndexSet *)self _indexOfRangeAfterOrContainingIndex:location];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v13 = &self->_internal;
  if ((*(unsigned char *)&self->_indexSetFlags & 1) == 0) {
    uint64_t v13 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v13->_singleRange._range.location
  }
                                              + 16 * *(void *)(v13->_singleRange._range.location + 24)
                                              + 64);
  return location + length - 1 >= v13[v12]._singleRange._range.location;
}

+ (NSIndexSet)indexSetWithIndexes:(const unint64_t *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    uint64_t v5 = 0;
    unint64_t v6 = a4 - 1;
    while (1)
    {
      unint64_t v7 = a3[v6];
      if (v7 > 0x3F)
      {
        if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          NSUInteger v9 = (void *)[objc_alloc((Class)a1) initWithIndexes:a3 count:a4];
          return (NSIndexSet *)v9;
        }
      }
      else
      {
        v5 |= 1 << v7;
      }
      if (--v6 == -1)
      {
        return (NSIndexSet *)[a1 indexSetWithBitfield:v5];
      }
    }
  }

  return (NSIndexSet *)objc_msgSend(a1, "indexSet", a3);
}

- (NSIndexSet)initWithIndexes:(const unint64_t *)a3 count:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v6 = 0;
    unint64_t v7 = a4 - 1;
    while (1)
    {
      unint64_t v8 = a3[v7];
      if (v8 > 0x3F)
      {
        if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v10 = _NSGroupIndexesIntoSimpleRanges((uint64_t *)a3, a4);
          uint64_t v11 = objc_alloc_init(NSMutableIndexSet);
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v19 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v21;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v21 != v14) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v16 = [*(id *)(*((void *)&v20 + 1) + 8 * v15) rangeValue];
                -[NSMutableIndexSet addIndexesInRange:](v11, "addIndexesInRange:", v16, v17);
                ++v15;
              }
              while (v13 != v15);
              uint64_t v13 = [v10 countByEnumeratingWithState:&v20 objects:v19 count:16];
            }
            while (v13);
          }
          unint64_t v18 = [(NSIndexSet *)self initWithIndexSet:v11];

          return v18;
        }
      }
      else
      {
        v6 |= 1 << v8;
      }
      if (--v7 == -1) {
        goto LABEL_9;
      }
    }
  }
  uint64_t v6 = 0;
LABEL_9:

  return [(NSIndexSet *)self initWithBitfield:v6];
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

void *__43__NSIndexSet__indexOfRangeContainingIndex___block_invoke(void *result, unint64_t a2, unint64_t a3, unsigned char *a4)
{
  unint64_t v4 = result[6];
  if (v4 >= a2 && v4 - a2 < a3)
  {
    *(void *)(*(void *)(result[4] + 8) + 24) = *(void *)(*(void *)(result[5] + 8) + 24);
LABEL_7:
    *a4 = 1;
    goto LABEL_8;
  }
  if (v4 < a2) {
    goto LABEL_7;
  }
LABEL_8:
  ++*(void *)(*(void *)(result[5] + 8) + 24);
  return result;
}

void *__51__NSIndexSet__indexOfRangeBeforeOrContainingIndex___block_invoke(void *result, unint64_t a2, unint64_t a3, unsigned char *a4)
{
  unint64_t v4 = result[6];
  if (v4 >= a2 && v4 - a2 < a3)
  {
    *(void *)(*(void *)(result[4] + 8) + 24) = *(void *)(*(void *)(result[5] + 8) + 24);
LABEL_9:
    *a4 = 1;
    goto LABEL_10;
  }
  if (a2 + a3 >= v4)
  {
    if (v4 < a2) {
      goto LABEL_9;
    }
  }
  else
  {
    *(void *)(*(void *)(result[4] + 8) + 24) = *(void *)(*(void *)(result[5] + 8) + 24);
  }
LABEL_10:
  ++*(void *)(*(void *)(result[5] + 8) + 24);
  return result;
}

void *__50__NSIndexSet__indexOfRangeAfterOrContainingIndex___block_invoke(void *result, unint64_t a2, unint64_t a3, unsigned char *a4)
{
  unint64_t v4 = result[6];
  BOOL v5 = v4 - a2 < a3 && v4 >= a2;
  if (v4 < a2 || v5)
  {
    *(void *)(*(void *)(result[4] + 8) + 24) = *(void *)(*(void *)(result[5] + 8) + 24);
    *a4 = 1;
  }
  ++*(void *)(*(void *)(result[5] + 8) + 24);
  return result;
}

- (NSUInteger)indexGreaterThanOrEqualToIndex:(NSUInteger)value
{
  return -[NSIndexSet _indexClosestToIndex:equalAllowed:following:]((uint64_t)self, value, 1, 1);
}

- (NSUInteger)indexLessThanOrEqualToIndex:(NSUInteger)value
{
  return -[NSIndexSet _indexClosestToIndex:equalAllowed:following:]((uint64_t)self, value, 1, 0);
}

- (NSUInteger)getIndexes:(NSUInteger *)indexBuffer maxCount:(NSUInteger)bufferSize inIndexRange:(NSRangePointer)range
{
  if (!bufferSize || ![(NSIndexSet *)self count]) {
    return 0;
  }
  if (range)
  {
    NSUInteger length = range->length;
    if (!length) {
      return 0;
    }
    NSUInteger location = range->location;
    NSUInteger v11 = length + range->location - 1;
  }
  else
  {
    NSUInteger location = [(NSIndexSet *)self firstIndex];
    NSUInteger v11 = [(NSIndexSet *)self lastIndex];
  }
  if (v11 < location) {
    return 0;
  }
  if (((unint64_t)self & 0x8000000000000000) == 0)
  {
    $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
    if ((*(unsigned char *)&indexSetFlags & 2) != 0)
    {
      NSUInteger v15 = self->_internal._singleRange._range.location;
      goto LABEL_24;
    }
    if ((*(unsigned char *)&indexSetFlags & 1) != 0
      || (uint64_t v17 = (_opaque_pthread_t *)atomic_load((unint64_t *)(self->_internal._singleRange._range.location + 56)),
          pthread_self() != v17)
      || (NSUInteger v18 = self->_internal._singleRange._range.location, *(void *)(v18 + 32) != location)
      || (unint64_t v19 = *(void *)(v18 + 40), v19 == 0x7FFFFFFFFFFFFFFFLL))
    {
      unint64_t v19 = [(NSIndexSet *)self _indexOfRangeAfterOrContainingIndex:location];
      if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
        return 0;
      }
    }
    $A8859644891BA8F5A580113D622AC538 v20 = self->_indexSetFlags;
    if ((*(unsigned char *)&v20 & 2) != 0)
    {
      p_internal = &self->_internal;
      BOOL v22 = (*(_DWORD *)&self->_indexSetFlags & 1) == 0;
    }
    else
    {
      if (*(unsigned char *)&v20)
      {
        unint64_t v32 = self->_internal._singleRange._range.length != 0;
        goto LABEL_46;
      }
      p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(self->_internal._singleRange._range.location + 8);
      BOOL v22 = 1;
    }
    if (p_internal->_singleRange._range.location)
    {
      if (v22)
      {
        NSUInteger v31 = self->_internal._singleRange._range.location;
        unint64_t v32 = *(void *)(v31 + 8);
LABEL_42:
        uint64_t v33 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v31 + 16 * *(void *)(v31 + 24) + 64);
        goto LABEL_47;
      }
      unint64_t v32 = 1;
    }
    else
    {
      if (v22)
      {
        unint64_t v32 = 0;
        NSUInteger v31 = self->_internal._singleRange._range.location;
        goto LABEL_42;
      }
      unint64_t v32 = 0;
    }
LABEL_46:
    uint64_t v33 = &self->_internal;
LABEL_47:
    if (v19 < v32)
    {
      NSUInteger v34 = 0;
      NSUInteger v23 = 0;
      do
      {
        unint64_t v35 = &v33[v19];
        NSUInteger v36 = v35->_singleRange._range.location;
        NSUInteger v37 = v35->_singleRange._range.length;
        if (v35->_singleRange._range.location <= location) {
          NSUInteger v38 = location;
        }
        else {
          NSUInteger v38 = v35->_singleRange._range.location;
        }
        BOOL v41 = location >= v36;
        NSUInteger v39 = location - v36;
        if (v41) {
          NSUInteger v34 = v39;
        }
        BOOL v40 = v34 < v37;
        BOOL v41 = v38 > v11 || v34 >= v37;
        if (!v41)
        {
          do
          {
            indexBuffer[v23++] = v38++;
            BOOL v40 = ++v34 < v37;
          }
          while (v38 <= v11 && v23 < bufferSize && v34 < v37);
        }
        v19 += !v40;
        if (!v40) {
          NSUInteger v34 = 0;
        }
      }
      while (v38 <= v11 && v19 < v32 && v23 < bufferSize);
      if (v23)
      {
        if (range)
        {
          NSUInteger v44 = indexBuffer[v23 - 1] - location + 1;
          NSUInteger v45 = v44 + range->location;
          NSUInteger v46 = range->length - v44;
          range->NSUInteger location = v45;
          range->NSUInteger length = v46;
        }
        if (v19 < v32 && (*(_DWORD *)&self->_indexSetFlags & 1) == 0)
        {
          $A8859644891BA8F5A580113D622AC538 v48 = &v33[v19];
          NSUInteger v49 = indexBuffer[v23 - 1];
          NSUInteger v50 = v49 - v48->_singleRange._range.location;
          if (v50 < v48->_singleRange._range.length)
          {
            pthread_t v51 = pthread_self();
            unint64_t v52 = atomic_load((unint64_t *)(self->_internal._singleRange._range.location + 56));
            if (v51 == (pthread_t)v52
              || (uint64_t v53 = 0,
                  atomic_compare_exchange_strong((atomic_ullong *volatile)(self->_internal._singleRange._range.location + 56), (unint64_t *)&v53, (unint64_t)v51), !v53))
            {
              *(void *)(self->_internal._singleRange._range.location + 40) = v19;
              *(void *)(self->_internal._singleRange._range.location + 48) = v50;
              *(void *)(self->_internal._singleRange._range.location + 32) = v49;
            }
          }
        }
      }
      return v23;
    }
    return 0;
  }
  uint64_t v12 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    uint64_t v12 = 0;
  }
  unint64_t v13 = v12 ^ (unint64_t)self;
  uint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v13 & 7) == 0) {
    uint64_t v14 = 0xFFFFFFFFFFFFFLL;
  }
  NSUInteger v15 = v14 & (v13 >> 3);
LABEL_24:
  if (location > 0x3F) {
    return 0;
  }
  NSUInteger v23 = 0;
  unint64_t v24 = 63;
  if (v11 < 0x3F) {
    unint64_t v24 = v11;
  }
  unint64_t v25 = location;
  while (v25 <= 0x3F)
  {
    unint64_t v26 = (-1 << v25) & v15;
    if (!v26) {
      break;
    }
    unint64_t v27 = __clz(__rbit64(v26));
    if (v24 < v27) {
      break;
    }
    unint64_t v25 = v27 + 1;
    indexBuffer[v23++] = v27;
    if (bufferSize == v23)
    {
      NSUInteger v23 = bufferSize;
      break;
    }
  }
  if (range && v23)
  {
    NSUInteger v28 = indexBuffer[v23 - 1] - location + 1;
    NSUInteger v29 = v28 + range->location;
    NSUInteger v30 = range->length - v28;
    range->NSUInteger location = v29;
    range->NSUInteger length = v30;
  }
  return v23;
}

- (unint64_t)__getContainmentVector:(BOOL *)a3 inRange:(_NSRange)a4
{
  size_t length = a4.length;
  NSUInteger location = a4.location;
  v17[2] = *MEMORY[0x1E4F143B8];
  if (a4.length >= 0x101) {
    int v8 = 1;
  }
  else {
    int v8 = 256;
  }
  NSUInteger v9 = (char *)&v17[-1] - ((8 * v8 + 15) & 0xFFFFFFF0);
  id v10 = v9;
  if (a4.length >= 0x101) {
    id v10 = (char *)malloc_type_malloc(8 * a4.length, 0x100004000313F17uLL);
  }
  v17[0] = location;
  v17[1] = length;
  unint64_t v11 = [(NSIndexSet *)self getIndexes:v10 maxCount:length inIndexRange:v17];
  bzero(a3, length);
  if (v11)
  {
    uint64_t v12 = v10;
    unint64_t v13 = v11;
    do
    {
      uint64_t v14 = *(void *)v12;
      v12 += 8;
      a3[v14 - location] = 1;
      --v13;
    }
    while (v13);
  }
  if (v10 != v9) {
    free(v10);
  }
  return v11;
}

- (id)_numberEnumerator
{
  uint64_t v2 = [[_NSIndexSetEnumerator alloc] initWithIndexSet:self];

  return v2;
}

- (id)description
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[NSMutableString stringWithCapacity:128];
  v12.receiver = self;
  v12.super_class = (Class)NSIndexSet;
  [(NSMutableString *)v3 appendString:[(NSIndexSet *)&v12 description]];
  NSUInteger v4 = [(NSIndexSet *)self count];
  if (v4)
  {
    NSUInteger v5 = v4;
    unint64_t v6 = [(NSIndexSet *)self rangeCount];
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"[number of indexes: %lu (in %lu ranges), indexes: ("), v5, v6;
    if (v6)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (i) {
          [(NSMutableString *)v3 appendString:@" "];
        }
        uint64_t v8 = [(NSIndexSet *)self rangeAtIndex:i];
        unint64_t v10 = v9;
        [(NSMutableString *)v3 appendFormat:@"%lu", v8];
        if (v10 >= 2) {
          [(NSMutableString *)v3 appendFormat:@"-%lu", v10 + v8 - 1];
        }
      }
    }
    [(NSMutableString *)v3 appendString:@"]"]);
  }
  else
  {
    [(NSMutableString *)v3 appendFormat:@"(no indexes)"];
  }
  return v3;
}

- (void)enumerateIndexesInRange:(NSRange)range options:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSEnumerationOptions v9 = opts & 0xF7FFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v9 = opts;
  }
  uint64_t v10 = v9 | 0x800000000000000;
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, v9 | 0x800000000000000, range.location, range.length);

  __NSIndexSetEnumerate((uint64_t)self, v10, location, length, (uint64_t)block);
}

- (NSUInteger)indexPassingTest:(void *)predicate
{
  return [(NSIndexSet *)self indexWithOptions:0 passingTest:predicate];
}

- (NSUInteger)indexWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  NSEnumerationOptions v6 = opts & 0xDFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v6 = opts;
  }
  uint64_t v7 = v6 | 0x2000000000000000;
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v6 | 0x2000000000000000, 0, 0x7FFFFFFFFFFFFFFFLL);

  return __NSIndexSetEnumerate((uint64_t)self, v7, 0, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)predicate);
}

- (NSUInteger)indexInRange:(NSRange)range options:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSEnumerationOptions v9 = opts & 0xD7FFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v9 = opts;
  }
  uint64_t v10 = v9 | 0x2800000000000000;
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v9 | 0x2800000000000000, range.location, range.length);

  return __NSIndexSetEnumerate((uint64_t)self, v10, location, length, (uint64_t)predicate);
}

- (NSIndexSet)indexesInRange:(NSRange)range options:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  NSEnumerationOptions v9 = opts & 0xF7FFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v9 = opts;
  }
  uint64_t v10 = v9 | 0x800000000000000;
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v9 | 0x800000000000000, range.location, range.length);
  uint64_t v22 = 0;
  NSUInteger v23 = &v22;
  uint64_t v24 = 0x3052000000;
  unint64_t v25 = __Block_byref_object_copy__6;
  unint64_t v26 = __Block_byref_object_dispose__6;
  uint64_t v27 = 0;
  uint64_t v18 = 0;
  unint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  int v17 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __49__NSIndexSet_indexesInRange_options_passingTest___block_invoke;
  v16[3] = &unk_1E51F8560;
  void v16[4] = predicate;
  v16[5] = &v18;
  v16[6] = &v22;
  void v16[7] = &v17;
  __NSIndexSetEnumerate((uint64_t)self, v10, location, length, (uint64_t)v16);
  unint64_t v11 = (void *)v23[5];
  if (v11)
  {
    objc_super v12 = (void *)[v11 copy];

    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = +[NSIndexSet indexSetWithBitfield:v19[3]];
  }
  uint64_t v14 = v13;
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v14;
}

void __49__NSIndexSet_indexesInRange_options_passingTest___block_invoke(uint64_t a1, unint64_t a2)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 56));
    if (a2 > 0x3F)
    {
      NSUInteger v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (!v4)
      {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [(NSIndexSet *)[NSMutableIndexSet alloc] initWithBitfield:*(void *)(*(void *)(*(void *)(a1 + 40)+ 8)+ 24)];
        NSUInteger v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
      [v4 addIndex:a2];
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 1 << a2;
    }
    NSUInteger v5 = *(os_unfair_lock_s **)(a1 + 56);
    os_unfair_lock_unlock(v5);
  }
}

- (void)enumerateRangesInRange:(NSRange)range options:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSEnumerationOptions v9 = opts & 0xBFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v9 = opts;
  }
  uint64_t v10 = v9 | 0x4000000000000000;
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, v9 | 0x4000000000000000, range.location, range.length);

  __NSIndexSetEnumerate((uint64_t)self, v10, location, length, (uint64_t)block);
}

- (unint64_t)_indexAtIndex:(unint64_t)a3
{
  unint64_t result = [(NSIndexSet *)self firstIndex];
  while (a3)
  {
    --a3;
    unint64_t result = [(NSIndexSet *)self indexGreaterThanIndex:result];
  }
  return result;
}

- (id)replacementObjectForPortCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 isByref])
  {
    v6.receiver = self;
    v6.super_class = (Class)NSIndexSet;
    return [(NSIndexSet *)&v6 replacementObjectForPortCoder:a3];
  }
  return self;
}

@end