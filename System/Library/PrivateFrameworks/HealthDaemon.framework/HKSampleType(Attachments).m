@interface HKSampleType(Attachments)
- (uint64_t)attachmentSchemaVersion;
@end

@implementation HKSampleType(Attachments)

- (uint64_t)attachmentSchemaVersion
{
  if ([a1 code] == 257) {
    return 1;
  }
  else {
    return -1;
  }
}

@end