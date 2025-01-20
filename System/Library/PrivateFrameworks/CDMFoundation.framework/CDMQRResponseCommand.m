@interface CDMQRResponseCommand
+ (id)convertRewriteHypo2RewriteMsgForInfoDomains:(id)a3;
- (CDMQRResponseCommand)initWithResponse:(id)a3;
- (SIRINLUEXTERNALRewriteMessage)rewriteMsg;
- (SIRINLUINTERNALQUERYREWRITEQRResponse)qrResponse;
- (void)setQrResponse:(id)a3;
- (void)setRewriteMsg:(id)a3;
@end

@implementation CDMQRResponseCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewriteMsg, 0);
  objc_storeStrong((id *)&self->_qrResponse, 0);
}

- (void)setRewriteMsg:(id)a3
{
}

- (SIRINLUEXTERNALRewriteMessage)rewriteMsg
{
  return self->_rewriteMsg;
}

- (void)setQrResponse:(id)a3
{
}

- (SIRINLUINTERNALQUERYREWRITEQRResponse)qrResponse
{
  return self->_qrResponse;
}

- (CDMQRResponseCommand)initWithResponse:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CDMQRResponseCommand;
  v5 = [(CDMBaseCommand *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    qrResponse = v5->_qrResponse;
    v5->_qrResponse = (SIRINLUINTERNALQUERYREWRITEQRResponse *)v6;

    v8 = [(SIRINLUINTERNALQUERYREWRITEQRResponse *)v5->_qrResponse rewriteHypotheses];
    v9 = [v8 firstObject];

    uint64_t v10 = +[CDMQRResponseCommand convertRewriteHypo2RewriteMsgForInfoDomains:v9];
    rewriteMsg = v5->_rewriteMsg;
    v5->_rewriteMsg = (SIRINLUEXTERNALRewriteMessage *)v10;
  }
  return v5;
}

+ (id)convertRewriteHypo2RewriteMsgForInfoDomains:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v6 = 0;
    goto LABEL_11;
  }
  id v4 = objc_opt_new();
  if (![v3 rewriteType])
  {
    v7 = [v3 utterance];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      uint64_t v5 = 2;
      goto LABEL_9;
    }
  }
  if ([v3 rewriteType] == 1)
  {
    uint64_t v5 = 1;
LABEL_9:
    [v4 setRewriteType:v5];
    v9 = [v3 utterance];
    [v4 setRewrittenUtterance:v9];

    id v6 = v4;
    goto LABEL_10;
  }
  id v6 = 0;
LABEL_10:

LABEL_11:
  return v6;
}

@end