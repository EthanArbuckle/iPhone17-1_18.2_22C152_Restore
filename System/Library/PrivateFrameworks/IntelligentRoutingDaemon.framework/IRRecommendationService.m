@interface IRRecommendationService
+ (id)serviceWithQueue:(id)a3;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (IRRecommendationService)initWithQueue:(id)a3;
- (IRSessionServer)xpcServer;
- (NSArray)machServicesNames;
- (void)setXpcServer:(id)a3;
@end

@implementation IRRecommendationService

- (IRRecommendationService)initWithQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IRRecommendationService;
  v6 = [(IRRecommendationService *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = [[IRSessionServer alloc] initWithQueue:v5];
    [(IRRecommendationService *)v7 setXpcServer:v8];
  }
  return v7;
}

+ (id)serviceWithQueue:(id)a3
{
  id v3 = a3;
  v4 = [[IRRecommendationService alloc] initWithQueue:v3];

  return v4;
}

- (NSArray)machServicesNames
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"com.apple.intelligentroutingd.xpc.media";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(IRRecommendationService *)self xpcServer];
  char v6 = [v5 shouldAcceptNewConnection:v4];

  return v6;
}

- (IRSessionServer)xpcServer
{
  return self->_xpcServer;
}

- (void)setXpcServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcServer, 0);
  objc_storeStrong((id *)&self->machServicesNames, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end