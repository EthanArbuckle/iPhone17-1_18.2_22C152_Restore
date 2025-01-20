@interface WDElectrocardiogramActivityItemSource
- (NSURL)pdfTemporaryFileURL;
- (WDElectrocardiogramActivityItemSource)initWithPDFData:(id)a3 sampleDate:(id)a4 firstName:(id)a5 lastName:(id)a6 provenance:(unint64_t)a7;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)pdfFileNameForSampleDate:(id)a3 firstName:(id)a4 lastName:(id)a5;
- (unint64_t)provenance;
- (void)dealloc;
- (void)setProvenance:(unint64_t)a3;
@end

@implementation WDElectrocardiogramActivityItemSource

- (id)pdfFileNameForSampleDate:(id)a3 firstName:(id)a4 lastName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x263F08790]);
  [v10 setDateFormat:@"yyyy-MM-dd"];
  id v11 = objc_alloc_init(MEMORY[0x263F08790]);
  [v11 setDateFormat:@"HH.mm"];
  uint64_t v12 = *MEMORY[0x263EFF3F8];
  v13 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  [v10 setCalendar:v13];

  v49 = v11;
  v14 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:v12];
  [v11 setCalendar:v14];

  id v15 = objc_alloc_init(MEMORY[0x263F08790]);
  [v15 setDateStyle:0];
  [v15 setTimeStyle:1];
  [v15 setFormattingContext:5];
  [v15 setLocalizedDateFormatFromTemplate:@"j"];
  v16 = [v15 stringFromDate:v7];
  v17 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  uint64_t v18 = [v17 invertedSet];

  v53 = (void *)v18;
  v54 = v16;
  v19 = [v16 componentsSeparatedByCharactersInSet:v18];
  uint64_t v20 = [v19 componentsJoinedByString:&stru_26D2EA890];

  id v21 = objc_alloc(MEMORY[0x263F08A30]);
  v52 = (void *)v20;
  v22 = [v21 numberFromString:v20];

  v51 = v22;
  if (v22)
  {
    id v23 = v7;
    uint64_t v24 = [v22 integerValue];
  }
  else
  {
    v25 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v23 = v7;
    uint64_t v24 = [v25 component:32 fromDate:v7];
  }
  v55 = v9;
  v56 = v8;
  if ([v8 length] || objc_msgSend(v9, "length"))
  {
    id v26 = objc_alloc_init(MEMORY[0x263F08A68]);
    [v26 setGivenName:v8];
    [v26 setFamilyName:v9];
    v27 = [MEMORY[0x263F08A78] localizedStringFromPersonNameComponents:v26 style:2 options:0];
    v28 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@":/\\""];
    v29 = NSString;
    id v30 = v27;
    v31 = objc_msgSend(v29, "stringWithUTF8String:", objc_msgSend(v30, "UTF8String"));
    v32 = objc_msgSend(v31, "hk_stringByRemovingCharactersInSet:", v28);
  }
  else
  {
    v32 = 0;
  }
  uint64_t v33 = [v32 length];
  v34 = NSString;
  v35 = WDBundle();
  v50 = v23;
  id v36 = v23;
  if (v33)
  {
    if (v24 == 1) {
      v37 = @"PDF_FILE_NAME_SINGULAR_HOUR";
    }
    else {
      v37 = @"PDF_FILE_NAME_PLURAL_HOUR";
    }
    v38 = v35;
    v39 = [v35 localizedStringForKey:v37 value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
    v40 = HKConditionallyRedactedHeartRhythmString();
    v41 = [v10 stringFromDate:v36];
    v42 = v49;
    [v49 stringFromDate:v36];
    v44 = v43 = v10;
    objc_msgSend(v34, "stringWithFormat:", v40, v32, v41, v44);
  }
  else
  {
    if (v24 == 1) {
      v45 = @"PDF_FILE_NAME_SINGULAR_HOUR_WITHOUT_NAME";
    }
    else {
      v45 = @"PDF_FILE_NAME_PLURAL_HOUR_WITHOUT_NAME";
    }
    v38 = v35;
    v39 = [v35 localizedStringForKey:v45 value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
    v40 = HKConditionallyRedactedHeartRhythmString();
    v41 = [v10 stringFromDate:v36];
    v42 = v49;
    [v49 stringFromDate:v36];
    v44 = v43 = v10;
    objc_msgSend(v34, "stringWithFormat:", v40, v41, v44, v48);
  v46 = };

  return v46;
}

- (WDElectrocardiogramActivityItemSource)initWithPDFData:(id)a3 sampleDate:(id)a4 firstName:(id)a5 lastName:(id)a6 provenance:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v37.receiver = self;
  v37.super_class = (Class)WDElectrocardiogramActivityItemSource;
  v16 = [(WDElectrocardiogramActivityItemSource *)&v37 init];
  v17 = v16;
  if (!v16) {
    goto LABEL_11;
  }
  unint64_t v34 = a7;
  uint64_t v18 = [(WDElectrocardiogramActivityItemSource *)v16 pdfFileNameForSampleDate:v13 firstName:v14 lastName:v15];
  v19 = NSTemporaryDirectory();
  uint64_t v20 = [v19 stringByAppendingPathComponent:v18];
  id v21 = [v20 stringByAppendingPathExtension:@"pdf"];

  uint64_t v22 = [NSURL fileURLWithPath:v21];
  pdfTemporaryFileURL = v17->_pdfTemporaryFileURL;
  v17->_pdfTemporaryFileURL = (NSURL *)v22;

  uint64_t v24 = [MEMORY[0x263F08850] defaultManager];
  LODWORD(v20) = [v24 fileExistsAtPath:v21];

  if (!v20) {
    goto LABEL_6;
  }
  v25 = [MEMORY[0x263F08850] defaultManager];
  id v26 = [(WDElectrocardiogramActivityItemSource *)v17 pdfTemporaryFileURL];
  id v36 = 0;
  [v25 removeItemAtURL:v26 error:&v36];
  id v27 = v36;

  if (!v27)
  {
LABEL_6:
    v29 = [(WDElectrocardiogramActivityItemSource *)v17 pdfTemporaryFileURL];
    id v35 = 0;
    [v12 writeToURL:v29 options:536870913 error:&v35];
    id v27 = v35;

    if (v27)
    {
      _HKInitializeLogging();
      id v30 = *MEMORY[0x263F09920];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
        -[WDElectrocardiogramActivityItemSource initWithPDFData:sampleDate:firstName:lastName:provenance:]((uint64_t)v27, v30);
      }
      goto LABEL_9;
    }
    v17->_provenance = v34;

LABEL_11:
    v32 = v17;
    goto LABEL_12;
  }
  _HKInitializeLogging();
  v28 = *MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
    -[WDElectrocardiogramActivityItemSource initWithPDFData:sampleDate:firstName:lastName:provenance:]((uint64_t)v27, v28);
  }
LABEL_9:
  v31 = v17->_pdfTemporaryFileURL;
  v17->_pdfTemporaryFileURL = 0;

  v32 = 0;
LABEL_12:

  return v32;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  v5 = objc_msgSend(MEMORY[0x263F476E0], "sharedManager", a3, a4);
  objc_msgSend(v5, "trackElectrocardiogramPDFSharedFrom:", -[WDElectrocardiogramActivityItemSource provenance](self, "provenance"));
  v6 = [(WDElectrocardiogramActivityItemSource *)self pdfTemporaryFileURL];

  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(WDElectrocardiogramActivityItemSource *)self pdfTemporaryFileURL];
  [v3 removeItemAtURL:v4 error:0];

  v5.receiver = self;
  v5.super_class = (Class)WDElectrocardiogramActivityItemSource;
  [(WDElectrocardiogramActivityItemSource *)&v5 dealloc];
}

- (NSURL)pdfTemporaryFileURL
{
  return self->_pdfTemporaryFileURL;
}

- (unint64_t)provenance
{
  return self->_provenance;
}

- (void)setProvenance:(unint64_t)a3
{
  self->_provenance = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithPDFData:(uint64_t)a1 sampleDate:(NSObject *)a2 firstName:lastName:provenance:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2210D2000, a2, OS_LOG_TYPE_ERROR, "Could not write PDF temporary file: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithPDFData:(uint64_t)a1 sampleDate:(NSObject *)a2 firstName:lastName:provenance:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2210D2000, a2, OS_LOG_TYPE_ERROR, "Could not delete existing PDF temporary file: %@", (uint8_t *)&v2, 0xCu);
}

@end