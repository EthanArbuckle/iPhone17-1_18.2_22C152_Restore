@interface DSManageSharingTableCell
- (DSManageSharingTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DSManageSharingTableCell

- (DSManageSharingTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v7 = DSUILocStringForKey();
  v8 = DSUILocStringForKey();
  v11.receiver = self;
  v11.super_class = (Class)DSManageSharingTableCell;
  v9 = [(DSSafetyCheckFlowTableCell *)&v11 initWithStyle:a3 reuseIdentifier:v6 title:v7 detail:v8 systemImageNamed:@"person.2.badge.gearshape.fill"];

  return v9;
}

@end