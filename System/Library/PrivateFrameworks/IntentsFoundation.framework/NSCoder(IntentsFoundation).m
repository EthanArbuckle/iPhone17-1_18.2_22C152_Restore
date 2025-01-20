@interface NSCoder(IntentsFoundation)
- (id)if_decodeBytesNoCopyForKey:()IntentsFoundation;
- (void)if_encodeBytesNoCopy:()IntentsFoundation forKey:;
@end

@implementation NSCoder(IntentsFoundation)

- (id)if_decodeBytesNoCopyForKey:()IntentsFoundation
{
  uint64_t v7 = 0;
  v3 = (void *)[a1 decodeBytesForKey:a3 returnedLength:&v7];
  if (v3)
  {
    v4 = v3;
    id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v3 = (void *)[v5 initWithBytesNoCopy:v4 length:v7 freeWhenDone:0];
  }
  return v3;
}

- (void)if_encodeBytesNoCopy:()IntentsFoundation forKey:
{
  if (a3)
  {
    id v6 = a3;
    id v10 = a4;
    id v7 = v6;
    uint64_t v8 = [v7 bytes];
    uint64_t v9 = [v7 length];

    [a1 encodeBytes:v8 length:v9 forKey:v10];
  }
}

@end