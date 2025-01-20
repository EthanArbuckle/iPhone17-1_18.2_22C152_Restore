@interface _CPSpotlightUsagePropensity
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPEngagementShareRatio)engagementShareRatio;
- (_CPEngagementTriggerRatio)querySuggestionTriggerRatio;
- (_CPEngagementTriggerRatio)topHitTriggerRatio;
- (float)appLaunch;
- (float)onDeviceAddressBookData;
- (float)onDeviceOtherPersonalData;
- (float)other;
- (float)parsec;
- (float)parsecAppStore;
- (float)parsecMaps;
- (float)parsecNews;
- (float)parsecOther;
- (float)parsecStocks;
- (float)parsecWeather;
- (float)parsecWeb;
- (float)parsecWiki;
- (float)punchout;
- (float)querySuggestion;
- (float)siriSuggestions;
- (float)thirdPartyInAppContent;
- (float)webSuggestions;
- (int)totalEngagements;
- (int)totalTopHitEngagements;
- (unint64_t)hash;
- (void)setAppLaunch:(float)a3;
- (void)setEngagementShareRatio:(id)a3;
- (void)setOnDeviceAddressBookData:(float)a3;
- (void)setOnDeviceOtherPersonalData:(float)a3;
- (void)setOther:(float)a3;
- (void)setParsec:(float)a3;
- (void)setParsecAppStore:(float)a3;
- (void)setParsecMaps:(float)a3;
- (void)setParsecNews:(float)a3;
- (void)setParsecOther:(float)a3;
- (void)setParsecStocks:(float)a3;
- (void)setParsecWeather:(float)a3;
- (void)setParsecWeb:(float)a3;
- (void)setParsecWiki:(float)a3;
- (void)setPunchout:(float)a3;
- (void)setQuerySuggestion:(float)a3;
- (void)setQuerySuggestionTriggerRatio:(id)a3;
- (void)setSiriSuggestions:(float)a3;
- (void)setThirdPartyInAppContent:(float)a3;
- (void)setTopHitTriggerRatio:(id)a3;
- (void)setTotalEngagements:(int)a3;
- (void)setTotalTopHitEngagements:(int)a3;
- (void)setWebSuggestions:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPSpotlightUsagePropensity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementShareRatio, 0);
  objc_storeStrong((id *)&self->_querySuggestionTriggerRatio, 0);

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

- (void)setQuerySuggestionTriggerRatio:(id)a3
{
}

- (_CPEngagementTriggerRatio)querySuggestionTriggerRatio
{
  return self->_querySuggestionTriggerRatio;
}

- (void)setTopHitTriggerRatio:(id)a3
{
}

- (_CPEngagementTriggerRatio)topHitTriggerRatio
{
  return self->_topHitTriggerRatio;
}

- (void)setWebSuggestions:(float)a3
{
  self->_webSuggestions = a3;
}

- (float)webSuggestions
{
  return self->_webSuggestions;
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

- (void)setSiriSuggestions:(float)a3
{
  self->_siriSuggestions = a3;
}

- (float)siriSuggestions
{
  return self->_siriSuggestions;
}

- (void)setTotalEngagements:(int)a3
{
  self->_totalEngagements = a3;
}

- (int)totalEngagements
{
  return self->_totalEngagements;
}

- (void)setOther:(float)a3
{
  self->_other = a3;
}

- (float)other
{
  return self->_other;
}

- (void)setQuerySuggestion:(float)a3
{
  self->_querySuggestion = a3;
}

- (float)querySuggestion
{
  return self->_querySuggestion;
}

- (void)setParsec:(float)a3
{
  self->_parsec = a3;
}

- (float)parsec
{
  return self->_parsec;
}

- (void)setThirdPartyInAppContent:(float)a3
{
  self->_thirdPartyInAppContent = a3;
}

- (float)thirdPartyInAppContent
{
  return self->_thirdPartyInAppContent;
}

- (void)setPunchout:(float)a3
{
  self->_punchout = a3;
}

- (float)punchout
{
  return self->_punchout;
}

- (void)setOnDeviceOtherPersonalData:(float)a3
{
  self->_onDeviceOtherPersonalData = a3;
}

- (float)onDeviceOtherPersonalData
{
  return self->_onDeviceOtherPersonalData;
}

- (void)setOnDeviceAddressBookData:(float)a3
{
  self->_onDeviceAddressBookData = a3;
}

- (float)onDeviceAddressBookData
{
  return self->_onDeviceAddressBookData;
}

- (void)setAppLaunch:(float)a3
{
  self->_appLaunch = a3;
}

- (float)appLaunch
{
  return self->_appLaunch;
}

- (unint64_t)hash
{
  float appLaunch = self->_appLaunch;
  double v4 = appLaunch;
  if (appLaunch < 0.0) {
    double v4 = -appLaunch;
  }
  long double v5 = round(v4);
  unint64_t v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  float onDeviceAddressBookData = self->_onDeviceAddressBookData;
  double v8 = onDeviceAddressBookData;
  if (onDeviceAddressBookData < 0.0) {
    double v8 = -onDeviceAddressBookData;
  }
  long double v9 = round(v8);
  unint64_t v10 = ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL)) ^ v6;
  float onDeviceOtherPersonalData = self->_onDeviceOtherPersonalData;
  double v12 = onDeviceOtherPersonalData;
  if (onDeviceOtherPersonalData < 0.0) {
    double v12 = -onDeviceOtherPersonalData;
  }
  long double v13 = round(v12);
  unint64_t v14 = (unint64_t)(fmod(v13, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v12 - v13, 0x40uLL);
  float punchout = self->_punchout;
  double v16 = punchout;
  if (punchout < 0.0) {
    double v16 = -punchout;
  }
  long double v17 = round(v16);
  unint64_t v79 = v10 ^ v14 ^ ((unint64_t)(fmod(v17, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v16 - v17, 0x40uLL));
  float thirdPartyInAppContent = self->_thirdPartyInAppContent;
  double v19 = thirdPartyInAppContent;
  if (thirdPartyInAppContent < 0.0) {
    double v19 = -thirdPartyInAppContent;
  }
  long double v20 = round(v19);
  unint64_t v21 = (unint64_t)(fmod(v20, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v19 - v20, 0x40uLL);
  float parsec = self->_parsec;
  double v23 = parsec;
  if (parsec < 0.0) {
    double v23 = -parsec;
  }
  long double v24 = round(v23);
  unint64_t v78 = v21 ^ ((unint64_t)(fmod(v24, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v23 - v24, 0x40uLL));
  float querySuggestion = self->_querySuggestion;
  double v26 = querySuggestion;
  if (querySuggestion < 0.0) {
    double v26 = -querySuggestion;
  }
  long double v27 = round(v26);
  unint64_t v77 = (unint64_t)(fmod(v27, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v26 - v27, 0x40uLL);
  float other = self->_other;
  double v29 = other;
  if (other < 0.0) {
    double v29 = -other;
  }
  long double v30 = round(v29);
  unint64_t v76 = (unint64_t)(fmod(v30, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v29 - v30, 0x40uLL);
  uint64_t v75 = 2654435761 * self->_totalEngagements;
  float siriSuggestions = self->_siriSuggestions;
  double v32 = siriSuggestions;
  if (siriSuggestions < 0.0) {
    double v32 = -siriSuggestions;
  }
  long double v33 = round(v32);
  unint64_t v74 = (unint64_t)(fmod(v33, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v32 - v33, 0x40uLL);
  float parsecWeb = self->_parsecWeb;
  double v35 = parsecWeb;
  if (parsecWeb < 0.0) {
    double v35 = -parsecWeb;
  }
  long double v36 = round(v35);
  unint64_t v73 = (unint64_t)(fmod(v36, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v35 - v36, 0x40uLL);
  float parsecAppStore = self->_parsecAppStore;
  double v38 = parsecAppStore;
  if (parsecAppStore < 0.0) {
    double v38 = -parsecAppStore;
  }
  long double v39 = round(v38);
  unint64_t v72 = (unint64_t)(fmod(v39, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v38 - v39, 0x40uLL);
  float parsecMaps = self->_parsecMaps;
  double v41 = parsecMaps;
  if (parsecMaps < 0.0) {
    double v41 = -parsecMaps;
  }
  long double v42 = round(v41);
  unint64_t v71 = (unint64_t)(fmod(v42, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v41 - v42, 0x40uLL);
  float parsecWiki = self->_parsecWiki;
  double v44 = parsecWiki;
  if (parsecWiki < 0.0) {
    double v44 = -parsecWiki;
  }
  long double v45 = round(v44);
  unint64_t v46 = (unint64_t)(fmod(v45, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v44 - v45, 0x40uLL);
  float parsecNews = self->_parsecNews;
  double v48 = parsecNews;
  if (parsecNews < 0.0) {
    double v48 = -parsecNews;
  }
  long double v49 = round(v48);
  unint64_t v50 = (unint64_t)(fmod(v49, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v48 - v49, 0x40uLL);
  float parsecStocks = self->_parsecStocks;
  double v52 = parsecStocks;
  if (parsecStocks < 0.0) {
    double v52 = -parsecStocks;
  }
  long double v53 = round(v52);
  unint64_t v54 = (unint64_t)(fmod(v53, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v52 - v53, 0x40uLL);
  float parsecWeather = self->_parsecWeather;
  double v56 = parsecWeather;
  if (parsecWeather < 0.0) {
    double v56 = -parsecWeather;
  }
  long double v57 = round(v56);
  unint64_t v58 = (unint64_t)(fmod(v57, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v56 - v57, 0x40uLL);
  float parsecOther = self->_parsecOther;
  double v60 = parsecOther;
  if (parsecOther < 0.0) {
    double v60 = -parsecOther;
  }
  long double v61 = round(v60);
  unint64_t v62 = (unint64_t)(fmod(v61, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v60 - v61, 0x40uLL);
  float webSuggestions = self->_webSuggestions;
  double v64 = webSuggestions;
  if (webSuggestions < 0.0) {
    double v64 = -webSuggestions;
  }
  long double v65 = round(v64);
  unint64_t v66 = (unint64_t)(fmod(v65, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v64 - v65, 0x40uLL);
  unint64_t v67 = [(_CPEngagementTriggerRatio *)self->_topHitTriggerRatio hash];
  unint64_t v68 = [(_CPEngagementTriggerRatio *)self->_querySuggestionTriggerRatio hash];
  uint64_t v69 = 2654435761 * self->_totalTopHitEngagements;
  return v79 ^ v78 ^ v75 ^ v77 ^ v76 ^ v74 ^ v73 ^ v72 ^ v71 ^ v46 ^ v50 ^ v54 ^ v58 ^ v67 ^ v62 ^ v68 ^ v66 ^ v69 ^ [(_CPEngagementShareRatio *)self->_engagementShareRatio hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  float appLaunch = self->_appLaunch;
  [v4 appLaunch];
  if (appLaunch != v6) {
    goto LABEL_37;
  }
  float onDeviceAddressBookData = self->_onDeviceAddressBookData;
  [v4 onDeviceAddressBookData];
  if (onDeviceAddressBookData != v8) {
    goto LABEL_37;
  }
  float onDeviceOtherPersonalData = self->_onDeviceOtherPersonalData;
  [v4 onDeviceOtherPersonalData];
  if (onDeviceOtherPersonalData != v10) {
    goto LABEL_37;
  }
  float punchout = self->_punchout;
  [v4 punchout];
  if (punchout != v12) {
    goto LABEL_37;
  }
  float thirdPartyInAppContent = self->_thirdPartyInAppContent;
  [v4 thirdPartyInAppContent];
  if (thirdPartyInAppContent != v14) {
    goto LABEL_37;
  }
  float parsec = self->_parsec;
  [v4 parsec];
  if (parsec != v16) {
    goto LABEL_37;
  }
  float querySuggestion = self->_querySuggestion;
  [v4 querySuggestion];
  if (querySuggestion != v18) {
    goto LABEL_37;
  }
  float other = self->_other;
  [v4 other];
  if (other != v20) {
    goto LABEL_37;
  }
  int totalEngagements = self->_totalEngagements;
  if (totalEngagements != [v4 totalEngagements]) {
    goto LABEL_37;
  }
  float siriSuggestions = self->_siriSuggestions;
  [v4 siriSuggestions];
  if (siriSuggestions != v23) {
    goto LABEL_37;
  }
  float parsecWeb = self->_parsecWeb;
  [v4 parsecWeb];
  if (parsecWeb != v25) {
    goto LABEL_37;
  }
  float parsecAppStore = self->_parsecAppStore;
  [v4 parsecAppStore];
  if (parsecAppStore != v27) {
    goto LABEL_37;
  }
  float parsecMaps = self->_parsecMaps;
  [v4 parsecMaps];
  if (parsecMaps != v29) {
    goto LABEL_37;
  }
  float parsecWiki = self->_parsecWiki;
  [v4 parsecWiki];
  if (parsecWiki != v31) {
    goto LABEL_37;
  }
  float parsecNews = self->_parsecNews;
  [v4 parsecNews];
  if (parsecNews != v33) {
    goto LABEL_37;
  }
  float parsecStocks = self->_parsecStocks;
  [v4 parsecStocks];
  if (parsecStocks != v35) {
    goto LABEL_37;
  }
  float parsecWeather = self->_parsecWeather;
  [v4 parsecWeather];
  if (parsecWeather != v37) {
    goto LABEL_37;
  }
  float parsecOther = self->_parsecOther;
  [v4 parsecOther];
  if (parsecOther != v39) {
    goto LABEL_37;
  }
  float webSuggestions = self->_webSuggestions;
  [v4 webSuggestions];
  if (webSuggestions != v41) {
    goto LABEL_37;
  }
  long double v42 = [(_CPSpotlightUsagePropensity *)self topHitTriggerRatio];
  v43 = [v4 topHitTriggerRatio];
  if ((v42 == 0) == (v43 != 0)) {
    goto LABEL_36;
  }
  uint64_t v44 = [(_CPSpotlightUsagePropensity *)self topHitTriggerRatio];
  if (v44)
  {
    long double v45 = (void *)v44;
    unint64_t v46 = [(_CPSpotlightUsagePropensity *)self topHitTriggerRatio];
    v47 = [v4 topHitTriggerRatio];
    int v48 = [v46 isEqual:v47];

    if (!v48) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  long double v42 = [(_CPSpotlightUsagePropensity *)self querySuggestionTriggerRatio];
  v43 = [v4 querySuggestionTriggerRatio];
  if ((v42 == 0) == (v43 != 0)) {
    goto LABEL_36;
  }
  uint64_t v49 = [(_CPSpotlightUsagePropensity *)self querySuggestionTriggerRatio];
  if (v49)
  {
    unint64_t v50 = (void *)v49;
    v51 = [(_CPSpotlightUsagePropensity *)self querySuggestionTriggerRatio];
    double v52 = [v4 querySuggestionTriggerRatio];
    int v53 = [v51 isEqual:v52];

    if (!v53) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  int totalTopHitEngagements = self->_totalTopHitEngagements;
  if (totalTopHitEngagements != [v4 totalTopHitEngagements]) {
    goto LABEL_37;
  }
  long double v42 = [(_CPSpotlightUsagePropensity *)self engagementShareRatio];
  v43 = [v4 engagementShareRatio];
  if ((v42 == 0) == (v43 != 0))
  {
LABEL_36:

    goto LABEL_37;
  }
  uint64_t v55 = [(_CPSpotlightUsagePropensity *)self engagementShareRatio];
  if (!v55)
  {

LABEL_40:
    BOOL v60 = 1;
    goto LABEL_38;
  }
  double v56 = (void *)v55;
  long double v57 = [(_CPSpotlightUsagePropensity *)self engagementShareRatio];
  unint64_t v58 = [v4 engagementShareRatio];
  char v59 = [v57 isEqual:v58];

  if (v59) {
    goto LABEL_40;
  }
LABEL_37:
  BOOL v60 = 0;
LABEL_38:

  return v60;
}

- (void)writeTo:(id)a3
{
  id v28 = a3;
  [(_CPSpotlightUsagePropensity *)self appLaunch];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSpotlightUsagePropensity *)self onDeviceAddressBookData];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSpotlightUsagePropensity *)self onDeviceOtherPersonalData];
  if (v6 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSpotlightUsagePropensity *)self punchout];
  if (v7 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSpotlightUsagePropensity *)self thirdPartyInAppContent];
  if (v8 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSpotlightUsagePropensity *)self parsec];
  if (v9 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSpotlightUsagePropensity *)self querySuggestion];
  if (v10 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSpotlightUsagePropensity *)self other];
  if (v11 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_CPSpotlightUsagePropensity *)self totalEngagements]) {
    PBDataWriterWriteInt32Field();
  }
  [(_CPSpotlightUsagePropensity *)self siriSuggestions];
  if (v12 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSpotlightUsagePropensity *)self parsecWeb];
  if (v13 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSpotlightUsagePropensity *)self parsecAppStore];
  if (v14 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSpotlightUsagePropensity *)self parsecMaps];
  if (v15 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSpotlightUsagePropensity *)self parsecWiki];
  if (v16 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSpotlightUsagePropensity *)self parsecNews];
  if (v17 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSpotlightUsagePropensity *)self parsecStocks];
  if (v18 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSpotlightUsagePropensity *)self parsecWeather];
  if (v19 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSpotlightUsagePropensity *)self parsecOther];
  if (v20 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPSpotlightUsagePropensity *)self webSuggestions];
  if (v21 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  v22 = [(_CPSpotlightUsagePropensity *)self topHitTriggerRatio];

  if (v22)
  {
    float v23 = [(_CPSpotlightUsagePropensity *)self topHitTriggerRatio];
    PBDataWriterWriteSubmessage();
  }
  long double v24 = [(_CPSpotlightUsagePropensity *)self querySuggestionTriggerRatio];

  if (v24)
  {
    float v25 = [(_CPSpotlightUsagePropensity *)self querySuggestionTriggerRatio];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPSpotlightUsagePropensity *)self totalTopHitEngagements]) {
    PBDataWriterWriteInt32Field();
  }
  double v26 = [(_CPSpotlightUsagePropensity *)self engagementShareRatio];

  if (v26)
  {
    float v27 = [(_CPSpotlightUsagePropensity *)self engagementShareRatio];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPSpotlightUsagePropensityReadFrom(self, (uint64_t)a3, v3);
}

@end