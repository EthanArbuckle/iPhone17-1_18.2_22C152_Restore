@interface FHRealtimeFeaturesResponse
- (BOOL)isInternationalSpend;
- (BOOL)isTapToPay;
- (NSDictionary)smartCompoundFeatures;
- (NSString)country;
- (NSString)merchantDisplayName;
- (id)description;
- (id)smartCompoundFeaturesDictionaryForJson;
- (unint64_t)mapsMerchantBrandID;
- (unint64_t)mapsMerchantID;
- (unint64_t)merchantCategory;
- (unint64_t)repeatingPatternClass;
- (unint64_t)timeOfDay;
- (unint64_t)transactionDateAtZerothHour;
- (void)setCountry:(id)a3;
- (void)setIsInternationalSpend:(BOOL)a3;
- (void)setIsTapToPay:(BOOL)a3;
- (void)setMapsMerchantBrandID:(unint64_t)a3;
- (void)setMapsMerchantID:(unint64_t)a3;
- (void)setMerchantCategory:(unint64_t)a3;
- (void)setMerchantDisplayName:(id)a3;
- (void)setRepeatingPatternClass:(unint64_t)a3;
- (void)setSmartCompoundFeatures:(id)a3;
- (void)setTimeOfDay:(unint64_t)a3;
- (void)setTransactionDateAtZerothHour:(unint64_t)a3;
@end

@implementation FHRealtimeFeaturesResponse

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"timeOfDay: '%lu'; ", self->_timeOfDay);
  objc_msgSend(v3, "appendFormat:", @"transactionDateAtZerothHour: '%lu'; ", self->_transactionDateAtZerothHour);
  objc_msgSend(v3, "appendFormat:", @"isInternationalSpend: '%d'; ", self->_isInternationalSpend);
  objc_msgSend(v3, "appendFormat:", @"isTapToPay: '%d'; ", self->_isTapToPay);
  objc_msgSend(v3, "appendFormat:", @"merchantCategory: '%lu'; ", self->_merchantCategory);
  [v3 appendFormat:@"country: '%@'; ", self->_country];
  [v3 appendFormat:@"merchantDisplayName: '%@'; ", self->_merchantDisplayName];
  objc_msgSend(v3, "appendFormat:", @"mapsMerchantID: '%llu'; ", self->_mapsMerchantID);
  objc_msgSend(v3, "appendFormat:", @"mapsMerchantBrandID: '%llu'; ", self->_mapsMerchantBrandID);
  [v3 appendFormat:@"smartCompoundFeatures: '%@'; ", self->_smartCompoundFeatures];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)smartCompoundFeaturesDictionaryForJson
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v34 = objc_opt_new();
  smartCompoundFeatures = self->_smartCompoundFeatures;
  if (smartCompoundFeatures)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obj = smartCompoundFeatures;
    uint64_t v4 = [(NSDictionary *)obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = 0;
      uint64_t v7 = *(void *)v47;
      uint64_t v30 = *(void *)v47;
      v31 = self;
      do
      {
        uint64_t v8 = 0;
        v9 = v6;
        uint64_t v32 = v5;
        do
        {
          if (*(void *)v47 != v7) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(id *)(*((void *)&v46 + 1) + 8 * v8);

          v10 = [(NSDictionary *)self->_smartCompoundFeatures objectForKey:v6];
          if ([v10 count])
          {
            v40 = objc_opt_new();
            long long v42 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v38 = v10;
            uint64_t v41 = [v38 countByEnumeratingWithState:&v42 objects:v50 count:16];
            if (v41)
            {
              v35 = v10;
              uint64_t v36 = v8;
              id v37 = v6;
              id v11 = 0;
              uint64_t v39 = *(void *)v43;
              do
              {
                uint64_t v12 = 0;
                v13 = v11;
                do
                {
                  if (*(void *)v43 != v39) {
                    objc_enumerationMutation(v38);
                  }
                  id v11 = *(id *)(*((void *)&v42 + 1) + 8 * v12);

                  v14 = [v11 eventIdentifiers];

                  v15 = NSDictionary;
                  v16 = [v11 featureLabel];
                  uint64_t v17 = [v11 featureRank];
                  v18 = (void *)v17;
                  if (v14)
                  {
                    v19 = [v11 eventIdentifiers];
                    v20 = NSNumber;
                    v21 = [v11 eventStartDate];
                    [v21 timeIntervalSinceReferenceDate];
                    v22 = objc_msgSend(v20, "numberWithDouble:");
                    v23 = NSNumber;
                    v24 = [v11 eventEndDate];
                    [v24 timeIntervalSinceReferenceDate];
                    v25 = objc_msgSend(v23, "numberWithDouble:");
                    v26 = objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v16, @"featureLabel", v18, @"featureRank", v19, @"featureEventIdentifiers", v22, @"featureEventStartDate", v25, @"featureEventEndDate", 0);
                    [v40 addObject:v26];
                  }
                  else
                  {
                    v19 = objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v16, @"featureLabel", v17, @"featureRank", 0);
                    [v40 addObject:v19];
                  }

                  ++v12;
                  v13 = v11;
                }
                while (v41 != v12);
                uint64_t v41 = [v38 countByEnumeratingWithState:&v42 objects:v50 count:16];
              }
              while (v41);

              uint64_t v7 = v30;
              self = v31;
              uint64_t v5 = v32;
              uint64_t v8 = v36;
              id v6 = v37;
              v10 = v35;
            }

            v27 = [MEMORY[0x263EFF8C0] arrayWithArray:v40];
            [v34 setObject:v27 forKey:v6];
          }
          ++v8;
          v9 = v6;
        }
        while (v8 != v5);
        uint64_t v5 = [(NSDictionary *)obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v5);
    }
  }
  v28 = [NSDictionary dictionaryWithDictionary:v34];

  return v28;
}

- (unint64_t)timeOfDay
{
  return self->_timeOfDay;
}

- (void)setTimeOfDay:(unint64_t)a3
{
  self->_timeOfDay = a3;
}

- (unint64_t)transactionDateAtZerothHour
{
  return self->_transactionDateAtZerothHour;
}

- (void)setTransactionDateAtZerothHour:(unint64_t)a3
{
  self->_transactionDateAtZerothHour = a3;
}

- (BOOL)isInternationalSpend
{
  return self->_isInternationalSpend;
}

- (void)setIsInternationalSpend:(BOOL)a3
{
  self->_isInternationalSpend = a3;
}

- (BOOL)isTapToPay
{
  return self->_isTapToPay;
}

- (void)setIsTapToPay:(BOOL)a3
{
  self->_isTapToPay = a3;
}

- (unint64_t)merchantCategory
{
  return self->_merchantCategory;
}

- (void)setMerchantCategory:(unint64_t)a3
{
  self->_merchantCategory = a3;
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

- (NSString)merchantDisplayName
{
  return self->_merchantDisplayName;
}

- (void)setMerchantDisplayName:(id)a3
{
}

- (unint64_t)mapsMerchantID
{
  return self->_mapsMerchantID;
}

- (void)setMapsMerchantID:(unint64_t)a3
{
  self->_mapsMerchantID = a3;
}

- (unint64_t)mapsMerchantBrandID
{
  return self->_mapsMerchantBrandID;
}

- (void)setMapsMerchantBrandID:(unint64_t)a3
{
  self->_mapsMerchantBrandID = a3;
}

- (NSDictionary)smartCompoundFeatures
{
  return self->_smartCompoundFeatures;
}

- (void)setSmartCompoundFeatures:(id)a3
{
}

- (unint64_t)repeatingPatternClass
{
  return self->_repeatingPatternClass;
}

- (void)setRepeatingPatternClass:(unint64_t)a3
{
  self->_repeatingPatternClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartCompoundFeatures, 0);
  objc_storeStrong((id *)&self->_merchantDisplayName, 0);
  objc_storeStrong((id *)&self->_country, 0);
}

@end