@interface MTRServiceAreaClusterAreaStruct
- (MTRServiceAreaClusterAreaInfoStruct)areaInfo;
- (MTRServiceAreaClusterAreaStruct)init;
- (NSNumber)areaID;
- (NSNumber)mapID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAreaID:(id)a3;
- (void)setAreaInfo:(id)a3;
- (void)setMapID:(id)a3;
@end

@implementation MTRServiceAreaClusterAreaStruct

- (MTRServiceAreaClusterAreaStruct)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRServiceAreaClusterAreaStruct;
  v2 = [(MTRServiceAreaClusterAreaStruct *)&v9 init];
  v3 = v2;
  if (v2)
  {
    areaID = v2->_areaID;
    v2->_areaID = (NSNumber *)&unk_26F9C8620;

    mapID = v3->_mapID;
    v3->_mapID = 0;

    uint64_t v6 = objc_opt_new();
    areaInfo = v3->_areaInfo;
    v3->_areaInfo = (MTRServiceAreaClusterAreaInfoStruct *)v6;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRServiceAreaClusterAreaStruct);
  v7 = objc_msgSend_areaID(self, v5, v6);
  objc_msgSend_setAreaID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_mapID(self, v9, v10);
  objc_msgSend_setMapID_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_areaInfo(self, v13, v14);
  objc_msgSend_setAreaInfo_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: areaID:%@; mapID:%@; areaInfo:%@; >",
    v5,
    self->_areaID,
    self->_mapID,
  v7 = self->_areaInfo);

  return v7;
}

- (NSNumber)areaID
{
  return self->_areaID;
}

- (void)setAreaID:(id)a3
{
}

- (NSNumber)mapID
{
  return self->_mapID;
}

- (void)setMapID:(id)a3
{
}

- (MTRServiceAreaClusterAreaInfoStruct)areaInfo
{
  return self->_areaInfo;
}

- (void)setAreaInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_areaInfo, 0);
  objc_storeStrong((id *)&self->_mapID, 0);

  objc_storeStrong((id *)&self->_areaID, 0);
}

@end