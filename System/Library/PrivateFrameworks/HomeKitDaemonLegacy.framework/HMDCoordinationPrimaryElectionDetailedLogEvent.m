@interface HMDCoordinationPrimaryElectionDetailedLogEvent
- (BOOL)meshAndPrimaryCandidateCountEqual;
- (BOOL)previousPrimaryInMesh;
- (HMDCoordinationPrimaryElectionDetailedLogEvent)initWithIsPrimary:(BOOL)a3 didChangePrimary:(BOOL)a4 electionTriggerReason:(unint64_t)a5 confirmationCriteria:(unint64_t)a6 meshAndPrimaryCandidateCountEqual:(BOOL)a7 previousPrimaryInMesh:(BOOL)a8;
- (NSDictionary)coreAnalyticsEventDictionary;
- (unint64_t)confirmationCriteria;
- (unint64_t)electionTriggerReason;
@end

@implementation HMDCoordinationPrimaryElectionDetailedLogEvent

- (BOOL)previousPrimaryInMesh
{
  return *(&self->super._didChangePrimary + 2);
}

- (BOOL)meshAndPrimaryCandidateCountEqual
{
  return *(&self->super._didChangePrimary + 1);
}

- (unint64_t)confirmationCriteria
{
  return self->_electionTriggerReason;
}

- (unint64_t)electionTriggerReason
{
  return *(void *)&self->_meshAndPrimaryCandidateCountEqual;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(HMDCoordinationPrimaryElectionLogEvent *)self isPrimary]) {
    v4 = &unk_1F2DC88D8;
  }
  else {
    v4 = &unk_1F2DC88F0;
  }
  [v3 setObject:v4 forKeyedSubscript:@"isPrimary"];
  if ([(HMDCoordinationPrimaryElectionLogEvent *)self didChangePrimary]) {
    v5 = &unk_1F2DC88D8;
  }
  else {
    v5 = &unk_1F2DC88F0;
  }
  [v3 setObject:v5 forKeyedSubscript:@"didChangePrimary"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self electionTriggerReason] == 1) {
    v6 = &unk_1F2DC88D8;
  }
  else {
    v6 = &unk_1F2DC88F0;
  }
  [v3 setObject:v6 forKeyedSubscript:@"triggerReasonCoordinationUpdate"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self electionTriggerReason]) {
    v7 = &unk_1F2DC88F0;
  }
  else {
    v7 = &unk_1F2DC88D8;
  }
  [v3 setObject:v7 forKeyedSubscript:@"triggerReasonPrimaryPingTimeout"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self electionTriggerReason] == 2) {
    v8 = &unk_1F2DC88D8;
  }
  else {
    v8 = &unk_1F2DC88F0;
  }
  [v3 setObject:v8 forKeyedSubscript:@"triggerReasonCoordinationPrimaryMesh"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self electionTriggerReason] == 3) {
    v9 = &unk_1F2DC88D8;
  }
  else {
    v9 = &unk_1F2DC88F0;
  }
  [v3 setObject:v9 forKeyedSubscript:@"triggerReasonUnknownMeshState"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self electionTriggerReason] == 4) {
    v10 = &unk_1F2DC88D8;
  }
  else {
    v10 = &unk_1F2DC88F0;
  }
  [v3 setObject:v10 forKeyedSubscript:@"triggerReasonPrimaryMissing"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self electionTriggerReason] == 5) {
    v11 = &unk_1F2DC88D8;
  }
  else {
    v11 = &unk_1F2DC88F0;
  }
  [v3 setObject:v11 forKeyedSubscript:@"triggerReasonNodesAdded"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self electionTriggerReason] == 6) {
    v12 = &unk_1F2DC88D8;
  }
  else {
    v12 = &unk_1F2DC88F0;
  }
  [v3 setObject:v12 forKeyedSubscript:@"triggerReasonCoordinationLeaderChange"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self confirmationCriteria]) {
    v13 = &unk_1F2DC88F0;
  }
  else {
    v13 = &unk_1F2DC88D8;
  }
  [v3 setObject:v13 forKeyedSubscript:@"confirmationCriteriaSame"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self confirmationCriteria] == 1) {
    v14 = &unk_1F2DC88D8;
  }
  else {
    v14 = &unk_1F2DC88F0;
  }
  [v3 setObject:v14 forKeyedSubscript:@"confirmationCriteriaEnabled"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self confirmationCriteria] == 2) {
    v15 = &unk_1F2DC88D8;
  }
  else {
    v15 = &unk_1F2DC88F0;
  }
  [v3 setObject:v15 forKeyedSubscript:@"confirmationCriteriaCapabilities"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self confirmationCriteria] == 3) {
    v16 = &unk_1F2DC88D8;
  }
  else {
    v16 = &unk_1F2DC88F0;
  }
  [v3 setObject:v16 forKeyedSubscript:@"confirmationCriteriaLocation"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self confirmationCriteria] == 4) {
    v17 = &unk_1F2DC88D8;
  }
  else {
    v17 = &unk_1F2DC88F0;
  }
  [v3 setObject:v17 forKeyedSubscript:@"confirmationCriteriaProduct"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self confirmationCriteria] == 5) {
    v18 = &unk_1F2DC88D8;
  }
  else {
    v18 = &unk_1F2DC88F0;
  }
  [v3 setObject:v18 forKeyedSubscript:@"confirmationCriteriaVersion"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self confirmationCriteria] == 16) {
    v19 = &unk_1F2DC88D8;
  }
  else {
    v19 = &unk_1F2DC88F0;
  }
  [v3 setObject:v19 forKeyedSubscript:@"confirmationCriteriaSoftwareVersion"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self confirmationCriteria] == 6) {
    v20 = &unk_1F2DC88D8;
  }
  else {
    v20 = &unk_1F2DC88F0;
  }
  [v3 setObject:v20 forKeyedSubscript:@"confirmationCriteriaMajorVersion"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self confirmationCriteria] == 7) {
    v21 = &unk_1F2DC88D8;
  }
  else {
    v21 = &unk_1F2DC88F0;
  }
  [v3 setObject:v21 forKeyedSubscript:@"confirmationCriteriaMinorVersion"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self confirmationCriteria] == 8) {
    v22 = &unk_1F2DC88D8;
  }
  else {
    v22 = &unk_1F2DC88F0;
  }
  [v3 setObject:v22 forKeyedSubscript:@"confirmationCriteriaElectionVersion"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self confirmationCriteria] == 9) {
    v23 = &unk_1F2DC88D8;
  }
  else {
    v23 = &unk_1F2DC88F0;
  }
  [v3 setObject:v23 forKeyedSubscript:@"confirmationCriteriaReachableAccessories"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self confirmationCriteria] == 10) {
    v24 = &unk_1F2DC88D8;
  }
  else {
    v24 = &unk_1F2DC88F0;
  }
  [v3 setObject:v24 forKeyedSubscript:@"confirmationCriteriaCurrentPrimary"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self confirmationCriteria] == 11) {
    v25 = &unk_1F2DC88D8;
  }
  else {
    v25 = &unk_1F2DC88F0;
  }
  [v3 setObject:v25 forKeyedSubscript:@"confirmationCriteriaCurrentDevice"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self confirmationCriteria] == 12) {
    v26 = &unk_1F2DC88D8;
  }
  else {
    v26 = &unk_1F2DC88F0;
  }
  [v3 setObject:v26 forKeyedSubscript:@"confirmationCriteriaOverride"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self confirmationCriteria] == 13) {
    v27 = &unk_1F2DC88D8;
  }
  else {
    v27 = &unk_1F2DC88F0;
  }
  [v3 setObject:v27 forKeyedSubscript:@"confirmationCriteriaIDSIdentifier"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self confirmationCriteria] == 14) {
    v28 = &unk_1F2DC88D8;
  }
  else {
    v28 = &unk_1F2DC88F0;
  }
  [v3 setObject:v28 forKeyedSubscript:@"confirmationCriteriaConnectionType"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self confirmationCriteria] == 15) {
    v29 = &unk_1F2DC88D8;
  }
  else {
    v29 = &unk_1F2DC88F0;
  }
  [v3 setObject:v29 forKeyedSubscript:@"confirmationCriteriaPCSEnabled"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self meshAndPrimaryCandidateCountEqual])
  {
    v30 = &unk_1F2DC88D8;
  }
  else
  {
    v30 = &unk_1F2DC88F0;
  }
  [v3 setObject:v30 forKeyedSubscript:@"meshAndPrimaryCountEqual"];
  if ([(HMDCoordinationPrimaryElectionDetailedLogEvent *)self previousPrimaryInMesh]) {
    v31 = &unk_1F2DC88D8;
  }
  else {
    v31 = &unk_1F2DC88F0;
  }
  [v3 setObject:v31 forKeyedSubscript:@"previousPrimaryInMesh"];
  v32 = (void *)[v3 copy];

  return (NSDictionary *)v32;
}

- (HMDCoordinationPrimaryElectionDetailedLogEvent)initWithIsPrimary:(BOOL)a3 didChangePrimary:(BOOL)a4 electionTriggerReason:(unint64_t)a5 confirmationCriteria:(unint64_t)a6 meshAndPrimaryCandidateCountEqual:(BOOL)a7 previousPrimaryInMesh:(BOOL)a8
{
  v13.receiver = self;
  v13.super_class = (Class)HMDCoordinationPrimaryElectionDetailedLogEvent;
  result = [(HMDCoordinationPrimaryElectionLogEvent *)&v13 initWithIsPrimary:a3 didChangePrimary:a4];
  if (result)
  {
    *(void *)&result->_meshAndPrimaryCandidateCountEqual = a5;
    result->_electionTriggerReason = a6;
    *(&result->super._didChangePrimary + 1) = a7;
    *(&result->super._didChangePrimary + 2) = a8;
  }
  return result;
}

@end