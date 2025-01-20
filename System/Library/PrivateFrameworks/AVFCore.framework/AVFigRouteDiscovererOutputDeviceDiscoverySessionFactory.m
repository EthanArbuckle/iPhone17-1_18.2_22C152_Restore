@interface AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory
- (AVFigRouteDiscovererFactory)routeDiscovererFactory;
- (AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory)init;
- (AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory)initWithRouteDiscovererFactory:(id)a3;
- (id)outputDeviceDiscoverySessionOfClass:(Class)a3 withDeviceFeatures:(unint64_t)a4;
- (void)dealloc;
@end

@implementation AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory

- (id)outputDeviceDiscoverySessionOfClass:(Class)a3 withDeviceFeatures:(unint64_t)a4
{
  v6 = 0;
  int v7 = 0;
  switch(a4)
  {
    case 1uLL:
      int v7 = 2;
      goto LABEL_8;
    case 2uLL:
      goto LABEL_8;
    case 3uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_9;
    case 4uLL:
      int v7 = 1;
      goto LABEL_8;
    case 5uLL:
      int v7 = 3;
      goto LABEL_8;
    case 8uLL:
      int v7 = 5;
      goto LABEL_8;
    default:
      if (a4 != 0xFFFF) {
        goto LABEL_9;
      }
      int v7 = 6;
LABEL_8:
      v8 = [AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl alloc];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __114__AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory_outputDeviceDiscoverySessionOfClass_withDeviceFeatures___block_invoke;
      v11[3] = &unk_1E57B72F0;
      v11[4] = self;
      int v12 = v7;
      v6 = [(AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl *)v8 initWithFigRouteDiscovererCreator:v11];
LABEL_9:
      v9 = (void *)[[a3 alloc] initWithOutputDeviceDiscoverySessionImpl:v6];

      return v9;
  }
}

uint64_t __114__AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory_outputDeviceDiscoverySessionOfClass_withDeviceFeatures___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) routeDiscovererFactory];
  int v3 = *(_DWORD *)(a1 + 40);
  return AVFigRouteDiscovererFactoryCreateRouteDiscovererWithType(v2, v3);
}

- (AVFigRouteDiscovererFactory)routeDiscovererFactory
{
  return self->_routeDiscovererFactory;
}

- (AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory)init
{
  Current = AVFigRouteDiscovererFactoryGetCurrent();
  return [(AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory *)self initWithRouteDiscovererFactory:Current];
}

- (AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory)initWithRouteDiscovererFactory:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory;
  v4 = [(AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory *)&v8 init];
  if (v4 && (v5 = (AVFigRouteDiscovererFactory *)a3, (v4->_routeDiscovererFactory = v5) != 0)) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory;
  [(AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory *)&v3 dealloc];
}

@end