@interface CertInfoCertificateDetailsView
- (CertInfoCertificateDetailsView)initWithFrame:(CGRect)a3 certificateProperties:(id)a4;
- (id)_cellInfosForSection:(id)a3;
- (id)_detailForIndexPath:(id)a3;
- (id)_sectionInfoForCertSection:(id)a3 title:(id)a4;
- (id)_sectionsFromProperties:(id)a3;
- (id)_titleForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)appendInfoFromCertView:(id)a3;
- (void)layoutSubviews;
@end

@implementation CertInfoCertificateDetailsView

- (void)appendInfoFromCertView:(id)a3
{
  if (a3)
  {
    id v4 = *((id *)a3 + 52);
    if (v4)
    {
      tableSections = self->_tableSections;
      id v7 = v4;
      v6 = [NSDictionary dictionary];
      [(NSMutableArray *)tableSections addObject:v6];

      [(NSMutableArray *)self->_tableSections addObjectsFromArray:v7];
    }
  }
}

- (id)_cellInfosForSection:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v10 = [v9 objectForKey:@"localized label"];
        v11 = [v9 objectForKey:@"type"];
        v12 = [v9 objectForKey:@"value"];
        if ([v11 isEqualToString:@"section"])
        {
          v13 = [(CertInfoCertificateDetailsView *)self _cellInfosForSection:v12];
          [v4 addObjectsFromArray:v13];
        }
        else
        {
          if (([v11 isEqualToString:@"string"] & 1) != 0
            || [v11 isEqualToString:@"url"])
          {
            id v14 = v12;
          }
          else
          {
            id v14 = [v12 description];
          }
          v13 = v14;
          v15 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v10, @"cell title", v14, @"cell value", 0);
          [v4 addObject:v15];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)_sectionInfoForCertSection:(id)a3 title:(id)a4
{
  uint64_t v6 = NSDictionary;
  id v7 = a4;
  v8 = [(CertInfoCertificateDetailsView *)self _cellInfosForSection:a3];
  v9 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v8, @"cell infos", v7, @"header title", 0);

  return v9;
}

- (id)_sectionsFromProperties:(id)a3
{
  v15 = self;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v17 = [MEMORY[0x263EFF980] array];
  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "objectForKey:", @"localized label", v15);
        v10 = [v8 objectForKey:@"type"];
        v11 = [v8 objectForKey:@"value"];
        if ([v10 isEqualToString:@"section"])
        {
          v12 = [(CertInfoCertificateDetailsView *)v15 _sectionInfoForCertSection:v11 title:v9];
          [v17 addObject:v12];
        }
        else
        {
          [v16 addObject:v8];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  if ([v16 count])
  {
    v13 = [(CertInfoCertificateDetailsView *)v15 _sectionInfoForCertSection:v16 title:0];
    [v17 addObject:v13];
  }
  return v17;
}

- (CertInfoCertificateDetailsView)initWithFrame:(CGRect)a3 certificateProperties:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CertInfoCertificateDetailsView;
  v10 = -[CertInfoCertificateDetailsView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v12 = [(CertInfoCertificateDetailsView *)v10 _sectionsFromProperties:v9];
    uint64_t v13 = [v12 mutableCopy];
    tableSections = v11->_tableSections;
    v11->_tableSections = (NSMutableArray *)v13;

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x263F1CA40]), "initWithFrame:style:", 1, x, y, width, height);
    tableView = v11->_tableView;
    v11->_tableView = (UITableView *)v15;

    [(UITableView *)v11->_tableView setAllowsSelection:0];
    [(UITableView *)v11->_tableView setDataSource:v11];
    [(CertInfoCertificateDetailsView *)v11 addSubview:v11->_tableView];
  }

  return v11;
}

- (void)layoutSubviews
{
  [(CertInfoCertificateDetailsView *)self bounds];
  tableView = self->_tableView;
  -[UITableView setFrame:](tableView, "setFrame:");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(NSMutableArray *)self->_tableSections count] <= (unint64_t)a4) {
    return 0;
  }
  uint64_t v6 = [(NSMutableArray *)self->_tableSections objectAtIndex:a4];
  id v7 = [v6 objectForKey:@"cell infos"];
  int64_t v8 = [v7 count];

  return v8;
}

- (id)_titleForIndexPath:(id)a3
{
  tableSections = self->_tableSections;
  id v4 = a3;
  uint64_t v5 = -[NSMutableArray objectAtIndex:](tableSections, "objectAtIndex:", [v4 section]);
  uint64_t v6 = [v5 objectForKey:@"cell infos"];
  uint64_t v7 = [v4 row];

  int64_t v8 = [v6 objectAtIndex:v7];

  id v9 = [v8 objectForKey:@"cell title"];

  return v9;
}

- (id)_detailForIndexPath:(id)a3
{
  tableSections = self->_tableSections;
  id v4 = a3;
  uint64_t v5 = -[NSMutableArray objectAtIndex:](tableSections, "objectAtIndex:", [v4 section]);
  uint64_t v6 = [v5 objectForKey:@"cell infos"];
  uint64_t v7 = [v4 row];

  int64_t v8 = [v6 objectAtIndex:v7];

  id v9 = [v8 objectForKey:@"cell value"];

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 section];
  if (v8 >= [(NSMutableArray *)self->_tableSections count])
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [v6 dequeueReusableCellWithIdentifier:@"CertificateTableCellReuseIdentifier"];
    if (!v9) {
      id v9 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"CertificateTableCellReuseIdentifier"];
    }
    v10 = [v9 textLabel];
    v11 = [(CertInfoCertificateDetailsView *)self _titleForIndexPath:v7];
    [v10 setText:v11];

    v12 = [v9 detailTextLabel];
    uint64_t v13 = [(CertInfoCertificateDetailsView *)self _detailForIndexPath:v7];
    [v12 setText:v13];
  }
  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSMutableArray *)self->_tableSections count];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(NSMutableArray *)self->_tableSections count] <= (unint64_t)a4)
  {
    id v7 = 0;
  }
  else
  {
    id v6 = [(NSMutableArray *)self->_tableSections objectAtIndex:a4];
    id v7 = [v6 objectForKey:@"header title"];
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableSections, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end