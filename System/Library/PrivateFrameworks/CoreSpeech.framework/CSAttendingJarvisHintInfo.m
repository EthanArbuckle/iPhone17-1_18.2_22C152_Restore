@interface CSAttendingJarvisHintInfo
- (CSAttendingJarvisHintInfo)initWithOrigin:(unint64_t)a3 deviceId:(id)a4;
- (NSString)deviceId;
- (id)description;
@end

@implementation CSAttendingJarvisHintInfo

- (void).cxx_destruct
{
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (id)description
{
  v3 = +[NSMutableString string];
  v6.receiver = self;
  v6.super_class = (Class)CSAttendingJarvisHintInfo;
  v4 = [(CSAttendingHintInfo *)&v6 description];
  [v3 appendFormat:@"%@", v4];
  [v3 appendFormat:@"[deviceId: %@]", self->_deviceId];

  return v3;
}

- (CSAttendingJarvisHintInfo)initWithOrigin:(unint64_t)a3 deviceId:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSAttendingJarvisHintInfo;
  v8 = [(CSAttendingHintInfo *)&v11 initWithOrigin:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_deviceId, a4);
  }

  return v9;
}

@end