@interface CNContainerIOSLegacyIdentifierDescription
- (BOOL)isWritable;
- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5;
- (Class)valueClass;
- (id)CNValueForContainer:(id)a3;
- (id)key;
- (void)ABValueForABSource:(void *)a3;
- (void)setCNValue:(id)a3 onContainer:(id)a4;
@end

@implementation CNContainerIOSLegacyIdentifierDescription

- (id)key
{
  return @"iOSLegacyIdentifier";
}

- (BOOL)isWritable
{
  return 1;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNValueForContainer:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = [a3 iOSLegacyIdentifier];

  return (id)[v3 numberWithInt:v4];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  id v5 = a4;
  objc_msgSend(v5, "setIOSLegacyIdentifier:", objc_msgSend(a3, "intValue"));
}

- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

- (void)ABValueForABSource:(void *)a3
{
  ABRecordID valuePtr = ABRecordGetRecordID(a3);
  result = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
  if (result) {
    return (void *)CFAutorelease(result);
  }
  return result;
}

@end