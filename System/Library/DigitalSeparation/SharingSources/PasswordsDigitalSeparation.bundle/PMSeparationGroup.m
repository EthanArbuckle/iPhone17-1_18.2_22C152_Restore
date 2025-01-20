@interface PMSeparationGroup
- (KCSharingGroup)group;
- (NSArray)participants;
- (NSString)description;
- (NSString)displayDetail;
- (NSString)displayName;
- (PMSeparationGroup)initWithGroup:(id)a3 participants:(id)a4;
- (int64_t)visibility;
@end

@implementation PMSeparationGroup

- (PMSeparationGroup)initWithGroup:(id)a3 participants:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PMSeparationGroup;
  v9 = [(PMSeparationGroup *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_group, a3);
    uint64_t v11 = [v8 copy];
    participants = v10->_participants;
    v10->_participants = (NSArray *)v11;

    v13 = v10;
  }

  return v10;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(KCSharingGroup *)self->_group groupID];
  v6 = [v3 stringWithFormat:@"<%@: %p; groupID: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSString)displayName
{
  return (NSString *)MEMORY[0x270F9A6D0](self->_group, sel_displayName);
}

- (NSString)displayDetail
{
  return 0;
}

- (int64_t)visibility
{
  return 1;
}

- (NSArray)participants
{
  return self->_participants;
}

- (KCSharingGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);

  objc_storeStrong((id *)&self->_participants, 0);
}

@end