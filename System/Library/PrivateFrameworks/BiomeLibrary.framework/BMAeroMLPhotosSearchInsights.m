@interface BMAeroMLPhotosSearchInsights
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAeroMLPhotosSearchInsights)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMAeroMLPhotosSearchInsights)initWithWasThereAnyResultsShown:(id)a3 searchResultSize:(id)a4 didUserViewAnyPhoto:(id)a5 viewedPhotoCount:(id)a6 uiSurface:(int)a7 sizeOfPhotoDB:(id)a8 numberOfSearchesFromThisSurfaceLastWeek:(id)a9 numberOfSearchesFromThisSurfaceWeeklyAvg:(id)a10 queryRaw:(id)a11 numberOfTokensInQuery:(id)a12 numberOfKnownEntitiesInQuery:(id)a13 isSpecificPersonInQuery:(id)a14 isGeneralPersonReferenceInQuery:(id)a15 isSpecificLocationInQuery:(id)a16 isGeneralLocationReferenceInQuery:(id)a17 isSpecificDateInQuery:(id)a18 isGeneralDateReferenceInQuery:(id)a19 isHolidayReferenceInQuery:(id)a20 isActionRunningInQuery:(id)a21 isActionHoldingInQuery:(id)a22 isActionClimbingInQuery:(id)a23;
- (BOOL)didUserViewAnyPhoto;
- (BOOL)hasDidUserViewAnyPhoto;
- (BOOL)hasIsActionClimbingInQuery;
- (BOOL)hasIsActionHoldingInQuery;
- (BOOL)hasIsActionRunningInQuery;
- (BOOL)hasIsGeneralDateReferenceInQuery;
- (BOOL)hasIsGeneralLocationReferenceInQuery;
- (BOOL)hasIsGeneralPersonReferenceInQuery;
- (BOOL)hasIsHolidayReferenceInQuery;
- (BOOL)hasIsSpecificDateInQuery;
- (BOOL)hasIsSpecificLocationInQuery;
- (BOOL)hasIsSpecificPersonInQuery;
- (BOOL)hasNumberOfKnownEntitiesInQuery;
- (BOOL)hasNumberOfSearchesFromThisSurfaceLastWeek;
- (BOOL)hasNumberOfSearchesFromThisSurfaceWeeklyAvg;
- (BOOL)hasNumberOfTokensInQuery;
- (BOOL)hasSearchResultSize;
- (BOOL)hasSizeOfPhotoDB;
- (BOOL)hasViewedPhotoCount;
- (BOOL)hasWasThereAnyResultsShown;
- (BOOL)isActionClimbingInQuery;
- (BOOL)isActionHoldingInQuery;
- (BOOL)isActionRunningInQuery;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGeneralDateReferenceInQuery;
- (BOOL)isGeneralLocationReferenceInQuery;
- (BOOL)isGeneralPersonReferenceInQuery;
- (BOOL)isHolidayReferenceInQuery;
- (BOOL)isSpecificDateInQuery;
- (BOOL)isSpecificLocationInQuery;
- (BOOL)isSpecificPersonInQuery;
- (BOOL)wasThereAnyResultsShown;
- (NSString)description;
- (NSString)queryRaw;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)uiSurface;
- (unsigned)dataVersion;
- (unsigned)numberOfKnownEntitiesInQuery;
- (unsigned)numberOfSearchesFromThisSurfaceLastWeek;
- (unsigned)numberOfSearchesFromThisSurfaceWeeklyAvg;
- (unsigned)numberOfTokensInQuery;
- (unsigned)searchResultSize;
- (unsigned)sizeOfPhotoDB;
- (unsigned)viewedPhotoCount;
- (void)setHasDidUserViewAnyPhoto:(BOOL)a3;
- (void)setHasIsActionClimbingInQuery:(BOOL)a3;
- (void)setHasIsActionHoldingInQuery:(BOOL)a3;
- (void)setHasIsActionRunningInQuery:(BOOL)a3;
- (void)setHasIsGeneralDateReferenceInQuery:(BOOL)a3;
- (void)setHasIsGeneralLocationReferenceInQuery:(BOOL)a3;
- (void)setHasIsGeneralPersonReferenceInQuery:(BOOL)a3;
- (void)setHasIsHolidayReferenceInQuery:(BOOL)a3;
- (void)setHasIsSpecificDateInQuery:(BOOL)a3;
- (void)setHasIsSpecificLocationInQuery:(BOOL)a3;
- (void)setHasIsSpecificPersonInQuery:(BOOL)a3;
- (void)setHasNumberOfKnownEntitiesInQuery:(BOOL)a3;
- (void)setHasNumberOfSearchesFromThisSurfaceLastWeek:(BOOL)a3;
- (void)setHasNumberOfSearchesFromThisSurfaceWeeklyAvg:(BOOL)a3;
- (void)setHasNumberOfTokensInQuery:(BOOL)a3;
- (void)setHasSearchResultSize:(BOOL)a3;
- (void)setHasSizeOfPhotoDB:(BOOL)a3;
- (void)setHasViewedPhotoCount:(BOOL)a3;
- (void)setHasWasThereAnyResultsShown:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAeroMLPhotosSearchInsights

- (void).cxx_destruct
{
}

- (void)setHasIsActionClimbingInQuery:(BOOL)a3
{
  self->_hasIsActionClimbingInQuery = a3;
}

- (BOOL)hasIsActionClimbingInQuery
{
  return self->_hasIsActionClimbingInQuery;
}

- (BOOL)isActionClimbingInQuery
{
  return self->_isActionClimbingInQuery;
}

- (void)setHasIsActionHoldingInQuery:(BOOL)a3
{
  self->_hasIsActionHoldingInQuery = a3;
}

- (BOOL)hasIsActionHoldingInQuery
{
  return self->_hasIsActionHoldingInQuery;
}

- (BOOL)isActionHoldingInQuery
{
  return self->_isActionHoldingInQuery;
}

- (void)setHasIsActionRunningInQuery:(BOOL)a3
{
  self->_hasIsActionRunningInQuery = a3;
}

- (BOOL)hasIsActionRunningInQuery
{
  return self->_hasIsActionRunningInQuery;
}

- (BOOL)isActionRunningInQuery
{
  return self->_isActionRunningInQuery;
}

- (void)setHasIsHolidayReferenceInQuery:(BOOL)a3
{
  self->_hasIsHolidayReferenceInQuery = a3;
}

- (BOOL)hasIsHolidayReferenceInQuery
{
  return self->_hasIsHolidayReferenceInQuery;
}

- (BOOL)isHolidayReferenceInQuery
{
  return self->_isHolidayReferenceInQuery;
}

- (void)setHasIsGeneralDateReferenceInQuery:(BOOL)a3
{
  self->_hasIsGeneralDateReferenceInQuery = a3;
}

- (BOOL)hasIsGeneralDateReferenceInQuery
{
  return self->_hasIsGeneralDateReferenceInQuery;
}

- (BOOL)isGeneralDateReferenceInQuery
{
  return self->_isGeneralDateReferenceInQuery;
}

- (void)setHasIsSpecificDateInQuery:(BOOL)a3
{
  self->_hasIsSpecificDateInQuery = a3;
}

- (BOOL)hasIsSpecificDateInQuery
{
  return self->_hasIsSpecificDateInQuery;
}

- (BOOL)isSpecificDateInQuery
{
  return self->_isSpecificDateInQuery;
}

- (void)setHasIsGeneralLocationReferenceInQuery:(BOOL)a3
{
  self->_hasIsGeneralLocationReferenceInQuery = a3;
}

- (BOOL)hasIsGeneralLocationReferenceInQuery
{
  return self->_hasIsGeneralLocationReferenceInQuery;
}

- (BOOL)isGeneralLocationReferenceInQuery
{
  return self->_isGeneralLocationReferenceInQuery;
}

- (void)setHasIsSpecificLocationInQuery:(BOOL)a3
{
  self->_hasIsSpecificLocationInQuery = a3;
}

- (BOOL)hasIsSpecificLocationInQuery
{
  return self->_hasIsSpecificLocationInQuery;
}

- (BOOL)isSpecificLocationInQuery
{
  return self->_isSpecificLocationInQuery;
}

- (void)setHasIsGeneralPersonReferenceInQuery:(BOOL)a3
{
  self->_hasIsGeneralPersonReferenceInQuery = a3;
}

- (BOOL)hasIsGeneralPersonReferenceInQuery
{
  return self->_hasIsGeneralPersonReferenceInQuery;
}

- (BOOL)isGeneralPersonReferenceInQuery
{
  return self->_isGeneralPersonReferenceInQuery;
}

- (void)setHasIsSpecificPersonInQuery:(BOOL)a3
{
  self->_hasIsSpecificPersonInQuery = a3;
}

- (BOOL)hasIsSpecificPersonInQuery
{
  return self->_hasIsSpecificPersonInQuery;
}

- (BOOL)isSpecificPersonInQuery
{
  return self->_isSpecificPersonInQuery;
}

- (void)setHasNumberOfKnownEntitiesInQuery:(BOOL)a3
{
  self->_hasNumberOfKnownEntitiesInQuery = a3;
}

- (BOOL)hasNumberOfKnownEntitiesInQuery
{
  return self->_hasNumberOfKnownEntitiesInQuery;
}

- (unsigned)numberOfKnownEntitiesInQuery
{
  return self->_numberOfKnownEntitiesInQuery;
}

- (void)setHasNumberOfTokensInQuery:(BOOL)a3
{
  self->_hasNumberOfTokensInQuery = a3;
}

- (BOOL)hasNumberOfTokensInQuery
{
  return self->_hasNumberOfTokensInQuery;
}

- (unsigned)numberOfTokensInQuery
{
  return self->_numberOfTokensInQuery;
}

- (NSString)queryRaw
{
  return self->_queryRaw;
}

- (void)setHasNumberOfSearchesFromThisSurfaceWeeklyAvg:(BOOL)a3
{
  self->_hasNumberOfSearchesFromThisSurfaceWeeklyAvg = a3;
}

- (BOOL)hasNumberOfSearchesFromThisSurfaceWeeklyAvg
{
  return self->_hasNumberOfSearchesFromThisSurfaceWeeklyAvg;
}

- (unsigned)numberOfSearchesFromThisSurfaceWeeklyAvg
{
  return self->_numberOfSearchesFromThisSurfaceWeeklyAvg;
}

- (void)setHasNumberOfSearchesFromThisSurfaceLastWeek:(BOOL)a3
{
  self->_hasNumberOfSearchesFromThisSurfaceLastWeek = a3;
}

- (BOOL)hasNumberOfSearchesFromThisSurfaceLastWeek
{
  return self->_hasNumberOfSearchesFromThisSurfaceLastWeek;
}

- (unsigned)numberOfSearchesFromThisSurfaceLastWeek
{
  return self->_numberOfSearchesFromThisSurfaceLastWeek;
}

- (void)setHasSizeOfPhotoDB:(BOOL)a3
{
  self->_hasSizeOfPhotoDB = a3;
}

- (BOOL)hasSizeOfPhotoDB
{
  return self->_hasSizeOfPhotoDB;
}

- (unsigned)sizeOfPhotoDB
{
  return self->_sizeOfPhotoDB;
}

- (int)uiSurface
{
  return self->_uiSurface;
}

- (void)setHasViewedPhotoCount:(BOOL)a3
{
  self->_hasViewedPhotoCount = a3;
}

- (BOOL)hasViewedPhotoCount
{
  return self->_hasViewedPhotoCount;
}

- (unsigned)viewedPhotoCount
{
  return self->_viewedPhotoCount;
}

- (void)setHasDidUserViewAnyPhoto:(BOOL)a3
{
  self->_hasDidUserViewAnyPhoto = a3;
}

- (BOOL)hasDidUserViewAnyPhoto
{
  return self->_hasDidUserViewAnyPhoto;
}

- (BOOL)didUserViewAnyPhoto
{
  return self->_didUserViewAnyPhoto;
}

- (void)setHasSearchResultSize:(BOOL)a3
{
  self->_hasSearchResultSize = a3;
}

- (BOOL)hasSearchResultSize
{
  return self->_hasSearchResultSize;
}

- (unsigned)searchResultSize
{
  return self->_searchResultSize;
}

- (void)setHasWasThereAnyResultsShown:(BOOL)a3
{
  self->_hasWasThereAnyResultsShown = a3;
}

- (BOOL)hasWasThereAnyResultsShown
{
  return self->_hasWasThereAnyResultsShown;
}

- (BOOL)wasThereAnyResultsShown
{
  return self->_wasThereAnyResultsShown;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(BMAeroMLPhotosSearchInsights *)self hasWasThereAnyResultsShown]
      || [v5 hasWasThereAnyResultsShown])
    {
      if (![(BMAeroMLPhotosSearchInsights *)self hasWasThereAnyResultsShown]) {
        goto LABEL_103;
      }
      if (![v5 hasWasThereAnyResultsShown]) {
        goto LABEL_103;
      }
      int v6 = [(BMAeroMLPhotosSearchInsights *)self wasThereAnyResultsShown];
      if (v6 != [v5 wasThereAnyResultsShown]) {
        goto LABEL_103;
      }
    }
    if ([(BMAeroMLPhotosSearchInsights *)self hasSearchResultSize]
      || [v5 hasSearchResultSize])
    {
      if (![(BMAeroMLPhotosSearchInsights *)self hasSearchResultSize]) {
        goto LABEL_103;
      }
      if (![v5 hasSearchResultSize]) {
        goto LABEL_103;
      }
      unsigned int v7 = [(BMAeroMLPhotosSearchInsights *)self searchResultSize];
      if (v7 != [v5 searchResultSize]) {
        goto LABEL_103;
      }
    }
    if ([(BMAeroMLPhotosSearchInsights *)self hasDidUserViewAnyPhoto]
      || [v5 hasDidUserViewAnyPhoto])
    {
      if (![(BMAeroMLPhotosSearchInsights *)self hasDidUserViewAnyPhoto]) {
        goto LABEL_103;
      }
      if (![v5 hasDidUserViewAnyPhoto]) {
        goto LABEL_103;
      }
      int v8 = [(BMAeroMLPhotosSearchInsights *)self didUserViewAnyPhoto];
      if (v8 != [v5 didUserViewAnyPhoto]) {
        goto LABEL_103;
      }
    }
    if ([(BMAeroMLPhotosSearchInsights *)self hasViewedPhotoCount]
      || [v5 hasViewedPhotoCount])
    {
      if (![(BMAeroMLPhotosSearchInsights *)self hasViewedPhotoCount]) {
        goto LABEL_103;
      }
      if (![v5 hasViewedPhotoCount]) {
        goto LABEL_103;
      }
      unsigned int v9 = [(BMAeroMLPhotosSearchInsights *)self viewedPhotoCount];
      if (v9 != [v5 viewedPhotoCount]) {
        goto LABEL_103;
      }
    }
    int v10 = [(BMAeroMLPhotosSearchInsights *)self uiSurface];
    if (v10 != [v5 uiSurface]) {
      goto LABEL_103;
    }
    if ([(BMAeroMLPhotosSearchInsights *)self hasSizeOfPhotoDB]
      || [v5 hasSizeOfPhotoDB])
    {
      if (![(BMAeroMLPhotosSearchInsights *)self hasSizeOfPhotoDB]) {
        goto LABEL_103;
      }
      if (![v5 hasSizeOfPhotoDB]) {
        goto LABEL_103;
      }
      unsigned int v11 = [(BMAeroMLPhotosSearchInsights *)self sizeOfPhotoDB];
      if (v11 != [v5 sizeOfPhotoDB]) {
        goto LABEL_103;
      }
    }
    if (-[BMAeroMLPhotosSearchInsights hasNumberOfSearchesFromThisSurfaceLastWeek](self, "hasNumberOfSearchesFromThisSurfaceLastWeek")|| [v5 hasNumberOfSearchesFromThisSurfaceLastWeek])
    {
      if (![(BMAeroMLPhotosSearchInsights *)self hasNumberOfSearchesFromThisSurfaceLastWeek])goto LABEL_103; {
      if (![v5 hasNumberOfSearchesFromThisSurfaceLastWeek])
      }
        goto LABEL_103;
      unsigned int v12 = [(BMAeroMLPhotosSearchInsights *)self numberOfSearchesFromThisSurfaceLastWeek];
      if (v12 != [v5 numberOfSearchesFromThisSurfaceLastWeek]) {
        goto LABEL_103;
      }
    }
    if (-[BMAeroMLPhotosSearchInsights hasNumberOfSearchesFromThisSurfaceWeeklyAvg](self, "hasNumberOfSearchesFromThisSurfaceWeeklyAvg")|| [v5 hasNumberOfSearchesFromThisSurfaceWeeklyAvg])
    {
      if (![(BMAeroMLPhotosSearchInsights *)self hasNumberOfSearchesFromThisSurfaceWeeklyAvg])goto LABEL_103; {
      if (![v5 hasNumberOfSearchesFromThisSurfaceWeeklyAvg])
      }
        goto LABEL_103;
      unsigned int v13 = [(BMAeroMLPhotosSearchInsights *)self numberOfSearchesFromThisSurfaceWeeklyAvg];
      if (v13 != [v5 numberOfSearchesFromThisSurfaceWeeklyAvg]) {
        goto LABEL_103;
      }
    }
    v14 = [(BMAeroMLPhotosSearchInsights *)self queryRaw];
    uint64_t v15 = [v5 queryRaw];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMAeroMLPhotosSearchInsights *)self queryRaw];
      v18 = [v5 queryRaw];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_103;
      }
    }
    if (![(BMAeroMLPhotosSearchInsights *)self hasNumberOfTokensInQuery]
      && ![v5 hasNumberOfTokensInQuery]
      || [(BMAeroMLPhotosSearchInsights *)self hasNumberOfTokensInQuery]
      && [v5 hasNumberOfTokensInQuery]
      && (unsigned int v21 = [(BMAeroMLPhotosSearchInsights *)self numberOfTokensInQuery],
          v21 == [v5 numberOfTokensInQuery]))
    {
      if (![(BMAeroMLPhotosSearchInsights *)self hasNumberOfKnownEntitiesInQuery]
        && ![v5 hasNumberOfKnownEntitiesInQuery]
        || [(BMAeroMLPhotosSearchInsights *)self hasNumberOfKnownEntitiesInQuery]
        && [v5 hasNumberOfKnownEntitiesInQuery]
        && (unsigned int v22 = [(BMAeroMLPhotosSearchInsights *)self numberOfKnownEntitiesInQuery],
            v22 == [v5 numberOfKnownEntitiesInQuery]))
      {
        if (![(BMAeroMLPhotosSearchInsights *)self hasIsSpecificPersonInQuery]
          && ![v5 hasIsSpecificPersonInQuery]
          || [(BMAeroMLPhotosSearchInsights *)self hasIsSpecificPersonInQuery]
          && [v5 hasIsSpecificPersonInQuery]
          && (int v23 = [(BMAeroMLPhotosSearchInsights *)self isSpecificPersonInQuery],
              v23 == [v5 isSpecificPersonInQuery]))
        {
          if (!-[BMAeroMLPhotosSearchInsights hasIsGeneralPersonReferenceInQuery](self, "hasIsGeneralPersonReferenceInQuery")&& ![v5 hasIsGeneralPersonReferenceInQuery]|| -[BMAeroMLPhotosSearchInsights hasIsGeneralPersonReferenceInQuery](self, "hasIsGeneralPersonReferenceInQuery")&& objc_msgSend(v5, "hasIsGeneralPersonReferenceInQuery")&& (int v24 = -[BMAeroMLPhotosSearchInsights isGeneralPersonReferenceInQuery](self, "isGeneralPersonReferenceInQuery"), v24 == objc_msgSend(v5, "isGeneralPersonReferenceInQuery")))
          {
            if (![(BMAeroMLPhotosSearchInsights *)self hasIsSpecificLocationInQuery]
              && ![v5 hasIsSpecificLocationInQuery]
              || [(BMAeroMLPhotosSearchInsights *)self hasIsSpecificLocationInQuery]
              && [v5 hasIsSpecificLocationInQuery]
              && (int v25 = [(BMAeroMLPhotosSearchInsights *)self isSpecificLocationInQuery],
                  v25 == [v5 isSpecificLocationInQuery]))
            {
              if (!-[BMAeroMLPhotosSearchInsights hasIsGeneralLocationReferenceInQuery](self, "hasIsGeneralLocationReferenceInQuery")&& ![v5 hasIsGeneralLocationReferenceInQuery]|| -[BMAeroMLPhotosSearchInsights hasIsGeneralLocationReferenceInQuery](self, "hasIsGeneralLocationReferenceInQuery")&& objc_msgSend(v5, "hasIsGeneralLocationReferenceInQuery")&& (int v26 = -[BMAeroMLPhotosSearchInsights isGeneralLocationReferenceInQuery](self, "isGeneralLocationReferenceInQuery"), v26 == objc_msgSend(v5, "isGeneralLocationReferenceInQuery")))
              {
                if (![(BMAeroMLPhotosSearchInsights *)self hasIsSpecificDateInQuery]
                  && ![v5 hasIsSpecificDateInQuery]
                  || [(BMAeroMLPhotosSearchInsights *)self hasIsSpecificDateInQuery]
                  && [v5 hasIsSpecificDateInQuery]
                  && (int v27 = [(BMAeroMLPhotosSearchInsights *)self isSpecificDateInQuery],
                      v27 == [v5 isSpecificDateInQuery]))
                {
                  if (!-[BMAeroMLPhotosSearchInsights hasIsGeneralDateReferenceInQuery](self, "hasIsGeneralDateReferenceInQuery")&& ![v5 hasIsGeneralDateReferenceInQuery]|| -[BMAeroMLPhotosSearchInsights hasIsGeneralDateReferenceInQuery](self, "hasIsGeneralDateReferenceInQuery")&& objc_msgSend(v5, "hasIsGeneralDateReferenceInQuery")&& (int v28 = -[BMAeroMLPhotosSearchInsights isGeneralDateReferenceInQuery](self, "isGeneralDateReferenceInQuery"), v28 == objc_msgSend(v5, "isGeneralDateReferenceInQuery")))
                  {
                    if (!-[BMAeroMLPhotosSearchInsights hasIsHolidayReferenceInQuery](self, "hasIsHolidayReferenceInQuery")&& ![v5 hasIsHolidayReferenceInQuery]|| -[BMAeroMLPhotosSearchInsights hasIsHolidayReferenceInQuery](self, "hasIsHolidayReferenceInQuery")&& objc_msgSend(v5, "hasIsHolidayReferenceInQuery")&& (int v29 = -[BMAeroMLPhotosSearchInsights isHolidayReferenceInQuery](self, "isHolidayReferenceInQuery"), v29 == objc_msgSend(v5, "isHolidayReferenceInQuery")))
                    {
                      if (![(BMAeroMLPhotosSearchInsights *)self hasIsActionRunningInQuery]
                        && ![v5 hasIsActionRunningInQuery]
                        || [(BMAeroMLPhotosSearchInsights *)self hasIsActionRunningInQuery]
                        && [v5 hasIsActionRunningInQuery]
                        && (int v30 = [(BMAeroMLPhotosSearchInsights *)self isActionRunningInQuery],
                            v30 == [v5 isActionRunningInQuery]))
                      {
                        if (!-[BMAeroMLPhotosSearchInsights hasIsActionHoldingInQuery](self, "hasIsActionHoldingInQuery")&& ![v5 hasIsActionHoldingInQuery]|| -[BMAeroMLPhotosSearchInsights hasIsActionHoldingInQuery](self, "hasIsActionHoldingInQuery")&& objc_msgSend(v5, "hasIsActionHoldingInQuery")&& (int v31 = -[BMAeroMLPhotosSearchInsights isActionHoldingInQuery](self, "isActionHoldingInQuery"), v31 == objc_msgSend(v5, "isActionHoldingInQuery")))
                        {
                          if (!-[BMAeroMLPhotosSearchInsights hasIsActionClimbingInQuery](self, "hasIsActionClimbingInQuery")&& ![v5 hasIsActionClimbingInQuery])
                          {
                            LOBYTE(v20) = 1;
                            goto LABEL_104;
                          }
                          if (-[BMAeroMLPhotosSearchInsights hasIsActionClimbingInQuery](self, "hasIsActionClimbingInQuery")&& [v5 hasIsActionClimbingInQuery])
                          {
                            BOOL v32 = [(BMAeroMLPhotosSearchInsights *)self isActionClimbingInQuery];
                            int v20 = v32 ^ [v5 isActionClimbingInQuery] ^ 1;
LABEL_104:

                            goto LABEL_105;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_103:
    LOBYTE(v20) = 0;
    goto LABEL_104;
  }
  LOBYTE(v20) = 0;
LABEL_105:

  return v20;
}

- (id)jsonDictionary
{
  v73[21] = *MEMORY[0x1E4F143B8];
  if ([(BMAeroMLPhotosSearchInsights *)self hasWasThereAnyResultsShown])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights wasThereAnyResultsShown](self, "wasThereAnyResultsShown"));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = 0;
  }
  if ([(BMAeroMLPhotosSearchInsights *)self hasSearchResultSize])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights searchResultSize](self, "searchResultSize"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMAeroMLPhotosSearchInsights *)self hasDidUserViewAnyPhoto])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights didUserViewAnyPhoto](self, "didUserViewAnyPhoto"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMAeroMLPhotosSearchInsights *)self hasViewedPhotoCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights viewedPhotoCount](self, "viewedPhotoCount"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAeroMLPhotosSearchInsights uiSurface](self, "uiSurface"));
  if ([(BMAeroMLPhotosSearchInsights *)self hasSizeOfPhotoDB])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights sizeOfPhotoDB](self, "sizeOfPhotoDB"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  if ([(BMAeroMLPhotosSearchInsights *)self hasNumberOfSearchesFromThisSurfaceLastWeek])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights numberOfSearchesFromThisSurfaceLastWeek](self, "numberOfSearchesFromThisSurfaceLastWeek"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  if ([(BMAeroMLPhotosSearchInsights *)self hasNumberOfSearchesFromThisSurfaceWeeklyAvg])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights numberOfSearchesFromThisSurfaceWeeklyAvg](self, "numberOfSearchesFromThisSurfaceWeeklyAvg"));
    id v71 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v71 = 0;
  }
  v70 = [(BMAeroMLPhotosSearchInsights *)self queryRaw];
  if ([(BMAeroMLPhotosSearchInsights *)self hasNumberOfTokensInQuery])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights numberOfTokensInQuery](self, "numberOfTokensInQuery"));
    id v69 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v69 = 0;
  }
  if ([(BMAeroMLPhotosSearchInsights *)self hasNumberOfKnownEntitiesInQuery])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights numberOfKnownEntitiesInQuery](self, "numberOfKnownEntitiesInQuery"));
    id v68 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v68 = 0;
  }
  if ([(BMAeroMLPhotosSearchInsights *)self hasIsSpecificPersonInQuery])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isSpecificPersonInQuery](self, "isSpecificPersonInQuery"));
    id v67 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v67 = 0;
  }
  if ([(BMAeroMLPhotosSearchInsights *)self hasIsGeneralPersonReferenceInQuery])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isGeneralPersonReferenceInQuery](self, "isGeneralPersonReferenceInQuery"));
    id v66 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v66 = 0;
  }
  if ([(BMAeroMLPhotosSearchInsights *)self hasIsSpecificLocationInQuery])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isSpecificLocationInQuery](self, "isSpecificLocationInQuery"));
    id v65 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v65 = 0;
  }
  if ([(BMAeroMLPhotosSearchInsights *)self hasIsGeneralLocationReferenceInQuery])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isGeneralLocationReferenceInQuery](self, "isGeneralLocationReferenceInQuery"));
    id v64 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v64 = 0;
  }
  if ([(BMAeroMLPhotosSearchInsights *)self hasIsSpecificDateInQuery])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isSpecificDateInQuery](self, "isSpecificDateInQuery"));
    id v63 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v63 = 0;
  }
  if ([(BMAeroMLPhotosSearchInsights *)self hasIsGeneralDateReferenceInQuery])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isGeneralDateReferenceInQuery](self, "isGeneralDateReferenceInQuery"));
    id v62 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v62 = 0;
  }
  if ([(BMAeroMLPhotosSearchInsights *)self hasIsHolidayReferenceInQuery])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isHolidayReferenceInQuery](self, "isHolidayReferenceInQuery"));
    id v61 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v61 = 0;
  }
  if ([(BMAeroMLPhotosSearchInsights *)self hasIsActionRunningInQuery])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isActionRunningInQuery](self, "isActionRunningInQuery"));
    id v60 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v60 = 0;
  }
  if ([(BMAeroMLPhotosSearchInsights *)self hasIsActionHoldingInQuery])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isActionHoldingInQuery](self, "isActionHoldingInQuery"));
    id v59 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v59 = 0;
  }
  if ([(BMAeroMLPhotosSearchInsights *)self hasIsActionClimbingInQuery])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isActionClimbingInQuery](self, "isActionClimbingInQuery"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
  v72[0] = @"wasThereAnyResultsShown";
  uint64_t v11 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v50 = (void *)v11;
  v73[0] = v11;
  v72[1] = @"searchResultSize";
  uint64_t v12 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v49 = (void *)v12;
  v73[1] = v12;
  v72[2] = @"didUserViewAnyPhoto";
  uint64_t v13 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v48 = (void *)v13;
  v73[2] = v13;
  v72[3] = @"viewedPhotoCount";
  uint64_t v14 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v47 = (void *)v14;
  v73[3] = v14;
  v72[4] = @"uiSurface";
  uint64_t v15 = v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)v15;
  v73[4] = v15;
  v72[5] = @"sizeOfPhotoDB";
  uint64_t v16 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v45 = (void *)v16;
  v73[5] = v16;
  v72[6] = @"numberOfSearchesFromThisSurfaceLastWeek";
  uint64_t v17 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v44 = (void *)v17;
  v73[6] = v17;
  v72[7] = @"numberOfSearchesFromThisSurfaceWeeklyAvg";
  uint64_t v18 = (uint64_t)v71;
  if (!v71)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v73[7] = v18;
  v72[8] = @"queryRaw";
  uint64_t v19 = (uint64_t)v70;
  if (!v70)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v73[8] = v19;
  v72[9] = @"numberOfTokensInQuery";
  uint64_t v20 = (uint64_t)v69;
  if (!v69)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v53 = (void *)v20;
  v73[9] = v20;
  v72[10] = @"numberOfKnownEntitiesInQuery";
  uint64_t v21 = (uint64_t)v68;
  if (!v68)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v57 = v5;
  v73[10] = v21;
  v72[11] = @"isSpecificPersonInQuery";
  uint64_t v22 = (uint64_t)v67;
  int v23 = (void *)v21;
  if (!v67)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v58 = v3;
  v73[11] = v22;
  v72[12] = @"isGeneralPersonReferenceInQuery";
  uint64_t v24 = (uint64_t)v66;
  int v25 = (void *)v22;
  if (!v66)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v55 = (void *)v7;
  v73[12] = v24;
  v72[13] = @"isSpecificLocationInQuery";
  uint64_t v26 = (uint64_t)v65;
  int v27 = (void *)v24;
  if (!v65)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v56 = v6;
  v52 = (void *)v26;
  v73[13] = v26;
  v72[14] = @"isGeneralLocationReferenceInQuery";
  uint64_t v28 = (uint64_t)v64;
  if (!v64)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v42 = (void *)v19;
  uint64_t v38 = v28;
  v73[14] = v28;
  v72[15] = @"isSpecificDateInQuery";
  int v29 = v63;
  if (!v63)
  {
    int v29 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v28);
  }
  v40 = v25;
  v54 = v8;
  v73[15] = v29;
  v72[16] = @"isGeneralDateReferenceInQuery";
  int v30 = v62;
  if (!v62)
  {
    int v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v43 = (void *)v18;
  int v31 = v9;
  v73[16] = v30;
  v72[17] = @"isHolidayReferenceInQuery";
  BOOL v32 = v61;
  if (!v61)
  {
    BOOL v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = v4;
  v73[17] = v32;
  v72[18] = @"isActionRunningInQuery";
  v34 = v60;
  if (!v60)
  {
    v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v41 = v23;
  v73[18] = v34;
  v72[19] = @"isActionHoldingInQuery";
  v35 = v59;
  if (!v59)
  {
    v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v73[19] = v35;
  v72[20] = @"isActionClimbingInQuery";
  v36 = v10;
  if (!v10)
  {
    v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v73[20] = v36;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v73, v72, 21, v38);
  id v51 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10) {

  }
  if (!v59) {
  if (!v60)
  }

  if (!v61) {
  if (!v62)
  }

  if (!v63) {
  if (!v64)
  }

  if (!v65) {
  if (!v66)
  }

  if (!v67) {
  if (!v68)
  }

  if (!v69) {
  if (!v70)
  }

  if (v71)
  {
    if (v31) {
      goto LABEL_128;
    }
  }
  else
  {

    if (v31)
    {
LABEL_128:
      if (v54) {
        goto LABEL_129;
      }
      goto LABEL_139;
    }
  }

  if (v54)
  {
LABEL_129:
    if (v55) {
      goto LABEL_130;
    }
    goto LABEL_140;
  }
LABEL_139:

  if (v55)
  {
LABEL_130:
    if (v56) {
      goto LABEL_131;
    }
    goto LABEL_141;
  }
LABEL_140:

  if (v56)
  {
LABEL_131:
    if (v57) {
      goto LABEL_132;
    }
    goto LABEL_142;
  }
LABEL_141:

  if (v57)
  {
LABEL_132:
    if (v33) {
      goto LABEL_133;
    }
LABEL_143:

    if (v58) {
      goto LABEL_134;
    }
    goto LABEL_144;
  }
LABEL_142:

  if (!v33) {
    goto LABEL_143;
  }
LABEL_133:
  if (v58) {
    goto LABEL_134;
  }
LABEL_144:

LABEL_134:

  return v51;
}

- (BMAeroMLPhotosSearchInsights)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v209[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v167 = [v6 objectForKeyedSubscript:@"wasThereAnyResultsShown"];
  if (!v167 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v166 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v166 = v167;
LABEL_4:
    v165 = [v6 objectForKeyedSubscript:@"searchResultSize"];
    if (!v165 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v7 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v165;
LABEL_7:
      id v8 = [v6 objectForKeyedSubscript:@"didUserViewAnyPhoto"];
      if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v9 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
LABEL_10:
        v164 = [v6 objectForKeyedSubscript:@"viewedPhotoCount"];
        if (!v164 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v10 = v7;
          id v11 = v9;
          id v12 = v166;
          id v162 = 0;
LABEL_13:
          v160 = self;
          uint64_t v13 = [v6 objectForKeyedSubscript:@"uiSurface"];
          v159 = (void *)v13;
          id v166 = v12;
          if (v13 && (uint64_t v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v157 = v14;
            }
            else
            {
              v153 = v11;
              v139 = v10;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  v34 = 0;
                  uint64_t v21 = 0;
                  id v7 = v10;
                  id v9 = v153;
                  goto LABEL_166;
                }
                id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v75 = *MEMORY[0x1E4F502C8];
                uint64_t v200 = *MEMORY[0x1E4F28568];
                v40 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"uiSurface"];
                v201 = v40;
                uint64_t v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v201 forKeys:&v200 count:1];
                id v77 = (id)[v74 initWithDomain:v75 code:2 userInfo:v76];
                v34 = 0;
                uint64_t v21 = 0;
                *a4 = v77;
                v37 = (void *)v76;
                self = v160;
                id v7 = v139;
                id v9 = v153;
                goto LABEL_165;
              }
              id v36 = v14;
              id v157 = [NSNumber numberWithInt:BMAeroMLPhotosSearchInsightsUISurfaceTypeFromString(v36)];
            }
          }
          else
          {
            id v157 = 0;
          }
          [v6 objectForKeyedSubscript:@"sizeOfPhotoDB"];
          v37 = v158 = a4;
          if (v37)
          {
            objc_opt_class();
            id v9 = v11;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              id v7 = v10;
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v158)
                {
                  v40 = 0;
                  uint64_t v21 = 0;
                  v34 = v157;
LABEL_165:

                  goto LABEL_166;
                }
                id v151 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v148 = *MEMORY[0x1E4F502C8];
                uint64_t v198 = *MEMORY[0x1E4F28568];
                v34 = v157;
                id v155 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"sizeOfPhotoDB"];
                id v199 = v155;
                v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v199 forKeys:&v198 count:1];
                uint64_t v21 = 0;
                v40 = 0;
                id *v158 = (id)[v151 initWithDomain:v148 code:2 userInfo:v39];
                goto LABEL_164;
              }
              id v38 = v37;
LABEL_42:
              v39 = [v6 objectForKeyedSubscript:@"numberOfSearchesFromThisSurfaceLastWeek"];
              if (!v39)
              {
                v146 = 0;
                id v155 = 0;
                v40 = v38;
                goto LABEL_50;
              }
              objc_opt_class();
              v40 = v38;
              if (objc_opt_isKindOfClass())
              {
                v146 = v39;
                id v155 = 0;
                goto LABEL_50;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v146 = v39;
                id v155 = v39;
LABEL_50:
                uint64_t v41 = [v6 objectForKeyedSubscript:@"numberOfSearchesFromThisSurfaceWeeklyAvg"];
                v147 = (void *)v41;
                id v154 = v9;
                if (!v41 || (v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v150 = 0;
                  goto LABEL_53;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v150 = v42;
LABEL_53:
                  uint64_t v43 = [v6 objectForKeyedSubscript:@"queryRaw"];
                  v143 = v37;
                  v144 = (void *)v43;
                  if (!v43 || (v44 = (void *)v43, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v135 = 0;
LABEL_56:
                    uint64_t v45 = [v6 objectForKeyedSubscript:@"numberOfTokensInQuery"];
                    v136 = (void *)v45;
                    if (v45 && (v46 = (void *)v45, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        uint64_t v21 = (BMAeroMLPhotosSearchInsights *)v158;
                        if (!v158)
                        {
                          id v137 = 0;
                          v39 = v146;
                          v34 = v157;
                          id v67 = v135;
                          goto LABEL_161;
                        }
                        id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v138 = *MEMORY[0x1E4F502C8];
                        uint64_t v190 = *MEMORY[0x1E4F28568];
                        v34 = v157;
                        id v133 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numberOfTokensInQuery"];
                        id v191 = v133;
                        v132 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v191 forKeys:&v190 count:1];
                        id v79 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v138, 2);
                        uint64_t v21 = 0;
                        id v137 = 0;
                        id *v158 = v79;
                        v39 = v146;
                        id v67 = v135;
                        goto LABEL_160;
                      }
                      v47 = v40;
                      v48 = v8;
                      id v49 = v7;
                      id v137 = v46;
                    }
                    else
                    {
                      v47 = v40;
                      v48 = v8;
                      id v49 = v7;
                      id v137 = 0;
                    }
                    uint64_t v50 = [v6 objectForKeyedSubscript:@"numberOfKnownEntitiesInQuery"];
                    v132 = (void *)v50;
                    if (v50 && (id v51 = (void *)v50, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (!v158)
                        {
                          id v133 = 0;
                          uint64_t v21 = 0;
                          v39 = v146;
                          v34 = v157;
                          id v67 = v135;
                          id v7 = v49;
                          id v8 = v48;
                          v40 = v47;
                          v37 = v143;
                          goto LABEL_160;
                        }
                        id v80 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v134 = *MEMORY[0x1E4F502C8];
                        uint64_t v188 = *MEMORY[0x1E4F28568];
                        id v7 = v49;
                        id v8 = v48;
                        v34 = v157;
                        id v130 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numberOfKnownEntitiesInQuery"];
                        id v189 = v130;
                        v129 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v189 forKeys:&v188 count:1];
                        id v81 = (id)objc_msgSend(v80, "initWithDomain:code:userInfo:", v134, 2);
                        uint64_t v21 = 0;
                        id v133 = 0;
                        id *v158 = v81;
                        v40 = v47;
                        v37 = v143;
                        v39 = v146;
                        id v67 = v135;
LABEL_159:

LABEL_160:
                        goto LABEL_161;
                      }
                      id v133 = v51;
                    }
                    else
                    {
                      id v133 = 0;
                    }
                    uint64_t v52 = [v6 objectForKeyedSubscript:@"isSpecificPersonInQuery"];
                    v53 = v49;
                    v129 = (void *)v52;
                    if (v52)
                    {
                      v54 = (void *)v52;
                      objc_opt_class();
                      id v8 = v48;
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        objc_opt_class();
                        v40 = v47;
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          v37 = v143;
                          uint64_t v21 = (BMAeroMLPhotosSearchInsights *)v158;
                          if (!v158)
                          {
                            id v130 = 0;
                            v39 = v146;
                            id v67 = v135;
                            id v7 = v53;
                            v34 = v157;
                            goto LABEL_159;
                          }
                          id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v131 = *MEMORY[0x1E4F502C8];
                          uint64_t v186 = *MEMORY[0x1E4F28568];
                          id v7 = v53;
                          v34 = v157;
                          id v127 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isSpecificPersonInQuery"];
                          id v187 = v127;
                          v119 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v187 forKeys:&v186 count:1];
                          id v83 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v131, 2);
                          uint64_t v21 = 0;
                          id v130 = 0;
                          id *v158 = v83;
                          v37 = v143;
                          v39 = v146;
                          goto LABEL_188;
                        }
                        id v130 = v54;
LABEL_75:
                        v37 = v143;
                        uint64_t v55 = [v6 objectForKeyedSubscript:@"isGeneralPersonReferenceInQuery"];
                        id v7 = v53;
                        v119 = (void *)v55;
                        if (!v55 || (v56 = (void *)v55, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v127 = 0;
                          goto LABEL_78;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v127 = v56;
LABEL_78:
                          uint64_t v57 = [v6 objectForKeyedSubscript:@"isSpecificLocationInQuery"];
                          v116 = (void *)v57;
                          if (!v57 || (v58 = (void *)v57, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v118 = 0;
                            goto LABEL_81;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v118 = v58;
LABEL_81:
                            uint64_t v59 = [v6 objectForKeyedSubscript:@"isGeneralLocationReferenceInQuery"];
                            v115 = (void *)v59;
                            if (!v59 || (id v60 = (void *)v59, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v117 = 0;
                              goto LABEL_84;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v117 = v60;
LABEL_84:
                              uint64_t v61 = [v6 objectForKeyedSubscript:@"isSpecificDateInQuery"];
                              v113 = (void *)v61;
                              if (!v61 || (id v62 = (void *)v61, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v114 = 0;
LABEL_87:
                                id v63 = [v6 objectForKeyedSubscript:@"isGeneralDateReferenceInQuery"];
                                v111 = v63;
                                if (!v63)
                                {
LABEL_124:
                                  id v84 = [v6 objectForKeyedSubscript:@"isHolidayReferenceInQuery"];
                                  v112 = v63;
                                  v110 = v84;
                                  if (!v84)
                                  {
LABEL_132:
                                    id v87 = [v6 objectForKeyedSubscript:@"isActionRunningInQuery"];
                                    v109 = v84;
                                    v107 = v87;
                                    if (!v87)
                                    {
LABEL_141:
                                      uint64_t v89 = [v6 objectForKeyedSubscript:@"isActionHoldingInQuery"];
                                      v105 = (void *)v89;
                                      v106 = v87;
                                      if (v89
                                        && (v90 = (void *)v89, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                      {
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                        {
                                          uint64_t v21 = (BMAeroMLPhotosSearchInsights *)v158;
                                          if (!v158)
                                          {
                                            id v108 = 0;
                                            self = v160;
                                            v39 = v146;
                                            v34 = v157;
                                            goto LABEL_151;
                                          }
                                          id v99 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v126 = *MEMORY[0x1E4F502C8];
                                          uint64_t v170 = *MEMORY[0x1E4F28568];
                                          v34 = v157;
                                          id v91 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isActionHoldingInQuery"];
                                          id v171 = v91;
                                          v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v171 forKeys:&v170 count:1];
                                          uint64_t v21 = 0;
                                          id v108 = 0;
                                          id *v158 = (id)objc_msgSend(v99, "initWithDomain:code:userInfo:", v126, 2);
                                          v37 = v143;
                                          goto LABEL_149;
                                        }
                                        id v108 = v90;
                                      }
                                      else
                                      {
                                        id v108 = 0;
                                      }
                                      id v91 = [v6 objectForKeyedSubscript:@"isActionClimbingInQuery"];
                                      v104 = v91;
                                      if (v91)
                                      {
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                        {
                                          objc_opt_class();
                                          id v92 = v117;
                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                          {
                                            uint64_t v21 = (BMAeroMLPhotosSearchInsights *)v158;
                                            if (!v158)
                                            {
                                              id v91 = 0;
                                              v39 = v146;
                                              v34 = v157;
                                              goto LABEL_150;
                                            }
                                            id v100 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v101 = *MEMORY[0x1E4F502C8];
                                            uint64_t v168 = *MEMORY[0x1E4F28568];
                                            id v142 = v7;
                                            v102 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isActionClimbingInQuery"];
                                            v169 = v102;
                                            v103 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v169 forKeys:&v168 count:1];
                                            v34 = v157;
                                            id *v158 = (id)[v100 initWithDomain:v101 code:2 userInfo:v103];

                                            id v7 = v142;
                                            id v91 = 0;
                                            uint64_t v21 = 0;
LABEL_149:
                                            v39 = v146;
LABEL_150:

                                            self = v160;
LABEL_151:
                                            id v67 = v135;

LABEL_152:
LABEL_153:

LABEL_154:
LABEL_155:

LABEL_156:
LABEL_157:

LABEL_158:
                                            goto LABEL_159;
                                          }
                                          id v91 = v91;
LABEL_148:
                                          v34 = v157;
                                          id v117 = v92;
                                          uint64_t v21 = objc_retain(-[BMAeroMLPhotosSearchInsights initWithWasThereAnyResultsShown:searchResultSize:didUserViewAnyPhoto:viewedPhotoCount:uiSurface:sizeOfPhotoDB:numberOfSearchesFromThisSurfaceLastWeek:numberOfSearchesFromThisSurfaceWeeklyAvg:queryRaw:numberOfTokensInQuery:numberOfKnownEntitiesInQuery:isSpecificPersonInQuery:isGeneralPersonReferenceInQuery:isSpecificLocationInQuery:isGeneralLocationReferenceInQuery:isSpecificDateInQuery:isGeneralDateReferenceInQuery:isHolidayReferenceInQuery:isActionRunningInQuery:isActionHoldingInQuery:isActionClimbingInQuery:](v160, "initWithWasThereAnyResultsShown:searchResultSize:didUserViewAnyPhoto:viewedPhotoCount:uiSurface:sizeOfPhotoDB:numberOfSearchesFromThisSurfaceLastWeek:numberOfSearchesFromThisSurfaceWeeklyAvg:queryRaw:numberOfTokensInQuery:numberOfKnownEntitiesInQuery:isSpecificPersonInQuery:isGeneralPersonReferenceInQuery:isSpecificLocationInQuery:isGeneralLocationReferenceInQuery:isSpecificDateInQuery:isGeneralDateReferenceInQuery:isHolidayReferenceInQuery:isActionRunningInQuery:isActionHoldingInQuery:isActionClimbingInQuery:", v166, v7, v154, v162, [v157 intValue], v40, v155, v150, v135,
                                                    v137,
                                                    v133,
                                                    v130,
                                                    v127,
                                                    v118,
                                                    v92,
                                                    v114,
                                                    v112,
                                                    v84,
                                                    v87,
                                                    v108,
                                                    v91));
                                          v160 = v21;
                                          goto LABEL_149;
                                        }
                                        id v91 = 0;
                                      }
                                      id v92 = v117;
                                      goto LABEL_148;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v87 = 0;
                                      goto LABEL_141;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v87 = v87;
                                      goto LABEL_141;
                                    }
                                    uint64_t v21 = (BMAeroMLPhotosSearchInsights *)v158;
                                    if (v158)
                                    {
                                      id v98 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v125 = *MEMORY[0x1E4F502C8];
                                      uint64_t v172 = *MEMORY[0x1E4F28568];
                                      v34 = v157;
                                      id v108 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isActionRunningInQuery"];
                                      id v173 = v108;
                                      v105 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v173 forKeys:&v172 count:1];
                                      uint64_t v21 = 0;
                                      v106 = 0;
                                      id *v158 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v125, 2);
                                      v37 = v143;
                                      v39 = v146;
                                      goto LABEL_151;
                                    }
                                    v106 = 0;
                                    v39 = v146;
                                    v34 = v157;
LABEL_206:
                                    id v67 = v135;
                                    goto LABEL_152;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v84 = 0;
                                    goto LABEL_132;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v84 = v84;
                                    goto LABEL_132;
                                  }
                                  uint64_t v21 = (BMAeroMLPhotosSearchInsights *)v158;
                                  if (v158)
                                  {
                                    id v97 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v124 = *MEMORY[0x1E4F502C8];
                                    uint64_t v174 = *MEMORY[0x1E4F28568];
                                    v34 = v157;
                                    v106 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isHolidayReferenceInQuery"];
                                    v175 = v106;
                                    v107 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v175 forKeys:&v174 count:1];
                                    uint64_t v21 = 0;
                                    v109 = 0;
                                    id *v158 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v124, 2);
                                    v37 = v143;
                                    v39 = v146;
                                    goto LABEL_206;
                                  }
                                  v109 = 0;
                                  v39 = v146;
                                  v34 = v157;
LABEL_204:
                                  id v67 = v135;
                                  goto LABEL_153;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v63 = 0;
                                  goto LABEL_124;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v63 = v63;
                                  goto LABEL_124;
                                }
                                uint64_t v21 = (BMAeroMLPhotosSearchInsights *)v158;
                                if (v158)
                                {
                                  id v96 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v123 = *MEMORY[0x1E4F502C8];
                                  uint64_t v176 = *MEMORY[0x1E4F28568];
                                  v34 = v157;
                                  v109 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isGeneralDateReferenceInQuery"];
                                  v177 = v109;
                                  v110 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v177 forKeys:&v176 count:1];
                                  uint64_t v21 = 0;
                                  v112 = 0;
                                  id *v158 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v123, 2);
                                  v37 = v143;
                                  v39 = v146;
                                  goto LABEL_204;
                                }
                                v112 = 0;
                                v39 = v146;
                                v34 = v157;
LABEL_202:
                                id v67 = v135;
                                goto LABEL_154;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v114 = v62;
                                goto LABEL_87;
                              }
                              uint64_t v21 = (BMAeroMLPhotosSearchInsights *)v158;
                              if (v158)
                              {
                                id v95 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v122 = *MEMORY[0x1E4F502C8];
                                uint64_t v178 = *MEMORY[0x1E4F28568];
                                v34 = v157;
                                v112 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isSpecificDateInQuery"];
                                v179 = v112;
                                v111 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v179 forKeys:&v178 count:1];
                                uint64_t v21 = 0;
                                id v114 = 0;
                                id *v158 = (id)objc_msgSend(v95, "initWithDomain:code:userInfo:", v122, 2);
                                v37 = v143;
                                v39 = v146;
                                goto LABEL_202;
                              }
                              id v114 = 0;
                              v39 = v146;
                              v34 = v157;
LABEL_200:
                              id v67 = v135;
                              goto LABEL_155;
                            }
                            uint64_t v21 = (BMAeroMLPhotosSearchInsights *)v158;
                            if (v158)
                            {
                              id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v121 = *MEMORY[0x1E4F502C8];
                              uint64_t v180 = *MEMORY[0x1E4F28568];
                              v34 = v157;
                              id v114 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isGeneralLocationReferenceInQuery"];
                              id v181 = v114;
                              v113 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v181 forKeys:&v180 count:1];
                              uint64_t v21 = 0;
                              id v117 = 0;
                              id *v158 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v121, 2);
                              v37 = v143;
                              v39 = v146;
                              goto LABEL_200;
                            }
                            id v117 = 0;
                            v39 = v146;
                            v34 = v157;
LABEL_196:
                            id v67 = v135;
                            goto LABEL_156;
                          }
                          uint64_t v21 = (BMAeroMLPhotosSearchInsights *)v158;
                          if (v158)
                          {
                            id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v120 = *MEMORY[0x1E4F502C8];
                            uint64_t v182 = *MEMORY[0x1E4F28568];
                            v34 = v157;
                            id v117 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isSpecificLocationInQuery"];
                            id v183 = v117;
                            v115 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v183 forKeys:&v182 count:1];
                            uint64_t v21 = 0;
                            id v118 = 0;
                            id *v158 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v120, 2);
                            v37 = v143;
                            v39 = v146;
                            goto LABEL_196;
                          }
                          id v118 = 0;
                          v39 = v146;
                          v34 = v157;
LABEL_192:
                          id v67 = v135;
                          goto LABEL_157;
                        }
                        uint64_t v21 = (BMAeroMLPhotosSearchInsights *)v158;
                        if (v158)
                        {
                          id v85 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v128 = *MEMORY[0x1E4F502C8];
                          uint64_t v184 = *MEMORY[0x1E4F28568];
                          v34 = v157;
                          id v118 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isGeneralPersonReferenceInQuery"];
                          id v185 = v118;
                          v116 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v185 forKeys:&v184 count:1];
                          id v86 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v128, 2);
                          uint64_t v21 = 0;
                          id v127 = 0;
                          id *v158 = v86;
                          v37 = v143;
                          v39 = v146;
                          goto LABEL_192;
                        }
                        id v127 = 0;
                        v39 = v146;
                        v34 = v157;
LABEL_188:
                        id v67 = v135;
                        goto LABEL_158;
                      }
                      id v130 = 0;
                    }
                    else
                    {
                      id v130 = 0;
                      id v8 = v48;
                    }
                    v40 = v47;
                    goto LABEL_75;
                  }
                  v140 = v40;
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v135 = v44;
                    goto LABEL_56;
                  }
                  if (v158)
                  {
                    id v71 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v72 = *MEMORY[0x1E4F502C8];
                    uint64_t v192 = *MEMORY[0x1E4F28568];
                    id v137 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"queryRaw"];
                    id v193 = v137;
                    v136 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v193 forKeys:&v192 count:1];
                    id v73 = (id)objc_msgSend(v71, "initWithDomain:code:userInfo:", v72, 2);
                    uint64_t v21 = 0;
                    id v67 = 0;
                    id *v158 = v73;
                    v34 = v157;
                    v39 = v146;
LABEL_161:

                    goto LABEL_162;
                  }
                  id v67 = 0;
                  uint64_t v21 = 0;
                  v34 = v157;
LABEL_138:
                  v40 = v140;
                  v39 = v146;
LABEL_162:

                  id v9 = v154;
                  goto LABEL_163;
                }
                uint64_t v21 = (BMAeroMLPhotosSearchInsights *)v158;
                if (v158)
                {
                  id v152 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v145 = *MEMORY[0x1E4F502C8];
                  uint64_t v194 = *MEMORY[0x1E4F28568];
                  v140 = v40;
                  v34 = v157;
                  id v67 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numberOfSearchesFromThisSurfaceWeeklyAvg"];
                  v195 = v67;
                  uint64_t v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v195 forKeys:&v194 count:1];
                  uint64_t v69 = v145;
                  v144 = (void *)v68;
                  id v70 = (id)objc_msgSend(v152, "initWithDomain:code:userInfo:", v69, 2);
                  uint64_t v21 = 0;
                  id v150 = 0;
                  id *v158 = v70;
                  goto LABEL_138;
                }
                id v150 = 0;
                v39 = v146;
                v34 = v157;
LABEL_163:

                goto LABEL_164;
              }
              uint64_t v21 = (BMAeroMLPhotosSearchInsights *)v158;
              if (v158)
              {
                id v156 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v149 = *MEMORY[0x1E4F502C8];
                uint64_t v196 = *MEMORY[0x1E4F28568];
                id v141 = v38;
                v34 = v157;
                id v150 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numberOfSearchesFromThisSurfaceLastWeek"];
                id v197 = v150;
                uint64_t v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v197 forKeys:&v196 count:1];
                uint64_t v65 = v149;
                v147 = (void *)v64;
                id v66 = (id)objc_msgSend(v156, "initWithDomain:code:userInfo:", v65, 2);
                uint64_t v21 = 0;
                id v155 = 0;
                id *v158 = v66;
                v40 = v141;
                goto LABEL_163;
              }
              id v155 = 0;
              v34 = v157;
LABEL_164:

              goto LABEL_165;
            }
            id v38 = 0;
          }
          else
          {
            id v38 = 0;
            id v9 = v11;
          }
          id v7 = v10;
          goto LABEL_42;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v7;
          id v11 = v9;
          id v12 = v166;
          id v162 = v164;
          goto LABEL_13;
        }
        if (a4)
        {
          id v163 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v161 = *MEMORY[0x1E4F502C8];
          uint64_t v202 = *MEMORY[0x1E4F28568];
          v34 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"viewedPhotoCount"];
          v203 = v34;
          v159 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v203 forKeys:&v202 count:1];
          id v35 = (id)objc_msgSend(v163, "initWithDomain:code:userInfo:", v161, 2);
          id v162 = 0;
          uint64_t v21 = 0;
          *a4 = v35;
LABEL_166:

          goto LABEL_167;
        }
        id v162 = 0;
        uint64_t v21 = 0;
LABEL_167:

        goto LABEL_168;
      }
      if (a4)
      {
        uint64_t v28 = self;
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v204 = *MEMORY[0x1E4F28568];
        id v162 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"didUserViewAnyPhoto"];
        id v205 = v162;
        uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v205 forKeys:&v204 count:1];
        BOOL v32 = v29;
        self = v28;
        v164 = (void *)v31;
        id v33 = (id)[v32 initWithDomain:v30 code:2 userInfo:v31];
        id v9 = 0;
        uint64_t v21 = 0;
        *a4 = v33;
        goto LABEL_167;
      }
      id v9 = 0;
      uint64_t v21 = 0;
LABEL_168:

      goto LABEL_169;
    }
    if (a4)
    {
      uint64_t v22 = self;
      id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v24 = *MEMORY[0x1E4F502C8];
      uint64_t v206 = *MEMORY[0x1E4F28568];
      uint64_t v25 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"searchResultSize"];
      uint64_t v207 = v25;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v207 forKeys:&v206 count:1];
      uint64_t v26 = v23;
      self = v22;
      id v9 = (id)v25;
      id v27 = (id)[v26 initWithDomain:v24 code:2 userInfo:v8];
      id v7 = 0;
      uint64_t v21 = 0;
      *a4 = v27;
      goto LABEL_168;
    }
    id v7 = 0;
    uint64_t v21 = 0;
LABEL_169:

    goto LABEL_170;
  }
  if (a4)
  {
    uint64_t v15 = self;
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = *MEMORY[0x1E4F502C8];
    uint64_t v208 = *MEMORY[0x1E4F28568];
    id v7 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"wasThereAnyResultsShown"];
    v209[0] = v7;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v209 forKeys:&v208 count:1];
    uint64_t v19 = v16;
    self = v15;
    v165 = (void *)v18;
    id v20 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v17, 2);
    id v166 = 0;
    uint64_t v21 = 0;
    *a4 = v20;
    goto LABEL_169;
  }
  id v166 = 0;
  uint64_t v21 = 0;
LABEL_170:

  return v21;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMAeroMLPhotosSearchInsights *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_hasWasThereAnyResultsShown) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasSearchResultSize) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasDidUserViewAnyPhoto) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasViewedPhotoCount) {
    PBDataWriterWriteUint32Field();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasSizeOfPhotoDB) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasNumberOfSearchesFromThisSurfaceLastWeek) {
    PBDataWriterWriteUint32Field();
  }
  id v4 = v5;
  if (self->_hasNumberOfSearchesFromThisSurfaceWeeklyAvg)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_queryRaw)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasNumberOfTokensInQuery)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasNumberOfKnownEntitiesInQuery)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasIsSpecificPersonInQuery)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsGeneralPersonReferenceInQuery)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsSpecificLocationInQuery)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsGeneralLocationReferenceInQuery)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsSpecificDateInQuery)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsGeneralDateReferenceInQuery)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsHolidayReferenceInQuery)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsActionRunningInQuery)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsActionHoldingInQuery)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsActionClimbingInQuery)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v140.receiver = self;
  v140.super_class = (Class)BMAeroMLPhotosSearchInsights;
  id v5 = [(BMEventBase *)&v140 init];
  if (!v5) {
    goto LABEL_250;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        unint64_t v14 = *(void *)&v4[v13];
        if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v16 = v11++ >= 9;
        if (v16)
        {
          unint64_t v12 = 0;
          int v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v17 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v17 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          v5->_hasWasThereAnyResultsShown = 1;
          while (1)
          {
            uint64_t v22 = *v6;
            unint64_t v23 = *(void *)&v4[v22];
            if (v23 == -1 || v23 >= *(void *)&v4[*v7]) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
            *(void *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0) {
              goto LABEL_164;
            }
            v19 += 7;
            BOOL v16 = v20++ >= 9;
            if (v16)
            {
              uint64_t v21 = 0;
              goto LABEL_166;
            }
          }
          v4[*v8] = 1;
LABEL_164:
          if (v4[*v8]) {
            uint64_t v21 = 0;
          }
LABEL_166:
          BOOL v135 = v21 != 0;
          uint64_t v136 = 16;
          goto LABEL_246;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          v5->_hasSearchResultSize = 1;
          while (2)
          {
            uint64_t v28 = *v6;
            unint64_t v29 = *(void *)&v4[v28];
            if (v29 == -1 || v29 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)&v4[*v9] + v29);
              *(void *)&v4[v28] = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                BOOL v16 = v26++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_170;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_170:
          uint64_t v137 = 52;
          goto LABEL_205;
        case 3u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          v5->_hasDidUserViewAnyPhoto = 1;
          while (2)
          {
            uint64_t v34 = *v6;
            unint64_t v35 = *(void *)&v4[v34];
            if (v35 == -1 || v35 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
              *(void *)&v4[v34] = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                BOOL v16 = v32++ >= 9;
                if (v16)
                {
                  uint64_t v33 = 0;
                  goto LABEL_174;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v33 = 0;
          }
LABEL_174:
          BOOL v135 = v33 != 0;
          uint64_t v136 = 19;
          goto LABEL_246;
        case 4u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v27 = 0;
          v5->_hasViewedPhotoCount = 1;
          while (2)
          {
            uint64_t v39 = *v6;
            unint64_t v40 = *(void *)&v4[v39];
            if (v40 == -1 || v40 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)&v4[*v9] + v40);
              *(void *)&v4[v39] = v40 + 1;
              v27 |= (unint64_t)(v41 & 0x7F) << v37;
              if (v41 < 0)
              {
                v37 += 7;
                BOOL v16 = v38++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_178;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_178:
          uint64_t v137 = 56;
          goto LABEL_205;
        case 5u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v44 = 0;
          while (2)
          {
            uint64_t v45 = *v6;
            unint64_t v46 = *(void *)&v4[v45];
            if (v46 == -1 || v46 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)&v4[*v9] + v46);
              *(void *)&v4[v45] = v46 + 1;
              v44 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                BOOL v16 = v43++ >= 9;
                if (v16)
                {
                  LODWORD(v44) = 0;
                  goto LABEL_182;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v44) = 0;
          }
LABEL_182:
          if (v44 >= 5) {
            LODWORD(v44) = 0;
          }
          v5->_uiSurface = v44;
          continue;
        case 6u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v27 = 0;
          v5->_hasSizeOfPhotoDB = 1;
          while (2)
          {
            uint64_t v50 = *v6;
            unint64_t v51 = *(void *)&v4[v50];
            if (v51 == -1 || v51 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v52 = *(unsigned char *)(*(void *)&v4[*v9] + v51);
              *(void *)&v4[v50] = v51 + 1;
              v27 |= (unint64_t)(v52 & 0x7F) << v48;
              if (v52 < 0)
              {
                v48 += 7;
                BOOL v16 = v49++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_188;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_188:
          uint64_t v137 = 64;
          goto LABEL_205;
        case 7u:
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v27 = 0;
          v5->_hasNumberOfSearchesFromThisSurfaceLastWeek = 1;
          while (2)
          {
            uint64_t v55 = *v6;
            unint64_t v56 = *(void *)&v4[v55];
            if (v56 == -1 || v56 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v57 = *(unsigned char *)(*(void *)&v4[*v9] + v56);
              *(void *)&v4[v55] = v56 + 1;
              v27 |= (unint64_t)(v57 & 0x7F) << v53;
              if (v57 < 0)
              {
                v53 += 7;
                BOOL v16 = v54++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_192;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_192:
          uint64_t v137 = 68;
          goto LABEL_205;
        case 8u:
          char v58 = 0;
          unsigned int v59 = 0;
          uint64_t v27 = 0;
          v5->_hasNumberOfSearchesFromThisSurfaceWeeklyAvg = 1;
          while (2)
          {
            uint64_t v60 = *v6;
            unint64_t v61 = *(void *)&v4[v60];
            if (v61 == -1 || v61 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v62 = *(unsigned char *)(*(void *)&v4[*v9] + v61);
              *(void *)&v4[v60] = v61 + 1;
              v27 |= (unint64_t)(v62 & 0x7F) << v58;
              if (v62 < 0)
              {
                v58 += 7;
                BOOL v16 = v59++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_196;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_196:
          uint64_t v137 = 72;
          goto LABEL_205;
        case 9u:
          uint64_t v63 = PBReaderReadString();
          queryRaw = v5->_queryRaw;
          v5->_queryRaw = (NSString *)v63;

          continue;
        case 0xAu:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v27 = 0;
          v5->_hasNumberOfTokensInQuery = 1;
          while (2)
          {
            uint64_t v67 = *v6;
            unint64_t v68 = *(void *)&v4[v67];
            if (v68 == -1 || v68 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v69 = *(unsigned char *)(*(void *)&v4[*v9] + v68);
              *(void *)&v4[v67] = v68 + 1;
              v27 |= (unint64_t)(v69 & 0x7F) << v65;
              if (v69 < 0)
              {
                v65 += 7;
                BOOL v16 = v66++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_200;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_200:
          uint64_t v137 = 76;
          goto LABEL_205;
        case 0xBu:
          char v70 = 0;
          unsigned int v71 = 0;
          uint64_t v27 = 0;
          v5->_hasNumberOfKnownEntitiesInQuery = 1;
          while (2)
          {
            uint64_t v72 = *v6;
            unint64_t v73 = *(void *)&v4[v72];
            if (v73 == -1 || v73 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v74 = *(unsigned char *)(*(void *)&v4[*v9] + v73);
              *(void *)&v4[v72] = v73 + 1;
              v27 |= (unint64_t)(v74 & 0x7F) << v70;
              if (v74 < 0)
              {
                v70 += 7;
                BOOL v16 = v71++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_204;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_204:
          uint64_t v137 = 80;
LABEL_205:
          *(_DWORD *)((char *)&v5->super.super.isa + v137) = v27;
          continue;
        case 0xCu:
          char v75 = 0;
          unsigned int v76 = 0;
          uint64_t v77 = 0;
          v5->_hasIsSpecificPersonInQuery = 1;
          while (2)
          {
            uint64_t v78 = *v6;
            unint64_t v79 = *(void *)&v4[v78];
            if (v79 == -1 || v79 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v80 = *(unsigned char *)(*(void *)&v4[*v9] + v79);
              *(void *)&v4[v78] = v79 + 1;
              v77 |= (unint64_t)(v80 & 0x7F) << v75;
              if (v80 < 0)
              {
                v75 += 7;
                BOOL v16 = v76++ >= 9;
                if (v16)
                {
                  uint64_t v77 = 0;
                  goto LABEL_209;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v77 = 0;
          }
LABEL_209:
          BOOL v135 = v77 != 0;
          uint64_t v136 = 27;
          goto LABEL_246;
        case 0xDu:
          char v81 = 0;
          unsigned int v82 = 0;
          uint64_t v83 = 0;
          v5->_hasIsGeneralPersonReferenceInQuery = 1;
          while (2)
          {
            uint64_t v84 = *v6;
            unint64_t v85 = *(void *)&v4[v84];
            if (v85 == -1 || v85 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v86 = *(unsigned char *)(*(void *)&v4[*v9] + v85);
              *(void *)&v4[v84] = v85 + 1;
              v83 |= (unint64_t)(v86 & 0x7F) << v81;
              if (v86 < 0)
              {
                v81 += 7;
                BOOL v16 = v82++ >= 9;
                if (v16)
                {
                  uint64_t v83 = 0;
                  goto LABEL_213;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v83 = 0;
          }
LABEL_213:
          BOOL v135 = v83 != 0;
          uint64_t v136 = 29;
          goto LABEL_246;
        case 0xEu:
          char v87 = 0;
          unsigned int v88 = 0;
          uint64_t v89 = 0;
          v5->_hasIsSpecificLocationInQuery = 1;
          while (2)
          {
            uint64_t v90 = *v6;
            unint64_t v91 = *(void *)&v4[v90];
            if (v91 == -1 || v91 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v92 = *(unsigned char *)(*(void *)&v4[*v9] + v91);
              *(void *)&v4[v90] = v91 + 1;
              v89 |= (unint64_t)(v92 & 0x7F) << v87;
              if (v92 < 0)
              {
                v87 += 7;
                BOOL v16 = v88++ >= 9;
                if (v16)
                {
                  uint64_t v89 = 0;
                  goto LABEL_217;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v89 = 0;
          }
LABEL_217:
          BOOL v135 = v89 != 0;
          uint64_t v136 = 31;
          goto LABEL_246;
        case 0xFu:
          char v93 = 0;
          unsigned int v94 = 0;
          uint64_t v95 = 0;
          v5->_hasIsGeneralLocationReferenceInQuery = 1;
          while (2)
          {
            uint64_t v96 = *v6;
            unint64_t v97 = *(void *)&v4[v96];
            if (v97 == -1 || v97 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v98 = *(unsigned char *)(*(void *)&v4[*v9] + v97);
              *(void *)&v4[v96] = v97 + 1;
              v95 |= (unint64_t)(v98 & 0x7F) << v93;
              if (v98 < 0)
              {
                v93 += 7;
                BOOL v16 = v94++ >= 9;
                if (v16)
                {
                  uint64_t v95 = 0;
                  goto LABEL_221;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v95 = 0;
          }
LABEL_221:
          BOOL v135 = v95 != 0;
          uint64_t v136 = 33;
          goto LABEL_246;
        case 0x10u:
          char v99 = 0;
          unsigned int v100 = 0;
          uint64_t v101 = 0;
          v5->_hasIsSpecificDateInQuery = 1;
          while (2)
          {
            uint64_t v102 = *v6;
            unint64_t v103 = *(void *)&v4[v102];
            if (v103 == -1 || v103 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v104 = *(unsigned char *)(*(void *)&v4[*v9] + v103);
              *(void *)&v4[v102] = v103 + 1;
              v101 |= (unint64_t)(v104 & 0x7F) << v99;
              if (v104 < 0)
              {
                v99 += 7;
                BOOL v16 = v100++ >= 9;
                if (v16)
                {
                  uint64_t v101 = 0;
                  goto LABEL_225;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v101 = 0;
          }
LABEL_225:
          BOOL v135 = v101 != 0;
          uint64_t v136 = 35;
          goto LABEL_246;
        case 0x11u:
          char v105 = 0;
          unsigned int v106 = 0;
          uint64_t v107 = 0;
          v5->_hasIsGeneralDateReferenceInQuery = 1;
          while (2)
          {
            uint64_t v108 = *v6;
            unint64_t v109 = *(void *)&v4[v108];
            if (v109 == -1 || v109 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v110 = *(unsigned char *)(*(void *)&v4[*v9] + v109);
              *(void *)&v4[v108] = v109 + 1;
              v107 |= (unint64_t)(v110 & 0x7F) << v105;
              if (v110 < 0)
              {
                v105 += 7;
                BOOL v16 = v106++ >= 9;
                if (v16)
                {
                  uint64_t v107 = 0;
                  goto LABEL_229;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v107 = 0;
          }
LABEL_229:
          BOOL v135 = v107 != 0;
          uint64_t v136 = 37;
          goto LABEL_246;
        case 0x12u:
          char v111 = 0;
          unsigned int v112 = 0;
          uint64_t v113 = 0;
          v5->_hasIsHolidayReferenceInQuery = 1;
          while (2)
          {
            uint64_t v114 = *v6;
            unint64_t v115 = *(void *)&v4[v114];
            if (v115 == -1 || v115 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v116 = *(unsigned char *)(*(void *)&v4[*v9] + v115);
              *(void *)&v4[v114] = v115 + 1;
              v113 |= (unint64_t)(v116 & 0x7F) << v111;
              if (v116 < 0)
              {
                v111 += 7;
                BOOL v16 = v112++ >= 9;
                if (v16)
                {
                  uint64_t v113 = 0;
                  goto LABEL_233;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v113 = 0;
          }
LABEL_233:
          BOOL v135 = v113 != 0;
          uint64_t v136 = 39;
          goto LABEL_246;
        case 0x13u:
          char v117 = 0;
          unsigned int v118 = 0;
          uint64_t v119 = 0;
          v5->_hasIsActionRunningInQuery = 1;
          while (2)
          {
            uint64_t v120 = *v6;
            unint64_t v121 = *(void *)&v4[v120];
            if (v121 == -1 || v121 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v122 = *(unsigned char *)(*(void *)&v4[*v9] + v121);
              *(void *)&v4[v120] = v121 + 1;
              v119 |= (unint64_t)(v122 & 0x7F) << v117;
              if (v122 < 0)
              {
                v117 += 7;
                BOOL v16 = v118++ >= 9;
                if (v16)
                {
                  uint64_t v119 = 0;
                  goto LABEL_237;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v119 = 0;
          }
LABEL_237:
          BOOL v135 = v119 != 0;
          uint64_t v136 = 41;
          goto LABEL_246;
        case 0x14u:
          char v123 = 0;
          unsigned int v124 = 0;
          uint64_t v125 = 0;
          v5->_hasIsActionHoldingInQuery = 1;
          while (2)
          {
            uint64_t v126 = *v6;
            unint64_t v127 = *(void *)&v4[v126];
            if (v127 == -1 || v127 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v128 = *(unsigned char *)(*(void *)&v4[*v9] + v127);
              *(void *)&v4[v126] = v127 + 1;
              v125 |= (unint64_t)(v128 & 0x7F) << v123;
              if (v128 < 0)
              {
                v123 += 7;
                BOOL v16 = v124++ >= 9;
                if (v16)
                {
                  uint64_t v125 = 0;
                  goto LABEL_241;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v125 = 0;
          }
LABEL_241:
          BOOL v135 = v125 != 0;
          uint64_t v136 = 43;
          goto LABEL_246;
        case 0x15u:
          char v129 = 0;
          unsigned int v130 = 0;
          uint64_t v131 = 0;
          v5->_hasIsActionClimbingInQuery = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_249;
          }
          continue;
      }
      while (1)
      {
        uint64_t v132 = *v6;
        unint64_t v133 = *(void *)&v4[v132];
        if (v133 == -1 || v133 >= *(void *)&v4[*v7]) {
          break;
        }
        char v134 = *(unsigned char *)(*(void *)&v4[*v9] + v133);
        *(void *)&v4[v132] = v133 + 1;
        v131 |= (unint64_t)(v134 & 0x7F) << v129;
        if ((v134 & 0x80) == 0) {
          goto LABEL_243;
        }
        v129 += 7;
        BOOL v16 = v130++ >= 9;
        if (v16)
        {
          uint64_t v131 = 0;
          goto LABEL_245;
        }
      }
      v4[*v8] = 1;
LABEL_243:
      if (v4[*v8]) {
        uint64_t v131 = 0;
      }
LABEL_245:
      BOOL v135 = v131 != 0;
      uint64_t v136 = 45;
LABEL_246:
      *((unsigned char *)&v5->super.super.isa + v136) = v135;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_249:
  }
    uint64_t v138 = 0;
  else {
LABEL_250:
  }
    uint64_t v138 = v5;

  return v138;
}

- (NSString)description
{
  id v17 = [NSString alloc];
  char v25 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights wasThereAnyResultsShown](self, "wasThereAnyResultsShown"));
  unsigned int v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights searchResultSize](self, "searchResultSize"));
  char v24 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights didUserViewAnyPhoto](self, "didUserViewAnyPhoto"));
  unint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights viewedPhotoCount](self, "viewedPhotoCount"));
  BOOL v16 = BMAeroMLPhotosSearchInsightsUISurfaceTypeAsString([(BMAeroMLPhotosSearchInsights *)self uiSurface]);
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights sizeOfPhotoDB](self, "sizeOfPhotoDB"));
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights numberOfSearchesFromThisSurfaceLastWeek](self, "numberOfSearchesFromThisSurfaceLastWeek"));
  char v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights numberOfSearchesFromThisSurfaceWeeklyAvg](self, "numberOfSearchesFromThisSurfaceWeeklyAvg"));
  unsigned int v20 = [(BMAeroMLPhotosSearchInsights *)self queryRaw];
  char v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights numberOfTokensInQuery](self, "numberOfTokensInQuery"));
  unint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchInsights numberOfKnownEntitiesInQuery](self, "numberOfKnownEntitiesInQuery"));
  unint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isSpecificPersonInQuery](self, "isSpecificPersonInQuery"));
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isGeneralPersonReferenceInQuery](self, "isGeneralPersonReferenceInQuery"));
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isSpecificLocationInQuery](self, "isSpecificLocationInQuery"));
  char v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isGeneralLocationReferenceInQuery](self, "isGeneralLocationReferenceInQuery"));
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isSpecificDateInQuery](self, "isSpecificDateInQuery"));
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isGeneralDateReferenceInQuery](self, "isGeneralDateReferenceInQuery"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isHolidayReferenceInQuery](self, "isHolidayReferenceInQuery"));
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isActionRunningInQuery](self, "isActionRunningInQuery"));
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isActionHoldingInQuery](self, "isActionHoldingInQuery"));
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchInsights isActionClimbingInQuery](self, "isActionClimbingInQuery"));
  uint64_t v18 = objc_msgSend(v17, "initWithFormat:", @"BMAeroMLPhotosSearchInsights with wasThereAnyResultsShown: %@, searchResultSize: %@, didUserViewAnyPhoto: %@, viewedPhotoCount: %@, uiSurface: %@, sizeOfPhotoDB: %@, numberOfSearchesFromThisSurfaceLastWeek: %@, numberOfSearchesFromThisSurfaceWeeklyAvg: %@, queryRaw: %@, numberOfTokensInQuery: %@, numberOfKnownEntitiesInQuery: %@, isSpecificPersonInQuery: %@, isGeneralPersonReferenceInQuery: %@, isSpecificLocationInQuery: %@, isGeneralLocationReferenceInQuery: %@, isSpecificDateInQuery: %@, isGeneralDateReferenceInQuery: %@, isHolidayReferenceInQuery: %@, isActionRunningInQuery: %@, isActionHoldingInQuery: %@, isActionClimbingInQuery: %@", v25, v26, v24, v23, v16, v22, v21, v15, v20, v19, v14, v12, v13, v11, v10, v3,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8);

  return (NSString *)v18;
}

- (BMAeroMLPhotosSearchInsights)initWithWasThereAnyResultsShown:(id)a3 searchResultSize:(id)a4 didUserViewAnyPhoto:(id)a5 viewedPhotoCount:(id)a6 uiSurface:(int)a7 sizeOfPhotoDB:(id)a8 numberOfSearchesFromThisSurfaceLastWeek:(id)a9 numberOfSearchesFromThisSurfaceWeeklyAvg:(id)a10 queryRaw:(id)a11 numberOfTokensInQuery:(id)a12 numberOfKnownEntitiesInQuery:(id)a13 isSpecificPersonInQuery:(id)a14 isGeneralPersonReferenceInQuery:(id)a15 isSpecificLocationInQuery:(id)a16 isGeneralLocationReferenceInQuery:(id)a17 isSpecificDateInQuery:(id)a18 isGeneralDateReferenceInQuery:(id)a19 isHolidayReferenceInQuery:(id)a20 isActionRunningInQuery:(id)a21 isActionHoldingInQuery:(id)a22 isActionClimbingInQuery:(id)a23
{
  id v57 = a3;
  id v56 = a4;
  id v55 = a5;
  id v54 = a6;
  id v53 = a8;
  id v52 = a9;
  id v51 = a10;
  id v47 = a11;
  id v50 = a12;
  id v48 = a13;
  id v27 = a14;
  id v28 = a15;
  id v29 = a16;
  id v30 = a17;
  id v31 = a18;
  id v32 = a19;
  id v33 = a20;
  id v34 = a21;
  id v49 = a22;
  id v35 = a23;
  v58.receiver = self;
  v58.super_class = (Class)BMAeroMLPhotosSearchInsights;
  char v36 = [(BMEventBase *)&v58 init];
  if (v36)
  {
    v36->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v57)
    {
      v36->_hasWasThereAnyResultsShown = 1;
      v36->_wasThereAnyResultsShown = [v57 BOOLValue];
    }
    else
    {
      v36->_hasWasThereAnyResultsShown = 0;
      v36->_wasThereAnyResultsShown = 0;
    }
    unsigned int v37 = v56;
    if (v56)
    {
      v36->_hasSearchResultSize = 1;
      unsigned int v37 = [v56 unsignedIntValue];
    }
    else
    {
      v36->_hasSearchResultSize = 0;
    }
    v36->_searchResultSize = v37;
    if (v55)
    {
      v36->_hasDidUserViewAnyPhoto = 1;
      v36->_didUserViewAnyPhoto = [v55 BOOLValue];
    }
    else
    {
      v36->_hasDidUserViewAnyPhoto = 0;
      v36->_didUserViewAnyPhoto = 0;
    }
    unsigned int v38 = v54;
    if (v54)
    {
      v36->_hasViewedPhotoCount = 1;
      unsigned int v38 = [v54 unsignedIntValue];
    }
    else
    {
      v36->_hasViewedPhotoCount = 0;
    }
    v36->_viewedPhotoCount = v38;
    v36->_uiSurface = a7;
    unsigned int v39 = v53;
    if (v53)
    {
      v36->_hasSizeOfPhotoDB = 1;
      unsigned int v39 = [v53 unsignedIntValue];
    }
    else
    {
      v36->_hasSizeOfPhotoDB = 0;
    }
    v36->_sizeOfPhotoDB = v39;
    unsigned int v40 = v52;
    if (v52)
    {
      v36->_hasNumberOfSearchesFromThisSurfaceLastWeek = 1;
      unsigned int v40 = [v52 unsignedIntValue];
    }
    else
    {
      v36->_hasNumberOfSearchesFromThisSurfaceLastWeek = 0;
    }
    v36->_numberOfSearchesFromThisSurfaceLastWeek = v40;
    unsigned int v41 = v51;
    if (v51)
    {
      v36->_hasNumberOfSearchesFromThisSurfaceWeeklyAvg = 1;
      unsigned int v41 = [v51 unsignedIntValue];
    }
    else
    {
      v36->_hasNumberOfSearchesFromThisSurfaceWeeklyAvg = 0;
    }
    v36->_numberOfSearchesFromThisSurfaceWeeklyAvg = v41;
    objc_storeStrong((id *)&v36->_queryRaw, a11);
    unsigned int v42 = v50;
    if (v50)
    {
      v36->_hasNumberOfTokensInQuery = 1;
      unsigned int v42 = [v50 unsignedIntValue];
    }
    else
    {
      v36->_hasNumberOfTokensInQuery = 0;
    }
    v36->_numberOfTokensInQuery = v42;
    if (v48)
    {
      v36->_hasNumberOfKnownEntitiesInQuery = 1;
      unsigned int v43 = [v48 unsignedIntValue];
    }
    else
    {
      unsigned int v43 = 0;
      v36->_hasNumberOfKnownEntitiesInQuery = 0;
    }
    v36->_numberOfKnownEntitiesInQuery = v43;
    if (v27)
    {
      v36->_hasIsSpecificPersonInQuery = 1;
      v36->_isSpecificPersonInQuery = [v27 BOOLValue];
    }
    else
    {
      v36->_hasIsSpecificPersonInQuery = 0;
      v36->_isSpecificPersonInQuery = 0;
    }
    if (v28)
    {
      v36->_hasIsGeneralPersonReferenceInQuery = 1;
      v36->_isGeneralPersonReferenceInQuery = [v28 BOOLValue];
    }
    else
    {
      v36->_hasIsGeneralPersonReferenceInQuery = 0;
      v36->_isGeneralPersonReferenceInQuery = 0;
    }
    if (v29)
    {
      v36->_hasIsSpecificLocationInQuery = 1;
      v36->_isSpecificLocationInQuery = [v29 BOOLValue];
    }
    else
    {
      v36->_hasIsSpecificLocationInQuery = 0;
      v36->_isSpecificLocationInQuery = 0;
    }
    if (v30)
    {
      v36->_hasIsGeneralLocationReferenceInQuery = 1;
      v36->_isGeneralLocationReferenceInQuery = [v30 BOOLValue];
    }
    else
    {
      v36->_hasIsGeneralLocationReferenceInQuery = 0;
      v36->_isGeneralLocationReferenceInQuery = 0;
    }
    if (v31)
    {
      v36->_hasIsSpecificDateInQuery = 1;
      v36->_isSpecificDateInQuery = [v31 BOOLValue];
    }
    else
    {
      v36->_hasIsSpecificDateInQuery = 0;
      v36->_isSpecificDateInQuery = 0;
    }
    if (v32)
    {
      v36->_hasIsGeneralDateReferenceInQuery = 1;
      v36->_isGeneralDateReferenceInQuery = [v32 BOOLValue];
    }
    else
    {
      id v32 = 0;
      v36->_hasIsGeneralDateReferenceInQuery = 0;
      v36->_isGeneralDateReferenceInQuery = 0;
    }
    if (v33)
    {
      v36->_hasIsHolidayReferenceInQuery = 1;
      v36->_isHolidayReferenceInQuery = [v33 BOOLValue];
    }
    else
    {
      v36->_hasIsHolidayReferenceInQuery = 0;
      v36->_isHolidayReferenceInQuery = 0;
    }
    if (v34)
    {
      v36->_hasIsActionRunningInQuery = 1;
      v36->_isActionRunningInQuery = [v34 BOOLValue];
    }
    else
    {
      v36->_hasIsActionRunningInQuery = 0;
      v36->_isActionRunningInQuery = 0;
    }
    if (v49)
    {
      v36->_hasIsActionHoldingInQuery = 1;
      v36->_isActionHoldingInQuery = [v49 BOOLValue];
    }
    else
    {
      v36->_hasIsActionHoldingInQuery = 0;
      v36->_isActionHoldingInQuery = 0;
    }
    if (v35)
    {
      v36->_hasIsActionClimbingInQuery = 1;
      v36->_isActionClimbingInQuery = [v35 BOOLValue];
    }
    else
    {
      v36->_hasIsActionClimbingInQuery = 0;
      v36->_isActionClimbingInQuery = 0;
    }
  }

  return v36;
}

+ (id)protoFields
{
  v25[21] = *MEMORY[0x1E4F143B8];
  char v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"wasThereAnyResultsShown" number:1 type:12 subMessageClass:0];
  v25[0] = v24;
  unint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"searchResultSize" number:2 type:4 subMessageClass:0];
  v25[1] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"didUserViewAnyPhoto" number:3 type:12 subMessageClass:0];
  v25[2] = v22;
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"viewedPhotoCount" number:4 type:4 subMessageClass:0];
  v25[3] = v21;
  unsigned int v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uiSurface" number:5 type:4 subMessageClass:0];
  v25[4] = v20;
  char v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sizeOfPhotoDB" number:6 type:4 subMessageClass:0];
  v25[5] = v19;
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numberOfSearchesFromThisSurfaceLastWeek" number:7 type:4 subMessageClass:0];
  v25[6] = v18;
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numberOfSearchesFromThisSurfaceWeeklyAvg" number:8 type:4 subMessageClass:0];
  v25[7] = v17;
  BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"queryRaw" number:9 type:13 subMessageClass:0];
  v25[8] = v16;
  char v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numberOfTokensInQuery" number:10 type:4 subMessageClass:0];
  v25[9] = v15;
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numberOfKnownEntitiesInQuery" number:11 type:4 subMessageClass:0];
  v25[10] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isSpecificPersonInQuery" number:12 type:12 subMessageClass:0];
  v25[11] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isGeneralPersonReferenceInQuery" number:13 type:12 subMessageClass:0];
  v25[12] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isSpecificLocationInQuery" number:14 type:12 subMessageClass:0];
  v25[13] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isGeneralLocationReferenceInQuery" number:15 type:12 subMessageClass:0];
  v25[14] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isSpecificDateInQuery" number:16 type:12 subMessageClass:0];
  v25[15] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isGeneralDateReferenceInQuery" number:17 type:12 subMessageClass:0];
  v25[16] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isHolidayReferenceInQuery" number:18 type:12 subMessageClass:0];
  v25[17] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isActionRunningInQuery" number:19 type:12 subMessageClass:0];
  v25[18] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isActionHoldingInQuery" number:20 type:12 subMessageClass:0];
  v25[19] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isActionClimbingInQuery" number:21 type:12 subMessageClass:0];
  v25[20] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:21];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3180;
}

+ (id)columns
{
  v25[21] = *MEMORY[0x1E4F143B8];
  char v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"wasThereAnyResultsShown" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  unint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"searchResultSize" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"didUserViewAnyPhoto" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"viewedPhotoCount" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uiSurface" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  unsigned int v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sizeOfPhotoDB" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  char v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numberOfSearchesFromThisSurfaceLastWeek" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numberOfSearchesFromThisSurfaceWeeklyAvg" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:4 convertedType:0];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"queryRaw" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numberOfTokensInQuery" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:4 convertedType:0];
  char v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numberOfKnownEntitiesInQuery" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:4 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isSpecificPersonInQuery" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isGeneralPersonReferenceInQuery" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:12 convertedType:0];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isSpecificLocationInQuery" dataType:0 requestOnly:0 fieldNumber:14 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isGeneralLocationReferenceInQuery" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:12 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isSpecificDateInQuery" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isGeneralDateReferenceInQuery" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:12 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isHolidayReferenceInQuery" dataType:0 requestOnly:0 fieldNumber:18 protoDataType:12 convertedType:0];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isActionRunningInQuery" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:12 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isActionHoldingInQuery" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:12 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isActionClimbingInQuery" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:12 convertedType:0];
  v25[0] = v24;
  v25[1] = v23;
  v25[2] = v22;
  v25[3] = v13;
  v25[4] = v21;
  v25[5] = v20;
  v25[6] = v19;
  v25[7] = v18;
  v25[8] = v17;
  v25[9] = v16;
  v25[10] = v15;
  v25[11] = v2;
  v25[12] = v3;
  v25[13] = v14;
  v25[14] = v4;
  v25[15] = v5;
  v25[16] = v6;
  v25[17] = v7;
  v25[18] = v12;
  v25[19] = v8;
  v25[20] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:21];

  return v11;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMAeroMLPhotosSearchInsights alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[12] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end