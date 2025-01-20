@interface CRKASMWorldBuildResultObject
- (CRKASMRoster)roster;
- (CRKASMWorldBuildResultObject)init;
- (CRKASMWorldBuildResultObject)initWithRoster:(id)a3 manageableLocations:(id)a4;
- (NSArray)manageableLocations;
@end

@implementation CRKASMWorldBuildResultObject

- (CRKASMWorldBuildResultObject)init
{
  return [(CRKASMWorldBuildResultObject *)self initWithRoster:0 manageableLocations:MEMORY[0x263EFFA68]];
}

- (CRKASMWorldBuildResultObject)initWithRoster:(id)a3 manageableLocations:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKASMWorldBuildResultObject;
  v9 = [(CRKASMWorldBuildResultObject *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_roster, a3);
    uint64_t v11 = [v8 copy];
    manageableLocations = v10->_manageableLocations;
    v10->_manageableLocations = (NSArray *)v11;
  }
  return v10;
}

- (CRKASMRoster)roster
{
  return self->_roster;
}

- (NSArray)manageableLocations
{
  return self->_manageableLocations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manageableLocations, 0);

  objc_storeStrong((id *)&self->_roster, 0);
}

@end