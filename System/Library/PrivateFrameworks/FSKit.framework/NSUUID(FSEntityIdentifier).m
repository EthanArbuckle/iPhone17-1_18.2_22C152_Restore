@interface NSUUID(FSEntityIdentifier)
- (FSContainerIdentifier)fs_containerIdentifier;
- (FSEntityIdentifier)fs_entityIdentifier;
- (FSVolumeIdentifier)fs_volumeIdentifier;
@end

@implementation NSUUID(FSEntityIdentifier)

- (FSContainerIdentifier)fs_containerIdentifier
{
  v1 = [(FSEntityIdentifier *)[FSContainerIdentifier alloc] initWithUUID:a1];
  return v1;
}

- (FSEntityIdentifier)fs_entityIdentifier
{
  v1 = [[FSEntityIdentifier alloc] initWithUUID:a1];
  return v1;
}

- (FSVolumeIdentifier)fs_volumeIdentifier
{
  v1 = [(FSEntityIdentifier *)[FSVolumeIdentifier alloc] initWithUUID:a1];
  return v1;
}

@end