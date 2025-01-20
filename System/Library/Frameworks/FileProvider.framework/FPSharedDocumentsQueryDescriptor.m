@interface FPSharedDocumentsQueryDescriptor
- (BOOL)supportsQueryingAllMountPoints;
- (id)name;
- (id)queryStringForMountPoint:(id)a3;
@end

@implementation FPSharedDocumentsQueryDescriptor

- (id)name
{
  return (id)[NSString stringWithUTF8String:"SHRD"];
}

- (id)queryStringForMountPoint:(id)a3
{
  v4 = [(FPSpotlightQueryDescriptor *)self settings];
  v5 = [v4 allowedFileTypes];
  v30 = v5;

  v6 = [(FPSpotlightQueryDescriptor *)self settings];
  uint64_t v7 = [v6 excludedFileTypes];
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7) {
    v10 = (void *)v7;
  }
  else {
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v11 = v10;
  v29 = v11;

  v12 = [(FPSpotlightQueryDescriptor *)self settings];
  uint64_t v13 = [v12 excludedParentOIDs];
  v14 = (void *)v13;
  if (v13) {
    v15 = (void *)v13;
  }
  else {
    v15 = v9;
  }
  id v16 = v15;

  v17 = NSString;
  v18 = FPContentTypeQueryStringForFileTypes(v5, v11);

  v19 = FPIsTrashedQueryStringFragment(0);
  v20 = [(FPSpotlightQueryDescriptor *)self settings];
  v21 = [v20 allowedProviders];
  v22 = FPFileProviderOriginatedItemsQueryStringFragment(v21);
  v23 = FPExcludedCollaborationInvitationsQueryStringFragment();
  v24 = [(FPSpotlightQueryDescriptor *)self settings];
  v25 = [v24 excludedParentOIDs];
  v26 = FPExcludedOIDParentsQueryStringFragment(v25);
  v27 = objc_msgSend(v17, "stringWithFormat:", @"(kMDItemIsShared = \"1\") && (%@) && (%@) && (%@) && (FPIsTopLevelSharedItem = \"1\") && (%@) && (%@)", v18, v19, v22, v23, v26);

  return v27;
}

- (BOOL)supportsQueryingAllMountPoints
{
  return 0;
}

@end