@interface CachedURLSession
+ (id)cachedSession:(id)a3 maximumWatchCellularTransferSize:(id)a4;
- (NSNumber)maximumWatchCellularTransferSize;
- (NSURLSession)session;
- (void)setMaximumWatchCellularTransferSize:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation CachedURLSession

+ (id)cachedSession:(id)a3 maximumWatchCellularTransferSize:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setSession:v6];

  [v7 setMaximumWatchCellularTransferSize:v5];

  return v7;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSNumber)maximumWatchCellularTransferSize
{
  return self->_maximumWatchCellularTransferSize;
}

- (void)setMaximumWatchCellularTransferSize:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumWatchCellularTransferSize, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end