@interface NSArray
- (unint64_t)ntk_indexOfFirstObjectPassingTest:(id)a3;
@end

@implementation NSArray

- (unint64_t)ntk_indexOfFirstObjectPassingTest:(id)a3
{
  v4 = (uint64_t (**)(id, void *))a3;
  NSUInteger v5 = [(NSArray *)self count];
  if (v5)
  {
    NSUInteger v6 = v5;
    unint64_t v7 = 0;
    while (1)
    {
      v8 = [(NSArray *)self objectAtIndexedSubscript:v7];
      char v9 = v4[2](v4, v8);

      if (v9) {
        break;
      }
      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

@end