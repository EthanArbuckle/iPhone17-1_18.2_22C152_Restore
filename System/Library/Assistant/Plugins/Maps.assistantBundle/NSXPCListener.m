@interface NSXPCListener
+ (id)_maps_mapsConnectionBrokerEndpointConsumerListener;
+ (id)_maps_mapsConnectionBrokerEndpointSourceListener;
@end

@implementation NSXPCListener

+ (id)_maps_mapsConnectionBrokerEndpointSourceListener
{
  id v2 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.Maps.xpc.connectionBroker.endpointRecorder"];

  return v2;
}

+ (id)_maps_mapsConnectionBrokerEndpointConsumerListener
{
  id v2 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.Maps.xpc.connectionBroker.endpointProvider"];

  return v2;
}

@end