@interface NSEnumerator(BLSPeeking)
- (BLSPeekingEnumerator)peekingEnumerator;
@end

@implementation NSEnumerator(BLSPeeking)

- (BLSPeekingEnumerator)peekingEnumerator
{
  return +[BLSPeekingEnumerator peekingEnumeratorWithEnumerator:a1];
}

@end