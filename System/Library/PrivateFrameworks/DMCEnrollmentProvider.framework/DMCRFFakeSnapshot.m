@interface DMCRFFakeSnapshot
- (DMCRFSnapshotIdentifier)identifier;
- (NSDate)date;
- (NSDate)dateCreated;
- (NSDate)dateModified;
- (NSString)deviceName;
@end

@implementation DMCRFFakeSnapshot

- (NSDate)date
{
  return (NSDate *)[MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:0.0];
}

- (NSDate)dateCreated
{
  return (NSDate *)[MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:0.0];
}

- (NSDate)dateModified
{
  return (NSDate *)[MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:0.0];
}

- (NSString)deviceName
{
  return (NSString *)@"Fake Device";
}

- (DMCRFSnapshotIdentifier)identifier
{
  v2 = objc_alloc_init(DMCRFFakeSnapshotIdentifier);
  return (DMCRFSnapshotIdentifier *)v2;
}

@end