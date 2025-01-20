@interface IMServiceReachabilityResult
+ (BOOL)supportsSecureCoding;
+ (id)finalResultForService:(id)a3 handleIDs:(id)a4 allAreReachable:(BOOL)a5 checkedServer:(BOOL)a6 error:(int64_t)a7;
+ (id)finalResultForService:(id)a3 handleIDs:(id)a4 allAreReachable:(BOOL)a5 handleIsReachable:(id)a6 checkedServer:(BOOL)a7 error:(int64_t)a8;
- (BOOL)allAreReachable;
- (BOOL)didCheckServer;
- (BOOL)isFinal;
- (BOOL)reachabilityOverriddenToSuccessByPolicy;
- (IDSIDInfoResult)selfKTData;
- (IMServiceReachabilityResult)initWithCoder:(id)a3;
- (IMServiceReachabilityResult)initWithService:(id)a3 error:(int64_t)a4 handleResults:(id)a5 isFinal:(BOOL)a6 allAreReachable:(BOOL)a7 didCheckServer:(BOOL)a8;
- (NSDictionary)handleResults;
- (NSDictionary)ktData;
- (NSString)service;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createDictionary;
- (id)description;
- (int64_t)error;
- (void)encodeWithCoder:(id)a3;
- (void)setAllAreReachable:(BOOL)a3;
- (void)setDidCheckServer:(BOOL)a3;
- (void)setError:(int64_t)a3;
- (void)setFinal:(BOOL)a3;
- (void)setHandleResults:(id)a3;
- (void)setKtData:(id)a3;
- (void)setReachabilityOverriddenToSuccessByPolicy:(BOOL)a3;
- (void)setSelfKTData:(id)a3;
- (void)setService:(id)a3;
@end

@implementation IMServiceReachabilityResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMServiceReachabilityResult)initWithService:(id)a3 error:(int64_t)a4 handleResults:(id)a5 isFinal:(BOOL)a6 allAreReachable:(BOOL)a7 didCheckServer:(BOOL)a8
{
  id v15 = a3;
  id v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)IMServiceReachabilityResult;
  v17 = [(IMServiceReachabilityResult *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_service, a3);
    v18->_error = a4;
    objc_storeStrong((id *)&v18->_handleResults, a5);
    v18->_final = a6;
    v18->_allAreReachable = a7;
    v18->_didCheckServer = a8;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeObject:self->_service forKey:@"s"];
  [v8 encodeInteger:self->_error forKey:@"e"];
  [v8 encodeObject:self->_handleResults forKey:@"r"];
  [v8 encodeBool:self->_final forKey:@"f"];
  [v8 encodeBool:self->_allAreReachable forKey:@"ar"];
  [v8 encodeBool:self->_didCheckServer forKey:@"cs"];
  [v8 encodeBool:self->_reachabilityOverriddenToSuccessByPolicy forKey:@"os"];
  selfKTData = self->_selfKTData;
  if (selfKTData)
  {
    v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:selfKTData requiringSecureCoding:1 error:0];
    [v8 encodeObject:v5 forKey:@"skd"];
  }
  ktData = self->_ktData;
  if (ktData)
  {
    v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:ktData requiringSecureCoding:1 error:0];
    [v8 encodeObject:v7 forKey:@"kd"];
  }
}

- (IMServiceReachabilityResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"s"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"e"];
  uint64_t v7 = objc_opt_class();
  id v8 = [v4 decodeDictionaryWithKeysOfClass:v7 objectsOfClass:objc_opt_class() forKey:@"r"];
  v9 = -[IMServiceReachabilityResult initWithService:error:handleResults:isFinal:allAreReachable:didCheckServer:](self, "initWithService:error:handleResults:isFinal:allAreReachable:didCheckServer:", v5, v6, v8, [v4 decodeBoolForKey:@"f"], objc_msgSend(v4, "decodeBoolForKey:", @"ar"), objc_msgSend(v4, "decodeBoolForKey:", @"cs"));

  if (v9)
  {
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"skd"];
    if (v10)
    {
      v11 = (void *)MEMORY[0x1E4F28DC0];
      v12 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v13 = objc_opt_class();
      uint64_t v27 = objc_opt_class();
      v14 = objc_msgSend(v12, "setWithObjects:", v13, v27, objc_opt_class(), 0);
      uint64_t v15 = [v11 unarchivedObjectOfClasses:v14 fromData:v10 error:0];
      selfKTData = v9->_selfKTData;
      v9->_selfKTData = (IDSIDInfoResult *)v15;
    }
    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kd"];
    if (v17)
    {
      v18 = (void *)MEMORY[0x1E4F28DC0];
      v19 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = objc_opt_class();
      v23 = objc_msgSend(v19, "setWithObjects:", v20, v21, v22, objc_opt_class(), 0);
      uint64_t v24 = [v18 unarchivedObjectOfClasses:v23 fromData:v17 error:0];
      ktData = v9->_ktData;
      v9->_ktData = (NSDictionary *)v24;
    }
    v9->_reachabilityOverriddenToSuccessByPolicy = [v4 decodeBoolForKey:@"os"];
  }
  return v9;
}

+ (id)finalResultForService:(id)a3 handleIDs:(id)a4 allAreReachable:(BOOL)a5 handleIsReachable:(id)a6 checkedServer:(BOOL)a7 error:(int64_t)a8
{
  BOOL v9 = a7;
  BOOL v11 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = objc_alloc_init(IMServiceReachabilityResult);
  [(IMServiceReachabilityResult *)v16 setService:v13];
  [(IMServiceReachabilityResult *)v16 setError:a8];
  [(IMServiceReachabilityResult *)v16 setDidCheckServer:v9];
  [(IMServiceReachabilityResult *)v16 setFinal:1];
  BOOL v17 = v11 && [v14 count] != 0;
  [(IMServiceReachabilityResult *)v16 setAllAreReachable:v17];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  uint64_t v27 = sub_1A08030DC;
  v28 = &unk_1E5A12528;
  id v31 = v15;
  BOOL v32 = v11;
  v18 = v16;
  v29 = v18;
  id v30 = v13;
  id v19 = v13;
  id v20 = v15;
  uint64_t v21 = objc_msgSend(v14, "__imMapToDictionary:", &v25);
  -[IMServiceReachabilityResult setHandleResults:](v18, "setHandleResults:", v21, v25, v26, v27, v28);

  uint64_t v22 = v30;
  v23 = v18;

  return v23;
}

+ (id)finalResultForService:(id)a3 handleIDs:(id)a4 allAreReachable:(BOOL)a5 checkedServer:(BOOL)a6 error:(int64_t)a7
{
  return (id)MEMORY[0x1F4181798](a1, sel_finalResultForService_handleIDs_allAreReachable_handleIsReachable_checkedServer_error_);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[IMServiceReachabilityResult alloc] initWithService:self->_service error:self->_error handleResults:self->_handleResults isFinal:self->_final allAreReachable:self->_allAreReachable didCheckServer:self->_didCheckServer];
  [(IMServiceReachabilityResult *)v4 setKtData:self->_ktData];
  [(IMServiceReachabilityResult *)v4 setSelfKTData:self->_selfKTData];
  [(IMServiceReachabilityResult *)v4 setReachabilityOverriddenToSuccessByPolicy:self->_reachabilityOverriddenToSuccessByPolicy];
  return v4;
}

- (id)createDictionary
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  service = self->_service;
  if (service) {
    [v3 setObject:service forKeyedSubscript:@"s"];
  }
  if (self->_error)
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v4 setObject:v6 forKeyedSubscript:@"e"];
  }
  handleResults = self->_handleResults;
  if (handleResults)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSDictionary count](handleResults, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    BOOL v9 = [(NSDictionary *)self->_handleResults allValues];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v15 = [v14 createDictionary];
          id v16 = [v14 handleID];
          [v8 setObject:v15 forKeyedSubscript:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }

    BOOL v17 = (void *)[v8 copy];
    [v4 setObject:v17 forKeyedSubscript:@"r"];
  }
  if (self->_final)
  {
    v18 = [NSNumber numberWithBool:1];
    [v4 setObject:v18 forKeyedSubscript:@"f"];
  }
  if (self->_didCheckServer)
  {
    id v19 = [NSNumber numberWithBool:1];
    [v4 setObject:v19 forKeyedSubscript:@"cs"];
  }
  id v20 = (void *)[v4 copy];

  return v20;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if ([(IMServiceReachabilityResult *)self isFinal]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  uint64_t v6 = [(IMServiceReachabilityResult *)self service];
  if ([(IMServiceReachabilityResult *)self allAreReachable]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  if ([(IMServiceReachabilityResult *)self didCheckServer]) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  BOOL v9 = [(IMServiceReachabilityResult *)self handleResults];
  if ([(IMServiceReachabilityResult *)self reachabilityOverriddenToSuccessByPolicy])
  {
    uint64_t v10 = @"YES";
  }
  else
  {
    uint64_t v10 = @"NO";
  }
  uint64_t v11 = [v3 stringWithFormat:@"<%@ %p [isFinal: %@ service: %@ allAreReachable: %@ didCheckServer: %@ handleResults: %@ overriddenToSuccess: %@]>", v4, self, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (int64_t)error
{
  return self->_error;
}

- (void)setError:(int64_t)a3
{
  self->_error = a3;
}

- (NSDictionary)handleResults
{
  return self->_handleResults;
}

- (void)setHandleResults:(id)a3
{
}

- (BOOL)isFinal
{
  return self->_final;
}

- (void)setFinal:(BOOL)a3
{
  self->_final = a3;
}

- (BOOL)allAreReachable
{
  return self->_allAreReachable;
}

- (void)setAllAreReachable:(BOOL)a3
{
  self->_allAreReachable = a3;
}

- (BOOL)didCheckServer
{
  return self->_didCheckServer;
}

- (void)setDidCheckServer:(BOOL)a3
{
  self->_didCheckServer = a3;
}

- (IDSIDInfoResult)selfKTData
{
  return self->_selfKTData;
}

- (void)setSelfKTData:(id)a3
{
}

- (NSDictionary)ktData
{
  return self->_ktData;
}

- (void)setKtData:(id)a3
{
}

- (BOOL)reachabilityOverriddenToSuccessByPolicy
{
  return self->_reachabilityOverriddenToSuccessByPolicy;
}

- (void)setReachabilityOverriddenToSuccessByPolicy:(BOOL)a3
{
  self->_reachabilityOverriddenToSuccessByPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktData, 0);
  objc_storeStrong((id *)&self->_selfKTData, 0);
  objc_storeStrong((id *)&self->_handleResults, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end