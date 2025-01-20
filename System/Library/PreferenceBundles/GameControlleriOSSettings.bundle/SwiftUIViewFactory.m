@interface SwiftUIViewFactory
+ (id)makeSwiftUIView;
- (_TtC25GameControlleriOSSettings18SwiftUIViewFactory)init;
@end

@implementation SwiftUIViewFactory

+ (id)makeSwiftUIView
{
  uint64_t v2 = type metadata accessor for GCSEntryView();
  __chkstk_darwin(v2 - 8);
  sub_523CC((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v4 = objc_allocWithZone((Class)sub_10C7C(&qword_123530));
  v5 = (void *)sub_E6600();

  return v5;
}

- (_TtC25GameControlleriOSSettings18SwiftUIViewFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SwiftUIViewFactory();
  return [(SwiftUIViewFactory *)&v3 init];
}

@end