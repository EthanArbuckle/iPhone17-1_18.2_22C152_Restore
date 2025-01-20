@interface MTRICDManagementClusterMonitoringRegistrationStruct
- (MTRICDManagementClusterMonitoringRegistrationStruct)init;
- (NSNumber)checkInNodeID;
- (NSNumber)clientType;
- (NSNumber)fabricIndex;
- (NSNumber)monitoredSubject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCheckInNodeID:(id)a3;
- (void)setClientType:(id)a3;
- (void)setFabricIndex:(id)a3;
- (void)setMonitoredSubject:(id)a3;
@end

@implementation MTRICDManagementClusterMonitoringRegistrationStruct

- (MTRICDManagementClusterMonitoringRegistrationStruct)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRICDManagementClusterMonitoringRegistrationStruct;
  v2 = [(MTRICDManagementClusterMonitoringRegistrationStruct *)&v9 init];
  v3 = v2;
  if (v2)
  {
    checkInNodeID = v2->_checkInNodeID;
    v2->_checkInNodeID = (NSNumber *)&unk_26F9C8620;

    monitoredSubject = v3->_monitoredSubject;
    v3->_monitoredSubject = (NSNumber *)&unk_26F9C8620;

    clientType = v3->_clientType;
    v3->_clientType = (NSNumber *)&unk_26F9C8620;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRICDManagementClusterMonitoringRegistrationStruct);
  v7 = objc_msgSend_checkInNodeID(self, v5, v6);
  objc_msgSend_setCheckInNodeID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_monitoredSubject(self, v9, v10);
  objc_msgSend_setMonitoredSubject_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_clientType(self, v13, v14);
  objc_msgSend_setClientType_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_fabricIndex(self, v17, v18);
  objc_msgSend_setFabricIndex_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: checkInNodeID:%@; monitoredSubject:%@; clientType:%@; fabricIndex:%@; >",
    v5,
    self->_checkInNodeID,
    self->_monitoredSubject,
    self->_clientType,
  v7 = self->_fabricIndex);

  return v7;
}

- (NSNumber)checkInNodeID
{
  return self->_checkInNodeID;
}

- (void)setCheckInNodeID:(id)a3
{
}

- (NSNumber)monitoredSubject
{
  return self->_monitoredSubject;
}

- (void)setMonitoredSubject:(id)a3
{
}

- (NSNumber)clientType
{
  return self->_clientType;
}

- (void)setClientType:(id)a3
{
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_clientType, 0);
  objc_storeStrong((id *)&self->_monitoredSubject, 0);

  objc_storeStrong((id *)&self->_checkInNodeID, 0);
}

@end