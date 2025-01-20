@interface _CPClientSession
- (BOOL)duEnabled;
- (BOOL)getResourceVersions:(id *)a3 forKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternalCarry;
- (BOOL)readFrom:(id)a3;
- (BOOL)removeTimestamps;
- (BOOL)searchOptOut;
- (NSArray)experimentInfos;
- (NSArray)feedbacks;
- (NSData)jsonFeedback;
- (NSDictionary)resourceVersions;
- (NSString)agent;
- (NSString)countryCode;
- (NSString)locale;
- (NSString)parsecDeveloperID;
- (NSString)userGuidString;
- (_CPUsageEnvelope)cohortsFeedback;
- (_CPUsageSinceLookback)usageSinceLookback;
- (double)sessionStart;
- (id)experimentInfoAtIndex:(unint64_t)a3;
- (id)feedbackAtIndex:(unint64_t)a3;
- (int)previousSessionEndReason;
- (int)privateRelayStatus;
- (unint64_t)experimentInfoCount;
- (unint64_t)feedbackCount;
- (unint64_t)hash;
- (unsigned)devicePersistentD20;
- (void)addExperimentInfo:(id)a3;
- (void)addFeedback:(id)a3;
- (void)clearExperimentInfo;
- (void)clearFeedback;
- (void)setAgent:(id)a3;
- (void)setCohortsFeedback:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDevicePersistentD20:(unsigned int)a3;
- (void)setDuEnabled:(BOOL)a3;
- (void)setExperimentInfo:(id)a3;
- (void)setExperimentInfos:(id)a3;
- (void)setFeedback:(id)a3;
- (void)setFeedbacks:(id)a3;
- (void)setIsInternalCarry:(BOOL)a3;
- (void)setJsonFeedback:(id)a3;
- (void)setLocale:(id)a3;
- (void)setParsecDeveloperID:(id)a3;
- (void)setPreviousSessionEndReason:(int)a3;
- (void)setPrivateRelayStatus:(int)a3;
- (void)setRemoveTimestamps:(BOOL)a3;
- (void)setResourceVersions:(id)a3;
- (void)setResourceVersions:(id)a3 forKey:(id)a4;
- (void)setSearchOptOut:(BOOL)a3;
- (void)setSessionStart:(double)a3;
- (void)setUsageSinceLookback:(id)a3;
- (void)setUserGuidString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPClientSession

- (void)writeTo:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_CPClientSession *)self agent];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(_CPClientSession *)self userGuidString];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v7 = self->_resourceVersions;
  uint64_t v8 = [(NSDictionary *)v7 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v43;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v42 + 1) + 8 * v11);
        uint64_t v41 = 0;
        PBDataWriterPlaceMark();
        PBDataWriterWriteStringField();
        v13 = [(NSDictionary *)self->_resourceVersions objectForKeyedSubscript:v12];
        PBDataWriterWriteStringField();

        PBDataWriterRecallMark();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSDictionary *)v7 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v9);
  }

  [(_CPClientSession *)self sessionStart];
  if (v14 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  if ([(_CPClientSession *)self previousSessionEndReason]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPClientSession *)self removeTimestamps]) {
    PBDataWriterWriteBOOLField();
  }
  v15 = [(_CPClientSession *)self parsecDeveloperID];

  if (v15) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPClientSession *)self duEnabled]) {
    PBDataWriterWriteBOOLField();
  }
  v16 = [(_CPClientSession *)self countryCode];

  if (v16) {
    PBDataWriterWriteStringField();
  }
  v17 = [(_CPClientSession *)self locale];

  if (v17) {
    PBDataWriterWriteStringField();
  }
  v18 = [(_CPClientSession *)self usageSinceLookback];

  if (v18)
  {
    v19 = [(_CPClientSession *)self usageSinceLookback];
    PBDataWriterWriteSubmessage();
  }
  v20 = [(_CPClientSession *)self cohortsFeedback];

  if (v20)
  {
    v21 = [(_CPClientSession *)self cohortsFeedback];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPClientSession *)self devicePersistentD20]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPClientSession *)self privateRelayStatus]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPClientSession *)self isInternalCarry]) {
    PBDataWriterWriteBOOLField();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v22 = self->_experimentInfos;
  uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v38;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteSubmessage();
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v24);
  }

  if ([(_CPClientSession *)self searchOptOut]) {
    PBDataWriterWriteBOOLField();
  }
  v27 = [(_CPClientSession *)self jsonFeedback];

  if (v27) {
    PBDataWriterWriteDataField();
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v28 = self->_feedbacks;
  uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v34;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v34 != v31) {
          objc_enumerationMutation(v28);
        }
        PBDataWriterWriteSubmessage();
        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = [(NSArray *)v28 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v30);
  }
}

- (NSString)userGuidString
{
  return self->_userGuidString;
}

- (NSString)agent
{
  return self->_agent;
}

- (BOOL)duEnabled
{
  return self->_duEnabled;
}

- (_CPUsageSinceLookback)usageSinceLookback
{
  return self->_usageSinceLookback;
}

- (double)sessionStart
{
  return self->_sessionStart;
}

- (BOOL)searchOptOut
{
  return self->_searchOptOut;
}

- (BOOL)removeTimestamps
{
  return self->_removeTimestamps;
}

- (int)privateRelayStatus
{
  return self->_privateRelayStatus;
}

- (int)previousSessionEndReason
{
  return self->_previousSessionEndReason;
}

- (NSString)parsecDeveloperID
{
  return self->_parsecDeveloperID;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSData)jsonFeedback
{
  return self->_jsonFeedback;
}

- (BOOL)isInternalCarry
{
  return self->_isInternalCarry;
}

- (unsigned)devicePersistentD20
{
  return self->_devicePersistentD20;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (_CPUsageEnvelope)cohortsFeedback
{
  return self->_cohortsFeedback;
}

- (void)setUserGuidString:(id)a3
{
}

- (void)setLocale:(id)a3
{
}

- (void)setCountryCode:(id)a3
{
}

- (void)setAgent:(id)a3
{
}

- (void)setSessionStart:(double)a3
{
  self->_sessionStart = a3;
}

- (void)setSearchOptOut:(BOOL)a3
{
  self->_searchOptOut = a3;
}

- (void)setPrivateRelayStatus:(int)a3
{
  self->_privateRelayStatus = a3;
}

- (void)setIsInternalCarry:(BOOL)a3
{
  self->_isInternalCarry = a3;
}

- (void)setDuEnabled:(BOOL)a3
{
  self->_duEnabled = a3;
}

- (void)setDevicePersistentD20:(unsigned int)a3
{
  self->_devicePersistentD20 = a3;
}

- (void)setResourceVersions:(id)a3
{
  self->_resourceVersions = (NSDictionary *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (void)setResourceVersions:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_resourceVersions)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    resourceVersions = self->_resourceVersions;
    self->_resourceVersions = v8;
  }
  id v10 = v7;
  id v11 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(NSDictionary *)self->_resourceVersions setObject:v11 forKey:v10];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbacks, 0);
  objc_storeStrong((id *)&self->_jsonFeedback, 0);
  objc_storeStrong((id *)&self->_experimentInfos, 0);
  objc_storeStrong((id *)&self->_cohortsFeedback, 0);
  objc_storeStrong((id *)&self->_usageSinceLookback, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_parsecDeveloperID, 0);
  objc_storeStrong((id *)&self->_resourceVersions, 0);
  objc_storeStrong((id *)&self->_userGuidString, 0);

  objc_storeStrong((id *)&self->_agent, 0);
}

- (void)setFeedbacks:(id)a3
{
}

- (NSArray)feedbacks
{
  return self->_feedbacks;
}

- (void)setJsonFeedback:(id)a3
{
}

- (void)setExperimentInfos:(id)a3
{
}

- (NSArray)experimentInfos
{
  return self->_experimentInfos;
}

- (void)setCohortsFeedback:(id)a3
{
}

- (void)setUsageSinceLookback:(id)a3
{
}

- (void)setParsecDeveloperID:(id)a3
{
}

- (void)setRemoveTimestamps:(BOOL)a3
{
  self->_removeTimestamps = a3;
}

- (void)setPreviousSessionEndReason:(int)a3
{
  self->_previousSessionEndReason = a3;
}

- (NSDictionary)resourceVersions
{
  return self->_resourceVersions;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_agent hash];
  NSUInteger v4 = [(NSString *)self->_userGuidString hash] ^ v3;
  uint64_t v5 = [(NSDictionary *)self->_resourceVersions hash];
  double sessionStart = self->_sessionStart;
  NSUInteger v26 = v4 ^ v5;
  double v7 = -sessionStart;
  if (sessionStart >= 0.0) {
    double v7 = self->_sessionStart;
  }
  long double v8 = round(v7);
  unint64_t v25 = (unint64_t)(fmod(v8, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v7 - v8, 0x40uLL);
  uint64_t v23 = 2654435761 * self->_removeTimestamps;
  uint64_t v24 = 2654435761 * self->_previousSessionEndReason;
  NSUInteger v9 = [(NSString *)self->_parsecDeveloperID hash];
  uint64_t v21 = 2654435761 * self->_duEnabled;
  NSUInteger v22 = v9;
  NSUInteger v20 = [(NSString *)self->_countryCode hash];
  NSUInteger v10 = [(NSString *)self->_locale hash];
  unint64_t v11 = [(_CPUsageSinceLookback *)self->_usageSinceLookback hash];
  unint64_t v12 = [(_CPUsageEnvelope *)self->_cohortsFeedback hash];
  uint64_t v13 = 2654435761 * self->_devicePersistentD20;
  uint64_t v14 = 2654435761 * self->_privateRelayStatus;
  uint64_t v15 = 2654435761 * self->_isInternalCarry;
  uint64_t v16 = [(NSArray *)self->_experimentInfos hash];
  uint64_t v17 = 2654435761 * self->_searchOptOut;
  uint64_t v18 = [(NSData *)self->_jsonFeedback hash];
  return v26 ^ v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ [(NSArray *)self->_feedbacks hash] ^ v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_65;
  }
  uint64_t v5 = [(_CPClientSession *)self agent];
  id v6 = [v4 agent];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v7 = [(_CPClientSession *)self agent];
  if (v7)
  {
    long double v8 = (void *)v7;
    NSUInteger v9 = [(_CPClientSession *)self agent];
    NSUInteger v10 = [v4 agent];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_CPClientSession *)self userGuidString];
  id v6 = [v4 userGuidString];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v12 = [(_CPClientSession *)self userGuidString];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_CPClientSession *)self userGuidString];
    uint64_t v15 = [v4 userGuidString];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_CPClientSession *)self resourceVersions];
  id v6 = [v4 resourceVersions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v17 = [(_CPClientSession *)self resourceVersions];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    v19 = [(_CPClientSession *)self resourceVersions];
    NSUInteger v20 = [v4 resourceVersions];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  double sessionStart = self->_sessionStart;
  [v4 sessionStart];
  if (sessionStart != v23) {
    goto LABEL_65;
  }
  int previousSessionEndReason = self->_previousSessionEndReason;
  if (previousSessionEndReason != [v4 previousSessionEndReason]) {
    goto LABEL_65;
  }
  int removeTimestamps = self->_removeTimestamps;
  if (removeTimestamps != [v4 removeTimestamps]) {
    goto LABEL_65;
  }
  uint64_t v5 = [(_CPClientSession *)self parsecDeveloperID];
  id v6 = [v4 parsecDeveloperID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v26 = [(_CPClientSession *)self parsecDeveloperID];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(_CPClientSession *)self parsecDeveloperID];
    uint64_t v29 = [v4 parsecDeveloperID];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  int duEnabled = self->_duEnabled;
  if (duEnabled != [v4 duEnabled]) {
    goto LABEL_65;
  }
  uint64_t v5 = [(_CPClientSession *)self countryCode];
  id v6 = [v4 countryCode];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v32 = [(_CPClientSession *)self countryCode];
  if (v32)
  {
    long long v33 = (void *)v32;
    long long v34 = [(_CPClientSession *)self countryCode];
    long long v35 = [v4 countryCode];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_CPClientSession *)self locale];
  id v6 = [v4 locale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v37 = [(_CPClientSession *)self locale];
  if (v37)
  {
    long long v38 = (void *)v37;
    long long v39 = [(_CPClientSession *)self locale];
    long long v40 = [v4 locale];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_CPClientSession *)self usageSinceLookback];
  id v6 = [v4 usageSinceLookback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v42 = [(_CPClientSession *)self usageSinceLookback];
  if (v42)
  {
    long long v43 = (void *)v42;
    long long v44 = [(_CPClientSession *)self usageSinceLookback];
    long long v45 = [v4 usageSinceLookback];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_CPClientSession *)self cohortsFeedback];
  id v6 = [v4 cohortsFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v47 = [(_CPClientSession *)self cohortsFeedback];
  if (v47)
  {
    v48 = (void *)v47;
    uint64_t v49 = [(_CPClientSession *)self cohortsFeedback];
    v50 = [v4 cohortsFeedback];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  unsigned int devicePersistentD20 = self->_devicePersistentD20;
  if (devicePersistentD20 != [v4 devicePersistentD20]) {
    goto LABEL_65;
  }
  int privateRelayStatus = self->_privateRelayStatus;
  if (privateRelayStatus != [v4 privateRelayStatus]) {
    goto LABEL_65;
  }
  int isInternalCarry = self->_isInternalCarry;
  if (isInternalCarry != [v4 isInternalCarry]) {
    goto LABEL_65;
  }
  uint64_t v5 = [(_CPClientSession *)self experimentInfos];
  id v6 = [v4 experimentInfos];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v55 = [(_CPClientSession *)self experimentInfos];
  if (v55)
  {
    v56 = (void *)v55;
    v57 = [(_CPClientSession *)self experimentInfos];
    v58 = [v4 experimentInfos];
    int v59 = [v57 isEqual:v58];

    if (!v59) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  int searchOptOut = self->_searchOptOut;
  if (searchOptOut != [v4 searchOptOut]) {
    goto LABEL_65;
  }
  uint64_t v5 = [(_CPClientSession *)self jsonFeedback];
  id v6 = [v4 jsonFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_64;
  }
  uint64_t v61 = [(_CPClientSession *)self jsonFeedback];
  if (v61)
  {
    v62 = (void *)v61;
    v63 = [(_CPClientSession *)self jsonFeedback];
    v64 = [v4 jsonFeedback];
    int v65 = [v63 isEqual:v64];

    if (!v65) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_CPClientSession *)self feedbacks];
  id v6 = [v4 feedbacks];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_64:

    goto LABEL_65;
  }
  uint64_t v66 = [(_CPClientSession *)self feedbacks];
  if (!v66)
  {

LABEL_68:
    BOOL v71 = 1;
    goto LABEL_66;
  }
  v67 = (void *)v66;
  v68 = [(_CPClientSession *)self feedbacks];
  v69 = [v4 feedbacks];
  char v70 = [v68 isEqual:v69];

  if (v70) {
    goto LABEL_68;
  }
LABEL_65:
  BOOL v71 = 0;
LABEL_66:

  return v71;
}

- (BOOL)readFrom:(id)a3
{
  return _CPClientSessionReadFrom(self, (uint64_t)a3);
}

- (id)feedbackAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_feedbacks objectAtIndexedSubscript:a3];
}

- (unint64_t)feedbackCount
{
  return [(NSArray *)self->_feedbacks count];
}

- (void)addFeedback:(id)a3
{
  id v4 = a3;
  feedbacks = self->_feedbacks;
  id v8 = v4;
  if (!feedbacks)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_feedbacks;
    self->_feedbacks = v6;

    id v4 = v8;
    feedbacks = self->_feedbacks;
  }
  [(NSArray *)feedbacks addObject:v4];
}

- (void)clearFeedback
{
}

- (void)setFeedback:(id)a3
{
  self->_feedbacks = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (id)experimentInfoAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_experimentInfos objectAtIndexedSubscript:a3];
}

- (unint64_t)experimentInfoCount
{
  return [(NSArray *)self->_experimentInfos count];
}

- (void)addExperimentInfo:(id)a3
{
  id v4 = a3;
  experimentInfos = self->_experimentInfos;
  id v8 = v4;
  if (!experimentInfos)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_experimentInfos;
    self->_experimentInfos = v6;

    id v4 = v8;
    experimentInfos = self->_experimentInfos;
  }
  [(NSArray *)experimentInfos addObject:v4];
}

- (void)clearExperimentInfo
{
}

- (void)setExperimentInfo:(id)a3
{
  self->_experimentInfos = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)getResourceVersions:(id *)a3 forKey:(id)a4
{
  uint64_t v5 = [(NSDictionary *)self->_resourceVersions objectForKeyedSubscript:a4];
  id v6 = v5;
  if (a3 && v5) {
    *a3 = v5;
  }

  return v6 != 0;
}

@end