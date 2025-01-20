@interface GEOTransitPaymentMethodSuggestion
- (GEOFormattedString)educationalScreenTitle;
- (GEOFormattedString)tipSubtitle;
- (GEOFormattedString)tipTitle;
- (GEOTransitPaymentMethodSuggestion)initWithSuggestionData:(id)a3;
- (NSArray)educationalScreenAssets;
- (NSArray)educationalScreenPaymentBody;
- (NSArray)paymentMethodIndices;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)purpose;
- (int)type;
- (unint64_t)marketMUID;
@end

@implementation GEOTransitPaymentMethodSuggestion

- (GEOTransitPaymentMethodSuggestion)initWithSuggestionData:(id)a3
{
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)GEOTransitPaymentMethodSuggestion;
  v6 = [(GEOTransitPaymentMethodSuggestion *)&v35 init];
  if (v6)
  {
    v7 = [v5 paymentMethodSuggestionDetails];
    v8 = v7;
    v6->marketMUID = 0;
    if (v7)
    {
      if ([v7 hasPaymentMethodRegionMuid]) {
        v6->marketMUID = [v8 paymentMethodRegionMuid];
      }
      id v9 = v5;
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "paymentMethodIndexsCount"));
      if ([v9 paymentMethodIndexsCount])
      {
        unint64_t v11 = 0;
        do
        {
          uint64_t v12 = [v9 paymentMethodIndexs];
          v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v12 + 4 * v11)];
          [v10 addObject:v13];

          ++v11;
        }
        while (v11 < [v9 paymentMethodIndexsCount]);
      }
      uint64_t v14 = [v10 copy];

      paymentMethodIndices = v6->paymentMethodIndices;
      v6->paymentMethodIndices = (NSArray *)v14;

      uint64_t v16 = [v8 suggestionTitle];
      tipTitle = v6->tipTitle;
      v6->tipTitle = (GEOFormattedString *)v16;

      uint64_t v18 = [v8 suggestionBody];
      tipSubtitle = v6->tipSubtitle;
      v6->tipSubtitle = (GEOFormattedString *)v18;

      uint64_t v20 = [v8 educationalScreenAssets];
      educationalScreenAssets = v6->educationalScreenAssets;
      v6->educationalScreenAssets = (NSArray *)v20;

      uint64_t v22 = [v8 educationalScreenPaymentBodys];
      educationalScreenPaymentBody = v6->educationalScreenPaymentBody;
      v6->educationalScreenPaymentBody = (NSArray *)v22;

      uint64_t v24 = [v8 educationalScreenHeader];
      educationalScreenTitle = v6->educationalScreenTitle;
      v6->educationalScreenTitle = (GEOFormattedString *)v24;
    }
    else
    {
      id v26 = v5;
      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v26, "paymentMethodIndexsCount"));
      if ([v26 paymentMethodIndexsCount])
      {
        unint64_t v28 = 0;
        do
        {
          uint64_t v29 = [v26 paymentMethodIndexs];
          v30 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v29 + 4 * v28)];
          [v27 addObject:v30];

          ++v28;
        }
        while (v28 < [v26 paymentMethodIndexsCount]);
      }
      uint64_t v31 = [v27 copy];

      educationalScreenTitle = v6->paymentMethodIndices;
      v6->paymentMethodIndices = (NSArray *)v31;
    }

    *(void *)&v6->purpose = 0;
    if ([v5 hasPurpose])
    {
      unsigned int v32 = [v5 purpose];
      if (v32 <= 2) {
        v6->purpose = v32;
      }
    }
    if ([v5 hasType])
    {
      unsigned int v33 = [v5 type];
      if (v33 <= 4) {
        v6->type = v33;
      }
    }
    objc_storeStrong((id *)&v6->_suggestion, a3);
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[GEOTransitPaymentMethodSuggestion allocWithZone:](GEOTransitPaymentMethodSuggestion, "allocWithZone:");
  id v6 = [(GEOPBTransitPaymentMethodSuggestion *)self->_suggestion copyWithZone:a3];
  v7 = [(GEOTransitPaymentMethodSuggestion *)v5 initWithSuggestionData:v6];

  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@" GEOTransitPaymentMethodSuggestion:\n"];
  objc_msgSend(v3, "appendFormat:", @" marketMUID:                     '%llu'\n", -[GEOTransitPaymentMethodSuggestion marketMUID](self, "marketMUID"));
  v4 = [(GEOTransitPaymentMethodSuggestion *)self paymentMethodIndices];
  [v3 appendFormat:@" paymentMethodIndices:           '%@'\n", v4];

  id v5 = [(GEOTransitPaymentMethodSuggestion *)self tipTitle];
  [v3 appendFormat:@" tipTitle:                       '%@'\n", v5];

  id v6 = [(GEOTransitPaymentMethodSuggestion *)self tipSubtitle];
  [v3 appendFormat:@" tipSubtitle:                    '%@'\n", v6];

  v7 = [(GEOTransitPaymentMethodSuggestion *)self educationalScreenAssets];
  [v3 appendFormat:@" educationalScreenAssets:        '%@'\n", v7];

  v8 = [(GEOTransitPaymentMethodSuggestion *)self educationalScreenPaymentBody];
  [v3 appendFormat:@" educationalScreenPaymentBody:   '%@'\n", v8];

  id v9 = [(GEOTransitPaymentMethodSuggestion *)self educationalScreenTitle];
  [v3 appendFormat:@" educationalScreenTitle:         '%@'\n", v9];

  v10 = [(GEOPBTransitPaymentMethodSuggestion *)self->_suggestion purposeAsString:[(GEOTransitPaymentMethodSuggestion *)self purpose]];
  [v3 appendFormat:@" purpose:                        '%@'\n", v10];

  unint64_t v11 = (void *)[[NSString alloc] initWithString:v3];

  return v11;
}

- (unint64_t)marketMUID
{
  return self->marketMUID;
}

- (NSArray)paymentMethodIndices
{
  return self->paymentMethodIndices;
}

- (GEOFormattedString)tipTitle
{
  return self->tipTitle;
}

- (GEOFormattedString)tipSubtitle
{
  return self->tipSubtitle;
}

- (NSArray)educationalScreenAssets
{
  return self->educationalScreenAssets;
}

- (NSArray)educationalScreenPaymentBody
{
  return self->educationalScreenPaymentBody;
}

- (GEOFormattedString)educationalScreenTitle
{
  return self->educationalScreenTitle;
}

- (int)purpose
{
  return self->purpose;
}

- (int)type
{
  return self->type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->educationalScreenTitle, 0);
  objc_storeStrong((id *)&self->educationalScreenPaymentBody, 0);
  objc_storeStrong((id *)&self->educationalScreenAssets, 0);
  objc_storeStrong((id *)&self->tipSubtitle, 0);
  objc_storeStrong((id *)&self->tipTitle, 0);
  objc_storeStrong((id *)&self->paymentMethodIndices, 0);

  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end