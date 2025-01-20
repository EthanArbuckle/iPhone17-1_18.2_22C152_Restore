@interface HKMedicationsTextExtractor
+ (id)extractedDocumentsFromRequestHandler:(id)a3 error:(id *)a4;
@end

@implementation HKMedicationsTextExtractor

+ (id)extractedDocumentsFromRequestHandler:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  v5 = (objc_class *)MEMORY[0x263F1EF90];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 setMaximumCandidateCount:5];
  [v7 setUsesLanguageCorrection:1];
  [v7 setRecognitionLanguages:&unk_26E5DD440];
  v13[0] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v12 = 0;
  [v6 performRequests:v8 error:&v12];

  id v9 = v12;
  if (v9)
  {
    v10 = 0;
    if (a4) {
      *a4 = v9;
    }
  }
  else
  {
    v10 = [v7 results];
  }

  return v10;
}

@end