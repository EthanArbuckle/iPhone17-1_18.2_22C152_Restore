@interface SGSlice
+ (id)sliceWithType:(id)a3 range:(_NSRange)a4;
+ (id)sliceWithType:(id)a3 start:(unint64_t)a4 end:(unint64_t)a5;
- ($201E9A47BE70A2B12CCA2F48B75AA2F7)type;
- (SGSlice)initWithType:(id)a3 range:(_NSRange)a4;
- (SGSlice)initWithType:(id)a3 start:(unint64_t)a4 end:(unint64_t)a5;
- (_NSRange)range;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)end;
- (unint64_t)start;
@end

@implementation SGSlice

- (unint64_t)end
{
  return self->_end;
}

- (unint64_t)start
{
  return self->_start;
}

- ($201E9A47BE70A2B12CCA2F48B75AA2F7)type
{
  return ($201E9A47BE70A2B12CCA2F48B75AA2F7)self->_type;
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<%s %lu-%lu>", categoryDescriptions[self->_type.category], self->_start, self->_end);
  return v2;
}

- (int64_t)compare:(id)a3
{
  v4 = a3;
  unint64_t start = self->_start;
  unint64_t v6 = v4[2];
  if (start < v6) {
    int64_t v7 = -1;
  }
  else {
    int64_t v7 = 1;
  }
  if (start == v6)
  {
    unint64_t end = self->_end;
    unint64_t v9 = v4[3];
    BOOL v10 = end >= v9;
    BOOL v11 = end == v9;
    uint64_t v12 = end > v9 ? 1 : v7;
    int64_t v7 = v10 ? v12 : -1;
    if (v11)
    {
      $1E121628F8A7D11AF7DA1A794335FF31 type = self->_type;
      unsigned int v14 = *((_DWORD *)v4 + 2);
      BOOL v15 = *(_DWORD *)&type >= v14;
      BOOL v16 = type == v14;
      if (*(_DWORD *)&type > v14) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = v7;
      }
      if (!v15) {
        uint64_t v17 = -1;
      }
      if (v16) {
        int64_t v7 = 0;
      }
      else {
        int64_t v7 = v17;
      }
    }
  }

  return v7;
}

- (_NSRange)range
{
  NSUInteger v2 = self->_end - self->_start;
  NSUInteger start = self->_start;
  result.length = v2;
  result.location = start;
  return result;
}

- (SGSlice)initWithType:(id)a3 range:(_NSRange)a4
{
  return [(SGSlice *)self initWithType:*(unsigned int *)&a3 start:a4.location end:a4.location + a4.length];
}

- (SGSlice)initWithType:(id)a3 start:(unint64_t)a4 end:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SGSlice;
  _NSRange result = [(SGSlice *)&v9 init];
  if (result)
  {
    result->_$1E121628F8A7D11AF7DA1A794335FF31 type = ($1E121628F8A7D11AF7DA1A794335FF31)a3;
    result->_NSUInteger start = a4;
    result->_unint64_t end = a5;
  }
  return result;
}

+ (id)sliceWithType:(id)a3 range:(_NSRange)a4
{
  v4 = -[SGSlice initWithType:range:]([SGSlice alloc], "initWithType:range:", *(unsigned int *)&a3, a4.location, a4.length);
  return v4;
}

+ (id)sliceWithType:(id)a3 start:(unint64_t)a4 end:(unint64_t)a5
{
  v5 = [[SGSlice alloc] initWithType:*(unsigned int *)&a3 start:a4 end:a5];
  return v5;
}

@end