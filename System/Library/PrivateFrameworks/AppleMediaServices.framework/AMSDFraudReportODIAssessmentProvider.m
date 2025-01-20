@interface AMSDFraudReportODIAssessmentProvider
- (AMSDFraudReportODIAssessmentProvider)initWithError:(id *)a3;
- (void)assessmentWithCompletion:(id)a3;
- (void)provideFeedbackWithOutcome:(unint64_t)a3;
@end

@implementation AMSDFraudReportODIAssessmentProvider

- (AMSDFraudReportODIAssessmentProvider)initWithError:(id *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)AMSDFraudReportODIAssessmentProvider;
  v4 = [(AMSDFraudReportODIAssessmentProvider *)&v16 init];
  if (!v4) {
    goto LABEL_8;
  }
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  v5 = (void *)qword_1001302B8;
  uint64_t v25 = qword_1001302B8;
  if (!qword_1001302B8)
  {
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_10002D19C;
    v20 = &unk_100112770;
    v21 = &v22;
    sub_10002D19C((uint64_t)&v17);
    v5 = (void *)v23[3];
  }
  v6 = v5;
  _Block_object_dispose(&v22, 8);
  id v7 = [v6 alloc];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  v8 = (id *)qword_1001302C8;
  uint64_t v25 = qword_1001302C8;
  if (!qword_1001302C8)
  {
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_10002D368;
    v20 = &unk_100112770;
    v21 = &v22;
    v9 = (void *)sub_10002D1F4();
    v10 = dlsym(v9, "ODIServiceProviderIdTDMTrustedInference");
    *(void *)(v21[1] + 24) = v10;
    qword_1001302C8 = *(void *)(v21[1] + 24);
    v8 = (id *)v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (!v8) {
    sub_1000CB5C0();
  }
  id v11 = *v8;
  v12 = (ODISession *)[v7 initWithServiceIdentifier:v11 forDSIDType:2];
  session = v4->_session;
  v4->_session = v12;

  if (!v4->_session)
  {
    if (a3)
    {
      AMSError();
      v14 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
LABEL_8:
    v14 = v4;
  }

  return v14;
}

- (void)assessmentWithCompletion:(id)a3
{
}

- (void)provideFeedbackWithOutcome:(unint64_t)a3
{
  if (a3 >= 3)
  {
    id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Unhandled outcome type" userInfo:0];
    objc_exception_throw(v4);
  }
  session = self->_session;
  -[ODISession provideFeedbackOnPayloadOutcome:](session, "provideFeedbackOnPayloadOutcome:");
}

- (void).cxx_destruct
{
}

@end