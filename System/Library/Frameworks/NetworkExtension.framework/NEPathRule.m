@interface NEPathRule
+ (BOOL)supportsSecureCoding;
- (BOOL)denyAll;
- (BOOL)denyCellularFallback;
- (BOOL)denyMulticast;
- (BOOL)isAggregateRule;
- (BOOL)isDefaultPathRule;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIdentifierExternal;
- (BOOL)multicastPreferenceSet;
- (BOOL)signingIdentifierAllowed:(id)a3 domainsOrAccountsRequired:(BOOL *)a4;
- (BOOL)supportsCellularBehavior:(int64_t)a3;
- (BOOL)supportsWiFiBehavior:(int64_t)a3;
- (NEPathRule)initWithCoder:(id)a3;
- (NSString)temporaryAllowMulticastNetworkName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initDefaultNonSystemPathRule;
- (id)initDefaultPathRule;
- (int64_t)cellularBehavior;
- (int64_t)wifiBehavior;
- (void)addCellularBehavior:(int64_t)a3 grade:(int64_t)a4;
- (void)addWiFiBehavior:(int64_t)a3 grade:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCellularBehavior:(int64_t)a3;
- (void)setDenyAll:(BOOL)a3;
- (void)setDenyCellularFallback:(BOOL)a3;
- (void)setDenyMulticast:(BOOL)a3;
- (void)setIsIdentifierExternal:(BOOL)a3;
- (void)setMulticastPreferenceSet:(BOOL)a3;
- (void)setTemporaryAllowMulticastNetworkName:(id)a3;
- (void)setWifiBehavior:(int64_t)a3;
@end

@implementation NEPathRule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NEPathRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NEPathRule;
  v5 = [(NEAppRule *)&v17 initWithCoder:v4];
  if (v5)
  {
    v5->_internalCellularBehavior = (int)[v4 decodeInt32ForKey:@"CellularBehavior"];
    v5->_denyCellularFallback = [v4 decodeBoolForKey:@"DenyCellularFallback"];
    v5->_denyMulticast = [v4 decodeBoolForKey:@"DenyMulticast"];
    v5->_multicastPreferenceSet = [v4 decodeBoolForKey:@"MulticastPreferenceSet"];
    v5->_isIdentifierExternal = [v4 decodeBoolForKey:@"IsIdentifierExternal"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AggregateEnterpriseCellularBehavior"];
    aggregateEnterpriseCellular = v5->_aggregateEnterpriseCellular;
    v5->_aggregateEnterpriseCellular = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AggregatePersonalCellularBehavior"];
    aggregatePersonalCellular = v5->_aggregatePersonalCellular;
    v5->_aggregatePersonalCellular = (NSNumber *)v8;

    v5->_internalWiFiBehavior = (int)[v4 decodeInt32ForKey:@"WiFiBehavior"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AggregateEnterpriseWiFiBehavior"];
    aggregateEnterpriseWiFi = v5->_aggregateEnterpriseWiFi;
    v5->_aggregateEnterpriseWiFi = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AggregatePersonalWiFiBehavior"];
    aggregatePersonalWiFi = v5->_aggregatePersonalWiFi;
    v5->_aggregatePersonalWiFi = (NSNumber *)v12;

    v5->_denyAll = [v4 decodeBoolForKey:@"DenyAll"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TemporaryAllowMulticastNetworkName"];
    temporaryAllowMulticastNetworkName = v5->_temporaryAllowMulticastNetworkName;
    v5->_temporaryAllowMulticastNetworkName = (NSString *)v14;
  }
  return v5;
}

- (BOOL)supportsCellularBehavior:(int64_t)a3
{
  if (!self) {
    return 1;
  }
  BOOL v5 = 1;
  if (objc_getProperty(self, a2, 96, 1))
  {
    uint64_t v7 = objc_msgSend(objc_getProperty(self, v6, 96, 1), "integerValue");
    return v7 != 1 && (a3 != 2 || v7 != 0);
  }
  return v5;
}

- (int64_t)wifiBehavior
{
  if (![(NEPathRule *)self isAggregateRule])
  {
    if (self) {
      return self->_internalWiFiBehavior;
    }
    else {
      return 0;
    }
  }
  if (self)
  {
    id Property = objc_getProperty(self, v3, 120, 1);
    id v6 = objc_getProperty(self, v5, 112, 1);
    if (Property)
    {
      if (v6)
      {
        int64_t v8 = objc_msgSend(objc_getProperty(self, v7, 120, 1), "integerValue");
        uint64_t v10 = objc_msgSend(objc_getProperty(self, v9, 112, 1), "integerValue");
        self;
        int64_t result = v8;
        if (v8 != v10)
        {
          int64_t result = 1;
          if (v8 != 1 && v10 != 1)
          {
            if (v10) {
              BOOL v12 = v8 == 0;
            }
            else {
              BOOL v12 = 1;
            }
            if (v12) {
              return 0;
            }
            else {
              return 2;
            }
          }
        }
        return result;
      }
      id v6 = objc_getProperty(self, v7, 120, 1);
    }
  }
  else
  {
    id v6 = 0;
  }

  return [v6 integerValue];
}

- (int64_t)cellularBehavior
{
  if (![(NEPathRule *)self isAggregateRule])
  {
    if (self) {
      return self->_internalCellularBehavior;
    }
    else {
      return 0;
    }
  }
  if (self)
  {
    id Property = objc_getProperty(self, v3, 96, 1);
    id v6 = objc_getProperty(self, v5, 88, 1);
    if (Property)
    {
      if (v6)
      {
        int64_t v8 = objc_msgSend(objc_getProperty(self, v7, 96, 1), "integerValue");
        uint64_t v10 = objc_msgSend(objc_getProperty(self, v9, 88, 1), "integerValue");
        self;
        int64_t result = v8;
        if (v8 != v10)
        {
          int64_t result = 1;
          if (v8 != 1 && v10 != 1)
          {
            if (v10) {
              BOOL v12 = v8 == 0;
            }
            else {
              BOOL v12 = 1;
            }
            if (v12) {
              return 0;
            }
            else {
              return 2;
            }
          }
        }
        return result;
      }
      id v6 = objc_getProperty(self, v7, 96, 1);
    }
  }
  else
  {
    id v6 = 0;
  }

  return [v6 integerValue];
}

- (BOOL)isAggregateRule
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = 1;
  if (!objc_getProperty(a1, a2, 96, 1) && !objc_getProperty(a1, v4, 88, 1) && !objc_getProperty(a1, v5, 120, 1)) {
    return objc_getProperty(a1, v6, 112, 1) != 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateEnterpriseWiFi, 0);
  objc_storeStrong((id *)&self->_aggregatePersonalWiFi, 0);
  objc_storeStrong((id *)&self->_aggregateEnterpriseCellular, 0);
  objc_storeStrong((id *)&self->_aggregatePersonalCellular, 0);

  objc_storeStrong((id *)&self->_temporaryAllowMulticastNetworkName, 0);
}

- (void)setDenyAll:(BOOL)a3
{
  self->_denyAll = a3;
}

- (BOOL)denyAll
{
  return self->_denyAll;
}

- (void)setIsIdentifierExternal:(BOOL)a3
{
  self->_isIdentifierExternal = a3;
}

- (BOOL)isIdentifierExternal
{
  return self->_isIdentifierExternal;
}

- (void)setMulticastPreferenceSet:(BOOL)a3
{
  self->_multicastPreferenceSet = a3;
}

- (BOOL)multicastPreferenceSet
{
  return self->_multicastPreferenceSet;
}

- (void)setTemporaryAllowMulticastNetworkName:(id)a3
{
}

- (NSString)temporaryAllowMulticastNetworkName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDenyMulticast:(BOOL)a3
{
  self->_denyMulticast = a3;
}

- (BOOL)denyMulticast
{
  return self->_denyMulticast;
}

- (void)setDenyCellularFallback:(BOOL)a3
{
  self->_denyCellularFallback = a3;
}

- (BOOL)denyCellularFallback
{
  return self->_denyCellularFallback;
}

- (BOOL)supportsWiFiBehavior:(int64_t)a3
{
  if (!self) {
    return 1;
  }
  BOOL v5 = 1;
  if (objc_getProperty(self, a2, 120, 1))
  {
    uint64_t v7 = objc_msgSend(objc_getProperty(self, v6, 120, 1), "integerValue");
    return v7 != 1 && (a3 != 2 || v7 != 0);
  }
  return v5;
}

- (void)addWiFiBehavior:(int64_t)a3 grade:(int64_t)a4
{
  if (a4 == 1)
  {
    if (self && objc_getProperty(self, a2, 120, 1))
    {
      uint64_t v15 = objc_msgSend(objc_getProperty(self, v14, 120, 1), "integerValue");
      v16 = NSNumber;
      self;
      uint64_t v17 = 1;
      if (v15) {
        BOOL v18 = a3 == 0;
      }
      else {
        BOOL v18 = 1;
      }
      uint64_t v19 = 2;
      if (v18) {
        uint64_t v19 = 0;
      }
      if (v15 == 1) {
        uint64_t v19 = 1;
      }
      if (a3 != 1) {
        uint64_t v17 = v19;
      }
      if (v15 == a3) {
        int64_t v20 = a3;
      }
      else {
        int64_t v20 = v17;
      }
      v13 = [v16 numberWithInteger:v20];
    }
    else
    {
      v13 = [NSNumber numberWithInteger:a3];
      if (!self) {
        goto LABEL_42;
      }
    }
    v21 = &OBJC_IVAR___NEPathRule__aggregateEnterpriseWiFi;
    goto LABEL_38;
  }
  if (a4 != 2) {
    return;
  }
  if (self && objc_getProperty(self, a2, 112, 1))
  {
    uint64_t v7 = objc_msgSend(objc_getProperty(self, v6, 112, 1), "integerValue");
    int64_t v8 = NSNumber;
    self;
    uint64_t v9 = 1;
    if (v7) {
      BOOL v10 = a3 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    uint64_t v11 = 2;
    if (v10) {
      uint64_t v11 = 0;
    }
    if (v7 == 1) {
      uint64_t v11 = 1;
    }
    if (a3 != 1) {
      uint64_t v9 = v11;
    }
    if (v7 == a3) {
      int64_t v12 = a3;
    }
    else {
      int64_t v12 = v9;
    }
    v13 = [v8 numberWithInteger:v12];
    goto LABEL_35;
  }
  v13 = [NSNumber numberWithInteger:a3];
  if (!self)
  {
LABEL_42:
    v22 = v13;
    goto LABEL_39;
  }
LABEL_35:
  v21 = &OBJC_IVAR___NEPathRule__aggregatePersonalWiFi;
LABEL_38:
  v22 = v13;
  objc_setProperty_atomic(self, v13, v13, *v21);
LABEL_39:
}

- (void)addCellularBehavior:(int64_t)a3 grade:(int64_t)a4
{
  if (a4 == 1)
  {
    if (self && objc_getProperty(self, a2, 96, 1))
    {
      uint64_t v15 = objc_msgSend(objc_getProperty(self, v14, 96, 1), "integerValue");
      v16 = NSNumber;
      self;
      uint64_t v17 = 1;
      if (v15) {
        BOOL v18 = a3 == 0;
      }
      else {
        BOOL v18 = 1;
      }
      uint64_t v19 = 2;
      if (v18) {
        uint64_t v19 = 0;
      }
      if (v15 == 1) {
        uint64_t v19 = 1;
      }
      if (a3 != 1) {
        uint64_t v17 = v19;
      }
      if (v15 == a3) {
        int64_t v20 = a3;
      }
      else {
        int64_t v20 = v17;
      }
      v13 = [v16 numberWithInteger:v20];
    }
    else
    {
      v13 = [NSNumber numberWithInteger:a3];
      if (!self) {
        goto LABEL_42;
      }
    }
    v21 = &OBJC_IVAR___NEPathRule__aggregateEnterpriseCellular;
    goto LABEL_38;
  }
  if (a4 != 2) {
    return;
  }
  if (self && objc_getProperty(self, a2, 88, 1))
  {
    uint64_t v7 = objc_msgSend(objc_getProperty(self, v6, 88, 1), "integerValue");
    int64_t v8 = NSNumber;
    self;
    uint64_t v9 = 1;
    if (v7) {
      BOOL v10 = a3 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    uint64_t v11 = 2;
    if (v10) {
      uint64_t v11 = 0;
    }
    if (v7 == 1) {
      uint64_t v11 = 1;
    }
    if (a3 != 1) {
      uint64_t v9 = v11;
    }
    if (v7 == a3) {
      int64_t v12 = a3;
    }
    else {
      int64_t v12 = v9;
    }
    v13 = [v8 numberWithInteger:v12];
    goto LABEL_35;
  }
  v13 = [NSNumber numberWithInteger:a3];
  if (!self)
  {
LABEL_42:
    v22 = v13;
    goto LABEL_39;
  }
LABEL_35:
  v21 = &OBJC_IVAR___NEPathRule__aggregatePersonalCellular;
LABEL_38:
  v22 = v13;
  objc_setProperty_atomic(self, v13, v13, *v21);
LABEL_39:
}

- (void)setWifiBehavior:(int64_t)a3
{
  BOOL v5 = [(NEPathRule *)self isAggregateRule];
  if (self)
  {
    if (!v5) {
      self->_internalWiFiBehavior = a3;
    }
  }
}

- (void)setCellularBehavior:(int64_t)a3
{
  BOOL v5 = [(NEPathRule *)self isAggregateRule];
  if (self)
  {
    if (!v5) {
      self->_internalCellularBehavior = a3;
    }
  }
}

- (BOOL)signingIdentifierAllowed:(id)a3 domainsOrAccountsRequired:(BOOL *)a4
{
  *a4 = 0;
  return 1;
}

- (id)description
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  [v3 appendString:@"{"];
  id v4 = [(NEAppRule *)self matchSigningIdentifier];
  [v3 appendPrettyObject:v4 withName:@"matchSigningIdentifier" andIndent:0 options:0];

  BOOL v5 = [(NEAppRule *)self matchPath];
  [v3 appendPrettyObject:v5 withName:@"matchPath" andIndent:0 options:0];

  objc_msgSend(v3, "appendPrettyInt:withName:andIndent:options:", -[NEPathRule cellularBehavior](self, "cellularBehavior"), @"cellularBehavior", 0, 0);
  objc_msgSend(v3, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule denyCellularFallback](self, "denyCellularFallback"), @"denyCellularFallback", 0, 0);
  objc_msgSend(v3, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule denyMulticast](self, "denyMulticast"), @"denyMulticast", 0, 0);
  id v6 = [(NEPathRule *)self temporaryAllowMulticastNetworkName];
  [v3 appendPrettyObject:v6 withName:@"temporaryAllowMulticastNetworkName" andIndent:0 options:0];

  objc_msgSend(v3, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule multicastPreferenceSet](self, "multicastPreferenceSet"), @"multicastPreferenceSet", 0, 0);
  objc_msgSend(v3, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule isIdentifierExternal](self, "isIdentifierExternal"), @"isIdentifierExternal", 0, 0);
  objc_msgSend(v3, "appendPrettyInt:withName:andIndent:options:", -[NEPathRule wifiBehavior](self, "wifiBehavior"), @"wifiBehavior", 0, 0);
  if ([(NEPathRule *)self isAggregateRule])
  {
    objc_msgSend(v3, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule supportsCellularBehavior:](self, "supportsCellularBehavior:", 0), @"supportsAllowCellular", 0, 0);
    objc_msgSend(v3, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule supportsCellularBehavior:](self, "supportsCellularBehavior:", 1), @"supportsDenyCellular", 0, 0);
    objc_msgSend(v3, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule supportsCellularBehavior:](self, "supportsCellularBehavior:", 2), @"supportsAllowCellularWhileRoaming", 0, 0);
  }
  objc_msgSend(v3, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule denyAll](self, "denyAll"), @"denyAll", 0, 0);
  [v3 appendString:@"\n}"];

  return v3;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  v12.receiver = self;
  v12.super_class = (Class)NEPathRule;
  int64_t v8 = [(NEAppRule *)&v12 descriptionWithIndent:v5 options:a4];
  uint64_t v9 = (void *)[v7 initWithString:v8];

  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NEPathRule cellularBehavior](self, "cellularBehavior"), @"cellularBehavior", v5, a4);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule denyCellularFallback](self, "denyCellularFallback"), @"denyCellularFallback", v5, a4);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule denyMulticast](self, "denyMulticast"), @"denyMulticast", v5, a4);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule multicastPreferenceSet](self, "multicastPreferenceSet"), @"multicastPreferenceSet", v5, a4);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule isIdentifierExternal](self, "isIdentifierExternal"), @"isIdentifierExternal", v5, a4);
  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NEPathRule wifiBehavior](self, "wifiBehavior"), @"wifiBehavior", v5, a4);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule denyAll](self, "denyAll"), @"denyAll", v5, a4);
  BOOL v10 = [(NEPathRule *)self temporaryAllowMulticastNetworkName];
  [v9 appendPrettyObject:v10 withName:@"temporaryAllowMulticastNetworkName" andIndent:0 options:a4];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)NEPathRule;
  id v4 = [(NEAppRule *)&v15 copyWithZone:a3];
  uint64_t v5 = v4;
  if (self)
  {
    int64_t internalCellularBehavior = self->_internalCellularBehavior;
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int64_t internalCellularBehavior = 0;
  if (v4) {
LABEL_3:
  }
    v4[13] = internalCellularBehavior;
LABEL_4:
  objc_msgSend(v4, "setDenyCellularFallback:", -[NEPathRule denyCellularFallback](self, "denyCellularFallback"));
  objc_msgSend(v5, "setDenyMulticast:", -[NEPathRule denyMulticast](self, "denyMulticast"));
  objc_msgSend(v5, "setMulticastPreferenceSet:", -[NEPathRule multicastPreferenceSet](self, "multicastPreferenceSet"));
  objc_msgSend(v5, "setIsIdentifierExternal:", -[NEPathRule isIdentifierExternal](self, "isIdentifierExternal"));
  if (self)
  {
    id Property = objc_getProperty(self, v7, 96, 1);
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id Property = 0;
  if (v5) {
LABEL_6:
  }
    objc_setProperty_atomic(v5, v7, Property, 96);
LABEL_7:
  if (self)
  {
    id v9 = objc_getProperty(self, v7, 88, 1);
    if (!v5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v9 = 0;
  if (v5) {
LABEL_9:
  }
    objc_setProperty_atomic(v5, v7, v9, 88);
LABEL_10:
  if (self)
  {
    int64_t internalWiFiBehavior = self->_internalWiFiBehavior;
    if (!v5) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  int64_t internalWiFiBehavior = 0;
  if (v5) {
LABEL_12:
  }
    v5[16] = internalWiFiBehavior;
LABEL_13:
  if (self)
  {
    id v11 = objc_getProperty(self, v7, 120, 1);
    if (!v5) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  id v11 = 0;
  if (v5) {
LABEL_15:
  }
    objc_setProperty_atomic(v5, v7, v11, 120);
LABEL_16:
  if (!self)
  {
    id v12 = 0;
    if (!v5) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  id v12 = objc_getProperty(self, v7, 112, 1);
  if (v5) {
LABEL_18:
  }
    objc_setProperty_atomic(v5, v7, v12, 112);
LABEL_19:
  objc_msgSend(v5, "setDenyAll:", -[NEPathRule denyAll](self, "denyAll", v12));
  v13 = [(NEPathRule *)self temporaryAllowMulticastNetworkName];
  [v5 setTemporaryAllowMulticastNetworkName:v13];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEPathRule;
  [(NEAppRule *)&v11 encodeWithCoder:v4];
  if (self)
  {
    [v4 encodeInt32:self->_internalCellularBehavior forKey:@"CellularBehavior"];
    objc_msgSend(v4, "encodeBool:forKey:", -[NEPathRule denyCellularFallback](self, "denyCellularFallback"), @"DenyCellularFallback");
    objc_msgSend(v4, "encodeBool:forKey:", -[NEPathRule denyMulticast](self, "denyMulticast"), @"DenyMulticast");
    objc_msgSend(v4, "encodeBool:forKey:", -[NEPathRule multicastPreferenceSet](self, "multicastPreferenceSet"), @"MulticastPreferenceSet");
    objc_msgSend(v4, "encodeBool:forKey:", -[NEPathRule isIdentifierExternal](self, "isIdentifierExternal"), @"IsIdentifierExternal");
    objc_msgSend(v4, "encodeObject:forKey:", objc_getProperty(self, v5, 96, 1), @"AggregateEnterpriseCellularBehavior");
    objc_msgSend(v4, "encodeObject:forKey:", objc_getProperty(self, v6, 88, 1), @"AggregatePersonalCellularBehavior");
    [v4 encodeInt32:self->_internalWiFiBehavior forKey:@"WiFiBehavior"];
    objc_msgSend(v4, "encodeObject:forKey:", objc_getProperty(self, v7, 120, 1), @"AggregateEnterpriseWiFiBehavior");
    id Property = objc_getProperty(self, v8, 112, 1);
  }
  else
  {
    [v4 encodeInt32:0 forKey:@"CellularBehavior"];
    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(0, "denyCellularFallback"), @"DenyCellularFallback");
    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(0, "denyMulticast"), @"DenyMulticast");
    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(0, "multicastPreferenceSet"), @"MulticastPreferenceSet");
    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(0, "isIdentifierExternal"), @"IsIdentifierExternal");
    [v4 encodeObject:0 forKey:@"AggregateEnterpriseCellularBehavior"];
    [v4 encodeObject:0 forKey:@"AggregatePersonalCellularBehavior"];
    [v4 encodeInt32:0 forKey:@"WiFiBehavior"];
    [v4 encodeObject:0 forKey:@"AggregateEnterpriseWiFiBehavior"];
    id Property = 0;
  }
  [v4 encodeObject:Property forKey:@"AggregatePersonalWiFiBehavior"];
  objc_msgSend(v4, "encodeBool:forKey:", -[NEPathRule denyAll](self, "denyAll"), @"DenyAll");
  BOOL v10 = [(NEPathRule *)self temporaryAllowMulticastNetworkName];
  [v4 encodeObject:v10 forKey:@"TemporaryAllowMulticastNetworkName"];
}

- (BOOL)isDefaultPathRule
{
  uint64_t v3 = [(NEAppRule *)self matchSigningIdentifier];
  if ([v3 isEqualToString:@"PathRuleDefaultIdentifier"])
  {
    char v4 = 1;
  }
  else
  {
    SEL v5 = [(NEAppRule *)self matchSigningIdentifier];
    char v4 = [v5 isEqualToString:@"PathRuleDefaultNonSystemIdentifier"];
  }
  return v4;
}

- (id)initDefaultNonSystemPathRule
{
  return [(NEAppRule *)self initWithSigningIdentifier:@"PathRuleDefaultNonSystemIdentifier"];
}

- (id)initDefaultPathRule
{
  return [(NEAppRule *)self initWithSigningIdentifier:@"PathRuleDefaultIdentifier"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    SEL v7 = [v4 matchSigningIdentifier];
    SEL v8 = [(NEAppRule *)self matchSigningIdentifier];
    if ([v7 isEqualToString:v8])
    {
      id v9 = [v4 matchPath];
      BOOL v10 = [(NEAppRule *)self matchPath];
      if ([v9 isEqualToString:v10])
      {
        objc_super v11 = [v4 temporaryAllowMulticastNetworkName];
        id v12 = [(NEPathRule *)self temporaryAllowMulticastNetworkName];
        if ([v11 isEqualToString:v12]
          && (v13 = [v4 cellularBehavior], v13 == -[NEPathRule cellularBehavior](self, "cellularBehavior"))&& (uint64_t v14 = objc_msgSend(v4, "wifiBehavior"), v14 == -[NEPathRule wifiBehavior](self, "wifiBehavior"))&& (v15 = objc_msgSend(v4, "isIdentifierExternal"), v15 == -[NEPathRule isIdentifierExternal](self, "isIdentifierExternal"))&& (v16 = objc_msgSend(v4, "denyMulticast"), v16 == -[NEPathRule denyMulticast](self, "denyMulticast"))&& (v17 = objc_msgSend(v4, "multicastPreferenceSet"), v17 == -[NEPathRule multicastPreferenceSet](self, "multicastPreferenceSet")))
        {
          int v19 = [v4 denyAll];
          int v6 = v19 ^ [(NEPathRule *)self denyAll] ^ 1;
        }
        else
        {
          LOBYTE(v6) = 0;
        }
      }
      else
      {
        LOBYTE(v6) = 0;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

@end