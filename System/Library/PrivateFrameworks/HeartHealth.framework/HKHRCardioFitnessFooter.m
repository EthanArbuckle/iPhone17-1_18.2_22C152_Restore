@interface HKHRCardioFitnessFooter
- (HKHRCardioFitnessFooter)initWithText:(id)a3 link:(id)a4 url:(id)a5;
- (NSString)footerLink;
- (NSString)footerText;
- (NSString)linkURL;
- (void)setFooterLink:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setLinkURL:(id)a3;
@end

@implementation HKHRCardioFitnessFooter

- (HKHRCardioFitnessFooter)initWithText:(id)a3 link:(id)a4 url:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKHRCardioFitnessFooter;
  v11 = [(HKHRCardioFitnessFooter *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(HKHRCardioFitnessFooter *)v11 setFooterText:v8];
    [(HKHRCardioFitnessFooter *)v12 setFooterLink:v9];
    [(HKHRCardioFitnessFooter *)v12 setLinkURL:v10];
    v13 = v12;
  }

  return v12;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (NSString)footerLink
{
  return self->_footerLink;
}

- (void)setFooterLink:(id)a3
{
}

- (NSString)linkURL
{
  return self->_linkURL;
}

- (void)setLinkURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_footerLink, 0);

  objc_storeStrong((id *)&self->_footerText, 0);
}

@end