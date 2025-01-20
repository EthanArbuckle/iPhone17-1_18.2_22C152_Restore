@interface DAStatusReport
- (BOOL)syncingAllowed;
- (DAStatusReport)init;
- (DAStatusReport)initWithDictionaryRepresentation:(id)a3;
- (NSDate)creationDate;
- (NSDate)lastFailureDate;
- (NSDate)lastSuccessDate;
- (NSNumber)averageHBI;
- (NSNumber)downloadedElements;
- (NSNumber)failedNetworkRequests;
- (NSNumber)failedProtocolRequests;
- (NSNumber)falseMoreAvailableCount;
- (NSNumber)isDelegate;
- (NSNumber)successfulRequests;
- (NSNumber)timeInNetworking;
- (NSNumber)timeSpan;
- (NSNumber)uploadedElements;
- (NSString)accountType;
- (NSString)displayName;
- (NSString)persistentUUID;
- (NSString)protocolVersion;
- (id)description;
- (id)dictionaryRepresentation;
- (int)numHBIDataPoints;
- (void)mergeStatusReport:(id)a3;
- (void)noteFailedNetworkRequest;
- (void)noteFailedProtocolRequest;
- (void)noteFalseMoreAvailableResponse;
- (void)noteNewHBIDataPoint:(int)a3;
- (void)noteSuccessfulRequestWithNumDownloadedElements:(int)a3;
- (void)noteSuccessfulRequestWithNumDownloadedElements:(int)a3 numUploadedElements:(int)a4;
- (void)noteTimeSpentInNetworking:(double)a3;
- (void)setAccountType:(id)a3;
- (void)setAverageHBI:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDownloadedElements:(id)a3;
- (void)setFailedNetworkRequests:(id)a3;
- (void)setFailedProtocolRequests:(id)a3;
- (void)setFalseMoreAvailableCount:(id)a3;
- (void)setIsDelegate:(id)a3;
- (void)setLastFailureDate:(id)a3;
- (void)setLastSuccessDate:(id)a3;
- (void)setNumHBIDataPoints:(int)a3;
- (void)setPersistentUUID:(id)a3;
- (void)setProtocolVersion:(id)a3;
- (void)setSuccessfulRequests:(id)a3;
- (void)setSyncingAllowed:(BOOL)a3;
- (void)setTimeInNetworking:(id)a3;
- (void)setTimeSpan:(id)a3;
- (void)setUploadedElements:(id)a3;
@end

@implementation DAStatusReport

- (DAStatusReport)init
{
  v5.receiver = self;
  v5.super_class = (Class)DAStatusReport;
  v2 = [(DAStatusReport *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    [(DAStatusReport *)v2 setCreationDate:v3];
  }
  return v2;
}

- (DAStatusReport)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DAStatusReport;
  objc_super v5 = [(DAStatusReport *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:kDAStatusReportPersistentUUID];
    [(DAStatusReport *)v5 setPersistentUUID:v6];

    v7 = [v4 objectForKeyedSubscript:kDAStatusReportDisplayName];
    [(DAStatusReport *)v5 setDisplayName:v7];

    v8 = [v4 objectForKeyedSubscript:kDAStatusReportAccountType];
    [(DAStatusReport *)v5 setAccountType:v8];

    v9 = [v4 objectForKeyedSubscript:kDAStatusReportTimeSpan];
    [(DAStatusReport *)v5 setTimeSpan:v9];

    v10 = [v4 objectForKeyedSubscript:kDAStatusReportTimeInNetworking];
    [(DAStatusReport *)v5 setTimeInNetworking:v10];

    v11 = [v4 objectForKeyedSubscript:kDAStatusReportAverageHBI];
    [(DAStatusReport *)v5 setAverageHBI:v11];

    v12 = [v4 objectForKeyedSubscript:kDAStatusReportSuccessfulRequests];
    [(DAStatusReport *)v5 setSuccessfulRequests:v12];

    v13 = [v4 objectForKeyedSubscript:kDAStatusReportFailedNetworkRequests];
    [(DAStatusReport *)v5 setFailedNetworkRequests:v13];

    v14 = [v4 objectForKeyedSubscript:kDAStatusReportFailedProtocolRequests];
    [(DAStatusReport *)v5 setFailedProtocolRequests:v14];

    v15 = [v4 objectForKeyedSubscript:kDAStatusReportDownloadedElements];
    [(DAStatusReport *)v5 setDownloadedElements:v15];

    v16 = [v4 objectForKeyedSubscript:kDAStatusReportUploadedElements];
    [(DAStatusReport *)v5 setUploadedElements:v16];

    v17 = [v4 objectForKeyedSubscript:kDAStatusReportFalseMoreAvailableCount];
    [(DAStatusReport *)v5 setFalseMoreAvailableCount:v17];

    v18 = [v4 objectForKeyedSubscript:kDAStatusReportProtocolVersion];
    [(DAStatusReport *)v5 setProtocolVersion:v18];

    v19 = [v4 objectForKeyedSubscript:kDAStatusReportSyncingAllowed];
    v20 = v19;
    if (v19) {
      uint64_t v21 = [v19 BOOLValue];
    }
    else {
      uint64_t v21 = 1;
    }
    [(DAStatusReport *)v5 setSyncingAllowed:v21];
    v22 = [v4 objectForKeyedSubscript:kDAStatusReportLastSuccessDate];
    [(DAStatusReport *)v5 setLastSuccessDate:v22];

    v23 = [v4 objectForKeyedSubscript:kDAStatusReportLastFailureDate];
    [(DAStatusReport *)v5 setLastFailureDate:v23];

    v24 = [v4 objectForKeyedSubscript:kDAStatusReportIsDelegate];
    [(DAStatusReport *)v5 setIsDelegate:v24];
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(DAStatusReport *)self persistentUUID];

  if (v4)
  {
    objc_super v5 = [(DAStatusReport *)self persistentUUID];
    [v3 setObject:v5 forKeyedSubscript:kDAStatusReportPersistentUUID];
  }
  v6 = [(DAStatusReport *)self displayName];

  if (v6)
  {
    v7 = [(DAStatusReport *)self displayName];
    [v3 setObject:v7 forKeyedSubscript:kDAStatusReportDisplayName];
  }
  v8 = [(DAStatusReport *)self accountType];

  if (v8)
  {
    v9 = [(DAStatusReport *)self accountType];
    [v3 setObject:v9 forKeyedSubscript:kDAStatusReportAccountType];
  }
  v10 = [(DAStatusReport *)self timeSpan];

  if (v10)
  {
    v11 = [(DAStatusReport *)self timeSpan];
    [v3 setObject:v11 forKeyedSubscript:kDAStatusReportTimeSpan];
  }
  v12 = [(DAStatusReport *)self timeInNetworking];

  if (v12)
  {
    v13 = [(DAStatusReport *)self timeInNetworking];
    [v3 setObject:v13 forKeyedSubscript:kDAStatusReportTimeInNetworking];
  }
  v14 = [(DAStatusReport *)self averageHBI];

  if (v14)
  {
    v15 = [(DAStatusReport *)self averageHBI];
    [v3 setObject:v15 forKeyedSubscript:kDAStatusReportAverageHBI];
  }
  v16 = [(DAStatusReport *)self successfulRequests];

  if (v16)
  {
    v17 = [(DAStatusReport *)self successfulRequests];
    [v3 setObject:v17 forKeyedSubscript:kDAStatusReportSuccessfulRequests];
  }
  v18 = [(DAStatusReport *)self failedNetworkRequests];

  if (v18)
  {
    v19 = [(DAStatusReport *)self failedNetworkRequests];
    [v3 setObject:v19 forKeyedSubscript:kDAStatusReportFailedNetworkRequests];
  }
  v20 = [(DAStatusReport *)self failedProtocolRequests];

  if (v20)
  {
    uint64_t v21 = [(DAStatusReport *)self failedProtocolRequests];
    [v3 setObject:v21 forKeyedSubscript:kDAStatusReportFailedProtocolRequests];
  }
  v22 = [(DAStatusReport *)self downloadedElements];

  if (v22)
  {
    v23 = [(DAStatusReport *)self downloadedElements];
    [v3 setObject:v23 forKeyedSubscript:kDAStatusReportDownloadedElements];
  }
  v24 = [(DAStatusReport *)self uploadedElements];

  if (v24)
  {
    v25 = [(DAStatusReport *)self uploadedElements];
    [v3 setObject:v25 forKeyedSubscript:kDAStatusReportUploadedElements];
  }
  objc_super v26 = [(DAStatusReport *)self protocolVersion];

  if (v26)
  {
    v27 = [(DAStatusReport *)self protocolVersion];
    [v3 setObject:v27 forKeyedSubscript:kDAStatusReportProtocolVersion];
  }
  v28 = [(DAStatusReport *)self falseMoreAvailableCount];

  if (v28)
  {
    v29 = [(DAStatusReport *)self falseMoreAvailableCount];
    [v3 setObject:v29 forKeyedSubscript:kDAStatusReportFalseMoreAvailableCount];
  }
  v30 = objc_msgSend(NSNumber, "numberWithBool:", -[DAStatusReport syncingAllowed](self, "syncingAllowed"));
  [v3 setObject:v30 forKeyedSubscript:kDAStatusReportSyncingAllowed];

  v31 = [(DAStatusReport *)self lastSuccessDate];

  if (v31)
  {
    v32 = [(DAStatusReport *)self lastSuccessDate];
    [v3 setObject:v32 forKeyedSubscript:kDAStatusReportLastSuccessDate];
  }
  v33 = [(DAStatusReport *)self lastFailureDate];

  if (v33)
  {
    v34 = [(DAStatusReport *)self lastFailureDate];
    [v3 setObject:v34 forKeyedSubscript:kDAStatusReportLastFailureDate];
  }
  v35 = [(DAStatusReport *)self isDelegate];

  if (v35)
  {
    v36 = [(DAStatusReport *)self isDelegate];
    [v3 setObject:v36 forKeyedSubscript:kDAStatusReportIsDelegate];
  }

  return v3;
}

- (void)mergeStatusReport:(id)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 persistentUUID];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [v4 persistentUUID];
    v8 = [(DAStatusReport *)self persistentUUID];
    char v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      v10 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v106 = 138412546;
        v107 = self;
        __int16 v108 = 2112;
        id v109 = v4;
        _os_log_impl(&dword_1C8854000, v10, OS_LOG_TYPE_ERROR, "Why are we combining status reports for different accounts? %@ vs. %@", (uint8_t *)&v106, 0x16u);
      }
    }
  }
  uint64_t v11 = [v4 displayName];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [(DAStatusReport *)self displayName];

    if (!v13)
    {
      v14 = [v4 displayName];
      [(DAStatusReport *)self setDisplayName:v14];
    }
  }
  uint64_t v15 = [v4 accountType];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [v4 accountType];
    v18 = [(DAStatusReport *)self accountType];
    char v19 = [v17 isEqualToString:v18];

    if ((v19 & 1) == 0)
    {
      v20 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v106 = 138412546;
        v107 = self;
        __int16 v108 = 2112;
        id v109 = v4;
        _os_log_impl(&dword_1C8854000, v20, OS_LOG_TYPE_ERROR, "Why are we combining status reports for different accounts? %@ vs. %@", (uint8_t *)&v106, 0x16u);
      }
    }
  }
  uint64_t v21 = [v4 timeSpan];
  int v22 = [v21 intValue];
  v23 = [(DAStatusReport *)self timeSpan];
  int v24 = [v23 intValue];

  if (v22 > v24)
  {
    v25 = [v4 timeSpan];
    [(DAStatusReport *)self setTimeSpan:v25];
  }
  objc_super v26 = [(DAStatusReport *)self timeInNetworking];
  if (v26)
  {

LABEL_19:
    v28 = NSNumber;
    v29 = [(DAStatusReport *)self timeInNetworking];
    [v29 doubleValue];
    double v31 = v30;
    v32 = [v4 timeInNetworking];
    [v32 doubleValue];
    v34 = [v28 numberWithDouble:v31 + v33];
    [(DAStatusReport *)self setTimeInNetworking:v34];

    goto LABEL_20;
  }
  v27 = [v4 timeInNetworking];

  if (v27) {
    goto LABEL_19;
  }
LABEL_20:
  uint64_t v35 = [v4 averageHBI];
  if (v35)
  {
    v36 = (void *)v35;
    v37 = [(DAStatusReport *)self averageHBI];

    if (!v37)
    {
      v38 = [v4 averageHBI];
      [(DAStatusReport *)self setAverageHBI:v38];
    }
  }
  v39 = [(DAStatusReport *)self successfulRequests];
  if (v39)
  {
  }
  else
  {
    v40 = [v4 successfulRequests];

    if (!v40) {
      goto LABEL_27;
    }
  }
  v41 = NSNumber;
  v42 = [(DAStatusReport *)self successfulRequests];
  int v43 = [v42 intValue];
  v44 = [v4 successfulRequests];
  v45 = objc_msgSend(v41, "numberWithInt:", objc_msgSend(v44, "intValue") + v43);
  [(DAStatusReport *)self setSuccessfulRequests:v45];

LABEL_27:
  v46 = [(DAStatusReport *)self failedNetworkRequests];
  if (v46)
  {
  }
  else
  {
    v47 = [v4 failedNetworkRequests];

    if (!v47) {
      goto LABEL_31;
    }
  }
  v48 = NSNumber;
  v49 = [(DAStatusReport *)self failedNetworkRequests];
  int v50 = [v49 intValue];
  v51 = [v4 failedNetworkRequests];
  v52 = objc_msgSend(v48, "numberWithInt:", objc_msgSend(v51, "intValue") + v50);
  [(DAStatusReport *)self setFailedNetworkRequests:v52];

LABEL_31:
  v53 = [(DAStatusReport *)self failedProtocolRequests];
  if (v53)
  {
  }
  else
  {
    v54 = [v4 failedProtocolRequests];

    if (!v54) {
      goto LABEL_35;
    }
  }
  v55 = NSNumber;
  v56 = [(DAStatusReport *)self failedProtocolRequests];
  int v57 = [v56 intValue];
  v58 = [v4 failedProtocolRequests];
  v59 = objc_msgSend(v55, "numberWithInt:", objc_msgSend(v58, "intValue") + v57);
  [(DAStatusReport *)self setFailedProtocolRequests:v59];

LABEL_35:
  v60 = [(DAStatusReport *)self downloadedElements];
  if (v60)
  {
  }
  else
  {
    v61 = [v4 downloadedElements];

    if (!v61) {
      goto LABEL_39;
    }
  }
  v62 = NSNumber;
  v63 = [(DAStatusReport *)self downloadedElements];
  int v64 = [v63 intValue];
  v65 = [v4 downloadedElements];
  v66 = objc_msgSend(v62, "numberWithInt:", objc_msgSend(v65, "intValue") + v64);
  [(DAStatusReport *)self setDownloadedElements:v66];

LABEL_39:
  v67 = [(DAStatusReport *)self uploadedElements];
  if (v67)
  {
  }
  else
  {
    v68 = [v4 uploadedElements];

    if (!v68) {
      goto LABEL_43;
    }
  }
  v69 = NSNumber;
  v70 = [(DAStatusReport *)self uploadedElements];
  int v71 = [v70 intValue];
  v72 = [v4 uploadedElements];
  v73 = objc_msgSend(v69, "numberWithInt:", objc_msgSend(v72, "intValue") + v71);
  [(DAStatusReport *)self setUploadedElements:v73];

LABEL_43:
  v74 = [(DAStatusReport *)self falseMoreAvailableCount];
  if (v74)
  {

LABEL_46:
    v76 = NSNumber;
    v77 = [(DAStatusReport *)self falseMoreAvailableCount];
    int v78 = [v77 intValue];
    v79 = [v4 falseMoreAvailableCount];
    v80 = objc_msgSend(v76, "numberWithInt:", objc_msgSend(v79, "intValue") + v78);
    [(DAStatusReport *)self setFalseMoreAvailableCount:v80];

    goto LABEL_47;
  }
  v75 = [v4 falseMoreAvailableCount];

  if (v75) {
    goto LABEL_46;
  }
LABEL_47:
  uint64_t v81 = [v4 protocolVersion];
  if (v81)
  {
    v82 = (void *)v81;
    v83 = [v4 protocolVersion];
    v84 = [(DAStatusReport *)self protocolVersion];
    char v85 = [v83 isEqualToString:v84];

    if ((v85 & 1) == 0)
    {
      v86 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
      {
        v87 = [v4 protocolVersion];
        int v106 = 138412290;
        v107 = v87;
        _os_log_impl(&dword_1C8854000, v86, OS_LOG_TYPE_INFO, "Protocol version is updated to %@", (uint8_t *)&v106, 0xCu);
      }
      v88 = [v4 protocolVersion];
      [(DAStatusReport *)self setProtocolVersion:v88];
    }
  }
  if ([(DAStatusReport *)self syncingAllowed]) {
    uint64_t v89 = [v4 syncingAllowed];
  }
  else {
    uint64_t v89 = 0;
  }
  [(DAStatusReport *)self setSyncingAllowed:v89];
  uint64_t v90 = [v4 lastSuccessDate];
  if (v90)
  {
    v91 = (void *)v90;
    v92 = [v4 lastSuccessDate];
    v93 = [(DAStatusReport *)self lastSuccessDate];
    char v94 = [v92 isEqualToDate:v93];

    if ((v94 & 1) == 0)
    {
      v95 = [v4 lastSuccessDate];
      [(DAStatusReport *)self setLastSuccessDate:v95];
    }
  }
  uint64_t v96 = [v4 lastFailureDate];
  if (v96)
  {
    v97 = (void *)v96;
    v98 = [v4 lastFailureDate];
    v99 = [(DAStatusReport *)self lastFailureDate];
    char v100 = [v98 isEqualToDate:v99];

    if ((v100 & 1) == 0)
    {
      v101 = [v4 lastFailureDate];
      [(DAStatusReport *)self setLastFailureDate:v101];
    }
  }
  uint64_t v102 = [v4 isDelegate];
  if (v102)
  {
    v103 = (void *)v102;
    v104 = [(DAStatusReport *)self isDelegate];

    if (!v104)
    {
      v105 = [v4 isDelegate];
      [(DAStatusReport *)self setIsDelegate:v105];
    }
  }
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [(DAStatusReport *)self dictionaryRepresentation];
  v7 = [v3 stringWithFormat:@"%@ %p: %@", v5, self, v6];

  return v7;
}

- (NSNumber)timeSpan
{
  timeSpan = self->_timeSpan;
  if (!timeSpan)
  {
    id v4 = NSNumber;
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    [v5 timeIntervalSinceDate:self->_creationDate];
    v6 = objc_msgSend(v4, "numberWithDouble:");
    [(DAStatusReport *)self setTimeSpan:v6];

    timeSpan = self->_timeSpan;
  }

  return timeSpan;
}

- (void)noteSuccessfulRequestWithNumDownloadedElements:(int)a3 numUploadedElements:(int)a4
{
  v7 = [MEMORY[0x1E4F1C9C8] date];
  [(DAStatusReport *)self setLastSuccessDate:v7];

  v8 = NSNumber;
  char v9 = [(DAStatusReport *)self successfulRequests];
  v10 = objc_msgSend(v8, "numberWithInt:", objc_msgSend(v9, "intValue") + 1);
  [(DAStatusReport *)self setSuccessfulRequests:v10];

  if (a3)
  {
    uint64_t v11 = NSNumber;
    v12 = [(DAStatusReport *)self downloadedElements];
    v13 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "intValue") + a3);
    [(DAStatusReport *)self setDownloadedElements:v13];
  }
  if (a4)
  {
    v14 = NSNumber;
    id v16 = [(DAStatusReport *)self uploadedElements];
    uint64_t v15 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v16, "intValue") + a4);
    [(DAStatusReport *)self setUploadedElements:v15];
  }
}

- (void)noteSuccessfulRequestWithNumDownloadedElements:(int)a3
{
}

- (void)noteFailedNetworkRequest
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [(DAStatusReport *)self setLastFailureDate:v3];

  id v4 = NSNumber;
  id v6 = [(DAStatusReport *)self failedNetworkRequests];
  uint64_t v5 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  [(DAStatusReport *)self setFailedNetworkRequests:v5];
}

- (void)noteFailedProtocolRequest
{
  v3 = NSNumber;
  id v5 = [(DAStatusReport *)self failedProtocolRequests];
  id v4 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  [(DAStatusReport *)self setFailedProtocolRequests:v4];
}

- (void)noteNewHBIDataPoint:(int)a3
{
  id v5 = [(DAStatusReport *)self averageHBI];
  [v5 doubleValue];
  double v7 = v6;

  id v8 = [NSNumber numberWithDouble:((double)a3 + v7 * (double)self->_numHBIDataPoints) / (double)(self->_numHBIDataPoints + 1)];
  [(DAStatusReport *)self setAverageHBI:v8];
}

- (void)noteTimeSpentInNetworking:(double)a3
{
  id v5 = NSNumber;
  id v8 = [(DAStatusReport *)self timeInNetworking];
  [v8 doubleValue];
  double v7 = [v5 numberWithDouble:v6 + a3];
  [(DAStatusReport *)self setTimeInNetworking:v7];
}

- (void)noteFalseMoreAvailableResponse
{
  v3 = NSNumber;
  id v5 = [(DAStatusReport *)self falseMoreAvailableCount];
  id v4 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  [(DAStatusReport *)self setFalseMoreAvailableCount:v4];
}

- (NSString)persistentUUID
{
  return self->_persistentUUID;
}

- (void)setPersistentUUID:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(id)a3
{
}

- (void)setTimeSpan:(id)a3
{
}

- (NSNumber)timeInNetworking
{
  return self->_timeInNetworking;
}

- (void)setTimeInNetworking:(id)a3
{
}

- (NSNumber)averageHBI
{
  return self->_averageHBI;
}

- (void)setAverageHBI:(id)a3
{
}

- (NSNumber)successfulRequests
{
  return self->_successfulRequests;
}

- (void)setSuccessfulRequests:(id)a3
{
}

- (NSNumber)failedNetworkRequests
{
  return self->_failedNetworkRequests;
}

- (void)setFailedNetworkRequests:(id)a3
{
}

- (NSNumber)failedProtocolRequests
{
  return self->_failedProtocolRequests;
}

- (void)setFailedProtocolRequests:(id)a3
{
}

- (NSNumber)downloadedElements
{
  return self->_downloadedElements;
}

- (void)setDownloadedElements:(id)a3
{
}

- (NSNumber)uploadedElements
{
  return self->_uploadedElements;
}

- (void)setUploadedElements:(id)a3
{
}

- (NSNumber)falseMoreAvailableCount
{
  return self->_falseMoreAvailableCount;
}

- (void)setFalseMoreAvailableCount:(id)a3
{
}

- (NSString)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(id)a3
{
}

- (BOOL)syncingAllowed
{
  return self->_syncingAllowed;
}

- (void)setSyncingAllowed:(BOOL)a3
{
  self->_syncingAllowed = a3;
}

- (NSDate)lastSuccessDate
{
  return self->_lastSuccessDate;
}

- (void)setLastSuccessDate:(id)a3
{
}

- (NSDate)lastFailureDate
{
  return self->_lastFailureDate;
}

- (void)setLastFailureDate:(id)a3
{
}

- (NSNumber)isDelegate
{
  return self->_isDelegate;
}

- (void)setIsDelegate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (int)numHBIDataPoints
{
  return self->_numHBIDataPoints;
}

- (void)setNumHBIDataPoints:(int)a3
{
  self->_numHBIDataPoints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_isDelegate, 0);
  objc_storeStrong((id *)&self->_lastFailureDate, 0);
  objc_storeStrong((id *)&self->_lastSuccessDate, 0);
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_falseMoreAvailableCount, 0);
  objc_storeStrong((id *)&self->_uploadedElements, 0);
  objc_storeStrong((id *)&self->_downloadedElements, 0);
  objc_storeStrong((id *)&self->_failedProtocolRequests, 0);
  objc_storeStrong((id *)&self->_failedNetworkRequests, 0);
  objc_storeStrong((id *)&self->_successfulRequests, 0);
  objc_storeStrong((id *)&self->_averageHBI, 0);
  objc_storeStrong((id *)&self->_timeInNetworking, 0);
  objc_storeStrong((id *)&self->_timeSpan, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_persistentUUID, 0);
}

@end