@interface ProfileCharacteristicDiffableDataSource
- (id)footerTitleProvider;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (void)setFooterTitleProvider:(id)a3;
@end

@implementation ProfileCharacteristicDiffableDataSource

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = [(UITableViewDiffableDataSource *)self snapshot];
  v8 = [v7 sectionIdentifiers];
  v9 = [v8 objectAtIndex:a4];

  footerTitleProvider = (void (**)(id, id, int64_t, void *))self->_footerTitleProvider;
  if (footerTitleProvider)
  {
    v11 = footerTitleProvider[2](footerTitleProvider, v6, a4, v9);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)footerTitleProvider
{
  return self->_footerTitleProvider;
}

- (void)setFooterTitleProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end