@interface NSArray
@end

@implementation NSArray

uint64_t __44__NSArray_HFDebugging__hf_prettyDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_prettyDescription");
}

uint64_t __53__NSArray_HFDebugging__hf_prettyExpensiveDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_prettyExpensiveDescription");
}

uint64_t __48__NSArray_HFDebugging__hf_prettyFullDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_prettyFullDescription");
}

@end