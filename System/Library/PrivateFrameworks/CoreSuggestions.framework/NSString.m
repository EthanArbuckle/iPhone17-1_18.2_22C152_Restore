@interface NSString
@end

@implementation NSString

id __70__NSString_SGNSString__sg_dataEnumeratorUsingEncoding_nullTerminated___block_invoke()
{
  return self;
}

id __70__NSString_SGNSString__sg_dataEnumeratorUsingEncoding_nullTerminated___block_invoke_2()
{
  return self;
}

void __70__NSString_SGNSString__sg_dataEnumeratorUsingEncoding_nullTerminated___block_invoke_3(uint64_t a1, uint64_t a2, NSRange range1, unsigned char *a4)
{
  NSUInteger length = range1.length;
  NSUInteger location = range1.location;
  NSRange v15 = *(NSRange *)(a1 + 48);
  v14.NSUInteger location = location;
  v14.NSUInteger length = length;
  NSRange v9 = NSIntersectionRange(v14, v15);
  if (v9.length)
  {
    if (v9.length == *(void *)(a1 + 64))
    {
      [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
      *a4 = 1;
    }
    else
    {
      id v10 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __70__NSString_SGNSString__sg_dataEnumeratorUsingEncoding_nullTerminated___block_invoke_4;
      v12[3] = &unk_1E5B90018;
      id v13 = *(id *)(a1 + 40);
      v11 = (void *)[v10 initWithBytesNoCopy:a2 length:v9.length deallocator:v12];
      [*(id *)(a1 + 32) addObject:v11];
    }
  }
}

id __70__NSString_SGNSString__sg_dataEnumeratorUsingEncoding_nullTerminated___block_invoke_4()
{
  return self;
}

@end