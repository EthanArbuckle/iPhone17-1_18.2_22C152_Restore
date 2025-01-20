@interface FPTaggedItemsQueryDescriptor
- (id)name;
- (id)queryStringForMountPoint:(id)a3;
@end

@implementation FPTaggedItemsQueryDescriptor

- (id)name
{
  return (id)[NSString stringWithUTF8String:"TGGD"];
}

- (id)queryStringForMountPoint:(id)a3
{
  id v4 = a3;
  v5 = @"kMDItemUserTags";
  v46 = v4;
  if (v4 && ![v4 isEqualToString:@"FPQueryCollectionDefaultMountPointIdentifier"]) {
    v5 = @"_kMDItemUserTags";
  }
  v6 = v5;
  v7 = [(FPSpotlightQueryDescriptor *)self settings];
  v8 = [v7 tagIdentifier];

  v9 = NSString;
  v45 = v6;
  if (v8)
  {
    v10 = [(FPSpotlightQueryDescriptor *)self settings];
    v11 = [v10 tagIdentifier];
    uint64_t v12 = [v9 stringWithFormat:@"%@ == \"%@\"", v6, v11];
  }
  else
  {
    uint64_t v12 = [NSString stringWithFormat:@"%@ == \"*\"", v6];
  }
  v13 = [(FPSpotlightQueryDescriptor *)self settings];
  v14 = [v13 allowedFileTypes];

  v15 = [(FPSpotlightQueryDescriptor *)self settings];
  uint64_t v16 = [v15 excludedFileTypes];
  v17 = (void *)v16;
  v18 = (void *)MEMORY[0x1E4F1CBF0];
  if (v16) {
    v19 = (void *)v16;
  }
  else {
    v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v20 = v19;

  v21 = [(FPSpotlightQueryDescriptor *)self settings];
  uint64_t v22 = [v21 excludedParentOIDs];
  v23 = (void *)v22;
  if (v22) {
    v24 = (void *)v22;
  }
  else {
    v24 = v18;
  }
  id v25 = v24;

  v26 = (void *)*MEMORY[0x1E4F443C8];
  v27 = [(id)*MEMORY[0x1E4F443C8] identifier];
  char v28 = [v14 containsObject:v27];

  v43 = v25;
  v44 = (void *)v12;
  if ((v28 & 1) == 0)
  {
    v29 = [v26 identifier];
    uint64_t v30 = [v14 arrayByAddingObject:v29];

    v14 = (void *)v30;
  }
  v31 = NSString;
  v32 = FPContentTypeQueryStringForFileTypes(v14, v20);
  v33 = FPIsTrashedQueryStringFragment(0);
  v34 = [(FPSpotlightQueryDescriptor *)self settings];
  v35 = [v34 allowedProviders];
  v36 = FPFileProviderOriginatedItemsQueryStringFragment(v35);
  v37 = [(FPSpotlightQueryDescriptor *)self settings];
  v38 = [v37 excludedParentOIDs];
  FPExcludedOIDParentsQueryStringFragment(v38);
  v39 = v42 = v20;
  v40 = [v31 stringWithFormat:@"(%@) && (%@) && (%@) && (%@) && (%@)", v32, v33, v36, v44, v39];

  return v40;
}

@end