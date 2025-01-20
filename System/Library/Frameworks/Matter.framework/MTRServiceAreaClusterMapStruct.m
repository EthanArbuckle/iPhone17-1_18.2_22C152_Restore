@interface MTRServiceAreaClusterMapStruct
- (MTRServiceAreaClusterMapStruct)init;
- (NSNumber)mapID;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setMapID:(id)a3;
- (void)setName:(id)a3;
@end

@implementation MTRServiceAreaClusterMapStruct

- (MTRServiceAreaClusterMapStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRServiceAreaClusterMapStruct;
  v2 = [(MTRServiceAreaClusterMapStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    mapID = v2->_mapID;
    v2->_mapID = (NSNumber *)&unk_26F9C8620;

    name = v3->_name;
    v3->_name = (NSString *)&stru_26F969DC8;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRServiceAreaClusterMapStruct);
  objc_super v7 = objc_msgSend_mapID(self, v5, v6);
  objc_msgSend_setMapID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_name(self, v9, v10);
  objc_msgSend_setName_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: mapID:%@ name:%@; >", v5, self->_mapID, self->_name);;

  return v7;
}

- (NSNumber)mapID
{
  return self->_mapID;
}

- (void)setMapID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_mapID, 0);
}

@end