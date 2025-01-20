@interface NSFrameworkHandleForLibrarianSymbols
@end

@implementation NSFrameworkHandleForLibrarianSymbols

void *___NSFrameworkHandleForLibrarianSymbols_block_invoke()
{
  result = dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 256);
  qword_1EB1ECE20 = (uint64_t)result;
  return result;
}

@end