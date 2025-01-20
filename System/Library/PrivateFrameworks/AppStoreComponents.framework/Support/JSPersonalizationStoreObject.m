@interface JSPersonalizationStoreObject
- (_TtC19appstorecomponentsd28JSPersonalizationStoreObject)init;
- (id)getTasteProfileToken;
@end

@implementation JSPersonalizationStoreObject

- (_TtC19appstorecomponentsd28JSPersonalizationStoreObject)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(JSPersonalizationStoreObject *)&v3 init];
}

- (id)getTasteProfileToken
{
  sub_10002EE34(0, &qword_1001A4098);
  objc_super v3 = self;
  v4 = (void *)static JSContext.requiredCurrent.getter();
  v5 = (void *)JSContext.propagateErrorsToExceptions(_:)();

  return v5;
}

@end