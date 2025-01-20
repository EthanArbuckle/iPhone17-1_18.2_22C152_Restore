@interface LPYouTubePlayerWebProcessPlugIn
- (id)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 willSendRequestForResource:(unint64_t)a5 request:(id)a6 redirectResponse:(id)a7;
- (void)webProcessPlugIn:(id)a3 didCreateBrowserContextController:(id)a4;
- (void)webProcessPlugIn:(id)a3 initializeWithObject:(id)a4;
@end

@implementation LPYouTubePlayerWebProcessPlugIn

- (void)webProcessPlugIn:(id)a3 initializeWithObject:(id)a4
{
  v5 = [a3 parameters];
  id v6 = [v5 valueForKey:@"isMessagesOrMessagesViewService"];

  self->_isMessagesOrMessagesViewService = [v6 BOOLValue];
}

- (void)webProcessPlugIn:(id)a3 didCreateBrowserContextController:(id)a4
{
}

- (id)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 willSendRequestForResource:(unint64_t)a5 request:(id)a6 redirectResponse:(id)a7
{
  id v8 = a6;
  v9 = v8;
  if (self->_isMessagesOrMessagesViewService)
  {
    id v10 = [v8 mutableCopy];
    [v10 setAttribution:1];
    [v10 setValue:@"https://mobilesms.apple.com" forHTTPHeaderField:@"Referer"];
  }
  else
  {
    id v10 = v8;
  }

  return v10;
}

@end