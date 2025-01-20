@interface KCSharingGroupUpdateInfo
+ (BOOL)supportsSecureCoding;
- (KCSharingGroup)updatedGroup;
- (KCSharingGroupUpdateInfo)initWithCoder:(id)a3;
- (KCSharingGroupUpdateInfo)initWithDepartedGroupID:(id)a3;
- (KCSharingGroupUpdateInfo)initWithGroup:(id)a3 addedParticipants:(id)a4;
- (NSArray)addedParticipants;
- (NSString)departedGroupID;
- (id)description;
- (int64_t)updateType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation KCSharingGroupUpdateInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departedGroupID, 0);
  objc_storeStrong((id *)&self->_addedParticipants, 0);

  objc_storeStrong((id *)&self->_updatedGroup, 0);
}

- (NSString)departedGroupID
{
  return self->_departedGroupID;
}

- (NSArray)addedParticipants
{
  return self->_addedParticipants;
}

- (KCSharingGroup)updatedGroup
{
  return self->_updatedGroup;
}

- (int64_t)updateType
{
  return self->_updateType;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  int64_t updateType = self->_updateType;
  id v7 = a3;
  v6 = [v4 numberWithLongLong:updateType];
  [v7 encodeObject:v6 forKey:@"updateType"];

  [v7 encodeObject:self->_updatedGroup forKey:@"updatedGroup"];
  [v7 encodeObject:self->_addedParticipants forKey:@"addedParticipants"];
  [v7 encodeObject:self->_departedGroupID forKey:@"departedGroupID"];
}

- (KCSharingGroupUpdateInfo)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)KCSharingGroupUpdateInfo;
  v5 = [(KCSharingGroupUpdateInfo *)&v17 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateType"];
    v5->_int64_t updateType = [v6 integerValue];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updatedGroup"];
    updatedGroup = v5->_updatedGroup;
    v5->_updatedGroup = (KCSharingGroup *)v7;

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    v11 = [v9 setWithArray:v10];

    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"addedParticipants"];
    addedParticipants = v5->_addedParticipants;
    v5->_addedParticipants = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"departedGroupID"];
    departedGroupID = v5->_departedGroupID;
    v5->_departedGroupID = (NSString *)v14;
  }
  return v5;
}

- (id)description
{
  int64_t updateType = self->_updateType;
  if (updateType == 1)
  {
    uint64_t v7 = [NSString stringWithFormat:@"KCSharingGroupUpdateInfo(%@, departed group)", self->_departedGroupID];
  }
  else if (updateType)
  {
    uint64_t v7 = @"KCSharingGroupUpdateInfo(Unknown update type)";
  }
  else
  {
    id v4 = NSString;
    v5 = [(KCSharingGroup *)self->_updatedGroup groupID];
    v6 = [(KCSharingGroup *)self->_updatedGroup displayName];
    uint64_t v7 = [v4 stringWithFormat:@"KCSharingGroupUpdateInfo(%@, name: \"%@\", new participants: %@)", v5, v6, self->_addedParticipants];
  }

  return v7;
}

- (KCSharingGroupUpdateInfo)initWithDepartedGroupID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)KCSharingGroupUpdateInfo;
  v5 = [(KCSharingGroupUpdateInfo *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_int64_t updateType = 1;
    uint64_t v7 = [v4 copy];
    departedGroupID = v6->_departedGroupID;
    v6->_departedGroupID = (NSString *)v7;
  }
  return v6;
}

- (KCSharingGroupUpdateInfo)initWithGroup:(id)a3 addedParticipants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)KCSharingGroupUpdateInfo;
  v8 = [(KCSharingGroupUpdateInfo *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_int64_t updateType = 0;
    uint64_t v10 = [v6 copy];
    updatedGroup = v9->_updatedGroup;
    v9->_updatedGroup = (KCSharingGroup *)v10;

    uint64_t v12 = [v7 copy];
    addedParticipants = v9->_addedParticipants;
    v9->_addedParticipants = (NSArray *)v12;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end