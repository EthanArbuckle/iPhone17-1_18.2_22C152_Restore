@interface WDResearchStudySourcesListTableViewSection
- (NSArray)researchSources;
- (id)_sourceCellForRow:(unint64_t)a3 tableView:(id)a4;
- (id)cellForRow:(unint64_t)a3 table:(id)a4;
- (id)noneString;
- (id)titleForFooter;
- (id)titleForHeader;
- (unint64_t)numberOfRows;
- (void)dataSourceDidUpdate;
- (void)didSelectRow:(unint64_t)a3 representedByCell:(id)a4 withCompletion:(id)a5;
- (void)setResearchSources:(id)a3;
@end

@implementation WDResearchStudySourcesListTableViewSection

- (void)dataSourceDidUpdate
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [(WDSourcesListTableViewSection *)self dataSource];
  v4 = [v3 sources];
  v5 = [v4 orderedResearchStudySources];
  [(WDResearchStudySourcesListTableViewSection *)self setResearchSources:v5];

  v6 = [(WDTableViewSection *)self delegate];
  [v6 reloadTable];

  v7 = [(WDSourcesListTableViewSection *)self restorationSourceBundleIdentifier];
  if (v7)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v8 = [(WDResearchStudySourcesListTableViewSection *)self researchSources];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v14 = [v13 source];
          v15 = [v14 bundleIdentifier];
          int v16 = [v15 isEqualToString:v7];

          if (v16)
          {
            v17 = [(WDTableViewSection *)self delegate];
            v18 = [(WDSourcesListTableViewSection *)self detailViewControllerForSourceModel:v13];
            [v17 pushViewController:v18];

            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    [(WDSourcesListTableViewSection *)self setRestorationSourceBundleIdentifier:0];
  }
}

- (unint64_t)numberOfRows
{
  v2 = [(WDResearchStudySourcesListTableViewSection *)self researchSources];
  unint64_t v3 = [v2 count];

  if (v3 <= 1) {
    return 1;
  }
  else {
    return v3;
  }
}

- (id)titleForHeader
{
  v2 = WDBundle();
  unint64_t v3 = [v2 localizedStringForKey:@"RESEARCH_STUDIES_LIST_HEADER" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

  return v3;
}

- (id)titleForFooter
{
  v2 = WDBundle();
  unint64_t v3 = [v2 localizedStringForKey:@"RESEARCH_STUDIES_LIST_EXPLANATION" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

  return v3;
}

- (id)noneString
{
  v2 = WDBundle();
  unint64_t v3 = [v2 localizedStringForKey:@"RESEARCH_STUDIES_NONE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

  return v3;
}

- (id)cellForRow:(unint64_t)a3 table:(id)a4
{
  id v6 = a4;
  if (a3
    || ([(WDResearchStudySourcesListTableViewSection *)self researchSources],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8 = [(WDResearchStudySourcesListTableViewSection *)self researchSources];
    uint64_t v9 = [v8 count];

    if (v9) {
      [(WDResearchStudySourcesListTableViewSection *)self _sourceCellForRow:a3 tableView:v6];
    }
    else {
    uint64_t v10 = [(WDSourcesListTableViewSection *)self noneCellForTableView:v6];
    }
  }
  else
  {
    v12 = +[WDSpinnerTableViewCell defaultReuseIdentifier];
    uint64_t v10 = [v6 dequeueReusableCellWithIdentifier:v12];
  }

  return v10;
}

- (id)_sourceCellForRow:(unint64_t)a3 tableView:(id)a4
{
  id v6 = [a4 dequeueReusableCellWithIdentifier:@"WDResearchStudySourcesListTableViewSectionCell"];
  if (!v6)
  {
    id v6 = [[WDSourcesListTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"WDResearchStudySourcesListTableViewSectionCell"];
    [(WDSourcesListTableViewCell *)v6 setAccessoryType:1];
  }
  v7 = [(WDResearchStudySourcesListTableViewSection *)self researchSources];
  v8 = [v7 objectAtIndexedSubscript:a3];
  [(WDSourcesListTableViewCell *)v6 setSourceModel:v8];

  return v6;
}

- (void)didSelectRow:(unint64_t)a3 representedByCell:(id)a4 withCompletion:(id)a5
{
  id v17 = a4;
  v8 = (void (**)(id, uint64_t, void))a5;
  if (a3
    || ([(WDResearchStudySourcesListTableViewSection *)self researchSources],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    uint64_t v10 = [(WDResearchStudySourcesListTableViewSection *)self researchSources];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      v12 = [(WDTableViewSection *)self delegate];
      v13 = [(WDResearchStudySourcesListTableViewSection *)self researchSources];
      v14 = [v13 objectAtIndexedSubscript:a3];
      v15 = [(WDSourcesListTableViewSection *)self detailViewControllerForSourceModel:v14];
      [v12 pushViewController:v15];
    }
    uint64_t v16 = 1;
  }
  else
  {
    uint64_t v16 = 0;
  }
  v8[2](v8, v16, 0);
}

- (NSArray)researchSources
{
  return self->_researchSources;
}

- (void)setResearchSources:(id)a3
{
}

- (void).cxx_destruct
{
}

@end