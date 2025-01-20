@interface MIOFrameProcessorFactory
+ (id)processorForConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4;
@end

@implementation MIOFrameProcessorFactory

+ (id)processorForConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4
{
  id v5 = a3;
  uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(a4);
  v7 = [v5 objectForKey:@"StreamEncoderType"];
  int v8 = [v7 intValue];

  unsigned int v9 = v8 & 0xFFFFFFFE;
  if ((v8 & 0xFFFFFFFE) == 6 && MediaSubType != 1278226488)
  {
    v11 = [v5 objectForKey:@"StreamConvertNonPlanarBuffersTo8bitMonochrome"];
    char v12 = [v11 BOOLValue];

    if (v12)
    {
      v13 = off_2643AECE8;
      goto LABEL_20;
    }
  }
  if (+[MIOPixelBufferUtility isPixelFormatRawBayer:MediaSubType])
  {
    v13 = off_2643AED18;
    v14 = off_2643AECD8;
    BOOL v15 = v8 == 14;
  }
  else
  {
    if (MediaSubType == 1278226738 && v8 == 14)
    {
      v13 = off_2643AECD8;
      goto LABEL_20;
    }
    if (+[MIOPixelBufferUtility isPixelFormatCompandedRawBayer:MediaSubType])
    {
      v13 = off_2643AEC68;
      goto LABEL_20;
    }
    if (MediaSubType == 1278226742 && v9 == 4)
    {
      v13 = off_2643AECB0;
      goto LABEL_20;
    }
    BOOL v15 = v9 == 4 && MediaSubType == 1899524402;
    v13 = off_2643AEC70;
    v14 = off_2643AED88;
  }
  if (v15) {
    v13 = v14;
  }
LABEL_20:
  v16 = (void *)[objc_alloc(*v13) initWithInputFormatDescription:a4];

  return v16;
}

@end