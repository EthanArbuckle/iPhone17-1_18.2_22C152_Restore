@interface DOCSuggestionsTableViewController.SuggestionsCell
- (_TtCC18DocumentAppIntents33DOCSuggestionsTableViewControllerP33_2C9BD8569C99F157A683576058E5E3DD15SuggestionsCell)initWithCoder:(id)a3;
- (_TtCC18DocumentAppIntents33DOCSuggestionsTableViewControllerP33_2C9BD8569C99F157A683576058E5E3DD15SuggestionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DOCSuggestionsTableViewController.SuggestionsCell

- (_TtCC18DocumentAppIntents33DOCSuggestionsTableViewControllerP33_2C9BD8569C99F157A683576058E5E3DD15SuggestionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_1004F4510();
    NSString v6 = sub_1004F44D0();
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

- (_TtCC18DocumentAppIntents33DOCSuggestionsTableViewControllerP33_2C9BD8569C99F157A683576058E5E3DD15SuggestionsCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCSuggestionsTableViewController.SuggestionsCell();
  return [(DOCSuggestionsTableViewController.SuggestionsCell *)&v5 initWithCoder:a3];
}

@end