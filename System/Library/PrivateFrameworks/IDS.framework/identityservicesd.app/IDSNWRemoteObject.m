@interface IDSNWRemoteObject
- (IDSNWRemoteObject)initWithFramer:(id)a3;
- (IDSNWRemoteObject)initWithFramer:(id)a3 forIDSDestination:(id)a4;
- (NSString)idsDestination;
- (OS_nw_framer)framer;
- (int64_t)ipcType;
- (void)messageIdentifier:(id)a3 alternateCallbackID:(id)a4 forAccount:(id)a5 updatedWithResponseCode:(int64_t)a6 error:(id)a7 lastCall:(BOOL)a8 context:(id)a9;
- (void)messageReceived:(id)a3 withGUID:(id)a4 withPayload:(id)a5 forTopic:(id)a6 toIdentifier:(id)a7 fromID:(id)a8 context:(id)a9;
- (void)setFramer:(id)a3;
- (void)setIdsDestination:(id)a3;
@end

@implementation IDSNWRemoteObject

- (int64_t)ipcType
{
  return 1;
}

- (IDSNWRemoteObject)initWithFramer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSNWRemoteObject;
  v6 = [(IDSNWRemoteObject *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_framer, a3);
  }

  return v7;
}

- (IDSNWRemoteObject)initWithFramer:(id)a3 forIDSDestination:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  NSLog(@"NW: creating new IDSNWRemoteObject for framer: %lu, forIDSDestination: %@", [v7 hash], v8);
  v12.receiver = self;
  v12.super_class = (Class)IDSNWRemoteObject;
  objc_super v9 = [(IDSNWRemoteObject *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_framer, a3);
    objc_storeStrong((id *)&v10->_idsDestination, a4);
  }

  return v10;
}

- (void)messageReceived:(id)a3 withGUID:(id)a4 withPayload:(id)a5 forTopic:(id)a6 toIdentifier:(id)a7 fromID:(id)a8 context:(id)a9
{
}

- (void)messageIdentifier:(id)a3 alternateCallbackID:(id)a4 forAccount:(id)a5 updatedWithResponseCode:(int64_t)a6 error:(id)a7 lastCall:(BOOL)a8 context:(id)a9
{
  CFStringRef v9 = @"NO";
  if (a8) {
    CFStringRef v9 = @"YES";
  }
  NSLog(@"NW:sendMessage updatedWithResponseCode: %ld identifier: %@ alternateCallbackID: %@ error: %@ lastCall: %@", a2, a3, a4, a5, a6, a3, a4, a7, v9);
}

- (OS_nw_framer)framer
{
  return self->_framer;
}

- (void)setFramer:(id)a3
{
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (void)setIdsDestination:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDestination, 0);

  objc_storeStrong((id *)&self->_framer, 0);
}

@end