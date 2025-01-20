@interface AMSDFraudReportBlindedTransaction
- (AMSDFraudReportBlindedTransaction)initWithTDMToken:(id)a3 pks:(id)a4 keyID:(id)a5;
- (NSData)pks;
- (NSString)blindedMessage;
- (NSString)keyID;
- (TDMToken)tdmToken;
@end

@implementation AMSDFraudReportBlindedTransaction

- (AMSDFraudReportBlindedTransaction)initWithTDMToken:(id)a3 pks:(id)a4 keyID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9 || !v10)
  {
    id v23 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"tdmToken and pks must both be non-nil" userInfo:0];
    objc_exception_throw(v23);
  }
  v12 = v11;
  v24.receiver = self;
  v24.super_class = (Class)AMSDFraudReportBlindedTransaction;
  v13 = [(AMSDFraudReportBlindedTransaction *)&v24 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_tdmToken, a3);
    v15 = [v9 blindedElement];
    uint64_t v16 = [v15 base64EncodedStringWithOptions:0];
    blindedMessage = v14->_blindedMessage;
    v14->_blindedMessage = (NSString *)v16;

    uint64_t v18 = [v12 base64EncodedStringWithOptions:0];
    keyID = v14->_keyID;
    v14->_keyID = (NSString *)v18;

    v20 = (NSData *)[v10 copy];
    pks = v14->_pks;
    v14->_pks = v20;
  }
  return v14;
}

- (TDMToken)tdmToken
{
  return self->_tdmToken;
}

- (NSString)blindedMessage
{
  return self->_blindedMessage;
}

- (NSString)keyID
{
  return self->_keyID;
}

- (NSData)pks
{
  return self->_pks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pks, 0);
  objc_storeStrong((id *)&self->_keyID, 0);
  objc_storeStrong((id *)&self->_blindedMessage, 0);
  objc_storeStrong((id *)&self->_tdmToken, 0);
}

@end