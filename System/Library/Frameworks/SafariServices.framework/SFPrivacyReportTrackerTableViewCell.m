@interface SFPrivacyReportTrackerTableViewCell
- (SFPrivacyReportTrackerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (WBSKnownTrackingThirdParty)tracker;
- (void)setTracker:(id)a3;
@end

@implementation SFPrivacyReportTrackerTableViewCell

- (SFPrivacyReportTrackerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v4 = [(SFPrivacyReportTrackingTableViewCell *)self initWithDetailLabel:1 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB1618] systemTealColor];
    [(SFPrivacyReportTrackerTableViewCell *)v4 setTintColor:v5];

    v6 = v4;
  }

  return v4;
}

- (void)setTracker:(id)a3
{
  v10 = (WBSKnownTrackingThirdParty *)a3;
  if (self->_tracker != v10)
  {
    objc_storeStrong((id *)&self->_tracker, a3);
    v5 = [(WBSKnownTrackingThirdParty *)v10 domain];
    v6 = [(SFPrivacyReportTrackingTableViewCell *)self domainLabel];
    [v6 setText:v5];

    v7 = [(WBSKnownTrackingThirdParty *)v10 ownerName];
    v8 = [(SFPrivacyReportTrackingTableViewCell *)self domainDetailLabel];
    [v8 setText:v7];

    v9 = [(WBSKnownTrackingThirdParty *)v10 firstParties];
    -[SFPrivacyReportTrackingTableViewCell setCount:](self, "setCount:", (double)(unint64_t)[v9 count]);
  }
}

- (WBSKnownTrackingThirdParty)tracker
{
  return self->_tracker;
}

- (void).cxx_destruct
{
}

@end