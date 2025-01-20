@interface FBABugFormDiffableDataSource
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (FBABugFormTableViewController)thisViewController;
- (NSString)_attachmentSectionHeaderCached;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (void)applySnapshot:(id)a3 animatingDifferences:(BOOL)a4;
- (void)setThisViewController:(id)a3;
- (void)set_attachmentSectionHeaderCached:(id)a3;
@end

@implementation FBABugFormDiffableDataSource

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v6 = [(FBABugFormDiffableDataSource *)self snapshot];
  v7 = [v6 sectionIdentifiers];
  id v8 = [v7 indexOfObject:@"TeamPicker"];

  v9 = [(FBABugFormDiffableDataSource *)self snapshot];
  v10 = [v9 sectionIdentifiers];
  id v11 = [v10 indexOfObject:@"FormPicker"];

  v12 = [(FBABugFormDiffableDataSource *)self snapshot];
  v13 = [v12 sectionIdentifiers];
  id v14 = [v13 indexOfObject:@"DeviceAttachmentsSectionType"];

  v15 = [(FBABugFormDiffableDataSource *)self snapshot];
  v16 = [v15 sectionIdentifiers];
  id v17 = [v16 indexOfObject:@"AddAttachments"];

  if (v8 == (id)a4) {
    goto LABEL_2;
  }
  if (v11 == (id)a4)
  {
    v19 = +[NSBundle mainBundle];
    v20 = v19;
    uint64_t v21 = FBKCommonStrings;
    CFStringRef v22 = @"FORM_PICKER_SECTION_HEADER";
LABEL_7:
    uint64_t v23 = [v19 localizedStringForKey:v22 value:&stru_1000F6658 table:v21];
    goto LABEL_8;
  }
  if (v14 == (id)a4)
  {
    v19 = +[NSBundle mainBundle];
    v20 = v19;
    uint64_t v21 = FBKCommonStrings;
    CFStringRef v22 = @"DEVICES_AND_ATTACHMENTS_SECTION_HEADER";
    goto LABEL_7;
  }
  if (v17 == (id)a4)
  {
LABEL_2:
    v18 = 0;
    goto LABEL_10;
  }
  v25 = [(FBABugFormDiffableDataSource *)self thisViewController];
  v20 = [v25 questionGroupForSection:a4];

  if (!v20)
  {
    v18 = 0;
    goto LABEL_9;
  }
  if (FBKIsInternalInstall())
  {
    v26 = +[NSUserDefaults standardUserDefaults];
    unsigned int v27 = [v26 BOOLForKey:FBKShowSortOrderForDebugging];

    if (v27)
    {
      v28 = [v20 title];
      v29 = [v20 sortOrder];
      v30 = [v29 stringValue];
      v18 = +[NSString stringWithFormat:@"%@ (%@)", v28, v30];

      goto LABEL_9;
    }
  }
  uint64_t v23 = [v20 title];
LABEL_8:
  v18 = (void *)v23;
LABEL_9:

LABEL_10:

  return v18;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  v5 = [(FBABugFormDiffableDataSource *)self snapshot];
  v6 = [v5 sectionIdentifiers];
  id v7 = [v6 indexOfObject:@"DeviceAttachmentsSectionType"];

  if (v7 == (id)a4)
  {
    id v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"SHORT_SUBMISSION_PII_MESSAGE" value:&stru_1000F6658 table:0];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FBABugFormDiffableDataSource *)self thisViewController];
  unsigned __int8 v9 = [v8 _tableView:v7 canEditRowAtIndexPath:v6];

  return v9;
}

- (void)applySnapshot:(id)a3 animatingDifferences:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)FBABugFormDiffableDataSource;
  [(FBABugFormDiffableDataSource *)&v5 applySnapshot:a3 animatingDifferences:a4];
  [(FBABugFormDiffableDataSource *)self set_attachmentSectionHeaderCached:0];
}

- (FBABugFormTableViewController)thisViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thisViewController);

  return (FBABugFormTableViewController *)WeakRetained;
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