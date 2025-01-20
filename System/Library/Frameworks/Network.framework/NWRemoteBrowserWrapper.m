@interface NWRemoteBrowserWrapper
- (NSUUID)clientID;
- (NWBrowser)browser;
- (void)setBrowser:(id)a3;
- (void)setClientID:(id)a3;
@end

@implementation NWRemoteBrowserWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browser, 0);

  objc_storeStrong((id *)&self->_clientID, 0);
}

- (void)setBrowser:(id)a3
{
}

- (NWBrowser)browser
{
  return (NWBrowser *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientID:(id)a3
{
}

- (NSUUID)clientID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

@end