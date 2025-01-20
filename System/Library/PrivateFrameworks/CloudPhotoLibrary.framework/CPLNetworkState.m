@interface CPLNetworkState
- (BOOL)canUseNetwork;
- (BOOL)isCellular;
- (BOOL)isCellularRestricted;
- (BOOL)isConnected;
- (BOOL)isConstrained;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFunctionallyEqual:(id)a3;
- (BOOL)isInAirplaneMode;
- (CPLNetworkState)initWithNetworkPath:(id)a3 cellularRestricted:(BOOL)a4 inAirplaneMode:(BOOL)a5;
- (NSDictionary)plistDescription;
- (OS_nw_path)networkPath;
- (id)description;
@end

@implementation CPLNetworkState

- (void).cxx_destruct
{
}

- (OS_nw_path)networkPath
{
  return self->_networkPath;
}

- (BOOL)isInAirplaneMode
{
  return self->_inAirplaneMode;
}

- (BOOL)isCellularRestricted
{
  return self->_cellularRestricted;
}

- (BOOL)isFunctionallyEqual:(id)a3
{
  id v4 = a3;
  networkPath = self->_networkPath;
  uint64_t v6 = [v4 networkPath];

  LOBYTE(v7) = ((unint64_t)networkPath | v6) == 0;
  if (networkPath) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    int v9 = [(CPLNetworkState *)self isCellular];
    if (v9 == [v4 isCellular]
      && (!v9
       || (int v10 = [(CPLNetworkState *)self isCellularRestricted],
           v10 == [v4 isCellularRestricted]))
      && (int v11 = -[CPLNetworkState isConnected](self, "isConnected"), v11 == [v4 isConnected])&& (v12 = -[CPLNetworkState isConstrained](self, "isConstrained"), v12 == objc_msgSend(v4, "isConstrained")))
    {
      BOOL v14 = [(CPLNetworkState *)self isInAirplaneMode];
      int v7 = v14 ^ [v4 isInAirplaneMode] ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  networkPath = self->_networkPath;
  uint64_t v6 = [v4 networkPath];
  int v7 = (void *)v6;
  LOBYTE(v8) = ((unint64_t)networkPath | v6) == 0;
  if (networkPath) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    int v10 = [(CPLNetworkState *)self isConnected];
    if (v10 == [v4 isConnected]
      && (int v11 = -[CPLNetworkState isCellular](self, "isCellular"), v11 == [v4 isCellular])
      && (int v12 = [(CPLNetworkState *)self isConstrained],
          v12 == [v4 isConstrained])
      && (int v13 = [(CPLNetworkState *)self isCellularRestricted],
          v13 == [v4 isCellularRestricted]))
    {
      BOOL v15 = [(CPLNetworkState *)self isInAirplaneMode];
      int v8 = v15 ^ [v4 isInAirplaneMode] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return v8;
}

- (NSDictionary)plistDescription
{
  v10[4] = *MEMORY[0x1E4F143B8];
  if (self->_networkPath)
  {
    if ([(CPLNetworkState *)self isConnected])
    {
      v10[0] = @"connected";
      v9[0] = @"state";
      v9[1] = @"path";
      if ([(CPLNetworkState *)self isCellular])
      {
        v3 = @"cellular";
      }
      else
      {
        BOOL is_expensive = nw_path_is_expensive((nw_path_t)self->_networkPath);
        v3 = @"normal";
        if (is_expensive) {
          v3 = @"expensive";
        }
      }
      v10[1] = v3;
      v9[2] = @"saveData";
      if ([(CPLNetworkState *)self isConstrained]) {
        uint64_t v6 = &unk_1F0D910A0;
      }
      else {
        uint64_t v6 = &unk_1F0D910B8;
      }
      v10[2] = v6;
      v9[3] = @"airplane";
      if ([(CPLNetworkState *)self isInAirplaneMode]) {
        int v7 = &unk_1F0D910A0;
      }
      else {
        int v7 = &unk_1F0D910B8;
      }
      v10[3] = v7;
      id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
    }
    else
    {
      id v4 = &unk_1F0D91670;
    }
  }
  else
  {
    id v4 = &unk_1F0D91698;
  }
  return (NSDictionary *)v4;
}

- (id)description
{
  if (!self->_networkPath)
  {
    v5 = @"unknown network state";
    goto LABEL_22;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(CPLNetworkState *)self isInAirplaneMode]) {
    [v3 addObject:@"airplane mode"];
  }
  if ([(CPLNetworkState *)self isConnected])
  {
    if ([(CPLNetworkState *)self isCellular])
    {
      [v3 addObject:@"cellular"];
      if ([(CPLNetworkState *)self isCellularRestricted])
      {
        id v4 = @"restricted";
LABEL_13:
        [v3 addObject:v4];
      }
    }
    else if (nw_path_is_expensive((nw_path_t)self->_networkPath))
    {
      id v4 = @"expensive";
      goto LABEL_13;
    }
    if ([(CPLNetworkState *)self isConstrained]) {
      [v3 addObject:@"save data"];
    }
    if (![v3 count])
    {
      v5 = @"connected to network";
      goto LABEL_21;
    }
    id v9 = [NSString alloc];
    int v7 = [v3 componentsJoinedByString:@", "];
    uint64_t v8 = [v9 initWithFormat:@"connected to network (%@)", v7];
    goto LABEL_18;
  }
  if (![v3 count])
  {
    v5 = @"not connected to network";
    goto LABEL_21;
  }
  id v6 = [NSString alloc];
  int v7 = [v3 componentsJoinedByString:@", "];
  uint64_t v8 = [v6 initWithFormat:@"not connected to network (%@)", v7];
LABEL_18:
  v5 = (__CFString *)v8;

LABEL_21:
LABEL_22:
  return v5;
}

- (BOOL)canUseNetwork
{
  BOOL v3 = [(CPLNetworkState *)self isConnected];
  if (v3)
  {
    if ([(CPLNetworkState *)self isConstrained]
      || [(CPLNetworkState *)self isInAirplaneMode])
    {
      LOBYTE(v3) = 0;
    }
    else if ([(CPLNetworkState *)self isCellular])
    {
      LOBYTE(v3) = ![(CPLNetworkState *)self isCellularRestricted];
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)isConstrained
{
  networkPath = self->_networkPath;
  if (networkPath) {
    LOBYTE(networkPath) = nw_path_is_constrained(networkPath);
  }
  return (char)networkPath;
}

- (BOOL)isCellular
{
  networkPath = self->_networkPath;
  return !networkPath || nw_path_uses_interface_type(networkPath, nw_interface_type_cellular);
}

- (BOOL)isConnected
{
  networkPath = self->_networkPath;
  return !networkPath || ((nw_path_get_status(networkPath) - 1) & 0xFFFFFFFD) == 0;
}

- (CPLNetworkState)initWithNetworkPath:(id)a3 cellularRestricted:(BOOL)a4 inAirplaneMode:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLNetworkState;
  int v10 = [(CPLNetworkState *)&v13 init];
  int v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_networkPath, a3);
    v11->_cellularRestricted = a4;
    v11->_inAirplaneMode = a5;
  }

  return v11;
}

@end