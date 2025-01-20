@interface CKGroupUpdate
- (CKGroupUpdate)initWithType:(int64_t)a3 handleID:(id)a4;
- (NSString)handleID;
- (id)description;
- (int64_t)groupUpdateType;
- (void)setGroupUpdateType:(int64_t)a3;
- (void)setHandleID:(id)a3;
@end

@implementation CKGroupUpdate

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(CKGroupUpdate *)self groupUpdateType];
  v5 = [(CKGroupUpdate *)self handleID];
  v6 = [v3 stringWithFormat:@"[CKGroupUpdate type:%lu handleID:%@ ]", v4, v5];

  return v6;
}

- (CKGroupUpdate)initWithType:(int64_t)a3 handleID:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CKGroupUpdate;
  v7 = [(CKGroupUpdate *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(CKGroupUpdate *)v7 setGroupUpdateType:a3];
    [(CKGroupUpdate *)v8 setHandleID:v6];
  }

  return v8;
}

- (int64_t)groupUpdateType
{
  return self->_groupUpdateType;
}

- (void)setGroupUpdateType:(int64_t)a3
{
  self->_groupUpdateType = a3;
}

- (NSString)handleID
{
  return self->_handleID;
}

- (void)setHandleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end