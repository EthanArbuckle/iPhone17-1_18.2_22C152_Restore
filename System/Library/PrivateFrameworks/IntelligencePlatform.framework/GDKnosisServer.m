@interface GDKnosisServer
- (GDKnosisServer)initWithEntitySubgraphView;
- (void)executeIntent:(id)a3 completionHandler:(id)a4;
- (void)executeIntent:(id)a3 completionHandlerWithGraphObjectContext:(id)a4;
- (void)executeKGQ:(id)a3 completionHandler:(id)a4;
- (void)executeKGQ:(id)a3 completionHandlerWithGraphObjectContext:(id)a4;
@end

@implementation GDKnosisServer

- (void).cxx_destruct
{
}

- (void)executeKGQ:(id)a3 completionHandlerWithGraphObjectContext:(id)a4
{
  knosisServer = self->_knosisServer;
  id v7 = a4;
  objc_msgSend_executeKGQWithGraphObjectContextWithRequest_(knosisServer, v8, (uint64_t)a3, v9, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v11);
}

- (void)executeIntent:(id)a3 completionHandlerWithGraphObjectContext:(id)a4
{
  knosisServer = self->_knosisServer;
  id v7 = a4;
  objc_msgSend_executeIntentsWithGraphObjectContextWithRequest_(knosisServer, v8, (uint64_t)a3, v9, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v11);
}

- (void)executeKGQ:(id)a3 completionHandler:(id)a4
{
  knosisServer = self->_knosisServer;
  id v7 = a4;
  objc_msgSend_executeKGQWithRequest_(knosisServer, v8, (uint64_t)a3, v9, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v11);
}

- (void)executeIntent:(id)a3 completionHandler:(id)a4
{
  knosisServer = self->_knosisServer;
  id v7 = a4;
  objc_msgSend_executeIntentsWithRequest_(knosisServer, v8, (uint64_t)a3, v9, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v11);
}

- (GDKnosisServer)initWithEntitySubgraphView
{
  v10.receiver = self;
  v10.super_class = (Class)GDKnosisServer;
  v6 = [(GDKnosisServer *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_initWithEntitySubgraphView(_TtC20IntelligencePlatform12KnosisServer, v2, v3, v4, v5);
    knosisServer = v6->_knosisServer;
    v6->_knosisServer = (_TtC20IntelligencePlatform12KnosisServer *)v7;
  }
  return v6;
}

@end