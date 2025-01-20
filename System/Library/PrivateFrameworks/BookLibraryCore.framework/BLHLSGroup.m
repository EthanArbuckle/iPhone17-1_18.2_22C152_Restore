@interface BLHLSGroup
- (BLHLSGroup)initWithGroupID:(id)a3 media:(id)a4;
- (NSArray)media;
- (NSString)groupID;
- (id)description;
@end

@implementation BLHLSGroup

- (BLHLSGroup)initWithGroupID:(id)a3 media:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BLHLSGroup;
  v11 = [(BLHLSGroup *)&v20 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    groupID = v11->_groupID;
    v11->_groupID = (NSString *)v12;

    uint64_t v17 = objc_msgSend_copy(v7, v14, v15, v16);
    media = v11->_media;
    v11->_media = (NSArray *)v17;
  }
  return v11;
}

- (id)description
{
  v5 = NSString;
  id v6 = objc_msgSend_groupID(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_media(self, v7, v8, v9);
  v14 = objc_msgSend_description(v10, v11, v12, v13);
  uint64_t v17 = objc_msgSend_stringWithFormat_(v5, v15, @"GroupID: %@ %@", v16, v6, v14);

  return v17;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (NSArray)media
{
  return self->_media;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_media, 0);

  objc_storeStrong((id *)&self->_groupID, 0);
}

@end