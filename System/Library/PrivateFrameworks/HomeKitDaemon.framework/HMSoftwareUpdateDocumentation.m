@interface HMSoftwareUpdateDocumentation
@end

@implementation HMSoftwareUpdateDocumentation

uint64_t __54__HMSoftwareUpdateDocumentation_Asset__initWithAsset___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 lastPathComponent];
  v4 = [v3 componentsSeparatedByString:@".txt"];

  v5 = [v4 firstObject];
  if ([v5 isEqual:*(void *)(a1 + 32)])
  {
    uint64_t v6 = 1;
  }
  else
  {
    v7 = [v4 firstObject];
    uint64_t v6 = [v7 isEqual:*(void *)(a1 + 40)];
  }
  return v6;
}

uint64_t __54__HMSoftwareUpdateDocumentation_Asset__initWithAsset___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 lastPathComponent];
  v4 = [v3 componentsSeparatedByString:@".txt"];
  v5 = [v4 firstObject];
  uint64_t v6 = [v5 hasPrefix:*(void *)(a1 + 32)];

  return v6;
}

uint64_t __54__HMSoftwareUpdateDocumentation_Asset__initWithAsset___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 lastPathComponent];
  v3 = [v2 componentsSeparatedByString:@".txt"];
  v4 = [v3 firstObject];
  uint64_t v5 = [v4 hasPrefix:@"en"];

  return v5;
}

@end