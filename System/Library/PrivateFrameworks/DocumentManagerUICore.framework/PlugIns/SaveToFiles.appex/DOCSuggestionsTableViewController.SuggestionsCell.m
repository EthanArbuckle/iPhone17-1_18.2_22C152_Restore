@interface DOCSuggestionsTableViewController.SuggestionsCell
- (_TtCC11SaveToFiles33DOCSuggestionsTableViewControllerP33_5872931F072FC6063DF43BF08D61EDF615SuggestionsCell)initWithCoder:(id)a3;
- (_TtCC11SaveToFiles33DOCSuggestionsTableViewControllerP33_5872931F072FC6063DF43BF08D61EDF615SuggestionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DOCSuggestionsTableViewController.SuggestionsCell

- (_TtCC11SaveToFiles33DOCSuggestionsTableViewControllerP33_5872931F072FC6063DF43BF08D61EDF615SuggestionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_1004D1240();
    NSString v6 = sub_1004D1200();
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

- (_TtCC11SaveToFiles33DOCSuggestionsTableViewControllerP33_5872931F072FC6063DF43BF08D61EDF615SuggestionsCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCSuggestionsTableViewController.SuggestionsCell();
  return [(DOCSuggestionsTableViewController.SuggestionsCell *)&v5 initWithCoder:a3];
}

@end