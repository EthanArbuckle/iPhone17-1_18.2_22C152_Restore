@interface ATXAppOrClipLaunch
- (BOOL)isClip;
- (NSString)bundleId;
- (NSString)urlHash;
- (double)latitude;
- (double)longitude;
- (id)initAppClipLaunchWithBundleId:(id)a3 urlHash:(id)a4 launchReason:(int)a5;
- (id)initAppClipLaunchWithBundleId:(id)a3 urlHash:(id)a4 launchReason:(int)a5 latitude:(double)a6 longitude:(double)a7;
- (id)initAppLaunchWithBundleId:(id)a3;
- (id)initAppLaunchWithBundleId:(id)a3 launchReason:(int)a4 latitude:(double)a5 longitude:(double)a6;
- (int)launchReason;
@end

@implementation ATXAppOrClipLaunch

- (id)initAppLaunchWithBundleId:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXAppOrClipLaunch;
  v6 = [(ATXAppOrClipLaunch *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleId, a3);
    v8 = (double *)MEMORY[0x1E4F67E80];
    v7->_isClip = 0;
    double v9 = *v8;
    v7->_latitude = *v8;
    v7->_longitude = v9;
    v7->_launchReason = 9;
  }

  return v7;
}

- (id)initAppLaunchWithBundleId:(id)a3 launchReason:(int)a4 latitude:(double)a5 longitude:(double)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXAppOrClipLaunch;
  v12 = [(ATXAppOrClipLaunch *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleId, a3);
    v13->_isClip = 0;
    v13->_launchReason = a4;
    v13->_latitude = a5;
    v13->_longitude = a6;
  }

  return v13;
}

- (id)initAppClipLaunchWithBundleId:(id)a3 urlHash:(id)a4 launchReason:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXAppOrClipLaunch;
  id v11 = [(ATXAppOrClipLaunch *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bundleId, a3);
    objc_storeStrong((id *)&v12->_urlHash, a4);
    v12->_isClip = 1;
    v12->_launchReason = a5;
    double v13 = *MEMORY[0x1E4F67E80];
    v12->_latitude = *(double *)MEMORY[0x1E4F67E80];
    v12->_longitude = v13;
  }

  return v12;
}

- (id)initAppClipLaunchWithBundleId:(id)a3 urlHash:(id)a4 launchReason:(int)a5 latitude:(double)a6 longitude:(double)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ATXAppOrClipLaunch;
  objc_super v15 = [(ATXAppOrClipLaunch *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bundleId, a3);
    objc_storeStrong((id *)&v16->_urlHash, a4);
    v16->_isClip = 1;
    v16->_launchReason = a5;
    v16->_latitude = a6;
    v16->_longitude = a7;
  }

  return v16;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)urlHash
{
  return self->_urlHash;
}

- (BOOL)isClip
{
  return self->_isClip;
}

- (int)launchReason
{
  return self->_launchReason;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlHash, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end