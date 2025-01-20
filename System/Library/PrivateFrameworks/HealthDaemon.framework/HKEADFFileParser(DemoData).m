@interface HKEADFFileParser(DemoData)
- (uint64_t)initWithDataFileName:()DemoData;
@end

@implementation HKEADFFileParser(DemoData)

- (uint64_t)initWithDataFileName:()DemoData
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"HKEADFFileParser+DemoData.m", 28, @"Invalid parameter not satisfying: %@", @"fileName != nil" object file lineNumber description];
  }
  v6 = HDHealthDaemonFrameworkBundle();
  v7 = [v6 URLForResource:v5 withExtension:@"eadf"];

  v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7];
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HKEADFFileParser+DemoData.m", 31, @"Invalid parameter not satisfying: %@", @"data != nil" object file lineNumber description];
  }
  uint64_t v9 = [a1 initWithData:v8];

  return v9;
}

@end