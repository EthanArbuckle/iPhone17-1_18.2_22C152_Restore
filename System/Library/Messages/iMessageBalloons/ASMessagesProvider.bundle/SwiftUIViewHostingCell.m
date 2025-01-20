@interface SwiftUIViewHostingCell
- (_TtC18ASMessagesProvider22SwiftUIViewHostingCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider22SwiftUIViewHostingCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation SwiftUIViewHostingCell

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SwiftUIViewHostingCell();
  id v2 = v3.receiver;
  [(SwiftUIViewHostingCell *)&v3 prepareForReuse];
  sub_77DED0();
}

- (_TtC18ASMessagesProvider22SwiftUIViewHostingCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SwiftUIViewHostingCell();
  return -[SwiftUIViewHostingCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC18ASMessagesProvider22SwiftUIViewHostingCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SwiftUIViewHostingCell();
  return [(SwiftUIViewHostingCell *)&v5 initWithCoder:a3];
}

@end