@interface NSObserver
@end

@implementation NSObserver

CFMutableSetRef __35____NSObserver_observerWithCenter___block_invoke()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  memset(&v1, 0, sizeof(v1));
  *(_OWORD *)&v1.retain = *(_OWORD *)(MEMORY[0x1E4F1D548] + 8);
  CFMutableSetRef result = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, &v1);
  qword_1EB1ECF88 = (uint64_t)result;
  return result;
}

@end