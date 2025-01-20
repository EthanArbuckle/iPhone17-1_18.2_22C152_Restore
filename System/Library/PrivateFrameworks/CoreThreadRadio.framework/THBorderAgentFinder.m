@interface THBorderAgentFinder
- (THBorderAgentFinder)init;
- (THBorderAgentListener)delegate;
- (id)getAgentDescription:(unint64_t)a3;
- (id)getBorderAgentAtIndex:(unint64_t)a3;
- (unint64_t)getNumberOfBorderAgents;
- (void)cleanBorderAgents;
- (void)netService:(id)a3 didNotResolve:(id)a4;
- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowserDidStopSearch:(id)a3;
- (void)netServiceBrowserWillSearch:(id)a3;
- (void)netServiceDidResolveAddress:(id)a3;
- (void)netServiceWillResolve:(id)a3;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation THBorderAgentFinder

- (THBorderAgentFinder)init
{
  v8.receiver = self;
  v8.super_class = (Class)THBorderAgentFinder;
  v2 = [(THBorderAgentFinder *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    borderAgents = v2->_borderAgents;
    v2->_borderAgents = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    browser = v2->_browser;
    v2->_browser = (NSNetServiceBrowser *)v5;

    [(NSNetServiceBrowser *)v2->_browser setDelegate:v2];
  }
  return v2;
}

- (void)start
{
  NSLog(@"%s:%d: Starting Scan browser Tag : %@", a2, "-[THBorderAgentFinder start]", 36, self->_browser);
  browser = self->_browser;

  [(NSNetServiceBrowser *)browser searchForServicesOfType:@"_meshcop._udp" inDomain:&stru_1004A31D0];
}

- (void)stop
{
  NSLog(@"%s:%d: Stop Scan browser Tag : %@", a2, "-[THBorderAgentFinder stop]", 42, self->_browser);
  browser = self->_browser;

  [(NSNetServiceBrowser *)browser stop];
}

- (unint64_t)getNumberOfBorderAgents
{
  return (unint64_t)[(NSMutableArray *)self->_borderAgents count];
}

- (void)cleanBorderAgents
{
}

- (id)getAgentDescription:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_borderAgents count] <= a3)
  {
    v12 = @"Out of Bounds";
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_borderAgents objectAtIndex:a3];
    v6 = v5;
    if (v5)
    {
      v7 = [v5 name];
      uint64_t v8 = [v6 hostName];
      v9 = (void *)v8;
      if (v8) {
        CFStringRef v10 = (const __CFString *)v8;
      }
      else {
        CFStringRef v10 = @"Unknown";
      }
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - %@ (%ld)", v7, v10, [v6 port]);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = @"No service";
    }
    v12 = v11;
  }

  return v12;
}

- (id)getBorderAgentAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_borderAgents count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_borderAgents objectAtIndex:a3];
  }

  return v5;
}

- (void)netServiceBrowserWillSearch:(id)a3
{
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  id v7 = a4;
  NSLog(@"Service %@ added", v7);
  [(NSMutableArray *)self->_borderAgents addObject:v7];
  [v7 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained agentChanged];

  [v7 resolveWithTimeout:1.0];
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  id v6 = a4;
  NSLog(@"Service %@ removed", v6);
  [(NSMutableArray *)self->_borderAgents removeObject:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained agentChanged];
}

- (void)netServiceBrowserDidStopSearch:(id)a3
{
}

- (void)netServiceWillResolve:(id)a3
{
  id v3 = [a3 description];
  NSLog(@"Resolving %@", v3);
}

- (void)netService:(id)a3 didNotResolve:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  id v6 = [v10 description];
  NSLog(@"Failed resolve %@", v6);

  id v7 = [v5 objectForKeyedSubscript:NSNetServicesErrorCode];

  uint64_t v8 = +[NSNumber numberWithInt:4294895289];
  unsigned int v9 = [v7 isEqualToNumber:v8];

  if (v9) {
    [v10 resolveWithTimeout:2.0];
  }
}

- (void)netServiceDidResolveAddress:(id)a3
{
  id v4 = a3;
  id v5 = [v4 description];
  NSLog(@"Resolved %@", v5);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained agentResolved:v4];
}

- (THBorderAgentListener)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (THBorderAgentListener *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_borderAgents, 0);

  objc_storeStrong((id *)&self->_browser, 0);
}

@end