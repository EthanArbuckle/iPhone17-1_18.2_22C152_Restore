@interface _CPSafariUsagePropensity
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPEngagementShareRatio)engagementShareRatio;
- (_CPEngagementTriggerRatio)topHitTriggerRatio;
- (float)goToSite;
- (float)localGoto;
- (float)localTap;
- (float)other;
- (float)parsecAppStore;
- (float)parsecGoto;
- (float)parsecMaps;
- (float)parsecNews;
- (float)parsecOther;
- (float)parsecStocks;
- (float)parsecTap;
- (float)parsecWeather;
- (float)parsecWeb;
- (float)parsecWiki;
- (float)thirdPartyCompletionOrRecentSearch;
- (float)thirdPartyGoto;
- (float)thirdPartyTap;
- (int)totalEngagements;
- (int)totalTopHitEngagements;
- (unint64_t)hash;
- (void)setEngagementShareRatio:(id)a3;
- (void)setGoToSite:(float)a3;
- (void)setLocalGoto:(float)a3;
- (void)setLocalTap:(float)a3;
- (void)setOther:(float)a3;
- (void)setParsecAppStore:(float)a3;
- (void)setParsecGoto:(float)a3;
- (void)setParsecMaps:(float)a3;
- (void)setParsecNews:(float)a3;
- (void)setParsecOther:(float)a3;
- (void)setParsecStocks:(float)a3;
- (void)setParsecTap:(float)a3;
- (void)setParsecWeather:(float)a3;
- (void)setParsecWeb:(float)a3;
- (void)setParsecWiki:(float)a3;
- (void)setThirdPartyCompletionOrRecentSearch:(float)a3;
- (void)setThirdPartyGoto:(float)a3;
- (void)setThirdPartyTap:(float)a3;
- (void)setTopHitTriggerRatio:(id)a3;
- (void)setTotalEngagements:(int)a3;
- (void)setTotalTopHitEngagements:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPSafariUsagePropensity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementShareRatio, 0);

  objc_storeStrong((id *)&self->_topHitTriggerRatio, 0);
}

- (void)setEngagementShareRatio:(id)a3
{
}

- (_CPEngagementShareRatio)engagementShareRatio
{
  return self->_engagementShareRatio;
}

- (void)setTotalTopHitEngagements:(int)a3
{
  self->_totalTopHitEngagements = a3;
}

- (int)totalTopHitEngagements
{
  return self->_totalTopHitEngagements;
}

- (void)setTopHitTriggerRatio:(id)a3
{
}

- (_CPEngagementTriggerRatio)topHitTriggerRatio
{
  return self->_topHitTriggerRatio;
}

- (void)setTotalEngagements:(int)a3
{
  self->_totalEngagements = a3;
}

- (int)totalEngagements
{
  return self->_totalEngagements;
}

- (void)setParsecOther:(float)a3
{
  self->_parsecOther = a3;
}

- (float)parsecOther
{
  return self->_parsecOther;
}

- (void)setParsecWeather:(float)a3
{
  self->_parsecWeather = a3;
}

- (float)parsecWeather
{
  return self->_parsecWeather;
}

- (void)setParsecStocks:(float)a3
{
  self->_parsecStocks = a3;
}

- (float)parsecStocks
{
  return self->_parsecStocks;
}

- (void)setParsecNews:(float)a3
{
  self->_parsecNews = a3;
}

- (float)parsecNews
{
  return self->_parsecNews;
}

- (void)setParsecWiki:(float)a3
{
  self->_parsecWiki = a3;
}

- (float)parsecWiki
{
  return self->_parsecWiki;
}

- (void)setParsecMaps:(float)a3
{
  self->_parsecMaps = a3;
}

- (float)parsecMaps
{
  return self->_parsecMaps;
}

- (void)setParsecAppStore:(float)a3
{
  self->_parsecAppStore = a3;
}

- (float)parsecAppStore
{
  return self->_parsecAppStore;
}

- (void)setParsecWeb:(float)a3
{
  self->_parsecWeb = a3;
}

- (float)parsecWeb
{
  return self->_parsecWeb;
}

- (void)setOther:(float)a3
{
  self->_other = a3;
}

- (float)other
{
  return self->_other;
}

- (void)setGoToSite:(float)a3
{
  self->_goToSite = a3;
}

- (float)goToSite
{
  return self->_goToSite;
}

- (void)setThirdPartyCompletionOrRecentSearch:(float)a3
{
  self->_thirdPartyCompletionOrRecentSearch = a3;
}

- (float)thirdPartyCompletionOrRecentSearch
{
  return self->_thirdPartyCompletionOrRecentSearch;
}

- (void)setThirdPartyTap:(float)a3
{
  self->_thirdPartyTap = a3;
}

- (float)thirdPartyTap
{
  return self->_thirdPartyTap;
}

- (void)setThirdPartyGoto:(float)a3
{
  self->_thirdPartyGoto = a3;
}

- (float)thirdPartyGoto
{
  return self->_thirdPartyGoto;
}

- (void)setParsecTap:(float)a3
{
  self->_parsecTap = a3;
}

- (float)parsecTap
{
  return self->_parsecTap;
}

- (void)setParsecGoto:(float)a3
{
  self->_parsecGoto = a3;
}

- (float)parsecGoto
{
  return self->_parsecGoto;
}

- (void)setLocalTap:(float)a3
{
  self->_localTap = a3;
}

- (float)localTap
{
  return self->_localTap;
}

- (void)setLocalGoto:(float)a3
{
  self->_localGoto = a3;
}

- (float)localGoto
{
  return self->_localGoto;
}

- (unint64_t)hash
{
  float localGoto = self->_localGoto;
  double v4 = localGoto;
  if (localGoto < 0.0) {
    double v4 = -localGoto;
  }
  long double v5 = round(v4);
  unint64_t v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  float localTap = self->_localTap;
  double v8 = localTap;
  if (localTap < 0.0) {
    double v8 = -localTap;
  }
  long double v9 = round(v8);
  unint64_t v10 = ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL)) ^ v6;
  float parsecGoto = self->_parsecGoto;
  double v12 = parsecGoto;
  if (parsecGoto < 0.0) {
    double v12 = -parsecGoto;
  }
  long double v13 = round(v12);
  unint64_t v14 = (unint64_t)(fmod(v13, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v12 - v13, 0x40uLL);
  float parsecTap = self->_parsecTap;
  double v16 = parsecTap;
  if (parsecTap < 0.0) {
    double v16 = -parsecTap;
  }
  long double v17 = round(v16);
  unint64_t v18 = v10 ^ v14 ^ ((unint64_t)(fmod(v17, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v16 - v17, 0x40uLL));
  float thirdPartyGoto = self->_thirdPartyGoto;
  double v20 = thirdPartyGoto;
  if (thirdPartyGoto < 0.0) {
    double v20 = -thirdPartyGoto;
  }
  long double v21 = round(v20);
  unint64_t v22 = (unint64_t)(fmod(v21, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v20 - v21, 0x40uLL);
  float thirdPartyTap = self->_thirdPartyTap;
  double v24 = thirdPartyTap;
  if (thirdPartyTap < 0.0) {
    double v24 = -thirdPartyTap;
  }
  long double v25 = round(v24);
  unint64_t v26 = v22 ^ ((unint64_t)(fmod(v25, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v24 - v25, 0x40uLL));
  float thirdPartyCompletionOrRecentSearch = self->_thirdPartyCompletionOrRecentSearch;
  double v28 = thirdPartyCompletionOrRecentSearch;
  if (thirdPartyCompletionOrRecentSearch < 0.0) {
    double v28 = -thirdPartyCompletionOrRecentSearch;
  }
  long double v29 = round(v28);
  unint64_t v30 = v18 ^ v26 ^ ((unint64_t)(fmod(v29, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v28 - v29, 0x40uLL));
  float goToSite = self->_goToSite;
  double v32 = goToSite;
  if (goToSite < 0.0) {
    double v32 = -goToSite;
  }
  long double v33 = round(v32);
  unint64_t v34 = (unint64_t)(fmod(v33, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v32 - v33, 0x40uLL);
  float other = self->_other;
  double v36 = other;
  if (other < 0.0) {
    double v36 = -other;
  }
  long double v37 = round(v36);
  unint64_t v38 = v34 ^ ((unint64_t)(fmod(v37, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v36 - v37, 0x40uLL));
  float parsecWeb = self->_parsecWeb;
  double v40 = parsecWeb;
  if (parsecWeb < 0.0) {
    double v40 = -parsecWeb;
  }
  long double v41 = round(v40);
  unint64_t v42 = v38 ^ ((unint64_t)(fmod(v41, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v40 - v41, 0x40uLL));
  float parsecAppStore = self->_parsecAppStore;
  double v44 = parsecAppStore;
  if (parsecAppStore < 0.0) {
    double v44 = -parsecAppStore;
  }
  long double v45 = round(v44);
  unint64_t v46 = v30 ^ v42 ^ ((unint64_t)(fmod(v45, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v44 - v45, 0x40uLL));
  float parsecMaps = self->_parsecMaps;
  double v48 = parsecMaps;
  if (parsecMaps < 0.0) {
    double v48 = -parsecMaps;
  }
  long double v49 = round(v48);
  unint64_t v50 = (unint64_t)(fmod(v49, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v48 - v49, 0x40uLL);
  float parsecWiki = self->_parsecWiki;
  double v52 = parsecWiki;
  if (parsecWiki < 0.0) {
    double v52 = -parsecWiki;
  }
  long double v53 = round(v52);
  unint64_t v54 = v50 ^ ((unint64_t)(fmod(v53, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v52 - v53, 0x40uLL));
  float parsecNews = self->_parsecNews;
  double v56 = parsecNews;
  if (parsecNews < 0.0) {
    double v56 = -parsecNews;
  }
  long double v57 = round(v56);
  unint64_t v58 = v54 ^ ((unint64_t)(fmod(v57, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v56 - v57, 0x40uLL));
  float parsecStocks = self->_parsecStocks;
  double v60 = parsecStocks;
  if (parsecStocks < 0.0) {
    double v60 = -parsecStocks;
  }
  long double v61 = round(v60);
  unint64_t v62 = v58 ^ ((unint64_t)(fmod(v61, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v60 - v61, 0x40uLL));
  float parsecWeather = self->_parsecWeather;
  double v64 = parsecWeather;
  if (parsecWeather < 0.0) {
    double v64 = -parsecWeather;
  }
  long double v65 = round(v64);
  unint64_t v66 = (unint64_t)(fmod(v65, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v64 - v65, 0x40uLL);
  float parsecOther = self->_parsecOther;
  double v68 = parsecOther;
  if (parsecOther < 0.0) {
    double v68 = -parsecOther;
  }
  long double v69 = round(v68);
  unint64_t v70 = (unint64_t)(fmod(v69, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v68 - v69, 0x40uLL);
  uint64_t v71 = 2654435761 * self->_totalEngagements;
  unint64_t v72 = [(_CPEngagementTriggerRatio *)self->_topHitTriggerRatio hash];
  uint64_t v73 = 2654435761 * self->_totalTopHitEngagements;
  return v46 ^ v62 ^ v71 ^ v66 ^ v72 ^ v70 ^ v73 ^ [(_CPEngagementShareRatio *)self->_engagementShareRatio hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  float localGoto = self->_localGoto;
  [v4 localGoto];
  if (localGoto != v6) {
    goto LABEL_31;
  }
  float localTap = self->_localTap;
  [v4 localTap];
  if (localTap != v8) {
    goto LABEL_31;
  }
  float parsecGoto = self->_parsecGoto;
  [v4 parsecGoto];
  if (parsecGoto != v10) {
    goto LABEL_31;
  }
  float parsecTap = self->_parsecTap;
  [v4 parsecTap];
  if (parsecTap != v12) {
    goto LABEL_31;
  }
  float thirdPartyGoto = self->_thirdPartyGoto;
  [v4 thirdPartyGoto];
  if (thirdPartyGoto != v14) {
    goto LABEL_31;
  }
  float thirdPartyTap = self->_thirdPartyTap;
  [v4 thirdPartyTap];
  if (thirdPartyTap != v16) {
    goto LABEL_31;
  }
  float thirdPartyCompletionOrRecentSearch = self->_thirdPartyCompletionOrRecentSearch;
  [v4 thirdPartyCompletionOrRecentSearch];
  if (thirdPartyCompletionOrRecentSearch != v18) {
    goto LABEL_31;
  }
  float goToSite = self->_goToSite;
  [v4 goToSite];
  if (goToSite != v20) {
    goto LABEL_31;
  }
  float other = self->_other;
  [v4 other];
  if (other != v22) {
    goto LABEL_31;
  }
  float parsecWeb = self->_parsecWeb;
  [v4 parsecWeb];
  if (parsecWeb != v24) {
    goto LABEL_31;
  }
  float parsecAppStore = self->_parsecAppStore;
  [v4 parsecAppStore];
  if (parsecAppStore != v26) {
    goto LABEL_31;
  }
  float parsecMaps = self->_parsecMaps;
  [v4 parsecMaps];
  if (parsecMaps != v28) {
    goto LABEL_31;
  }
  float parsecWiki = self->_parsecWiki;
  [v4 parsecWiki];
  if (parsecWiki != v30) {
    goto LABEL_31;
  }
  float parsecNews = self->_parsecNews;
  [v4 parsecNews];
  if (parsecNews != v32) {
    goto LABEL_31;
  }
  float parsecStocks = self->_parsecStocks;
  [v4 parsecStocks];
  if (parsecStocks != v34) {
    goto LABEL_31;
  }
  float parsecWeather = self->_parsecWeather;
  [v4 parsecWeather];
  if (parsecWeather != v36) {
    goto LABEL_31;
  }
  float parsecOther = self->_parsecOther;
  [v4 parsecOther];
  if (parsecOther != v38) {
    goto LABEL_31;
  }
  int totalEngagements = self->_totalEngagements;
  if (totalEngagements != [v4 totalEngagements]) {
    goto LABEL_31;
  }
  double v40 = [(_CPSafariUsagePropensity *)self topHitTriggerRatio];
  long double v41 = [v4 topHitTriggerRatio];
  if ((v40 == 0) == (v41 != 0)) {
    goto LABEL_30;
  }
  uint64_t v42 = [(_CPSafariUsagePropensity *)self topHitTriggerRatio];
  if (v42)
  {
    v43 = (void *)v42;
    double v44 = [(_CPSafariUsagePropensity *)self topHitTriggerRatio];
    long double v45 = [v4 topHitTriggerRatio];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  int totalTopHitEngagements = self->_totalTopHitEngagements;
  if (totalTopHitEngagements != [v4 totalTopHitEngagements]) {
    goto LABEL_31;
  }
  double v40 = [(_CPSafariUsagePropensity *)self engagementShareRatio];
  long double v41 = [v4 engagementShareRatio];
  if ((v40 == 0) == (v41 != 0))
  {
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v48 = [(_CPSafariUsagePropensity *)self engagementShareRatio];
  if (!v48)
  {

LABEL_34:
    BOOL v53 = 1;
    goto LABEL_32;
  }
  long double v49 = (void *)v48;
  unint64_t v50 = [(_CPSafariUsagePropensity *)self engagementShareRatio];
  v51 = [v4 engagementShareRatio];
  char v52 = [v50 isEqual:v51];

  if (v52) {
    goto LABEL_34;
  }
LABEL_31:
  BOOL v53 = 0;
LABEL_32:

  return v53;
}

- (void)writeTo:(id)a3
{
  id v25 = a3;
  [(_CPSafariUsagePropensity *)self localGoto];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSafariUsagePropensity *)self localTap];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSafariUsagePropensity *)self parsecGoto];
  if (v6 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSafariUsagePropensity *)self parsecTap];
  if (v7 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSafariUsagePropensity *)self thirdPartyGoto];
  if (v8 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSafariUsagePropensity *)self thirdPartyTap];
  if (v9 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSafariUsagePropensity *)self thirdPartyCompletionOrRecentSearch];
  if (v10 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSafariUsagePropensity *)self goToSite];
  if (v11 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSafariUsagePropensity *)self other];
  if (v12 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSafariUsagePropensity *)self parsecWeb];
  if (v13 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSafariUsagePropensity *)self parsecAppStore];
  if (v14 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSafariUsagePropensity *)self parsecMaps];
  if (v15 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSafariUsagePropensity *)self parsecWiki];
  if (v16 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSafariUsagePropensity *)self parsecNews];
  if (v17 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSafariUsagePropensity *)self parsecStocks];
  if (v18 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSafariUsagePropensity *)self parsecWeather];
  if (v19 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSafariUsagePropensity *)self parsecOther];
  if (v20 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_CPSafariUsagePropensity *)self totalEngagements]) {
    PBDataWriterWriteInt32Field();
  }
  long double v21 = [(_CPSafariUsagePropensity *)self topHitTriggerRatio];

  if (v21)
  {
    float v22 = [(_CPSafariUsagePropensity *)self topHitTriggerRatio];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPSafariUsagePropensity *)self totalTopHitEngagements]) {
    PBDataWriterWriteInt32Field();
  }
  v23 = [(_CPSafariUsagePropensity *)self engagementShareRatio];

  if (v23)
  {
    float v24 = [(_CPSafariUsagePropensity *)self engagementShareRatio];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPSafariUsagePropensityReadFrom(self, (uint64_t)a3, v3);
}

@end