@interface _NSPlaceholderIndexSet
- (_NSPlaceholderIndexSet)init;
- (_NSPlaceholderIndexSet)initWithBitfield:(unint64_t)a3;
- (_NSPlaceholderIndexSet)initWithCoder:(id)a3;
- (_NSPlaceholderIndexSet)initWithIndex:(unint64_t)a3;
- (_NSPlaceholderIndexSet)initWithIndexSet:(id)a3;
- (_NSPlaceholderIndexSet)initWithIndexesInRange:(_NSRange)a3;
- (unint64_t)retainCount;
@end

@implementation _NSPlaceholderIndexSet

- (_NSPlaceholderIndexSet)initWithCoder:(id)a3
{
  id v4 = +[NSIndexSet _alloc];

  return (_NSPlaceholderIndexSet *)[v4 initWithCoder:a3];
}

- (_NSPlaceholderIndexSet)initWithIndexSet:(id)a3
{
  v3 = (_NSPlaceholderIndexSet *)a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 count];
  if (_NSTaggedIndexSetAllowed == 1 && v5 == 0)
  {
    v3 = (_NSPlaceholderIndexSet *)0x8580000000000007;
    unint64_t v10 = *MEMORY[0x1E4FBA8E0] ^ 0x8580000000000007;
    if ((~v10 & 0xC000000000000007) != 0) {
      return (_NSPlaceholderIndexSet *)(v10 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v10 & 7)));
    }
    return v3;
  }
  uint64_t v7 = v5;
  if (v5 != 1)
  {
    v11 = (__objc2_class *)objc_opt_class();
    if (NSIndexSet == v11
      || _NSConstantIndexSet == v11
      || NSMutableIndexSet == v11)
    {
      v14[0] = 0;
      if ([(NSIndexSet *)v3 getBitfield:v14]) {
        return [(_NSPlaceholderIndexSet *)self initWithBitfield:v14[0]];
      }
    }
    v13 = (__objc2_class *)objc_opt_class();
    if (v13 != _NSConstantIndexSet && !v7)
    {
      self;
      return (_NSPlaceholderIndexSet *)&_NSEmptyIndexSet_struct;
    }
    if (v3 && v13 == _NSConstantIndexSet) {
      return v3;
    }
    return (_NSPlaceholderIndexSet *)objc_msgSend(+[NSIndexSet _alloc](NSIndexSet, "_alloc"), "initWithIndexSet:", v3);
  }
  uint64_t v8 = [(NSIndexSet *)v3 firstIndex];

  return [(_NSPlaceholderIndexSet *)self initWithIndex:v8];
}

- (_NSPlaceholderIndexSet)initWithBitfield:(unint64_t)a3
{
  if (_NSTaggedIndexSetAllowed != 1 || a3 && (__clz(a3) ^ 0x3C) > 0x33)
  {
    id v6 = +[NSIndexSet _alloc];
    return (_NSPlaceholderIndexSet *)[v6 initWithBitfield:a3];
  }
  else
  {
    result = (_NSPlaceholderIndexSet *)((8 * (a3 & 0xFFFFFFFFFFFFFLL)) | 0x8580000000000007);
    unint64_t v5 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
    if ((~v5 & 0xC000000000000007) != 0) {
      return (_NSPlaceholderIndexSet *)(v5 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v5 & 7)));
    }
  }
  return result;
}

- (_NSPlaceholderIndexSet)initWithIndex:(unint64_t)a3
{
  if (a3 > 0x3F) {
    return -[_NSPlaceholderIndexSet initWithIndexesInRange:](self, "initWithIndexesInRange:");
  }
  else {
    return [(_NSPlaceholderIndexSet *)self initWithBitfield:1 << a3];
  }
}

- (_NSPlaceholderIndexSet)initWithIndexesInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v5 = a3.location + a3.length;
  if (a3.length && (v5 & 0x8000000000000000) != 0)
  {
    v9 = _NSMethodExceptionProem((objc_class *)self, a2);
    v12.NSUInteger location = location;
    v12.NSUInteger length = length;
    unint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range %@ exceeds maximum index value of NSNotFound - 1", v9, NSStringFromRange(v12)), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  if (a3.length && (a3.location > 0x3F || v5 > 0x40 || v5 < a3.location))
  {
    self;
    if (length == 1 && location < 0xA)
    {
      return (_NSPlaceholderIndexSet *)(&_NSConstantIndexSets + 4 * location);
    }
    else
    {
      id v8 = +[NSIndexSet _alloc];
      return (_NSPlaceholderIndexSet *)objc_msgSend(v8, "initWithIndexesInRange:", location, length);
    }
  }
  else
  {
    if (a3.length) {
      unint64_t v6 = 0xFFFFFFFFFFFFFFFFLL >> -LOBYTE(a3.length) << SLOBYTE(a3.location);
    }
    else {
      unint64_t v6 = 0;
    }
    return [(_NSPlaceholderIndexSet *)self initWithBitfield:v6];
  }
}

- (_NSPlaceholderIndexSet)init
{
  if (_NSTaggedIndexSetAllowed != 1) {
    return -[_NSPlaceholderIndexSet initWithIndexesInRange:](self, "initWithIndexesInRange:", 0, 0);
  }
  result = (_NSPlaceholderIndexSet *)0x8580000000000007;
  unint64_t v3 = *MEMORY[0x1E4FBA8E0] ^ 0x8580000000000007;
  if ((~v3 & 0xC000000000000007) != 0) {
    return (_NSPlaceholderIndexSet *)(v3 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v3 & 7)));
  }
  return result;
}

- (unint64_t)retainCount
{
  return -1;
}

@end