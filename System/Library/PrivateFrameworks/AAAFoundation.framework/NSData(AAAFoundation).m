@interface NSData(AAAFoundation)
+ (__CFData)aaf_fromImageRef:()AAAFoundation;
- (CFTypeRef)aaf_toImageRef;
- (id)aaf_toCompressedData:()AAAFoundation;
- (id)aaf_toHexString;
@end

@implementation NSData(AAAFoundation)

+ (__CFData)aaf_fromImageRef:()AAAFoundation
{
  Mutable = CFDataCreateMutable(0, 0);
  v5 = [(id)*MEMORY[0x1E4F44460] identifier];
  v6 = CGImageDestinationCreateWithData(Mutable, v5, 1uLL, 0);

  if (v6)
  {
    CGImageDestinationAddImage(v6, a3, 0);
    CGImageDestinationFinalize(v6);
    CFRelease(v6);
  }
  if ([(__CFData *)Mutable length]) {
    v7 = Mutable;
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (CFTypeRef)aaf_toImageRef
{
  v1 = CGImageSourceCreateWithData(a1, 0);
  if (!v1) {
    return 0;
  }
  v2 = v1;
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v1, 0, 0);
  CFRelease(v2);
  if (!ImageAtIndex) {
    return 0;
  }
  return CFAutorelease(ImageAtIndex);
}

- (id)aaf_toHexString
{
  uint64_t v2 = [a1 length];
  v3 = (unsigned __int8 *)[a1 bytes];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:2 * v2];
  if (v2 >= 1)
  {
    do
    {
      unsigned int v5 = *v3++;
      objc_msgSend(v4, "appendFormat:", @"%02X", v5);
      --v2;
    }
    while (v2);
  }
  v6 = (void *)[v4 copy];

  return v6;
}

- (id)aaf_toCompressedData:()AAAFoundation
{
  uint64_t v5 = [a1 length];
  if (v5 < 0)
  {
    v12 = _AAFLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NSData(AAAFoundation) aaf_toCompressedData:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_9;
  }
  size_t v6 = 2 * v5;
  v7 = (uint8_t *)malloc_type_malloc(2 * v5, 0xEE6310A0uLL);
  if (!v7)
  {
    v12 = _AAFLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NSData(AAAFoundation) aaf_toCompressedData:](v12, v20, v21, v22, v23, v24, v25, v26);
    }
LABEL_9:

    goto LABEL_10;
  }
  v8 = v7;
  id v9 = a1;
  size_t v10 = compression_encode_buffer(v8, v6, (const uint8_t *)[v9 bytes], objc_msgSend(v9, "length"), 0, a3);
  if (v10)
  {
    v11 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v8 length:v10 freeWhenDone:1];
    goto LABEL_11;
  }
  v28 = _AAFLogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[NSData(AAAFoundation) aaf_toCompressedData:](v28, v29, v30, v31, v32, v33, v34, v35);
  }

  free(v8);
LABEL_10:
  v11 = 0;
LABEL_11:
  return v11;
}

- (void)aaf_toCompressedData:()AAAFoundation .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)aaf_toCompressedData:()AAAFoundation .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)aaf_toCompressedData:()AAAFoundation .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end