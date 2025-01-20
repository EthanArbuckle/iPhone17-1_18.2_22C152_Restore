@interface DOCSuggestionsTableViewController.SuggestionsCell
- (_TtCC17RecentsAppPopover33DOCSuggestionsTableViewControllerP33_A0FB933F39B98BF5C569A63716A826E715SuggestionsCell)initWithCoder:(id)a3;
- (_TtCC17RecentsAppPopover33DOCSuggestionsTableViewControllerP33_A0FB933F39B98BF5C569A63716A826E715SuggestionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DOCSuggestionsTableViewController.SuggestionsCell

- (_TtCC17RecentsAppPopover33DOCSuggestionsTableViewControllerP33_A0FB933F39B98BF5C569A63716A826E715SuggestionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_1004BEB10();
    NSString v6 = sub_1004BEAD0();
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

- (_TtCC17RecentsAppPopover33DOCSuggestionsTableViewControllerP33_A0FB933F39B98BF5C569A63716A826E715SuggestionsCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCSuggestionsTableViewController.SuggestionsCell();
  return [(DOCSuggestionsTableViewController.SuggestionsCell *)&v5 initWithCoder:a3];
}

@end