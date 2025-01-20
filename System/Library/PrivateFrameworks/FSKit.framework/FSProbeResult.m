@interface FSProbeResult
+ (BOOL)supportsSecureCoding;
+ (id)newResult:(int64_t)a3 name:(id)a4 containerID:(id)a5;
+ (id)resultWithResult:(int64_t)a3 name:(id)a4 containerID:(id)a5;
- (FSContainerIdentifier)containerID;
- (FSProbeResult)initWithCoder:(id)a3;
- (FSProbeResult)initWithResult:(int64_t)a3 name:(id)a4 containerID:(id)a5;
- (NSString)name;
- (id)description;
- (int64_t)result;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FSProbeResult

- (FSProbeResult)initWithResult:(int64_t)a3 name:(id)a4 containerID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FSProbeResult;
  v10 = [(FSProbeResult *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_result = a3;
    uint64_t v12 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    containerID = v11->_containerID;
    v11->_containerID = (FSContainerIdentifier *)v14;
  }
  return v11;
}

+ (id)resultWithResult:(int64_t)a3 name:(id)a4 containerID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)[objc_alloc((Class)a1) initWithResult:a3 name:v9 containerID:v8];

  return v10;
}

+ (id)newResult:(int64_t)a3 name:(id)a4 containerID:(id)a5
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be encoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v7);
  }
  v4 = [NSNumber numberWithInteger:self->_result];
  [v8 encodeObject:v4 forKey:@"FSProbeResult.Result"];

  name = self->_name;
  if (name) {
    [v8 encodeObject:name forKey:@"FSProbeResult.Name"];
  }
  containerID = self->_containerID;
  if (containerID) {
    [v8 encodeObject:containerID forKey:@"FSProbeResult.UUID"];
  }
}

- (FSProbeResult)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v10);
  }
  self->_result = (int)[v4 decodeIntForKey:@"FSProbeResult.Result"];
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSProbeResult.Name"];
  name = self->_name;
  self->_name = v5;

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSProbeResult.UUID"];
  containerID = self->_containerID;
  self->_containerID = v7;

  return self;
}

- (id)description
{
  unint64_t v3 = self->_result - 1;
  if (v3 > 2) {
    id v4 = @"NotRecognized";
  }
  else {
    id v4 = off_26530B808[v3];
  }
  if (self->_name)
  {
    v5 = [NSString stringWithFormat:@" name '%@'", self->_name];
  }
  else
  {
    v5 = &stru_26FFF08C0;
  }
  if (self->_containerID)
  {
    v6 = [NSString stringWithFormat:@" container %@", self->_containerID];
  }
  else
  {
    v6 = &stru_26FFF08C0;
  }
  id v7 = [NSString stringWithFormat:@"FSProbeResult %@%@%@", v4, v5, v6];

  return v7;
}

- (int64_t)result
{
  return self->_result;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (FSContainerIdentifier)containerID
{
  return (FSContainerIdentifier *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end