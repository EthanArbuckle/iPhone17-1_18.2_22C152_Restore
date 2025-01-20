@interface CRKClassSession
- (CRKClassSession)initWithIdentifier:(id)a3;
- (DMFControlSessionIdentifier)identifier;
- (NSDate)lastBeaconFoundDate;
- (id)lastMatchMessageForCurrentDate:(id)a3;
- (id)stateDictionary;
- (unsigned)flags;
- (void)foundBeaconWithFlags:(unsigned __int16)a3;
- (void)logBeaconFound;
- (void)lostBeacon;
- (void)setFlags:(unsigned __int16)a3;
- (void)setLastBeaconFoundDate:(id)a3;
@end

@implementation CRKClassSession

- (CRKClassSession)initWithIdentifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CRKClassSession.m", 27, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v7 = objc_msgSend(v6, "crk_endpoint");
  v11.receiver = self;
  v11.super_class = (Class)CRKClassSession;
  v8 = [(CRKSession *)&v11 initWithEndpoint:v7];

  if (v8) {
    objc_storeStrong((id *)&v8->_identifier, a3);
  }

  return v8;
}

- (void)foundBeaconWithFlags:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"CRKClassSession.m", 41, @"%@ must be called from the main thread", v7 object file lineNumber description];
  }
  [(CRKClassSession *)self setFlags:v3];
  [(CRKClassSession *)self logBeaconFound];
  v8.receiver = self;
  v8.super_class = (Class)CRKClassSession;
  [(CRKSession *)&v8 foundBeacon];
}

- (id)stateDictionary
{
  v10[1] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CRKClassSession;
  uint64_t v3 = [(CRKSession *)&v8 stateDictionary];
  v9 = @"flags";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[CRKClassSession flags](self, "flags"));
  v10[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v6 = objc_msgSend(v3, "crk_dictionaryByAddingEntriesFromDictionary:", v5);

  return v6;
}

- (void)lostBeacon
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    v10 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, @"CRKClassSession.m", 56, @"%@ must be called from the main thread", v10 object file lineNumber description];
  }
  v4 = [MEMORY[0x263EFF910] now];
  v5 = [(CRKClassSession *)self lastMatchMessageForCurrentDate:v4];
  id v6 = _CRKLogBluetooth();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(CRKClassSession *)self identifier];
    objc_super v8 = [v7 stringValue];
    *(_DWORD *)buf = 134349570;
    v13 = self;
    __int16 v14 = 2114;
    v15 = v8;
    __int16 v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_224C00000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}p> Lost beacon for class session %{public}@. %{public}@", buf, 0x20u);
  }
  [(CRKClassSession *)self setLastBeaconFoundDate:0];
  v11.receiver = self;
  v11.super_class = (Class)CRKClassSession;
  [(CRKSession *)&v11 lostBeacon];
}

- (void)logBeaconFound
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF910] now];
  v4 = [(CRKClassSession *)self lastMatchMessageForCurrentDate:v3];
  v5 = _CRKLogBluetooth();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CRKClassSession *)self identifier];
    v7 = [v6 stringValue];
    int v8 = 134349570;
    v9 = self;
    __int16 v10 = 2114;
    objc_super v11 = v7;
    __int16 v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}p> Found beacon for class session %{public}@. %{public}@", (uint8_t *)&v8, 0x20u);
  }
  [(CRKClassSession *)self setLastBeaconFoundDate:v3];
}

- (id)lastMatchMessageForCurrentDate:(id)a3
{
  id v4 = a3;
  v5 = [(CRKClassSession *)self lastBeaconFoundDate];
  if (v5)
  {
    [v4 timeIntervalSinceDate:v5];
    objc_msgSend(NSString, "stringWithFormat:", @"last match %0.1f seconds ago", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_26D7E7B00;
  }

  return v7;
}

- (DMFControlSessionIdentifier)identifier
{
  return self->_identifier;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned __int16)a3
{
  self->_flags = a3;
}

- (NSDate)lastBeaconFoundDate
{
  return self->_lastBeaconFoundDate;
}

- (void)setLastBeaconFoundDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBeaconFoundDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end