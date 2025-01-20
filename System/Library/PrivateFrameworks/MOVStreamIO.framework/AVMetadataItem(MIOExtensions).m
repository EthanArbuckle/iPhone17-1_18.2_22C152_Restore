@interface AVMetadataItem(MIOExtensions)
+ (CMMetadataFormatDescriptionRef)createMIOMetadataAttachmentsFormatDescription;
+ (CMMetadataFormatDescriptionRef)createMIOMetadataStreamFormatDescription;
+ (CMMetadataFormatDescriptionRef)createMIOTimeRangeMetadataStreamFormatDescription;
+ (CMMetadataFormatDescriptionRef)metadataFormatDescriptionFromDictionary:()MIOExtensions;
+ (id)attachmentsMIOMetadataItemForDictionary:()MIOExtensions pts:error:;
+ (id)attachmentsMIOMetadataItemForPixelBuffer:()MIOExtensions pts:error:;
+ (id)attachmentsMIOTimedMetadataItemForSampleBuffer:()MIOExtensions pts:error:;
+ (id)customTrackMetadataItems:()MIOExtensions;
+ (id)dictionaryRepresentationForMetadataFormatDescription:()MIOExtensions;
+ (id)metadataItemForTimeCode:()MIOExtensions;
+ (id)metadataItemForTimeRangeMetadataEndTime:()MIOExtensions;
+ (id)metadataItemForTimeRangeMetadataStartTime:()MIOExtensions;
+ (id)metadataItemFromDictionary:()MIOExtensions;
+ (id)metadataItemsForMetadataStreamFromData:()MIOExtensions copyData:;
+ (id)mioMovieMetadataItem;
+ (id)movMetadataItemWithSessionStartTime:()MIOExtensions error:;
+ (id)movMetadataItemWithTimeRangeMetadataKeyHint:()MIOExtensions error:;
+ (id)qtTrackMetadataItemsForStreamId:()MIOExtensions;
+ (id)trackMetadataItemWithAdditionalCompressionProperties:()MIOExtensions error:;
+ (id)trackMetadataItemWithEncodedPixelFormat:()MIOExtensions;
+ (id)trackMetadataItemWithExactBytesPerRow:()MIOExtensions pixelFormat:;
+ (id)trackMetadataItemWithInputPixelFormat:()MIOExtensions;
+ (id)trackMetadataItemWithOutputPixelFormatOverride:()MIOExtensions;
+ (id)trackMetadataItemWithQTTrackCharacteristic:()MIOExtensions;
+ (id)trackMetadataItemWithQTTrackName:()MIOExtensions;
+ (id)trackMetadataItemWithRawBayerRearrangeType:()MIOExtensions;
+ (id)trackMetadataItemWithSerializationMode:()MIOExtensions;
+ (id)trackMetadataItemWithStereoViewEncoding:()MIOExtensions;
+ (id)trackMetadataItemWithStreamId:()MIOExtensions;
+ (id)trackMetadataItemWithTimeRangeMetadata:()MIOExtensions;
- (id)dictionaryRepresentation;
- (id)valueAsTimeRangeMetadataKeyHint;
- (void)valueAsMovSessionStartTime;
- (void)valueAsTimeCode;
@end

@implementation AVMetadataItem(MIOExtensions)

+ (id)dictionaryRepresentationForMetadataFormatDescription:()MIOExtensions
{
  uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(desc);
  v5 = [(__CFDictionary *)CMFormatDescriptionGetExtensions(desc) objectForKeyedSubscript:@"MetadataKeyTable"];
  v6 = [v5 allValues];
  v7 = [MEMORY[0x263EFF9A0] dictionary];
  v8 = [NSNumber numberWithUnsignedInt:MediaSubType];
  [v7 setObject:v8 forKey:@"formatType"];

  if (v6) {
    [v7 setObject:v6 forKey:@"metadataKeys"];
  }

  return v7;
}

+ (CMMetadataFormatDescriptionRef)metadataFormatDescriptionFromDictionary:()MIOExtensions
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 objectForKey:@"formatType"];
  CMMetadataFormatType v5 = [v4 intValue];

  CFArrayRef v6 = [v3 objectForKey:@"metadataKeys"];
  CMMetadataFormatDescriptionRef formatDescriptionOut = 0;
  OSStatus v7 = CMMetadataFormatDescriptionCreateWithKeys((CFAllocatorRef)*MEMORY[0x263EFFB08], v5, v6, &formatDescriptionOut);
  if (v7)
  {
    v8 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v13 = v7;
      _os_log_impl(&dword_21B5ED000, v8, OS_LOG_TYPE_ERROR, "Cannot create metadata format description (err: %d).", buf, 8u);
    }

    CMMetadataFormatDescriptionRef v9 = 0;
  }
  else
  {
    CMMetadataFormatDescriptionRef v9 = formatDescriptionOut;
  }

  return v9;
}

+ (CMMetadataFormatDescriptionRef)createMIOMetadataAttachmentsFormatDescription
{
  v19[2] = *MEMORY[0x263EF8340];
  v0 = +[MIOVersion versionZero];
  v1 = [v0 versionedKey:@"mdta/com.apple.stream_sample_attachments" modifier:0];

  uint64_t v3 = *MEMORY[0x263F00FA0];
  v17[0] = *MEMORY[0x263F00FB0];
  uint64_t v2 = v17[0];
  v17[1] = v3;
  uint64_t v4 = *MEMORY[0x263F00F50];
  v18[0] = v1;
  v18[1] = v4;
  CMMetadataFormatType v5 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  v19[0] = v5;
  v15[0] = v2;
  v15[1] = v3;
  v16[0] = @"mdta/com.apple.stream_sample_attachments";
  v16[1] = v4;
  CFArrayRef v6 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v19[1] = v6;
  CFArrayRef v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];

  CMMetadataFormatDescriptionRef formatDescriptionOut = 0;
  OSStatus v8 = CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x6D656278u, v7, &formatDescriptionOut);
  if (v8)
  {
    CMMetadataFormatDescriptionRef v9 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v14 = v8;
      _os_log_impl(&dword_21B5ED000, v9, OS_LOG_TYPE_ERROR, "Cannot create metadata attachments format description (err: %d).", buf, 8u);
    }

    CMMetadataFormatDescriptionRef v10 = 0;
  }
  else
  {
    CMMetadataFormatDescriptionRef v10 = formatDescriptionOut;
  }

  return v10;
}

+ (CMMetadataFormatDescriptionRef)createMIOTimeRangeMetadataStreamFormatDescription
{
  v20[2] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263EFF980] array];
  uint64_t v2 = *MEMORY[0x263F00FA0];
  v19[0] = *MEMORY[0x263F00FB0];
  uint64_t v1 = v19[0];
  v19[1] = v2;
  uint64_t v3 = *MEMORY[0x263F00F70];
  v20[0] = @"mdta/com.apple.stream_time_range_start";
  v20[1] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  [v0 addObject:v4];

  v17[0] = v1;
  v17[1] = v2;
  v18[0] = @"mdta/com.apple.stream_time_range_end";
  v18[1] = v3;
  CMMetadataFormatType v5 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  [v0 addObject:v5];

  v15[0] = v1;
  v15[1] = v2;
  uint64_t v6 = *MEMORY[0x263F00F50];
  v16[0] = @"mdta/com.apple.stream_time_code";
  v16[1] = v6;
  CFArrayRef v7 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  [v0 addObject:v7];

  CMMetadataFormatDescriptionRef formatDescriptionOut = 0;
  OSStatus v8 = CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x6D656278u, (CFArrayRef)v0, &formatDescriptionOut);
  if (v8)
  {
    CMMetadataFormatDescriptionRef v9 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v14 = v8;
      _os_log_impl(&dword_21B5ED000, v9, OS_LOG_TYPE_ERROR, "Cannot create time range metadata stream format description (err: %d).", buf, 8u);
    }

    CMMetadataFormatDescriptionRef v10 = 0;
  }
  else
  {
    CMMetadataFormatDescriptionRef v10 = formatDescriptionOut;
  }

  return v10;
}

+ (CMMetadataFormatDescriptionRef)createMIOMetadataStreamFormatDescription
{
  void v19[2] = *MEMORY[0x263EF8340];
  v0 = +[MIOVersion versionZero];
  uint64_t v1 = [v0 versionedKey:@"mdta/com.apple.metadata_stream_item" modifier:0];

  uint64_t v3 = *MEMORY[0x263F00FA0];
  v17[0] = *MEMORY[0x263F00FB0];
  uint64_t v2 = v17[0];
  v17[1] = v3;
  uint64_t v4 = *MEMORY[0x263F00F50];
  v18[0] = v1;
  v18[1] = v4;
  CMMetadataFormatType v5 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  v19[0] = v5;
  v15[0] = v2;
  v15[1] = v3;
  v16[0] = @"mdta/com.apple.metadata_stream_item";
  v16[1] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v19[1] = v6;
  CFArrayRef v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];

  CMMetadataFormatDescriptionRef formatDescriptionOut = 0;
  OSStatus v8 = CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x6D656278u, v7, &formatDescriptionOut);
  if (v8)
  {
    CMMetadataFormatDescriptionRef v9 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v14 = v8;
      _os_log_impl(&dword_21B5ED000, v9, OS_LOG_TYPE_ERROR, "Cannot create metadata stream format description (err: %d).", buf, 8u);
    }

    CMMetadataFormatDescriptionRef v10 = 0;
  }
  else
  {
    CMMetadataFormatDescriptionRef v10 = formatDescriptionOut;
  }

  return v10;
}

+ (id)attachmentsMIOMetadataItemForPixelBuffer:()MIOExtensions pts:error:
{
  CFDictionaryRef v8 = CVBufferCopyAttachments(buffer, kCVAttachmentMode_ShouldPropagate);
  BOOL v9 = +[MIOPixelBufferUtility isPixelBufferRawBayer:buffer];
  if ((v9 | +[MIOPixelBufferUtility isPixelBufferCompandedRawBayer:buffer]) == 1)
  {
    CMMetadataFormatDescriptionRef v10 = (void *)[(__CFDictionary *)v8 mutableCopy];
    v11 = [NSNumber numberWithUnsignedInt:CVPixelBufferGetPixelFormatType(buffer)];
    [v10 setValue:v11 forKey:@"RawBayerFormat"];

    uint64_t v12 = [v10 copy];
    CFDictionaryRef v8 = (CFDictionaryRef)v12;
  }
  OSStatus v13 = objc_opt_class();
  long long v16 = *a4;
  uint64_t v17 = *((void *)a4 + 2);
  OSStatus v14 = [v13 attachmentsMIOMetadataItemForDictionary:v8 pts:&v16 error:a5];

  return v14;
}

+ (id)attachmentsMIOTimedMetadataItemForSampleBuffer:()MIOExtensions pts:error:
{
  CFDictionaryRef v7 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x263EFFB08], target, 1u);
  if (v7)
  {
    uint64_t v8 = +[MOVStreamIOUtility getPlistFriendlyCopyOf:v7];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  BOOL v9 = (void *)v8;
  CMMetadataFormatDescriptionRef v10 = objc_opt_class();
  long long v13 = *a4;
  uint64_t v14 = *((void *)a4 + 2);
  v11 = [v10 attachmentsMIOMetadataItemForDictionary:v9 pts:&v13 error:a5];

  return v11;
}

+ (id)attachmentsMIOMetadataItemForDictionary:()MIOExtensions pts:error:
{
  CFDictionaryRef v7 = +[MOVStreamIOUtility plistFriendlyCopyOf:](MOVStreamIOUtility, "plistFriendlyCopyOf:");
  uint64_t v8 = (void *)[v7 mutableCopy];

  BOOL v9 = [v8 objectForKey:@"OriginalTimestampWhenWrittenToFile"];

  if (!v9)
  {
    CMTime v14 = *a4;
    CFDictionaryRef v10 = CMTimeCopyAsDictionary(&v14, (CFAllocatorRef)*MEMORY[0x263EFFB08]);
    [v8 setObject:v10 forKey:@"OriginalTimestampWhenWrittenToFile"];
  }
  v11 = [MEMORY[0x263F08AC0] dataWithPropertyList:v8 format:200 options:0 error:a5];
  uint64_t v12 = [MEMORY[0x263EFA790] metadataItem];
  [v12 setIdentifier:@"mdta/com.apple.stream_sample_attachments"];
  [v12 setDataType:*MEMORY[0x263F00F50]];
  [v12 setValue:v11];

  return v12;
}

+ (id)trackMetadataItemWithStreamId:()MIOExtensions
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFA790] metadataItem];
  [v4 setIdentifier:@"mdta/com.apple.track_kind"];
  [v4 setDataType:*MEMORY[0x263F00F88]];
  [v4 setValue:v3];

  return v4;
}

+ (id)qtTrackMetadataItemsForStreamId:()MIOExtensions
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() trackMetadataItemWithQTTrackCharacteristic:v3];
  uint64_t v5 = [(id)objc_opt_class() trackMetadataItemWithQTTrackName:v3];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    uint64_t v12 = v4;
    uint64_t v13 = v5;
    CFDictionaryRef v7 = &v12;
    uint64_t v8 = 2;
  }
  else
  {
    v11 = v4;
    CFDictionaryRef v7 = &v11;
    uint64_t v8 = 1;
  }
  BOOL v9 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v7, v8, v11, v12, v13, v14);

  return v9;
}

+ (id)trackMetadataItemWithQTTrackCharacteristic:()MIOExtensions
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFA790] metadataItem];
  [v4 setKey:*MEMORY[0x263EF9F90]];
  [v4 setKeySpace:*MEMORY[0x263EF9E90]];
  [v4 setValue:v3];

  return v4;
}

+ (id)trackMetadataItemWithQTTrackName:()MIOExtensions
{
  id v3 = [a3 componentsSeparatedByString:@"."];
  uint64_t v4 = [v3 lastObject];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFA790] metadataItem];
    [v5 setKey:*MEMORY[0x263EF9F98]];
    [v5 setKeySpace:*MEMORY[0x263EF9E90]];
    [v5 setValue:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)trackMetadataItemWithInputPixelFormat:()MIOExtensions
{
  uint64_t v4 = [MEMORY[0x263EFA790] metadataItem];
  [v4 setIdentifier:@"mdta/com.apple.stream_sample_format"];
  [v4 setDataType:*MEMORY[0x263F00F88]];
  [v4 setExtraAttributes:0];
  uint64_t v5 = [NSNumber numberWithUnsignedInt:a3];
  [v4 setValue:v5];

  return v4;
}

+ (id)trackMetadataItemWithOutputPixelFormatOverride:()MIOExtensions
{
  uint64_t v4 = [MEMORY[0x263EFA790] metadataItem];
  [v4 setIdentifier:@"mdta/com.apple.stream_output_pixel_format_override"];
  [v4 setDataType:*MEMORY[0x263F00F60]];
  [v4 setExtraAttributes:0];
  uint64_t v5 = [NSNumber numberWithUnsignedInt:a3];
  [v4 setValue:v5];

  return v4;
}

+ (id)trackMetadataItemWithEncodedPixelFormat:()MIOExtensions
{
  uint64_t v4 = [MEMORY[0x263EFA790] metadataItem];
  [v4 setIdentifier:@"mdta/com.apple.stream_encoded_sample_format"];
  [v4 setDataType:*MEMORY[0x263F00F88]];
  [v4 setExtraAttributes:0];
  uint64_t v5 = [NSNumber numberWithUnsignedInt:a3];
  [v4 setValue:v5];

  return v4;
}

+ (id)trackMetadataItemWithRawBayerRearrangeType:()MIOExtensions
{
  id v3 = a3;
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = &unk_26CB7D0F8;
  }
  uint64_t v5 = [MEMORY[0x263EFA790] metadataItem];
  [v5 setIdentifier:@"mdta/com.apple.stream_raw_bayer_rearrange_type"];
  [v5 setDataType:*MEMORY[0x263F00F78]];
  [v5 setExtraAttributes:0];
  [v5 setValue:v4];

  return v5;
}

+ (id)trackMetadataItemWithSerializationMode:()MIOExtensions
{
  uint64_t v4 = [MEMORY[0x263EFA790] metadataItem];
  [v4 setIdentifier:@"mdta/com.apple.stream_sample_attachments_serialization_mode"];
  [v4 setDataType:*MEMORY[0x263F00F88]];
  [v4 setExtraAttributes:0];
  uint64_t v5 = [NSNumber numberWithInt:a3];
  [v4 setValue:v5];

  return v4;
}

+ (id)trackMetadataItemWithStereoViewEncoding:()MIOExtensions
{
  uint64_t v4 = [MEMORY[0x263EFA790] metadataItem];
  [v4 setIdentifier:@"mdta/com.apple.stream_stereo_video"];
  [v4 setDataType:*MEMORY[0x263F00F88]];
  [v4 setExtraAttributes:0];
  uint64_t v5 = [NSNumber numberWithBool:a3];
  [v4 setValue:v5];

  return v4;
}

+ (id)trackMetadataItemWithAdditionalCompressionProperties:()MIOExtensions error:
{
  uint64_t v5 = +[MOVStreamIOUtility plistFriendlyCopyOf:](MOVStreamIOUtility, "plistFriendlyCopyOf:");
  uint64_t v6 = (void *)[v5 mutableCopy];

  CFDictionaryRef v7 = [MEMORY[0x263F08AC0] dataWithPropertyList:v6 format:200 options:0 error:a4];
  uint64_t v8 = [MEMORY[0x263EFA790] metadataItem];
  [v8 setIdentifier:@"mdta/com.apple.stream_additional_compression_properties"];
  [v8 setDataType:*MEMORY[0x263F00F50]];
  [v8 setExtraAttributes:0];
  [v8 setValue:v7];

  return v8;
}

+ (id)trackMetadataItemWithTimeRangeMetadata:()MIOExtensions
{
  uint64_t v4 = [MEMORY[0x263EFA790] metadataItem];
  [v4 setIdentifier:@"mdta/com.apple.stream_time_range_metadata"];
  [v4 setDataType:*MEMORY[0x263F00F88]];
  [v4 setExtraAttributes:0];
  uint64_t v5 = [NSNumber numberWithBool:a3];
  [v4 setValue:v5];

  return v4;
}

+ (id)trackMetadataItemWithExactBytesPerRow:()MIOExtensions pixelFormat:
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263EFA790] metadataItem];
  [v6 setIdentifier:@"mdta/com.apple.stream_sample_exact_bytes_per_row"];
  [v6 setExtraAttributes:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = +[MIOPixelBufferUtility numberOfPlanesForPixelFormatType:a4];
    if (v7 < 1)
    {
      [v6 setDataType:*MEMORY[0x263F00F70]];
      [v6 setValue:v5];
      goto LABEL_15;
    }
    id v8 = [MEMORY[0x263EFF980] arrayWithCapacity:v7];
    do
    {
      [v8 addObject:v5];
      --v7;
    }
    while (v7);
    BOOL v9 = +[MOVStreamIOUtility plistSerializedObject:v8 error:0];
    if (v9)
    {
      [v6 setDataType:*MEMORY[0x263F00F50]];
      [v6 setValue:v9];
      [v6 setIdentifier:@"mdta/com.apple.stream_sample_exact_bytes_per_row_multiplanar"];

LABEL_10:
LABEL_15:
      id v8 = v6;
      goto LABEL_18;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = +[MOVStreamIOUtility plistSerializedObject:v5 error:0];
      if (!v8) {
        goto LABEL_18;
      }
      [v6 setDataType:*MEMORY[0x263F00F50]];
      [v6 setValue:v8];
      [v6 setIdentifier:@"mdta/com.apple.stream_sample_exact_bytes_per_row_multiplanar"];
      goto LABEL_10;
    }
    CFDictionaryRef v10 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = (id)objc_opt_class();
      id v11 = v14;
      _os_log_impl(&dword_21B5ED000, v10, OS_LOG_TYPE_ERROR, "Invalid 'exact-bytes-per-row' value type (%@), allowed types: NSNUmber, NSArray<NSNumber*>.", (uint8_t *)&v13, 0xCu);
    }
  }
  id v8 = 0;
LABEL_18:

  return v8;
}

+ (id)customTrackMetadataItems:()MIOExtensions
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v3 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v15;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    uint64_t v7 = *MEMORY[0x263F00F88];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        CFDictionaryRef v10 = [MEMORY[0x263EFA790] metadataItem];
        id v11 = [NSString stringWithFormat:@"%@%@", @"mdta/custom.", v9];
        [v10 setIdentifier:v11];
        [v10 setDataType:v7];
        [v10 setExtraAttributes:0];
        uint64_t v12 = [v4 objectForKey:v9];
        [v10 setValue:v12];

        [v3 addObject:v10];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  int v13 = (void *)[v3 copy];

  return v13;
}

+ (id)metadataItemsForMetadataStreamFromData:()MIOExtensions copyData:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v15 = a3;
  uint64_t v5 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v15;
  uint64_t v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16, v15);
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = *MEMORY[0x263F00F50];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [MEMORY[0x263EFA790] metadataItem];
        [v11 setIdentifier:@"mdta/com.apple.metadata_stream_item"];
        [v11 setDataType:v8];
        [v11 setExtraAttributes:0];
        if (a4)
        {
          uint64_t v12 = (void *)[v10 copy];
          [v11 setValue:v12];
        }
        else
        {
          [v11 setValue:v10];
        }
        [v5 addObject:v11];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  int v13 = (void *)[v5 copy];

  return v13;
}

+ (id)mioMovieMetadataItem
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v0 = objc_opt_new();
  [v0 setObject:@"3.29.5" forKey:@"version"];
  uint64_t v1 = +[MOVStreamIOUtility plistFriendlyCopyOf:v0];
  id v7 = 0;
  uint64_t v2 = [MEMORY[0x263F08AC0] dataWithPropertyList:v1 format:100 options:0 error:&v7];
  id v3 = v7;
  if (v3)
  {
    id v4 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_21B5ED000, v4, OS_LOG_TYPE_ERROR, "Cannot serialize MIO mov metadata: %@", buf, 0xCu);
    }

    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263EFA790] metadataItem];
    [v5 setIdentifier:@"mdta/com.apple.framework.state.MOVStreamIO"];
    [v5 setDataType:*MEMORY[0x263F00F50]];
    [v5 setExtraAttributes:0];
    [v5 setValue:v2];
  }

  return v5;
}

+ (id)movMetadataItemWithSessionStartTime:()MIOExtensions error:
{
  CMTime v9 = *a3;
  CFDictionaryRef v5 = CMTimeCopyAsDictionary(&v9, (CFAllocatorRef)*MEMORY[0x263EFFB08]);
  uint64_t v6 = +[MOVStreamIOUtility plistSerializedObject:v5 error:a4];
  if (v6)
  {
    id v7 = [MEMORY[0x263EFA790] metadataItem];
    [v7 setIdentifier:@"mdta/com.apple.framework.mio.session.starttime"];
    [v7 setDataType:*MEMORY[0x263F00F50]];
    [v7 setValue:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)movMetadataItemWithTimeRangeMetadataKeyHint:()MIOExtensions error:
{
  v0 = +[MOVStreamIOUtility plistSerializedObject:error:](MOVStreamIOUtility, "plistSerializedObject:error:");
  if (v0)
  {
    uint64_t v1 = [MEMORY[0x263EFA790] metadataItem];
    [v1 setIdentifier:@"mdta/com.apple.framework.mio.timeRangeMetadataKeyHint"];
    [v1 setDataType:*MEMORY[0x263F00F50]];
    [v1 setValue:v0];
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

- (void)valueAsMovSessionStartTime
{
  id v9 = [a1 identifier];
  char v4 = [v9 isEqualToString:@"mdta/com.apple.framework.mio.session.starttime"];

  if (v4)
  {
    id v10 = [a1 dataValue];
    +[MOVStreamIOUtility plistDeserializedObject:error:](MOVStreamIOUtility, "plistDeserializedObject:error:");
    CFDictionaryRef v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CFDictionaryRef v6 = v5;
    if (v5)
    {
      *(void *)a2 = 0;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      CMTimeMakeFromDictionary((CMTime *)a2, v5);
    }
    else
    {
      uint64_t v8 = MEMORY[0x263F01098];
      *(_OWORD *)a2 = *MEMORY[0x263F01098];
      *(void *)(a2 + 16) = *(void *)(v8 + 16);
    }
  }
  else
  {
    uint64_t v7 = MEMORY[0x263F01098];
    *(_OWORD *)a2 = *MEMORY[0x263F01098];
    *(void *)(a2 + 16) = *(void *)(v7 + 16);
  }
}

- (id)valueAsTimeRangeMetadataKeyHint
{
  uint64_t v2 = [a1 identifier];
  char v3 = [v2 isEqualToString:@"mdta/com.apple.framework.mio.timeRangeMetadataKeyHint"];

  if (v3)
  {
    char v4 = [a1 dataValue];
    CFDictionaryRef v5 = +[MOVStreamIOUtility plistDeserializedObject:v4 error:0];
    CFDictionaryRef v6 = v5;
    if (v5) {
      id v7 = v5;
    }
  }
  else
  {
    CFDictionaryRef v6 = 0;
  }

  return v6;
}

+ (id)metadataItemForTimeRangeMetadataStartTime:()MIOExtensions
{
  char v4 = [MEMORY[0x263EFA790] metadataItem];
  [v4 setIdentifier:@"mdta/com.apple.stream_time_range_start"];
  [v4 setDataType:*MEMORY[0x263F00F70]];
  [v4 setExtraAttributes:0];
  CFDictionaryRef v5 = [NSNumber numberWithUnsignedLongLong:a3];
  [v4 setValue:v5];

  return v4;
}

+ (id)metadataItemForTimeRangeMetadataEndTime:()MIOExtensions
{
  char v4 = [MEMORY[0x263EFA790] metadataItem];
  [v4 setIdentifier:@"mdta/com.apple.stream_time_range_end"];
  [v4 setDataType:*MEMORY[0x263F00F70]];
  [v4 setExtraAttributes:0];
  CFDictionaryRef v5 = [NSNumber numberWithUnsignedLongLong:a3];
  [v4 setValue:v5];

  return v4;
}

+ (id)metadataItemForTimeCode:()MIOExtensions
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  char v4 = objc_opt_new();
  CFDictionaryRef v5 = [NSNumber numberWithUnsignedInt:*((unsigned int *)a3 + 1)];
  [v4 setObject:v5 forKey:@"counter"];

  CFDictionaryRef v6 = [NSNumber numberWithUnsignedInt:*((unsigned int *)a3 + 3)];
  [v4 setObject:v6 forKey:@"flags"];

  id v7 = [NSNumber numberWithShort:a3[11]];
  [v4 setObject:v7 forKey:@"frames"];

  uint64_t v8 = [NSNumber numberWithShort:a3[8]];
  [v4 setObject:v8 forKey:@"hours"];

  id v9 = [NSNumber numberWithShort:a3[9]];
  [v4 setObject:v9 forKey:@"minutes"];

  id v10 = [NSNumber numberWithShort:a3[10]];
  [v4 setObject:v10 forKey:@"seconds"];

  id v11 = [NSNumber numberWithShort:a3[1]];
  [v4 setObject:v11 forKey:@"subframes_divisor"];

  uint64_t v12 = [NSNumber numberWithShort:*a3];
  [v4 setObject:v12 forKey:@"subframes"];

  int v13 = [NSNumber numberWithUnsignedInt:*((unsigned int *)a3 + 2)];
  [v4 setObject:v13 forKey:@"type"];

  id v14 = +[MOVStreamIOUtility plistFriendlyCopyOf:v4];
  id v20 = 0;
  id v15 = [MEMORY[0x263F08AC0] dataWithPropertyList:v14 format:100 options:0 error:&v20];
  id v16 = v20;
  if (v16)
  {
    long long v17 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v16;
      _os_log_impl(&dword_21B5ED000, v17, OS_LOG_TYPE_ERROR, "Cannot serialize time code for MIO metadata: %@", buf, 0xCu);
    }

    long long v18 = 0;
  }
  else
  {
    long long v18 = [MEMORY[0x263EFA790] metadataItem];
    [v18 setIdentifier:@"mdta/com.apple.stream_time_code"];
    [v18 setDataType:*MEMORY[0x263F00F50]];
    [v18 setExtraAttributes:0];
    [v18 setValue:v15];
  }

  return v18;
}

- (void)valueAsTimeCode
{
  id v16 = [a1 identifier];
  char v4 = [v16 isEqualToString:@"mdta/com.apple.stream_time_code"];

  if (v4)
  {
    id v17 = [a1 dataValue];
    CFDictionaryRef v5 = +[MOVStreamIOUtility plistDeserializedObject:error:](MOVStreamIOUtility, "plistDeserializedObject:error:");
    CFDictionaryRef v6 = v5;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    if (v5)
    {
      id v7 = [v5 objectForKeyedSubscript:@"counter"];
      *(_DWORD *)(a2 + 4) = [v7 unsignedIntValue];

      uint64_t v8 = [v6 objectForKeyedSubscript:@"flags"];
      *(_DWORD *)(a2 + 12) = [v8 unsignedIntValue];

      id v9 = [v6 objectForKeyedSubscript:@"frames"];
      *(_WORD *)(a2 + 22) = [v9 shortValue];

      id v10 = [v6 objectForKeyedSubscript:@"hours"];
      *(_WORD *)(a2 + 16) = [v10 shortValue];

      id v11 = [v6 objectForKeyedSubscript:@"minutes"];
      *(_WORD *)(a2 + 18) = [v11 shortValue];

      uint64_t v12 = [v6 objectForKeyedSubscript:@"seconds"];
      *(_WORD *)(a2 + 20) = [v12 shortValue];

      int v13 = [v6 objectForKeyedSubscript:@"subframes_divisor"];
      *(_WORD *)(a2 + 2) = [v13 shortValue];

      id v14 = [v6 objectForKeyedSubscript:@"subframes"];
      *(_WORD *)a2 = [v14 shortValue];

      id v15 = [v6 objectForKeyedSubscript:@"type"];
      *(_DWORD *)(a2 + 8) = [v15 unsignedIntValue];
    }
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  char v3 = [a1 identifier];

  if (v3)
  {
    char v4 = [a1 identifier];
    [v2 setObject:v4 forKey:@"identifier"];
  }
  CFDictionaryRef v5 = [a1 dataType];

  if (v5)
  {
    CFDictionaryRef v6 = [a1 dataType];
    [v2 setObject:v6 forKey:@"dataType"];
  }
  id v7 = [a1 value];

  if (v7)
  {
    uint64_t v8 = [a1 value];
    [v2 setObject:v8 forKey:@"value"];
  }
  id v9 = [a1 extraAttributes];

  if (v9)
  {
    id v10 = [a1 extraAttributes];
    [v2 setObject:v10 forKey:@"extraAttributes"];
  }

  return v2;
}

+ (id)metadataItemFromDictionary:()MIOExtensions
{
  id v3 = a3;
  char v4 = [MEMORY[0x263EFA790] metadataItem];
  CFDictionaryRef v5 = [v3 objectForKey:@"identifier"];
  [v4 setIdentifier:v5];

  CFDictionaryRef v6 = [v3 objectForKey:@"dataType"];
  [v4 setDataType:v6];

  id v7 = [v3 objectForKey:@"value"];
  [v4 setValue:v7];

  uint64_t v8 = [v3 objectForKey:@"extraAttributes"];
  [v4 setExtraAttributes:v8];

  return v4;
}

@end