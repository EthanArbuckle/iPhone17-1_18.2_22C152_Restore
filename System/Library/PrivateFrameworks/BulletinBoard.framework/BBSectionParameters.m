@interface BBSectionParameters
+ (BOOL)supportsSecureCoding;
- (BBSectionIcon)icon;
- (BBSectionParameters)init;
- (BBSectionParameters)initWithCoder:(id)a3;
- (BBSectionSubtypeParameters)defaultSubtypeParameters;
- (BOOL)isEqual:(id)a3;
- (BOOL)orderSectionUsingRecencyDate;
- (BOOL)showsDateInFloatingLockScreenAlert;
- (BOOL)showsSubtitle;
- (BOOL)usesVariableLayout;
- (NSMutableDictionary)allSubtypeParameters;
- (NSString)displayName;
- (NSUUID)UUID;
- (id)allSubtypes;
- (id)parametersForSubtype:(int64_t)a3;
- (id)replacementObjectForCoder:(id)a3;
- (unint64_t)hash;
- (unint64_t)messageNumberOfLines;
- (void)encodeWithCoder:(id)a3;
- (void)setAllSubtypeParameters:(id)a3;
- (void)setDefaultSubtypeParameters:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIcon:(id)a3;
- (void)setMessageNumberOfLines:(unint64_t)a3;
- (void)setOrderSectionUsingRecencyDate:(BOOL)a3;
- (void)setShowsDateInFloatingLockScreenAlert:(BOOL)a3;
- (void)setShowsSubtitle:(BOOL)a3;
- (void)setUUID:(id)a3;
- (void)setUsesVariableLayout:(BOOL)a3;
@end

@implementation BBSectionParameters

- (BBSectionParameters)init
{
  v9.receiver = self;
  v9.super_class = (Class)BBSectionParameters;
  v2 = [(BBSectionParameters *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    [(BBSectionParameters *)v2 setUUID:v3];

    v4 = [[BBSectionSubtypeParameters alloc] initWithFallbackParameters:0];
    defaultSubtypeParameters = v2->_defaultSubtypeParameters;
    v2->_defaultSubtypeParameters = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    allSubtypeParameters = v2->_allSubtypeParameters;
    v2->_allSubtypeParameters = v6;

    [(BBSectionParameters *)v2 setMessageNumberOfLines:1];
    [(BBSectionSubtypeParameters *)v2->_defaultSubtypeParameters setCanBeSilencedByMenuButtonPress:1];
    [(BBSectionSubtypeParameters *)v2->_defaultSubtypeParameters setAllowsAutomaticRemovalFromLockScreen:1];
    [(BBSectionSubtypeParameters *)v2->_defaultSubtypeParameters setShouldDismissBulletinWhenClosed:1];
  }
  return v2;
}

- (id)parametersForSubtype:(int64_t)a3
{
  v5 = self->_allSubtypeParameters;
  objc_sync_enter(v5);
  v6 = [NSNumber numberWithInteger:a3];
  v7 = [(NSMutableDictionary *)self->_allSubtypeParameters objectForKey:v6];
  if (!v7)
  {
    v7 = [[BBSectionSubtypeParameters alloc] initWithFallbackParameters:self->_defaultSubtypeParameters];
    [(NSMutableDictionary *)self->_allSubtypeParameters setObject:v7 forKey:v6];
  }

  objc_sync_exit(v5);
  return v7;
}

- (id)allSubtypes
{
  v3 = self->_allSubtypeParameters;
  objc_sync_enter(v3);
  v4 = [(NSMutableDictionary *)self->_allSubtypeParameters allKeys];
  objc_sync_exit(v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BBSectionParameters *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v5 = v4;
      v6 = [(BBSectionParameters *)self UUID];
      v7 = [(BBSectionParameters *)v5 UUID];

      char v8 = BSEqualObjects();
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(BBSectionParameters *)self UUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBSectionParameters)initWithCoder:(id)a3
{
  v29[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BBSectionParameters;
  v5 = [(BBSectionParameters *)&v27 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    [(BBSectionParameters *)v5 setUUID:v6];

    v7 = v5;
    char v8 = [v7 bb_objectCache];
    v5 = [v8 cacheObject:v7];

    if (v5 == v7)
    {
      -[BBSectionParameters setShowsSubtitle:](v7, "setShowsSubtitle:", [v4 decodeBoolForKey:@"showsSubtitle"]);
      -[BBSectionParameters setMessageNumberOfLines:](v7, "setMessageNumberOfLines:", [v4 decodeIntegerForKey:@"messageNumberOfLines"]);
      -[BBSectionParameters setUsesVariableLayout:](v7, "setUsesVariableLayout:", [v4 decodeBoolForKey:@"usesVariableLayout"]);
      -[BBSectionParameters setOrderSectionUsingRecencyDate:](v7, "setOrderSectionUsingRecencyDate:", [v4 decodeBoolForKey:@"orderSectionUsingRecencyDate"]);
      -[BBSectionParameters setShowsDateInFloatingLockScreenAlert:](v7, "setShowsDateInFloatingLockScreenAlert:", [v4 decodeBoolForKey:@"showsDateInFloatingLockScreenAlert"]);
      objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultSubtypeParameters"];
      [(BBSectionParameters *)v7 setDefaultSubtypeParameters:v9];

      v10 = (void *)MEMORY[0x263EFFA08];
      v29[0] = objc_opt_class();
      v29[1] = objc_opt_class();
      v29[2] = objc_opt_class();
      v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
      v12 = [v10 setWithArray:v11];
      v13 = [v4 decodeObjectOfClasses:v12 forKey:@"allSubtypeParameters"];
      [(BBSectionParameters *)v7 setAllSubtypeParameters:v13];

      v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
      [(BBSectionParameters *)v7 setDisplayName:v14];

      v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
      [(BBSectionParameters *)v7 setIcon:v15];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v16 = v7->_allSubtypeParameters;
      uint64_t v17 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v24;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v24 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = -[NSMutableDictionary objectForKeyedSubscript:](v7->_allSubtypeParameters, "objectForKeyedSubscript:", *(void *)(*((void *)&v23 + 1) + 8 * v20), (void)v23);
            [v21 setFallbackParameters:v7->_defaultSubtypeParameters];

            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v18);
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = self->_allSubtypeParameters;
  objc_sync_enter(v4);
  v5 = [(BBSectionParameters *)self UUID];
  [v10 encodeObject:v5 forKey:@"UUID"];

  v6 = [(BBSectionParameters *)self defaultSubtypeParameters];
  [v10 encodeObject:v6 forKey:@"defaultSubtypeParameters"];

  v7 = [(BBSectionParameters *)self allSubtypeParameters];
  [v10 encodeObject:v7 forKey:@"allSubtypeParameters"];

  char v8 = [(BBSectionParameters *)self displayName];
  [v10 encodeObject:v8 forKey:@"displayName"];

  objc_super v9 = [(BBSectionParameters *)self icon];
  [v10 encodeObject:v9 forKey:@"icon"];

  objc_msgSend(v10, "encodeBool:forKey:", -[BBSectionParameters showsSubtitle](self, "showsSubtitle"), @"showsSubtitle");
  objc_msgSend(v10, "encodeInteger:forKey:", -[BBSectionParameters messageNumberOfLines](self, "messageNumberOfLines"), @"messageNumberOfLines");
  objc_msgSend(v10, "encodeBool:forKey:", -[BBSectionParameters usesVariableLayout](self, "usesVariableLayout"), @"usesVariableLayout");
  objc_msgSend(v10, "encodeBool:forKey:", -[BBSectionParameters orderSectionUsingRecencyDate](self, "orderSectionUsingRecencyDate"), @"orderSectionUsingRecencyDate");
  objc_msgSend(v10, "encodeBool:forKey:", -[BBSectionParameters showsDateInFloatingLockScreenAlert](self, "showsDateInFloatingLockScreenAlert"), @"showsDateInFloatingLockScreenAlert");
  objc_sync_exit(v4);
}

- (id)replacementObjectForCoder:(id)a3
{
  id v4 = [self bb_objectCache];
  v5 = [v4 cacheObject:self];

  return v5;
}

- (BOOL)showsSubtitle
{
  return self->_showsSubtitle;
}

- (void)setShowsSubtitle:(BOOL)a3
{
  self->_showsSubtitle = a3;
}

- (unint64_t)messageNumberOfLines
{
  return self->_messageNumberOfLines;
}

- (void)setMessageNumberOfLines:(unint64_t)a3
{
  self->_messageNumberOfLines = a3;
}

- (BOOL)usesVariableLayout
{
  return self->_usesVariableLayout;
}

- (void)setUsesVariableLayout:(BOOL)a3
{
  self->_usesVariableLayout = a3;
}

- (BOOL)orderSectionUsingRecencyDate
{
  return self->_orderSectionUsingRecencyDate;
}

- (void)setOrderSectionUsingRecencyDate:(BOOL)a3
{
  self->_orderSectionUsingRecencyDate = a3;
}

- (BOOL)showsDateInFloatingLockScreenAlert
{
  return self->_showsDateInFloatingLockScreenAlert;
}

- (void)setShowsDateInFloatingLockScreenAlert:(BOOL)a3
{
  self->_showsDateInFloatingLockScreenAlert = a3;
}

- (BBSectionSubtypeParameters)defaultSubtypeParameters
{
  return self->_defaultSubtypeParameters;
}

- (void)setDefaultSubtypeParameters:(id)a3
{
}

- (NSMutableDictionary)allSubtypeParameters
{
  return self->_allSubtypeParameters;
}

- (void)setAllSubtypeParameters:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (BBSectionIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_allSubtypeParameters, 0);
  objc_storeStrong((id *)&self->_defaultSubtypeParameters, 0);
}

@end