@interface CADPooledDatabaseConfiguration
- (BOOL)enablePropertyModificationLogging;
- (NSString)clientIdentifier;
- (NSString)clientName;
- (int)inMemoryChangeTrackingClientID;
- (void)setClientIdentifier:(id)a3;
- (void)setClientName:(id)a3;
- (void)setEnablePropertyModificationLogging:(BOOL)a3;
- (void)setInMemoryChangeTrackingClientID:(int)a3;
@end

@implementation CADPooledDatabaseConfiguration

- (int)inMemoryChangeTrackingClientID
{
  return self->_inMemoryChangeTrackingClientID;
}

- (BOOL)enablePropertyModificationLogging
{
  return self->_enablePropertyModificationLogging;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setInMemoryChangeTrackingClientID:(int)a3
{
  self->_inMemoryChangeTrackingClientID = a3;
}

- (void)setEnablePropertyModificationLogging:(BOOL)a3
{
  self->_enablePropertyModificationLogging = a3;
}

- (void)setClientName:(id)a3
{
}

- (void)setClientIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
}

@end