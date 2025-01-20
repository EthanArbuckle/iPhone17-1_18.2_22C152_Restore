@interface SFPrivacyReportWebsiteTableViewCell
- (SFPrivacyReportWebsiteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (WBSTrackedFirstParty)website;
- (void)setWebsite:(id)a3;
@end

@implementation SFPrivacyReportWebsiteTableViewCell

- (SFPrivacyReportWebsiteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v4 = [(SFPrivacyReportTrackingTableViewCell *)self initWithDetailLabel:0 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB1618] systemGreenColor];
    [(SFPrivacyReportWebsiteTableViewCell *)v4 setTintColor:v5];

    v6 = v4;
  }

  return v4;
}

- (void)setWebsite:(id)a3
{
  v8 = (WBSTrackedFirstParty *)a3;
  if (self->_website != v8)
  {
    objc_storeStrong((id *)&self->_website, a3);
    v5 = [(WBSTrackedFirstParty *)v8 domain];
    v6 = [(SFPrivacyReportTrackingTableViewCell *)self domainLabel];
    [v6 setText:v5];

    v7 = [(WBSTrackedFirstParty *)v8 trackers];
    -[SFPrivacyReportTrackingTableViewCell setCount:](self, "setCount:", (double)(unint64_t)[v7 count]);
  }
}

- (WBSTrackedFirstParty)website
{
  return self->_website;
}

- (void).cxx_destruct
{
}

@end