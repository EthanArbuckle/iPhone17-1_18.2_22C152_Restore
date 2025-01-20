@interface TTRSheetViewFactory
+ (id)ttrSheetView:(id)a3;
- (_TtC7ChatKit19TTRSheetViewFactory)init;
@end

@implementation TTRSheetViewFactory

+ (id)ttrSheetView:(id)a3
{
  id v3 = a3;
  v4 = sub_18F634608(v3);

  return v4;
}

- (_TtC7ChatKit19TTRSheetViewFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRSheetViewFactory();
  return [(TTRSheetViewFactory *)&v3 init];
}

@end