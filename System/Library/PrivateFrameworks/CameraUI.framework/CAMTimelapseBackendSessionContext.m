@interface CAMTimelapseBackendSessionContext
- (CAMTimelapseBackendSessionContext)init;
- (CAMTimelapseBackendSessionContext)initWithTimelapseUUID:(id)a3;
- (CAMTimelapseState)state;
- (NSArray)filesToDelete;
- (NSArray)filesToWrite;
- (NSString)timelapseUUID;
- (id)description;
- (void)setFilesToDelete:(id)a3;
- (void)setFilesToWrite:(id)a3;
- (void)setState:(id)a3;
@end

@implementation CAMTimelapseBackendSessionContext

- (CAMTimelapseBackendSessionContext)initWithTimelapseUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMTimelapseBackendSessionContext;
  v6 = [(CAMTimelapseBackendSessionContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_timelapseUUID, a3);
  }

  return v7;
}

- (CAMTimelapseBackendSessionContext)init
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CAMTimelapseBackendSessionContext;
  v4 = [(CAMTimelapseBackendSessionContext *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@: timelapseUUID=%@", v4, self->_timelapseUUID];

  return v5;
}

- (NSString)timelapseUUID
{
  return self->_timelapseUUID;
}

- (CAMTimelapseState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSArray)filesToDelete
{
  return self->_filesToDelete;
}

- (void)setFilesToDelete:(id)a3
{
}

- (NSArray)filesToWrite
{
  return self->_filesToWrite;
}

- (void)setFilesToWrite:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filesToWrite, 0);
  objc_storeStrong((id *)&self->_filesToDelete, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_timelapseUUID, 0);
}

@end