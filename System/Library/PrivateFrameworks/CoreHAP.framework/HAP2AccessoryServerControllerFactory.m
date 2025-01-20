@interface HAP2AccessoryServerControllerFactory
- (id)createControllerWithEncoding:(id)a3 secureTransport:(id)a4 operationQueue:(id)a5;
@end

@implementation HAP2AccessoryServerControllerFactory

- (id)createControllerWithEncoding:(id)a3 secureTransport:(id)a4 operationQueue:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[HAP2AccessoryServerController alloc] initWithEncoding:v9 secureTransport:v8 operationQueue:v7];

  return v10;
}

@end