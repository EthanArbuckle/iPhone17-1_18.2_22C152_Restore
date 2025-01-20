@interface AVCaptureVideoThumbnailOutput
+ (CGRect)contentsRectForFilterAtIndex:(unint64_t)a3 thumbnailSize:(CGSize)a4 filterCount:(unint64_t)a5;
+ (void)initialize;
- (AVCaptureVideoThumbnailContentsDelegate)thumbnailContentsDelegate;
- (AVCaptureVideoThumbnailOutput)init;
- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4;
- (CGSize)thumbnailSize;
- (NSArray)filters;
- (NSArray)smartStyles;
- (id)connectionMediaTypes;
- (void)_handleNotification:(id)a3 payload:(id)a4;
- (void)_signalInvalidationOfPropagatedContentsIfNecessary;
- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)dealloc;
- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)safelyHandleServerConnectionDeathForFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)setFilters:(id)a3;
- (void)setSmartStyles:(id)a3;
- (void)setThumbnailContentsDelegate:(id)a3;
- (void)setThumbnailSize:(CGSize)a3;
@end

@implementation AVCaptureVideoThumbnailOutput

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  v7 = (void *)[a3 mediaType];
  if (![v7 isEqualToString:*MEMORY[0x1E4F47C68]])
  {
    uint64_t v8 = 1;
    goto LABEL_5;
  }
  if ([(NSArray *)[(AVCaptureOutput *)self connections] count])
  {
    uint64_t v8 = 2;
LABEL_5:
    v9 = (void *)AVCaptureOutputConnectionFailureReasonString(v8, (uint64_t)self, a3);
    BOOL result = 0;
    *a4 = v9;
    return result;
  }
  return 1;
}

- (CGSize)thumbnailSize
{
  internal = self->_internal;
  double width = internal->thumbnailSize.width;
  double height = internal->thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSArray)smartStyles
{
  v2 = (void *)[(NSArray *)self->_internal->smartStyles copy];

  return (NSArray *)v2;
}

- (NSArray)filters
{
  v2 = (void *)[(NSArray *)self->_internal->filters copy];

  return (NSArray *)v2;
}

- (AVCaptureVideoThumbnailContentsDelegate)thumbnailContentsDelegate
{
  return (AVCaptureVideoThumbnailContentsDelegate *)[(AVWeakReference *)self->_internal->delegateWeakReference referencedObject];
}

+ (void)initialize
{
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47DB8], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, vto_notificationHandler, *MEMORY[0x1E4F51910], a3, 0);
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureVideoThumbnailOutput;
  [(AVCaptureOutput *)&v5 attachSafelyToFigCaptureSession:a3];
}

- (void)setThumbnailSize:(CGSize)a3
{
  internal = self->_internal;
  if (a3.width != internal->thumbnailSize.width || a3.height != internal->thumbnailSize.height)
  {
    internal->thumbnailSize = a3;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (AVCaptureVideoThumbnailOutput)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureVideoThumbnailOutput;
  v2 = [(AVCaptureOutput *)&v5 initSubclass];
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureVideoThumbnailOutputInternal);
    v2->_internal = v3;
    if (v3)
    {
      v2->_internal->weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v2];
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)setFilters:(id)a3
{
  self->_internal->filters = (NSArray *)[a3 copy];

  [(AVCaptureOutput *)self bumpChangeSeed];
}

- (void)setThumbnailContentsDelegate:(id)a3
{
  if ((id)[(AVWeakReference *)self->_internal->delegateWeakReference referencedObject] != a3)
  {

    if (a3) {
      objc_super v5 = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:a3];
    }
    else {
      objc_super v5 = 0;
    }
    self->_internal->delegateWeakReference = v5;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureVideoThumbnailOutput;
  [(AVCaptureOutput *)&v3 dealloc];
}

- (void)setSmartStyles:(id)a3
{
  self->_internal->smartStyles = (NSArray *)[a3 copy];

  [(AVCaptureOutput *)self bumpChangeSeed];
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47DB8], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, vto_notificationHandler, *MEMORY[0x1E4F51910], a3);
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureVideoThumbnailOutput;
  [(AVCaptureOutput *)&v5 detachSafelyFromFigCaptureSession:a3];
}

- (void)safelyHandleServerConnectionDeathForFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  [(AVCaptureVideoThumbnailOutput *)self _signalInvalidationOfPropagatedContentsIfNecessary];
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureVideoThumbnailOutput;
  [(AVCaptureOutput *)&v5 safelyHandleServerConnectionDeathForFigCaptureSession:a3];
}

- (id)connectionMediaTypes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = *MEMORY[0x1E4F47C68];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

+ (CGRect)contentsRectForFilterAtIndex:(unint64_t)a3 thumbnailSize:(CGSize)a4 filterCount:(unint64_t)a5
{
  double v5 = (double)(a5 + 1);
  double v6 = 1.0 / v5;
  double v7 = (double)a3 / v5;
  double v8 = 0.0;
  double v9 = 1.0;
  result.size.double height = v6;
  result.size.double width = v9;
  result.origin.y = v7;
  result.origin.x = v8;
  return result;
}

- (void)_signalInvalidationOfPropagatedContentsIfNecessary
{
  internal = self->_internal;
  if (internal->didPropagateContents)
  {
    v4 = (void *)[(AVWeakReference *)internal->delegateWeakReference referencedObject];
    if (objc_opt_respondsToSelector()) {
      [v4 videoThumbnailOutputWillEndRenderingThumbnails:self];
    }
    self->_internal->didPropagateContents = 0;
  }
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F51910]])
  {
    uint64_t v6 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51590]];
    if (v6)
    {
      double v7 = (void *)v6;
      double v8 = (void *)[(AVWeakReference *)self->_internal->delegateWeakReference referencedObject];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v9 = [v7 intValue];
        objc_msgSend(v8, "videoThumbnailOutput:willBeginRenderingThumbnailsWithContents:", self, objc_msgSend(MEMORY[0x1E4F39B58], "objectForSlot:", v9));
        self->_internal->didPropagateContents = 1;
      }
    }
    else
    {
      [(AVCaptureVideoThumbnailOutput *)self _signalInvalidationOfPropagatedContentsIfNecessary];
    }
  }
}

@end