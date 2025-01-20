@interface AWDSymptomsDiagnosticRemoteUpload
+ (Class)taskErrorDomainType;
- (BOOL)hasApnsMsgIdentifier;
- (BOOL)hasCaseIdentifier;
- (BOOL)hasConsentStatus;
- (BOOL)hasExpectedFileCount;
- (BOOL)hasPreflightStatus;
- (BOOL)hasRadarIdentifier;
- (BOOL)hasRequestStatus;
- (BOOL)hasRequestedTimestamp;
- (BOOL)hasScheduledTimestamp;
- (BOOL)hasTimestamp;
- (BOOL)hasUrgency;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)taskErrorDomains;
- (NSString)caseIdentifier;
- (id)consentStatusAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)preflightStatusAsString:(int)a3;
- (id)primaryNetworkObservedOnCompletionsAsString:(int)a3;
- (id)requestStatusAsString:(int)a3;
- (id)taskErrorDomainAtIndex:(unint64_t)a3;
- (id)taskStatusAsString:(int)a3;
- (int)StringAsConsentStatus:(id)a3;
- (int)StringAsPreflightStatus:(id)a3;
- (int)StringAsPrimaryNetworkObservedOnCompletions:(id)a3;
- (int)StringAsRequestStatus:(id)a3;
- (int)StringAsTaskStatus:(id)a3;
- (int)consentStatus;
- (int)expectedFileCount;
- (int)preflightStatus;
- (int)primaryNetworkObservedOnCompletionAtIndex:(unint64_t)a3;
- (int)primaryNetworkObservedOnCompletions;
- (int)requestStatus;
- (int)taskHttpStatusCodeAtIndex:(unint64_t)a3;
- (int)taskHttpStatusCodes;
- (int)taskRetryCountAtIndex:(unint64_t)a3;
- (int)taskRetryCounts;
- (int)taskStatus;
- (int)taskStatusAtIndex:(unint64_t)a3;
- (int64_t)taskErrorCodeAtIndex:(unint64_t)a3;
- (int64_t)taskErrorCodes;
- (int64_t)taskFileSizeAtIndex:(unint64_t)a3;
- (int64_t)taskFileSizes;
- (unint64_t)apnsMsgIdentifier;
- (unint64_t)hash;
- (unint64_t)primaryNetworkObservedOnCompletionsCount;
- (unint64_t)requestedTimestamp;
- (unint64_t)scheduledTimestamp;
- (unint64_t)taskErrorCodesCount;
- (unint64_t)taskErrorDomainsCount;
- (unint64_t)taskFileSizesCount;
- (unint64_t)taskHttpStatusCodesCount;
- (unint64_t)taskRetryCountsCount;
- (unint64_t)taskStatusCount;
- (unint64_t)timestamp;
- (unsigned)radarIdentifier;
- (unsigned)urgency;
- (void)addPrimaryNetworkObservedOnCompletion:(int)a3;
- (void)addTaskErrorCode:(int64_t)a3;
- (void)addTaskErrorDomain:(id)a3;
- (void)addTaskFileSize:(int64_t)a3;
- (void)addTaskHttpStatusCode:(int)a3;
- (void)addTaskRetryCount:(int)a3;
- (void)addTaskStatus:(int)a3;
- (void)clearPrimaryNetworkObservedOnCompletions;
- (void)clearTaskErrorCodes;
- (void)clearTaskErrorDomains;
- (void)clearTaskFileSizes;
- (void)clearTaskHttpStatusCodes;
- (void)clearTaskRetryCounts;
- (void)clearTaskStatus;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setApnsMsgIdentifier:(unint64_t)a3;
- (void)setCaseIdentifier:(id)a3;
- (void)setConsentStatus:(int)a3;
- (void)setExpectedFileCount:(int)a3;
- (void)setHasApnsMsgIdentifier:(BOOL)a3;
- (void)setHasConsentStatus:(BOOL)a3;
- (void)setHasExpectedFileCount:(BOOL)a3;
- (void)setHasPreflightStatus:(BOOL)a3;
- (void)setHasRadarIdentifier:(BOOL)a3;
- (void)setHasRequestStatus:(BOOL)a3;
- (void)setHasRequestedTimestamp:(BOOL)a3;
- (void)setHasScheduledTimestamp:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUrgency:(BOOL)a3;
- (void)setPreflightStatus:(int)a3;
- (void)setPrimaryNetworkObservedOnCompletions:(int *)a3 count:(unint64_t)a4;
- (void)setRadarIdentifier:(unsigned int)a3;
- (void)setRequestStatus:(int)a3;
- (void)setRequestedTimestamp:(unint64_t)a3;
- (void)setScheduledTimestamp:(unint64_t)a3;
- (void)setTaskErrorCodes:(int64_t *)a3 count:(unint64_t)a4;
- (void)setTaskErrorDomains:(id)a3;
- (void)setTaskFileSizes:(int64_t *)a3 count:(unint64_t)a4;
- (void)setTaskHttpStatusCodes:(int *)a3 count:(unint64_t)a4;
- (void)setTaskRetryCounts:(int *)a3 count:(unint64_t)a4;
- (void)setTaskStatus:(int *)a3 count:(unint64_t)a4;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUrgency:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSymptomsDiagnosticRemoteUpload

- (void)dealloc
{
  PBRepeatedInt64Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt64Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDSymptomsDiagnosticRemoteUpload;
  [(AWDSymptomsDiagnosticRemoteUpload *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRequestedTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_requestedTimestamp = a3;
}

- (void)setHasRequestedTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRequestedTimestamp
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setScheduledTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_scheduledTimestamp = a3;
}

- (void)setHasScheduledTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasScheduledTimestamp
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasCaseIdentifier
{
  return self->_caseIdentifier != 0;
}

- (void)setRadarIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_radarIdentifier = a3;
}

- (void)setHasRadarIdentifier:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRadarIdentifier
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setApnsMsgIdentifier:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_apnsMsgIdentifier = a3;
}

- (void)setHasApnsMsgIdentifier:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasApnsMsgIdentifier
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setUrgency:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_urgency = a3;
}

- (void)setHasUrgency:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasUrgency
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)preflightStatus
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_preflightStatus;
  }
  else {
    return 1;
  }
}

- (void)setPreflightStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_preflightStatus = a3;
}

- (void)setHasPreflightStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPreflightStatus
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)preflightStatusAsString:(int)a3
{
  if ((a3 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_263FC5108[a3 - 1];
  }

  return v3;
}

- (int)StringAsPreflightStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CaseNotFound"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NoRecordedPayloads"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PayloadsAllUnavailable"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PayloadsPartiallyMissing"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PayloadsFullyAvailable"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (int)consentStatus
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_consentStatus;
  }
  else {
    return 1;
  }
}

- (void)setConsentStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_consentStatus = a3;
}

- (void)setHasConsentStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasConsentStatus
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)consentStatusAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_263FC5130[a3 - 1];
  }

  return v3;
}

- (int)StringAsConsentStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ConsentNotRequired"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ConsentRequired"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ConsentDenied"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ConsentGranted"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (int)requestStatus
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_requestStatus;
  }
  else {
    return 1;
  }
}

- (void)setRequestStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_requestStatus = a3;
}

- (void)setHasRequestStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRequestStatus
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)requestStatusAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_263FC5150[a3 - 1];
  }

  return v3;
}

- (int)StringAsRequestStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UploadPending"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UploadFailed"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"UploadCompleted"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)setExpectedFileCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_expectedFileCount = a3;
}

- (void)setHasExpectedFileCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasExpectedFileCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (unint64_t)taskFileSizesCount
{
  return self->_taskFileSizes.count;
}

- (int64_t)taskFileSizes
{
  return self->_taskFileSizes.list;
}

- (void)clearTaskFileSizes
{
}

- (void)addTaskFileSize:(int64_t)a3
{
}

- (int64_t)taskFileSizeAtIndex:(unint64_t)a3
{
  p_taskFileSizes = &self->_taskFileSizes;
  unint64_t count = self->_taskFileSizes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_taskFileSizes->list[a3];
}

- (void)setTaskFileSizes:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)taskStatusCount
{
  return self->_taskStatus.count;
}

- (int)taskStatus
{
  return self->_taskStatus.list;
}

- (void)clearTaskStatus
{
}

- (void)addTaskStatus:(int)a3
{
}

- (int)taskStatusAtIndex:(unint64_t)a3
{
  p_taskStatus = &self->_taskStatus;
  unint64_t count = self->_taskStatus.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_taskStatus->list[a3];
}

- (void)setTaskStatus:(int *)a3 count:(unint64_t)a4
{
}

- (id)taskStatusAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_263FC5168[a3 - 1];
  }

  return v3;
}

- (int)StringAsTaskStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UploadTaskPending"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UploadTaskCompleted"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"UploadTaskError"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (unint64_t)taskRetryCountsCount
{
  return self->_taskRetryCounts.count;
}

- (int)taskRetryCounts
{
  return self->_taskRetryCounts.list;
}

- (void)clearTaskRetryCounts
{
}

- (void)addTaskRetryCount:(int)a3
{
}

- (int)taskRetryCountAtIndex:(unint64_t)a3
{
  p_taskRetryCounts = &self->_taskRetryCounts;
  unint64_t count = self->_taskRetryCounts.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_taskRetryCounts->list[a3];
}

- (void)setTaskRetryCounts:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)taskHttpStatusCodesCount
{
  return self->_taskHttpStatusCodes.count;
}

- (int)taskHttpStatusCodes
{
  return self->_taskHttpStatusCodes.list;
}

- (void)clearTaskHttpStatusCodes
{
}

- (void)addTaskHttpStatusCode:(int)a3
{
}

- (int)taskHttpStatusCodeAtIndex:(unint64_t)a3
{
  p_taskHttpStatusCodes = &self->_taskHttpStatusCodes;
  unint64_t count = self->_taskHttpStatusCodes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_taskHttpStatusCodes->list[a3];
}

- (void)setTaskHttpStatusCodes:(int *)a3 count:(unint64_t)a4
{
}

- (void)clearTaskErrorDomains
{
}

- (void)addTaskErrorDomain:(id)a3
{
  id v4 = a3;
  taskErrorDomains = self->_taskErrorDomains;
  id v8 = v4;
  if (!taskErrorDomains)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_taskErrorDomains;
    self->_taskErrorDomains = v6;

    id v4 = v8;
    taskErrorDomains = self->_taskErrorDomains;
  }
  [(NSMutableArray *)taskErrorDomains addObject:v4];
}

- (unint64_t)taskErrorDomainsCount
{
  return [(NSMutableArray *)self->_taskErrorDomains count];
}

- (id)taskErrorDomainAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_taskErrorDomains objectAtIndex:a3];
}

+ (Class)taskErrorDomainType
{
  return (Class)objc_opt_class();
}

- (unint64_t)taskErrorCodesCount
{
  return self->_taskErrorCodes.count;
}

- (int64_t)taskErrorCodes
{
  return self->_taskErrorCodes.list;
}

- (void)clearTaskErrorCodes
{
}

- (void)addTaskErrorCode:(int64_t)a3
{
}

- (int64_t)taskErrorCodeAtIndex:(unint64_t)a3
{
  p_taskErrorCodes = &self->_taskErrorCodes;
  unint64_t count = self->_taskErrorCodes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_taskErrorCodes->list[a3];
}

- (void)setTaskErrorCodes:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)primaryNetworkObservedOnCompletionsCount
{
  return self->_primaryNetworkObservedOnCompletions.count;
}

- (int)primaryNetworkObservedOnCompletions
{
  return self->_primaryNetworkObservedOnCompletions.list;
}

- (void)clearPrimaryNetworkObservedOnCompletions
{
}

- (void)addPrimaryNetworkObservedOnCompletion:(int)a3
{
}

- (int)primaryNetworkObservedOnCompletionAtIndex:(unint64_t)a3
{
  p_primaryNetworkObservedOnCompletions = &self->_primaryNetworkObservedOnCompletions;
  unint64_t count = self->_primaryNetworkObservedOnCompletions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_primaryNetworkObservedOnCompletions->list[a3];
}

- (void)setPrimaryNetworkObservedOnCompletions:(int *)a3 count:(unint64_t)a4
{
}

- (id)primaryNetworkObservedOnCompletionsAsString:(int)a3
{
  if (a3 > 2)
  {
    if (a3 == 3)
    {
      id v4 = @"PrimaryNetworkWiredEthernet";
    }
    else
    {
      if (a3 != 128)
      {
LABEL_12:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      id v4 = @"PrimaryNetworkNone";
    }
  }
  else
  {
    if (a3 != 1)
    {
      if (a3 == 2)
      {
        id v4 = @"PrimaryNetworkCellular";
        return v4;
      }
      goto LABEL_12;
    }
    id v4 = @"PrimaryNetworkWiFi";
  }
  return v4;
}

- (int)StringAsPrimaryNetworkObservedOnCompletions:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PrimaryNetworkWiFi"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PrimaryNetworkCellular"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PrimaryNetworkWiredEthernet"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PrimaryNetworkNone"])
  {
    int v4 = 128;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDSymptomsDiagnosticRemoteUpload;
  int v4 = [(AWDSymptomsDiagnosticRemoteUpload *)&v8 description];
  v5 = [(AWDSymptomsDiagnosticRemoteUpload *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v25 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v25 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v26 = [NSNumber numberWithUnsignedLongLong:self->_requestedTimestamp];
  [v3 setObject:v26 forKey:@"requestedTimestamp"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithUnsignedLongLong:self->_scheduledTimestamp];
    [v3 setObject:v5 forKey:@"scheduledTimestamp"];
  }
LABEL_5:
  caseIdentifier = self->_caseIdentifier;
  if (caseIdentifier) {
    [v3 setObject:caseIdentifier forKey:@"caseIdentifier"];
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x80) != 0)
  {
    v27 = [NSNumber numberWithUnsignedInt:self->_radarIdentifier];
    [v3 setObject:v27 forKey:@"radarIdentifier"];

    __int16 v7 = (__int16)self->_has;
    if ((v7 & 1) == 0)
    {
LABEL_9:
      if ((v7 & 0x200) == 0) {
        goto LABEL_10;
      }
      goto LABEL_48;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_9;
  }
  v28 = [NSNumber numberWithUnsignedLongLong:self->_apnsMsgIdentifier];
  [v3 setObject:v28 forKey:@"apnsMsgIdentifier"];

  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x200) == 0)
  {
LABEL_10:
    if ((v7 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_49;
  }
LABEL_48:
  v29 = [NSNumber numberWithUnsignedInt:self->_urgency];
  [v3 setObject:v29 forKey:@"urgency"];

  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x40) == 0)
  {
LABEL_11:
    if ((v7 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_53;
  }
LABEL_49:
  unsigned int v30 = self->_preflightStatus - 1;
  if (v30 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_preflightStatus);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = off_263FC5108[v30];
  }
  [v3 setObject:v31 forKey:@"preflightStatus"];

  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x10) == 0)
  {
LABEL_12:
    if ((v7 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_57;
  }
LABEL_53:
  unsigned int v32 = self->_consentStatus - 1;
  if (v32 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_consentStatus);
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = off_263FC5130[v32];
  }
  [v3 setObject:v33 forKey:@"consentStatus"];

  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x100) == 0)
  {
LABEL_13:
    if ((v7 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_57:
  unsigned int v34 = self->_requestStatus - 1;
  if (v34 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_requestStatus);
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = off_263FC5150[v34];
  }
  [v3 setObject:v35 forKey:@"requestStatus"];

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_14:
    objc_super v8 = [NSNumber numberWithInt:self->_expectedFileCount];
    [v3 setObject:v8 forKey:@"expectedFileCount"];
  }
LABEL_15:
  v9 = PBRepeatedInt64NSArray();
  [v3 setObject:v9 forKey:@"taskFileSize"];

  p_taskStatus = &self->_taskStatus;
  if (self->_taskStatus.count)
  {
    v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:");
    if (self->_taskStatus.count)
    {
      unint64_t v12 = 0;
      do
      {
        unsigned int v13 = p_taskStatus->list[v12] - 1;
        if (v13 >= 3)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_taskStatus->list[v12]);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = off_263FC5168[v13];
        }
        [v11 addObject:v14];

        ++v12;
      }
      while (v12 < self->_taskStatus.count);
    }
    [v3 setObject:v11 forKey:@"taskStatus"];
  }
  v15 = PBRepeatedInt32NSArray();
  [v3 setObject:v15 forKey:@"taskRetryCount"];

  v16 = PBRepeatedInt32NSArray();
  [v3 setObject:v16 forKey:@"taskHttpStatusCode"];

  taskErrorDomains = self->_taskErrorDomains;
  if (taskErrorDomains) {
    [v3 setObject:taskErrorDomains forKey:@"taskErrorDomain"];
  }
  v18 = PBRepeatedInt64NSArray();
  [v3 setObject:v18 forKey:@"taskErrorCode"];

  p_primaryNetworkObservedOnCompletions = &self->_primaryNetworkObservedOnCompletions;
  if (self->_primaryNetworkObservedOnCompletions.count)
  {
    v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:");
    if (p_primaryNetworkObservedOnCompletions->count)
    {
      for (unint64_t i = 0; i < p_primaryNetworkObservedOnCompletions->count; ++i)
      {
        int v22 = p_primaryNetworkObservedOnCompletions->list[i];
        if (v22 > 2)
        {
          if (v22 == 3)
          {
            v23 = @"PrimaryNetworkWiredEthernet";
            goto LABEL_38;
          }
          if (v22 != 128) {
            goto LABEL_35;
          }
          v23 = @"PrimaryNetworkNone";
        }
        else
        {
          if (v22 == 1)
          {
            v23 = @"PrimaryNetworkWiFi";
            goto LABEL_38;
          }
          if (v22 != 2)
          {
LABEL_35:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_primaryNetworkObservedOnCompletions->list[i]);
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_38;
          }
          v23 = @"PrimaryNetworkCellular";
        }
LABEL_38:
        [v20 addObject:v23];
      }
    }
    [v3 setObject:v20 forKey:@"primaryNetworkObservedOnCompletion"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSymptomsDiagnosticRemoteUploadReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_caseIdentifier) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_9:
      if ((v6 & 0x200) == 0) {
        goto LABEL_10;
      }
      goto LABEL_46;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) == 0)
  {
LABEL_10:
    if ((v6 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_11:
    if ((v6 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt32Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_12:
    if ((v6 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_13:
    if ((v6 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_49:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
LABEL_14:
  }
    PBDataWriterWriteInt32Field();
LABEL_15:
  if (self->_taskFileSizes.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      ++v7;
    }
    while (v7 < self->_taskFileSizes.count);
  }
  if (self->_taskStatus.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v8;
    }
    while (v8 < self->_taskStatus.count);
  }
  if (self->_taskRetryCounts.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_taskRetryCounts.count);
  }
  if (self->_taskHttpStatusCodes.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v10;
    }
    while (v10 < self->_taskHttpStatusCodes.count);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = self->_taskErrorDomains;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  if (self->_taskErrorCodes.count)
  {
    unint64_t v16 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      ++v16;
    }
    while (v16 < self->_taskErrorCodes.count);
  }
  p_primaryNetworkObservedOnCompletions = &self->_primaryNetworkObservedOnCompletions;
  if (p_primaryNetworkObservedOnCompletions->count)
  {
    unint64_t v18 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v18;
    }
    while (v18 < p_primaryNetworkObservedOnCompletions->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v4[22] = self->_timestamp;
    *((_WORD *)v4 + 114) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[20] = self->_requestedTimestamp;
  *((_WORD *)v4 + 114) |= 2u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[21] = self->_scheduledTimestamp;
    *((_WORD *)v4 + 114) |= 4u;
  }
LABEL_5:
  v29 = v4;
  if (self->_caseIdentifier)
  {
    objc_msgSend(v4, "setCaseIdentifier:");
    id v4 = v29;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) != 0)
  {
    *((_DWORD *)v4 + 51) = self->_radarIdentifier;
    *((_WORD *)v4 + 114) |= 0x80u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_9:
      if ((v6 & 0x200) == 0) {
        goto LABEL_10;
      }
      goto LABEL_51;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_9;
  }
  v4[19] = self->_apnsMsgIdentifier;
  *((_WORD *)v4 + 114) |= 1u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) == 0)
  {
LABEL_10:
    if ((v6 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 56) = self->_urgency;
  *((_WORD *)v4 + 114) |= 0x200u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_11:
    if ((v6 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 50) = self->_preflightStatus;
  *((_WORD *)v4 + 114) |= 0x40u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_12:
    if ((v6 & 0x100) == 0) {
      goto LABEL_13;
    }
LABEL_54:
    *((_DWORD *)v4 + 52) = self->_requestStatus;
    *((_WORD *)v4 + 114) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_53:
  *((_DWORD *)v4 + 48) = self->_consentStatus;
  *((_WORD *)v4 + 114) |= 0x10u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) != 0) {
    goto LABEL_54;
  }
LABEL_13:
  if ((v6 & 0x20) != 0)
  {
LABEL_14:
    *((_DWORD *)v4 + 49) = self->_expectedFileCount;
    *((_WORD *)v4 + 114) |= 0x20u;
  }
LABEL_15:
  if ([(AWDSymptomsDiagnosticRemoteUpload *)self taskFileSizesCount])
  {
    [v29 clearTaskFileSizes];
    unint64_t v7 = [(AWDSymptomsDiagnosticRemoteUpload *)self taskFileSizesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
        objc_msgSend(v29, "addTaskFileSize:", -[AWDSymptomsDiagnosticRemoteUpload taskFileSizeAtIndex:](self, "taskFileSizeAtIndex:", i));
    }
  }
  if ([(AWDSymptomsDiagnosticRemoteUpload *)self taskStatusCount])
  {
    [v29 clearTaskStatus];
    unint64_t v10 = [(AWDSymptomsDiagnosticRemoteUpload *)self taskStatusCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        objc_msgSend(v29, "addTaskStatus:", -[AWDSymptomsDiagnosticRemoteUpload taskStatusAtIndex:](self, "taskStatusAtIndex:", j));
    }
  }
  if ([(AWDSymptomsDiagnosticRemoteUpload *)self taskRetryCountsCount])
  {
    [v29 clearTaskRetryCounts];
    unint64_t v13 = [(AWDSymptomsDiagnosticRemoteUpload *)self taskRetryCountsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
        objc_msgSend(v29, "addTaskRetryCount:", -[AWDSymptomsDiagnosticRemoteUpload taskRetryCountAtIndex:](self, "taskRetryCountAtIndex:", k));
    }
  }
  if ([(AWDSymptomsDiagnosticRemoteUpload *)self taskHttpStatusCodesCount])
  {
    [v29 clearTaskHttpStatusCodes];
    unint64_t v16 = [(AWDSymptomsDiagnosticRemoteUpload *)self taskHttpStatusCodesCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
        objc_msgSend(v29, "addTaskHttpStatusCode:", -[AWDSymptomsDiagnosticRemoteUpload taskHttpStatusCodeAtIndex:](self, "taskHttpStatusCodeAtIndex:", m));
    }
  }
  if ([(AWDSymptomsDiagnosticRemoteUpload *)self taskErrorDomainsCount])
  {
    [v29 clearTaskErrorDomains];
    unint64_t v19 = [(AWDSymptomsDiagnosticRemoteUpload *)self taskErrorDomainsCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t n = 0; n != v20; ++n)
      {
        long long v22 = [(AWDSymptomsDiagnosticRemoteUpload *)self taskErrorDomainAtIndex:n];
        [v29 addTaskErrorDomain:v22];
      }
    }
  }
  if ([(AWDSymptomsDiagnosticRemoteUpload *)self taskErrorCodesCount])
  {
    [v29 clearTaskErrorCodes];
    unint64_t v23 = [(AWDSymptomsDiagnosticRemoteUpload *)self taskErrorCodesCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (iuint64_t i = 0; ii != v24; ++ii)
        objc_msgSend(v29, "addTaskErrorCode:", -[AWDSymptomsDiagnosticRemoteUpload taskErrorCodeAtIndex:](self, "taskErrorCodeAtIndex:", ii));
    }
  }
  if ([(AWDSymptomsDiagnosticRemoteUpload *)self primaryNetworkObservedOnCompletionsCount])
  {
    [v29 clearPrimaryNetworkObservedOnCompletions];
    unint64_t v26 = [(AWDSymptomsDiagnosticRemoteUpload *)self primaryNetworkObservedOnCompletionsCount];
    if (v26)
    {
      unint64_t v27 = v26;
      for (juint64_t j = 0; jj != v27; ++jj)
        objc_msgSend(v29, "addPrimaryNetworkObservedOnCompletion:", -[AWDSymptomsDiagnosticRemoteUpload primaryNetworkObservedOnCompletionAtIndex:](self, "primaryNetworkObservedOnCompletionAtIndex:", jj));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v5 + 176) = self->_timestamp;
    *(_WORD *)(v5 + 228) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 160) = self->_requestedTimestamp;
  *(_WORD *)(v5 + 228) |= 2u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(void *)(v5 + 168) = self->_scheduledTimestamp;
    *(_WORD *)(v5 + 228) |= 4u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_caseIdentifier copyWithZone:a3];
  unint64_t v9 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 204) = self->_radarIdentifier;
    *(_WORD *)(v6 + 228) |= 0x80u;
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 1) == 0)
    {
LABEL_7:
      if ((v10 & 0x200) == 0) {
        goto LABEL_8;
      }
      goto LABEL_26;
    }
  }
  else if ((v10 & 1) == 0)
  {
    goto LABEL_7;
  }
  *(void *)(v6 + 152) = self->_apnsMsgIdentifier;
  *(_WORD *)(v6 + 228) |= 1u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x200) == 0)
  {
LABEL_8:
    if ((v10 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v6 + 224) = self->_urgency;
  *(_WORD *)(v6 + 228) |= 0x200u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x40) == 0)
  {
LABEL_9:
    if ((v10 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v6 + 200) = self->_preflightStatus;
  *(_WORD *)(v6 + 228) |= 0x40u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x10) == 0)
  {
LABEL_10:
    if ((v10 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v6 + 192) = self->_consentStatus;
  *(_WORD *)(v6 + 228) |= 0x10u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x100) == 0)
  {
LABEL_11:
    if ((v10 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_29:
  *(_DWORD *)(v6 + 208) = self->_requestStatus;
  *(_WORD *)(v6 + 228) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_12:
    *(_DWORD *)(v6 + 196) = self->_expectedFileCount;
    *(_WORD *)(v6 + 228) |= 0x20u;
  }
LABEL_13:
  PBRepeatedInt64Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v11 = self->_taskErrorDomains;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        unint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v6 addTaskErrorDomain:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  PBRepeatedInt64Copy();
  PBRepeatedInt32Copy();
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_63;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 114);
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_timestamp != *((void *)v4 + 22)) {
      goto LABEL_63;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_requestedTimestamp != *((void *)v4 + 20)) {
      goto LABEL_63;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_scheduledTimestamp != *((void *)v4 + 21)) {
      goto LABEL_63;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_63;
  }
  caseIdentifier = self->_caseIdentifier;
  if ((unint64_t)caseIdentifier | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](caseIdentifier, "isEqual:"))
    {
LABEL_63:
      char IsEqual = 0;
      goto LABEL_64;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v8 = *((_WORD *)v4 + 114);
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_radarIdentifier != *((_DWORD *)v4 + 51)) {
      goto LABEL_63;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_63;
  }
  if (has)
  {
    if ((v8 & 1) == 0 || self->_apnsMsgIdentifier != *((void *)v4 + 19)) {
      goto LABEL_63;
    }
  }
  else if (v8)
  {
    goto LABEL_63;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 114) & 0x200) == 0 || self->_urgency != *((_DWORD *)v4 + 56)) {
      goto LABEL_63;
    }
  }
  else if ((*((_WORD *)v4 + 114) & 0x200) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_preflightStatus != *((_DWORD *)v4 + 50)) {
      goto LABEL_63;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_consentStatus != *((_DWORD *)v4 + 48)) {
      goto LABEL_63;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 114) & 0x100) == 0 || self->_requestStatus != *((_DWORD *)v4 + 52)) {
      goto LABEL_63;
    }
  }
  else if ((*((_WORD *)v4 + 114) & 0x100) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_expectedFileCount != *((_DWORD *)v4 + 49)) {
      goto LABEL_63;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_63;
  }
  if (!PBRepeatedInt64IsEqual()) {
    goto LABEL_63;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_63;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_63;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_63;
  }
  taskErrorDomains = self->_taskErrorDomains;
  if ((unint64_t)taskErrorDomains | *((void *)v4 + 27))
  {
    if (!-[NSMutableArray isEqual:](taskErrorDomains, "isEqual:")) {
      goto LABEL_63;
    }
  }
  if (!PBRepeatedInt64IsEqual()) {
    goto LABEL_63;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_64:

  return IsEqual;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
    unint64_t v4 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v5 = 0;
    if ((has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v4 = 2654435761u * self->_timestamp;
  if ((has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_requestedTimestamp;
  if ((has & 4) != 0)
  {
LABEL_4:
    unint64_t v6 = 2654435761u * self->_scheduledTimestamp;
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v6 = 0;
LABEL_8:
  NSUInteger v7 = [(NSString *)self->_caseIdentifier hash];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x80) != 0)
  {
    uint64_t v9 = 2654435761 * self->_radarIdentifier;
    if (v8)
    {
LABEL_10:
      unint64_t v10 = 2654435761u * self->_apnsMsgIdentifier;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_11;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (v8) {
      goto LABEL_10;
    }
  }
  unint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v11 = 2654435761 * self->_urgency;
    if ((v8 & 0x40) != 0) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v11 = 0;
  if ((v8 & 0x40) != 0)
  {
LABEL_12:
    uint64_t v12 = 2654435761 * self->_preflightStatus;
    if ((v8 & 0x10) != 0) {
      goto LABEL_13;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v12 = 0;
  if ((v8 & 0x10) != 0)
  {
LABEL_13:
    uint64_t v13 = 2654435761 * self->_consentStatus;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_14;
    }
LABEL_21:
    uint64_t v14 = 0;
    if ((v8 & 0x20) != 0) {
      goto LABEL_15;
    }
LABEL_22:
    uint64_t v15 = 0;
    goto LABEL_23;
  }
LABEL_20:
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_21;
  }
LABEL_14:
  uint64_t v14 = 2654435761 * self->_requestStatus;
  if ((v8 & 0x20) == 0) {
    goto LABEL_22;
  }
LABEL_15:
  uint64_t v15 = 2654435761 * self->_expectedFileCount;
LABEL_23:
  uint64_t v16 = v5 ^ v4 ^ v6 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ PBRepeatedInt64Hash();
  uint64_t v17 = v16 ^ PBRepeatedInt32Hash() ^ v7;
  uint64_t v18 = PBRepeatedInt32Hash();
  uint64_t v19 = v18 ^ PBRepeatedInt32Hash();
  uint64_t v20 = v17 ^ v19 ^ [(NSMutableArray *)self->_taskErrorDomains hash];
  uint64_t v21 = PBRepeatedInt64Hash();
  return v20 ^ v21 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  unint64_t v4 = (unint64_t *)a3;
  unint64_t v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 114);
  if ((v6 & 8) != 0)
  {
    self->_timestamp = v4[22];
    *(_WORD *)&self->_has |= 8u;
    __int16 v6 = *((_WORD *)v4 + 114);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_requestedTimestamp = v4[20];
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 114) & 4) != 0)
  {
LABEL_4:
    self->_scheduledTimestamp = v4[21];
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_5:
  if (v4[23]) {
    -[AWDSymptomsDiagnosticRemoteUpload setCaseIdentifier:](self, "setCaseIdentifier:");
  }
  __int16 v7 = *((_WORD *)v5 + 114);
  if ((v7 & 0x80) != 0)
  {
    self->_radarIdentifier = *((_DWORD *)v5 + 51);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v7 = *((_WORD *)v5 + 114);
    if ((v7 & 1) == 0)
    {
LABEL_9:
      if ((v7 & 0x200) == 0) {
        goto LABEL_10;
      }
      goto LABEL_46;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_apnsMsgIdentifier = v5[19];
  *(_WORD *)&self->_has |= 1u;
  __int16 v7 = *((_WORD *)v5 + 114);
  if ((v7 & 0x200) == 0)
  {
LABEL_10:
    if ((v7 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_urgency = *((_DWORD *)v5 + 56);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v7 = *((_WORD *)v5 + 114);
  if ((v7 & 0x40) == 0)
  {
LABEL_11:
    if ((v7 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_preflightStatus = *((_DWORD *)v5 + 50);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v7 = *((_WORD *)v5 + 114);
  if ((v7 & 0x10) == 0)
  {
LABEL_12:
    if ((v7 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_consentStatus = *((_DWORD *)v5 + 48);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v7 = *((_WORD *)v5 + 114);
  if ((v7 & 0x100) == 0)
  {
LABEL_13:
    if ((v7 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_49:
  self->_requestStatus = *((_DWORD *)v5 + 52);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v5 + 114) & 0x20) != 0)
  {
LABEL_14:
    self->_expectedFileCount = *((_DWORD *)v5 + 49);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_15:
  uint64_t v8 = [v5 taskFileSizesCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
      -[AWDSymptomsDiagnosticRemoteUpload addTaskFileSize:](self, "addTaskFileSize:", [v5 taskFileSizeAtIndex:i]);
  }
  uint64_t v11 = [v5 taskStatusCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t j = 0; j != v12; ++j)
      -[AWDSymptomsDiagnosticRemoteUpload addTaskStatus:](self, "addTaskStatus:", [v5 taskStatusAtIndex:j]);
  }
  uint64_t v14 = [v5 taskRetryCountsCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t k = 0; k != v15; ++k)
      -[AWDSymptomsDiagnosticRemoteUpload addTaskRetryCount:](self, "addTaskRetryCount:", [v5 taskRetryCountAtIndex:k]);
  }
  uint64_t v17 = [v5 taskHttpStatusCodesCount];
  if (v17)
  {
    uint64_t v18 = v17;
    for (uint64_t m = 0; m != v18; ++m)
      -[AWDSymptomsDiagnosticRemoteUpload addTaskHttpStatusCode:](self, "addTaskHttpStatusCode:", [v5 taskHttpStatusCodeAtIndex:m]);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v20 = (id)v5[27];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t n = 0; n != v22; ++n)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v20);
        }
        -[AWDSymptomsDiagnosticRemoteUpload addTaskErrorDomain:](self, "addTaskErrorDomain:", *(void *)(*((void *)&v31 + 1) + 8 * n), (void)v31);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v22);
  }

  uint64_t v25 = [v5 taskErrorCodesCount];
  if (v25)
  {
    uint64_t v26 = v25;
    for (iuint64_t i = 0; ii != v26; ++ii)
      -[AWDSymptomsDiagnosticRemoteUpload addTaskErrorCode:](self, "addTaskErrorCode:", objc_msgSend(v5, "taskErrorCodeAtIndex:", ii, (void)v31));
  }
  uint64_t v28 = objc_msgSend(v5, "primaryNetworkObservedOnCompletionsCount", (void)v31);
  if (v28)
  {
    uint64_t v29 = v28;
    for (juint64_t j = 0; jj != v29; ++jj)
      -[AWDSymptomsDiagnosticRemoteUpload addPrimaryNetworkObservedOnCompletion:](self, "addPrimaryNetworkObservedOnCompletion:", [v5 primaryNetworkObservedOnCompletionAtIndex:jj]);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)requestedTimestamp
{
  return self->_requestedTimestamp;
}

- (unint64_t)scheduledTimestamp
{
  return self->_scheduledTimestamp;
}

- (NSString)caseIdentifier
{
  return self->_caseIdentifier;
}

- (void)setCaseIdentifier:(id)a3
{
}

- (unsigned)radarIdentifier
{
  return self->_radarIdentifier;
}

- (unint64_t)apnsMsgIdentifier
{
  return self->_apnsMsgIdentifier;
}

- (unsigned)urgency
{
  return self->_urgency;
}

- (int)expectedFileCount
{
  return self->_expectedFileCount;
}

- (NSMutableArray)taskErrorDomains
{
  return self->_taskErrorDomains;
}

- (void)setTaskErrorDomains:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskErrorDomains, 0);

  objc_storeStrong((id *)&self->_caseIdentifier, 0);
}

@end