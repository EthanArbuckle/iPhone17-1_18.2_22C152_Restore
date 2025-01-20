@interface DOCSuggestionsTableViewController.SuggestionsCell
- (_TtCC33com_apple_DocumentManager_Service33DOCSuggestionsTableViewControllerP33_4F482FA1D8279A3958DAD14DF499F7A715SuggestionsCell)initWithCoder:(id)a3;
- (_TtCC33com_apple_DocumentManager_Service33DOCSuggestionsTableViewControllerP33_4F482FA1D8279A3958DAD14DF499F7A715SuggestionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DOCSuggestionsTableViewController.SuggestionsCell

- (_TtCC33com_apple_DocumentManager_Service33DOCSuggestionsTableViewControllerP33_4F482FA1D8279A3958DAD14DF499F7A715SuggestionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_1004CD2F0();
    NSString v6 = sub_1004CD2B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCSuggestionsTableViewController.SuggestionsCell();
  v7 = [(DOCSuggestionsTableViewController.SuggestionsCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtCC33com_apple_DocumentManager_Service33DOCSuggestionsTableViewControllerP33_4F482FA1D8279A3958DAD14DF499F7A715SuggestionsCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCSuggestionsTableViewController.SuggestionsCell();
  return [(DOCSuggestionsTableViewController.SuggestionsCell *)&v5 initWithCoder:a3];
}

@end