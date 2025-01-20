@interface MOVStreamIOUtility
+ (BOOL)attachmentsContainTopLeftChromaLocations:(id)a3;
+ (BOOL)attachmentsContainsRec2020orRec2100ColorMatrices:(id)a3;
+ (BOOL)attachmentsContainsRec2020orRec2100ColorPrimaries:(id)a3;
+ (BOOL)attachmentsRepresentInterlacedFields:(id)a3;
+ (BOOL)dictionary:(id)a3 BOOLeanValueForKey:(id)a4;
+ (BOOL)formatDescriptionRepresentsBayer:(id)a3;
+ (BOOL)formatDescriptionRepresentsGrayscale:(id)a3;
+ (BOOL)formatDescriptionRepresentsRGB:(id)a3;
+ (BOOL)formatDescriptionRepresentsVideoRange:(id)a3;
+ (BOOL)formatDescriptionRepresentsYCbCr:(id)a3;
+ (BOOL)isEncoderAvailableForEncoderType:(int)a3;
+ (BOOL)isEncoderAvailableWithEncoderName:(id)a3;
+ (BOOL)isHEVCEncoderType:(int)a3;
+ (BOOL)isKeyFrame:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
+ (BOOL)isMOVStreamIOMovMetadataIdentifier:(id)a3;
+ (BOOL)isSlimXEncodedTrack:(id)a3;
+ (BOOL)isValidJSONObject:(id)a3 path:(id)a4;
+ (BOOL)key:(id)a3 hasUnspecifiedValue:(id)a4;
+ (BOOL)pixelFormatIs420Sampled:(unsigned int)a3;
+ (BOOL)pixelFormatIs422Sampled:(unsigned int)a3;
+ (BOOL)saveSessionStartTime:(id *)a3 toMovieAtURL:(id)a4 error:(id *)a5;
+ (BOOL)verifyExactBytesPerRow:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unsigned int)a6;
+ (CGAffineTransform)CGAffineTransformValueFromNSValue:(SEL)a3;
+ (CVSMPTETime)advanceTimeCode:(SEL)a3 frameQuanta:(CVSMPTETime *)a4 dropFrame:(int64_t)a5;
+ (CVSMPTETime)timeCodeFromString:(SEL)a3 isDropFrame:(id)a4;
+ (CVSMPTETime)timecode32ForSampleBuffer:(SEL)a3 dropFrame:(opaqueCMSampleBuffer *)a4;
+ (CVSMPTETime)timecodeForFrameNumber32:(SEL)a3 formatDescription:(int)a4;
+ (double)bytesPerPixelForFormat:(unsigned int)a3;
+ (double)clampedQuality:(double)result;
+ (double)transformAngleFromVideoOrientation:(int)a3;
+ (id)AVEProfileLevel10BitMonochrome;
+ (id)addEncodingQuality:(double)a3 toConfiguration:(id)a4;
+ (id)addTrackTypeInfo:(unint64_t)a3 toConfiguration:(id)a4;
+ (id)addTransform:(CGAffineTransform *)a3 toConfiguration:(id)a4;
+ (id)audioNoneEncoderConfig;
+ (id)color8bitHEVCWithAlphaEncoderConfig;
+ (id)color8bitHEVCWithAlphaEncoderConfigWithBitrate:(unint64_t)a3;
+ (id)colorH264EncoderConfig;
+ (id)colorH264EncoderConfigWithBitrate:(unint64_t)a3;
+ (id)colorHEVCEncoderConfig;
+ (id)colorHEVCEncoderConfigWithBitrate:(unint64_t)a3;
+ (id)colorHEVCEncoderConfigWithQuality:(double)a3;
+ (id)colorHEVCLosslessEncoderConfig;
+ (id)colorRecordingConfigBitDepth:(unint64_t)a3 bitrate:(unint64_t)a4 chromaSampling:(int64_t)a5 error:(id *)a6;
+ (id)colorRecordingConfigBitDepth:(unint64_t)a3 chromaSampling:(int64_t)a4 error:(id *)a5;
+ (id)colorRecordingConfigBitDepth:(unint64_t)a3 lossless:(BOOL)a4 chromaSampling:(int64_t)a5 error:(id *)a6;
+ (id)colorRecordingConfigBitDepth:(unint64_t)a3 quality:(double)a4 chromaSampling:(int64_t)a5 error:(id *)a6;
+ (id)colorWithAlphaLossless8bitHEVCEncoderConfig;
+ (id)colorimetricWarningsForColorPixelBufferAttachments:(id)a3 pixelFormat:(unsigned int)a4;
+ (id)colorimetricWarningsForGrayscalePixelBufferAttachments:(id)a3 pixelFormat:(unsigned int)a4;
+ (id)colorimetricWarningsForPixelBufferAttachments:(id)a3 pixelFormat:(unsigned int)a4;
+ (id)configWithEncoderType:(int)a3;
+ (id)customConfigWithOutputSettings:(id)a3;
+ (id)customEncoderConfig;
+ (id)customEncoderConfigWithEmbeddedConfiguration:(id)a3;
+ (id)dictionary:(id)a3 numberValueForKey:(id)a4;
+ (id)dictionary:(id)a3 stringValueForKey:(id)a4;
+ (id)getCustomAssociatedMetadataStreamIdFromTrack:(id)a3;
+ (id)getJsonFriendlyCopy:(id)a3;
+ (id)getPlistFriendlyCopyOf:(id)a3;
+ (id)jpegEncoderConfig;
+ (id)jpegEncoderConfigWithQuality:(double)a3;
+ (id)jsonFriendlyCopy:(id)a3;
+ (id)monochrome10bitHEVCEncoderConfig;
+ (id)monochrome10bitHEVCEncoderConfigWithBitrate:(unint64_t)a3;
+ (id)monochrome10bitHEVCEncoderConfigWithQuality:(double)a3;
+ (id)monochrome10bitHEVCLosslessEncoderConfig;
+ (id)monochrome10bitHEVCLosslessEncoderConfigAllowFrameReordering:(BOOL)a3;
+ (id)monochrome8bitHEVCEncoderConfig;
+ (id)monochrome8bitHEVCEncoderConfigWithBitrate:(unint64_t)a3;
+ (id)monochrome8bitHEVCEncoderConfigWithQuality:(double)a3;
+ (id)monochrome8bitHEVCLosslessEncoderConfig;
+ (id)monochrome8bitHEVCLosslessEncoderConfigAllowFrameReordering:(BOOL)a3;
+ (id)nonMIOTrackMetadataItemsInMetadataItems:(id)a3;
+ (id)noneEncoderConfig;
+ (id)plistDeserializedObject:(id)a3 error:(id *)a4;
+ (id)plistFriendlyCopyOf:(id)a3;
+ (id)plistSerializedObject:(id)a3 error:(id *)a4;
+ (id)proRes422EncoderConfig;
+ (id)proRes422EncoderConfigWithQuality:(int64_t)a3;
+ (id)proRes4444EncoderConfig;
+ (id)proRes4444EncoderConfigWithHighQuality;
+ (id)qtTrackNameForAssociatedAttachmentsTrack:(id)a3;
+ (id)qtTrackNameForAssociatedTimeCodeTrack:(id)a3;
+ (id)reservedMIOTrackMetadataKeys;
+ (id)sampleBufferConfigWithPixelFormat:(unsigned int)a3;
+ (id)slimEncoderConfig;
+ (id)slimXEncoderConfig;
+ (id)stereoConfigurationWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 frameRate:(double)a6 additionalCompressionProperties:(id)a7;
+ (id)stereoConfigurationWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 frameRate:(double)a6 leftAndRightViewIDs:(id)a7 additionalCompressionProperties:(id)a8;
+ (id)stringFromTimeCode:(CVSMPTETime *)a3 dropFrame:(BOOL)a4;
+ (id)valueWithCGAffineTransform:(CGAffineTransform *)a3;
+ (int)chromaSubsamplingForDictionary:(id)a3;
+ (int)chromaSubsamplingForFormatDescription:(id)a3;
+ (int)frameNumber32ForTimecode:(CVSMPTETime *)a3 usingFormatDescription:(opaqueCMFormatDescription *)a4;
+ (int64_t)chromaSamplingForTrack:(id)a3;
+ (int64_t)chromaSamplingFromMediaFormatDescription:(opaqueCMFormatDescription *)a3;
+ (int64_t)frameNumber64ForTimecode:(CVSMPTETime *)a3 usingFormatDescription:(opaqueCMFormatDescription *)a4;
+ (opaqueCMFormatDescription)createFormatDescriptionFromPixelBuffer:(__CVBuffer *)a3;
+ (opaqueCMFormatDescription)createL008FormatDescriptionFromCompandedRawBayerFormatDescription:(opaqueCMFormatDescription *)a3;
+ (opaqueCMFormatDescription)createL008FormatDescriptionFromNonPlanarFormatDescription:(opaqueCMFormatDescription *)a3;
+ (opaqueCMFormatDescription)createL010FormatDescriptionFromL016FormatDescription:(opaqueCMFormatDescription *)a3;
+ (opaqueCMFormatDescription)createL010FormatDescriptionFromRawBayerFormatDescription:(opaqueCMFormatDescription *)a3;
+ (opaqueCMFormatDescription)createTimeCode32FormatDescriptionWithFrameRate:(double)a3 dropFrame:(BOOL)a4 error:(id *)a5;
+ (opaqueCMFormatDescription)createTimeCode32FormatDescriptionWithFrameRate:(double)a3 tcDropFrame:(BOOL)a4 error:(id *)a5;
+ (opaqueCMFormatDescription)createTimeCode64FormatDescriptionWithFrameRate:(double)a3 dropFrame:(BOOL)a4 error:(id *)a5;
+ (opaqueCMFormatDescription)createTimeCodeFormatDescriptionWithFrameRate:(double)a3 error:(id *)a4;
+ (opaqueCMFormatDescription)createxf20FormatDescriptionFromRawBayerFormatDescription:(opaqueCMFormatDescription *)a3 usingFirstPlaneOnly:(BOOL)a4;
+ (opaqueCMFormatDescription)formatForPixelBuffer:(__CVBuffer *)a3;
+ (opaqueCMFormatDescription)newFormatDescriptionFromPixelBuffer:(__CVBuffer *)a3;
+ (opaqueCMSampleBuffer)createTimecode32SampleBufferWithSMPTETime:(CVSMPTETime *)a3 formatDescription:(opaqueCMFormatDescription *)a4 pts:(id *)a5 error:(id *)a6;
+ (opaqueCMSampleBuffer)createTimecode64SampleBufferWithSMPTETime:(CVSMPTETime *)a3 formatDescription:(opaqueCMFormatDescription *)a4 pts:(id *)a5 error:(id *)a6;
+ (opaqueCMSampleBuffer)createTimecodeSampleBufferWithSMPTETime:(CVSMPTETime *)a3 formatDescription:(opaqueCMFormatDescription *)a4 pts:(id *)a5 error:(id *)a6;
+ (unint64_t)getDefaultBitrateForVideoDimension:(id)a3 atExpectedFramerate:(double)a4 forEncoderType:(int)a5;
+ (unint64_t)getPreferredBytesPerRowAlignmentSize;
+ (unint64_t)getPreferredPlaneAlignmentSize;
+ (unsigned)detectPixelFormatForAsset:(id)a3 videoTrackId:(int)a4 error:(id *)a5;
+ (unsigned)guessPixelFormatForTrack:(id)a3;
+ (unsigned)guessPixelFormatFromFormatDescription:(opaqueCMFormatDescription *)a3;
@end

@implementation MOVStreamIOUtility

+ (id)stringFromTimeCode:(CVSMPTETime *)a3 dropFrame:(BOOL)a4
{
  uint64_t v4 = 58;
  if (a4) {
    uint64_t v4 = 59;
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%02d:%02d:%02d%c%02d", a3->hours, a3->minutes, a3->seconds, v4, a3->frames);
}

+ (CVSMPTETime)timeCodeFromString:(SEL)a3 isDropFrame:(id)a4
{
  id v7 = a4;
  if (a5) {
    *a5 = 0;
  }
  *(void *)&retstr->subframes = 0;
  *(void *)&retstr->type = 0;
  *(void *)&retstr->hours = 0;
  id v19 = v7;
  v8 = [v7 componentsSeparatedByString:@":"];
  if ((unint64_t)[v8 count] >= 3)
  {
    v9 = [v8 objectAtIndexedSubscript:0];
    retstr->hours = [v9 integerValue];

    v10 = [v8 objectAtIndexedSubscript:1];
    retstr->minutes = [v10 integerValue];

    if ([v8 count] == 4)
    {
      v11 = [v8 objectAtIndexedSubscript:2];
      retstr->seconds = [v11 integerValue];

      v12 = [v8 objectAtIndexedSubscript:3];
      retstr->frames = [v12 integerValue];
    }
    else
    {
      v12 = [v8 objectAtIndexedSubscript:2];
      v13 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@";,"];
      v14 = [v12 componentsSeparatedByCharactersInSet:v13];

      if ([v14 count] == 2)
      {
        v15 = [v14 objectAtIndexedSubscript:0];
        retstr->seconds = [v15 integerValue];

        v16 = [v14 objectAtIndexedSubscript:1];
        retstr->frames = [v16 integerValue];

        uint64_t v17 = [v12 rangeOfString:@";"];
        if (a5)
        {
          if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
            *a5 = 1;
          }
        }
      }
      v8 = v14;
    }
  }

  return result;
}

+ (double)transformAngleFromVideoOrientation:(int)a3
{
  double result = 0.0;
  if (a3 <= 4) {
    return dbl_21B6612B0[a3];
  }
  return result;
}

+ (id)jsonFriendlyCopy:(id)a3
{
  v3 = [a1 getJsonFriendlyCopy:a3];

  return v3;
}

+ (id)plistFriendlyCopyOf:(id)a3
{
  v3 = [a1 getPlistFriendlyCopyOf:a3];

  return v3;
}

+ (opaqueCMFormatDescription)formatForPixelBuffer:(__CVBuffer *)a3
{
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, &formatDescriptionOut);
  return formatDescriptionOut;
}

+ (opaqueCMFormatDescription)createFormatDescriptionFromPixelBuffer:(__CVBuffer *)a3
{
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, &formatDescriptionOut);
  return formatDescriptionOut;
}

+ (opaqueCMFormatDescription)newFormatDescriptionFromPixelBuffer:(__CVBuffer *)a3
{
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, &formatDescriptionOut);
  return formatDescriptionOut;
}

+ (unint64_t)getPreferredPlaneAlignmentSize
{
  size_t v3 = 8;
  unint64_t v4 = 0;
  sysctlbyname("hw.pagesize", &v4, &v3, 0, 0);
  return v4;
}

+ (unint64_t)getPreferredBytesPerRowAlignmentSize
{
  size_t v3 = 8;
  unint64_t v4 = 0;
  sysctlbyname("hw.cachelinesize", &v4, &v3, 0, 0);
  return v4;
}

+ (BOOL)pixelFormatIs420Sampled:(unsigned int)a3
{
  BOOL result = 1;
  if ((int)a3 <= 1563981359)
  {
    if ((int)a3 > 762865199)
    {
      if ((int)a3 > 875704437)
      {
        if ((int)a3 > 1534359087)
        {
          if ((int)a3 > 1534621231)
          {
            if (a3 == 1534621232) {
              return result;
            }
            int v4 = 1563977264;
          }
          else
          {
            if (a3 == 1534359088) {
              return result;
            }
            int v4 = 1534617136;
          }
        }
        else if ((int)a3 > 1530426927)
        {
          if (a3 == 1530426928) {
            return result;
          }
          int v4 = 1534354992;
        }
        else
        {
          if (a3 == 875704438) {
            return result;
          }
          int v4 = 1530422832;
        }
      }
      else if ((int)a3 > 795371055)
      {
        if ((int)a3 > 796423727)
        {
          if (a3 == 796423728) {
            return result;
          }
          int v4 = 875704422;
        }
        else
        {
          if (a3 == 795371056) {
            return result;
          }
          int v4 = 796419632;
        }
      }
      else if ((int)a3 > 792225327)
      {
        if (a3 == 792225328) {
          return result;
        }
        int v4 = 792229424;
      }
      else
      {
        if (a3 == 762865200) {
          return result;
        }
        int v4 = 762869296;
      }
    }
    else if ((int)a3 > 645166639)
    {
      if ((int)a3 > 645429039)
      {
        if ((int)a3 > 758674991)
        {
          if (a3 == 758674992) {
            return result;
          }
          int v4 = 761816624;
        }
        else
        {
          if (a3 == 645429040) {
            return result;
          }
          int v4 = 758670896;
        }
      }
      else if ((int)a3 > 645424687)
      {
        if (a3 == 645424688) {
          return result;
        }
        int v4 = 645428784;
      }
      else
      {
        if (a3 == 645166640) {
          return result;
        }
        int v4 = 645279800;
      }
    }
    else if ((int)a3 > 644376111)
    {
      if ((int)a3 > 645101103)
      {
        if (a3 == 645101104) {
          return result;
        }
        int v4 = 645162544;
      }
      else
      {
        if (a3 == 644376112) {
          return result;
        }
        int v4 = 645097008;
      }
    }
    else if ((int)a3 > 641230383)
    {
      if (a3 == 641230384) {
        return result;
      }
      int v4 = 641234480;
    }
    else
    {
      if (a3 == 590898736) {
        return result;
      }
      int v4 = 590902832;
    }
    goto LABEL_98;
  }
  if ((int)a3 > 1982882103)
  {
    if ((int)a3 > 2087216687)
    {
      if ((int)a3 > 2100852271)
      {
        if ((int)a3 > 2105046575)
        {
          if (a3 == 2105046576) {
            return result;
          }
          unsigned __int16 v6 = 30512;
        }
        else
        {
          if (a3 == 2100852272) {
            return result;
          }
          unsigned __int16 v6 = 26160;
        }
        int v4 = v6 | 0x7D780000;
      }
      else if ((int)a3 > 2088269359)
      {
        if (a3 == 2088269360) {
          return result;
        }
        int v4 = 2100848176;
      }
      else
      {
        if (a3 == 2087216688) {
          return result;
        }
        int v4 = 2088265264;
      }
    }
    else if ((int)a3 > 2021077551)
    {
      if ((int)a3 > 2084070959)
      {
        if (a3 == 2084070960) {
          return result;
        }
        int v4 = 2084075056;
      }
      else
      {
        if (a3 == 2021077552) {
          return result;
        }
        int v4 = 2033463856;
      }
    }
    else if ((int)a3 > 2016686639)
    {
      if (a3 == 2016686640) {
        return result;
      }
      int v4 = 2019963440;
    }
    else
    {
      if (a3 == 1982882104) {
        return result;
      }
      int v4 = 1983013176;
    }
  }
  else
  {
    if ((int)a3 > 1886680623)
    {
      if ((int)a3 > 1937125935)
      {
        if ((int)a3 > 1953903151)
        {
          if (a3 == 1953903152) {
            return result;
          }
          int v4 = 1953968688;
        }
        else
        {
          if (a3 == 1937125936) {
            return result;
          }
          int v4 = 1952854576;
        }
        goto LABEL_98;
      }
      if ((int)a3 > 1886859823)
      {
        if (a3 == 1886859824) {
          return result;
        }
        int v4 = 1936077360;
        goto LABEL_98;
      }
      if (a3 == 1886680624) {
        return result;
      }
      unsigned __int16 v5 = 30512;
    }
    else
    {
      if ((int)a3 <= 1751527983)
      {
        if ((int)a3 > 1568175663)
        {
          if (a3 == 1568175664) {
            return result;
          }
          int v4 = 1714696752;
        }
        else
        {
          if (a3 == 1563981360) {
            return result;
          }
          int v4 = 1568171568;
        }
        goto LABEL_98;
      }
      if ((int)a3 <= 1885745711)
      {
        if (a3 == 1751527984) {
          return result;
        }
        int v4 = 1882468912;
        goto LABEL_98;
      }
      if (a3 == 1885745712) {
        return result;
      }
      unsigned __int16 v5 = 26160;
    }
    int v4 = v5 | 0x70740000;
  }
LABEL_98:
  if (a3 != v4) {
    return 0;
  }
  return result;
}

+ (BOOL)pixelFormatIs422Sampled:(unsigned int)a3
{
  BOOL result = 1;
  if ((int)a3 <= 1568175665)
  {
    if ((int)a3 <= 762865201)
    {
      if ((int)a3 > 645166641)
      {
        if ((int)a3 > 645428785)
        {
          if ((int)a3 > 645494117)
          {
            if (a3 == 645494118) {
              return result;
            }
            int v5 = 645494131;
            goto LABEL_103;
          }
          if (a3 == 645428786) {
            return result;
          }
          unsigned __int16 v8 = 30514;
        }
        else
        {
          if ((int)a3 <= 645411442)
          {
            if (a3 == 645166642) {
              return result;
            }
            int v5 = 645280312;
            goto LABEL_103;
          }
          if (a3 == 645411443) {
            return result;
          }
          unsigned __int16 v8 = 26162;
        }
        int v5 = v8 | 0x26780000;
      }
      else
      {
        if ((int)a3 > 645097009)
        {
          if ((int)a3 > 645149298)
          {
            if (a3 == 645149299) {
              return result;
            }
            int v5 = 645162546;
            goto LABEL_103;
          }
          if (a3 == 645097010) {
            return result;
          }
          unsigned __int16 v6 = 30258;
        }
        else
        {
          if ((int)a3 <= 644376113)
          {
            if (a3 == 641230386) {
              return result;
            }
            int v5 = 641234482;
            goto LABEL_103;
          }
          if (a3 == 644376114) {
            return result;
          }
          unsigned __int16 v6 = 12915;
        }
        int v5 = v6 | 0x26730000;
      }
LABEL_103:
      if (a3 != v5) {
        return 0;
      }
      return result;
    }
    if ((int)a3 <= 1530422833)
    {
      if ((int)a3 > 846624101)
      {
        if ((int)a3 > 875704933)
        {
          if (a3 == 875704934) {
            return result;
          }
          int v5 = 875704950;
        }
        else
        {
          if (a3 == 846624102) {
            return result;
          }
          int v5 = 846624121;
        }
      }
      else if ((int)a3 > 796419633)
      {
        if (a3 == 796419634) {
          return result;
        }
        int v5 = 796423730;
      }
      else
      {
        if (a3 == 762865202) {
          return result;
        }
        int v5 = 762869298;
      }
      goto LABEL_103;
    }
    if ((int)a3 <= 1534617137)
    {
      if ((int)a3 > 1534354993)
      {
        if (a3 == 1534354994) {
          return result;
        }
        int v5 = 1534359090;
      }
      else
      {
        if (a3 == 1530422834) {
          return result;
        }
        int v5 = 1530426930;
      }
      goto LABEL_103;
    }
    if ((int)a3 <= 1563977265)
    {
      if (a3 == 1534617138) {
        return result;
      }
      int v5 = 1534621234;
      goto LABEL_103;
    }
    if (a3 != 1563977266 && a3 != 1563981362)
    {
      int v5 = 1568171570;
      goto LABEL_103;
    }
  }
  else if ((int)a3 > 1983000885)
  {
    if ((int)a3 <= 2037741157)
    {
      if ((int)a3 > 2016686641)
      {
        if ((int)a3 > 2019963503)
        {
          if (a3 == 2019963504) {
            return result;
          }
          int v5 = 2021077554;
        }
        else
        {
          if (a3 == 2016686642) {
            return result;
          }
          int v5 = 2019963442;
        }
        goto LABEL_103;
      }
      if ((int)a3 > 2016555631)
      {
        if (a3 == 2016555632) {
          return result;
        }
        int v5 = 2016567667;
        goto LABEL_103;
      }
      if (a3 == 1983000886) {
        return result;
      }
      unsigned __int16 v4 = 24888;
      goto LABEL_39;
    }
    if ((int)a3 <= 2100848177)
    {
      if ((int)a3 > 2088265265)
      {
        if (a3 == 2088265266) {
          return result;
        }
        int v5 = 2088269362;
      }
      else
      {
        if (a3 == 2037741158) {
          return result;
        }
        int v5 = 2037741171;
      }
      goto LABEL_103;
    }
    if ((int)a3 <= 2105042481)
    {
      if (a3 == 2100848178) {
        return result;
      }
      int v5 = 2100852274;
      goto LABEL_103;
    }
    if (a3 != 2105042482 && a3 != 2105046578)
    {
      int v5 = 2105046834;
      goto LABEL_103;
    }
  }
  else
  {
    if ((int)a3 <= 1886859825)
    {
      if ((int)a3 > 1885745713)
      {
        if ((int)a3 > 1886680625)
        {
          if (a3 == 1886680626) {
            return result;
          }
          unsigned __int16 v7 = 30514;
        }
        else
        {
          if (a3 == 1885745714) {
            return result;
          }
          unsigned __int16 v7 = 26162;
        }
        int v5 = v7 | 0x70740000;
      }
      else if ((int)a3 > 1751527985)
      {
        if (a3 == 1751527986) {
          return result;
        }
        int v5 = 1882468914;
      }
      else
      {
        if (a3 == 1568175666) {
          return result;
        }
        int v5 = 1630697081;
      }
      goto LABEL_103;
    }
    if ((int)a3 <= 1949458802)
    {
      if ((int)a3 > 1936077361)
      {
        if (a3 == 1936077362) {
          return result;
        }
        int v5 = 1937125938;
      }
      else
      {
        if (a3 == 1886859826) {
          return result;
        }
        int v5 = 1932681587;
      }
      goto LABEL_103;
    }
    if ((int)a3 <= 1953903153)
    {
      if (a3 == 1949458803) {
        return result;
      }
      int v5 = 1952854578;
      goto LABEL_103;
    }
    if (a3 != 1953903154 && a3 != 1953968690)
    {
      unsigned __int16 v4 = 12592;
LABEL_39:
      int v5 = v4 | 0x76320000;
      goto LABEL_103;
    }
  }
  return result;
}

+ (id)dictionary:(id)a3 numberValueForKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    unsigned __int16 v7 = [v5 objectForKeyedSubscript:v6];
  }
  else
  {
    unsigned __int16 v7 = 0;
  }

  return v7;
}

+ (id)dictionary:(id)a3 stringValueForKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    unsigned __int16 v7 = [v5 objectForKeyedSubscript:v6];
  }
  else
  {
    unsigned __int16 v7 = 0;
  }

  return v7;
}

+ (BOOL)dictionary:(id)a3 BOOLeanValueForKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    unsigned __int16 v7 = [v5 objectForKeyedSubscript:v6];
  }
  else
  {
    unsigned __int16 v7 = 0;
  }
  char v8 = [v7 BOOLValue];

  return v8;
}

+ (BOOL)formatDescriptionRepresentsRGB:(id)a3
{
  return [a1 dictionary:a3 BOOLeanValueForKey:*MEMORY[0x263F04298]];
}

+ (BOOL)formatDescriptionRepresentsGrayscale:(id)a3
{
  return [a1 dictionary:a3 BOOLeanValueForKey:*MEMORY[0x263F04290]];
}

+ (BOOL)formatDescriptionRepresentsYCbCr:(id)a3
{
  return [a1 dictionary:a3 BOOLeanValueForKey:*MEMORY[0x263F042A8]];
}

+ (BOOL)formatDescriptionRepresentsVideoRange:(id)a3
{
  size_t v3 = [a1 dictionary:a3 stringValueForKey:*MEMORY[0x263F04268]];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F04270]];

  return v4;
}

+ (BOOL)formatDescriptionRepresentsBayer:(id)a3
{
  return [a1 dictionary:a3 BOOLeanValueForKey:*MEMORY[0x263F042A0]];
}

+ (int)chromaSubsamplingForDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 dictionary:v4 numberValueForKey:*MEMORY[0x263F042D0]];
  uint64_t v6 = [a1 dictionary:v4 numberValueForKey:*MEMORY[0x263F042B8]];
  if (!(v5 | v6))
  {
    int v8 = 1;
    goto LABEL_31;
  }
  if (v5 && (int)[(id)v5 intValue] >= 2)
  {
    int v7 = [(id)v5 intValue];
    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {
    int v7 = 1;
    if (!v6)
    {
LABEL_10:
      int v9 = 1;
      goto LABEL_11;
    }
  }
  if ((int)[(id)v6 intValue] < 2) {
    goto LABEL_10;
  }
  int v9 = [(id)v6 intValue];
LABEL_11:
  char v10 = [a1 formatDescriptionRepresentsBayer:v4];
  if (v9 == 2 && v7 == 2) {
    char v12 = v10;
  }
  else {
    char v12 = 1;
  }
  if (v12)
  {
    if (v9 == 2 && v7 == 1)
    {
      int v8 = 2;
    }
    else if (v9 == 4 && v7 == 1)
    {
      int v8 = 4;
    }
    else
    {
      int v8 = v9 == 1 && v7 == 1;
    }
  }
  else
  {
    int v8 = 3;
  }
LABEL_31:

  return v8;
}

+ (int)chromaSubsamplingForFormatDescription:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [a1 chromaSubsamplingForDictionary:v4];
  if (v5 == 1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x263F042C8], 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        int v5 = [a1 chromaSubsamplingForDictionary:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
        if (v5 != 1) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      int v5 = 1;
    }
  }
  return v5;
}

+ (BOOL)attachmentsContainsRec2020orRec2100ColorPrimaries:(id)a3
{
  size_t v3 = [a1 dictionary:a3 stringValueForKey:*MEMORY[0x263F03ED8]];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F03F00]];

  return v4;
}

+ (BOOL)attachmentsContainsRec2020orRec2100ColorMatrices:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  size_t v3 = [a1 dictionary:a3 stringValueForKey:*MEMORY[0x263F04020]];
  if (v3
    && (long long v12 = 0u,
        long long v13 = 0u,
        long long v10 = 0u,
        long long v11 = 0u,
        (uint64_t v4 = [&unk_26CB7D500 countByEnumeratingWithState:&v10 objects:v14 count:16]) != 0))
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(&unk_26CB7D500);
        }
        uint64_t v7 = CVYCbCrMatrixGetStringForIntegerCodePoint([*(id *)(*((void *)&v10 + 1) + 8 * i) intValue]);
        if (v7 && ([v3 isEqualToString:v7] & 1) != 0)
        {

          BOOL v8 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v4 = [&unk_26CB7D500 countByEnumeratingWithState:&v10 objects:v14 count:16];
      BOOL v8 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_14:

  return v8;
}

+ (BOOL)attachmentsRepresentInterlacedFields:(id)a3
{
  size_t v3 = [a3 objectForKeyedSubscript:*MEMORY[0x263F03F30]];
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = [v3 integerValue] > 1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)attachmentsContainTopLeftChromaLocations:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = *MEMORY[0x263F03E48];
  v18[0] = *MEMORY[0x263F03E58];
  v18[1] = v4;
  BOOL v5 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v18, 2, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = *MEMORY[0x263F03E98];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        long long v11 = v10;
        if (v10 && ([v10 isEqualToString:v8] & 1) == 0)
        {

          BOOL v12 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_12:

  return v12;
}

+ (id)colorimetricWarningsForPixelBufferAttachments:(id)a3 pixelFormat:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  if (+[MOVStreamIOUtility colorimetricWarningsForPixelBufferAttachments:pixelFormat:]::once != -1) {
    dispatch_once(&+[MOVStreamIOUtility colorimetricWarningsForPixelBufferAttachments:pixelFormat:]::once, &__block_literal_global_1);
  }
  uint64_t v6 = (void *)+[MOVStreamIOUtility colorimetricWarningsForPixelBufferAttachments:pixelFormat:]::s_PixelFormatInfoDictionary;
  uint64_t v7 = [NSNumber numberWithUnsignedInt:v4];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8) {
    goto LABEL_7;
  }
  int v13 = 0;
  uint64_t v12 = 0x100000000;
  [v8 getValue:&v12];
  if (!HIDWORD(v12))
  {
    uint64_t v9 = +[MOVStreamIOUtility colorimetricWarningsForGrayscalePixelBufferAttachments:v5 pixelFormat:v4];
    goto LABEL_9;
  }
  if (HIDWORD(v12) != 1)
  {
LABEL_7:
    long long v10 = 0;
    goto LABEL_10;
  }
  uint64_t v9 = +[MOVStreamIOUtility colorimetricWarningsForColorPixelBufferAttachments:v5 pixelFormat:v4];
LABEL_9:
  long long v10 = (void *)v9;
LABEL_10:

  return v10;
}

void __80__MOVStreamIOUtility_colorimetricWarningsForPixelBufferAttachments_pixelFormat___block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:16];
  for (uint64_t i = 0; i != 192; i += 12)
  {
    uint64_t v2 = *(void *)((char *)&unk_21B6611C8 + i);
    uint64_t v9 = v2;
    int v3 = *(_DWORD *)((char *)&unk_21B6611C8 + i + 8);
    int v10 = v3;
    if (v3) {
      BOOL v4 = v2 == v3;
    }
    else {
      BOOL v4 = 1;
    }
    if (!v4) {
      __assert_rtn("+[MOVStreamIOUtility colorimetricWarningsForPixelBufferAttachments:pixelFormat:]_block_invoke", "MOVStreamIOUtility.mm", 584, "!info.pixelFormatAlt || (info.pixelFormat == info.pixelFormatAlt)");
    }
    id v5 = (void *)[objc_alloc(MEMORY[0x263F08D40]) initWithBytes:&v9 objCType:"{?=IiI}"];
    if (v5)
    {
      uint64_t v6 = [NSNumber numberWithUnsignedInt:v9];
      [v0 setObject:v5 forKeyedSubscript:v6];
    }
  }
  uint64_t v7 = [v0 copy];
  uint64_t v8 = (void *)+[MOVStreamIOUtility colorimetricWarningsForPixelBufferAttachments:pixelFormat:]::s_PixelFormatInfoDictionary;
  +[MOVStreamIOUtility colorimetricWarningsForPixelBufferAttachments:pixelFormat:]::s_PixelFormatInfoDictionary = v7;
}

+ (id)colorimetricWarningsForColorPixelBufferAttachments:(id)a3 pixelFormat:(unsigned int)a4
{
  v116[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  unsigned int v73 = a4;
  CFDictionaryRef v6 = CVPixelFormatDescriptionCreateWithPixelFormatType(0, a4);
  uint64_t v7 = 0;
  if (v5 && v6)
  {
    CFDictionaryRef v74 = v6;
    uint64_t v8 = *MEMORY[0x263F03FC0];
    uint64_t v69 = *MEMORY[0x263F03ED8];
    v116[0] = *MEMORY[0x263F03ED8];
    v116[1] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v116 count:2];
    uint64_t v68 = *MEMORY[0x263F04020];
    uint64_t v115 = *MEMORY[0x263F04020];
    v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v115 count:1];
    uint64_t v76 = *MEMORY[0x263F03E58];
    uint64_t v114 = *MEMORY[0x263F03E58];
    v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v114 count:1];
    uint64_t v113 = *MEMORY[0x263F03EA0];
    v70 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v113 count:1];
    v80 = objc_opt_new();
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    obuint64_t j = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v101 objects:v112 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v102;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v102 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v101 + 1) + 8 * i);
          long long v14 = [v5 objectForKeyedSubscript:v13];
          BOOL v15 = v14 == 0;

          if (v15)
          {
            long long v16 = [NSString stringWithFormat:@"%@ attachment is required for all color pixel formats", v13];
            [v80 setObject:v16 forKeyedSubscript:v13];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v101 objects:v112 count:16];
      }
      while (v10);
    }

    if ([a1 formatDescriptionRepresentsYCbCr:v74])
    {
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v17 = v72;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v97 objects:v111 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v98;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v98 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void *)(*((void *)&v97 + 1) + 8 * j);
            v22 = [v5 objectForKeyedSubscript:v21];
            BOOL v23 = v22 == 0;

            if (v23)
            {
              v24 = [NSString stringWithFormat:@"%@ attachment is required for all pixel formats with YCbCr sampling", v21];
              [v80 setObject:v24 forKeyedSubscript:v21];
            }
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v97 objects:v111 count:16];
        }
        while (v18);
      }
    }
    int v79 = [(id)objc_opt_class() pixelFormatIs420Sampled:v73];
    if (v79 && ([a1 formatDescriptionRepresentsYCbCr:v74] & 1) == 0) {
      __assert_rtn("+[MOVStreamIOUtility colorimetricWarningsForColorPixelBufferAttachments:pixelFormat:]", "MOVStreamIOUtility.mm", 663, "false");
    }
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v77 = v71;
    uint64_t v25 = [v77 countByEnumeratingWithState:&v93 objects:v110 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v94;
      uint64_t v27 = *MEMORY[0x263F03E48];
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v94 != v26) {
            objc_enumerationMutation(v77);
          }
          v29 = *(void **)(*((void *)&v93 + 1) + 8 * k);
          uint64_t v30 = [v5 objectForKeyedSubscript:v29];
          v31 = (void *)v30;
          if (v79)
          {
            if (v30) {
              goto LABEL_38;
            }
            v32 = [NSString stringWithFormat:@"%@ attachment is required for all pixel formats with 4:2:0 subsampling", v29];
            [v80 setObject:v32 forKeyedSubscript:v29];
            goto LABEL_37;
          }
          if (v30)
          {
            v33 = [NSString stringWithFormat:@"%@ attachment is unexpectedly present for a pixel format without 4:2:0 subsampling", v29];
            [v80 setObject:v33 forKeyedSubscript:v29];

            if ([v29 isEqualToString:v76])
            {
              v34 = [v5 objectForKeyedSubscript:v27];
              BOOL v35 = v34 == 0;

              if (!v35)
              {
                v32 = [NSString stringWithFormat:@"%@ attachment is unexpectedly present for a pixel format without 4:2:0 subsampling", v27];
                [v80 setObject:v32 forKeyedSubscript:v27];
LABEL_37:
              }
            }
          }
LABEL_38:
        }
        uint64_t v25 = [v77 countByEnumeratingWithState:&v93 objects:v110 count:16];
      }
      while (v25);
    }

    int v36 = [(id)objc_opt_class() attachmentsRepresentInterlacedFields:v5];
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    uint64_t v67 = *MEMORY[0x263F03E48];
    uint64_t v108 = *MEMORY[0x263F03E48];
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v108 count:1];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v89 objects:v109 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v90;
      do
      {
        for (uint64_t m = 0; m != v38; ++m)
        {
          if (*(void *)v90 != v39) {
            objc_enumerationMutation(v37);
          }
          uint64_t v41 = *(void *)(*((void *)&v89 + 1) + 8 * m);
          v42 = [v5 objectForKeyedSubscript:v41];
          if (v42) {
            int v43 = 0;
          }
          else {
            int v43 = v36;
          }
          if (v43 == 1)
          {
            v44 = [NSString stringWithFormat:@"%@ attachment is unexpectedly missing for a pixel format using interlaced scanning", v41];
            [v80 setObject:v44 forKeyedSubscript:v41];
          }
        }
        uint64_t v38 = [v37 countByEnumeratingWithState:&v89 objects:v109 count:16];
      }
      while (v38);
    }

    int v45 = [(id)objc_opt_class() pixelFormatIs422Sampled:v73];
    if (v45 && ([a1 formatDescriptionRepresentsYCbCr:v74] & 1) == 0) {
      __assert_rtn("+[MOVStreamIOUtility colorimetricWarningsForColorPixelBufferAttachments:pixelFormat:]", "MOVStreamIOUtility.mm", 726, "false");
    }
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v46 = v70;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v85 objects:v107 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v86;
      do
      {
        for (uint64_t n = 0; n != v47; ++n)
        {
          if (*(void *)v86 != v48) {
            objc_enumerationMutation(v46);
          }
          uint64_t v50 = *(void *)(*((void *)&v85 + 1) + 8 * n);
          v51 = [v5 objectForKeyedSubscript:v50];
          if (v51) {
            char v52 = v45;
          }
          else {
            char v52 = 1;
          }
          if ((v52 & 1) == 0)
          {
            v53 = [NSString stringWithFormat:@"%@ attachment is unexpectedly present for a pixel format without 4:2:2 subsampling", v50];
            [v80 setObject:v53 forKeyedSubscript:v50];
          }
        }
        uint64_t v47 = [v46 countByEnumeratingWithState:&v85 objects:v107 count:16];
      }
      while (v47);
    }

    if ([a1 attachmentsContainsRec2020orRec2100ColorPrimaries:v5])
    {
      if (([a1 formatDescriptionRepresentsVideoRange:v74] & 1) == 0)
      {
        v54 = [v80 objectForKeyedSubscript:v69];
        BOOL v55 = v54 == 0;

        if (v55) {
          [v80 setObject:@"Images with Rec 2020 or Rec 2100 color primaries are only defined for video range pixel formats." forKeyedSubscript:v69];
        }
      }
      if (([a1 attachmentsContainsRec2020orRec2100ColorMatrices:v5] & 1) == 0)
      {
        v56 = [v80 objectForKeyedSubscript:v68];
        BOOL v57 = v56 == 0;

        if (v57) {
          [v80 setObject:@"Images with Rec 2020 or Rec 2100 color primaries are only defined for attachments containing Rec 2020 or Rec 2100 YCbCr matrices." forKeyedSubscript:v68];
        }
      }
      if (v79 && ([a1 attachmentsContainTopLeftChromaLocations:v5] & 1) == 0)
      {
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        v105[0] = v76;
        v105[1] = v67;
        v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v105 count:2];
        uint64_t v59 = [v58 countByEnumeratingWithState:&v81 objects:v106 count:16];
        if (v59)
        {
          uint64_t v60 = *(void *)v82;
          do
          {
            for (iuint64_t i = 0; ii != v59; ++ii)
            {
              if (*(void *)v82 != v60) {
                objc_enumerationMutation(v58);
              }
              uint64_t v62 = *(void *)(*((void *)&v81 + 1) + 8 * ii);
              v63 = [v80 objectForKeyedSubscript:v62];
              if (v63)
              {
              }
              else
              {
                v64 = [v5 objectForKeyedSubscript:v62];
                BOOL v65 = v64 == 0;

                if (!v65) {
                  [v80 setObject:@"Images with Rec 2020 or Rec 2100 color primaries and 4:2:0 subsampling are only defined for attachments containing topLeft chroma locations." forKeyedSubscript:v62];
                }
              }
            }
            uint64_t v59 = [v58 countByEnumeratingWithState:&v81 objects:v106 count:16];
          }
          while (v59);
        }
      }
    }
    uint64_t v7 = (void *)[v80 copy];

    CFDictionaryRef v6 = v74;
  }

  return v7;
}

+ (id)colorimetricWarningsForGrayscalePixelBufferAttachments:(id)a3 pixelFormat:(unsigned int)a4
{
  v39[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    v39[0] = *MEMORY[0x263F03FC0];
    uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
    uint64_t v6 = *MEMORY[0x263F04020];
    v38[0] = *MEMORY[0x263F03ED8];
    v38[1] = v6;
    uint64_t v7 = *MEMORY[0x263F03E48];
    v38[2] = *MEMORY[0x263F03E58];
    v38[3] = v7;
    v38[4] = *MEMORY[0x263F03EA0];
    uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:5];
    uint64_t v8 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obuint64_t j = v26;
    uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v13 = [v5 objectForKeyedSubscript:v12];
          BOOL v14 = v13 == 0;

          if (v14)
          {
            BOOL v15 = [NSString stringWithFormat:@"%@ attachment is required for all grayscale pixel formats", v12, v25];
            [v8 setObject:v15 forKeyedSubscript:v12];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v9);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = v25;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * j);
          uint64_t v21 = [v5 objectForKeyedSubscript:v20];
          if (v21 && ([a1 key:v20 hasUnspecifiedValue:v21] & 1) == 0)
          {
            v22 = [NSString stringWithFormat:@"%@ attachment is unexpectedly present for a grayscale pixel format", v20];
            [v8 setObject:v22 forKeyedSubscript:v20];
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v17);
    }

    BOOL v23 = (void *)[v8 copy];
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

+ (BOOL)key:(id)a3 hasUnspecifiedValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 length];
  char v8 = 1;
  if (v6 && v7)
  {
    if ([v5 isEqualToString:*MEMORY[0x263F03ED8]])
    {
      uint64_t v9 = CVColorPrimariesGetStringForIntegerCodePoint(2);
    }
    else if ([v5 isEqualToString:*MEMORY[0x263F03FC0]])
    {
      uint64_t v9 = CVTransferFunctionGetStringForIntegerCodePoint(2);
    }
    else
    {
      if (![v5 isEqualToString:*MEMORY[0x263F04020]])
      {
        uint64_t v10 = 0;
        goto LABEL_10;
      }
      uint64_t v9 = CVYCbCrMatrixGetStringForIntegerCodePoint(2);
    }
    uint64_t v10 = (void *)v9;
LABEL_10:
    char v8 = [v10 isEqualToString:v6];
  }
  return v8;
}

+ (BOOL)isEncoderAvailableForEncoderType:(int)a3
{
  if (a3 <= 8)
  {
    if (!a3) {
      return 0;
    }
    if (a3 == 3)
    {
      int v3 = [MEMORY[0x263F08AB0] processInfo];
      uint64_t v7 = 0;
      long long v6 = xmmword_21B661298;
      char v4 = [v3 isOperatingSystemAtLeastVersion:&v6];

      return v4;
    }
    return 1;
  }
  if (a3 != 9 && a3 != 12) {
    return 1;
  }

  return +[MOVStreamIOUtility isEncoderAvailableWithEncoderName:@"hvc1"];
}

+ (BOOL)isEncoderAvailableWithEncoderName:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  CFArrayRef listOfVideoEncodersOut = 0;
  uint64_t v4 = VTCopyVideoEncoderList(0, &listOfVideoEncodersOut);
  if (v4)
  {
    uint64_t v13 = (void *)MEMORY[0x263EFF940];
    BOOL v14 = [NSString stringWithFormat:@"Cannot retrieve available video encoder list, error %d", v4];
    id v15 = [v13 exceptionWithName:*MEMORY[0x263EFF488] reason:v14 userInfo:0];

    objc_exception_throw(v15);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  CFArrayRef v5 = listOfVideoEncodersOut;
  uint64_t v6 = [(__CFArray *)v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    uint64_t v8 = *MEMORY[0x263F1ED28];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) objectForKey:v8];
        if ([v10 isEqualToString:v3])
        {
          CFRelease(listOfVideoEncodersOut);

          BOOL v11 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [(__CFArray *)v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  CFRelease(listOfVideoEncodersOut);
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

+ (BOOL)isHEVCEncoderType:(int)a3
{
  return (a3 < 0x24) & (0xC19F81EF0uLL >> a3);
}

+ (unint64_t)getDefaultBitrateForVideoDimension:(id)a3 atExpectedFramerate:(double)a4 forEncoderType:(int)a5
{
  float v5 = a4;
  return (int)(float)((float)(flt_21B6611C0[a5 == 9] * v5) * (float)(a3.var1 * a3.var0));
}

+ (id)valueWithCGAffineTransform:(CGAffineTransform *)a3
{
  return (id)[MEMORY[0x263F08D40] valueWithBytes:a3 objCType:"{CGAffineTransform=dddddd}"];
}

+ (CGAffineTransform)CGAffineTransformValueFromNSValue:(SEL)a3
{
  return (CGAffineTransform *)[a4 getValue:retstr];
}

+ (id)addTransform:(CGAffineTransform *)a3 toConfiguration:(id)a4
{
  float v5 = (void *)[a4 mutableCopy];
  long long v6 = *(_OWORD *)&a3->c;
  v10[0] = *(_OWORD *)&a3->a;
  v10[1] = v6;
  v10[2] = *(_OWORD *)&a3->tx;
  uint64_t v7 = +[MOVStreamIOUtility valueWithCGAffineTransform:v10];
  [v5 setObject:v7 forKey:@"VideoTransform"];

  uint64_t v8 = (void *)[v5 copy];

  return v8;
}

+ (id)addTrackTypeInfo:(unint64_t)a3 toConfiguration:(id)a4
{
  float v5 = (void *)[a4 mutableCopy];
  long long v6 = [NSNumber numberWithUnsignedLong:a3];
  [v5 setObject:v6 forKey:@"VideoTrackTypeInfo"];

  uint64_t v7 = (void *)[v5 copy];

  return v7;
}

+ (id)addEncodingQuality:(double)a3 toConfiguration:(id)a4
{
  float v5 = (void *)[a4 mutableCopy];
  long long v6 = NSNumber;
  +[MOVStreamIOUtility clampedQuality:a3];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  [v5 setObject:v7 forKey:@"EncodingQuality"];

  uint64_t v8 = (void *)[v5 copy];

  return v8;
}

+ (id)monochrome10bitHEVCLosslessEncoderConfig
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"StreamEncoderType";
  v5[0] = &unk_26CB7CE28;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)monochrome10bitHEVCLosslessEncoderConfigAllowFrameReordering:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() monochrome10bitHEVCLosslessEncoderConfig];
  float v5 = (void *)[v4 mutableCopy];

  long long v6 = [NSNumber numberWithBool:v3];
  [v5 setObject:v6 forKey:@"AllowFrameReordering"];

  uint64_t v7 = (void *)[v5 copy];

  return v7;
}

+ (id)monochrome8bitHEVCLosslessEncoderConfig
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"StreamEncoderType";
  v5[0] = &unk_26CB7CE40;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)monochrome8bitHEVCLosslessEncoderConfigAllowFrameReordering:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() monochrome8bitHEVCLosslessEncoderConfig];
  float v5 = (void *)[v4 mutableCopy];

  long long v6 = [NSNumber numberWithBool:v3];
  [v5 setObject:v6 forKey:@"AllowFrameReordering"];

  uint64_t v7 = (void *)[v5 copy];

  return v7;
}

+ (id)monochrome8bitHEVCEncoderConfig
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"StreamEncoderType";
  v5[0] = &unk_26CB7CE58;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)monochrome8bitHEVCEncoderConfigWithBitrate:(unint64_t)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"StreamEncoderType";
  v6[1] = @"ColorStreamBitrate";
  v7[0] = &unk_26CB7CE58;
  BOOL v3 = [NSNumber numberWithUnsignedLong:a3];
  v7[1] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)monochrome10bitHEVCEncoderConfigWithQuality:(double)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"StreamEncoderType";
  v6[1] = @"EncodingQuality";
  v7[0] = &unk_26CB7CE70;
  BOOL v3 = [NSNumber numberWithDouble:a3];
  v7[1] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)monochrome8bitHEVCEncoderConfigWithQuality:(double)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"StreamEncoderType";
  v6[1] = @"EncodingQuality";
  v7[0] = &unk_26CB7CE58;
  BOOL v3 = [NSNumber numberWithDouble:a3];
  v7[1] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)colorHEVCEncoderConfigWithQuality:(double)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"StreamEncoderType";
  v6[1] = @"EncodingQuality";
  v7[0] = &unk_26CB7CE88;
  BOOL v3 = [NSNumber numberWithDouble:a3];
  v7[1] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)color8bitHEVCWithAlphaEncoderConfig
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"StreamEncoderType";
  v5[0] = &unk_26CB7CEA0;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)color8bitHEVCWithAlphaEncoderConfigWithBitrate:(unint64_t)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"StreamEncoderType";
  v6[1] = @"ColorStreamBitrate";
  v7[0] = &unk_26CB7CEA0;
  BOOL v3 = [NSNumber numberWithUnsignedLong:a3];
  v7[1] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)colorHEVCLosslessEncoderConfig
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"StreamEncoderType";
  v5[0] = &unk_26CB7CEB8;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)colorHEVCEncoderConfig
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"StreamEncoderType";
  v5[0] = &unk_26CB7CE88;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)colorWithAlphaLossless8bitHEVCEncoderConfig
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"StreamEncoderType";
  v5[0] = &unk_26CB7CED0;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)colorH264EncoderConfig
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"StreamEncoderType";
  v5[0] = &unk_26CB7CEE8;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)colorHEVCEncoderConfigWithBitrate:(unint64_t)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"StreamEncoderType";
  v6[1] = @"ColorStreamBitrate";
  v7[0] = &unk_26CB7CE88;
  BOOL v3 = [NSNumber numberWithUnsignedLong:a3];
  v7[1] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)colorH264EncoderConfigWithBitrate:(unint64_t)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"StreamEncoderType";
  v6[1] = @"ColorStreamBitrate";
  v7[0] = &unk_26CB7CEE8;
  BOOL v3 = [NSNumber numberWithUnsignedLong:a3];
  v7[1] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)slimEncoderConfig
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"StreamEncoderType";
  v5[0] = &unk_26CB7CF00;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)slimXEncoderConfig
{
  void v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"StreamEncoderType";
  v4[1] = @"UseSlimXCompression";
  v5[0] = &unk_26CB7CF00;
  v5[1] = MEMORY[0x263EFFA88];
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

+ (id)jpegEncoderConfig
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"StreamEncoderType";
  v5[0] = &unk_26CB7CF18;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)jpegEncoderConfigWithQuality:(double)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"StreamEncoderType";
  v6[1] = @"EncodingQuality";
  v7[0] = &unk_26CB7CF18;
  BOOL v3 = [NSNumber numberWithDouble:a3];
  v7[1] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)configWithEncoderType:(int)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  long long v6 = @"StreamEncoderType";
  BOOL v3 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  v7[0] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

+ (id)noneEncoderConfig
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"StreamEncoderType";
  v5[0] = &unk_26CB7CF30;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)sampleBufferConfigWithPixelFormat:(unsigned int)a3
{
  void v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"StreamEncoderType";
  v6[1] = @"PixelFormat";
  v7[0] = &unk_26CB7CF30;
  BOOL v3 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  v7[1] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)audioNoneEncoderConfig
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"StreamEncoderType";
  v5[0] = &unk_26CB7CF48;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)customEncoderConfig
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"StreamEncoderType";
  v5[0] = &unk_26CB7CF60;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)customConfigWithOutputSettings:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3)
  {
    id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"outputSettings must not be nil." userInfo:0];
    objc_exception_throw(v7);
  }
  v8[0] = @"StreamEncoderType";
  v8[1] = @"CustomOutputSettings";
  v9[0] = &unk_26CB7CF78;
  v9[1] = v3;
  float v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v5;
}

+ (id)customEncoderConfigWithEmbeddedConfiguration:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3)
  {
    id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"Embedded configuration must not be nil." userInfo:0];
    objc_exception_throw(v7);
  }
  v8[0] = @"StreamEncoderType";
  v8[1] = @"CustomEncoderConfig";
  v9[0] = &unk_26CB7CF60;
  v9[1] = v3;
  float v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v5;
}

+ (id)stereoConfigurationWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 frameRate:(double)a6 additionalCompressionProperties:(id)a7
{
  id v7 = +[MOVStreamIOUtility stereoConfigurationWidth:a3 height:a4 pixelFormat:*(void *)&a5 frameRate:0 leftAndRightViewIDs:a7 additionalCompressionProperties:a6];

  return v7;
}

+ (id)stereoConfigurationWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 frameRate:(double)a6 leftAndRightViewIDs:(id)a7 additionalCompressionProperties:(id)a8
{
  uint64_t v10 = *(void *)&a5;
  v39[2] = *MEMORY[0x263EF8340];
  id v31 = a7;
  id v13 = a8;
  id v14 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v15 = *MEMORY[0x263F1E548];
  v38[0] = *MEMORY[0x263F1E5A0];
  v38[1] = v15;
  v39[0] = &unk_26CB7D518;
  long long v16 = [NSNumber numberWithDouble:a6];
  v39[1] = v16;
  long long v17 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
  long long v18 = (void *)[v14 initWithDictionary:v17];

  if (v31 && [v31 count] == 2)
  {
    [v18 setObject:&unk_26CB7D518 forKey:*MEMORY[0x263F1E5A8]];
    [v18 setObject:v31 forKey:*MEMORY[0x263F1E598]];
  }
  uint64_t v19 = MEMORY[0x263EFFA78];
  if (!v13) {
    id v13 = (id)MEMORY[0x263EFFA78];
  }
  uint64_t v20 = *MEMORY[0x263EFA338];
  v37[0] = *MEMORY[0x263EFA370];
  uint64_t v21 = *MEMORY[0x263EFA458];
  v36[0] = v20;
  v36[1] = v21;
  uint64_t v22 = [NSNumber numberWithUnsignedLong:a3];
  v37[1] = v22;
  v36[2] = *MEMORY[0x263EFA3E8];
  BOOL v23 = [NSNumber numberWithUnsignedLong:a4];
  v36[3] = *MEMORY[0x263EFA3A0];
  v37[2] = v23;
  v37[3] = v18;
  v24 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];

  v34[0] = *MEMORY[0x263F04180];
  uint64_t v25 = [NSNumber numberWithUnsignedInt:v10];
  v35[0] = v25;
  v34[1] = *MEMORY[0x263F04240];
  uint64_t v26 = [NSNumber numberWithUnsignedLong:a3];
  v35[1] = v26;
  v34[2] = *MEMORY[0x263F04118];
  uint64_t v27 = [NSNumber numberWithUnsignedLong:a4];
  v34[3] = *MEMORY[0x263F04130];
  v35[2] = v27;
  v35[3] = v19;
  long long v28 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];

  v32[0] = @"StreamEncoderType";
  v32[1] = @"CustomOutputSettings";
  v33[0] = &unk_26CB7CF78;
  v33[1] = v24;
  v32[2] = @"AdditionalCompressionProperties";
  v32[3] = @"TaggedPixelBufferGroupAdaptorPixelBufferAttributes";
  v33[2] = v13;
  v33[3] = v28;
  v32[4] = @"StereoVideoEncoding";
  v33[4] = MEMORY[0x263EFFA88];
  long long v29 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:5];

  return v29;
}

+ (id)monochrome10bitHEVCEncoderConfig
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"StreamEncoderType";
  v5[0] = &unk_26CB7CE70;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)monochrome10bitHEVCEncoderConfigWithBitrate:(unint64_t)a3
{
  void v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"StreamEncoderType";
  v6[1] = @"ColorStreamBitrate";
  v7[0] = &unk_26CB7CE70;
  id v3 = [NSNumber numberWithUnsignedLong:a3];
  v7[1] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)proRes4444EncoderConfig
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"StreamEncoderType";
  v5[0] = &unk_26CB7CFC0;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)proRes422EncoderConfig
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"StreamEncoderType";
  v5[0] = &unk_26CB7CFD8;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)proRes422EncoderConfigWithQuality:(int64_t)a3
{
  void v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"StreamEncoderType";
  v6[1] = @"ProResEncodingQuality";
  v7[0] = &unk_26CB7CFD8;
  id v3 = [NSNumber numberWithInteger:a3];
  v7[1] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)proRes4444EncoderConfigWithHighQuality
{
  void v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"StreamEncoderType";
  v4[1] = @"ProResEncodingQuality";
  v5[0] = &unk_26CB7CFC0;
  v5[1] = &unk_26CB7CFF0;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

+ (id)colorRecordingConfigBitDepth:(unint64_t)a3 lossless:(BOOL)a4 chromaSampling:(int64_t)a5 error:(id *)a6
{
  v33[1] = *MEMORY[0x263EF8340];
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 8)
  {
    if (a5 == 2)
    {
      if (a3 == 8)
      {
        if (a4)
        {
          long long v16 = @"StreamEncoderType";
          long long v17 = &unk_26CB7D098;
          long long v6 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1, a6);
        }
        else
        {
          id v14 = @"StreamEncoderType";
          uint64_t v15 = &unk_26CB7D0B0;
          long long v6 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1, a6);
        }
      }
      else if (a4)
      {
        uint64_t v12 = @"StreamEncoderType";
        id v13 = &unk_26CB7D0C8;
        long long v6 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1, a6);
      }
      else
      {
        uint64_t v10 = @"StreamEncoderType";
        BOOL v11 = &unk_26CB7D0E0;
        long long v6 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1, a6);
      }
    }
    else if (a5 == 1)
    {
      if (a3 == 8)
      {
        if (a4)
        {
          v24 = @"StreamEncoderType";
          uint64_t v25 = &unk_26CB7D038;
          long long v6 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1, a6);
        }
        else
        {
          uint64_t v22 = @"StreamEncoderType";
          BOOL v23 = &unk_26CB7D050;
          long long v6 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1, a6);
        }
      }
      else if (a4)
      {
        uint64_t v20 = @"StreamEncoderType";
        uint64_t v21 = &unk_26CB7D068;
        long long v6 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1, a6);
      }
      else
      {
        long long v18 = @"StreamEncoderType";
        uint64_t v19 = &unk_26CB7D080;
        long long v6 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1, a6);
      }
    }
    else
    {
      if (a5) {
        +[MOVStreamIOUtility colorRecordingConfigBitDepth:lossless:chromaSampling:error:]();
      }
      if (a3 == 8)
      {
        if (a4)
        {
          long long v32 = @"StreamEncoderType";
          v33[0] = &unk_26CB7CEB8;
          long long v6 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, &v32, 1, a6);
        }
        else
        {
          long long v30 = @"StreamEncoderType";
          id v31 = &unk_26CB7CE88;
          long long v6 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1, a6);
        }
      }
      else if (a4)
      {
        long long v28 = @"StreamEncoderType";
        long long v29 = &unk_26CB7D008;
        long long v6 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1, a6);
      }
      else
      {
        uint64_t v26 = @"StreamEncoderType";
        uint64_t v27 = &unk_26CB7D020;
        long long v6 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1, a6);
      }
    }
  }
  else
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported bit depth (%zu).", a4, a5, a3);
    [MEMORY[0x263F087E8] populateStreamError:a6 message:v8 code:28];

    long long v6 = 0;
  }

  return v6;
}

+ (id)colorRecordingConfigBitDepth:(unint64_t)a3 bitrate:(unint64_t)a4 chromaSampling:(int64_t)a5 error:(id *)a6
{
  id v7 = [(id)objc_opt_class() colorRecordingConfigBitDepth:a3 lossless:0 chromaSampling:a5 error:a6];
  uint64_t v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = [NSNumber numberWithUnsignedLong:a4];
  [v8 setObject:v9 forKey:@"ColorStreamBitrate"];

  return v8;
}

+ (id)colorRecordingConfigBitDepth:(unint64_t)a3 quality:(double)a4 chromaSampling:(int64_t)a5 error:(id *)a6
{
  id v7 = [(id)objc_opt_class() colorRecordingConfigBitDepth:a3 lossless:0 chromaSampling:a5 error:a6];
  uint64_t v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = [NSNumber numberWithDouble:a4];
  [v8 setObject:v9 forKey:@"EncodingQuality"];

  return v8;
}

+ (id)colorRecordingConfigBitDepth:(unint64_t)a3 chromaSampling:(int64_t)a4 error:(id *)a5
{
  uint64_t v8 = objc_opt_class();

  return (id)[v8 colorRecordingConfigBitDepth:a3 lossless:0 chromaSampling:a4 error:a5];
}

+ (BOOL)isKeyFrame:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  if (CMSampleBufferGetImageBuffer(a3))
  {
    long long v6 = (void *)MEMORY[0x263F087E8];
    id v7 = @"decoding is set up for this sample buffer. Cannot tell whether it's a key frame or not";
LABEL_3:
    [v6 populateStreamError:a4 message:v7 code:0];
    return 0;
  }
  CFArrayRef SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(a3, 1u);
  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(SampleAttachmentsArray, 0);
  value = 0;
  if (!ValueAtIndex)
  {
    long long v6 = (void *)MEMORY[0x263F087E8];
    id v7 = @"This sample buffer doesn't have any attachment. Cannot tell whether it's a key frame or not";
    goto LABEL_3;
  }
  return !CFDictionaryGetValueIfPresent(ValueAtIndex, (const void *)*MEMORY[0x263F01010], (const void **)&value)
      || value == (void *)*MEMORY[0x263EFFB38];
}

+ (BOOL)isSlimXEncodedTrack:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(a3, "formatDescriptions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    CFStringRef v6 = (const __CFString *)*MEMORY[0x263F00E88];
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(const opaqueCMFormatDescription **)(*((void *)&v11 + 1) + 8 * i);
        if (CMFormatDescriptionGetMediaSubType(v8) == 1936484717)
        {
          Extensiouint64_t n = (const __CFDictionary *)CMFormatDescriptionGetExtension(v8, v6);
          if (Extension)
          {
            if (CFDictionaryGetValue(Extension, @"slmC"))
            {
              LOBYTE(v4) = 1;
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v4;
}

+ (int64_t)chromaSamplingFromMediaFormatDescription:(opaqueCMFormatDescription *)a3
{
  if (CMFormatDescriptionGetMediaSubType(a3) == 1752589105
    && (Extensiouint64_t n = (const __CFDictionary *)CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x263F00E88])) != 0
    && CFDictionaryGetValue(Extension, @"hvcC")
    && !FigHEVCBridge_GetHEVCParameterSetAtIndex()
    && !FigHEVCBridge_GetSPSChromaFormatAndBitDepths())
  {
    return 3;
  }
  else
  {
    return 4;
  }
}

+ (int64_t)chromaSamplingForTrack:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(a3, "formatDescriptions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v3);
      }
      int64_t v7 = [(id)objc_opt_class() chromaSamplingFromMediaFormatDescription:*(void *)(*((void *)&v9 + 1) + 8 * v6)];
      if (v7 != 4) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    int64_t v7 = 4;
  }

  return v7;
}

+ (opaqueCMFormatDescription)createTimeCode64FormatDescriptionWithFrameRate:(double)a3 dropFrame:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  CMTimeCodeFormatDescriptionRef formatDescriptionOut = 0;
  if (a4) {
    uint32_t v8 = 3;
  }
  else {
    uint32_t v8 = 2;
  }
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CMTimeMake(&frameDuration, 100, (int)(a3 * 100.0));
  uint64_t v10 = CMTimeCodeFormatDescriptionCreate(v9, 0x74633634u, &frameDuration, vcvtpd_u64_f64(a3), v8, 0, &formatDescriptionOut);
  if (!v10) {
    return formatDescriptionOut;
  }
  if (a5)
  {
    long long v11 = @"NO";
    if (v6) {
      long long v11 = @"YES";
    }
    long long v12 = [NSString stringWithFormat:@"Cannot create TimeCode64 FormatDescription with fps %f drop frame %@. Error: %d", *(void *)&a3, v11, v10];
    *a5 = [MEMORY[0x263F087E8] internalErrorWithMessage:v12 code:8];
  }
  return 0;
}

+ (opaqueCMFormatDescription)createTimeCode32FormatDescriptionWithFrameRate:(double)a3 dropFrame:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  CMTimeCodeFormatDescriptionRef formatDescriptionOut = 0;
  if (a4) {
    uint32_t v8 = 3;
  }
  else {
    uint32_t v8 = 2;
  }
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CMTimeMake(&frameDuration, 100, (int)(a3 * 100.0));
  uint64_t v10 = CMTimeCodeFormatDescriptionCreate(v9, 0x746D6364u, &frameDuration, vcvtpd_u64_f64(a3), v8, 0, &formatDescriptionOut);
  if (!v10) {
    return formatDescriptionOut;
  }
  if (a5)
  {
    long long v11 = @"NO";
    if (v6) {
      long long v11 = @"YES";
    }
    long long v12 = [NSString stringWithFormat:@"Cannot create TimeCode32 FormatDescription with fps %f drop frame %@. Error: %d", *(void *)&a3, v11, v10];
    *a5 = [MEMORY[0x263F087E8] internalErrorWithMessage:v12 code:8];
  }
  return 0;
}

+ (opaqueCMSampleBuffer)createTimecodeSampleBufferWithSMPTETime:(CVSMPTETime *)a3 formatDescription:(opaqueCMFormatDescription *)a4 pts:(id *)a5 error:(id *)a6
{
  uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(a4);
  if (MediaSubType == 1952658996)
  {
    long long v15 = *(_OWORD *)&a3->subframes;
    uint64_t v16 = *(void *)&a3->hours;
    long long v13 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    return +[MOVStreamIOUtility createTimecode64SampleBufferWithSMPTETime:&v15 formatDescription:a4 pts:&v13 error:a6];
  }
  else if (MediaSubType == 1953325924)
  {
    long long v19 = *(_OWORD *)&a3->subframes;
    uint64_t v20 = *(void *)&a3->hours;
    long long v17 = *(_OWORD *)&a5->var0;
    int64_t v18 = a5->var3;
    return +[MOVStreamIOUtility createTimecode32SampleBufferWithSMPTETime:&v19 formatDescription:a4 pts:&v17 error:a6];
  }
  else
  {
    long long v12 = objc_msgSend(NSString, "stringWithFormat:", @"TimeCode format (%d) not supported.", MediaSubType);
    [MEMORY[0x263F087E8] populateReaderError:a6 message:v12 code:12];

    return 0;
  }
}

+ (opaqueCMSampleBuffer)createTimecode32SampleBufferWithSMPTETime:(CVSMPTETime *)a3 formatDescription:(opaqueCMFormatDescription *)a4 pts:(id *)a5 error:(id *)a6
{
  CMBlockBufferRef blockBufferOut = 0;
  CMSampleBufferRef v23 = 0;
  CVSMPTETime v20 = *a3;
  int sourceBytes = +[MOVStreamIOUtility frameNumber32ForTimecode:usingFormatDescription:](MOVStreamIOUtility, "frameNumber32ForTimecode:usingFormatDescription:", &v20, a4, a5, a6);
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  OSStatus v9 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 4uLL, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, 4uLL, 1u, &blockBufferOut);
  uint64_t v10 = blockBufferOut;
  if (v9) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = blockBufferOut == 0;
  }
  if (v11)
  {
    NSLog(&cfstr_CouldNotCreate.isa);
    uint64_t v10 = blockBufferOut;
  }
  if (CMBlockBufferReplaceDataBytes(&sourceBytes, v10, 0, 4uLL)) {
    NSLog(&cfstr_CouldNotWriteI.isa);
  }
  long long v12 = *(_OWORD *)(MEMORY[0x263F01110] + 48);
  *(_OWORD *)&v19.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x263F01110] + 32);
  *(_OWORD *)&v19.decodeTimeStamp.value = v12;
  CMTimeEpoch v13 = *(void *)(MEMORY[0x263F01110] + 64);
  long long v14 = *(_OWORD *)(MEMORY[0x263F01110] + 16);
  *(_OWORD *)&v19.duration.value = *MEMORY[0x263F01110];
  *(_OWORD *)&v19.duration.epoch = v14;
  *(_OWORD *)&v19.presentationTimeStamp.value = *(_OWORD *)&a5->var0;
  CMTimeEpoch var3 = a5->var3;
  v19.decodeTimeStamp.epoch = v13;
  v19.presentationTimeStamp.epoch = var3;
  signed int FrameQuanta = CMTimeCodeFormatDescriptionGetFrameQuanta(a4);
  CMTimeMake(&v19.duration, (uint64_t)(1.0 / (double)FrameQuanta * (double)a5->var1), a5->var1);
  size_t sampleSizeArray = 4;
  if (CMSampleBufferCreate(v8, blockBufferOut, 1u, 0, 0, a4, 1, 1, &v19, 1, &sampleSizeArray, &v23) || !v23) {
    NSLog(&cfstr_CouldNotCreate.isa);
  }
  CFRelease(blockBufferOut);
  return v23;
}

+ (opaqueCMSampleBuffer)createTimecode64SampleBufferWithSMPTETime:(CVSMPTETime *)a3 formatDescription:(opaqueCMFormatDescription *)a4 pts:(id *)a5 error:(id *)a6
{
  CMBlockBufferRef blockBufferOut = 0;
  CMSampleBufferRef v23 = 0;
  CVSMPTETime v20 = *a3;
  int64_t sourceBytes = +[MOVStreamIOUtility frameNumber64ForTimecode:usingFormatDescription:](MOVStreamIOUtility, "frameNumber64ForTimecode:usingFormatDescription:", &v20, a4, a5, a6);
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  OSStatus v9 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 8uLL, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, 8uLL, 1u, &blockBufferOut);
  uint64_t v10 = blockBufferOut;
  if (v9) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = blockBufferOut == 0;
  }
  if (v11)
  {
    NSLog(&cfstr_CouldNotCreate.isa);
    uint64_t v10 = blockBufferOut;
  }
  if (CMBlockBufferReplaceDataBytes(&sourceBytes, v10, 0, 8uLL)) {
    NSLog(&cfstr_CouldNotWriteI.isa);
  }
  long long v12 = *(_OWORD *)(MEMORY[0x263F01110] + 48);
  *(_OWORD *)&v19.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x263F01110] + 32);
  *(_OWORD *)&v19.decodeTimeStamp.value = v12;
  CMTimeEpoch v13 = *(void *)(MEMORY[0x263F01110] + 64);
  long long v14 = *(_OWORD *)(MEMORY[0x263F01110] + 16);
  *(_OWORD *)&v19.duration.value = *MEMORY[0x263F01110];
  *(_OWORD *)&v19.duration.epoch = v14;
  *(_OWORD *)&v19.presentationTimeStamp.value = *(_OWORD *)&a5->var0;
  CMTimeEpoch var3 = a5->var3;
  v19.decodeTimeStamp.epoch = v13;
  v19.presentationTimeStamp.epoch = var3;
  signed int FrameQuanta = CMTimeCodeFormatDescriptionGetFrameQuanta(a4);
  CMTimeMake(&v19.duration, (uint64_t)(1.0 / (double)FrameQuanta * (double)a5->var1), a5->var1);
  size_t sampleSizeArray = 8;
  if (CMSampleBufferCreate(v8, blockBufferOut, 1u, 0, 0, a4, 1, 1, &v19, 1, &sampleSizeArray, &v23) || !v23) {
    NSLog(&cfstr_CouldNotCreate.isa);
  }
  CFRelease(blockBufferOut);
  return v23;
}

+ (CVSMPTETime)timecode32ForSampleBuffer:(SEL)a3 dropFrame:(opaqueCMSampleBuffer *)a4
{
  DataBuffer = CMSampleBufferGetDataBuffer(a4);
  BOOL result = (CVSMPTETime *)CMSampleBufferGetFormatDescription(a4);
  if (!DataBuffer) {
    goto LABEL_8;
  }
  uint64_t v10 = result;
  if (!result) {
    goto LABEL_8;
  }
  size_t totalLengthOut = 0;
  size_t lengthAtOffsetOut = 0;
  dataPointerOut = 0;
  if (CMBlockBufferGetDataPointer(DataBuffer, 0, &lengthAtOffsetOut, &totalLengthOut, &dataPointerOut))
  {
    NSLog(&cfstr_CouldNotGetDat.isa);
LABEL_8:
    *(void *)&retstr->subframes = 0;
    *(void *)&retstr->type = 0;
    *(void *)&retstr->hours = 0;
    return result;
  }
  BOOL result = (CVSMPTETime *)CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v10);
  if (result != 1953325924) {
    goto LABEL_8;
  }
  BOOL v11 = dataPointerOut;
  *(void *)&retstr->type = 0;
  *(void *)&retstr->hours = 0;
  *(void *)&retstr->subframes = 0;
  +[MOVStreamIOUtility timecodeForFrameNumber32:*(unsigned int *)v11 formatDescription:v10];
  BOOL result = (CVSMPTETime *)CMTimeCodeFormatDescriptionGetTimeCodeFlags((CMTimeCodeFormatDescriptionRef)v10);
  if (a5) {
    *a5 = result & 1;
  }
  return result;
}

+ (id)qtTrackNameForAssociatedAttachmentsTrack:(id)a3
{
  id v3 = [a3 stringByAppendingString:@"_attachments"];

  return v3;
}

+ (id)qtTrackNameForAssociatedTimeCodeTrack:(id)a3
{
  id v3 = [a3 stringByAppendingString:@"_timecode"];

  return v3;
}

+ (opaqueCMFormatDescription)createL010FormatDescriptionFromL016FormatDescription:(opaqueCMFormatDescription *)a3
{
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3);
  uint64_t v5 = CMFormatDescriptionGetExtensions(a3);
  BOOL v6 = [v5 objectForKey:@"CVBytesPerRow"];
  int v7 = [v6 intValue];
  if (v7 >= 0) {
    int v8 = v7;
  }
  else {
    int v8 = v7 + 1;
  }
  OSStatus v9 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", Dimensions, HIDWORD(Dimensions), 0, ((v8 >> 1) - Dimensions), 1278226736, 1, 1);
  CVBufferSetAttachment(v9, (CFStringRef)*MEMORY[0x263F03FC0], (CFTypeRef)[v5 objectForKey:*MEMORY[0x263F03FC0]], kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(v9, (CFStringRef)*MEMORY[0x263F04020], (CFTypeRef)[v5 objectForKey:*MEMORY[0x263F04020]], kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(v9, (CFStringRef)*MEMORY[0x263F03ED8], (CFTypeRef)[v5 objectForKey:*MEMORY[0x263F03ED8]], kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(v9, (CFStringRef)*MEMORY[0x263F03E48], (CFTypeRef)[v5 objectForKey:*MEMORY[0x263F03E48]], kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(v9, (CFStringRef)*MEMORY[0x263F03E58], (CFTypeRef)[v5 objectForKey:*MEMORY[0x263F03E58]], kCVAttachmentMode_ShouldPropagate);
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], v9, &formatDescriptionOut);
  CVPixelBufferRelease(v9);
  uint64_t v10 = formatDescriptionOut;

  return v10;
}

+ (opaqueCMFormatDescription)createL010FormatDescriptionFromRawBayerFormatDescription:(opaqueCMFormatDescription *)a3
{
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
  uint64_t v5 = CMFormatDescriptionGetExtensions(a3);
  BOOL v6 = [v5 objectForKey:@"CVBytesPerRow"];
  unint64_t v7 = +[MOVStreamIOUtility getPreferredBytesPerRowAlignmentSize];
  int v8 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", Dimensions, HIDWORD(*(unint64_t *)&Dimensions), 0, (unint64_t)(int)((int)[v6 intValue] % v7) >> 1, 1278226736, v7, +[MOVStreamIOUtility getPreferredPlaneAlignmentSize](MOVStreamIOUtility, "getPreferredPlaneAlignmentSize"));
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], v8, &formatDescriptionOut);
  CVPixelBufferRelease(v8);
  OSStatus v9 = formatDescriptionOut;

  return v9;
}

+ (opaqueCMFormatDescription)createxf20FormatDescriptionFromRawBayerFormatDescription:(opaqueCMFormatDescription *)a3 usingFirstPlaneOnly:(BOOL)a4
{
  BOOL v4 = a4;
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
  if (Dimensions.height >= 0) {
    int32_t height = Dimensions.height;
  }
  else {
    int32_t height = Dimensions.height + 1;
  }
  unsigned int v8 = height >> 1;
  if (v4) {
    uint64_t v9 = Dimensions.height;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t v10 = CMFormatDescriptionGetExtensions(a3);
  BOOL v11 = [v10 objectForKey:@"CVBytesPerRow"];
  unint64_t v12 = +[MOVStreamIOUtility getPreferredBytesPerRowAlignmentSize];
  CMTimeEpoch v13 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", Dimensions, v9, 0, (unint64_t)(int)((int)[v11 intValue] % v12) >> 1, 2019963440, v12, +[MOVStreamIOUtility getPreferredPlaneAlignmentSize](MOVStreamIOUtility, "getPreferredPlaneAlignmentSize"));
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], v13, &formatDescriptionOut);
  CVPixelBufferRelease(v13);
  long long v14 = formatDescriptionOut;

  return v14;
}

+ (double)bytesPerPixelForFormat:(unsigned int)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  CVPixelBufferRef pixelBufferOut = 0;
  uint64_t v10 = *MEMORY[0x263F04130];
  v11[0] = MEMORY[0x263EFFA78];
  CFDictionaryRef v4 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x400uLL, 0x300uLL, a3, v4, &pixelBufferOut);
  if (CVPixelBufferIsPlanar(pixelBufferOut))
  {
    uint64_t v5 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unsigned int v8 = 0;
      _os_log_impl(&dword_21B5ED000, v5, OS_LOG_TYPE_ERROR, "bytesPerPixelForFormat requires non-planar buffer.", v8, 2u);
    }

    double BytesPerPixel = 0.0;
    CVPixelBufferRelease(pixelBufferOut);
  }
  else
  {
    double BytesPerPixel = MIOCVPixelBufferGetBytesPerPixel(pixelBufferOut);
    CVPixelBufferRelease(pixelBufferOut);
  }

  return BytesPerPixel;
}

+ (opaqueCMFormatDescription)createL008FormatDescriptionFromNonPlanarFormatDescription:(opaqueCMFormatDescription *)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
  uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
  double BytesPerPixelOfPlaneFromLookupForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneFromLookupForFormat(MediaSubType, 0);
  CVPixelBufferRef pixelBufferOut = 0;
  uint64_t v15 = *MEMORY[0x263F04130];
  v16[0] = MEMORY[0x263EFFA78];
  CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  size_t v8 = *(uint64_t *)&Dimensions >> 32;
  size_t v9 = Dimensions.width * (unint64_t)BytesPerPixelOfPlaneFromLookupForFormat;
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v9, v8, 0x4C303038u, v7, &pixelBufferOut);
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  CMVideoFormatDescriptionCreateForImageBuffer(v10, pixelBufferOut, &formatDescriptionOut);
  CVPixelBufferRelease(pixelBufferOut);
  BOOL v11 = formatDescriptionOut;

  return v11;
}

+ (opaqueCMFormatDescription)createL008FormatDescriptionFromCompandedRawBayerFormatDescription:(opaqueCMFormatDescription *)a3
{
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
  uint64_t v5 = CMFormatDescriptionGetExtensions(a3);
  BOOL v6 = [v5 objectForKey:@"CVBytesPerRow"];
  unint64_t v7 = +[MOVStreamIOUtility getPreferredBytesPerRowAlignmentSize];
  size_t v8 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", Dimensions, HIDWORD(*(unint64_t *)&Dimensions), 0, ((int)[v6 intValue] % v7), 1278226488, v7, +[MOVStreamIOUtility getPreferredPlaneAlignmentSize](MOVStreamIOUtility, "getPreferredPlaneAlignmentSize"));
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], v8, &formatDescriptionOut);
  CVPixelBufferRelease(v8);
  size_t v9 = formatDescriptionOut;

  return v9;
}

+ (id)getJsonFriendlyCopy:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v3;
      if ([MEMORY[0x263F08900] isValidJSONObject:v12]) {
        id v4 = v12;
      }
      else {
        id v4 = 0;
      }

      goto LABEL_23;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 doubleValue];
      id v4 = 0;
      if (fabs(v13) == INFINITY) {
        goto LABEL_23;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v4 = 0;
          goto LABEL_23;
        }
      }
    }
    id v4 = v3;
    goto LABEL_23;
  }
  id v15 = v3;
  id v4 = (id)objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v15;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        CFAllocatorRef v10 = [v5 objectForKeyedSubscript:v9];
        BOOL v11 = +[MOVStreamIOUtility getJsonFriendlyCopy:v10];

        if (v11) {
          [v4 setValue:v11 forKey:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

LABEL_23:

  return v4;
}

+ (BOOL)isValidJSONObject:(id)a3 path:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v23 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = v5;
    if ((objc_msgSend(MEMORY[0x263F08900], "isValidJSONObject:") & 1) == 0)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v6 = v22;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v25 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            BOOL v11 = [NSString stringWithFormat:@"%@.%@", v23, v10];
            id v12 = [v6 objectForKeyedSubscript:v10];
            BOOL v13 = +[MOVStreamIOUtility isValidJSONObject:v12 path:v11];

            if (!v13)
            {

              goto LABEL_26;
            }
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
    }
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v5;
    if (([MEMORY[0x263F08900] isValidJSONObject:v14] & 1) == 0)
    {
      unsigned int v16 = 0;
      while ([v14 count] > (unint64_t)v16)
      {
        long long v17 = [NSString stringWithFormat:@"%@[%d]", v23, v16];
        long long v18 = [v14 objectAtIndexedSubscript:v16];
        BOOL v19 = +[MOVStreamIOUtility isValidJSONObject:v18 path:v17];

        ++v16;
        if (!v19)
        {

          goto LABEL_26;
        }
      }
    }

    goto LABEL_17;
  }
  if ([MEMORY[0x263F08900] isValidJSONObject:v5])
  {
LABEL_17:
    BOOL v15 = 1;
    goto LABEL_27;
  }
  CVSMPTETime v20 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = v23;
    _os_log_impl(&dword_21B5ED000, v20, OS_LOG_TYPE_ERROR, "Can't serialize object as JSON: %{public}@", buf, 0xCu);
  }

LABEL_26:
  BOOL v15 = 0;
LABEL_27:

  return v15;
}

+ (id)getPlistFriendlyCopyOf:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v3;
    id v4 = (id)objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = v19;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v10 = [v5 objectForKeyedSubscript:v9];
          BOOL v11 = +[MOVStreamIOUtility getPlistFriendlyCopyOf:v10];

          if (v11) {
            [v4 setValue:v11 forKey:v9];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v6);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v3;
      id v4 = (id)objc_opt_new();
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v21;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v13);
            }
            long long v17 = +[MOVStreamIOUtility getPlistFriendlyCopyOf:*(void *)(*((void *)&v20 + 1) + 8 * j)];
            if (v17) {
              [v4 addObject:v17];
            }
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
        }
        while (v14);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v4 = v3;
      }
      else
      {
        id v4 = 0;
      }
    }
  }

  return v4;
}

+ (BOOL)verifyExactBytesPerRow:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  v35[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v35[0] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = v9;
LABEL_5:
    BOOL v11 = v10;
    *(void *)CVPixelBufferRef pixelBufferOut = 0;
    uint64_t v32 = *MEMORY[0x263F04130];
    uint64_t v33 = MEMORY[0x263EFFA78];
    CFDictionaryRef v12 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDictionaryRef v31 = v12;
    CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a4, a5, v6, v12, (CVPixelBufferRef *)pixelBufferOut);
    size_t PlaneCount = CVPixelBufferGetPlaneCount(*(CVPixelBufferRef *)pixelBufferOut);
    if (PlaneCount)
    {
      if ([v11 count] < PlaneCount)
      {
        uint64_t v15 = [MEMORY[0x263EFF980] arrayWithCapacity:PlaneCount];
        for (unint64_t i = 0; i != PlaneCount; ++i)
        {
          long long v17 = [v11 objectAtIndexedSubscript:i % [v11 count]];
          [v15 addObject:v17];
        }
        uint64_t v18 = [v15 copy];

        BOOL v11 = v18;
        CFDictionaryRef v12 = v31;
      }
      id v19 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:a4 height:a5 pixelFormat:v6 bytesPerRows:v11];
      CVPixelBufferRelease(*(CVPixelBufferRef *)pixelBufferOut);
      CVPixelBufferCreate(v13, a4, a5, v6, v19, (CVPixelBufferRef *)pixelBufferOut);
      CFRelease(v19);
      if (*(void *)pixelBufferOut)
      {
        size_t v20 = 0;
        BOOL v21 = 0;
        if (PlaneCount <= 1) {
          uint64_t v22 = 1;
        }
        else {
          uint64_t v22 = PlaneCount;
        }
        do
        {
          size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)pixelBufferOut, v20);
          long long v24 = [v11 objectAtIndexedSubscript:v20];
          BOOL v25 = BytesPerRowOfPlane == [v24 unsignedLongValue];

          if (!v25) {
            break;
          }
          BOOL v21 = PlaneCount <= ++v20;
        }
        while (v22 != v20);
        CFDictionaryRef v12 = v31;
        CVPixelBufferRelease(*(CVPixelBufferRef *)pixelBufferOut);
        goto LABEL_20;
      }
    }
    else
    {
      CVPixelBufferRelease(*(CVPixelBufferRef *)pixelBufferOut);
      long long v26 = [v11 objectAtIndexedSubscript:0];
      uint64_t v27 = [v26 unsignedLongValue];

      long long v28 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:a4 height:a5 pixelFormat:v6 bytesPerRow:v27];
      *(void *)CVPixelBufferRef pixelBufferOut = v28;
      if (v28)
      {
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v28);
        CVPixelBufferRelease(*(CVPixelBufferRef *)pixelBufferOut);
        BOOL v21 = BytesPerRow == v27;
LABEL_20:

        goto LABEL_24;
      }
    }
    BOOL v21 = 0;
    goto LABEL_20;
  }
  BOOL v11 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)CVPixelBufferRef pixelBufferOut = 138543362;
    *(void *)&pixelBufferOut[4] = v9;
    _os_log_impl(&dword_21B5ED000, v11, OS_LOG_TYPE_ERROR, "Invalid ExactBytesPerRow value type: %{public}@", pixelBufferOut, 0xCu);
  }
  BOOL v21 = 0;
LABEL_24:

  return v21;
}

+ (id)plistSerializedObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(id)objc_opt_class() plistFriendlyCopyOf:v5];
  if (v6)
  {
    a4 = [MEMORY[0x263F08AC0] dataWithPropertyList:v6 format:200 options:0 error:a4];
  }
  else if (a4)
  {
    uint64_t v7 = [NSString stringWithFormat:@"Unsupported data type, cannot serialize object %@.", v5];
    *a4 = [MEMORY[0x263F087E8] internalErrorWithMessage:v7 code:8];

    a4 = 0;
  }

  return a4;
}

+ (id)plistDeserializedObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([MEMORY[0x263F08AC0] propertyList:v5 isValidForFormat:200])
  {
    uint64_t v8 = 0;
    uint64_t v6 = [MEMORY[0x263F08AC0] propertyListWithData:v5 options:0 format:&v8 error:a4];
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] internalErrorWithMessage:@"Unsupported raw data format, cannot deserialize object.", 8 code];
    uint64_t v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (unsigned)guessPixelFormatForTrack:(id)a3
{
  id v3 = a3;
  unint64_t v4 = 0;
  while (1)
  {
    id v5 = [v3 formatDescriptions];
    unint64_t v6 = [v5 count];

    if (v6 <= v4) {
      break;
    }
    uint64_t v7 = [v3 formatDescriptions];
    uint64_t v8 = [v7 objectAtIndexedSubscript:v4];
    unsigned int v9 = +[MOVStreamIOUtility guessPixelFormatFromFormatDescription:v8];

    ++v4;
    if (v9) {
      goto LABEL_6;
    }
  }
  unsigned int v9 = 0;
LABEL_6:

  return v9;
}

+ (unsigned)guessPixelFormatFromFormatDescription:(opaqueCMFormatDescription *)a3
{
  if (!a3) {
    return 0;
  }
  unint64_t v4 = CMFormatDescriptionGetExtensions(a3);
  if ([v4 count])
  {
    int64_t v5 = +[MOVStreamIOUtility chromaSamplingFromMediaFormatDescription:a3];
    unint64_t v6 = [v4 objectForKey:@"BitsPerComponent"];
    uint64_t v7 = [v6 integerValue];

    uint64_t v8 = [v4 objectForKey:@"FullRangeVideo"];
    uint64_t v9 = [v8 integerValue];
    unsigned int v10 = 875704438;

    switch(v5)
    {
      case 0:
      case 4:
        int v11 = 875704422;
        BOOL v12 = v9 == 1;
        if (v9 != 1) {
          int v11 = 875704438;
        }
        int v13 = 2016686640;
        int v14 = 2019963440;
        goto LABEL_19;
      case 1:
        int v11 = 875704934;
        BOOL v12 = v9 == 1;
        if (v9 != 1) {
          int v11 = 875704950;
        }
        int v13 = 2016686642;
        int v14 = 2019963442;
        goto LABEL_19;
      case 2:
        if (v9 == 1) {
          int v11 = 875836518;
        }
        else {
          int v11 = 875836534;
        }
        int v13 = 2016687156;
        int v14 = 2019963956;
        BOOL v12 = v9 == 1;
LABEL_19:
        if (v12) {
          int v13 = v14;
        }
        if (v7 == 10) {
          unsigned int v10 = v13;
        }
        else {
          unsigned int v10 = v11;
        }
        break;
      case 3:
        if (v7 == 10) {
          unsigned int v10 = 1278226736;
        }
        else {
          unsigned int v10 = 1278226488;
        }
        break;
      default:
        break;
    }
  }
  else
  {
    unsigned int v10 = 0;
  }

  return v10;
}

+ (unsigned)detectPixelFormatForAsset:(id)a3 videoTrackId:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  v37[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = [v7 trackWithTrackID:v6];
  uint64_t v9 = v8;
  if (v8)
  {
    unsigned int v10 = [v8 formatDescriptions];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      BOOL v12 = [v9 formatDescriptions];
      int v13 = [v12 objectAtIndexedSubscript:0];

      CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)v13);
      v36[0] = *MEMORY[0x263F04240];
      uint64_t v15 = [NSNumber numberWithInt:Dimensions];
      v37[0] = v15;
      v36[1] = *MEMORY[0x263F04118];
      unsigned int v16 = [NSNumber numberWithInt:HIDWORD(*(unint64_t *)&Dimensions)];
      v37[1] = v16;
      uint64_t v33 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

      long long v17 = [MEMORY[0x263EFA4D8] assetReaderTrackOutputWithTrack:v9 outputSettings:v33];
      uint64_t v18 = [MEMORY[0x263EFA4C0] assetReaderWithAsset:v7 error:a5];
      id v19 = v18;
      if (!v18)
      {
        LODWORD(PixelFormatType) = 0;
LABEL_22:

        goto LABEL_23;
      }
      if ([v18 canAddOutput:v17])
      {
        [v19 addOutput:v17];
        if ([v19 startReading])
        {
          size_t v20 = (opaqueCMSampleBuffer *)[v17 copyNextSampleBuffer];
          BOOL v21 = v20;
          if (v20)
          {
            ImageBuffer = CMSampleBufferGetImageBuffer(v20);
            long long v23 = ImageBuffer;
            if (ImageBuffer)
            {
              CVPixelBufferRetain(ImageBuffer);
              CFRelease(v21);
              uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(v23);
              CVPixelBufferRelease(v23);

              {
                v34[0] = &unk_26CB7D188;
                v34[1] = &unk_26CB7D1B8;
                v35[0] = &unk_26CB7D1A0;
                v35[1] = &unk_26CB7D1D0;
                v34[2] = &unk_26CB7D1E8;
                v34[3] = &unk_26CB7D200;
                void v35[2] = &unk_26CB7D1A0;
                v35[3] = &unk_26CB7D218;
                void v34[4] = &unk_26CB7D230;
                v34[5] = &unk_26CB7D260;
                void v35[4] = &unk_26CB7D248;
                v35[5] = &unk_26CB7D218;
                v34[6] = &unk_26CB7D278;
                v34[7] = &unk_26CB7D2A8;
                v35[6] = &unk_26CB7D290;
                v35[7] = &unk_26CB7D2C0;
                +[MOVStreamIOUtility(Private) detectPixelFormatForAsset:videoTrackId:error:]::formatMappingTable = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:8];
              }
              BOOL v25 = (void *)+[MOVStreamIOUtility(Private) detectPixelFormatForAsset:videoTrackId:error:]::formatMappingTable;
              long long v26 = [NSNumber numberWithUnsignedInt:PixelFormatType];
              id v19 = [v25 objectForKey:v26];

              if (v19) {
                LODWORD(PixelFormatType) = [v19 intValue];
              }
              long long v17 = 0;
              goto LABEL_21;
            }
            CFRelease(v21);
            CFDictionaryRef v31 = [NSString stringWithFormat:@"No pixel buffer in track (%d) in '%@'.", v6, v7];
            [MEMORY[0x263F087E8] populateReaderError:a5 message:v31 code:26];
          }
          else
          {
            uint64_t v30 = [NSString stringWithFormat:@"No sample buffer in track (%d) in '%@'.", v6, v7];
            [MEMORY[0x263F087E8] populateReaderError:a5 message:v30 code:26];
          }
        }
        else
        {
          id v29 = [NSString stringWithFormat:@"Cannot read from track (%d) in '%@'.", v6, v7];
          [MEMORY[0x263F087E8] populateReaderError:a5 message:v29 code:26];
        }
      }
      else
      {
        long long v28 = [NSString stringWithFormat:@"Cannot add output to track (%d) in '%@'.", v6, v7];
        [MEMORY[0x263F087E8] populateReaderError:a5 message:v28 code:26];
      }
      LODWORD(PixelFormatType) = 0;
LABEL_21:

      goto LABEL_22;
    }
    uint64_t v27 = [NSString stringWithFormat:@"No format description for track (%d) in '%@'.", v6, v7];
    [MEMORY[0x263F087E8] populateReaderError:a5 message:v27 code:26];
  }
  else
  {
    uint64_t v27 = [NSString stringWithFormat:@"Cannot find track (%d) in '%@'.", v6, v7];
    [MEMORY[0x263F087E8] populateReaderError:a5 message:v27 code:26];
  }

  LODWORD(PixelFormatType) = 0;
LABEL_23:

  return PixelFormatType;
}

+ (id)AVEProfileLevel10BitMonochrome
{
  uint64_t v2 = +[MOVStreamEncoderConfig supportedProfileLevelsForHEVC];
  if ([v2 containsObject:@"HEVC_Monochrome12_AutoLevel"]
    && ([v2 containsObject:@"HEVC_Monochrome10_AutoLevel"] & 1) == 0)
  {
    id v3 = @"HEVC_Monochrome12_AutoLevel";
  }
  else
  {
    id v3 = @"HEVC_Monochrome10_AutoLevel";
  }

  return v3;
}

+ (double)clampedQuality:(double)result
{
  if (result > 1.0) {
    BOOL result = 1.0;
  }
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

+ (id)reservedMIOTrackMetadataKeys
{
  if (+[MOVStreamIOUtility(Private) reservedMIOTrackMetadataKeys]::onceToken != -1) {
    dispatch_once(&+[MOVStreamIOUtility(Private) reservedMIOTrackMetadataKeys]::onceToken, &__block_literal_global_6);
  }
  uint64_t v2 = (void *)+[MOVStreamIOUtility(Private) reservedMIOTrackMetadataKeys]::reservedList;

  return v2;
}

void __59__MOVStreamIOUtility_Private__reservedMIOTrackMetadataKeys__block_invoke()
{
  v5[31] = *MEMORY[0x263EF8340];
  v5[0] = @"mdta/com.apple.track_kind";
  v5[1] = @"mdta/com.apple.trackStreamType";
  void v5[2] = @"mdta/com.apple.metadataTrackType";
  void v5[3] = @"mdta/com.apple.framework.state.MOVStreamIO";
  v5[4] = @"mdta/com.apple.MOVStreamIO.stateMetadataIdentifier";
  v5[5] = @"version";
  v5[6] = @"mdta/com.apple.MOVStreamIO.versionKey";
  v5[7] = @"default_options";
  v5[8] = @"mdta/com.apple.MOVStreamIO.defaultOptions";
  v5[9] = @"mdta/com.apple.stream_sample_format";
  v5[10] = @"mdta/com.apple.trackStreamPixelFormat";
  v5[11] = @"mdta/com.apple.stream_encoded_sample_format";
  v5[12] = @"mdta/com.apple.trackStreamEncodedPixelFormat";
  v5[13] = @"mdta/com.apple.stream_sample_attachments_serialization_mode";
  v5[14] = @"mdta/com.apple.trackStreamAttachmentsSerializationMode";
  v5[15] = @"mdta/com.apple.stream_type_info";
  v5[16] = @"mdta/com.apple.trackTypeInfo";
  v5[17] = @"mdta/com.apple.stream_related_to_stream";
  v5[18] = @"mdta/com.apple.trackStreamRelatedToStream";
  v5[19] = @"mdta/com.apple.stream_relation_specifier";
  v5[20] = @"mdta/com.apple.trackStreamRelationSpecifier";
  v5[21] = @"mdta/com.apple.stream_sample_exact_bytes_per_row";
  v5[22] = @"mdta/com.apple.exactBytesPerRow";
  v5[23] = @"mdta/com.apple.stream_raw_bayer_rearrange_type";
  v5[24] = @"mdta/com.apple.RawBayerRearrangeType";
  v5[25] = @"mdta/com.apple.stream_sample_attachments";
  v5[26] = @"mdta/com.apple.rawSampleBufferAttachmentDict";
  v5[27] = @"mdta/com.apple.metadata_stream_item";
  v5[28] = @"mdta/com.apple.metadataDict";
  v0 = (void *)*MEMORY[0x263EF9E90];
  objc_msgSend((id)*MEMORY[0x263EF9E90], "stringByAppendingPathComponent:", *MEMORY[0x263EF9F90], @"mdta/com.apple.track_kind", @"mdta/com.apple.trackStreamType", @"mdta/com.apple.metadataTrackType", @"mdta/com.apple.framework.state.MOVStreamIO", @"mdta/com.apple.MOVStreamIO.stateMetadataIdentifier", @"version", @"mdta/com.apple.MOVStreamIO.versionKey", @"default_options", @"mdta/com.apple.MOVStreamIO.defaultOptions", @"mdta/com.apple.stream_sample_format", @"mdta/com.apple.trackStreamPixelFormat", @"mdta/com.apple.stream_encoded_sample_format", @"mdta/com.apple.trackStreamEncodedPixelFormat", @"mdta/com.apple.stream_sample_attachments_serialization_mode", @"mdta/com.apple.trackStreamAttachmentsSerializationMode", @"mdta/com.apple.stream_type_info",
    @"mdta/com.apple.trackTypeInfo",
    @"mdta/com.apple.stream_related_to_stream",
    @"mdta/com.apple.trackStreamRelatedToStream",
    @"mdta/com.apple.stream_relation_specifier",
    @"mdta/com.apple.trackStreamRelationSpecifier",
    @"mdta/com.apple.stream_sample_exact_bytes_per_row",
    @"mdta/com.apple.exactBytesPerRow",
    @"mdta/com.apple.stream_raw_bayer_rearrange_type",
    @"mdta/com.apple.RawBayerRearrangeType",
    @"mdta/com.apple.stream_sample_attachments",
    @"mdta/com.apple.rawSampleBufferAttachmentDict",
    @"mdta/com.apple.metadata_stream_item",
  v1 = @"mdta/com.apple.metadataDict");
  v5[29] = v1;
  uint64_t v2 = [v0 stringByAppendingPathComponent:*MEMORY[0x263EF9F98]];
  v5[30] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:31];
  unint64_t v4 = (void *)+[MOVStreamIOUtility(Private) reservedMIOTrackMetadataKeys]::reservedList;
  +[MOVStreamIOUtility(Private) reservedMIOTrackMetadataKeys]::reservedList = v3;
}

+ (id)nonMIOTrackMetadataItemsInMetadataItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v13 = a3;
  uint64_t v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v13;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = [v8 identifier];
        unsigned int v10 = +[MOVStreamIOUtility reservedMIOTrackMetadataKeys];
        char v11 = [v10 containsObject:v9];

        if ((v11 & 1) == 0) {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return v3;
}

+ (CVSMPTETime)timecodeForFrameNumber32:(SEL)a3 formatDescription:(int)a4
{
  *(void *)&retstr->subframes = 0;
  *(void *)&retstr->type = 0;
  *(void *)&retstr->hours = 0;
  BOOL result = (CVSMPTETime *)CMFormatDescriptionGetMediaSubType(a5);
  if (result != 1953325924) {
    return result;
  }
  int v9 = bswap32(a4);
  __int16 FrameQuanta = CMTimeCodeFormatDescriptionGetFrameQuanta(a5);
  if (v9 >= 0) {
    int v11 = v9;
  }
  else {
    int v11 = -v9;
  }
  char TimeCodeFlags = CMTimeCodeFormatDescriptionGetTimeCodeFlags(a5);
  int v13 = FrameQuanta;
  if (TimeCodeFlags)
  {
    int v14 = 600 * FrameQuanta - 18;
    int v15 = 18 * (v11 / v14);
    int v16 = v11 % v14;
    BOOL v17 = __OFSUB__(v16, 60 * FrameQuanta);
    int v18 = v16 - 60 * FrameQuanta;
    if (v18 < 0 == v17) {
      v15 += 2 * (v18 / (60 * FrameQuanta - 2)) + 2;
    }
    v11 += v15;
  }
  retstr->frames = v11 % FrameQuanta;
  retstr->seconds = v11 / FrameQuanta % 60;
  int v19 = v11 / FrameQuanta / 60 % 60;
  retstr->minutes = v19;
  int v20 = v11 / v13 / 3600;
  if ((CMTimeCodeFormatDescriptionGetTimeCodeFlags(a5) & 2) != 0)
  {
    int v21 = v20 % 24;
    if (v9 < 0)
    {
      char v22 = CMTimeCodeFormatDescriptionGetTimeCodeFlags(a5);
      SInt16 v23 = 23 - v21;
      if ((v22 & 4) != 0) {
        SInt16 v23 = v21;
      }
      retstr->hours = v23;
      if ((v22 & 4) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    retstr->hours = v21;
  }
  else
  {
    retstr->hours = v20;
    if (v9 < 0) {
LABEL_17:
    }
      retstr->minutes = v19 | 0x80;
  }
LABEL_18:
  retstr->flags = 1;
  BOOL result = (CVSMPTETime *)CMTimeCodeFormatDescriptionGetFrameQuanta(a5);
  if ((int)result > 29)
  {
    if (result == 30)
    {
      UInt32 v24 = 3;
    }
    else
    {
      if (result != 60) {
        return result;
      }
      UInt32 v24 = 6;
    }
  }
  else if (result == 24)
  {
    UInt32 v24 = 0;
  }
  else
  {
    if (result != 25) {
      return result;
    }
    UInt32 v24 = 1;
  }
  retstr->type = v24;
  return result;
}

+ (int64_t)frameNumber64ForTimecode:(CVSMPTETime *)a3 usingFormatDescription:(opaqueCMFormatDescription *)a4
{
  if (CMFormatDescriptionGetMediaSubType(a4) == 1952658996)
  {
    signed int FrameQuanta = CMTimeCodeFormatDescriptionGetFrameQuanta(a4);
    int v7 = 60 * FrameQuanta;
    uint64_t v8 = a3->frames
       + a3->seconds * (uint64_t)FrameQuanta
       + (int)(60 * FrameQuanta * (a3->minutes & 0xFFFFFF7F))
       + 3600 * FrameQuanta * a3->hours;
    if (CMTimeCodeFormatDescriptionGetTimeCodeFlags(a4))
    {
      uint64_t v9 = 600 * FrameQuanta;
      uint64_t v10 = -18 * (v8 / v9);
      uint64_t v11 = v8 % v9;
      int v12 = (int)v11 / v7;
      if (v11 >= 2 && v12 >= 1)
      {
        uint64_t v16 = v10 - 2 * v12 + 2;
        unsigned int v17 = (int)v11 % v7;
        if (v17 < 2) {
          uint64_t v10 = v16 + (int)~v17;
        }
        else {
          uint64_t v10 = v16 - 2;
        }
      }
      v8 += v10;
    }
    if ((a3->minutes & 0x80) != 0) {
      unint64_t v14 = -v8;
    }
    else {
      unint64_t v14 = v8;
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  return bswap64(v14);
}

+ (int)frameNumber32ForTimecode:(CVSMPTETime *)a3 usingFormatDescription:(opaqueCMFormatDescription *)a4
{
  if (CMFormatDescriptionGetMediaSubType(a4) == 1953325924)
  {
    uint32_t FrameQuanta = CMTimeCodeFormatDescriptionGetFrameQuanta(a4);
    signed int v7 = a3->frames + (a3->seconds + 60 * (a3->minutes & 0xFFFFFF7F) + 3600 * a3->hours) * FrameQuanta;
    if (CMTimeCodeFormatDescriptionGetTimeCodeFlags(a4))
    {
      int v8 = -18 * (v7 / (int)(600 * FrameQuanta));
      int v9 = v7 % (int)(600 * FrameQuanta);
      int v10 = v9 / (int)(60 * FrameQuanta);
      if (v9 >= 2 && v10 >= 1)
      {
        int v14 = v8 - 2 * v10 + 2;
        unsigned int v15 = v9 % (int)(60 * FrameQuanta);
        if (v15 < 2) {
          int v8 = v14 + ~v15;
        }
        else {
          int v8 = v14 - 2;
        }
      }
      v7 += v8;
    }
    if ((a3->minutes & 0x80) != 0) {
      unsigned int v12 = -v7;
    }
    else {
      unsigned int v12 = v7;
    }
  }
  else
  {
    unsigned int v12 = 0;
  }
  return bswap32(v12);
}

+ (CVSMPTETime)advanceTimeCode:(SEL)a3 frameQuanta:(CVSMPTETime *)a4 dropFrame:(int64_t)a5
{
  *(_DWORD *)&retstr->subframes = *(_DWORD *)&a4->subframes;
  *(void *)&retstr->counter = *(void *)&a4->counter;
  retstr->flags = a4->flags;
  SInt16 hours = a4->hours;
  retstr->SInt16 hours = hours;
  SInt16 minutes = a4->minutes;
  retstr->SInt16 minutes = minutes;
  int seconds = (unsigned __int16)a4->seconds;
  retstr->int seconds = seconds;
  SInt16 v9 = a4->frames + 1;
  retstr->frames = v9;
  if (!(v9 % a5))
  {
    int v10 = seconds + 1;
    *(_DWORD *)&retstr->int seconds = (unsigned __int16)v10;
    if (v10 == 60)
    {
      __int16 v11 = minutes + 1;
      *(_DWORD *)&retstr->SInt16 minutes = (unsigned __int16)v11;
      if (a6 && v11 % 10) {
        retstr->frames = 2;
      }
      if (v11 == 60) {
        *(_DWORD *)&retstr->SInt16 hours = (unsigned __int16)(hours + 1);
      }
    }
  }
  return result;
}

+ (opaqueCMFormatDescription)createTimeCodeFormatDescriptionWithFrameRate:(double)a3 error:(id *)a4
{
  CMTimeCodeFormatDescriptionRef formatDescriptionOut = 0;
  uint32_t v6 = vcvtpd_u64_f64(a3);
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CMTimeMake(&frameDuration, 100, (int)(a3 * 100.0));
  uint64_t v8 = CMTimeCodeFormatDescriptionCreate(v7, 0x74633634u, &frameDuration, v6, 3u, 0, &formatDescriptionOut);
  if (!v8) {
    return formatDescriptionOut;
  }
  if (a4)
  {
    SInt16 v9 = objc_msgSend(NSString, "stringWithFormat:", @"Cannot create TimeCode32 FormatDescription with fps %f. Error: %d", *(void *)&a3, v8);
    *a4 = [MEMORY[0x263F087E8] internalErrorWithMessage:v9 code:8];
  }
  return 0;
}

+ (opaqueCMFormatDescription)createTimeCode32FormatDescriptionWithFrameRate:(double)a3 tcDropFrame:(BOOL)a4 error:(id *)a5
{
  CMTimeCodeFormatDescriptionRef formatDescriptionOut = 0;
  if (a4) {
    uint32_t v7 = 3;
  }
  else {
    uint32_t v7 = 2;
  }
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CMTimeMake(&frameDuration, 100, (int)(a3 * 100.0));
  uint64_t v9 = CMTimeCodeFormatDescriptionCreate(v8, 0x746D6364u, &frameDuration, vcvtpd_u64_f64(a3), v7, 0, &formatDescriptionOut);
  if (!v9) {
    return formatDescriptionOut;
  }
  if (a5)
  {
    int v10 = objc_msgSend(NSString, "stringWithFormat:", @"Cannot create TimeCode32 FormatDescription with fps %f. Error: %d", *(void *)&a3, v9);
    *a5 = [MEMORY[0x263F087E8] internalErrorWithMessage:v10 code:8];
  }
  return 0;
}

+ (BOOL)isMOVStreamIOMovMetadataIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = +[MIOVersion allVersionedKeysForKey:@"mdta/com.apple.framework.state.MOVStreamIO", 0, 0 modifier];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([v3 isEqualToString:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {

          goto LABEL_12;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  if ([v3 isEqualToString:@"mdta/com.apple.framework.mio.session.starttime"]) {
LABEL_12:
  }
    char v8 = 1;
  else {
    char v8 = [v3 isEqualToString:@"mdta/com.apple.framework.mio.timeRangeMetadataKeyHint"];
  }

  return v8;
}

+ (BOOL)saveSessionStartTime:(id *)a3 toMovieAtURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a3;
  char v8 = [MEMORY[0x263EFA748] movMetadataItemWithSessionStartTime:&v13 error:a5];
  if (v8)
  {
    uint64_t v9 = [[MIOMovieMetadataUtility alloc] initWithURL:v7 error:a5];
    long long v10 = v9;
    BOOL v11 = v9
       && [(MIOMovieMetadataUtility *)v9 addMovieMetadataItem:v8]
       && [(MIOMovieMetadataUtility *)v10 applyChangesError:a5];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (id)getCustomAssociatedMetadataStreamIdFromTrack:(id)a3
{
  id v3 = [a3 formatDescriptions];
  id v4 = [v3 objectAtIndexedSubscript:0];

  uint64_t v5 = [(__CFDictionary *)CMFormatDescriptionGetExtensions((CMFormatDescriptionRef)v4) objectForKeyedSubscript:@"MetadataKeyTable"];
  uint64_t v6 = [v5 objectForKey:@"2"];
  if (!v6)
  {
    uint64_t v6 = [v5 objectForKey:@"1"];
  }
  id v7 = [v6 objectForKeyedSubscript:@"MetadataKeyValue"];
  char v8 = (void *)[[NSString alloc] initWithData:v7 encoding:4];

  return v8;
}

+ (void)colorRecordingConfigBitDepth:lossless:chromaSampling:error:.cold.1()
{
}

@end