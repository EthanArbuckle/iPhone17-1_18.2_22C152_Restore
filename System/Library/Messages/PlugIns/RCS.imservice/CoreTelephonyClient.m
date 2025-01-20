@interface CoreTelephonyClient
- (id)_getSystemConfiguration:(id)a3 withError:(id *)a4;
- (id)_retrieveMessage:(id)a3 withMessageID:(id)a4 withError:(id *)a5;
@end

@implementation CoreTelephonyClient

- (id)_getSystemConfiguration:(id)a3 withError:(id *)a4
{
  return [(CoreTelephonyClient *)self getSystemConfiguration:a3 withError:a4];
}

- (id)_retrieveMessage:(id)a3 withMessageID:(id)a4 withError:(id *)a5
{
  return [(CoreTelephonyClient *)self retrieveMessage:a3 withMessageID:a4 withError:a5];
}

@end