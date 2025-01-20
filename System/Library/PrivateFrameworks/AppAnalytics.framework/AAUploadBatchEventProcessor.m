@interface AAUploadBatchEventProcessor
- (AAUploadBatchEventProcessor)init;
- (AAUploadBatchEventProcessor)initWithClient:(id)a3 endpoint:(id)a4;
- (AAUploadBatchEventProcessor)initWithClient:(id)a3 endpoint:(id)a4 config:(id)a5;
- (AAUploadBatchEventProcessor)initWithClient:(id)a3 endpoint:(id)a4 contentType:(int64_t)a5 config:(id)a6;
- (void)processEvent:(id)a3;
@end

@implementation AAUploadBatchEventProcessor

- (AAUploadBatchEventProcessor)initWithClient:(id)a3 endpoint:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = qword_1EB689870;
  id v9 = a3;
  swift_unknownObjectRetain_n();
  id v10 = v9;
  v11 = self;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v12 = _s12AppAnalytics25UploadBatchEventProcessorC6client8endpoint11contentType6configAcA6ClientC_AA08EndpointJ0_pAA07ContentJ0OAA0cdE6ConfigCtcfC_0(v10, a4, 0, (id)qword_1EB6897B8);
  v13 = (uint64_t *)((char *)v11 + OBJC_IVAR___AAUploadBatchEventProcessor_proxyEventProcessor);
  uint64_t *v13 = v12;
  v13[1] = (uint64_t)&protocol witness table for UploadBatchEventProcessor;

  v16.receiver = v11;
  v16.super_class = ObjectType;
  v14 = [(AAUploadBatchEventProcessor *)&v16 init];

  swift_unknownObjectRelease();
  return v14;
}

- (AAUploadBatchEventProcessor)initWithClient:(id)a3 endpoint:(id)a4 config:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v10 = a3;
  swift_unknownObjectRetain_n();
  id v11 = a5;
  id v12 = v10;
  id v13 = v11;
  v14 = self;
  uint64_t v15 = _s12AppAnalytics25UploadBatchEventProcessorC6client8endpoint11contentType6configAcA6ClientC_AA08EndpointJ0_pAA07ContentJ0OAA0cdE6ConfigCtcfC_0(v12, a4, 0, v13);
  objc_super v16 = (uint64_t *)((char *)v14 + OBJC_IVAR___AAUploadBatchEventProcessor_proxyEventProcessor);
  *objc_super v16 = v15;
  v16[1] = (uint64_t)&protocol witness table for UploadBatchEventProcessor;

  v19.receiver = v14;
  v19.super_class = ObjectType;
  v17 = [(AAUploadBatchEventProcessor *)&v19 init];

  swift_unknownObjectRelease();
  return v17;
}

- (AAUploadBatchEventProcessor)initWithClient:(id)a3 endpoint:(id)a4 contentType:(int64_t)a5 config:(id)a6
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v12 = a3;
  swift_unknownObjectRetain_n();
  id v13 = a6;
  id v14 = v12;
  id v15 = v13;
  objc_super v16 = self;
  uint64_t v17 = _s12AppAnalytics25UploadBatchEventProcessorC6client8endpoint11contentType6configAcA6ClientC_AA08EndpointJ0_pAA07ContentJ0OAA0cdE6ConfigCtcfC_0(v14, a4, a5, v15);
  v18 = (uint64_t *)((char *)v16 + OBJC_IVAR___AAUploadBatchEventProcessor_proxyEventProcessor);
  uint64_t *v18 = v17;
  v18[1] = (uint64_t)&protocol witness table for UploadBatchEventProcessor;

  v21.receiver = v16;
  v21.super_class = ObjectType;
  objc_super v19 = [(AAUploadBatchEventProcessor *)&v21 init];

  swift_unknownObjectRelease();
  return v19;
}

- (void)processEvent:(id)a3
{
}

- (AAUploadBatchEventProcessor)init
{
  result = (AAUploadBatchEventProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end