@interface _CDGenericInteractionRanker
+ (BOOL)isDateInWeekend:(id)a3;
- (BOOL)canRankContacts;
- (BOOL)contactIsAllowed:(id)a3;
- (BOOL)requireAllSeedContacts;
- (NSArray)seedContacts;
- (NSDate)referenceDate;
- (NSSet)allowedIdentifiers;
- (NSSet)allowedPersonIdType;
- (NSSet)allowedPersonIds;
- (NSSet)referenceKeywords;
- (NSString)contactPrefix;
- (NSString)referenceLocationUUID;
- (_CDGenericInteractionRanker)init;
- (double)c;
- (double)contactNameKeywordMatchWeight;
- (double)diffWeekPeriodWeight;
- (double)keywordWeight;
- (double)locationWeight;
- (double)outgoingWeight;
- (double)rankContact:(id)a3;
- (double)sameWeekPeriodWeight;
- (double)socialWeight;
- (double)timeHalfLife;
- (double)timeOfDayHalfLife;
- (double)timeOfDayWeight;
- (double)timeOfWeekHalfLife;
- (double)timeOfWeekWeight;
- (double)timeWeight;
- (id)rankInteraction:(id)a3;
- (unint64_t)rankAggregationMethod;
- (void)setAllowedIdentifiers:(id)a3;
- (void)setAllowedPersonIdType:(id)a3;
- (void)setAllowedPersonIds:(id)a3;
- (void)setC:(double)a3;
- (void)setContactNameKeywordMatchWeight:(double)a3;
- (void)setContactPrefix:(id)a3;
- (void)setDiffWeekPeriodWeight:(double)a3;
- (void)setKeywordWeight:(double)a3;
- (void)setLocationWeight:(double)a3;
- (void)setOutgoingWeight:(double)a3;
- (void)setRankAggregationMethod:(unint64_t)a3;
- (void)setReferenceDate:(id)a3;
- (void)setReferenceKeywords:(id)a3;
- (void)setReferenceLocationUUID:(id)a3;
- (void)setRequireAllSeedContacts:(BOOL)a3;
- (void)setSameWeekPeriodWeight:(double)a3;
- (void)setSeedContacts:(id)a3;
- (void)setSocialWeight:(double)a3;
- (void)setTimeHalfLife:(double)a3;
- (void)setTimeOfDayHalfLife:(double)a3;
- (void)setTimeOfDayWeight:(double)a3;
- (void)setTimeOfWeekHalfLife:(double)a3;
- (void)setTimeOfWeekWeight:(double)a3;
- (void)setTimeWeight:(double)a3;
@end

@implementation _CDGenericInteractionRanker

- (_CDGenericInteractionRanker)init
{
  v6.receiver = self;
  v6.super_class = (Class)_CDGenericInteractionRanker;
  v2 = [(_CDGenericInteractionRanker *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    [(_CDGenericInteractionRanker *)v2 setReferenceDate:v3];

    seedContacts = v2->_seedContacts;
    v2->_seedContacts = (NSArray *)MEMORY[0x1E4F1CBF0];

    *(_OWORD *)&v2->_timeHalfLife = xmmword_18EEAC470;
    *(_OWORD *)&v2->_timeOfWeekHalfLife = xmmword_18EEAC480;
    *(_OWORD *)&v2->_diffWeekPeriodWeight = xmmword_18EEAC490;
    *(_OWORD *)&v2->_socialWeight = xmmword_18EEAC4A0;
    *(_OWORD *)&v2->_keywordWeight = xmmword_18EEAC4B0;
    v2->_requireAllSeedContacts = 0;
    v2->_rankAggregationMethod = 0;
    *(_OWORD *)&v2->_timeOfDayWeight = xmmword_18EEAC490;
    *(_OWORD *)&v2->_c = xmmword_18EEAC4C0;
  }
  return v2;
}

+ (BOOL)isDateInWeekend:(id)a3
{
  uint64_t v3 = isDateInWeekend__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isDateInWeekend__onceToken, &__block_literal_global_41);
  }
  char v5 = [(id)isDateInWeekend__calendar isDateInWeekend:v4];

  return v5;
}

- (id)rankInteraction:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 startDate];
  objc_super v6 = [v4 endDate];

  if (v6)
  {
    v7 = [v4 endDate];
    uint64_t v8 = [v5 laterDate:v7];

    char v5 = (void *)v8;
  }
  [(NSDate *)self->_referenceDate timeIntervalSinceDate:v5];
  long double v10 = v9;
  double v11 = fmod(v9, 86400.0);
  if (v11 >= 86400.0 - v11) {
    double v12 = 86400.0 - v11;
  }
  else {
    double v12 = v11;
  }
  double v13 = fmod(v10, 604800.0);
  if (v13 >= 604800.0 - v13) {
    double v14 = 604800.0 - v13;
  }
  else {
    double v14 = v13;
  }
  double timeWeight = self->_timeWeight;
  float v15 = v10 / self->_timeHalfLife;
  double v70 = exp((float)-(float)(v15 * v15));
  double timeOfDayWeight = self->_timeOfDayWeight;
  float v16 = v12 / self->_timeOfDayHalfLife;
  double v17 = exp((float)-(float)(v16 * v16));
  double timeOfWeekWeight = self->_timeOfWeekWeight;
  float v19 = v14 / self->_timeOfWeekHalfLife;
  double v71 = exp((float)-(float)(v19 * v19));
  double v20 = 1.0;
  double outgoingWeight = 1.0;
  if ([v4 direction]) {
    double outgoingWeight = self->_outgoingWeight;
  }
  if (self->_sameWeekPeriodWeight != self->_diffWeekPeriodWeight)
  {
    int v22 = [(id)objc_opt_class() isDateInWeekend:self->_referenceDate];
    int v23 = [(id)objc_opt_class() isDateInWeekend:v5];
    uint64_t v24 = 136;
    if (v22 != v23) {
      uint64_t v24 = 144;
    }
    double v20 = *(double *)((char *)&self->super.isa + v24);
  }
  seedContacts = self->_seedContacts;
  double locationWeight = 1.0;
  double v27 = 1.0;
  if (seedContacts && [(NSArray *)seedContacts count])
  {
    v66 = self;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v28 = self->_seedContacts;
    uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v77 objects:v82 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      int v31 = 0;
      uint64_t v32 = *(void *)v78;
      while (1)
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v78 != v32) {
            objc_enumerationMutation(v28);
          }
          uint64_t v34 = *(void *)(*((void *)&v77 + 1) + 8 * i);
          v35 = objc_msgSend(v4, "sender", v66);
          if ([v35 mayRepresentSamePersonAs:v34])
          {
          }
          else
          {
            v36 = [v4 recipients];
            BOOL v37 = +[_CDInteractionAdvisorUtils contact:v34 mayRepresentTheSamePersonAsOneOf:v36];

            if (!v37) {
              continue;
            }
          }
          ++v31;
        }
        uint64_t v30 = [(NSArray *)v28 countByEnumeratingWithState:&v77 objects:v82 count:16];
        if (!v30) {
          goto LABEL_30;
        }
      }
    }
    int v31 = 0;
LABEL_30:

    self = v66;
    if (v66->_requireAllSeedContacts && [(NSArray *)v66->_seedContacts count] > v31)
    {
      v38 = 0;
      goto LABEL_67;
    }
    double v27 = v66->_socialWeight * (double)v31;
  }
  double v67 = outgoingWeight;
  double v68 = v12;
  if (self->_referenceLocationUUID
    && ([v4 locationUUID], (uint64_t v39 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v40 = (void *)v39;
    v41 = [v4 locationUUID];
    int v42 = [v41 isEqualToString:self->_referenceLocationUUID];

    if (v42)
    {
      double locationWeight = self->_locationWeight;
      int v42 = 1;
    }
  }
  else
  {
    int v42 = 0;
  }
  referenceKeywords = self->_referenceKeywords;
  double v44 = 1.0;
  if (referenceKeywords
    && [(NSSet *)referenceKeywords count]
    && ([v4 keywords],
        v45 = objc_claimAutoreleasedReturnValue(),
        uint64_t v46 = [v45 count],
        v45,
        v46))
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v47 = [v4 keywords];
    uint64_t v48 = [v47 countByEnumeratingWithState:&v73 objects:v81 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      double v50 = v20;
      unint64_t v51 = 0;
      uint64_t v52 = *(void *)v74;
      do
      {
        for (uint64_t j = 0; j != v49; ++j)
        {
          if (*(void *)v74 != v52) {
            objc_enumerationMutation(v47);
          }
          v51 += -[NSSet containsObject:](self->_referenceKeywords, "containsObject:", *(void *)(*((void *)&v73 + 1) + 8 * j), v66);
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v73 objects:v81 count:16];
      }
      while (v49);

      if (v51)
      {
        char v54 = 0;
        double v44 = self->_keywordWeight * (double)v51;
        goto LABEL_53;
      }
    }
    else
    {
      double v50 = v20;
    }
  }
  else
  {
    double v50 = v20;
  }
  char v54 = 1;
LABEL_53:
  double v55 = timeWeight * v70;
  double v56 = timeOfDayWeight * v17;
  double v57 = locationWeight * v44;
  double c = self->_c;
  v59 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", v66);
  v60 = v59;
  if (fabs(v10) <= 7200.0 && v55 > 0.0) {
    [v59 addObject:&unk_1EDE1DB50];
  }
  double v61 = timeOfWeekWeight * v71;
  double v62 = v27 * v57;
  if (v68 <= 7200.0 && v56 > 0.0) {
    objc_msgSend(v60, "addObject:", &unk_1EDE1DB68, v68);
  }
  v63 = self->_seedContacts;
  if (v63 && [(NSArray *)v63 count]) {
    [v60 addObject:&unk_1EDE1DB80];
  }
  double v64 = v55 + v56 + v61 + c;
  if (v42) {
    [v60 addObject:&unk_1EDE1DB98];
  }
  if ((v54 & 1) == 0) {
    [v60 addObject:&unk_1EDE1DBB0];
  }
  v38 = objc_opt_new();
  [v38 setScore:v64 * (v50 * (v67 * v62))];
  [v38 setReasons:v60];

LABEL_67:
  return v38;
}

- (BOOL)canRankContacts
{
  referenceKeywords = self->_referenceKeywords;
  if (referenceKeywords && [(NSSet *)referenceKeywords count])
  {
    LOBYTE(contactPrefix) = 1;
  }
  else
  {
    contactPrefix = self->_contactPrefix;
    if (contactPrefix) {
      LOBYTE(contactPrefix) = [(NSString *)contactPrefix length] != 0;
    }
  }
  return (char)contactPrefix;
}

- (double)rankContact:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  contactPrefix = self->_contactPrefix;
  if (!contactPrefix
    || ![(NSString *)contactPrefix length]
    || (double v6 = 0.0, [v4 mayContainPrefix:self->_contactPrefix]))
  {
    double v6 = 1.0;
    if (self->_referenceKeywords)
    {
      v7 = [v4 displayName];

      if (v7)
      {
        uint64_t v8 = [v4 displayName];
        long double v9 = [v8 lowercaseString];
        long double v10 = [v9 componentsSeparatedByString:@" "];

        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = 0;
          uint64_t v15 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v19 != v15) {
                objc_enumerationMutation(v11);
              }
              v14 += -[NSSet containsObject:](self->_referenceKeywords, "containsObject:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }
          while (v13);

          if (v14 < 1) {
            double v6 = 1.0;
          }
          else {
            double v6 = self->_contactNameKeywordMatchWeight * (double)v14;
          }
        }
        else
        {
        }
      }
    }
  }

  return v6;
}

- (BOOL)contactIsAllowed:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  allowedPersonIdType = self->_allowedPersonIdType;
  if (allowedPersonIdType)
  {
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "personIdType"));
    BOOL v8 = [(NSSet *)allowedPersonIdType containsObject:v7];

    if (!v8) {
      goto LABEL_7;
    }
  }
  allowedIdentifiers = self->_allowedIdentifiers;
  if (allowedIdentifiers
    && ([v5 identifier],
        long double v10 = objc_claimAutoreleasedReturnValue(),
        BOOL v11 = [(NSSet *)allowedIdentifiers containsObject:v10],
        v10,
        !v11))
  {
LABEL_7:
    char v14 = 0;
  }
  else
  {
    allowedPersonIds = self->_allowedPersonIds;
    if (allowedPersonIds)
    {
      uint64_t v13 = [v5 personId];
      char v14 = [(NSSet *)allowedPersonIds containsObject:v13];
    }
    else
    {
      char v14 = 1;
    }
  }

  return v14;
}

- (NSDate)referenceDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReferenceDate:(id)a3
{
}

- (NSArray)seedContacts
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSeedContacts:(id)a3
{
}

- (NSString)referenceLocationUUID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReferenceLocationUUID:(id)a3
{
}

- (NSSet)referenceKeywords
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReferenceKeywords:(id)a3
{
}

- (NSSet)allowedIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAllowedIdentifiers:(id)a3
{
}

- (NSSet)allowedPersonIds
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAllowedPersonIds:(id)a3
{
}

- (NSSet)allowedPersonIdType
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAllowedPersonIdType:(id)a3
{
}

- (NSString)contactPrefix
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setContactPrefix:(id)a3
{
}

- (double)timeHalfLife
{
  return self->_timeHalfLife;
}

- (void)setTimeHalfLife:(double)a3
{
  self->_timeHalfLife = a3;
}

- (double)timeOfDayHalfLife
{
  return self->_timeOfDayHalfLife;
}

- (void)setTimeOfDayHalfLife:(double)a3
{
  self->_timeOfDayHalfLife = a3;
}

- (double)timeOfWeekHalfLife
{
  return self->_timeOfWeekHalfLife;
}

- (void)setTimeOfWeekHalfLife:(double)a3
{
  self->_timeOfWeekHalfLife = a3;
}

- (double)timeWeight
{
  return self->_timeWeight;
}

- (void)setTimeWeight:(double)a3
{
  self->_double timeWeight = a3;
}

- (double)timeOfDayWeight
{
  return self->_timeOfDayWeight;
}

- (void)setTimeOfDayWeight:(double)a3
{
  self->_double timeOfDayWeight = a3;
}

- (double)timeOfWeekWeight
{
  return self->_timeOfWeekWeight;
}

- (void)setTimeOfWeekWeight:(double)a3
{
  self->_double timeOfWeekWeight = a3;
}

- (double)c
{
  return self->_c;
}

- (void)setC:(double)a3
{
  self->_double c = a3;
}

- (double)sameWeekPeriodWeight
{
  return self->_sameWeekPeriodWeight;
}

- (void)setSameWeekPeriodWeight:(double)a3
{
  self->_sameWeekPeriodWeight = a3;
}

- (double)diffWeekPeriodWeight
{
  return self->_diffWeekPeriodWeight;
}

- (void)setDiffWeekPeriodWeight:(double)a3
{
  self->_diffWeekPeriodWeight = a3;
}

- (double)outgoingWeight
{
  return self->_outgoingWeight;
}

- (void)setOutgoingWeight:(double)a3
{
  self->_double outgoingWeight = a3;
}

- (double)socialWeight
{
  return self->_socialWeight;
}

- (void)setSocialWeight:(double)a3
{
  self->_socialWeight = a3;
}

- (BOOL)requireAllSeedContacts
{
  return self->_requireAllSeedContacts;
}

- (void)setRequireAllSeedContacts:(BOOL)a3
{
  self->_requireAllSeedContacts = a3;
}

- (double)locationWeight
{
  return self->_locationWeight;
}

- (void)setLocationWeight:(double)a3
{
  self->_double locationWeight = a3;
}

- (double)keywordWeight
{
  return self->_keywordWeight;
}

- (void)setKeywordWeight:(double)a3
{
  self->_keywordWeight = a3;
}

- (double)contactNameKeywordMatchWeight
{
  return self->_contactNameKeywordMatchWeight;
}

- (void)setContactNameKeywordMatchWeight:(double)a3
{
  self->_contactNameKeywordMatchWeight = a3;
}

- (unint64_t)rankAggregationMethod
{
  return self->_rankAggregationMethod;
}

- (void)setRankAggregationMethod:(unint64_t)a3
{
  self->_rankAggregationMethod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactPrefix, 0);
  objc_storeStrong((id *)&self->_allowedPersonIdType, 0);
  objc_storeStrong((id *)&self->_allowedPersonIds, 0);
  objc_storeStrong((id *)&self->_allowedIdentifiers, 0);
  objc_storeStrong((id *)&self->_referenceKeywords, 0);
  objc_storeStrong((id *)&self->_referenceLocationUUID, 0);
  objc_storeStrong((id *)&self->_seedContacts, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
}

@end