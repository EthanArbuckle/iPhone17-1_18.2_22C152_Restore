@interface ASReportAConcernConfiguration
- (NSArray)reasons;
- (NSString)backTitle;
- (NSString)cancelTitle;
- (NSString)privacyNote;
- (NSString)reportConcernExplanation;
- (NSString)selectReasonSubtitle;
- (NSString)selectReasonTitle;
- (NSString)submitTitle;
- (NSString)title;
- (id)completion;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBackTitle:(id)a3;
- (void)setCancelTitle:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setPrivacyNote:(id)a3;
- (void)setReasons:(id)a3;
- (void)setReportConcernExplanation:(id)a3;
- (void)setSelectReasonSubtitle:(id)a3;
- (void)setSelectReasonTitle:(id)a3;
- (void)setSubmitTitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ASReportAConcernConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(ASReportAConcernConfiguration *)self title];
  [v4 setTitle:v5];

  v6 = [(ASReportAConcernConfiguration *)self backTitle];
  [v4 setBackTitle:v6];

  v7 = [(ASReportAConcernConfiguration *)self cancelTitle];
  [v4 setCancelTitle:v7];

  v8 = [(ASReportAConcernConfiguration *)self submitTitle];
  [v4 setSubmitTitle:v8];

  v9 = [(ASReportAConcernConfiguration *)self reportConcernExplanation];
  [v4 setReportConcernExplanation:v9];

  v10 = [(ASReportAConcernConfiguration *)self selectReasonTitle];
  [v4 setSelectReasonTitle:v10];

  v11 = [(ASReportAConcernConfiguration *)self selectReasonSubtitle];
  [v4 setSelectReasonSubtitle:v11];

  v12 = [(ASReportAConcernConfiguration *)self privacyNote];
  [v4 setPrivacyNote:v12];

  v13 = [(ASReportAConcernConfiguration *)self reasons];
  [v4 setReasons:v13];

  return v4;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)backTitle
{
  return self->_backTitle;
}

- (void)setBackTitle:(id)a3
{
}

- (NSString)cancelTitle
{
  return self->_cancelTitle;
}

- (void)setCancelTitle:(id)a3
{
}

- (NSString)submitTitle
{
  return self->_submitTitle;
}

- (void)setSubmitTitle:(id)a3
{
}

- (NSString)reportConcernExplanation
{
  return self->_reportConcernExplanation;
}

- (void)setReportConcernExplanation:(id)a3
{
}

- (NSString)selectReasonTitle
{
  return self->_selectReasonTitle;
}

- (void)setSelectReasonTitle:(id)a3
{
}

- (NSString)selectReasonSubtitle
{
  return self->_selectReasonSubtitle;
}

- (void)setSelectReasonSubtitle:(id)a3
{
}

- (NSString)privacyNote
{
  return self->_privacyNote;
}

- (void)setPrivacyNote:(id)a3
{
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_privacyNote, 0);
  objc_storeStrong((id *)&self->_selectReasonSubtitle, 0);
  objc_storeStrong((id *)&self->_selectReasonTitle, 0);
  objc_storeStrong((id *)&self->_reportConcernExplanation, 0);
  objc_storeStrong((id *)&self->_submitTitle, 0);
  objc_storeStrong((id *)&self->_cancelTitle, 0);
  objc_storeStrong((id *)&self->_backTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end