@interface BiometricKitEnrollProgressInfo
- (BiometricKitEnrollProgressInfo)init;
- (NSDictionary)captureImage;
- (NSDictionary)messageDetails;
- (NSDictionary)renderedImage;
- (int)message;
- (int64_t)currentPrimaryComponentID;
- (int64_t)progress;
- (void)dealloc;
- (void)setCaptureImage:(id)a3;
- (void)setCurrentPrimaryComponentID:(int64_t)a3;
- (void)setMessage:(int)a3;
- (void)setMessageDetails:(id)a3;
- (void)setProgress:(int64_t)a3;
- (void)setRenderedImage:(id)a3;
@end

@implementation BiometricKitEnrollProgressInfo

- (BiometricKitEnrollProgressInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)BiometricKitEnrollProgressInfo;
  v2 = [(BiometricKitEnrollProgressInfo *)&v8 init];
  v3 = v2;
  if (v2)
  {
    messageDetails = v2->_messageDetails;
    v2->_messageDetails = 0;

    captureImage = v3->_captureImage;
    v3->_captureImage = 0;

    renderedImage = v3->_renderedImage;
    v3->_renderedImage = 0;
  }
  return v3;
}

- (void)dealloc
{
  [(BiometricKitEnrollProgressInfo *)self setMessageDetails:0];
  [(BiometricKitEnrollProgressInfo *)self setCaptureImage:0];
  [(BiometricKitEnrollProgressInfo *)self setRenderedImage:0];
  v3.receiver = self;
  v3.super_class = (Class)BiometricKitEnrollProgressInfo;
  [(BiometricKitEnrollProgressInfo *)&v3 dealloc];
}

- (int64_t)progress
{
  return self->_progress;
}

- (void)setProgress:(int64_t)a3
{
  self->_progress = a3;
}

- (int64_t)currentPrimaryComponentID
{
  return self->_currentPrimaryComponentID;
}

- (void)setCurrentPrimaryComponentID:(int64_t)a3
{
  self->_currentPrimaryComponentID = a3;
}

- (NSDictionary)captureImage
{
  return self->_captureImage;
}

- (void)setCaptureImage:(id)a3
{
}

- (NSDictionary)renderedImage
{
  return self->_renderedImage;
}

- (void)setRenderedImage:(id)a3
{
}

- (int)message
{
  return self->_message;
}

- (void)setMessage:(int)a3
{
  self->_message = a3;
}

- (NSDictionary)messageDetails
{
  return self->_messageDetails;
}

- (void)setMessageDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDetails, 0);
  objc_storeStrong((id *)&self->_renderedImage, 0);
  objc_storeStrong((id *)&self->_captureImage, 0);
}

@end