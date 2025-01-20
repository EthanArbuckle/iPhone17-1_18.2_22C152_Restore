@interface DURequestContentType
+ (_TtC21DocumentUnderstanding20DURequestContentType)address;
+ (_TtC21DocumentUnderstanding20DURequestContentType)category;
+ (_TtC21DocumentUnderstanding20DURequestContentType)date;
+ (_TtC21DocumentUnderstanding20DURequestContentType)foundInEvent;
+ (_TtC21DocumentUnderstanding20DURequestContentType)foundInEventClassification;
+ (_TtC21DocumentUnderstanding20DURequestContentType)languageTag;
+ (_TtC21DocumentUnderstanding20DURequestContentType)link;
+ (_TtC21DocumentUnderstanding20DURequestContentType)navigationTitle;
+ (_TtC21DocumentUnderstanding20DURequestContentType)phoneNumber;
+ (_TtC21DocumentUnderstanding20DURequestContentType)poem;
+ (_TtC21DocumentUnderstanding20DURequestContentType)posTags;
+ (_TtC21DocumentUnderstanding20DURequestContentType)userInterfaceUnderstanding;
+ (_TtC21DocumentUnderstanding20DURequestContentType)wikiDataTopic;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (_TtC21DocumentUnderstanding20DURequestContentType)init;
- (_TtC21DocumentUnderstanding20DURequestContentType)initWithAbilitiesToUnion:(id)a3;
- (_TtC21DocumentUnderstanding20DURequestContentType)initWithRawValue:(int64_t)a3;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (int64_t)rawValue;
- (void)formIntersection:(id)a3;
- (void)formSymmetricDifference:(id)a3;
- (void)formUnion:(id)a3;
- (void)setRawValue:(int64_t)a3;
@end

@implementation DURequestContentType

+ (_TtC21DocumentUnderstanding20DURequestContentType)languageTag
{
  swift_getObjCClassMetadata();
  id v2 = static DURequestContentType.languageTag.getter();
  return (_TtC21DocumentUnderstanding20DURequestContentType *)v2;
}

+ (_TtC21DocumentUnderstanding20DURequestContentType)wikiDataTopic
{
  swift_getObjCClassMetadata();
  id v2 = static DURequestContentType.wikiDataTopic.getter();
  return (_TtC21DocumentUnderstanding20DURequestContentType *)v2;
}

+ (_TtC21DocumentUnderstanding20DURequestContentType)date
{
  swift_getObjCClassMetadata();
  id v2 = static DURequestContentType.date.getter();
  return (_TtC21DocumentUnderstanding20DURequestContentType *)v2;
}

+ (_TtC21DocumentUnderstanding20DURequestContentType)address
{
  swift_getObjCClassMetadata();
  id v2 = static DURequestContentType.address.getter();
  return (_TtC21DocumentUnderstanding20DURequestContentType *)v2;
}

+ (_TtC21DocumentUnderstanding20DURequestContentType)link
{
  swift_getObjCClassMetadata();
  id v2 = static DURequestContentType.link.getter();
  return (_TtC21DocumentUnderstanding20DURequestContentType *)v2;
}

+ (_TtC21DocumentUnderstanding20DURequestContentType)phoneNumber
{
  swift_getObjCClassMetadata();
  id v2 = static DURequestContentType.phoneNumber.getter();
  return (_TtC21DocumentUnderstanding20DURequestContentType *)v2;
}

+ (_TtC21DocumentUnderstanding20DURequestContentType)navigationTitle
{
  swift_getObjCClassMetadata();
  id v2 = static DURequestContentType.navigationTitle.getter();
  return (_TtC21DocumentUnderstanding20DURequestContentType *)v2;
}

+ (_TtC21DocumentUnderstanding20DURequestContentType)userInterfaceUnderstanding
{
  swift_getObjCClassMetadata();
  id v2 = static DURequestContentType.userInterfaceUnderstanding.getter();
  return (_TtC21DocumentUnderstanding20DURequestContentType *)v2;
}

+ (_TtC21DocumentUnderstanding20DURequestContentType)category
{
  swift_getObjCClassMetadata();
  id v2 = static DURequestContentType.category.getter();
  return (_TtC21DocumentUnderstanding20DURequestContentType *)v2;
}

+ (_TtC21DocumentUnderstanding20DURequestContentType)poem
{
  swift_getObjCClassMetadata();
  id v2 = static DURequestContentType.poem.getter();
  return (_TtC21DocumentUnderstanding20DURequestContentType *)v2;
}

+ (_TtC21DocumentUnderstanding20DURequestContentType)posTags
{
  swift_getObjCClassMetadata();
  id v2 = static DURequestContentType.posTags.getter();
  return (_TtC21DocumentUnderstanding20DURequestContentType *)v2;
}

+ (_TtC21DocumentUnderstanding20DURequestContentType)foundInEvent
{
  swift_getObjCClassMetadata();
  id v2 = static DURequestContentType.foundInEvent.getter();
  return (_TtC21DocumentUnderstanding20DURequestContentType *)v2;
}

+ (_TtC21DocumentUnderstanding20DURequestContentType)foundInEventClassification
{
  swift_getObjCClassMetadata();
  id v2 = static DURequestContentType.foundInEventClassification.getter();
  return (_TtC21DocumentUnderstanding20DURequestContentType *)v2;
}

- (int64_t)rawValue
{
  return DURequestContentType.hash.getter();
}

- (void)setRawValue:(int64_t)a3
{
}

- (_TtC21DocumentUnderstanding20DURequestContentType)init
{
  return (_TtC21DocumentUnderstanding20DURequestContentType *)DURequestContentType.init()();
}

- (_TtC21DocumentUnderstanding20DURequestContentType)initWithRawValue:(int64_t)a3
{
  return (_TtC21DocumentUnderstanding20DURequestContentType *)DURequestContentType.init(rawValue:)(a3);
}

- (_TtC21DocumentUnderstanding20DURequestContentType)initWithAbilitiesToUnion:(id)a3
{
  swift_getObjectType();
  unint64_t v3 = sub_23697B1DC();
  return (_TtC21DocumentUnderstanding20DURequestContentType *)DURequestContentType.init(abilitiesToUnion:)(v3);
}

- (BOOL)isEmpty
{
  return DURequestContentType.isEmpty.getter();
}

- (int64_t)hash
{
  return DURequestContentType.hash.getter();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23697B5DC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = DURequestContentType.isEqual(_:)((uint64_t)v8);

  sub_2367CA5E4((uint64_t)v8, (uint64_t *)&unk_26AD8BC30);
  return v6;
}

- (id)copyWithZone:(void *)a3
{
  unint64_t v3 = self;
  DURequestContentType.copy(with:)(v6);

  sub_2367CBEE8(v6, v6[3]);
  v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (void)formUnion:(id)a3
{
}

- (void)formIntersection:(id)a3
{
}

- (void)formSymmetricDifference:(id)a3
{
}

@end