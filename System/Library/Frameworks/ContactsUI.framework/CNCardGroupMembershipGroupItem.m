@interface CNCardGroupMembershipGroupItem
- (CNCardGroupMembershipGroupItem)initWithGroup:(id)a3;
- (CNGroup)group;
- (void)setGroup:(id)a3;
@end

@implementation CNCardGroupMembershipGroupItem

- (void).cxx_destruct
{
}

- (void)setGroup:(id)a3
{
}

- (CNGroup)group
{
  return self->_group;
}

- (CNCardGroupMembershipGroupItem)initWithGroup:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNCardGroupMembershipGroupItem;
  v6 = [(CNCardGroupMembershipGroupItem *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_group, a3);
    v8 = v7;
  }

  return v7;
}

@end