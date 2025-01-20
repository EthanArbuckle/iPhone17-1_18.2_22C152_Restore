@interface VFMActionClassifier.FeatureExtractor.Observer
- (_TtCVV5Human19VFMActionClassifier16FeatureExtractor8Observer)init;
- (void)videoFeatureExtractor:(id)a3 didUpdateVideoFeature:(id)a4;
@end

@implementation VFMActionClassifier.FeatureExtractor.Observer

- (void)videoFeatureExtractor:(id)a3 didUpdateVideoFeature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2528BD5CC(v7);
}

- (_TtCVV5Human19VFMActionClassifier16FeatureExtractor8Observer)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCVV5Human19VFMActionClassifier16FeatureExtractor8Observer_continuation) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCVV5Human19VFMActionClassifier16FeatureExtractor8Observer_anstTensor) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(VFMActionClassifier.FeatureExtractor.Observer *)&v5 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCVV5Human19VFMActionClassifier16FeatureExtractor8Observer_anstTensor));
}

@end