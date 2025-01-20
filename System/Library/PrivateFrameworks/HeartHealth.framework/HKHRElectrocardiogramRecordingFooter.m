@interface HKHRElectrocardiogramRecordingFooter
- (HKHRElectrocardiogramRecordingFooter)initWithText:(id)a3 link:(id)a4 url:(id)a5;
- (NSString)footerLink;
- (NSString)footerText;
- (NSString)linkURL;
@end

@implementation HKHRElectrocardiogramRecordingFooter

- (HKHRElectrocardiogramRecordingFooter)initWithText:(id)a3 link:(id)a4 url:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKHRElectrocardiogramRecordingFooter;
  v11 = [(HKHRElectrocardiogramRecordingFooter *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    footerText = v11->_footerText;
    v11->_footerText = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    footerLink = v11->_footerLink;
    v11->_footerLink = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    linkURL = v11->_linkURL;
    v11->_linkURL = (NSString *)v16;
  }
  return v11;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (NSString)footerLink
{
  return self->_footerLink;
}

- (NSString)linkURL
{
  return self->_linkURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_footerLink, 0);

  objc_storeStrong((id *)&self->_footerText, 0);
}

@end