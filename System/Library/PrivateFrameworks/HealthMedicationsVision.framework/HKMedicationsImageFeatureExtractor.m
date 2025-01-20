@interface HKMedicationsImageFeatureExtractor
- (HKMedicationsImageFeatureExtractor)init;
- (HKMedicationsTextNDCParser)ndcParser;
- (void)extractFeaturesFrom:(id)a3 completionHandler:(id)a4;
- (void)setNdcParser:(id)a3;
@end

@implementation HKMedicationsImageFeatureExtractor

- (HKMedicationsImageFeatureExtractor)init
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicationsImageFeatureExtractor;
  v2 = [(HKMedicationsImageFeatureExtractor *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(HKMedicationsTextNDCParser);
    [(HKMedicationsImageFeatureExtractor *)v2 setNdcParser:v3];
  }
  return v2;
}

- (void)extractFeaturesFrom:(id)a3 completionHandler:(id)a4
{
  v44[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v35 = (void (**)(id, void *, void *, id, id))a4;
  id v7 = objc_alloc(MEMORY[0x263F1EF40]);
  v36 = v6;
  v8 = (void *)[v7 initWithCIImage:v6 options:MEMORY[0x263EFFA78]];
  id v9 = objc_alloc_init(MEMORY[0x263F1EF90]);
  [v9 setMaximumCandidateCount:1];
  [v9 setUsesLanguageCorrection:1];
  [v9 setRecognitionLanguages:&unk_26E5DD578];
  id v10 = objc_alloc_init(MEMORY[0x263F1EE68]);
  uint64_t v11 = *MEMORY[0x263F1F0A8];
  v44[0] = *MEMORY[0x263F1F0B0];
  v44[1] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:2];
  [v10 setSymbologies:v12];

  v43[0] = v9;
  v43[1] = v10;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
  id v41 = 0;
  v34 = v8;
  [v8 performRequests:v13 error:&v41];
  id v33 = v41;

  id v14 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v15 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v16 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v31 = [v9 results];
  v17 = HKTextBlockFromDocumentsClosestToPoint(2, v31, 0.5, 0.5);
  v18 = [v17 getTranscript];
  uint64_t v19 = [v18 length];

  if (v19)
  {
    v20 = [v17 getTranscript];
    [v14 addObject:v20];

    v21 = [(HKMedicationsImageFeatureExtractor *)self ndcParser];
    v22 = [v17 getTranscript];
    v23 = [v21 parsedNDCCodeFromString:v22];

    if ([v23 length]) {
      [v15 addObject:v23];
    }
  }
  v32 = v15;
  v24 = v14;
  v25 = [v10 results];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = +[HKMedicationsBarcodeNDCParser parsedNDCCodeFromBarcodeObservation:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        if ([v30 length]) {
          [v16 addObject:v30];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v27);
  }
  v35[2](v35, v24, v32, v16, v33);
}

- (HKMedicationsTextNDCParser)ndcParser
{
  return self->_ndcParser;
}

- (void)setNdcParser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end