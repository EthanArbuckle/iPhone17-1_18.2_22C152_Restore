@interface NSValue(BSCoding)
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)bs_valueWithCGPoint:()BSCoding;
+ (id)bs_valueWithCGRect:()BSCoding;
+ (id)bs_valueWithCGSize:()BSCoding;
+ (uint64_t)bs_valueWithCGAffineTransform:()BSCoding;
- (BOOL)bs_getValue:()BSCoding ofSize:;
- (BOOL)supportsBSXPCSecureCoding;
- (double)bs_CGPointValue;
- (double)bs_CGRectValue;
- (double)bs_CGSizeValue;
- (id)initWithBSXPCCoder:()BSCoding;
- (uint64_t)bs_CGAffineTransformValue;
- (void)encodeWithBSXPCCoder:()BSCoding;
@end

@implementation NSValue(BSCoding)

- (BOOL)supportsBSXPCSecureCoding
{
  uint64_t v1 = [a1 classForCoder];
  return v1 == objc_opt_class();
}

+ (BOOL)supportsBSXPCSecureCoding
{
  uint64_t v1 = [a1 classForCoder];
  return v1 == objc_opt_class();
}

- (void)encodeWithBSXPCCoder:()BSCoding
{
  sizep[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a1;
  v6 = (const char *)[v5 objCType];
  sizep[0] = 0;
  v7 = NSGetSizeAndAlignment(v6, sizep, 0);
  size_t v8 = sizep[0];
  if (sizep[0])
  {
    MEMORY[0x1F4188790](v7);
    bzero((char *)sizep - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    if (objc_msgSend(v5, "bs_getValue:ofSize:", (char *)sizep - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v8))
    {
      v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:(char *)sizep - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0) length:v8];
      [v4 encodeObject:v9 forKey:@"data"];

      v10 = [NSString stringWithCString:v6 encoding:4];
      [v4 encodeObject:v10 forKey:@"type"];
    }
  }
}

- (double)bs_CGRectValue
{
  long long v1 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  v3[0] = *MEMORY[0x1E4F1DB20];
  v3[1] = v1;
  objc_msgSend(a1, "bs_getValue:ofSize:", v3, 32);
  return *(double *)v3;
}

- (BOOL)bs_getValue:()BSCoding ofSize:
{
  NSUInteger sizep = 0;
  id v6 = a1;
  NSGetSizeAndAlignment((const char *)[v6 objCType], &sizep, 0);
  NSUInteger v7 = sizep;
  if (a3 && sizep == a4) {
    [v6 getValue:a3];
  }
  return v7 == a4;
}

+ (id)bs_valueWithCGRect:()BSCoding
{
  *(double *)id v6 = a1;
  *(double *)&v6[1] = a2;
  *(double *)&v6[2] = a3;
  *(double *)&v6[3] = a4;
  id v4 = [MEMORY[0x1E4F29238] valueWithBytes:v6 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  return v4;
}

- (id)initWithBSXPCCoder:()BSCoding
{
  id v4 = a3;
  id v5 = [v4 decodeStringForKey:@"type"];
  id v6 = (const char *)[v5 UTF8String];

  NSUInteger v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  size_t v8 = v7;
  id v9 = 0;
  if (v7 && v6)
  {
    uint64_t v10 = [v7 length];
    NSUInteger sizep = 0;
    NSGetSizeAndAlignment(v6, &sizep, 0);
    if (v10 == sizep)
    {
      a1 = objc_msgSend(a1, "initWithBytes:objCType:", objc_msgSend(v8, "bytes"), v6);
      id v9 = a1;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = [v8 length];
      NSUInteger sizep = 0;
      NSGetSizeAndAlignment(v6, &sizep, 0);
      objc_msgSend(v11, "raise:format:", *MEMORY[0x1E4F28498], @"Size of input data (%zu) does not match size of type '%s' (%zu)", v12, v6, sizep);
      id v9 = 0;
    }
  }

  return v9;
}

+ (id)bs_valueWithCGSize:()BSCoding
{
  *(double *)id v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x1E4F29238] valueWithBytes:v4 objCType:"{CGSize=dd}"];
  return v2;
}

+ (id)bs_valueWithCGPoint:()BSCoding
{
  *(double *)id v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x1E4F29238] valueWithBytes:v4 objCType:"{CGPoint=dd}"];
  return v2;
}

+ (uint64_t)bs_valueWithCGAffineTransform:()BSCoding
{
  return [MEMORY[0x1E4F29238] valueWithBytes:a3 objCType:"{CGAffineTransform=dddddd}"];
}

- (double)bs_CGSizeValue
{
  long long v2 = *MEMORY[0x1E4F1DB30];
  objc_msgSend(a1, "bs_getValue:ofSize:", &v2, 16);
  return *(double *)&v2;
}

- (double)bs_CGPointValue
{
  long long v2 = *MEMORY[0x1E4F1DAD8];
  objc_msgSend(a1, "bs_getValue:ofSize:", &v2, 16);
  return *(double *)&v2;
}

- (uint64_t)bs_CGAffineTransformValue
{
  uint64_t v4 = MEMORY[0x1E4F1DAB8];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *x8_0 = *MEMORY[0x1E4F1DAB8];
  x8_0[1] = v5;
  x8_0[2] = *(_OWORD *)(v4 + 32);
  return objc_msgSend(a1, "bs_getValue:ofSize:");
}

@end