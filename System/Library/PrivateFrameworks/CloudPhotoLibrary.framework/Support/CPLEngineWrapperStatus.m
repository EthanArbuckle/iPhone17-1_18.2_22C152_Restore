@interface CPLEngineWrapperStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isOpened;
- (CPLEngineParameters)parameters;
- (CPLEngineWrapperStatus)initWithCoder:(id)a3;
- (CPLEngineWrapperStatus)initWithParameters:(id)a3 clientCount:(unint64_t)a4 isOpened:(BOOL)a5 openError:(id)a6;
- (CPLEngineWrapperStatus)initWithWrapper:(id)a3 clientCount:(unint64_t)a4 isOpened:(BOOL)a5 openError:(id)a6;
- (NSError)openError;
- (unint64_t)clientCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLEngineWrapperStatus

- (CPLEngineWrapperStatus)initWithWrapper:(id)a3 clientCount:(unint64_t)a4 isOpened:(BOOL)a5 openError:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  v11 = [a3 parameters];
  v12 = [(CPLEngineWrapperStatus *)self initWithParameters:v11 clientCount:a4 isOpened:v6 openError:v10];

  return v12;
}

- (CPLEngineWrapperStatus)initWithParameters:(id)a3 clientCount:(unint64_t)a4 isOpened:(BOOL)a5 openError:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CPLEngineWrapperStatus;
  v13 = [(CPLEngineWrapperStatus *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_parameters, a3);
    v14->_clientCount = a4;
    v14->_opened = a5;
    v15 = (NSError *)[v12 copy];
    openError = v14->_openError;
    v14->_openError = v15;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  parameters = self->_parameters;
  id v5 = a3;
  [v5 encodeObject:parameters forKey:@"parameters"];
  [v5 encodeInteger:self->_clientCount forKey:@"clientCount"];
  [v5 encodeBool:self->_opened forKey:@"opened"];
  id v6 = [(NSError *)self->_openError cplSafeErrorForXPC];
  [v5 encodeObject:v6 forKey:@"openError"];
}

- (CPLEngineWrapperStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameters"];
  if (v5)
  {
    id v6 = [v4 decodeIntegerForKey:@"clientCount"];
    id v7 = [v4 decodeBoolForKey:@"opened"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"openError"];
    self = [(CPLEngineWrapperStatus *)self initWithParameters:v5 clientCount:v6 isOpened:v7 openError:v8];

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (CPLEngineParameters)parameters
{
  return self->_parameters;
}

- (unint64_t)clientCount
{
  return self->_clientCount;
}

- (BOOL)isOpened
{
  return self->_opened;
}

- (NSError)openError
{
  return self->_openError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openError, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end