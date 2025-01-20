@interface DOCPlaceholderSearchController
- (_TtC17RecentsAppPopover30DOCPlaceholderSearchController)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopover30DOCPlaceholderSearchController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC17RecentsAppPopover30DOCPlaceholderSearchController)initWithSearchResultsController:(id)a3;
@end

@implementation DOCPlaceholderSearchController

- (_TtC17RecentsAppPopover30DOCPlaceholderSearchController)initWithSearchResultsController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCPlaceholderSearchController();
  return [(DOCPlaceholderSearchController *)&v5 initWithSearchResultsController:a3];
}

- (_TtC17RecentsAppPopover30DOCPlaceholderSearchController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1004BEB10();
    id v6 = a4;
    NSString v7 = sub_1004BEAD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DOCPlaceholderSearchController();
  v9 = [(DOCPlaceholderSearchController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC17RecentsAppPopover30DOCPlaceholderSearchController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCPlaceholderSearchController();
  return [(DOCPlaceholderSearchController *)&v5 initWithCoder:a3];
}

@end