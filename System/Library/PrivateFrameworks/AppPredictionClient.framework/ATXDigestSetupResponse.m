@interface ATXDigestSetupResponse
- (ATXDigestSetupResponse)initWithBundleId:(id)a3 avgNumBasicNotifications:(unint64_t)a4 avgNumMessageNotifications:(unint64_t)a5 avgNumTimeSensitiveNonMessageNotifications:(unint64_t)a6 numBasicNotifications:(unint64_t)a7 numMessageNotifications:(unint64_t)a8 numTimeSensitiveNonMessageNotifications:(unint64_t)a9;
- (NSString)bundleId;
- (unint64_t)avgNumBasicNotifications;
- (unint64_t)avgNumMessageNotifications;
- (unint64_t)avgNumTimeSensitiveNonMessageNotifications;
- (unint64_t)numBasicNotifications;
- (unint64_t)numMessageNotifications;
- (unint64_t)numTimeSensitiveNonMessageNotifications;
@end

@implementation ATXDigestSetupResponse

- (ATXDigestSetupResponse)initWithBundleId:(id)a3 avgNumBasicNotifications:(unint64_t)a4 avgNumMessageNotifications:(unint64_t)a5 avgNumTimeSensitiveNonMessageNotifications:(unint64_t)a6 numBasicNotifications:(unint64_t)a7 numMessageNotifications:(unint64_t)a8 numTimeSensitiveNonMessageNotifications:(unint64_t)a9
{
  id v16 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ATXDigestSetupResponse;
  v17 = [(ATXDigestSetupResponse *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_bundleId, a3);
    v18->_avgNumBasicNotifications = a4;
    v18->_avgNumMessageNotifications = a5;
    v18->_avgNumTimeSensitiveNonMessageNotifications = a6;
    v18->_numBasicNotifications = a7;
    v18->_numMessageNotifications = a8;
    v18->_numTimeSensitiveNonMessageNotifications = a9;
  }

  return v18;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (unint64_t)avgNumBasicNotifications
{
  return self->_avgNumBasicNotifications;
}

- (unint64_t)avgNumMessageNotifications
{
  return self->_avgNumMessageNotifications;
}

- (unint64_t)avgNumTimeSensitiveNonMessageNotifications
{
  return self->_avgNumTimeSensitiveNonMessageNotifications;
}

- (unint64_t)numBasicNotifications
{
  return self->_numBasicNotifications;
}

- (unint64_t)numMessageNotifications
{
  return self->_numMessageNotifications;
}

- (unint64_t)numTimeSensitiveNonMessageNotifications
{
  return self->_numTimeSensitiveNonMessageNotifications;
}

- (void).cxx_destruct
{
}

@end