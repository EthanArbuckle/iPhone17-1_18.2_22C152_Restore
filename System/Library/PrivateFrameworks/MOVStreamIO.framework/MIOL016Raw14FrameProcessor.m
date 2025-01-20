@interface MIOL016Raw14FrameProcessor
- (MIOL016Raw14FrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3;
- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5;
- (opaqueCMFormatDescription)formatDescriptionForEncoding;
- (unsigned)encodedPixelFormat;
- (void)dealloc;
@end

@implementation MIOL016Raw14FrameProcessor

- (MIOL016Raw14FrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MIOL016Raw14FrameProcessor;
  v4 = -[MIOFrameProcessor initWithInputFormatDescription:](&v6, sel_initWithInputFormatDescription_);
  if (v4)
  {
    v4->_formatDescForEncoding = +[MOVStreamIOUtility createL010FormatDescriptionFromL016FormatDescription:a3];
    [(MIOFrameProcessor *)v4 setFormatDescriptionNeedsUpdate:1];
  }
  return v4;
}

- (void)dealloc
{
  formatDescForEncoding = self->_formatDescForEncoding;
  if (formatDescForEncoding) {
    CFRelease(formatDescForEncoding);
  }
  v4.receiver = self;
  v4.super_class = (Class)MIOL016Raw14FrameProcessor;
  [(MIOFrameProcessor *)&v4 dealloc];
}

- (unsigned)encodedPixelFormat
{
  return 1278226736;
}

- (opaqueCMFormatDescription)formatDescriptionForEncoding
{
  return self->_formatDescForEncoding;
}

- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5
{
  objc_super v6 = +[MOVStreamVideoEncoderInterface createHEVCCompatiblePixelBuffer:](MOVStreamVideoEncoderInterface, "createHEVCCompatiblePixelBuffer:", a3, a4, a5);
  self->_formatDescForEncoding = [(MIOFrameProcessor *)self updatedFormatDescriptionIfNeededWithBuffer:v6 currentFormatDescription:self->_formatDescForEncoding];
  return v6;
}

- (void).cxx_destruct
{
}

@end