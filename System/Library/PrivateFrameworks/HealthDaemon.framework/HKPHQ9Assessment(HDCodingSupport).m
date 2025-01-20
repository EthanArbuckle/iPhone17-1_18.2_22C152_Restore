@interface HKPHQ9Assessment(HDCodingSupport)
- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport;
- (HDCodableScoredAssessment)codableRepresentationForSync;
@end

@implementation HKPHQ9Assessment(HDCodingSupport)

- (HDCodableScoredAssessment)codableRepresentationForSync
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(HDCodableScoredAssessment);
  v11.receiver = a1;
  v11.super_class = (Class)&off_1F187D790;
  v3 = objc_msgSendSuper2(&v11, sel_codableRepresentationForSync);
  [(HDCodableScoredAssessment *)v2 setSample:v3];

  -[HDCodableScoredAssessment setScore:](v2, "setScore:", [a1 score]);
  v4 = (void *)MEMORY[0x1E4F28DB0];
  v5 = [a1 answers];
  id v10 = 0;
  v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v10];
  id v7 = v10;

  if (!v6)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E4F29F68];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F68], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "Error archiving answers: %@", buf, 0xCu);
    }
  }
  [(HDCodableScoredAssessment *)v2 setAnswers:v6];
  -[HDCodableScoredAssessment setRisk:](v2, "setRisk:", [a1 risk]);

  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4 = a3;
  v5 = [a1 codableRepresentationForSync];
  if (v5) {
    [v4 addScoredAssessmentSamples:v5];
  }

  return v5 != 0;
}

@end