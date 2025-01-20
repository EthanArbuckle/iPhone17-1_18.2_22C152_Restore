@interface NSURLRequest(AMSMockURLRequest)
- (id)body;
@end

@implementation NSURLRequest(AMSMockURLRequest)

- (id)body
{
  v2 = [a1 HTTPBodyStream];

  if (v2)
  {
    v3 = [a1 HTTPBodyStream];
    v4 = [MEMORY[0x1E4F1CA58] data];
    [v3 open];
    v5 = malloc_type_malloc(0x1000uLL, 0x26AE97E4uLL);
    if (!v5) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"Malloc Failure", @"Could not allocate %zu bytes to read HTTPBodyStream", 4096);
    }
    if ([v3 hasBytesAvailable])
    {
      do
      {
        uint64_t v6 = [v3 read:v5 maxLength:4096];
        if (v6 < 1)
        {
          if ((v6 & 0x8000000000000000) == 0) {
            break;
          }
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"StreamReadError", @"An error occurred while reading HTTPBodyStream (%ld)", v6);
        }
        else
        {
          v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v5 length:v6];
          [v4 appendData:v7];
        }
      }
      while (([v3 hasBytesAvailable] & 1) != 0);
    }
    free(v5);
    [v3 close];
  }
  else
  {
    v4 = [a1 HTTPBody];
  }
  return v4;
}

@end