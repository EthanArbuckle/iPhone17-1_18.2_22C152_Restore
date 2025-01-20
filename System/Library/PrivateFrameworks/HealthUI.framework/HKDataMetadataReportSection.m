@interface HKDataMetadataReportSection
- (HKDataMetadataReportSection)initWithSample:(id)a3 healthStore:(id)a4;
- (HKHealthStore)healthStore;
- (HKSample)sample;
- (NSString)detailedReportName;
- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4;
- (id)documentImageForXMLFiles;
- (id)sectionTitle;
- (unint64_t)numberOfRowsInSection;
- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5;
@end

@implementation HKDataMetadataReportSection

- (HKDataMetadataReportSection)initWithSample:(id)a3 healthStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKDataMetadataReportSection;
  v9 = [(HKDataMetadataReportSection *)&v15 init];
  if (!v9) {
    goto LABEL_5;
  }
  int v10 = [v7 hasAssociatedReport];
  v11 = 0;
  if (v8 && v10)
  {
    uint64_t v12 = [v7 detailedReportName];
    detailedReportName = v9->_detailedReportName;
    v9->_detailedReportName = (NSString *)v12;

    objc_storeStrong((id *)&v9->_sample, a3);
    objc_storeStrong((id *)&v9->_healthStore, a4);
LABEL_5:
    v11 = v9;
  }

  return v11;
}

- (id)sectionTitle
{
  return 0;
}

- (unint64_t)numberOfRowsInSection
{
  return 1;
}

- (id)documentImageForXMLFiles
{
  if (documentImageForXMLFiles_oncePredicate != -1) {
    dispatch_once(&documentImageForXMLFiles_oncePredicate, &__block_literal_global_17);
  }
  v2 = (void *)documentImageForXMLFiles__CachedImage;
  return v2;
}

void __55__HKDataMetadataReportSection_documentImageForXMLFiles__block_invoke()
{
  HKHealthUIFrameworkBundle();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [MEMORY[0x1E4FB1818] imageNamed:@"cda_doc" inBundle:v2 compatibleWithTraitCollection:0];
  v1 = (void *)documentImageForXMLFiles__CachedImage;
  documentImageForXMLFiles__CachedImage = v0;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  v5 = [a4 dequeueReusableCellWithIdentifier:@"report_cell_identifier"];
  if (!v5) {
    v5 = objc_alloc_init(_HKReportTableViewCell);
  }
  detailedReportName = self->_detailedReportName;
  id v7 = [(HKDataMetadataReportSection *)self documentImageForXMLFiles];
  [(_HKReportTableViewCell *)v5 setReportName:detailedReportName reportImage:v7];

  return v5;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  id v7 = a4;
  objc_initWeak(&location, v7);
  sample = self->_sample;
  healthStore = self->_healthStore;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__HKDataMetadataReportSection_selectCellForIndex_navigationController_animated___block_invoke;
  v10[3] = &unk_1E6D52538;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a5;
  [(HKSample *)sample fetchDetailedReportWithHealthStore:healthStore reportDataBlock:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __80__HKDataMetadataReportSection_selectCellForIndex_navigationController_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = v5;
  if (v5 && !a3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__HKDataMetadataReportSection_selectCellForIndex_navigationController_animated___block_invoke_2;
    v9[3] = &unk_1E6D52510;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    char v13 = *(unsigned char *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v9);
    objc_destroyWeak(&v12);
  }
}

void __80__HKDataMetadataReportSection_selectCellForIndex_navigationController_animated___block_invoke_2(uint64_t a1)
{
  v3 = [[HKCDADocumentDetailViewController alloc] initWithReportData:*(void *)(a1 + 32)];
  [(HKCDADocumentDetailViewController *)v3 setTitle:*(void *)(*(void *)(a1 + 40) + 16)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained pushViewController:v3 animated:*(unsigned __int8 *)(a1 + 56)];
}

- (HKSample)sample
{
  return self->_sample;
}

- (NSString)detailedReportName
{
  return self->_detailedReportName;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_detailedReportName, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

@end