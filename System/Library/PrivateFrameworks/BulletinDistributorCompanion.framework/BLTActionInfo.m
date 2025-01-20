@interface BLTActionInfo
- (BLTActionInfo)initWithActionType:(int64_t)a3 publisherBulletinID:(id)a4 recordID:(id)a5 sectionID:(id)a6 context:(id)a7;
- (NSDictionary)context;
- (NSString)description;
- (NSString)publisherBulletinID;
- (NSString)recordID;
- (NSString)sectionID;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)actionType;
- (void)setActionType:(int64_t)a3;
- (void)setContext:(id)a3;
- (void)setPublisherBulletinID:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setSectionID:(id)a3;
@end

@implementation BLTActionInfo

- (BLTActionInfo)initWithActionType:(int64_t)a3 publisherBulletinID:(id)a4 recordID:(id)a5 sectionID:(id)a6 context:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)BLTActionInfo;
  v16 = [(BLTActionInfo *)&v25 init];
  v17 = v16;
  if (v16)
  {
    v16->_actionType = a3;
    uint64_t v18 = [v12 copy];
    publisherBulletinID = v17->_publisherBulletinID;
    v17->_publisherBulletinID = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    recordID = v17->_recordID;
    v17->_recordID = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    sectionID = v17->_sectionID;
    v17->_sectionID = (NSString *)v22;

    objc_storeStrong((id *)&v17->_context, a7);
  }

  return v17;
}

- (NSString)description
{
  return (NSString *)[(BLTActionInfo *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(BLTActionInfo *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F29C40] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BLTActionInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(BLTActionInfo *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendInteger:self->_actionType withName:@"actionType"];
  id v6 = (id)[v4 appendObject:self->_publisherBulletinID withName:@"publisherBulletinID"];
  id v7 = (id)[v4 appendObject:self->_recordID withName:@"recordID"];
  id v8 = (id)[v4 appendObject:self->_sectionID withName:@"sectionID"];
  id v9 = (id)[v4 appendObject:self->_context withName:@"context"];
  return v4;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (NSString)publisherBulletinID
{
  return self->_publisherBulletinID;
}

- (void)setPublisherBulletinID:(id)a3
{
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_publisherBulletinID, 0);
}

@end