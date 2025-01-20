@interface MTRDemandResponseLoadControlClusterLoadControlProgramStruct
- (MTRDemandResponseLoadControlClusterLoadControlProgramStruct)init;
- (NSData)programID;
- (NSNumber)enrollmentGroup;
- (NSNumber)randomDurationMinutes;
- (NSNumber)randomStartMinutes;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setEnrollmentGroup:(id)a3;
- (void)setName:(id)a3;
- (void)setProgramID:(id)a3;
- (void)setRandomDurationMinutes:(id)a3;
- (void)setRandomStartMinutes:(id)a3;
@end

@implementation MTRDemandResponseLoadControlClusterLoadControlProgramStruct

- (MTRDemandResponseLoadControlClusterLoadControlProgramStruct)init
{
  v12.receiver = self;
  v12.super_class = (Class)MTRDemandResponseLoadControlClusterLoadControlProgramStruct;
  v4 = [(MTRDemandResponseLoadControlClusterLoadControlProgramStruct *)&v12 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    programID = v4->_programID;
    v4->_programID = (NSData *)v5;

    name = v4->_name;
    v4->_name = (NSString *)&stru_26F969DC8;

    enrollmentGroup = v4->_enrollmentGroup;
    v4->_enrollmentGroup = 0;

    randomStartMinutes = v4->_randomStartMinutes;
    v4->_randomStartMinutes = 0;

    randomDurationMinutes = v4->_randomDurationMinutes;
    v4->_randomDurationMinutes = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterLoadControlProgramStruct);
  v7 = objc_msgSend_programID(self, v5, v6);
  objc_msgSend_setProgramID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_name(self, v9, v10);
  objc_msgSend_setName_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_enrollmentGroup(self, v13, v14);
  objc_msgSend_setEnrollmentGroup_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_randomStartMinutes(self, v17, v18);
  objc_msgSend_setRandomStartMinutes_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_randomDurationMinutes(self, v21, v22);
  objc_msgSend_setRandomDurationMinutes_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_programID, v6, 0);
  objc_msgSend_stringWithFormat_(v3, v8, @"<%@: programID:%@; name:%@; enrollmentGroup:%@; randomStartMinutes:%@; randomDurationMinutes:%@; >",
    v5,
    v7,
    self->_name,
    self->_enrollmentGroup,
    self->_randomStartMinutes,
  v9 = self->_randomDurationMinutes);

  return v9;
}

- (NSData)programID
{
  return self->_programID;
}

- (void)setProgramID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSNumber)enrollmentGroup
{
  return self->_enrollmentGroup;
}

- (void)setEnrollmentGroup:(id)a3
{
}

- (NSNumber)randomStartMinutes
{
  return self->_randomStartMinutes;
}

- (void)setRandomStartMinutes:(id)a3
{
}

- (NSNumber)randomDurationMinutes
{
  return self->_randomDurationMinutes;
}

- (void)setRandomDurationMinutes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomDurationMinutes, 0);
  objc_storeStrong((id *)&self->_randomStartMinutes, 0);
  objc_storeStrong((id *)&self->_enrollmentGroup, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_programID, 0);
}

@end