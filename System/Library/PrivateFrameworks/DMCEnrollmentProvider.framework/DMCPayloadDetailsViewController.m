@interface DMCPayloadDetailsViewController
- (DMCPayloadDetailsViewController)initWithPayload:(id)a3;
- (DMCPayloadDetailsViewController)initWithPayloadViewModel:(id)a3;
- (DMCPayloadViewModel)payloadViewModel;
- (MCPayload)payload;
- (NSArray)keyValueSections;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)_keyValueSectionForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_setTitle:(id)a3 keyValueSections:(id)a4;
- (void)_setup;
- (void)setKeyValueSections:(id)a3;
- (void)setPayload:(id)a3;
- (void)setPayloadViewModel:(id)a3;
@end

@implementation DMCPayloadDetailsViewController

- (DMCPayloadDetailsViewController)initWithPayload:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMCPayloadDetailsViewController;
  v6 = [(DMCProfileTableViewController *)&v11 initWithStyle:2];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_payload, a3);
    v8 = [v5 friendlyName];
    v9 = [v5 payloadDescriptionKeyValueSections];
    [(DMCPayloadDetailsViewController *)v7 _setTitle:v8 keyValueSections:v9];

    [(DMCPayloadDetailsViewController *)v7 _setup];
  }

  return v7;
}

- (DMCPayloadDetailsViewController)initWithPayloadViewModel:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DMCPayloadDetailsViewController;
  v6 = [(DMCProfileTableViewController *)&v19 initWithStyle:2];
  v7 = v6;
  if (v6)
  {
    p_payloadViewModel = (id *)&v6->_payloadViewModel;
    objc_storeStrong((id *)&v6->_payloadViewModel, a3);
    v9 = objc_opt_new();
    v10 = [*p_payloadViewModel certificateProperties];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      v12 = [DMCCertificateProperties alloc];
      v13 = [*p_payloadViewModel certificateProperties];
      v14 = [(DMCCertificateProperties *)v12 initWithCertificateProperties:v13];

      v15 = [(DMCCertificateProperties *)v14 keyValueSections];
      [v9 addObjectsFromArray:v15];
    }
    v16 = [v5 payloadDescriptionKeyValueSections];
    [v9 addObjectsFromArray:v16];

    v17 = [v5 friendlyName];
    [(DMCPayloadDetailsViewController *)v7 _setTitle:v17 keyValueSections:v9];

    [(DMCPayloadDetailsViewController *)v7 _setup];
  }

  return v7;
}

- (void)_setup
{
  v5.receiver = self;
  v5.super_class = (Class)DMCPayloadDetailsViewController;
  [(DMCProfileTableViewController *)&v5 updateExtendedLayoutIncludesOpaqueBars];
  v3 = [(DMCPayloadDetailsViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PayloadDetailsCell"];

  v4.receiver = self;
  v4.super_class = (Class)DMCPayloadDetailsViewController;
  [(DMCProfileTableViewController *)&v4 reloadTableOnContentSizeCategoryChange];
}

- (void)_setTitle:(id)a3 keyValueSections:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  v7 = [(DMCPayloadDetailsViewController *)self navigationItem];
  [v7 setTitle:v6];

  [(DMCPayloadDetailsViewController *)self setKeyValueSections:v8];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(DMCPayloadDetailsViewController *)self keyValueSections];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v4 = [(DMCPayloadDetailsViewController *)self _keyValueSectionForSection:a4];
  objc_super v5 = [v4 sectionKeyValues];

  if (v5) {
    int64_t v6 = [v5 count];
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  [a3 rowHeight];
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v4 = [(DMCPayloadDetailsViewController *)self _keyValueSectionForSection:a4];
  objc_super v5 = [v4 sectionTitle];

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  int64_t v4 = [(DMCPayloadDetailsViewController *)self _keyValueSectionForSection:a4];
  objc_super v5 = [v4 sectionFooter];

  return v5;
}

- (id)_keyValueSectionForSection:(int64_t)a3
{
  objc_super v5 = [(DMCPayloadDetailsViewController *)self keyValueSections];
  if ([v5 count] <= (unint64_t)a3)
  {
    v7 = 0;
  }
  else
  {
    int64_t v6 = [(DMCPayloadDetailsViewController *)self keyValueSections];
    v7 = [v6 objectAtIndexedSubscript:a3];
  }
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DMCPayloadDetailsViewController *)self keyValueSections];
  v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));

  v10 = [v9 sectionKeyValues];
  uint64_t v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v6, "row"));

  v12 = [v7 dequeueReusableCellWithIdentifier:@"PayloadDetailsCell" forIndexPath:v6];

  v13 = [v11 key];
  v14 = [v11 value];
  [v12 setDetail:v13 value:v14];

  return v12;
}

- (MCPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (DMCPayloadViewModel)payloadViewModel
{
  return self->_payloadViewModel;
}

- (void)setPayloadViewModel:(id)a3
{
}

- (NSArray)keyValueSections
{
  return self->_keyValueSections;
}

- (void)setKeyValueSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueSections, 0);
  objc_storeStrong((id *)&self->_payloadViewModel, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end