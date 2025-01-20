@interface BWNodeError
+ (id)newError:(int)a3 sourceNode:(id)a4;
+ (id)newError:(int)a3 sourceNode:(id)a4 recordingSettings:(id)a5;
+ (id)newError:(int)a3 sourceNode:(id)a4 stillImageSettings:(id)a5 metadata:(id)a6;
- (BWStillImageSettings)stillImageSettings;
- (FigCaptureRecordingSettings)recordingSettings;
- (NSDictionary)metadata;
- (NSString)sourceNodeDescription;
- (id)description;
- (int)errorCode;
- (unint64_t)hash;
- (void)_initWithError:(void *)a3 sourceNode:(void *)a4 stillImageSettings:(void *)a5 recordingSettings:(void *)a6 metadata:;
- (void)dealloc;
@end

@implementation BWNodeError

- (void)_initWithError:(void *)a3 sourceNode:(void *)a4 stillImageSettings:(void *)a5 recordingSettings:(void *)a6 metadata:
{
  if (!a1) {
    return 0;
  }
  v14.receiver = a1;
  v14.super_class = (Class)BWNodeError;
  v11 = objc_msgSendSuper2(&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11[1] = (int)(atomic_fetch_add_explicit(uniqueIDCount, 1u, memory_order_relaxed) + 1);
    *((_DWORD *)v11 + 4) = a2;
    v11[3] = objc_msgSend((id)objc_msgSend(a3, "description"), "copy");
    v12[4] = a4;
    v12[5] = a5;
    v12[6] = [a6 copy];
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWNodeError;
  [(BWNodeError *)&v3 dealloc];
}

+ (id)newError:(int)a3 sourceNode:(id)a4
{
  v6 = [BWNodeError alloc];
  return -[BWNodeError _initWithError:sourceNode:stillImageSettings:recordingSettings:metadata:](v6, a3, a4, 0, 0, 0);
}

+ (id)newError:(int)a3 sourceNode:(id)a4 stillImageSettings:(id)a5 metadata:(id)a6
{
  v10 = [BWNodeError alloc];
  return -[BWNodeError _initWithError:sourceNode:stillImageSettings:recordingSettings:metadata:](v10, a3, a4, a5, 0, a6);
}

+ (id)newError:(int)a3 sourceNode:(id)a4 recordingSettings:(id)a5
{
  v8 = [BWNodeError alloc];
  return -[BWNodeError _initWithError:sourceNode:stillImageSettings:recordingSettings:metadata:](v8, a3, a4, 0, a5, 0);
}

- (int)errorCode
{
  return self->_errorCode;
}

- (NSString)sourceNodeDescription
{
  return self->_sourceNodeDescription;
}

- (BWStillImageSettings)stillImageSettings
{
  return self->_stillImageSettings;
}

- (unint64_t)hash
{
  return self->_uniqueID;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p>: err:%d captureID:%lld, captureType=%@", v4, self, self->_errorCode, -[BWStillImageSettings settingsID](self->_stillImageSettings, "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureSettings captureType](-[BWStillImageSettings captureSettings](self->_stillImageSettings, "captureSettings"), "captureType"))];
}

- (FigCaptureRecordingSettings)recordingSettings
{
  return self->_recordingSettings;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

@end