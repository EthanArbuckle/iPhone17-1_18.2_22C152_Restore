@interface CPGenericVisitor
- (void)visitChunk:(id)a3;
@end

@implementation CPGenericVisitor

- (void)visitChunk:(id)a3
{
  int v5 = [a3 count];
  if (v5 >= 1)
  {
    int v6 = v5;
    uint64_t v7 = 0;
    do
    {
      objc_msgSend((id)objc_msgSend(a3, "childAtIndex:", v7), "accept:", self);
      uint64_t v7 = (v7 + 1);
    }
    while (v6 != v7);
  }
}

@end