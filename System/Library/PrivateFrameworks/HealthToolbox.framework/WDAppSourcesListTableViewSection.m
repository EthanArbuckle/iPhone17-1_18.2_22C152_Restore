@interface WDAppSourcesListTableViewSection
- (BOOL)uninstalledSourcesExist;
- (NSArray)installedSources;
- (id)_sourceCellForRow:(unint64_t)a3 tableView:(id)a4;
- (id)_uninstalledSourcesCellWithTableView:(id)a3;
- (id)cellForRow:(unint64_t)a3 table:(id)a4;
- (id)noneString;
- (id)titleForFooter;
- (id)titleForHeader;
- (unint64_t)numberOfRows;
- (void)dataSourceDidUpdate;
- (void)didSelectRow:(unint64_t)a3 representedByCell:(id)a4 withCompletion:(id)a5;
- (void)setInstalledSources:(id)a3;
- (void)setUninstalledSourcesExist:(BOOL)a3;
@end

@implementation WDAppSourcesListTableViewSection

- (void)dataSourceDidUpdate
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v3 = [(WDSourcesListTableViewSection *)self dataSource];
  v4 = [v3 sources];
  v5 = [v4 orderedUninstalledAppSources];
  -[WDAppSourcesListTableViewSection setUninstalledSourcesExist:](self, "setUninstalledSourcesExist:", [v5 count] != 0);

  v6 = [(WDSourcesListTableViewSection *)self dataSource];
  v7 = [v6 sources];
  v8 = [v7 orderedAppSources];

  v9 = [(WDTableViewSection *)self delegate];
  v10 = [v9 profile];
  v11 = [v10 presentationContext];

  if (v11 == @"SettingsPrivacy")
  {
    v12 = [(WDSourcesListTableViewSection *)self dataSource];
    v13 = [v12 fetchFilteredSourcesWithAuthorizationRecordsForSources:v8];
    [(WDAppSourcesListTableViewSection *)self setInstalledSources:v13];
  }
  else
  {
    [(WDAppSourcesListTableViewSection *)self setInstalledSources:v8];
  }
  v14 = [(WDTableViewSection *)self delegate];
  v15 = [v14 profile];
  v16 = [v15 healthStore];
  v17 = [v16 profileIdentifier];
  uint64_t v18 = [v17 type];

  if (v18 == 3)
  {
    v19 = [(WDAppSourcesListTableViewSection *)self installedSources];
    v20 = [(WDSourcesListTableViewSection *)self dataSource];
    v21 = [v20 sources];
    v22 = [v21 orderedUninstalledAppSources];
    v23 = [v19 arrayByAddingObjectsFromArray:v22];

    v24 = [v23 sortedArrayUsingComparator:&__block_literal_global_10];
    [(WDAppSourcesListTableViewSection *)self setInstalledSources:v24];

    [(WDAppSourcesListTableViewSection *)self setUninstalledSourcesExist:0];
  }
  v25 = [(WDTableViewSection *)self delegate];
  [v25 reloadTable];

  v26 = [(WDSourcesListTableViewSection *)self restorationSourceBundleIdentifier];
  if (v26)
  {
    v38 = v8;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v27 = [(WDAppSourcesListTableViewSection *)self installedSources];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v33 = [v32 source];
          v34 = [v33 bundleIdentifier];
          int v35 = [v34 isEqualToString:v26];

          if (v35)
          {
            v36 = [(WDTableViewSection *)self delegate];
            v37 = [(WDSourcesListTableViewSection *)self detailViewControllerForSourceModel:v32];
            [v36 pushViewController:v37 animated:0];

            goto LABEL_17;
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v29) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    [(WDSourcesListTableViewSection *)self setRestorationSourceBundleIdentifier:0];
    v8 = v38;
  }
}

uint64_t __55__WDAppSourcesListTableViewSection_dataSourceDidUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 source];
  v6 = [v5 name];
  v7 = [v4 source];

  v8 = [v7 name];
  uint64_t v9 = [v6 localizedStandardCompare:v8];

  return v9;
}

- (unint64_t)numberOfRows
{
  v3 = [(WDAppSourcesListTableViewSection *)self installedSources];
  uint64_t v4 = [v3 count];

  if (v4) {
    return v4 + [(WDAppSourcesListTableViewSection *)self uninstalledSourcesExist];
  }
  else {
    return 1;
  }
}

- (id)titleForHeader
{
  if ([(WDSourcesListTableViewSection *)self shouldHideHeader])
  {
    v2 = &stru_26D2EA890;
  }
  else
  {
    v3 = WDBundle();
    v2 = [v3 localizedStringForKey:@"APPS_LIST_HEADER" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  }

  return v2;
}

- (id)titleForFooter
{
  v2 = WDBundle();
  v3 = [v2 localizedStringForKey:@"APPS_LIST_EXPLANATION" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

  return v3;
}

- (id)noneString
{
  v2 = WDBundle();
  v3 = [v2 localizedStringForKey:@"APPS_NONE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

  return v3;
}

- (id)cellForRow:(unint64_t)a3 table:(id)a4
{
  id v6 = a4;
  if (a3
    || ([(WDAppSourcesListTableViewSection *)self installedSources],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8 = [(WDAppSourcesListTableViewSection *)self installedSources];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      v10 = [(WDAppSourcesListTableViewSection *)self installedSources];
      uint64_t v11 = [v10 count];

      if (v11 != a3)
      {
        uint64_t v12 = [(WDAppSourcesListTableViewSection *)self _sourceCellForRow:a3 tableView:v6];
LABEL_9:
        v13 = (void *)v12;
        goto LABEL_10;
      }
    }
    else if (![(WDAppSourcesListTableViewSection *)self uninstalledSourcesExist])
    {
      uint64_t v12 = [(WDSourcesListTableViewSection *)self noneCellForTableView:v6];
      goto LABEL_9;
    }
    uint64_t v12 = [(WDAppSourcesListTableViewSection *)self _uninstalledSourcesCellWithTableView:v6];
    goto LABEL_9;
  }
  v15 = +[WDSpinnerTableViewCell defaultReuseIdentifier];
  v13 = [v6 dequeueReusableCellWithIdentifier:v15];

LABEL_10:

  return v13;
}

- (id)_sourceCellForRow:(unint64_t)a3 tableView:(id)a4
{
  id v6 = [a4 dequeueReusableCellWithIdentifier:@"WDAppSourcesListTableViewSectionCell"];
  if (!v6)
  {
    id v6 = [[WDSourcesListTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"WDAppSourcesListTableViewSectionCell"];
    [(WDSourcesListTableViewCell *)v6 setAccessoryType:1];
  }
  v7 = [(WDAppSourcesListTableViewSection *)self installedSources];
  v8 = [v7 objectAtIndexedSubscript:a3];
  [(WDSourcesListTableViewCell *)v6 setSourceModel:v8];

  uint64_t v9 = objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D260]);
  v10 = [(WDSourcesListTableViewCell *)v6 textLabel];
  [v10 setFont:v9];

  return v6;
}

- (id)_uninstalledSourcesCellWithTableView:(id)a3
{
  v3 = [a3 dequeueReusableCellWithIdentifier:@"WDSourcesListTableViewSectionUninstalledSources"];
  if (!v3) {
    v3 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"WDSourcesListTableViewSectionUninstalledSources"];
  }
  [v3 setAccessoryType:1];
  uint64_t v4 = WDBundle();
  v5 = [v4 localizedStringForKey:@"UNINSTALLED_APPS" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  id v6 = [v3 textLabel];
  [v6 setText:v5];

  v7 = objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D260]);
  v8 = [v3 textLabel];
  [v8 setFont:v7];

  return v3;
}

- (void)didSelectRow:(unint64_t)a3 representedByCell:(id)a4 withCompletion:(id)a5
{
  id v25 = a4;
  id v8 = a5;
  if (a3
    || ([(WDAppSourcesListTableViewSection *)self installedSources],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v10 = [v25 reuseIdentifier];
    int v11 = [v10 isEqualToString:@"WDSourcesListTableViewSectionUninstalledSources"];

    if (v11)
    {
      uint64_t v12 = objc_alloc_init(WDUninstalledAppSourcesViewController);
      v13 = [(WDTableViewSection *)self delegate];
      v14 = [v13 profile];
      [(WDUninstalledAppSourcesViewController *)v12 setProfile:v14];

      v15 = [(WDSourcesListTableViewSection *)self dataSource];
      [(WDUninstalledAppSourcesViewController *)v12 setDataSource:v15];

      v16 = WDBundle();
      v17 = [v16 localizedStringForKey:@"UNINSTALLED_APPS" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
      [(WDUninstalledAppSourcesViewController *)v12 setTitle:v17];

      uint64_t v18 = [(WDTableViewSection *)self delegate];
      [v18 pushViewController:v12];

      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
    else
    {
      v19 = [(WDAppSourcesListTableViewSection *)self installedSources];
      uint64_t v20 = [v19 count];

      if (v20)
      {
        v21 = [(WDAppSourcesListTableViewSection *)self installedSources];
        v22 = [v21 objectAtIndexedSubscript:a3];

        v23 = [(WDTableViewSection *)self delegate];
        v24 = [(WDSourcesListTableViewSection *)self detailViewControllerForSourceModel:v22];
        [v23 pushViewController:v24];
      }
      (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 1, 0);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

- (NSArray)installedSources
{
  return self->_installedSources;
}

- (void)setInstalledSources:(id)a3
{
}

- (BOOL)uninstalledSourcesExist
{
  return self->_uninstalledSourcesExist;
}

- (void)setUninstalledSourcesExist:(BOOL)a3
{
  self->_uninstalledSourcesExist = a3;
}

- (void).cxx_destruct
{
}

@end