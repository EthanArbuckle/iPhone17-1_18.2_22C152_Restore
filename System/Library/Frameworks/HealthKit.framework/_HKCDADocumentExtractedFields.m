@interface _HKCDADocumentExtractedFields
- (NSDate)extractedDate;
- (NSString)extractedAuthorName;
- (NSString)extractedCustodianName;
- (NSString)extractedPatient;
- (NSString)extractedTitle;
- (_HKCDADocumentExtractedFields)initWithDocumentData:(id)a3;
- (id)_firstFrom:(id)a3 tagRule:(id)a4 nilOnFail:(BOOL)a5;
- (id)_parseCDADate:(id)a3;
- (id)_personNameFrom:(id)a3 familyTagRule:(id)a4 givenTagRule:(id)a5 nilOnFail:(BOOL)a6;
- (void)extractHeaderFieldsFromDocumentData:(id)a3;
@end

@implementation _HKCDADocumentExtractedFields

- (_HKCDADocumentExtractedFields)initWithDocumentData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_HKCDADocumentExtractedFields;
  v5 = [(_HKCDADocumentExtractedFields *)&v8 init];
  v6 = v5;
  if (v5) {
    [(_HKCDADocumentExtractedFields *)v5 extractHeaderFieldsFromDocumentData:v4];
  }

  return v6;
}

- (void)extractHeaderFieldsFromDocumentData:(id)a3
{
  id v4 = a3;
  v20 = objc_alloc_init(_HKXMLExtractor);
  [(_HKXMLExtractor *)v20 addTagSpecificationForExtraction:@"ClinicalDocument/effectiveTime/@value"];
  [(_HKXMLExtractor *)v20 addTagSpecificationForExtraction:@"ClinicalDocument/title"];
  [(_HKXMLExtractor *)v20 addTagSpecificationForExtraction:@"ClinicalDocument/recordTarget/patientRole/patient/name%use=L/given"];
  [(_HKXMLExtractor *)v20 addTagSpecificationForExtraction:@"ClinicalDocument/recordTarget/patientRole/patient/name%use=L/family"];
  [(_HKXMLExtractor *)v20 addTagSpecificationForExtraction:@"ClinicalDocument/recordTarget/patientRole/patient/name/given"];
  [(_HKXMLExtractor *)v20 addTagSpecificationForExtraction:@"ClinicalDocument/recordTarget/patientRole/patient/name/family"];
  [(_HKXMLExtractor *)v20 addTagSpecificationForExtraction:@"ClinicalDocument/author/assignedAuthor/assignedPerson/name/given"];
  [(_HKXMLExtractor *)v20 addTagSpecificationForExtraction:@"ClinicalDocument/author/assignedAuthor/assignedPerson/name/family"];
  [(_HKXMLExtractor *)v20 addTagSpecificationForExtraction:@"ClinicalDocument/author/assignedAuthor/assignedAuthoringDevice/softwareName"];
  [(_HKXMLExtractor *)v20 addTagSpecificationForExtraction:@"ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization/name"];
  [(_HKXMLExtractor *)v20 parseWithData:v4];

  v5 = [(_HKCDADocumentExtractedFields *)self _firstFrom:v20 tagRule:@"ClinicalDocument/effectiveTime/@value" nilOnFail:1];
  if (v5)
  {
    v6 = [(_HKCDADocumentExtractedFields *)self _parseCDADate:v5];
    extractedDate = self->_extractedDate;
    self->_extractedDate = v6;
  }
  objc_super v8 = [(_HKCDADocumentExtractedFields *)self _firstFrom:v20 tagRule:@"ClinicalDocument/title" nilOnFail:0];
  extractedTitle = self->_extractedTitle;
  self->_extractedTitle = v8;

  [(_HKCDADocumentExtractedFields *)self _personNameFrom:v20 familyTagRule:@"ClinicalDocument/recordTarget/patientRole/patient/name%use=L/family" givenTagRule:@"ClinicalDocument/recordTarget/patientRole/patient/name%use=L/given" nilOnFail:1];
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  extractedPatient = self->_extractedPatient;
  self->_extractedPatient = v10;

  if (!self->_extractedPatient)
  {
    v12 = [(_HKCDADocumentExtractedFields *)self _personNameFrom:v20 familyTagRule:@"ClinicalDocument/recordTarget/patientRole/patient/name/family" givenTagRule:@"ClinicalDocument/recordTarget/patientRole/patient/name/given" nilOnFail:1];
    v13 = self->_extractedPatient;
    self->_extractedPatient = v12;
  }
  v14 = [(_HKCDADocumentExtractedFields *)self _personNameFrom:v20 familyTagRule:@"ClinicalDocument/author/assignedAuthor/assignedPerson/name/family" givenTagRule:@"ClinicalDocument/author/assignedAuthor/assignedPerson/name/given" nilOnFail:1];
  extractedAuthorName = self->_extractedAuthorName;
  self->_extractedAuthorName = v14;

  if (!self->_extractedAuthorName)
  {
    v16 = [(_HKCDADocumentExtractedFields *)self _firstFrom:v20 tagRule:@"ClinicalDocument/author/assignedAuthor/assignedAuthoringDevice/softwareName" nilOnFail:0];
    v17 = self->_extractedAuthorName;
    self->_extractedAuthorName = v16;
  }
  v18 = [(_HKCDADocumentExtractedFields *)self _firstFrom:v20 tagRule:@"ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization/name" nilOnFail:0];
  extractedCustodianName = self->_extractedCustodianName;
  self->_extractedCustodianName = v18;
}

- (id)_firstFrom:(id)a3 tagRule:(id)a4 nilOnFail:(BOOL)a5
{
  v7 = &stru_1EEC60288;
  if (a5) {
    v7 = 0;
  }
  objc_super v8 = v7;
  v9 = [a3 getDataForTagSpecification:a4];
  if ([v9 count])
  {
    uint64_t v10 = [v9 objectAtIndex:0];

    objc_super v8 = (__CFString *)v10;
  }

  return v8;
}

- (id)_personNameFrom:(id)a3 familyTagRule:(id)a4 givenTagRule:(id)a5 nilOnFail:(BOOL)a6
{
  BOOL v6 = a6;
  v9 = (objc_class *)MEMORY[0x1E4F28F30];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(v9);
  v14 = [v12 getDataForTagSpecification:v11];

  v15 = [v12 getDataForTagSpecification:v10];

  if ([v14 count] || (uint64_t v16 = objc_msgSend(v15, "count")) != 0)
  {
    if ([v14 count])
    {
      v17 = [v14 componentsJoinedByString:@" "];
      [v13 setFamilyName:v17];
    }
    if ([v15 count])
    {
      v18 = [v15 componentsJoinedByString:@" "];
      [v13 setGivenName:v18];
    }
    uint64_t v16 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v13 style:3 options:0];
  }
  if (v16) {
    int v19 = 1;
  }
  else {
    int v19 = v6;
  }
  if (v19) {
    v20 = (__CFString *)v16;
  }
  else {
    v20 = &stru_1EEC60288;
  }

  return v20;
}

- (id)_parseCDADate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_HKDateFormatterParsers_onceToken != -1) {
    dispatch_once(&_HKDateFormatterParsers_onceToken, &__block_literal_global_294);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)_HKDateFormatterParsers__formatters;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dateFromString:", v3, (void)v12);
        if (v9)
        {
          id v10 = (void *)v9;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_13:

  return v10;
}

- (NSDate)extractedDate
{
  return self->_extractedDate;
}

- (NSString)extractedTitle
{
  return self->_extractedTitle;
}

- (NSString)extractedPatient
{
  return self->_extractedPatient;
}

- (NSString)extractedAuthorName
{
  return self->_extractedAuthorName;
}

- (NSString)extractedCustodianName
{
  return self->_extractedCustodianName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractedCustodianName, 0);
  objc_storeStrong((id *)&self->_extractedAuthorName, 0);
  objc_storeStrong((id *)&self->_extractedPatient, 0);
  objc_storeStrong((id *)&self->_extractedTitle, 0);

  objc_storeStrong((id *)&self->_extractedDate, 0);
}

@end