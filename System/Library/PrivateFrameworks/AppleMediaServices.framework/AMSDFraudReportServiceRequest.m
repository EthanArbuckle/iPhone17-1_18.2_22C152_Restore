@interface AMSDFraudReportServiceRequest
- (AMSDFraudReportServiceRequest)initWithNameSpace:(id)a3 reportedScore:(unsigned __int8)a4 blindedMessage:(id)a5 keyID:(id)a6 authenticationTokenType:(unint64_t)a7 shouldIncludeODIAssessment:(BOOL)a8;
- (BOOL)shouldIncludeODIAssessment;
- (NSString)blindedMessage;
- (NSString)keyID;
- (NSString)nameSpace;
- (unint64_t)authenticationTokenType;
- (unsigned)reportedScore;
@end

@implementation AMSDFraudReportServiceRequest

- (AMSDFraudReportServiceRequest)initWithNameSpace:(id)a3 reportedScore:(unsigned __int8)a4 blindedMessage:(id)a5 keyID:(id)a6 authenticationTokenType:(unint64_t)a7 shouldIncludeODIAssessment:(BOOL)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  if (!v14 || !v15)
  {
    id v26 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"nameSpace, reportedScore, blindedMessage, keyID and grandSlamTokenIdentifier all must be nonnull" userInfo:0];
    objc_exception_throw(v26);
  }
  v17 = v16;
  v27.receiver = self;
  v27.super_class = (Class)AMSDFraudReportServiceRequest;
  v18 = [(AMSDFraudReportServiceRequest *)&v27 init];
  if (v18)
  {
    v19 = (NSString *)[v14 copy];
    nameSpace = v18->_nameSpace;
    v18->_nameSpace = v19;

    v18->_reportedScore = a4;
    v21 = (NSString *)[v15 copy];
    blindedMessage = v18->_blindedMessage;
    v18->_blindedMessage = v21;

    v23 = (NSString *)[v17 copy];
    keyID = v18->_keyID;
    v18->_keyID = v23;

    v18->_authenticationTokenType = a7;
    v18->_shouldIncludeODIAssessment = a8;
  }

  return v18;
}

- (NSString)nameSpace
{
  return self->_nameSpace;
}

- (unsigned)reportedScore
{
  return self->_reportedScore;
}

- (NSString)blindedMessage
{
  return self->_blindedMessage;
}

- (NSString)keyID
{
  return self->_keyID;
}

- (unint64_t)authenticationTokenType
{
  return self->_authenticationTokenType;
}

- (BOOL)shouldIncludeODIAssessment
{
  return self->_shouldIncludeODIAssessment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyID, 0);
  objc_storeStrong((id *)&self->_blindedMessage, 0);
  objc_storeStrong((id *)&self->_nameSpace, 0);
}

@end