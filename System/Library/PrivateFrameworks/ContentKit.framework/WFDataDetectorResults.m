@interface WFDataDetectorResults
- (NSArray)URLs;
- (NSArray)dateComponentsResults;
- (NSArray)dates;
- (NSArray)dictionaries;
- (NSArray)phoneNumbers;
- (NSArray)streetAddresses;
- (NSArray)textCheckingResults;
- (NSNumber)number;
- (WFDataDetectorResults)init;
- (WFDataDetectorResults)initWithTextCheckingResults:(id)a3 number:(id)a4 dictionaries:(id)a5 dictionaryType:(id)a6;
- (WFFileType)dictionaryType;
@end

@implementation WFDataDetectorResults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryType, 0);
  objc_storeStrong((id *)&self->_dictionaries, 0);
  objc_storeStrong((id *)&self->_number, 0);
  objc_storeStrong((id *)&self->_textCheckingResults, 0);
}

- (WFFileType)dictionaryType
{
  return self->_dictionaryType;
}

- (NSArray)dictionaries
{
  return self->_dictionaries;
}

- (NSNumber)number
{
  return self->_number;
}

- (NSArray)textCheckingResults
{
  return self->_textCheckingResults;
}

- (NSArray)dateComponentsResults
{
  v2 = [(WFDataDetectorResults *)self textCheckingResults];
  v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_20_20433);

  return (NSArray *)v3;
}

id __46__WFDataDetectorResults_dateComponentsResults__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 resultType] == 8
    && ([v2 date], v3 = objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    v4 = [MEMORY[0x263EFF8F0] currentCalendar];
    v5 = [v2 timeZone];
    v6 = [v2 date];
    if (v5) {
      [v4 componentsInTimeZone:v5 fromDate:v6];
    }
    else {
    v7 = [v4 components:-1 fromDate:v6];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)dates
{
  id v2 = [(WFDataDetectorResults *)self textCheckingResults];
  v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_17);

  return (NSArray *)v3;
}

id __30__WFDataDetectorResults_dates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 resultType] == 8)
  {
    v3 = [v2 date];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSArray)phoneNumbers
{
  id v2 = [(WFDataDetectorResults *)self textCheckingResults];
  v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_13);

  return (NSArray *)v3;
}

id __37__WFDataDetectorResults_phoneNumbers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 resultType] == 2048)
  {
    v3 = +[WFPhoneNumber phoneNumberWithTextCheckingResult:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSArray)streetAddresses
{
  id v2 = [(WFDataDetectorResults *)self textCheckingResults];
  v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_10_20440);

  return (NSArray *)v3;
}

id __40__WFDataDetectorResults_streetAddresses__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 resultType] == 16)
  {
    v3 = +[WFStreetAddress streetAddressWithTextCheckingResult:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSArray)URLs
{
  id v2 = [(WFDataDetectorResults *)self textCheckingResults];
  v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_20444);

  return (NSArray *)v3;
}

id __29__WFDataDetectorResults_URLs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 resultType] == 32)
  {
    v3 = [v2 URL];
    v4 = WFAppTransportSecuredURL(v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (WFDataDetectorResults)init
{
  return [(WFDataDetectorResults *)self initWithTextCheckingResults:MEMORY[0x263EFFA68] number:0 dictionaries:0 dictionaryType:0];
}

- (WFDataDetectorResults)initWithTextCheckingResults:(id)a3 number:(id)a4 dictionaries:(id)a5 dictionaryType:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)WFDataDetectorResults;
  v14 = [(WFDataDetectorResults *)&v21 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    textCheckingResults = v14->_textCheckingResults;
    v14->_textCheckingResults = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_number, a4);
    uint64_t v17 = [v12 copy];
    dictionaries = v14->_dictionaries;
    v14->_dictionaries = (NSArray *)v17;

    objc_storeStrong((id *)&v14->_dictionaryType, a6);
    v19 = v14;
  }

  return v14;
}

@end