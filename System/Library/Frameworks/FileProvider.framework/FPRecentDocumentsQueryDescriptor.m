@interface FPRecentDocumentsQueryDescriptor
- (id)name;
- (id)queryStringForMountPoint:(id)a3;
- (unint64_t)desiredCount;
@end

@implementation FPRecentDocumentsQueryDescriptor

- (unint64_t)desiredCount
{
  v2 = [(FPSpotlightQueryDescriptor *)self settings];
  uint64_t v3 = [v2 desiredNumberOfItems];
  v4 = (void *)v3;
  v5 = &unk_1EF6C38F0;
  if (v3) {
    v5 = (void *)v3;
  }
  id v6 = v5;

  unint64_t v7 = [v6 unsignedIntegerValue];
  return v7;
}

- (id)queryStringForMountPoint:(id)a3
{
  v4 = [(FPSpotlightQueryDescriptor *)self settings];
  v5 = [v4 allowedFileTypes];

  id v6 = [(FPSpotlightQueryDescriptor *)self settings];
  unint64_t v7 = [v6 excludedFileTypes];

  v8 = [(FPSpotlightQueryDescriptor *)self settings];
  [v8 excludedParentOIDs];

  v9 = (void *)*MEMORY[0x1E4F443C8];
  v10 = [(id)*MEMORY[0x1E4F443C8] identifier];
  char v11 = [v7 containsObject:v10];

  if ((v11 & 1) == 0)
  {
    v12 = [v9 identifier];
    uint64_t v13 = [v7 arrayByAddingObject:v12];

    unint64_t v7 = (void *)v13;
  }
  v14 = NSString;
  v15 = [(FPSpotlightQueryDescriptor *)self settings];
  v16 = [v15 allowedProviders];
  v17 = FPRecentDocumentsQueryStringForTypes(v16, v5, v7);
  v18 = FPExcludedCollaborationInvitationsQueryStringFragment();
  v19 = [(FPSpotlightQueryDescriptor *)self settings];
  v20 = [v19 excludedParentOIDs];
  v21 = FPExcludedOIDParentsQueryStringFragment(v20);
  v22 = [v14 stringWithFormat:@"(%@) && (%@) && (%@)", v17, v18, v21];

  return v22;
}

- (id)name
{
  return (id)[NSString stringWithUTF8String:"RCNT"];
}

@end