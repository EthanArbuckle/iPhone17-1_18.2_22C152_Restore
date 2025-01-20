@interface HFPlaceholder
- (HFPlaceholder)init;
- (NSUUID)uniqueIdentifier;
@end

@implementation HFPlaceholder

- (HFPlaceholder)init
{
  v6.receiver = self;
  v6.super_class = (Class)HFPlaceholder;
  v2 = [(HFPlaceholder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08C38] UUID];
    uniqueIdentifier = v2->_uniqueIdentifier;
    v2->_uniqueIdentifier = (NSUUID *)v3;
  }
  return v2;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
}

@end