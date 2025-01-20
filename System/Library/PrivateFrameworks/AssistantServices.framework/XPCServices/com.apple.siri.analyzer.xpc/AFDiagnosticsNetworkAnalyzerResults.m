@interface AFDiagnosticsNetworkAnalyzerResults
- (BOOL)analyzedSuccessfulRetry;
- (BOOL)isForUserRequest;
- (BOOL)wwanPreferred;
- (NSNumber)connectionInterface;
- (NSNumber)gatewayPingDuration;
- (NSNumber)gatewayPingsDropped;
- (NSNumber)gatewayPingsSent;
- (NSNumber)knownURLLoadDuration;
- (NSNumber)sendBufferBytesRemaining;
- (NSNumber)siriSaltURLLoadDuration;
- (NSNumber)siriURLLoadDuration;
- (id)metricValue;
- (int64_t)gatewayStatus;
- (unint64_t)_durationInMillisecondsForDuration:(id)a3;
- (void)setAnalyzedSuccessfulRetry:(BOOL)a3;
- (void)setConnectionInterface:(id)a3;
- (void)setForUserRequest:(BOOL)a3;
- (void)setGatewayPingDuration:(id)a3;
- (void)setGatewayPingsDropped:(id)a3;
- (void)setGatewayPingsSent:(id)a3;
- (void)setGatewayStatus:(int64_t)a3;
- (void)setKnownURLLoadDuration:(id)a3;
- (void)setSendBufferBytesRemaining:(id)a3;
- (void)setSiriSaltURLLoadDuration:(id)a3;
- (void)setSiriURLLoadDuration:(id)a3;
- (void)setWwanPreferred:(BOOL)a3;
@end

@implementation AFDiagnosticsNetworkAnalyzerResults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatewayPingsDropped, 0);
  objc_storeStrong((id *)&self->_gatewayPingsSent, 0);
  objc_storeStrong((id *)&self->_gatewayPingDuration, 0);
  objc_storeStrong((id *)&self->_siriSaltURLLoadDuration, 0);
  objc_storeStrong((id *)&self->_siriURLLoadDuration, 0);
  objc_storeStrong((id *)&self->_knownURLLoadDuration, 0);
  objc_storeStrong((id *)&self->_sendBufferBytesRemaining, 0);
  objc_storeStrong((id *)&self->_connectionInterface, 0);
}

- (void)setGatewayPingsDropped:(id)a3
{
}

- (NSNumber)gatewayPingsDropped
{
  return self->_gatewayPingsDropped;
}

- (void)setGatewayPingsSent:(id)a3
{
}

- (NSNumber)gatewayPingsSent
{
  return self->_gatewayPingsSent;
}

- (void)setGatewayPingDuration:(id)a3
{
}

- (NSNumber)gatewayPingDuration
{
  return self->_gatewayPingDuration;
}

- (void)setGatewayStatus:(int64_t)a3
{
  self->_gatewayStatus = a3;
}

- (int64_t)gatewayStatus
{
  return self->_gatewayStatus;
}

- (void)setSiriSaltURLLoadDuration:(id)a3
{
}

- (NSNumber)siriSaltURLLoadDuration
{
  return self->_siriSaltURLLoadDuration;
}

- (void)setSiriURLLoadDuration:(id)a3
{
}

- (NSNumber)siriURLLoadDuration
{
  return self->_siriURLLoadDuration;
}

- (void)setKnownURLLoadDuration:(id)a3
{
}

- (NSNumber)knownURLLoadDuration
{
  return self->_knownURLLoadDuration;
}

- (void)setSendBufferBytesRemaining:(id)a3
{
}

- (NSNumber)sendBufferBytesRemaining
{
  return self->_sendBufferBytesRemaining;
}

- (void)setConnectionInterface:(id)a3
{
}

- (NSNumber)connectionInterface
{
  return self->_connectionInterface;
}

- (void)setWwanPreferred:(BOOL)a3
{
  self->_wwanPreferred = a3;
}

- (BOOL)wwanPreferred
{
  return self->_wwanPreferred;
}

- (void)setAnalyzedSuccessfulRetry:(BOOL)a3
{
  self->_analyzedSuccessfulRetry = a3;
}

- (BOOL)analyzedSuccessfulRetry
{
  return self->_analyzedSuccessfulRetry;
}

- (void)setForUserRequest:(BOOL)a3
{
  self->_forUserRequest = a3;
}

- (BOOL)isForUserRequest
{
  return self->_forUserRequest;
}

- (unint64_t)_durationInMillisecondsForDuration:(id)a3
{
  [a3 doubleValue];
  return (unint64_t)(v3 * 1000.0);
}

- (id)metricValue
{
  double v3 = objc_opt_new();
  v4 = [(AFDiagnosticsNetworkAnalyzerResults *)self connectionInterface];

  if (v4)
  {
    v5 = [(AFDiagnosticsNetworkAnalyzerResults *)self connectionInterface];
    objc_msgSend(v3, "setInterface:", objc_msgSend(v5, "intValue"));
  }
  objc_msgSend(v3, "setIsUserRequest:", -[AFDiagnosticsNetworkAnalyzerResults isForUserRequest](self, "isForUserRequest"));
  objc_msgSend(v3, "setAnalyzingSuccessfulRetry:", -[AFDiagnosticsNetworkAnalyzerResults analyzedSuccessfulRetry](self, "analyzedSuccessfulRetry"));
  objc_msgSend(v3, "setWwanPreferred:", -[AFDiagnosticsNetworkAnalyzerResults wwanPreferred](self, "wwanPreferred"));
  v6 = [(AFDiagnosticsNetworkAnalyzerResults *)self sendBufferBytesRemaining];

  if (v6)
  {
    v7 = [(AFDiagnosticsNetworkAnalyzerResults *)self sendBufferBytesRemaining];
    objc_msgSend(v3, "setSendBufferBytesRemaining:", objc_msgSend(v7, "intValue"));
  }
  v8 = [(AFDiagnosticsNetworkAnalyzerResults *)self knownURLLoadDuration];

  if (v8)
  {
    v9 = [(AFDiagnosticsNetworkAnalyzerResults *)self knownURLLoadDuration];
    objc_msgSend(v3, "setKnownURLLoadDuration:", -[AFDiagnosticsNetworkAnalyzerResults _durationInMillisecondsForDuration:](self, "_durationInMillisecondsForDuration:", v9));
  }
  v10 = [(AFDiagnosticsNetworkAnalyzerResults *)self siriURLLoadDuration];

  if (v10)
  {
    v11 = [(AFDiagnosticsNetworkAnalyzerResults *)self siriURLLoadDuration];
    objc_msgSend(v3, "setSiriURLLoadDuration:", -[AFDiagnosticsNetworkAnalyzerResults _durationInMillisecondsForDuration:](self, "_durationInMillisecondsForDuration:", v11));
  }
  v12 = [(AFDiagnosticsNetworkAnalyzerResults *)self siriSaltURLLoadDuration];

  if (v12)
  {
    v13 = [(AFDiagnosticsNetworkAnalyzerResults *)self siriSaltURLLoadDuration];
    objc_msgSend(v3, "setSiriSaltURLLoadDuration:", -[AFDiagnosticsNetworkAnalyzerResults _durationInMillisecondsForDuration:](self, "_durationInMillisecondsForDuration:", v13));
  }
  objc_msgSend(v3, "setGatewayStatus:", -[AFDiagnosticsNetworkAnalyzerResults gatewayStatus](self, "gatewayStatus"));
  v14 = [(AFDiagnosticsNetworkAnalyzerResults *)self gatewayPingDuration];

  if (v14)
  {
    v15 = [(AFDiagnosticsNetworkAnalyzerResults *)self gatewayPingDuration];
    objc_msgSend(v3, "setGatewayPingDuration:", -[AFDiagnosticsNetworkAnalyzerResults _durationInMillisecondsForDuration:](self, "_durationInMillisecondsForDuration:", v15));
  }
  v16 = [(AFDiagnosticsNetworkAnalyzerResults *)self gatewayPingsSent];

  if (v16)
  {
    v17 = [(AFDiagnosticsNetworkAnalyzerResults *)self gatewayPingsSent];
    objc_msgSend(v3, "setGatewayPingsSent:", objc_msgSend(v17, "unsignedIntValue"));
  }
  v18 = [(AFDiagnosticsNetworkAnalyzerResults *)self gatewayPingsDropped];

  if (v18)
  {
    v19 = [(AFDiagnosticsNetworkAnalyzerResults *)self gatewayPingsDropped];
    objc_msgSend(v3, "setGatewayPingsDropped:", objc_msgSend(v19, "unsignedIntValue"));
  }
  return v3;
}

@end