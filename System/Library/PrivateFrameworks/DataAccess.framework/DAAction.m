@interface DAAction
+ (BOOL)supportsSecureCoding;
- (BOOL)ignoresGuardianRestrictions;
- (BOOL)isEqual:(id)a3;
- (DAAction)initWithCoder:(id)a3;
- (DAAction)initWithItemChangeType:(unint64_t)a3 changedItem:(id)a4 serverId:(id)a5;
- (DAAction)initWithItemChangeType:(unint64_t)a3 changedItem:(id)a4 serverId:(id)a5 instanceId:(id)a6;
- (id)changedItem;
- (id)description;
- (id)forwardedAttendeeUUIDs;
- (id)forwardedAttendees;
- (id)instanceId;
- (id)serverId;
- (id)stringForItemChangeType:(unint64_t)a3;
- (int)changeId;
- (unint64_t)hash;
- (unint64_t)itemChangeType;
- (void)_setChangedItem:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setChangeId:(int)a3;
- (void)setForwardedAttendeeUUIDs:(id)a3;
- (void)setForwardedAttendees:(id)a3;
- (void)setIgnoresGuardianRestrictions:(BOOL)a3;
- (void)setInstanceId:(id)a3;
- (void)setItemChangeType:(unint64_t)a3;
- (void)setServerId:(id)a3;
@end

@implementation DAAction

- (DAAction)initWithItemChangeType:(unint64_t)a3 changedItem:(id)a4 serverId:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DAAction;
  v11 = [(DAAction *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_itemChangeType = a3;
    objc_storeStrong(&v11->_changedItem, a4);
    objc_storeStrong(&v12->_serverId, a5);
    v12->_changeId = -1;
  }

  return v12;
}

- (DAAction)initWithItemChangeType:(unint64_t)a3 changedItem:(id)a4 serverId:(id)a5 instanceId:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)DAAction;
  objc_super v14 = [(DAAction *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_itemChangeType = a3;
    objc_storeStrong(&v14->_changedItem, a4);
    objc_storeStrong(&v15->_serverId, a5);
    objc_storeStrong(&v15->_instanceId, a6);
    v15->_changeId = -1;
  }

  return v15;
}

- (id)stringForItemChangeType:(unint64_t)a3
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown (%lu)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E62118D0[a3];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DAAction *)self stringForItemChangeType:[(DAAction *)self itemChangeType]];
  v6 = [(DAAction *)self changedItem];
  v7 = [(DAAction *)self serverId];
  if ([(DAAction *)self changeId] == -1)
  {
    id v9 = [v3 stringWithFormat:@"<%@: %p> { Change type: %@, ChangedItem: %@ serverId: %@%@}", v4, self, v5, v6, v7, &stru_1F13DB4B0];
  }
  else
  {
    v8 = [NSString stringWithFormat:@", Change id: %d", -[DAAction changeId](self, "changeId")];
    id v9 = [v3 stringWithFormat:@"<%@: %p> { Change type: %@, ChangedItem: %@ serverId: %@%@}", v4, self, v5, v6, v7, v8];
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAAction)initWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"DAAction.m" lineNumber:76 description:@"Who does non-keyed coding nowadays?"];
  }
  v14.receiver = self;
  v14.super_class = (Class)DAAction;
  v6 = [(DAAction *)&v14 init];
  if (v6)
  {
    -[DAAction setItemChangeType:](v6, "setItemChangeType:", (int)[v5 decodeIntForKey:@"DAAItemChangeType"]);
    Class v7 = NSClassFromString(&cfstr_Aschangedcolle.isa);
    v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), v7, 0);
    id v9 = [v5 decodeObjectOfClasses:v8 forKey:@"DAAChangedItem"];
    [(DAAction *)v6 _setChangedItem:v9];

    id v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"DAAServerId"];
    [(DAAction *)v6 setServerId:v10];

    id v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"DAAInstanceId"];
    [(DAAction *)v6 setInstanceId:v11];

    -[DAAction setChangeId:](v6, "setChangeId:", [v5 decodeIntForKey:@"DAAChangeId"]);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  if (([v9 allowsKeyedCoding] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"DAAction.m" lineNumber:90 description:@"Who does non-keyed coding nowadays?"];
  }
  objc_msgSend(v9, "encodeInt:forKey:", -[DAAction itemChangeType](self, "itemChangeType"), @"DAAItemChangeType");
  id v5 = [(DAAction *)self changedItem];
  [v9 encodeObject:v5 forKey:@"DAAChangedItem"];

  v6 = [(DAAction *)self serverId];
  [v9 encodeObject:v6 forKey:@"DAAServerId"];

  Class v7 = [(DAAction *)self instanceId];
  [v9 encodeObject:v7 forKey:@"DAAInstanceId"];

  objc_msgSend(v9, "encodeInt:forKey:", -[DAAction changeId](self, "changeId"), @"DAAChangeId");
}

- (unint64_t)hash
{
  v3 = [(DAAction *)self changedItem];
  uint64_t v4 = [v3 hash];
  id v5 = [(DAAction *)self serverId];
  unint64_t v6 = [v5 hash] + v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v8 = (DAAction *)a3;
  if (self == v8)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      uint64_t v10 = [(DAAction *)v9 itemChangeType];
      if (v10 != [(DAAction *)self itemChangeType])
      {
        LOBYTE(v14) = 1;
LABEL_28:
        char v15 = v14 ^ 1;

        goto LABEL_29;
      }
      id v11 = [(DAAction *)v9 changedItem];
      if (v11
        || ([(DAAction *)self changedItem], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v5 = [(DAAction *)v9 changedItem];
        v3 = [(DAAction *)self changedItem];
        int v12 = [v5 isEqual:v3];
        int v13 = 1;
        LOBYTE(v14) = 1;
        if (!v12) {
          goto LABEL_24;
        }
      }
      else
      {
        int v13 = 0;
      }
      int v24 = v13;
      v23 = v3;
      v16 = [(DAAction *)v9 serverId];
      if (v16 || ([(DAAction *)self serverId], (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        unint64_t v6 = [(DAAction *)v9 serverId];
        v3 = [(DAAction *)self serverId];
        int v14 = 1;
        if (![v6 isEqual:v3]) {
          goto LABEL_19;
        }
      }
      else
      {
        v21 = 0;
        int v14 = 0;
      }
      v22 = v5;
      objc_super v17 = v4;
      int v18 = v14;
      int v14 = [(DAAction *)v9 changeId];
      LOBYTE(v14) = v14 != [(DAAction *)self changeId];
      if (!v18)
      {
        uint64_t v4 = v17;
        id v5 = v22;
        if (v16)
        {
LABEL_20:

          if (v24)
          {
            v3 = v23;
LABEL_24:
          }
LABEL_25:
          if (!v11) {

          }
          goto LABEL_28;
        }
LABEL_23:

        v3 = v23;
        if (v24) {
          goto LABEL_24;
        }
        goto LABEL_25;
      }
      uint64_t v4 = v17;
      id v5 = v22;
LABEL_19:

      if (v16) {
        goto LABEL_20;
      }
      goto LABEL_23;
    }
    char v15 = 0;
  }
LABEL_29:

  return v15;
}

- (unint64_t)itemChangeType
{
  return self->_itemChangeType;
}

- (void)setItemChangeType:(unint64_t)a3
{
  self->_itemChangeType = a3;
}

- (id)serverId
{
  return self->_serverId;
}

- (void)setServerId:(id)a3
{
}

- (id)instanceId
{
  return self->_instanceId;
}

- (void)setInstanceId:(id)a3
{
}

- (id)changedItem
{
  return self->_changedItem;
}

- (void)_setChangedItem:(id)a3
{
}

- (int)changeId
{
  return self->_changeId;
}

- (void)setChangeId:(int)a3
{
  self->_changeId = a3;
}

- (id)forwardedAttendees
{
  return self->_forwardedAttendees;
}

- (void)setForwardedAttendees:(id)a3
{
}

- (id)forwardedAttendeeUUIDs
{
  return self->_forwardedAttendeeUUIDs;
}

- (void)setForwardedAttendeeUUIDs:(id)a3
{
}

- (BOOL)ignoresGuardianRestrictions
{
  return self->_ignoresGuardianRestrictions;
}

- (void)setIgnoresGuardianRestrictions:(BOOL)a3
{
  self->_ignoresGuardianRestrictions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_forwardedAttendeeUUIDs, 0);
  objc_storeStrong(&self->_forwardedAttendees, 0);
  objc_storeStrong(&self->_changedItem, 0);
  objc_storeStrong(&self->_instanceId, 0);
  objc_storeStrong(&self->_serverId, 0);
}

@end