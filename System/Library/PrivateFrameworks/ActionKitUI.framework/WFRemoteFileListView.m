@interface WFRemoteFileListView
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CGRect)frameOfCellAtPoint:(CGPoint)a3;
- (NSDateFormatter)dateFormatter;
- (NSDictionary)filesBySection;
- (UIEdgeInsets)contentInset;
- (UIEdgeInsets)verticalScrollIndicatorInsets;
- (UILocalizedIndexedCollation)collation;
- (UITableView)tableView;
- (WFRemoteFileListView)initWithFrame:(CGRect)a3 collation:(id)a4;
- (WFRemoteFileListViewDelegate)delegate;
- (id)cellAtPoint:(CGPoint)a3;
- (id)fileAtPoint:(CGPoint)a3;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setFiles:(id)a3;
- (void)setFilesBySection:(id)a3;
- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCheckmarkForFile:(id)a3;
@end

@implementation WFRemoteFileListView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filesBySection, 0);
  objc_storeStrong((id *)&self->_collation, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSDictionary)filesBySection
{
  return self->_filesBySection;
}

- (UILocalizedIndexedCollation)collation
{
  return self->_collation;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setDelegate:(id)a3
{
}

- (WFRemoteFileListViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFRemoteFileListViewDelegate *)WeakRetained;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFRemoteFileListView *)self filesBySection];
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "section"));
  v10 = [v8 objectForKeyedSubscript:v9];
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  [v7 deselectRowAtIndexPath:v6 animated:1];
  v11 = [(WFRemoteFileListView *)self delegate];
  [v11 fileListView:self didSelectFile:v12];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(WFRemoteFileListView *)self filesBySection];
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "section"));
  v8 = [v6 objectForKeyedSubscript:v7];
  uint64_t v9 = [v5 row];

  v10 = [v8 objectAtIndexedSubscript:v9];

  v11 = [(WFRemoteFileListView *)self delegate];
  LOBYTE(self) = [v11 fileListView:self shouldSelectFile:v10];

  return (char)self;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  if (!a5)
  {
    id v7 = a3;
    v8 = [v7 tableHeaderView];
    [v8 frame];
    objc_msgSend(v7, "scrollRectToVisible:animated:", 0);
  }
  uint64_t v9 = [(WFRemoteFileListView *)self collation];
  int64_t v10 = [v9 sectionForSectionIndexTitleAtIndex:a5] - 1;

  return v10;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  v3 = [(WFRemoteFileListView *)self collation];
  v4 = [v3 sectionTitles];

  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = [(WFRemoteFileListView *)self filesBySection];
  id v7 = [NSNumber numberWithInteger:a4];
  v8 = [v6 objectForKeyedSubscript:v7];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    int64_t v10 = [(WFRemoteFileListView *)self collation];
    v11 = [v10 sectionTitles];
    id v12 = [v11 objectAtIndex:a4];
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WFRemoteFileListView *)self filesBySection];
  id v6 = [NSNumber numberWithInteger:a4];
  id v7 = [v5 objectForKeyedSubscript:v6];
  int64_t v8 = [v7 count];

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(WFRemoteFileListView *)self filesBySection];
  v4 = [v3 allKeys];
  id v5 = [v4 valueForKeyPath:@"@max.self"];
  int64_t v6 = [v5 integerValue] + 1;

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"WFRemoteFileCellReuseIdentifier" forIndexPath:v6];
  int64_t v8 = [(WFRemoteFileListView *)self filesBySection];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "section"));
  int64_t v10 = [v8 objectForKeyedSubscript:v9];
  uint64_t v11 = [v6 row];

  id v12 = [v10 objectAtIndexedSubscript:v11];

  v13 = [(WFRemoteFileListView *)self delegate];
  uint64_t v14 = [v13 fileListView:self shouldDisplayCheckmarkForFile:v12];

  v15 = [(WFRemoteFileListView *)self dateFormatter];
  [v7 setFile:v12 checked:v14 dateFormatter:v15];

  return v7;
}

- (void)setFilesBySection:(id)a3
{
  filesBySection = self->_filesBySection;
  id v5 = a3;
  LOBYTE(filesBySection) = [(NSDictionary *)filesBySection isEqualToDictionary:v5];
  id v6 = (NSDictionary *)[v5 copy];

  id v7 = self->_filesBySection;
  self->_filesBySection = v6;

  if ((filesBySection & 1) == 0)
  {
    id v8 = [(WFRemoteFileListView *)self tableView];
    [v8 reloadData];
  }
}

- (id)fileAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(WFRemoteFileListView *)self tableView];
  objc_msgSend(v6, "convertPoint:fromView:", self, x, y);
  id v7 = objc_msgSend(v6, "indexPathForRowAtPoint:");
  if (v7)
  {
    id v8 = [(WFRemoteFileListView *)self filesBySection];
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "section"));
    int64_t v10 = [v8 objectForKeyedSubscript:v9];
    uint64_t v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)cellAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(WFRemoteFileListView *)self tableView];
  objc_msgSend(v6, "convertPoint:fromView:", self, x, y);
  id v7 = objc_msgSend(v6, "indexPathForRowAtPoint:");
  id v8 = [v6 cellForRowAtIndexPath:v7];

  return v8;
}

- (CGRect)frameOfCellAtPoint:(CGPoint)a3
{
  v4 = -[WFRemoteFileListView cellAtPoint:](self, "cellAtPoint:", a3.x, a3.y);
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13 = [(WFRemoteFileListView *)self tableView];
  -[WFRemoteFileListView convertRect:fromView:](self, "convertRect:fromView:", v13, v6, v8, v10, v12);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (void)updateCheckmarkForFile:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v5 = [(WFRemoteFileListView *)self tableView];
  double v6 = [v5 indexPathsForVisibleRows];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        double v12 = [(WFRemoteFileListView *)self filesBySection];
        v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "section"));
        double v14 = [v12 objectForKeyedSubscript:v13];
        double v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v11, "row"));

        if ([v4 isEqual:v15])
        {
          double v16 = [(WFRemoteFileListView *)self tableView];
          double v17 = [v16 cellForRowAtIndexPath:v11];

          double v18 = [(WFRemoteFileListView *)self delegate];
          uint64_t v19 = [v18 fileListView:self shouldDisplayCheckmarkForFile:v15];

          double v20 = [(WFRemoteFileListView *)self dateFormatter];
          [v17 setFile:v15 checked:v19 dateFormatter:v20];

          goto LABEL_11;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)setFiles:(id)a3
{
  v40[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(WFRemoteFileListView *)self collation];
  if (v5)
  {
    v26 = self;
    double v6 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v27 = v4;
    id obj = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v12 = [v5 sectionForObject:v11 collationStringSelector:sel_wfName];
          v13 = [NSNumber numberWithInteger:v12];
          double v14 = [v6 objectForKeyedSubscript:v13];

          if (!v14)
          {
            double v14 = objc_opt_new();
            double v15 = [NSNumber numberWithInteger:v12];
            [v6 setObject:v14 forKeyedSubscript:v15];
          }
          [v14 addObject:v11];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v8);
    }

    double v16 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v17 = v6;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * j);
          long long v23 = [v17 objectForKeyedSubscript:v22];
          long long v24 = [v5 sortedArrayFromArray:v23 collationStringSelector:sel_wfName];
          [v16 setObject:v24 forKeyedSubscript:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v19);
    }

    [(WFRemoteFileListView *)v26 setFilesBySection:v16];
    id v4 = v27;
  }
  else if (v4)
  {
    v39 = &unk_26DF64F68;
    v40[0] = v4;
    long long v25 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    [(WFRemoteFileListView *)self setFilesBySection:v25];
  }
  else
  {
    [(WFRemoteFileListView *)self setFilesBySection:0];
  }
}

- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)a3
{
}

- (UIEdgeInsets)verticalScrollIndicatorInsets
{
  [(UITableView *)self->_tableView verticalScrollIndicatorInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
}

- (UIEdgeInsets)contentInset
{
  [(UITableView *)self->_tableView contentInset];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (WFRemoteFileListView)initWithFrame:(CGRect)a3 collation:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WFRemoteFileListView;
  uint64_t v11 = -[WFRemoteFileListView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x263F82C78]);
    [(WFRemoteFileListView *)v11 bounds];
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:style:", 0);
    tableView = v11->_tableView;
    v11->_tableView = (UITableView *)v13;

    [(UITableView *)v11->_tableView setAutoresizingMask:18];
    [(UITableView *)v11->_tableView setDelegate:v11];
    [(UITableView *)v11->_tableView setDataSource:v11];
    [(UITableView *)v11->_tableView setRowHeight:*MEMORY[0x263F839B8]];
    [(UITableView *)v11->_tableView setEstimatedRowHeight:44.0];
    [(WFRemoteFileListView *)v11 addSubview:v11->_tableView];
    [(UITableView *)v11->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"WFRemoteFileCellReuseIdentifier"];
    objc_storeStrong((id *)&v11->_collation, a4);
    uint64_t v15 = objc_opt_new();
    filesBySection = v11->_filesBySection;
    v11->_filesBySection = (NSDictionary *)v15;

    id v17 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateFormatter = v11->_dateFormatter;
    v11->_dateFormatter = v17;

    [(NSDateFormatter *)v11->_dateFormatter setDateStyle:1];
    [(NSDateFormatter *)v11->_dateFormatter setTimeStyle:1];
    [(NSDateFormatter *)v11->_dateFormatter setDoesRelativeDateFormatting:1];
    uint64_t v19 = v11;
  }

  return v11;
}

@end