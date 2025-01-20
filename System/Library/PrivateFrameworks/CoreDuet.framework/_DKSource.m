@interface _DKSource
+ (BOOL)supportsSecureCoding;
+ (id)defaultSourceID;
+ (id)entityName;
+ (id)fromPBCodable:(id)a3;
+ (id)intentsSourceID;
+ (id)sourceForInteraction:(id)a3 bundleID:(id)a4;
+ (id)sourceForSearchableItem:(id)a3 bundleID:(id)a4;
+ (id)spotlightSourceID;
- (BOOL)isEqual:(id)a3;
- (NSNumber)userID;
- (NSString)bundleID;
- (NSString)description;
- (NSString)deviceID;
- (NSString)groupID;
- (NSString)intentID;
- (NSString)itemID;
- (NSString)sourceID;
- (NSString)syncDeviceID;
- (_DKSource)initWithCoder:(id)a3;
- (_DKSource)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 itemIdentifier:(id)a5 groupIdentifier:(id)a6 deviceIdentifier:(id)a7 userIdentifier:(id)a8;
- (_DKSource)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 itemIdentifier:(id)a5 groupIdentifier:(id)a6 deviceIdentifier:(id)a7 userIdentifier:(id)a8 intentIdentifier:(id)a9;
- (id)toPBCodable;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setIntentID:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation _DKSource

+ (id)intentsSourceID
{
  return @"intents";
}

+ (id)spotlightSourceID
{
  return @"spotlight";
}

+ (id)defaultSourceID
{
  return @"default";
}

- (NSString)syncDeviceID
{
  v2 = [(_DKSource *)self deviceID];
  v3 = +[_DKKnowledgeStorage sourceDeviceIdentityFromDeviceID:]((uint64_t)_DKKnowledgeStorage, v2);

  return (NSString *)v3;
}

- (_DKSource)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 itemIdentifier:(id)a5 groupIdentifier:(id)a6 deviceIdentifier:(id)a7 userIdentifier:(id)a8
{
  return [(_DKSource *)self initWithIdentifier:a3 bundleIdentifier:a4 itemIdentifier:a5 groupIdentifier:a6 deviceIdentifier:a7 userIdentifier:a8 intentIdentifier:0];
}

- (_DKSource)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 itemIdentifier:(id)a5 groupIdentifier:(id)a6 deviceIdentifier:(id)a7 userIdentifier:(id)a8 intentIdentifier:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)_DKSource;
  v18 = [(_DKSource *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sourceID, a3);
    objc_storeStrong((id *)&v19->_bundleID, a4);
    objc_storeStrong((id *)&v19->_itemID, a5);
    objc_storeStrong((id *)&v19->_groupID, a6);
    objc_storeStrong((id *)&v19->_deviceID, a7);
    objc_storeStrong((id *)&v19->_userID, a8);
    objc_storeStrong((id *)&v19->_intentID, a9);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DKSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_DKSource;
  v5 = [(_DKSource *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sourceID"];
    sourceID = v5->_sourceID;
    v5->_sourceID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_itemID"];
    itemID = v5->_itemID;
    v5->_itemID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_groupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_deviceID"];
    deviceID = v5->_deviceID;
    v5->_deviceID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userID"];
    userID = v5->_userID;
    v5->_userID = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_intentID"];
    intentID = v5->_intentID;
    v5->_intentID = (NSString *)v18;

    v20 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sourceID = self->_sourceID;
  id v5 = a3;
  [v5 encodeObject:sourceID forKey:@"_sourceID"];
  [v5 encodeObject:self->_bundleID forKey:@"_bundleID"];
  [v5 encodeObject:self->_itemID forKey:@"_itemID"];
  [v5 encodeObject:self->_groupID forKey:@"_groupID"];
  [v5 encodeObject:self->_deviceID forKey:@"_deviceID"];
  [v5 encodeObject:self->_userID forKey:@"_userID"];
  [v5 encodeObject:self->_intentID forKey:@"_intentID"];
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(_DKSource *)self sourceID];
  id v5 = [(_DKSource *)self bundleID];
  uint64_t v6 = [(_DKSource *)self itemID];
  v7 = [(_DKSource *)self groupID];
  uint64_t v8 = [(_DKSource *)self deviceID];
  v9 = [(_DKSource *)self userID];
  uint64_t v10 = [(_DKSource *)self intentID];
  v11 = [v3 stringWithFormat:@"{%@, %@, %@, %@, %@, %@, %@}", v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (_DKSource *)a3;
  uint64_t v6 = v5;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = v6;
        uint64_t v8 = [(_DKSource *)self sourceID];
        v9 = [(_DKSource *)v7 sourceID];
        if (v8 != v9)
        {
          uint64_t v10 = [(_DKSource *)self sourceID];
          v49 = [(_DKSource *)v7 sourceID];
          v50 = v10;
          if (!objc_msgSend(v10, "isEqualToString:"))
          {
            char v11 = 0;
            goto LABEL_37;
          }
        }
        uint64_t v12 = [(_DKSource *)self bundleID];
        v13 = [(_DKSource *)v7 bundleID];
        if (v12 != v13)
        {
          v3 = [(_DKSource *)self bundleID];
          v48 = [(_DKSource *)v7 bundleID];
          if (!objc_msgSend(v3, "isEqualToString:"))
          {
            char v11 = 0;
LABEL_35:

LABEL_36:
            if (v8 == v9)
            {
LABEL_38:

              goto LABEL_39;
            }
LABEL_37:

            goto LABEL_38;
          }
        }
        uint64_t v14 = [(_DKSource *)self itemID];
        uint64_t v15 = [(_DKSource *)v7 itemID];
        v47 = (void *)v14;
        BOOL v16 = v14 == v15;
        id v17 = (void *)v15;
        if (!v16)
        {
          uint64_t v18 = [(_DKSource *)self itemID];
          v42 = [(_DKSource *)v7 itemID];
          v43 = v18;
          if (!objc_msgSend(v18, "isEqualToString:"))
          {
            char v11 = 0;
            v19 = v47;
LABEL_33:

LABEL_34:
            if (v12 == v13) {
              goto LABEL_36;
            }
            goto LABEL_35;
          }
        }
        uint64_t v20 = [(_DKSource *)self groupID];
        uint64_t v45 = [(_DKSource *)v7 groupID];
        v46 = (void *)v20;
        v44 = v17;
        if (v20 == v45)
        {
          v38 = v13;
        }
        else
        {
          id v21 = v3;
          objc_super v22 = [(_DKSource *)self groupID];
          v40 = [(_DKSource *)v7 groupID];
          v41 = v22;
          if (!objc_msgSend(v22, "isEqualToString:"))
          {
            char v11 = 0;
            id v25 = (void *)v45;
            v3 = v21;
LABEL_31:

LABEL_32:
            id v17 = v44;
            v19 = v47;
            if (v47 == v44) {
              goto LABEL_34;
            }
            goto LABEL_33;
          }
          v38 = v13;
          v3 = v21;
        }
        id v23 = [(_DKSource *)self deviceID];
        uint64_t v39 = [(_DKSource *)v7 deviceID];
        if (v23 == (void *)v39)
        {
          v34 = v3;
          v35 = v12;
        }
        else
        {
          id v24 = [(_DKSource *)self deviceID];
          v36 = [(_DKSource *)v7 deviceID];
          v37 = v24;
          if (!objc_msgSend(v24, "isEqualToString:"))
          {
            char v11 = 0;
            v13 = v38;
            v31 = (void *)v39;
            goto LABEL_29;
          }
          v34 = v3;
          v35 = v12;
        }
        objc_super v26 = [(_DKSource *)self userID];
        uint64_t v27 = [(_DKSource *)v7 userID];
        if (v26 == (void *)v27)
        {

          char v11 = 1;
        }
        else
        {
          v28 = (void *)v27;
          [(_DKSource *)self userID];
          v29 = v33 = v23;
          v30 = [(_DKSource *)v7 userID];
          char v11 = [v29 isEqualToNumber:v30];

          id v23 = v33;
        }
        v13 = v38;
        v31 = (void *)v39;
        v3 = v34;
        uint64_t v12 = v35;
        if (v23 == (void *)v39)
        {
LABEL_30:

          id v25 = (void *)v45;
          if (v46 == (void *)v45) {
            goto LABEL_32;
          }
          goto LABEL_31;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    char v11 = 0;
  }
LABEL_39:

  return v11;
}

- (NSString)sourceID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)itemID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceID:(id)a3
{
}

- (NSNumber)userID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUserID:(id)a3
{
}

- (NSString)intentID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIntentID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
}

+ (id)sourceForInteraction:(id)a3 bundleID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 identifier];
  v9 = [v7 groupIdentifier];
  uint64_t v10 = [_DKSource alloc];
  char v11 = [a1 intentsSourceID];
  uint64_t v12 = [v7 intent];

  v13 = [v12 identifier];
  uint64_t v14 = [(_DKSource *)v10 initWithIdentifier:v11 bundleIdentifier:v6 itemIdentifier:v8 groupIdentifier:v9 deviceIdentifier:0 userIdentifier:0 intentIdentifier:v13];

  return v14;
}

- (id)toPBCodable
{
  v3 = objc_alloc_init(_DKPRSource);
  id v4 = [(_DKSource *)self sourceID];
  -[_DKPRSource setSourceID:]((uint64_t)v3, v4);

  id v5 = [(_DKSource *)self bundleID];
  -[_DKPRSource setBundleID:]((uint64_t)v3, v5);

  id v6 = [(_DKSource *)self itemID];
  -[_DKPRSource setItemID:]((uint64_t)v3, v6);

  id v7 = [(_DKSource *)self groupID];
  -[_DKPRSource setGroupID:]((uint64_t)v3, v7);

  uint64_t v8 = [(_DKSource *)self deviceID];
  -[_DKPRSource setDeviceID:]((uint64_t)v3, v8);

  v9 = [(_DKSource *)self userID];
  -[_DKPRSource setUserID:]((uint64_t)v3, [v9 intValue]);

  return v3;
}

+ (id)fromPBCodable:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [_DKSource alloc];
    id v6 = -[_DKPRSource sourceID]((uint64_t)v4);
    id v7 = -[_DKPRSource bundleID]((uint64_t)v4);
    uint64_t v8 = -[_DKPRSource itemID]((uint64_t)v4);
    v9 = -[_DKPRSource groupID]((uint64_t)v4);
    uint64_t v10 = -[_DKPRSource deviceID]((uint64_t)v4);
    char v11 = NSNumber;
    uint64_t v12 = -[_DKPRSource userID]((uint64_t)v4);

    v13 = [v11 numberWithInt:v12];
    uint64_t v14 = [(_DKSource *)v5 initWithIdentifier:v6 bundleIdentifier:v7 itemIdentifier:v8 groupIdentifier:v9 deviceIdentifier:v10 userIdentifier:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)entityName
{
  return @"Source";
}

+ (id)sourceForSearchableItem:(id)a3 bundleID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 uniqueIdentifier];
  v9 = [v7 domainIdentifier];

  uint64_t v10 = [_DKSource alloc];
  char v11 = [a1 spotlightSourceID];
  uint64_t v12 = [(_DKSource *)v10 initWithIdentifier:v11 bundleIdentifier:v6 itemIdentifier:v8 groupIdentifier:v9 deviceIdentifier:0 userIdentifier:0];

  return v12;
}

@end