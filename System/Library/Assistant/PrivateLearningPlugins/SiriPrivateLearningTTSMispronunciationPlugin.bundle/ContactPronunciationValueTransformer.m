@interface ContactPronunciationValueTransformer
+ (NSArray)allowedTopLevelClasses;
- (ContactPronunciationValueTransformer)init;
@end

@implementation ContactPronunciationValueTransformer

+ (NSArray)allowedTopLevelClasses
{
  sub_62C4(&qword_52C10);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_40160;
  *(void *)(v2 + 32) = type metadata accessor for ContactPronunciation();
  sub_62C4(&qword_52C18);
  v3.super.isa = sub_3EEA8().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (ContactPronunciationValueTransformer)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ContactPronunciationValueTransformer *)&v3 init];
}

@end