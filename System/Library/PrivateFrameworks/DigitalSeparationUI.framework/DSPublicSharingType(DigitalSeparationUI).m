@interface DSPublicSharingType(DigitalSeparationUI)
- (id)iconForDetail;
- (id)iconForTable;
@end

@implementation DSPublicSharingType(DigitalSeparationUI)

- (id)iconForTable
{
  v1 = (void *)MEMORY[0x263F3A378];
  v2 = [a1 source];
  v3 = [v2 name];
  v4 = [v1 sourceDescriptorForSource:v3];
  v5 = [v4 iconForTable];

  return v5;
}

- (id)iconForDetail
{
  v1 = (void *)MEMORY[0x263F3A378];
  v2 = [a1 source];
  v3 = [v2 name];
  v4 = [v1 sourceDescriptorForSource:v3];
  v5 = [v4 iconForDetail];

  return v5;
}

@end