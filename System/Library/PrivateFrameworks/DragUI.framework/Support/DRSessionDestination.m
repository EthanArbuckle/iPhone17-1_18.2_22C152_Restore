@interface DRSessionDestination
- (BOOL)clientSessionReportedDragEnd;
- (BOOL)expectsStagedLegacySelectors;
- (BOOL)isPolicyDriven;
- (DRDataTransferSession)dataTransferSession;
- (NSXPCConnection)connection;
- (_DUIClientSessionDestination)clientSession;
- (id)description;
- (void)setClientSession:(id)a3;
- (void)setClientSessionReportedDragEnd:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setDataTransferSession:(id)a3;
- (void)setExpectsStagedLegacySelectors:(BOOL)a3;
- (void)setPolicyDriven:(BOOL)a3;
@end

@implementation DRSessionDestination

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p clientSession=%@ pid=%d policyDriven=%i>", v4, self, self->_clientSession, [(NSXPCConnection *)self->_connection processIdentifier], self->_policyDriven];

  return v5;
}

- (_DUIClientSessionDestination)clientSession
{
  return self->_clientSession;
}

- (void)setClientSession:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (DRDataTransferSession)dataTransferSession
{
  return self->_dataTransferSession;
}

- (void)setDataTransferSession:(id)a3
{
}

- (BOOL)isPolicyDriven
{
  return self->_policyDriven;
}

- (void)setPolicyDriven:(BOOL)a3
{
  self->_policyDriven = a3;
}

- (BOOL)clientSessionReportedDragEnd
{
  return self->_clientSessionReportedDragEnd;
}

- (void)setClientSessionReportedDragEnd:(BOOL)a3
{
  self->_clientSessionReportedDragEnd = a3;
}

- (BOOL)expectsStagedLegacySelectors
{
  return self->_expectsStagedLegacySelectors;
}

- (void)setExpectsStagedLegacySelectors:(BOOL)a3
{
  self->_expectsStagedLegacySelectors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataTransferSession, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientSession, 0);
}

@end