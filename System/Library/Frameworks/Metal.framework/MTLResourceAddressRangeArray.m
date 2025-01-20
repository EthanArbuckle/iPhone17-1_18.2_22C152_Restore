@interface MTLResourceAddressRangeArray
- (BOOL)isEqual:(id)a3;
- (MTLAddressRange)ranges;
- (MTLResourceAddressRangeArray)initWithCount:(unint64_t)a3;
- (MTLResourceAddressRangeArray)initWithRanges:(MTLAddressRange *)a3 count:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation MTLResourceAddressRangeArray

- (MTLResourceAddressRangeArray)initWithCount:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MTLResourceAddressRangeArray;
  v4 = [(MTLResourceAddressRangeArray *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_count = a3;
    v6 = (MTLAddressRange *)malloc_type_calloc(0x10uLL, a3, 0x7174F589uLL);
    v5->_ranges = v6;
    if (!v6)
    {

      return 0;
    }
  }
  return v5;
}

- (MTLResourceAddressRangeArray)initWithRanges:(MTLAddressRange *)a3 count:(unint64_t)a4
{
  v6 = [(MTLResourceAddressRangeArray *)self initWithCount:a4];
  v7 = v6;
  if (v6) {
    memcpy(v6->_ranges, a3, 16 * a4);
  }
  return v7;
}

- (void)dealloc
{
  free(self->_ranges);
  self->_ranges = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLResourceAddressRangeArray;
  [(MTLResourceAddressRangeArray *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (a3)
  {
    Class = object_getClass(self);
    if (Class == object_getClass(a3))
    {
      unint64_t count = self->_count;
      if (count == [a3 count]) {
        return memcmp(self->_ranges, (const void *)[a3 ranges], 16 * self->_count) == 0;
      }
    }
  }
  return 0;
}

- (unint64_t)hash
{
  return _MTLHashState((int *)self->_ranges, 16 * self->_count);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[MTLResourceAddressRangeArray allocWithZone:a3];
  unint64_t count = self->_count;
  ranges = self->_ranges;

  return [(MTLResourceAddressRangeArray *)v4 initWithRanges:ranges count:count];
}

- (id)description
{
  return [(MTLResourceAddressRangeArray *)self formattedDescription:0];
}

- (id)formattedDescription:(unint64_t)a3
{
  v15[9] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v6 = [@"\n" stringByPaddingToLength:a3 + 8 withString:@" " startingAtIndex:0];
  v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:self->_count];
  if (self->_count)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"{ address = %p, length: %llu }", self->_ranges[v8].var0, self->_ranges[v8].var1)];
      ++v9;
      ++v8;
    }
    while (v9 < self->_count);
  }
  uint64_t v10 = [v7 componentsJoinedByString:v6];
  v11 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)MTLResourceAddressRangeArray;
  id v12 = [(MTLResourceAddressRangeArray *)&v14 description];
  v15[0] = v5;
  v15[1] = @"count =";
  v15[2] = [NSNumber numberWithUnsignedInteger:self->_count];
  v15[3] = v5;
  v15[4] = @"ranges = {";
  v15[5] = v6;
  v15[6] = v10;
  v15[7] = v5;
  v15[8] = @"}";
  return (id)[v11 stringWithFormat:@"%@%@", v12, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 9), "componentsJoinedByString:", @" "];
}

- (MTLAddressRange)ranges
{
  return self->_ranges;
}

- (unint64_t)count
{
  return self->_count;
}

@end