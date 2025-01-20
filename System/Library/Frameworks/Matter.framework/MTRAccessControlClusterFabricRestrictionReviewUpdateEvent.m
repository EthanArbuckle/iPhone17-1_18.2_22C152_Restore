@interface MTRAccessControlClusterFabricRestrictionReviewUpdateEvent
- (MTRAccessControlClusterFabricRestrictionReviewUpdateEvent)init;
- (NSNumber)fabricIndex;
- (NSNumber)token;
- (NSString)arlRequestFlowUrl;
- (NSString)instruction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setArlRequestFlowUrl:(id)a3;
- (void)setFabricIndex:(id)a3;
- (void)setInstruction:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation MTRAccessControlClusterFabricRestrictionReviewUpdateEvent

- (MTRAccessControlClusterFabricRestrictionReviewUpdateEvent)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRAccessControlClusterFabricRestrictionReviewUpdateEvent;
  v2 = [(MTRAccessControlClusterFabricRestrictionReviewUpdateEvent *)&v9 init];
  v3 = v2;
  if (v2)
  {
    token = v2->_token;
    v2->_token = (NSNumber *)&unk_26F9C8620;

    instruction = v3->_instruction;
    v3->_instruction = 0;

    arlRequestFlowUrl = v3->_arlRequestFlowUrl;
    v3->_arlRequestFlowUrl = 0;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRAccessControlClusterFabricRestrictionReviewUpdateEvent);
  v7 = objc_msgSend_token(self, v5, v6);
  objc_msgSend_setToken_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_instruction(self, v9, v10);
  objc_msgSend_setInstruction_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_arlRequestFlowUrl(self, v13, v14);
  objc_msgSend_setArlRequestFlowUrl_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_fabricIndex(self, v17, v18);
  objc_msgSend_setFabricIndex_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: token:%@; instruction:%@; arlRequestFlowUrl:%@; fabricIndex:%@; >",
    v5,
    self->_token,
    self->_instruction,
    self->_arlRequestFlowUrl,
  v7 = self->_fabricIndex);

  return v7;
}

- (NSNumber)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSString)instruction
{
  return self->_instruction;
}

- (void)setInstruction:(id)a3
{
}

- (NSString)arlRequestFlowUrl
{
  return self->_arlRequestFlowUrl;
}

- (void)setArlRequestFlowUrl:(id)a3
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
  objc_storeStrong((id *)&self->_arlRequestFlowUrl, 0);
  objc_storeStrong((id *)&self->_instruction, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

@end