@interface DURequestStrategy
- (BOOL)preprocess;
- (NSString)modelIdentifier;
- (_TtC21DocumentUnderstanding17DURequestStrategy)init;
- (_TtC21DocumentUnderstanding17DURequestStrategy)initWithContentType:(id)a3 preferredModelIdentifier:(id)a4 preprocess:(BOOL)a5;
- (_TtC21DocumentUnderstanding20DURequestContentType)contentType;
- (void)setContentType:(id)a3;
- (void)setModelIdentifier:(id)a3;
- (void)setPreprocess:(BOOL)a3;
@end

@implementation DURequestStrategy

- (_TtC21DocumentUnderstanding20DURequestContentType)contentType
{
  id v2 = DURequestStrategy.contentType.getter();
  return (_TtC21DocumentUnderstanding20DURequestContentType *)v2;
}

- (void)setContentType:(id)a3
{
  id v4 = a3;
  v5 = self;
  DURequestStrategy.contentType.setter(v4);
}

- (NSString)modelIdentifier
{
  return (NSString *)sub_2367EA764((uint64_t)self, (uint64_t)a2, (void (*)(void))DURequestStrategy.modelIdentifier.getter);
}

- (void)setModelIdentifier:(id)a3
{
  uint64_t v4 = sub_23697AF6C();
  uint64_t v6 = v5;
  v7 = self;
  DURequestStrategy.modelIdentifier.setter(v4, v6);
}

- (BOOL)preprocess
{
  return DURequestStrategy.preprocess.getter() & 1;
}

- (void)setPreprocess:(BOOL)a3
{
}

- (_TtC21DocumentUnderstanding17DURequestStrategy)initWithContentType:(id)a3 preferredModelIdentifier:(id)a4 preprocess:(BOOL)a5
{
  uint64_t v7 = sub_23697AF6C();
  return (_TtC21DocumentUnderstanding17DURequestStrategy *)DURequestStrategy.init(contentType:preferredModelIdentifier:preprocess:)(a3, v7, v8, a5);
}

- (_TtC21DocumentUnderstanding17DURequestStrategy)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end