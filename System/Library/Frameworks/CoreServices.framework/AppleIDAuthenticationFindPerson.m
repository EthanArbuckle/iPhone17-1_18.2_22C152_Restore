@interface AppleIDAuthenticationFindPerson
@end

@implementation AppleIDAuthenticationFindPerson

void ___AppleIDAuthenticationFindPerson_block_invoke(uint64_t a1, CFArrayRef theArray, int a3, const void *a4)
{
  if (theArray && (v8 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) != 0)
  {
    v11.length = CFArrayGetCount(theArray);
    v11.location = 0;
    CFArrayAppendArray(v8, theArray, v11);
  }
  else if (theArray)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, theArray);
  }
  if (a4 && *(void *)(a1 + 40))
  {
    CFRetain(a4);
    **(void **)(a1 + 40) = a4;
  }
  if (a3)
  {
    v9 = **(NSObject ***)(a1 + 48);
    dispatch_semaphore_signal(v9);
  }
}

@end