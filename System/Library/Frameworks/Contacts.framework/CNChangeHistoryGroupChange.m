@interface CNChangeHistoryGroupChange
+ (BOOL)supportsSecureCoding;
- (CNChangeHistoryAnchor)changeAnchor;
- (CNChangeHistoryGroupChange)initWithCoder:(id)a3;
- (CNChangeHistoryGroupChange)initWithIdentifier:(id)a3 changeType:(int64_t)a4 changeAnchor:(id)a5 changeID:(id)a6 externalID:(id)a7;
- (CNGroup)group;
- (NSNumber)changeID;
- (NSString)externalID;
- (NSString)externalModificationTag;
- (NSString)externalURI;
- (NSString)groupIdentifier;
- (id)description;
- (int64_t)changeType;
- (void)encodeWithCoder:(id)a3;
- (void)setChangeAnchor:(id)a3;
- (void)setChangeID:(id)a3;
- (void)setChangeType:(int64_t)a3;
- (void)setExternalID:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setExternalURI:(id)a3;
- (void)setGroup:(id)a3;
@end

@implementation CNChangeHistoryGroupChange

- (CNChangeHistoryGroupChange)initWithIdentifier:(id)a3 changeType:(int64_t)a4 changeAnchor:(id)a5 changeID:(id)a6 externalID:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)CNChangeHistoryGroupChange;
  v16 = [(CNChangeHistoryGroupChange *)&v27 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    groupIdentifier = v16->_groupIdentifier;
    v16->_groupIdentifier = (NSString *)v17;

    v16->_changeType = a4;
    uint64_t v19 = [v13 copy];
    changeAnchor = v16->_changeAnchor;
    v16->_changeAnchor = (CNChangeHistoryAnchor *)v19;

    uint64_t v21 = [v14 copy];
    changeID = v16->_changeID;
    v16->_changeID = (NSNumber *)v21;

    uint64_t v23 = [v15 copy];
    externalID = v16->_externalID;
    v16->_externalID = (NSString *)v23;

    v25 = v16;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryGroupChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNChangeHistoryGroupChange;
  v5 = [(CNChangeHistoryGroupChange *)&v20 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_groupIdentifier"];
    uint64_t v7 = [v6 copy];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v7;

    v5->_changeType = [v4 decodeIntegerForKey:@"_changeType"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_changeAnchor"];
    uint64_t v10 = [v9 copy];
    changeAnchor = v5->_changeAnchor;
    v5->_changeAnchor = (CNChangeHistoryAnchor *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_changeID"];
    uint64_t v13 = [v12 copy];
    changeID = v5->_changeID;
    v5->_changeID = (NSNumber *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_externalID"];
    uint64_t v16 = [v15 copy];
    externalID = v5->_externalID;
    v5->_externalID = (NSString *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  groupIdentifier = self->_groupIdentifier;
  id v5 = a3;
  [v5 encodeObject:groupIdentifier forKey:@"_groupIdentifier"];
  [v5 encodeInteger:self->_changeType forKey:@"_changeType"];
  [v5 encodeObject:self->_changeAnchor forKey:@"_changeAnchor"];
  [v5 encodeObject:self->_changeID forKey:@"_changeID"];
  [v5 encodeObject:self->_externalID forKey:@"_externalID"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F5A3A8];
  id v4 = [(CNChangeHistoryGroupChange *)self groupIdentifier];
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CNChangeHistoryGroupChange changeType](self, "changeType"));
  v6 = [(CNChangeHistoryGroupChange *)self changeAnchor];
  uint64_t v7 = [(CNChangeHistoryGroupChange *)self changeID];
  v8 = [(CNChangeHistoryGroupChange *)self externalID];
  v9 = [(CNChangeHistoryGroupChange *)self group];
  uint64_t v10 = objc_msgSend(v3, "descriptionForObject:withNamesAndObjects:", self, @"groupIdentifier", v4, @"changeType", v5, @"changeAnchor", v6, @"changeID", v7, @"externalID", v8, @"group", v9, 0);

  return v10;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

- (CNGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (CNChangeHistoryAnchor)changeAnchor
{
  return self->_changeAnchor;
}

- (void)setChangeAnchor:(id)a3
{
}

- (NSNumber)changeID
{
  return self->_changeID;
}

- (void)setChangeID:(id)a3
{
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void)setExternalID:(id)a3
{
}

- (NSString)externalURI
{
  return self->_externalURI;
}

- (void)setExternalURI:(id)a3
{
}

- (NSString)externalModificationTag
{
  return self->_externalModificationTag;
}

- (void)setExternalModificationTag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalModificationTag, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_changeID, 0);
  objc_storeStrong((id *)&self->_changeAnchor, 0);
  objc_storeStrong((id *)&self->_group, 0);

  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end