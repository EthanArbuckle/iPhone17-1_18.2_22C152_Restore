@interface FBKBugFormDiffableDataSource
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (FBKBugFormTableViewController)thisViewController;
- (NSString)_attachmentSectionHeaderCached;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (void)applySnapshot:(id)a3 animatingDifferences:(BOOL)a4;
- (void)setThisViewController:(id)a3;
- (void)set_attachmentSectionHeaderCached:(id)a3;
@end

@implementation FBKBugFormDiffableDataSource

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v6 = [(UITableViewDiffableDataSource *)self snapshot];
  v7 = [v6 sectionIdentifiers];
  uint64_t v8 = [v7 indexOfObject:@"TeamPicker"];

  v9 = [(UITableViewDiffableDataSource *)self snapshot];
  v10 = [v9 sectionIdentifiers];
  uint64_t v11 = [v10 indexOfObject:@"FormPicker"];

  v12 = [(UITableViewDiffableDataSource *)self snapshot];
  v13 = [v12 sectionIdentifiers];
  v14 = [(FBKBugFormDiffableDataSource *)self thisViewController];
  v15 = [v14 firstDeviceSectionIdentifier];
  uint64_t v16 = [v13 indexOfObject:v15];

  v17 = [(UITableViewDiffableDataSource *)self snapshot];
  v18 = [v17 sectionIdentifiers];
  uint64_t v19 = [v18 indexOfObject:@"AddAttachments"];

  v20 = [(UITableViewDiffableDataSource *)self snapshot];
  v21 = [v20 sectionIdentifiers];
  uint64_t v22 = [v21 indexOfObject:@"UserCell"];

  v23 = 0;
  if (v8 != a4 && v22 != a4)
  {
    if (v11 == a4)
    {
      v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v25 = [v24 localizedStringForKey:@"FORM_PICKER_SECTION_HEADER" value:&stru_26DDF6A30 table:@"CommonStrings"];
      goto LABEL_8;
    }
    if (v16 == a4)
    {
      v26 = [(FBKBugFormDiffableDataSource *)self thisViewController];
      v27 = [v26 draftingController];
      v24 = [v27 attachmentsSectionTitleFromBugForm];

      if (!v24)
      {
        int v38 = FBKIsInternalOrSeedBuild();
        v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v40 = v39;
        if (v38) {
          v41 = @"DEVICES_AND_ATTACHMENTS_SECTION_HEADER";
        }
        else {
          v41 = @"FCS_ATTACHMENTS_SECTION_HEADER";
        }
        v23 = [v39 localizedStringForKey:v41 value:&stru_26DDF6A30 table:@"CommonStrings"];

        goto LABEL_9;
      }
      id v25 = v24;
      v24 = v25;
      goto LABEL_8;
    }
    if (v19 != a4)
    {
      v29 = [(FBKBugFormDiffableDataSource *)self thisViewController];
      v24 = [v29 questionGroupForSection:a4];

      if (!v24) {
        goto LABEL_22;
      }
      if (FBKIsInternalInstall(v30, v31))
      {
        v32 = [MEMORY[0x263EFFA40] standardUserDefaults];
        int v33 = [v32 BOOLForKey:@"showSortOrderForDebugging"];

        if (v33)
        {
          v34 = NSString;
          v35 = [v24 title];
          v36 = [v24 sortOrder];
          v37 = [v36 stringValue];
          v23 = [v34 stringWithFormat:@"%@ (%@)", v35, v37];

          goto LABEL_9;
        }
      }
      if ([v24 isFileCollectionGroup])
      {
LABEL_22:
        v23 = 0;
        goto LABEL_9;
      }
      id v25 = [v24 title];
LABEL_8:
      v23 = v25;
LABEL_9:

      goto LABEL_10;
    }
    v23 = 0;
  }
LABEL_10:

  return v23;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(FBKBugFormDiffableDataSource *)self thisViewController];
  char v9 = [v8 _tableView:v7 canEditRowAtIndexPath:v6];

  return v9;
}

- (void)applySnapshot:(id)a3 animatingDifferences:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)FBKBugFormDiffableDataSource;
  [(UITableViewDiffableDataSource *)&v5 applySnapshot:a3 animatingDifferences:a4];
  [(FBKBugFormDiffableDataSource *)self set_attachmentSectionHeaderCached:0];
}

- (FBKBugFormTableViewController)thisViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thisViewController);

  return (FBKBugFormTableViewController *)WeakRetained;
}

- (void)setThisViewController:(id)a3
{
}

- (NSString)_attachmentSectionHeaderCached
{
  return self->__attachmentSectionHeaderCached;
}

- (void)set_attachmentSectionHeaderCached:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__attachmentSectionHeaderCached, 0);

  objc_destroyWeak((id *)&self->_thisViewController);
}

@end