@interface AVMutableMetadataItem
+ (AVMutableMetadataItem)metadataItem;
+ (id)keyPathsForValuesAffectingIdentifier;
- (AVMetadataIdentifier)identifier;
- (AVMetadataKeySpace)keySpace;
- (CMTime)duration;
- (CMTime)time;
- (NSDate)startDate;
- (NSDictionary)extraAttributes;
- (NSLocale)locale;
- (NSString)dataType;
- (NSString)extendedLanguageTag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)key;
- (id)languageCode;
- (id)value;
- (void)setDataType:(NSString *)dataType;
- (void)setDuration:(CMTime *)duration;
- (void)setExtendedLanguageTag:(NSString *)extendedLanguageTag;
- (void)setExtraAttributes:(NSDictionary *)extraAttributes;
- (void)setIdentifier:(AVMetadataIdentifier)identifier;
- (void)setKey:(id)key;
- (void)setKeySpace:(AVMetadataKeySpace)keySpace;
- (void)setLocale:(NSLocale *)locale;
- (void)setPreferredStorageLocation:(id)a3;
- (void)setStartDate:(NSDate *)startDate;
- (void)setTime:(CMTime *)time;
- (void)setValue:(id)value;
@end

@implementation AVMutableMetadataItem

- (void)setValue:(id)value
{
  v3 = self->super._priv->value;
  if (v3 != value)
  {

    self->super._priv->value = objc_msgSend(value, "copyWithZone:", -[AVMutableMetadataItem zone](self, "zone"));
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [AVMetadataItem alloc];
  id v5 = [(AVMetadataItem *)self _figMetadataDictionary];
  return [(AVMetadataItem *)v4 _initWithFigMetadataDictionary:v5];
}

- (AVMetadataKeySpace)keySpace
{
  return self->super._priv->keySpace;
}

- (id)key
{
  return self->super._priv->key;
}

- (id)value
{
  v2 = self->super._priv->value;
  return v2;
}

- (CMTime)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(void *)&self->timescale
                                                                                      + 88);
  return self;
}

- (NSDate)startDate
{
  return self->super._priv->startDate;
}

- (NSLocale)locale
{
  return self->super._priv->locale;
}

- (NSDictionary)extraAttributes
{
  return self->super._priv->extras;
}

- (NSString)extendedLanguageTag
{
  return self->super._priv->extendedLanguageTag;
}

- (CMTime)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(void *)&self->timescale
                                                                                      + 112);
  return self;
}

- (void)setDataType:(NSString *)dataType
{
  v3 = self->super._priv->dataType;
  if (v3 != dataType)
  {

    self->super._priv->dataType = (NSString *)[(NSString *)dataType copy];
    v6 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->super._priv->extras];
    [v6 setValue:dataType forKey:*MEMORY[0x1E4F32FF0]];
    if (dataType) {
      uint64_t v7 = *MEMORY[0x1E4F32FB0];
    }
    else {
      uint64_t v7 = 0;
    }
    [v6 setValue:v7 forKey:*MEMORY[0x1E4F32FF8]];
    [v6 removeObjectForKey:*MEMORY[0x1E4F32FE8]];
    [v6 removeObjectForKey:*MEMORY[0x1E4F32FE0]];
    [(AVMutableMetadataItem *)self setExtraAttributes:v6];
  }
}

- (void)setKey:(id)key
{
  v3 = self->super._priv->key;
  if (v3 != key)
  {

    self->super._priv->key = objc_msgSend(key, "copyWithZone:", -[AVMutableMetadataItem zone](self, "zone"));
    [(AVMetadataItem *)self _updateCommonKey];
    [(AVMetadataItem *)self _updateIdentifier];
  }
}

- (void)setKeySpace:(AVMetadataKeySpace)keySpace
{
  v3 = self->super._priv->keySpace;
  if (v3 != keySpace)
  {

    self->super._priv->keySpace = (NSString *)[(NSString *)keySpace copy];
    [(AVMetadataItem *)self _updateCommonKey];
    [(AVMetadataItem *)self _updateIdentifier];
  }
}

- (void)setIdentifier:(AVMetadataIdentifier)identifier
{
  v3 = self->super._priv->identifier;
  if (v3 != identifier)
  {

    self->super._priv->identifier = 0;
    id v7 = +[AVMetadataItem keyForIdentifier:identifier];
    v8 = +[AVMetadataItem keySpaceForIdentifier:identifier];
    if (v8) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3C8];
      v13 = NSStringFromSelector(sel_identifierForKey_keySpace_);
      v19 = (void *)[v11 exceptionWithName:v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Bad identifier. Identifier should be of the form \"<keySpace>/<key>\". Try using +%@ to generate an identifier from key and keySpace.", v14, v15, v16, v17, v18, (uint64_t)v13), 0 reason userInfo];
      objc_exception_throw(v19);
    }
    v10 = v8;
    self->super._priv->identifier = (NSString *)[(NSString *)identifier copy];
    [(AVMutableMetadataItem *)self setKey:v7];
    [(AVMutableMetadataItem *)self setKeySpace:v10];
  }
}

- (void)setExtraAttributes:(NSDictionary *)extraAttributes
{
  extras = self->super._priv->extras;
  if (extras != extraAttributes)
  {

    self->super._priv->extras = (NSDictionary *)[(NSDictionary *)extraAttributes copy];
  }
}

+ (AVMutableMetadataItem)metadataItem
{
  v2 = objc_alloc_init(AVMutableMetadataItem);
  return v2;
}

- (AVMetadataIdentifier)identifier
{
  AVMetadataIdentifier result = self->super._priv->identifier;
  if (!result)
  {
    [(AVMetadataItem *)self _updateIdentifier];
    return self->super._priv->identifier;
  }
  return result;
}

- (id)languageCode
{
  return self->super._priv->languageCode;
}

- (NSString)dataType
{
  return self->super._priv->dataType;
}

- (void)setPreferredStorageLocation:(id)a3
{
  priv = self->super._priv;
  preferredStorageLocation = priv->preferredStorageLocation;
  if (preferredStorageLocation != a3)
  {

    self->super._priv->preferredStorageLocation = (NSString *)[a3 copy];
    priv = self->super._priv;
  }
  priv->preferredStorageLocationWasSet = 1;
}

+ (id)keyPathsForValuesAffectingIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"key", @"keySpace", 0);
}

- (void)setLocale:(NSLocale *)locale
{
  v3 = self->super._priv->locale;
  if (v3 != locale)
  {

    self->super._priv->locale = (NSLocale *)[(NSLocale *)locale copy];
    [(AVMetadataItem *)self _updateLanguageInformationFromLocale:locale];
  }
}

- (void)setExtendedLanguageTag:(NSString *)extendedLanguageTag
{
  v3 = self->super._priv->extendedLanguageTag;
  if (v3 != extendedLanguageTag)
  {

    self->super._priv->extendedLanguageTag = (NSString *)[(NSString *)extendedLanguageTag copy];
    [(AVMetadataItem *)self _updateLanguageInformationFromExtendedLanguageTag:extendedLanguageTag];
  }
}

- (void)setTime:(CMTime *)time
{
  priv = self->super._priv;
  long long v4 = *(_OWORD *)&time->value;
  priv->time.epoch = time->epoch;
  *(_OWORD *)&priv->time.value = v4;
}

- (void)setDuration:(CMTime *)duration
{
  priv = self->super._priv;
  long long v4 = *(_OWORD *)&duration->value;
  priv->duration.epoch = duration->epoch;
  *(_OWORD *)&priv->duration.value = v4;
}

- (void)setStartDate:(NSDate *)startDate
{
  v3 = self->super._priv->startDate;
  if (v3 != startDate)
  {

    self->super._priv->startDate = (NSDate *)[(NSDate *)startDate copy];
  }
}

@end