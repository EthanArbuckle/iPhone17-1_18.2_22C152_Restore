@interface _CPUserReportFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)sections;
- (NSData)uuidBytes;
- (NSString)uploadedDataIdentifier;
- (_CPCardSectionForFeedback)cardSection;
- (_CPPunchoutForFeedback)userSelection;
- (_CPSearchResultForFeedback)result;
- (_CPUserReportFeedback)init;
- (_CPUserReportFeedback)initWithFacade:(id)a3;
- (id)sectionsAtIndex:(unint64_t)a3;
- (int)reportType;
- (unint64_t)hash;
- (unint64_t)sectionsCount;
- (unint64_t)timestamp;
- (void)addSections:(id)a3;
- (void)clearSections;
- (void)setCardSection:(id)a3;
- (void)setReportType:(int)a3;
- (void)setResult:(id)a3;
- (void)setSections:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUploadedDataIdentifier:(id)a3;
- (void)setUserSelection:(id)a3;
- (void)setUuidBytes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPUserReportFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadedDataIdentifier, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_uuidBytes, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_userSelection, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

- (void)setReportType:(int)a3
{
  self->_reportType = a3;
}

- (int)reportType
{
  return self->_reportType;
}

- (void)setUploadedDataIdentifier:(id)a3
{
}

- (NSString)uploadedDataIdentifier
{
  return self->_uploadedDataIdentifier;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setUuidBytes:(id)a3
{
}

- (NSData)uuidBytes
{
  return self->_uuidBytes;
}

- (void)setCardSection:(id)a3
{
}

- (_CPCardSectionForFeedback)cardSection
{
  return self->_cardSection;
}

- (void)setUserSelection:(id)a3
{
}

- (_CPPunchoutForFeedback)userSelection
{
  return self->_userSelection;
}

- (void)setResult:(id)a3
{
}

- (_CPSearchResultForFeedback)result
{
  return self->_result;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)hash
{
  unint64_t v3 = 2654435761u * self->_timestamp;
  unint64_t v4 = [(_CPSearchResultForFeedback *)self->_result hash];
  unint64_t v5 = v4 ^ [(_CPPunchoutForFeedback *)self->_userSelection hash];
  unint64_t v6 = v5 ^ [(_CPCardSectionForFeedback *)self->_cardSection hash];
  uint64_t v7 = v6 ^ [(NSData *)self->_uuidBytes hash];
  uint64_t v8 = v7 ^ [(NSArray *)self->_sections hash] ^ v3;
  return v8 ^ [(NSString *)self->_uploadedDataIdentifier hash] ^ (2654435761 * self->_reportType);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_33;
  }
  unint64_t v6 = [(_CPUserReportFeedback *)self result];
  uint64_t v7 = [v4 result];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v8 = [(_CPUserReportFeedback *)self result];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPUserReportFeedback *)self result];
    v11 = [v4 result];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(_CPUserReportFeedback *)self userSelection];
  uint64_t v7 = [v4 userSelection];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v13 = [(_CPUserReportFeedback *)self userSelection];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(_CPUserReportFeedback *)self userSelection];
    v16 = [v4 userSelection];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(_CPUserReportFeedback *)self cardSection];
  uint64_t v7 = [v4 cardSection];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v18 = [(_CPUserReportFeedback *)self cardSection];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(_CPUserReportFeedback *)self cardSection];
    v21 = [v4 cardSection];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(_CPUserReportFeedback *)self uuidBytes];
  uint64_t v7 = [v4 uuidBytes];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v23 = [(_CPUserReportFeedback *)self uuidBytes];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(_CPUserReportFeedback *)self uuidBytes];
    v26 = [v4 uuidBytes];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(_CPUserReportFeedback *)self sections];
  uint64_t v7 = [v4 sections];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v28 = [(_CPUserReportFeedback *)self sections];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(_CPUserReportFeedback *)self sections];
    v31 = [v4 sections];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(_CPUserReportFeedback *)self uploadedDataIdentifier];
  uint64_t v7 = [v4 uploadedDataIdentifier];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v33 = [(_CPUserReportFeedback *)self uploadedDataIdentifier];
    if (!v33)
    {

LABEL_36:
      int reportType = self->_reportType;
      BOOL v38 = reportType == [v4 reportType];
      goto LABEL_34;
    }
    v34 = (void *)v33;
    v35 = [(_CPUserReportFeedback *)self uploadedDataIdentifier];
    v36 = [v4 uploadedDataIdentifier];
    int v37 = [v35 isEqual:v36];

    if (v37) {
      goto LABEL_36;
    }
  }
  else
  {
LABEL_32:
  }
LABEL_33:
  BOOL v38 = 0;
LABEL_34:

  return v38;
}

- (void)writeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_CPUserReportFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  unint64_t v5 = [(_CPUserReportFeedback *)self result];

  if (v5)
  {
    unint64_t v6 = [(_CPUserReportFeedback *)self result];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_CPUserReportFeedback *)self userSelection];

  if (v7)
  {
    uint64_t v8 = [(_CPUserReportFeedback *)self userSelection];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(_CPUserReportFeedback *)self cardSection];

  if (v9)
  {
    v10 = [(_CPUserReportFeedback *)self cardSection];
    PBDataWriterWriteSubmessage();
  }
  v11 = [(_CPUserReportFeedback *)self uuidBytes];

  if (v11) {
    PBDataWriterWriteDataField();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v12 = self->_sections;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  int v17 = [(_CPUserReportFeedback *)self uploadedDataIdentifier];

  if (v17) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPUserReportFeedback *)self reportType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPUserReportFeedbackReadFrom(self, (uint64_t)a3);
}

- (id)sectionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_sections objectAtIndexedSubscript:a3];
}

- (unint64_t)sectionsCount
{
  return [(NSArray *)self->_sections count];
}

- (void)addSections:(id)a3
{
  id v4 = a3;
  sections = self->_sections;
  id v8 = v4;
  if (!sections)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_sections;
    self->_sections = v6;

    id v4 = v8;
    sections = self->_sections;
  }
  [(NSArray *)sections addObject:v4];
}

- (void)clearSections
{
}

- (void)setSections:(id)a3
{
  self->_sections = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (_CPUserReportFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPUserReportFeedback;
  v2 = [(_CPUserReportFeedback *)&v5 init];
  if (v2)
  {
    [(_CPUserReportFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPUserReportFeedback)initWithFacade:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_CPUserReportFeedback;
  objc_super v5 = [(_CPUserReportFeedback *)&v34 init];
  if (v5)
  {
    -[_CPUserReportFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    unint64_t v6 = [v4 result];

    if (v6)
    {
      uint64_t v7 = [_CPSearchResultForFeedback alloc];
      id v8 = [v4 result];
      v9 = [(_CPSearchResultForFeedback *)v7 initWithFacade:v8];
      [(_CPUserReportFeedback *)v5 setResult:v9];
    }
    v10 = [v4 userSelection];

    if (v10)
    {
      v11 = [_CPPunchoutForFeedback alloc];
      int v12 = [v4 userSelection];
      uint64_t v13 = [(_CPPunchoutForFeedback *)v11 initWithFacade:v12];
      [(_CPUserReportFeedback *)v5 setUserSelection:v13];
    }
    uint64_t v14 = [v4 cardSection];

    if (v14)
    {
      uint64_t v15 = [_CPCardSectionForFeedback alloc];
      uint64_t v16 = [v4 cardSection];
      int v17 = [(_CPCardSectionForFeedback *)v15 initWithFacade:v16];
      [(_CPUserReportFeedback *)v5 setCardSection:v17];
    }
    long long v18 = [v4 sections];
    if (v18) {
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v19 = 0;
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v20 = objc_msgSend(v4, "sections", 0);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [[_CPResultSectionForFeedback alloc] initWithFacade:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          [v19 addObject:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v22);
    }

    [(_CPUserReportFeedback *)v5 setSections:v19];
    v26 = [v4 uploadedDataIdentifier];

    if (v26)
    {
      int v27 = [v4 uploadedDataIdentifier];
      [(_CPUserReportFeedback *)v5 setUploadedDataIdentifier:v27];
    }
    -[_CPUserReportFeedback setReportType:](v5, "setReportType:", [v4 reportType]);
    uint64_t v28 = v5;
  }
  return v5;
}

@end