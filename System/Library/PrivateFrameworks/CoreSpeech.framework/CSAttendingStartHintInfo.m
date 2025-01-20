@interface CSAttendingStartHintInfo
- (CSAttendingStartHintInfo)initWithOrigin:(unint64_t)a3 reason:(unint64_t)a4 recordContext:(id)a5 rootRequestId:(id)a6 mhUUID:(id)a7;
- (CSAudioRecordContext)recordContext;
- (NSString)mhUUID;
- (NSString)rootRequestId;
- (id)_reasonString;
- (id)description;
- (unint64_t)reason;
@end

@implementation CSAttendingStartHintInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mhUUID, 0);
  objc_storeStrong((id *)&self->_rootRequestId, 0);
  objc_storeStrong((id *)&self->_recordContext, 0);
}

- (NSString)mhUUID
{
  return self->_mhUUID;
}

- (NSString)rootRequestId
{
  return self->_rootRequestId;
}

- (CSAudioRecordContext)recordContext
{
  return self->_recordContext;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (id)description
{
  v3 = +[NSMutableString string];
  v7.receiver = self;
  v7.super_class = (Class)CSAttendingStartHintInfo;
  v4 = [(CSAttendingHintInfo *)&v7 description];
  [v3 appendFormat:@"%@", v4];
  v5 = [(CSAttendingStartHintInfo *)self _reasonString];
  [v3 appendFormat:@"[reason: %@]", v5];

  [v3 appendFormat:@"[recordContext: %@]", self->_recordContext];
  [v3 appendFormat:@"[rootRequestId: %@]", self->_rootRequestId];
  [v3 appendFormat:@"[mhUUID: %@]", self->_mhUUID];

  return v3;
}

- (id)_reasonString
{
  unint64_t reason = self->_reason;
  CFStringRef v3 = @"Unknown";
  if (reason == 2) {
    CFStringRef v3 = @"UI Requested";
  }
  if (reason == 1) {
    return @"ClientStoppedRecording";
  }
  else {
    return (id)v3;
  }
}

- (CSAttendingStartHintInfo)initWithOrigin:(unint64_t)a3 reason:(unint64_t)a4 recordContext:(id)a5 rootRequestId:(id)a6 mhUUID:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)CSAttendingStartHintInfo;
  v16 = [(CSAttendingHintInfo *)&v19 initWithOrigin:a3];
  v17 = v16;
  if (v16)
  {
    v16->_unint64_t reason = a4;
    objc_storeStrong((id *)&v16->_recordContext, a5);
    objc_storeStrong((id *)&v17->_rootRequestId, a6);
    objc_storeStrong((id *)&v17->_mhUUID, a7);
  }

  return v17;
}

@end