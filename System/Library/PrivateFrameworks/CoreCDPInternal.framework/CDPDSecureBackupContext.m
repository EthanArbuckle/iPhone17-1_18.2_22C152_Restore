@interface CDPDSecureBackupContext
- (BOOL)nonViableRequiresRepair;
- (BOOL)octagonCapableRecordsExist;
- (BOOL)silentRecovery;
- (BOOL)synchronous;
- (BOOL)usePreviouslyCachedRecoveryKey;
- (BOOL)usePreviouslyCachedSecret;
- (CDPDCircleJoinResult)circleJoinResult;
- (CDPDevice)device;
- (NSString)localSecret;
- (NSString)preRecordUUID;
- (NSString)recoveryKey;
- (NSString)recoverySecret;
- (NSString)telemetryDeviceSessionID;
- (NSString)telemetryFlowID;
- (id)description;
- (unint64_t)localSecretType;
- (void)setCircleJoinResult:(id)a3;
- (void)setDevice:(id)a3;
- (void)setLocalSecret:(id)a3;
- (void)setLocalSecretType:(unint64_t)a3;
- (void)setNonViableRequiresRepair:(BOOL)a3;
- (void)setOctagonCapableRecordsExist:(BOOL)a3;
- (void)setPreRecordUUID:(id)a3;
- (void)setRecoveryKey:(id)a3;
- (void)setRecoverySecret:(id)a3;
- (void)setSilentRecovery:(BOOL)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)setTelemetryDeviceSessionID:(id)a3;
- (void)setTelemetryFlowID:(id)a3;
- (void)setUsePreviouslyCachedRecoveryKey:(BOOL)a3;
- (void)setUsePreviouslyCachedSecret:(BOOL)a3;
@end

@implementation CDPDSecureBackupContext

- (id)description
{
  v3 = NSString;
  v4 = [(CDPDSecureBackupContext *)self localSecret];
  v5 = @"YES";
  if (v4) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = [(CDPDSecureBackupContext *)self recoverySecret];
  if (!v7) {
    v5 = @"NO";
  }
  v8 = [(CDPDSecureBackupContext *)self preRecordUUID];
  v9 = [v3 stringWithFormat:@"<CDPDSecureBackupContext: local: %@ remote: %@ preRecord: %@>", v6, v5, v8];

  return v9;
}

- (NSString)localSecret
{
  return self->_localSecret;
}

- (void)setLocalSecret:(id)a3
{
}

- (unint64_t)localSecretType
{
  return self->_localSecretType;
}

- (void)setLocalSecretType:(unint64_t)a3
{
  self->_localSecretType = a3;
}

- (CDPDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSString)recoverySecret
{
  return self->_recoverySecret;
}

- (void)setRecoverySecret:(id)a3
{
}

- (BOOL)silentRecovery
{
  return self->_silentRecovery;
}

- (void)setSilentRecovery:(BOOL)a3
{
  self->_silentRecovery = a3;
}

- (BOOL)octagonCapableRecordsExist
{
  return self->_octagonCapableRecordsExist;
}

- (void)setOctagonCapableRecordsExist:(BOOL)a3
{
  self->_octagonCapableRecordsExist = a3;
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
}

- (BOOL)usePreviouslyCachedRecoveryKey
{
  return self->_usePreviouslyCachedRecoveryKey;
}

- (void)setUsePreviouslyCachedRecoveryKey:(BOOL)a3
{
  self->_usePreviouslyCachedRecoveryKey = a3;
}

- (NSString)telemetryDeviceSessionID
{
  return self->_telemetryDeviceSessionID;
}

- (void)setTelemetryDeviceSessionID:(id)a3
{
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
}

- (BOOL)usePreviouslyCachedSecret
{
  return self->_usePreviouslyCachedSecret;
}

- (void)setUsePreviouslyCachedSecret:(BOOL)a3
{
  self->_usePreviouslyCachedSecret = a3;
}

- (CDPDCircleJoinResult)circleJoinResult
{
  return self->_circleJoinResult;
}

- (void)setCircleJoinResult:(id)a3
{
}

- (NSString)preRecordUUID
{
  return self->_preRecordUUID;
}

- (void)setPreRecordUUID:(id)a3
{
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (BOOL)nonViableRequiresRepair
{
  return self->_nonViableRequiresRepair;
}

- (void)setNonViableRequiresRepair:(BOOL)a3
{
  self->_nonViableRequiresRepair = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preRecordUUID, 0);
  objc_storeStrong((id *)&self->_circleJoinResult, 0);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_telemetryDeviceSessionID, 0);
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_recoverySecret, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_localSecret, 0);
}

@end