@interface NSString(CUByteCodable)
+ (id)createWithBytesNoCopy:()CUByteCodable length:error:;
- (const)encodedBytesAndReturnLength:()CUByteCodable error:;
- (id)encodedDataAndReturnError:()CUByteCodable;
@end

@implementation NSString(CUByteCodable)

- (id)encodedDataAndReturnError:()CUByteCodable
{
  v4 = [a1 dataUsingEncoding:4];
  v11 = v4;
  if (v4)
  {
    id v12 = v4;
  }
  else if (a3)
  {
    NSErrorWithOSStatusF(4294960596, (uint64_t)"UTF-8 conversion failed", v5, v6, v7, v8, v9, v10, v14);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (const)encodedBytesAndReturnLength:()CUByteCodable error:
{
  uint64_t v6 = (const char *)[a1 UTF8String];
  v13 = v6;
  if (v6)
  {
    *a3 = strlen(v6);
  }
  else if (a4)
  {
    NSErrorWithOSStatusF(4294960596, (uint64_t)"UTF-8 conversion failed", v7, v8, v9, v10, v11, v12, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

+ (id)createWithBytesNoCopy:()CUByteCodable length:error:
{
  uint64_t v6 = (void *)[[NSString alloc] initWithBytesNoCopy:a3 length:a4 encoding:4 freeWhenDone:1];
  v13 = v6;
  if (v6)
  {
    id v14 = v6;
  }
  else if (a5)
  {
    NSErrorWithOSStatusF(4294960554, (uint64_t)"Bad UTF-8", v7, v8, v9, v10, v11, v12, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

@end