@interface CNUIGroupContext
- (CNUIGroupContext)initWithAddedGroupsByContainerDict:(id)a3 removedGroups:(id)a4;
- (NSArray)removedGroups;
- (NSDictionary)addedGroupsByContainerDict;
@end

@implementation CNUIGroupContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedGroups, 0);

  objc_storeStrong((id *)&self->_addedGroupsByContainerDict, 0);
}

- (NSArray)removedGroups
{
  return self->_removedGroups;
}

- (NSDictionary)addedGroupsByContainerDict
{
  return self->_addedGroupsByContainerDict;
}

- (CNUIGroupContext)initWithAddedGroupsByContainerDict:(id)a3 removedGroups:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNUIGroupContext;
  v9 = [(CNUIGroupContext *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_addedGroupsByContainerDict, a3);
    objc_storeStrong((id *)&v10->_removedGroups, a4);
    v11 = v10;
  }

  return v10;
}

@end