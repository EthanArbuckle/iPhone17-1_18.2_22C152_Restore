@interface VFMActionClassifier.Observer
- (_TtCV5Human19VFMActionClassifier8Observer)init;
- (void)actionClassifier:(id)a3 didUpdateActionPredictions:(id)a4;
- (void)videoFeatureExtractor:(id)a3 didUpdateVideoFeature:(id)a4;
@end

@implementation VFMActionClassifier.Observer

- (void)videoFeatureExtractor:(id)a3 didUpdateVideoFeature:(id)a4
{
  id v5 = (id)qword_269C3D760;
  qword_269C3D760 = (uint64_t)a4;
  id v4 = a4;
}

- (void)actionClassifier:(id)a3 didUpdateActionPredictions:(id)a4
{
  sub_2528BA6BC(0, (unint64_t *)&qword_269C31C80);
  uint64_t v6 = sub_252951B98();
  id v7 = a3;
  v8 = self;
  sub_2528F5868(v6);

  swift_bridgeObjectRelease();
}

- (_TtCV5Human19VFMActionClassifier8Observer)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(VFMActionClassifier.Observer *)&v3 init];
}

@end