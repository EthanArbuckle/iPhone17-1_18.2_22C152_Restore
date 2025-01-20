@interface NSString(SHA1Base62)
- (id)je_SHA1Base62String;
@end

@implementation NSString(SHA1Base62)

- (id)je_SHA1Base62String
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v1 = [a1 dataUsingEncoding:4];
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
    CC_SHA1((const void *)[v3 bytes], objc_msgSend(v3, "length"), md);
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:md];
    v5 = objc_msgSend(v4, "je_base62String");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end