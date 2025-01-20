@interface CSEnhancedEndpointerInputVectorFactory
+ (id)inputVectorWithShape:(id)a3 dataType:(int64_t)a4 error:(id *)a5;
- (_TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorFactory)init;
@end

@implementation CSEnhancedEndpointerInputVectorFactory

+ (id)inputVectorWithShape:(id)a3 dataType:(int64_t)a4 error:(id *)a5
{
  sub_1BA1ADC30();
  unint64_t v6 = sub_1BA2523A8();
  v7 = (void *)sub_1BA1AD3DC(v6, a4);
  swift_bridgeObjectRelease();
  return v7;
}

- (_TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CSEnhancedEndpointerInputVectorFactory();
  return [(CSEnhancedEndpointerInputVectorFactory *)&v3 init];
}

@end