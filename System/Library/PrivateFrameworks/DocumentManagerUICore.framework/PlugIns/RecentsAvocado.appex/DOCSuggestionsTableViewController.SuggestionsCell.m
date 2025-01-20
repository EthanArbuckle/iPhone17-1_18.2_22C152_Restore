@interface DOCSuggestionsTableViewController.SuggestionsCell
- (_TtCC14RecentsAvocado33DOCSuggestionsTableViewControllerP33_CE844EF2E811C2873612B9E3DC34D74C15SuggestionsCell)initWithCoder:(id)a3;
- (_TtCC14RecentsAvocado33DOCSuggestionsTableViewControllerP33_CE844EF2E811C2873612B9E3DC34D74C15SuggestionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DOCSuggestionsTableViewController.SuggestionsCell

- (_TtCC14RecentsAvocado33DOCSuggestionsTableViewControllerP33_CE844EF2E811C2873612B9E3DC34D74C15SuggestionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_1004CDB50();
    NSString v6 = sub_1004CDB10();
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

- (_TtCC14RecentsAvocado33DOCSuggestionsTableViewControllerP33_CE844EF2E811C2873612B9E3DC34D74C15SuggestionsCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCSuggestionsTableViewController.SuggestionsCell();
  return [(DOCSuggestionsTableViewController.SuggestionsCell *)&v5 initWithCoder:a3];
}

@end