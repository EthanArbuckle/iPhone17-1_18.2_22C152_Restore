@interface MTRServiceAreaClusterProgressStruct
- (MTRServiceAreaClusterProgressStruct)init;
- (NSNumber)areaID;
- (NSNumber)estimatedTime;
- (NSNumber)status;
- (NSNumber)totalOperationalTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAreaID:(id)a3;
- (void)setEstimatedTime:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTotalOperationalTime:(id)a3;
@end

@implementation MTRServiceAreaClusterProgressStruct

- (MTRServiceAreaClusterProgressStruct)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRServiceAreaClusterProgressStruct;
  v2 = [(MTRServiceAreaClusterProgressStruct *)&v9 init];
  v3 = v2;
  if (v2)
  {
    areaID = v2->_areaID;
    v2->_areaID = (NSNumber *)&unk_26F9C8620;

    status = v3->_status;
    v3->_status = (NSNumber *)&unk_26F9C8620;

    totalOperationalTime = v3->_totalOperationalTime;
    v3->_totalOperationalTime = 0;

    estimatedTime = v3->_estimatedTime;
    v3->_estimatedTime = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRServiceAreaClusterProgressStruct);
  v7 = objc_msgSend_areaID(self, v5, v6);
  objc_msgSend_setAreaID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_status(self, v9, v10);
  objc_msgSend_setStatus_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_totalOperationalTime(self, v13, v14);
  objc_msgSend_setTotalOperationalTime_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_estimatedTime(self, v17, v18);
  objc_msgSend_setEstimatedTime_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: areaID:%@; status:%@; totalOperationalTime:%@; estimatedTime:%@; >",
    v5,
    self->_areaID,
    self->_status,
    self->_totalOperationalTime,
  v7 = self->_estimatedTime);

  return v7;
}

- (NSNumber)areaID
{
  return self->_areaID;
}

- (void)setAreaID:(id)a3
{
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSNumber)totalOperationalTime
{
  return self->_totalOperationalTime;
}

- (void)setTotalOperationalTime:(id)a3
{
}

- (NSNumber)estimatedTime
{
  return self->_estimatedTime;
}

- (void)setEstimatedTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedTime, 0);
  objc_storeStrong((id *)&self->_totalOperationalTime, 0);
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_areaID, 0);
}

@end