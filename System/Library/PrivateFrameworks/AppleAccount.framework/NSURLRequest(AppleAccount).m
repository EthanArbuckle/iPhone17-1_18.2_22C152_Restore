@interface NSURLRequest(AppleAccount)
- (id)aa_HTTPBody;
@end

@implementation NSURLRequest(AppleAccount)

- (id)aa_HTTPBody
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [a1 HTTPBody];
  v3 = (void *)[v2 copy];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v5 = [a1 HTTPBodyStream];
    if (v5)
    {
      v6 = [a1 valueForHTTPHeaderField:@"Content-Length"];
      uint64_t v7 = [v6 integerValue];

      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v7];
      [v5 open];
      if ([v5 hasBytesAvailable])
      {
        do
          objc_msgSend(v8, "appendBytes:length:", v10, objc_msgSend(v5, "read:maxLength:", v10, 1024));
        while (([v5 hasBytesAvailable] & 1) != 0);
      }
      [v5 close];
      id v4 = (id)[v8 copy];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

@end