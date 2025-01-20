@interface SGLevenshtein
+ (unint64_t)distanceBetweenStrings:(id)a3 and:(id)a4;
@end

@implementation SGLevenshtein

+ (unint64_t)distanceBetweenStrings:(id)a3 and:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v5 = (__CFString *)a3;
  v6 = (__CFString *)a4;
  unsigned int v7 = [(__CFString *)v5 length];
  unsigned int v8 = [(__CFString *)v6 length];
  if ([(__CFString *)v5 isEqualToString:v6])
  {
    LODWORD(CStringPtr) = 0;
    goto LABEL_20;
  }
  if (!v7)
  {
    unint64_t CStringPtr = (unint64_t)[(__CFString *)v6 lengthOfBytesUsingEncoding:2348810496] >> 2;
    goto LABEL_20;
  }
  if (!v8)
  {
    unint64_t CStringPtr = (unint64_t)[(__CFString *)v5 lengthOfBytesUsingEncoding:2348810496] >> 2;
    goto LABEL_20;
  }
  unint64_t CStringPtr = (unint64_t)CFStringGetCStringPtr(v5, 0x600u);
  v10 = CFStringGetCStringPtr(v6, 0x600u);
  if ((CStringPtr || [(__CFString *)v5 canBeConvertedToEncoding:1])
    && (v10 || [(__CFString *)v6 canBeConvertedToEncoding:1]))
  {
    if (CStringPtr)
    {
      if (!v10) {
        goto LABEL_17;
      }
    }
    else
    {
      unint64_t CStringPtr = [(__CFString *)v5 UTF8String];
      if (!v10) {
LABEL_17:
      }
        v10 = (const char *)[(__CFString *)v6 UTF8String];
    }
    LODWORD(CStringPtr) = levenshtein<char>(CStringPtr, (uint64_t)v10, v7, v8);
    goto LABEL_20;
  }
  uint64_t v11 = v8;
  size_t v12 = 4 * v8;
  if (v12 + 4 * v7 > 0x7CF)
  {
    v14 = [(__CFString *)v5 dataUsingEncoding:2348810496];
    v15 = [(__CFString *)v6 dataUsingEncoding:2348810496];
    unint64_t CStringPtr = [v14 length];
    unint64_t v16 = [v15 length];
    id v17 = v14;
    uint64_t v18 = [v17 bytes];
    id v19 = v15;
    LODWORD(CStringPtr) = levenshtein<unsigned int>(v18, [v19 bytes], CStringPtr >> 2, v16 >> 2);
  }
  else
  {
    size_t v13 = 4 * v7;
    MEMORY[0x1F4188790]();
    bzero((char *)&v21 - ((v13 + 15) & 0x7FFFFFFF0), v13);
    MEMORY[0x1F4188790]();
    bzero((char *)&v21 - ((v12 + 15) & 0x7FFFFFFF0), v12);
    unint64_t v22 = 0;
    v23[0] = 0;
    -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (char *)&v21 - ((v13 + 15) & 0x7FFFFFFF0), v13, v23, 2348810496, 0, 0, v7, 0);
    -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v6, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (char *)&v21 - ((v12 + 15) & 0x7FFFFFFF0), v12, &v22, 2348810496, 0, 0, v11, 0);
    LODWORD(CStringPtr) = levenshtein<unsigned int>((uint64_t)&v21 - ((v13 + 15) & 0x7FFFFFFF0), (uint64_t)&v21 - ((v12 + 15) & 0x7FFFFFFF0), v23[0] >> 2, v22 >> 2);
  }
LABEL_20:

  return CStringPtr;
}

@end