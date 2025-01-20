@interface SFPrivacyReportWebsiteDetailSection
- (NSArray)trackers;
- (NSString)title;
- (SFPrivacyReportWebsiteDetailSection)initWithTitle:(id)a3 trackers:(id)a4;
@end

@implementation SFPrivacyReportWebsiteDetailSection

- (SFPrivacyReportWebsiteDetailSection)initWithTitle:(id)a3 trackers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFPrivacyReportWebsiteDetailSection;
  v8 = [(SFPrivacyReportWebsiteDetailSection *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    trackers = v8->_trackers;
    v8->_trackers = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)trackers
{
  return self->_trackers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackers, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end