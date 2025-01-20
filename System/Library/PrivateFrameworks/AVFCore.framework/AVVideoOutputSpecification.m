@interface AVVideoOutputSpecification
- (AVVideoOutputSpecification)init;
- (AVVideoOutputSpecification)initWithTagCollections:(id)a3;
- (NSArray)preferredTagCollections;
- (NSDictionary)defaultOutputSettings;
- (NSDictionary)defaultPixelBufferAttributes;
- (id)_allowWideColorForTagCollection:(OpaqueCMTagCollection *)a3;
- (id)_outputSettingsForTagCollection:(OpaqueCMTagCollection *)a3;
- (id)_pixelBufferAttributesForTagCollection:(OpaqueCMTagCollection *)a3;
- (id)_videoColorPropertiesForTagCollection:(OpaqueCMTagCollection *)a3;
- (id)_videoOutputSettingsFromDictionaryRepresentation:(id)a3 exceptionReason:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setDefaultOutputSettings:(id)a3;
- (void)setOutputSettings:(id)a3 forTagCollection:(OpaqueCMTagCollection *)a4;
@end

@implementation AVVideoOutputSpecification

- (AVVideoOutputSpecification)initWithTagCollections:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)AVVideoOutputSpecification;
  v5 = [(AVVideoOutputSpecification *)&v27 init];
  if (v5)
  {
    if (a3 && [a3 count])
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v6 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (!v6) {
        goto LABEL_12;
      }
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      while (1)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(a3);
          }
          CFTypeID v10 = CFGetTypeID(*(CFTypeRef *)(*((void *)&v23 + 1) + 8 * v9));
          if (v10 != CMTagCollectionGetTypeID())
          {
            v12 = v5;
            v18 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v19 = *MEMORY[0x1E4F1C3C8];
            v20 = @"tagCollections can only contains elements of type CMTagCollectionRef";
            goto LABEL_15;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (!v7)
        {
LABEL_12:
          v5->_tagCollections = (NSArray *)[a3 copy];
          v5->_tagCollectionToOutputSettingsMapping = (NSMutableDictionary *)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          return v5;
        }
      }
    }
    v22 = v5;
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    v20 = @"tagCollections must not be nil or empty";
LABEL_15:
    v21 = objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, (uint64_t)v20, v13, v14, v15, v16, v17, v23), 0);
    objc_exception_throw(v21);
  }
  return v5;
}

- (AVVideoOutputSpecification)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVVideoOutputSpecification;
  return [(AVVideoOutputSpecification *)&v3 init];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVVideoOutputSpecification;
  [(AVVideoOutputSpecification *)&v3 dealloc];
}

- (NSArray)preferredTagCollections
{
  v2 = (void *)[(NSArray *)self->_tagCollections copy];
  return (NSArray *)v2;
}

- (NSDictionary)defaultPixelBufferAttributes
{
  return (NSDictionary *)[(AVDecodedVideoSettingsForFig *)self->_defaultOutputSettings pixelBufferAttributes];
}

- (id)_videoOutputSettingsFromDictionaryRepresentation:(id)a3 exceptionReason:(id *)a4
{
  uint64_t v16 = 0;
  if (!a3) {
    return 0;
  }
  id v7 = +[AVVideoOutputSettings _videoOutputSettingsWithVideoSettingsDictionary:a3 exceptionReason:&v16];
  uint64_t v8 = v16;
  if (v16) {
    goto LABEL_8;
  }
  if ([v7 willYieldCompressedSamples])
  {
    uint64_t v8 = (void *)AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"AVVideoOutputSpecification does not support compressed output", v9, v10, v11, v12, v13, v15);
    if (!v8) {
      return v7;
    }
    goto LABEL_8;
  }
  uint64_t v8 = v16;
  if (v16)
  {
LABEL_8:
    id v7 = 0;
    *a4 = v8;
  }
  return v7;
}

- (void)setOutputSettings:(id)a3 forTagCollection:(OpaqueCMTagCollection *)a4
{
  uint64_t v18 = 0;
  if (![(NSArray *)[(AVVideoOutputSpecification *)self preferredTagCollections] containsObject:a4])
  {
    uint64_t v15 = NSString;
    uint64_t v17 = a4;
    [(AVVideoOutputSpecification *)self preferredTagCollections];
    uint64_t v14 = [v15 stringWithFormat:@"Invalid mapping, called with tagCollection (%@) that does not match any tagCollection in preferredTagCollections (%@)"];
LABEL_5:
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, v14, v9, v10, v11, v12, v13, (uint64_t)v17), 0);
    objc_exception_throw(v16);
  }
  id v8 = [(AVVideoOutputSpecification *)self _videoOutputSettingsFromDictionaryRepresentation:a3 exceptionReason:&v18];
  uint64_t v14 = v18;
  if (v18) {
    goto LABEL_5;
  }
  [(NSMutableDictionary *)self->_tagCollectionToOutputSettingsMapping setObject:v8 forKeyedSubscript:a4];
}

- (NSDictionary)defaultOutputSettings
{
  return (NSDictionary *)[(AVDecodedVideoSettingsForFig *)self->_defaultOutputSettings outputSettingsDictionary];
}

- (void)setDefaultOutputSettings:(id)a3
{
  uint64_t v13 = 0;

  self->_defaultOutputSettings = (AVDecodedVideoSettingsForFig *)[(AVVideoOutputSpecification *)self _videoOutputSettingsFromDictionaryRepresentation:a3 exceptionReason:&v13];
  if (v13)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, v13, v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
}

- (id)_pixelBufferAttributesForTagCollection:(OpaqueCMTagCollection *)a3
{
  id v3 = [(AVVideoOutputSpecification *)self _outputSettingsForTagCollection:a3];
  return (id)[v3 pixelBufferAttributes];
}

- (id)_outputSettingsForTagCollection:(OpaqueCMTagCollection *)a3
{
  v4 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tagCollectionToOutputSettingsMapping, "objectForKeyedSubscript:", a3), "copy");
  if (!v4) {
    v4 = (void *)[(AVDecodedVideoSettingsForFig *)self->_defaultOutputSettings copy];
  }
  return v4;
}

- (id)_videoColorPropertiesForTagCollection:(OpaqueCMTagCollection *)a3
{
  id v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[AVVideoOutputSpecification _outputSettingsForTagCollection:](self, "_outputSettingsForTagCollection:", a3), "videoSettingsDictionary"), "objectForKeyedSubscript:", @"AVVideoColorPropertiesKey"), "copy");
  return v3;
}

- (id)_allowWideColorForTagCollection:(OpaqueCMTagCollection *)a3
{
  id v3 = objc_msgSend(-[AVVideoOutputSpecification _outputSettingsForTagCollection:](self, "_outputSettingsForTagCollection:", a3), "videoSettingsDictionary");
  return (id)[v3 objectForKeyedSubscript:@"AVVideoAllowWideColorKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(AVVideoOutputSpecification);
  v4->_defaultOutputSettings = (AVDecodedVideoSettingsForFig *)[(AVDecodedVideoSettingsForFig *)self->_defaultOutputSettings copy];
  v4->_tagCollectionToOutputSettingsMapping = (NSMutableDictionary *)[(NSMutableDictionary *)self->_tagCollectionToOutputSettingsMapping copy];
  v4->_tagCollections = (NSArray *)[(NSArray *)[(AVVideoOutputSpecification *)self preferredTagCollections] copy];
  return v4;
}

@end