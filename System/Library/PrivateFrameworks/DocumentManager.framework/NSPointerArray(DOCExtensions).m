@interface NSPointerArray(DOCExtensions)
- (BOOL)doc_containsPointer:()DOCExtensions;
- (uint64_t)doc_indexOfPointer:()DOCExtensions;
@end

@implementation NSPointerArray(DOCExtensions)

- (BOOL)doc_containsPointer:()DOCExtensions
{
  return objc_msgSend(a1, "doc_indexOfPointer:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)doc_indexOfPointer:()DOCExtensions
{
  if (![a1 count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v5 = 0;
  while ([a1 pointerAtIndex:v5] != a3)
  {
    if (++v5 >= (unint64_t)[a1 count]) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v5;
}

@end