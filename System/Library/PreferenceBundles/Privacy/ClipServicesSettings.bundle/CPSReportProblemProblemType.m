@interface CPSReportProblemProblemType
- (BOOL)offerDeveloperWebsite;
- (CPSReportProblemProblemType)init;
- (CPSReportProblemProblemType)initWithLocalizedTitle:(id)a3 localizedUpperCaseTitle:(id)a4 label:(id)a5 identifier:(id)a6 offerDeveloperWebsite:(BOOL)a7;
- (NSNumber)identifier;
- (NSString)label;
- (NSString)localizedTitle;
- (NSString)localizedUpperCaseTitle;
@end

@implementation CPSReportProblemProblemType

- (CPSReportProblemProblemType)initWithLocalizedTitle:(id)a3 localizedUpperCaseTitle:(id)a4 label:(id)a5 identifier:(id)a6 offerDeveloperWebsite:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CPSReportProblemProblemType;
  v16 = [(CPSReportProblemProblemType *)&v25 init];
  if (v16)
  {
    v17 = (NSString *)[v12 copy];
    localizedTitle = v16->_localizedTitle;
    v16->_localizedTitle = v17;

    v19 = (NSString *)[v13 copy];
    localizedUpperCaseTitle = v16->_localizedUpperCaseTitle;
    v16->_localizedUpperCaseTitle = v19;

    v21 = (NSString *)[v14 copy];
    label = v16->_label;
    v16->_label = v21;

    objc_storeStrong((id *)&v16->_identifier, a6);
    v16->_offerDeveloperWebsite = a7;
    v23 = v16;
  }

  return v16;
}

- (CPSReportProblemProblemType)init
{
  id v2 = +[NSException exceptionWithName:NSGenericException reason:@"-init is not available." userInfo:0];
  objc_exception_throw(v2);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedUpperCaseTitle
{
  return self->_localizedUpperCaseTitle;
}

- (NSString)label
{
  return self->_label;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (BOOL)offerDeveloperWebsite
{
  return self->_offerDeveloperWebsite;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_localizedUpperCaseTitle, 0);

  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end