@interface NSMutableArray
- (void)shuffle;
@end

@implementation NSMutableArray

- (void)shuffle
{
  v3 = (char *)[(NSMutableArray *)self count];
  if ((unint64_t)v3 >= 2)
  {
    v4 = v3;
    uint64_t v5 = 0;
    do
    {
      [(NSMutableArray *)self exchangeObjectAtIndex:v5 withObjectAtIndex:v5 + arc4random_uniform((uint32_t)v4)];
      ++v5;
      --v4;
    }
    while (v4 != (unsigned char *)&dword_0 + 1);
  }
}

@end