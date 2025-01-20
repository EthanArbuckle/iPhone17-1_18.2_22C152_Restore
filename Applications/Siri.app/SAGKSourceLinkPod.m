@interface SAGKSourceLinkPod
- (id)_convertedCardSections;
@end

@implementation SAGKSourceLinkPod

- (id)_convertedCardSections
{
  id v3 = objc_alloc_init((Class)SFRowCardSection);
  [v3 setImageIsRightAligned:1];
  id v4 = objc_alloc_init((Class)SFRichText);
  v5 = sub_1000606C4(@"SEE_MORE_ON_PUNCHOUT_FORMAT");
  v6 = [(SAGKSourceLinkPod *)self punchOut];
  v7 = [v6 punchOutName];
  v8 = +[NSString stringWithValidatedFormat:v5, @"%@", 0, v7 validFormatSpecifiers error];
  [v4 setText:v8];

  [v3 setLeadingText:v4];
  v9 = [(SAGKSourceLinkPod *)self punchOut];
  v10 = [v9 _convertedPunchout];
  v15 = v10;
  v11 = +[NSArray arrayWithObjects:&v15 count:1];
  [v3 setPunchoutOptions:v11];

  [v3 setSeparatorStyle:5];
  id v14 = v3;
  v12 = +[NSArray arrayWithObjects:&v14 count:1];

  return v12;
}

@end