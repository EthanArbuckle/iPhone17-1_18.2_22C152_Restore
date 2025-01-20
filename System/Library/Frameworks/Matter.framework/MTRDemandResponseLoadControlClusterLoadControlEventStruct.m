@interface MTRDemandResponseLoadControlClusterLoadControlEventStruct
- (MTRDemandResponseLoadControlClusterLoadControlEventStruct)init;
- (NSArray)transitions;
- (NSData)eventID;
- (NSData)programID;
- (NSNumber)control;
- (NSNumber)criticality;
- (NSNumber)deviceClass;
- (NSNumber)enrollmentGroup;
- (NSNumber)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setControl:(id)a3;
- (void)setCriticality:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setEnrollmentGroup:(id)a3;
- (void)setEventID:(id)a3;
- (void)setProgramID:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setTransitions:(id)a3;
@end

@implementation MTRDemandResponseLoadControlClusterLoadControlEventStruct

- (MTRDemandResponseLoadControlClusterLoadControlEventStruct)init
{
  v18.receiver = self;
  v18.super_class = (Class)MTRDemandResponseLoadControlClusterLoadControlEventStruct;
  v4 = [(MTRDemandResponseLoadControlClusterLoadControlEventStruct *)&v18 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    eventID = v4->_eventID;
    v4->_eventID = (NSData *)v5;

    programID = v4->_programID;
    v4->_programID = 0;

    control = v4->_control;
    v4->_control = (NSNumber *)&unk_26F9C8620;

    deviceClass = v4->_deviceClass;
    v4->_deviceClass = (NSNumber *)&unk_26F9C8620;

    enrollmentGroup = v4->_enrollmentGroup;
    v4->_enrollmentGroup = 0;

    criticality = v4->_criticality;
    v4->_criticality = (NSNumber *)&unk_26F9C8620;

    startTime = v4->_startTime;
    v4->_startTime = 0;

    uint64_t v15 = objc_msgSend_array(MEMORY[0x263EFF8C0], v13, v14);
    transitions = v4->_transitions;
    v4->_transitions = (NSArray *)v15;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterLoadControlEventStruct);
  v7 = objc_msgSend_eventID(self, v5, v6);
  objc_msgSend_setEventID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_programID(self, v9, v10);
  objc_msgSend_setProgramID_(v4, v12, (uint64_t)v11);

  uint64_t v15 = objc_msgSend_control(self, v13, v14);
  objc_msgSend_setControl_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_deviceClass(self, v17, v18);
  objc_msgSend_setDeviceClass_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_enrollmentGroup(self, v21, v22);
  objc_msgSend_setEnrollmentGroup_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_criticality(self, v25, v26);
  objc_msgSend_setCriticality_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_startTime(self, v29, v30);
  objc_msgSend_setStartTime_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_transitions(self, v33, v34);
  objc_msgSend_setTransitions_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_eventID, v6, 0);
  v9 = objc_msgSend_base64EncodedStringWithOptions_(self->_programID, v8, 0);
  objc_msgSend_stringWithFormat_(v3, v10, @"<%@: eventID:%@; programID:%@; control:%@; deviceClass:%@; enrollmentGroup:%@; criticality:%@; startTime:%@; transitions:%@; >",
    v5,
    v7,
    v9,
    self->_control,
    self->_deviceClass,
    self->_enrollmentGroup,
    self->_criticality,
    self->_startTime,
  v11 = self->_transitions);

  return v11;
}

- (NSData)eventID
{
  return self->_eventID;
}

- (void)setEventID:(id)a3
{
}

- (NSData)programID
{
  return self->_programID;
}

- (void)setProgramID:(id)a3
{
}

- (NSNumber)control
{
  return self->_control;
}

- (void)setControl:(id)a3
{
}

- (NSNumber)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (NSNumber)enrollmentGroup
{
  return self->_enrollmentGroup;
}

- (void)setEnrollmentGroup:(id)a3
{
}

- (NSNumber)criticality
{
  return self->_criticality;
}

- (void)setCriticality:(id)a3
{
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSArray)transitions
{
  return self->_transitions;
}

- (void)setTransitions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitions, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_criticality, 0);
  objc_storeStrong((id *)&self->_enrollmentGroup, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_control, 0);
  objc_storeStrong((id *)&self->_programID, 0);

  objc_storeStrong((id *)&self->_eventID, 0);
}

@end