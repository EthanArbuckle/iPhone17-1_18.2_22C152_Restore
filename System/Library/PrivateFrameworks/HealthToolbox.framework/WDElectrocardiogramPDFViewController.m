@interface WDElectrocardiogramPDFViewController
- (NSData)pdfData;
- (NSDate)sampleDate;
- (NSString)firstName;
- (NSString)lastName;
- (PDFDocument)pdfDocument;
- (WDElectrocardiogramPDFViewController)initWithPDFData:(id)a3 sampleDate:(id)a4 firstName:(id)a5 lastName:(id)a6;
- (unint64_t)overrideMask;
- (void)didTapDone;
- (void)didTapShare:(id)a3;
- (void)loadView;
@end

@implementation WDElectrocardiogramPDFViewController

- (WDElectrocardiogramPDFViewController)initWithPDFData:(id)a3 sampleDate:(id)a4 firstName:(id)a5 lastName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)WDElectrocardiogramPDFViewController;
  v15 = [(WDElectrocardiogramPDFViewController *)&v27 initWithNibName:0 bundle:0];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_pdfData, a3);
    objc_storeStrong((id *)&v16->_sampleDate, a4);
    uint64_t v17 = [objc_alloc(MEMORY[0x263F14740]) initWithData:v11];
    pdfDocument = v16->_pdfDocument;
    v16->_pdfDocument = (PDFDocument *)v17;

    objc_storeStrong((id *)&v16->_firstName, a5);
    objc_storeStrong((id *)&v16->_lastName, a6);
    v19 = WDBundle();
    v20 = [v19 localizedStringForKey:@"PDF_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
    v21 = HKConditionallyRedactedHeartRhythmString();
    [(WDElectrocardiogramPDFViewController *)v16 setTitle:v21];

    v22 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:v16 action:sel_didTapDone];
    v23 = [(WDElectrocardiogramPDFViewController *)v16 navigationItem];
    [v23 setLeftBarButtonItem:v22];

    v24 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:9 target:v16 action:sel_didTapShare_];
    v25 = [(WDElectrocardiogramPDFViewController *)v16 navigationItem];
    [v25 setRightBarButtonItem:v24];
  }
  return v16;
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x263F14778]);
  [(WDElectrocardiogramPDFViewController *)self setView:v3];

  v4 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v5 = [(WDElectrocardiogramPDFViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(WDElectrocardiogramPDFViewController *)self pdfDocument];
  v7 = [(WDElectrocardiogramPDFViewController *)self pdfView];
  [v7 setDocument:v6];

  v8 = [(WDElectrocardiogramPDFViewController *)self pdfDocument];
  v9 = [v8 string];
  v10 = [(WDElectrocardiogramPDFViewController *)self pdfView];
  [v10 setAccessibilityValue:v9];

  id v11 = [(WDElectrocardiogramPDFViewController *)self pdfView];
  [v11 setAutoScales:1];
}

- (void)didTapDone
{
}

- (void)didTapShare:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [WDElectrocardiogramActivityItemSource alloc];
  v6 = [(WDElectrocardiogramPDFViewController *)self pdfData];
  v7 = [(WDElectrocardiogramPDFViewController *)self sampleDate];
  v8 = [(WDElectrocardiogramPDFViewController *)self firstName];
  v9 = [(WDElectrocardiogramPDFViewController *)self lastName];
  v10 = [(WDElectrocardiogramActivityItemSource *)v5 initWithPDFData:v6 sampleDate:v7 firstName:v8 lastName:v9 provenance:1];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x263F1C3E8]);
    v17[0] = v10;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    id v13 = (void *)[v11 initWithActivityItems:v12 applicationActivities:0];

    id v14 = [v13 popoverPresentationController];
    [v14 setSourceItem:v4];

    uint64_t v16 = *MEMORY[0x263F1CFC0];
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    [v13 setExcludedActivityTypes:v15];

    [(WDElectrocardiogramPDFViewController *)self presentViewController:v13 animated:1 completion:0];
  }
}

- (unint64_t)overrideMask
{
  return 26;
}

- (NSData)pdfData
{
  return self->_pdfData;
}

- (NSDate)sampleDate
{
  return self->_sampleDate;
}

- (PDFDocument)pdfDocument
{
  return self->_pdfDocument;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_pdfDocument, 0);
  objc_storeStrong((id *)&self->_sampleDate, 0);

  objc_storeStrong((id *)&self->_pdfData, 0);
}

@end