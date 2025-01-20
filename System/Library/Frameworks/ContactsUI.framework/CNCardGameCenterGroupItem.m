@interface CNCardGameCenterGroupItem
- (CNCardGameCenterGroupItem)initWithRelationshipResult:(id)a3;
- (GKContactRelationshipResult)relationshipResult;
- (void)setRelationshipResult:(id)a3;
@end

@implementation CNCardGameCenterGroupItem

- (void).cxx_destruct
{
}

- (void)setRelationshipResult:(id)a3
{
}

- (GKContactRelationshipResult)relationshipResult
{
  return self->_relationshipResult;
}

- (CNCardGameCenterGroupItem)initWithRelationshipResult:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNCardGameCenterGroupItem;
  v6 = [(CNCardGameCenterGroupItem *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_relationshipResult, a3);
    v8 = v7;
  }

  return v7;
}

@end