@interface MIOVersion
+ (id)allVersionedKeysForKey:(id)a3 modifier:(id)a4;
+ (id)pre3_15_0_Mapping;
+ (id)versionZero;
- (BOOL)isAllDigitsInString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToVersion:(id)a3;
- (MIOVersion)init;
- (MIOVersion)initWithVersionString:(id)a3 error:(id *)a4;
- (NSString)modifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getVersionAsString;
- (id)versionedKey:(id)a3 modifier:(id)a4;
- (int64_t)compareToVersion:(id)a3;
- (unint64_t)hash;
- (unsigned)bugfix;
- (unsigned)major;
- (unsigned)minor;
@end

@implementation MIOVersion

+ (id)versionZero
{
  v2 = [[MIOVersion alloc] initWithVersionString:@"0.0" error:0];

  return v2;
}

- (MIOVersion)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

  v5 = [(MIOVersion *)self initWithVersionString:v4 error:0];
  return v5;
}

- (MIOVersion)initWithVersionString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MIOVersion;
  v7 = [(MIOVersion *)&v28 init];
  if (!v7) {
    goto LABEL_24;
  }
  v8 = [v6 componentsSeparatedByString:@"."];
  if ((unint64_t)[v8 count] >= 2 && (unint64_t)objc_msgSend(v8, "count") < 4)
  {
    v11 = [v8 objectAtIndexedSubscript:0];
    BOOL v12 = [(MIOVersion *)v7 isAllDigitsInString:v11];

    if (v12)
    {
      v13 = [v8 objectAtIndexedSubscript:0];
      v7->_major = [v13 intValue];

      v14 = [v8 objectAtIndexedSubscript:1];
      BOOL v15 = [(MIOVersion *)v7 isAllDigitsInString:v14];

      if (v15)
      {
        v16 = [v8 objectAtIndexedSubscript:1];
        v7->_minor = [v16 intValue];

        v7->_bugfix = 0;
        modifier = v7->_modifier;
        v7->_modifier = (NSString *)&stru_26CB6A778;

        if ([v8 count] == 3)
        {
          v18 = [v8 objectAtIndexedSubscript:2];
          if ([(MIOVersion *)v7 isAllDigitsInString:v18])
          {
            v7->_bugfix = [v18 intValue];
          }
          else
          {
            v19 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
            uint64_t v20 = [v18 rangeOfCharacterFromSet:v19];

            if (v20 == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (a4)
              {
                *a4 = [MEMORY[0x263F087E8] internalErrorWithMessage:0 code:-1];
              }

              goto LABEL_7;
            }
            v21 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
            uint64_t v22 = [v18 stringByTrimmingCharactersInSet:v21];
            v23 = v7->_modifier;
            v7->_modifier = (NSString *)v22;

            v24 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
            v25 = [v24 invertedSet];
            v26 = [v18 stringByTrimmingCharactersInSet:v25];
            v7->_bugfix = [v26 intValue];
          }
        }

LABEL_24:
        v10 = v7;
        goto LABEL_25;
      }
      if (!a4) {
        goto LABEL_7;
      }
    }
    else if (!a4)
    {
      goto LABEL_7;
    }
    v9 = [MEMORY[0x263F087E8] internalErrorWithMessage:0 code:-1];
    goto LABEL_6;
  }
  if (a4)
  {
    v9 = [MEMORY[0x263F087E8] internalWarningWithMessage:0 code:-1];
LABEL_6:
    *a4 = v9;
  }
LABEL_7:

  v10 = 0;
LABEL_25:

  return v10;
}

- (id)getVersionAsString
{
  unsigned int bugfix = self->_bugfix;
  NSUInteger v4 = [(NSString *)self->_modifier length];
  uint64_t major = self->_major;
  uint64_t minor = self->_minor;
  if (bugfix)
  {
    uint64_t v7 = self->_bugfix;
    if (v4)
    {
      modifier = self->_modifier;
LABEL_6:
      [NSString stringWithFormat:@"%d.%d.%d%@", major, minor, v7, modifier];
      goto LABEL_9;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"%d.%d.%d", major, self->_minor, v7, v12);
  }
  else
  {
    if (v4)
    {
      modifier = self->_modifier;
      uint64_t v7 = self->_bugfix;
      goto LABEL_6;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"%d.%d", self->_major, minor, v11, v12);
  }
  v9 = LABEL_9:;

  return v9;
}

- (int64_t)compareToVersion:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v15 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Cannot compare with nil object." userInfo:0];
    objc_exception_throw(v15);
  }
  unsigned int v5 = [(MIOVersion *)self major];
  if (v5 < [v4 major]) {
    goto LABEL_3;
  }
  unsigned int v7 = [(MIOVersion *)self major];
  if (v7 > [v4 major])
  {
LABEL_5:
    int64_t v6 = 1;
    goto LABEL_6;
  }
  unsigned int v9 = [(MIOVersion *)self minor];
  if (v9 >= [v4 minor])
  {
    unsigned int v10 = [(MIOVersion *)self minor];
    if (v10 > [v4 minor]) {
      goto LABEL_5;
    }
    unsigned int v11 = [(MIOVersion *)self bugfix];
    if (v11 >= [v4 bugfix])
    {
      unsigned int v12 = [(MIOVersion *)self bugfix];
      if (v12 <= [v4 bugfix])
      {
        v13 = [(MIOVersion *)self modifier];
        v14 = [v4 modifier];
        int64_t v6 = [v13 compare:v14];

        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
LABEL_3:
  int64_t v6 = -1;
LABEL_6:

  return v6;
}

- (BOOL)isEqualToVersion:(id)a3
{
  return [(MIOVersion *)self compareToVersion:a3] == 0;
}

- (id)description
{
  v2 = NSString;
  v3 = [(MIOVersion *)self getVersionAsString];
  id v4 = [v2 stringWithFormat:@"Version: %@", v3];

  return v4;
}

- (BOOL)isAllDigitsInString:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  unsigned int v5 = [v4 invertedSet];

  BOOL v6 = [v3 rangeOfCharacterFromSet:v5] == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v3, "length") != 0;
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[MIOVersion allocWithZone:a3];
  unsigned int v5 = [(MIOVersion *)self getVersionAsString];
  id v10 = 0;
  BOOL v6 = [(MIOVersion *)v4 initWithVersionString:v5 error:&v10];
  id v7 = v10;

  if (v7)
  {
    [NSString stringWithFormat:@"Cannot copy version %@", v7];
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v9);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(MIOVersion *)self isEqualToVersion:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(MIOVersion *)self getVersionAsString];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (id)pre3_15_0_Mapping
{
  v8[15] = *MEMORY[0x263EF8340];
  v2 = (void *)+[MIOVersion pre3_15_0_Mapping]::pre3_15_0_Mapping;
  if (!+[MIOVersion pre3_15_0_Mapping]::pre3_15_0_Mapping)
  {
    v8[0] = @"mdta/com.apple.trackStreamType";
    unint64_t v3 = [@"mdta/com.apple.track_kind" stringByAppendingFormat:@"_%@", @"metadata", @"mdta/com.apple.track_kind"];
    v7[1] = v3;
    v8[1] = @"mdta/com.apple.metadataTrackType";
    v8[2] = @"mdta/com.apple.MOVStreamIO.stateMetadataIdentifier";
    v7[2] = @"mdta/com.apple.framework.state.MOVStreamIO";
    v7[3] = @"version";
    v8[3] = @"mdta/com.apple.MOVStreamIO.versionKey";
    v8[4] = @"mdta/com.apple.MOVStreamIO.defaultOptions";
    v7[4] = @"default_options";
    v7[5] = @"mdta/com.apple.stream_sample_format";
    v8[5] = @"mdta/com.apple.trackStreamPixelFormat";
    v8[6] = @"mdta/com.apple.trackStreamEncodedPixelFormat";
    v7[6] = @"mdta/com.apple.stream_encoded_sample_format";
    v7[7] = @"mdta/com.apple.stream_sample_attachments_serialization_mode";
    v8[7] = @"mdta/com.apple.trackStreamAttachmentsSerializationMode";
    v8[8] = @"mdta/com.apple.trackTypeInfo";
    v7[8] = @"mdta/com.apple.stream_type_info";
    v7[9] = @"mdta/com.apple.stream_related_to_stream";
    v8[9] = @"mdta/com.apple.trackStreamRelatedToStream";
    v8[10] = @"mdta/com.apple.trackStreamRelationSpecifier";
    v7[10] = @"mdta/com.apple.stream_relation_specifier";
    v7[11] = @"mdta/com.apple.stream_sample_exact_bytes_per_row";
    v8[11] = @"mdta/com.apple.exactBytesPerRow";
    v8[12] = @"mdta/com.apple.RawBayerRearrangeType";
    v7[12] = @"mdta/com.apple.stream_raw_bayer_rearrange_type";
    v7[13] = @"mdta/com.apple.stream_sample_attachments";
    v7[14] = @"mdta/com.apple.metadata_stream_item";
    v8[13] = @"mdta/com.apple.rawSampleBufferAttachmentDict";
    v8[14] = @"mdta/com.apple.metadataDict";
    uint64_t v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:15];
    BOOL v5 = (void *)+[MIOVersion pre3_15_0_Mapping]::pre3_15_0_Mapping;
    +[MIOVersion pre3_15_0_Mapping]::pre3_15_0_Mapping = v4;

    v2 = (void *)+[MIOVersion pre3_15_0_Mapping]::pre3_15_0_Mapping;
  }

  return v2;
}

+ (id)allVersionedKeysForKey:(id)a3 modifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v7 addObject:v5];
  if (v6)
  {
    uint64_t v8 = [v5 stringByAppendingFormat:@"_%@", v6];

    id v5 = (id)v8;
  }
  id v9 = +[MIOVersion pre3_15_0_Mapping];
  id v10 = [v9 objectForKey:v5];

  if (v10) {
    [v7 addObject:v10];
  }

  return v7;
}

- (id)versionedKey:(id)a3 modifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[MIOVersion versionedKey:modifier:]::ref3150Version)
  {
    uint64_t v8 = [[MIOVersion alloc] initWithVersionString:@"3.15.0" error:0];
    id v9 = (void *)-[MIOVersion versionedKey:modifier:]::ref3150Version;
    -[MIOVersion versionedKey:modifier:]::ref3150Version = (uint64_t)v8;
  }
  if (-[MIOVersion compareToVersion:](self, "compareToVersion:") != -1)
  {
    id v10 = 0;
LABEL_5:
    id v6 = v6;
    unsigned int v11 = v6;
    goto LABEL_6;
  }
  id v10 = +[MIOVersion pre3_15_0_Mapping];
  if (!v10) {
    goto LABEL_5;
  }
  if ([v7 length])
  {
    uint64_t v13 = [v6 stringByAppendingFormat:@"_%@", v7];

    id v6 = (id)v13;
  }
  unsigned int v11 = [v10 objectForKey:v6];
  if (!v11) {
    goto LABEL_5;
  }
LABEL_6:

  return v11;
}

- (unsigned)major
{
  return self->_major;
}

- (unsigned)minor
{
  return self->_minor;
}

- (unsigned)bugfix
{
  return self->_bugfix;
}

- (NSString)modifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
}

@end