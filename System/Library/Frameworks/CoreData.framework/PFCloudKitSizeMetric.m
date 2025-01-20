@interface PFCloudKitSizeMetric
- (PFCloudKitSizeMetric)initWithContainerIdentifier:(id)a3;
- (id)payload;
- (uint64_t)addByteSize:(uint64_t)result;
- (void)dealloc;
@end

@implementation PFCloudKitSizeMetric

- (PFCloudKitSizeMetric)initWithContainerIdentifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PFCloudKitSizeMetric;
  v3 = [(PFCloudKitBaseMetric *)&v5 initWithContainerIdentifier:a3];
  if (v3) {
    v3->_sizeInBytes = (NSNumber *)[objc_alloc(NSNumber) initWithInt:0];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitSizeMetric;
  [(PFCloudKitBaseMetric *)&v3 dealloc];
}

- (uint64_t)addByteSize:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = [*(id *)(result + 24) unsignedIntegerValue] + a2;

    result = [objc_alloc(NSNumber) initWithUnsignedInteger:v3];
    *(void *)(v2 + 24) = result;
  }
  return result;
}

- (id)payload
{
  v6.receiver = self;
  v6.super_class = (Class)PFCloudKitSizeMetric;
  uint64_t v3 = (void *)[(NSDictionary *)[(PFCloudKitBaseMetric *)&v6 payload] mutableCopy];
  sizeInBytes = self->_sizeInBytes;
  if (!sizeInBytes) {
    sizeInBytes = (NSNumber *)[MEMORY[0x1E4F1CA98] null];
  }
  [v3 setValue:sizeInBytes forKey:@"sizeInBytes"];
  return v3;
}

@end