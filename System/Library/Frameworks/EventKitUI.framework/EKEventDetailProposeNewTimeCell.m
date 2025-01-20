@interface EKEventDetailProposeNewTimeCell
- (BOOL)hasCustomLayout;
- (BOOL)shouldDisplayForEvent;
- (BOOL)update;
- (EKEventDetailProposeNewTimeCell)initWithEvent:(id)a3 editable:(BOOL)a4;
@end

@implementation EKEventDetailProposeNewTimeCell

- (EKEventDetailProposeNewTimeCell)initWithEvent:(id)a3 editable:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EKEventDetailProposeNewTimeCell;
  return [(EKEventDetailCell *)&v5 initWithEvent:a3 editable:a4 style:1];
}

- (BOOL)hasCustomLayout
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v2 pointSize];
  BOOL v4 = v3 >= 18.5;

  return v4;
}

- (BOOL)shouldDisplayForEvent
{
  return [(EKEvent *)self->super._event isExternallyOrganizedInvitation];
}

- (BOOL)update
{
  BOOL v3 = [(EKEventDetailProposeNewTimeCell *)self shouldDisplayForEvent];
  if (!v3) {
    return v3;
  }
  BOOL v4 = [MEMORY[0x1E4FB1618] labelColor];
  objc_super v5 = [(EKEvent *)self->super._event proposedStartDate];

  if (!v5)
  {
    v8 = EventKitUIBundle();
    v9 = v8;
    v11 = @"Propose New Time";
LABEL_7:
    v10 = [v8 localizedStringForKey:v11 value:&stru_1F0CC2140 table:0];
    goto LABEL_8;
  }
  v6 = [(EKEvent *)self->super._event selfAttendee];
  int v7 = [v6 proposedStartDateStatus];

  v8 = EventKitUIBundle();
  v9 = v8;
  if (v7 != 3)
  {
    v11 = @"Proposed Time";
    goto LABEL_7;
  }
  v10 = [v8 localizedStringForKey:@"Proposed Time Declined" value:&stru_1F0CC2140 table:0];

  [MEMORY[0x1E4FB1618] redColor];
  BOOL v4 = v9 = v4;
LABEL_8:

  v12 = [(EKEventDetailProposeNewTimeCell *)self textLabel];
  [v12 setText:v10];

  v13 = [(EKEventDetailProposeNewTimeCell *)self textLabel];
  [v13 setTextColor:v4];

  v14 = [(EKEventDetailProposeNewTimeCell *)self textLabel];
  [v14 setNumberOfLines:0];

  v15 = [(EKEvent *)self->super._event proposedStartDate];
  if (v15)
  {
    v16 = EventKitUIBundle();
    v17 = [v16 localizedStringForKey:@"Date Time format", @"%@, %@", 0 value table];

    v18 = NSString;
    v19 = [v15 localizedRelativeDateStringShortened:1];
    v20 = [v15 timeStringAlwaysIncludeMinutes:0];
    v21 = objc_msgSend(v18, "localizedStringWithFormat:", v17, v19, v20);

    v22 = [(EKEventDetailProposeNewTimeCell *)self detailTextLabel];
    [v22 setText:v21];

    v23 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v24 = [(EKEventDetailProposeNewTimeCell *)self detailTextLabel];
    [v24 setTextColor:v23];
  }
  [(EKEventDetailProposeNewTimeCell *)self setAccessoryType:1];

  return v3;
}

@end