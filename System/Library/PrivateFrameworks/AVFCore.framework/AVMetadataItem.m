@interface AVMetadataItem
+ (AVMetadataIdentifier)identifierForKey:(id)key keySpace:(AVMetadataKeySpace)keySpace;
+ (AVMetadataItem)metadataItemWithPropertiesOfMetadataItem:(AVMetadataItem *)metadataItem valueLoadingHandler:(void *)handler;
+ (AVMetadataKeySpace)keySpaceForIdentifier:(AVMetadataIdentifier)identifier;
+ (BOOL)_clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace;
+ (NSArray)metadataItemsFromArray:(NSArray *)metadataItems filteredAndSortedAccordingToPreferredLanguages:(NSArray *)preferredLanguages;
+ (NSArray)metadataItemsFromArray:(NSArray *)metadataItems filteredByIdentifier:(AVMetadataIdentifier)identifier;
+ (NSArray)metadataItemsFromArray:(NSArray *)metadataItems filteredByMetadataItemFilter:(AVMetadataItemFilter *)metadataItemFilter;
+ (NSArray)metadataItemsFromArray:(NSArray *)metadataItems withKey:(id)key keySpace:(AVMetadataKeySpace)keySpace;
+ (NSArray)metadataItemsFromArray:(NSArray *)metadataItems withLocale:(NSLocale *)locale;
+ (id)_figMetadataPropertyFromMetadataItems:(id)a3;
+ (id)_isoUserDataKeysRequiringKeySpaceConversion;
+ (id)_metadataArrayWithSmartDeferredLoadingForMetataArray:(id)a3 error:(id *)a4;
+ (id)_metadataItemWithFigMetadataDictionary:(id)a3;
+ (id)_metadataItemWithFigMetadataDictionary:(id)a3 containerURL:(id)a4 securityOptions:(unsigned int)a5;
+ (id)_replaceQuickTimeUserDataKeySpaceWithISOUserDataKeySpaceIfRequired:(id)a3;
+ (id)dataTypeForValue:(id)a3;
+ (id)keyForIdentifier:(AVMetadataIdentifier)identifier;
+ (id)metadataItemsFromArray:(id)a3 filteredByIdentifiers:(id)a4;
+ (id)metadataItemsFromArray:(id)a3 withStringValue:(id)a4;
+ (void)initialize;
- (AVKeyValueStatus)statusOfValueForKey:(NSString *)key error:(NSError *)outError;
- (AVMetadataIdentifier)identifier;
- (AVMetadataItem)init;
- (AVMetadataKey)commonKey;
- (AVMetadataKeySpace)keySpace;
- (BOOL)_areExtraAttributesOf:(id)a3 comparableToExtraAttributesOf:(id)a4;
- (BOOL)_preferredStorageLocationWasSet;
- (BOOL)isEqual:(id)a3;
- (CGImage)imageValue;
- (CMTime)duration;
- (CMTime)time;
- (NSData)dataValue;
- (NSDate)dateValue;
- (NSDate)startDate;
- (NSDictionary)extraAttributes;
- (NSLocale)locale;
- (NSNumber)numberValue;
- (NSString)dataType;
- (NSString)extendedLanguageTag;
- (NSString)stringValue;
- (id)_conformingDataTypes;
- (id)_createJSONEncodedDataFromValue:(id)a3 error:(id *)a4;
- (id)_figMetadataDictionary;
- (id)_figMetadataDictionaryWithValue:(BOOL)a3 diviningValueDataType:(BOOL)a4;
- (id)_figMetadataFormat;
- (id)_figMetadataSpecificationReturningError:(id *)a3;
- (id)_initWithFigMetadataDictionary:(id)a3;
- (id)_initWithReader:(OpaqueFigMetadataReader *)a3 itemIndex:(int64_t)a4;
- (id)_keyAsString;
- (id)_serializationDataType;
- (id)_valueFromCFType:(void *)a3;
- (id)description;
- (id)discoveryTimestamp;
- (id)intrinsicAttributesOfExtraAttributes:(id)a3;
- (id)key;
- (id)languageCode;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)preferredStorageLocation;
- (id)unicodeLanguageCode;
- (id)unicodeLanguageIdentifier;
- (id)value;
- (unint64_t)hash;
- (void)_copyValueAsCFTypeWithFormatDescription:(opaqueCMFormatDescription *)a3 error:(id *)a4;
- (void)_extractPropertiesFromDictionary:(id)a3;
- (void)_makePropertiesReady;
- (void)_makeValueReady;
- (void)_updateCommonKey;
- (void)_updateIdentifier;
- (void)_updateLanguageInformationFromExtendedLanguageTag:(id)a3;
- (void)_updateLanguageInformationFromLocale:(id)a3;
- (void)dealloc;
- (void)loadValuesAsynchronouslyForKeys:(NSArray *)keys completionHandler:(void *)handler;
@end

@implementation AVMetadataItem

- (id)_figMetadataDictionary
{
  return [(AVMetadataItem *)self _figMetadataDictionaryWithValue:1 diviningValueDataType:0];
}

- (void)_copyValueAsCFTypeWithFormatDescription:(opaqueCMFormatDescription *)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = [(AVMetadataItem *)self value];
  unint64_t v22 = 0;
  result = (void *)softLinkAVMetadataObjectCreateBoxedMetadataFromObjectAndFormatDescription((uint64_t)v7, (uint64_t)a3, (uint64_t)&v22);
  if ((unint64_t)result | v22) {
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E4F1F010])|| CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E4F1F018])))
  {
    v9 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      CGPoint v16 = (CGPoint)*MEMORY[0x1E4F1DAD8];
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v7);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
          CGPoint v17 = v16;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && AVCGPointFromNSValue(v14, &v17))
          {
            CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v17);
            [v9 addObject:DictionaryRepresentation];
            CFRelease(DictionaryRepresentation);
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }
    result = objc_msgSend(v9, "count", v16);
    if (result)
    {
      result = v9;
LABEL_17:
      result = (void *)CFRetain(result);
    }
  }
  else if (CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E4F1F008]))
  {
    [v7 pointValue];
    result = CGPointCreateDictionaryRepresentation(v25);
  }
  else if (CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E4F1EFC8]))
  {
    [v7 sizeValue];
    result = CGSizeCreateDictionaryRepresentation(v26);
  }
  else if (CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E4F1F028]))
  {
    [v7 rectValue];
    result = CGRectCreateDictionaryRepresentation(v27);
  }
  else if (CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E4F1EFF0]))
  {
    result = [(AVMetadataItem *)self _createJSONEncodedDataFromValue:v7 error:&v22];
    if (result) {
      goto LABEL_17;
    }
  }
  else
  {
    if (v7)
    {
      result = v7;
      goto LABEL_17;
    }
    result = 0;
  }
LABEL_24:
  if (a4) {
    *a4 = (id)v22;
  }
  return result;
}

- (id)_figMetadataDictionaryWithValue:(BOOL)a3 diviningValueDataType:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[AVMetadataItem extraAttributes](self, "extraAttributes"));
  v8 = [(AVMetadataItem *)self keySpace];
  if (v8) {
    [v7 setValue:v8 forKey:*MEMORY[0x1E4F33028]];
  }
  id v9 = [(AVMetadataItem *)self key];
  if (v9) {
    [v7 setValue:v9 forKey:*MEMORY[0x1E4F33020]];
  }
  if (v5)
  {
    id v10 = [(AVMetadataItem *)self value];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = [(AVMetadataItem *)self _copyValueAsCFTypeWithFormatDescription:0 error:0];
      uint64_t v13 = *MEMORY[0x1E4F33060];
      if (v12)
      {
        v14 = v12;
        [v7 setValue:v12 forKey:v13];
        CFRelease(v14);
      }
      else
      {
        [v7 setValue:v11 forKey:v13];
      }
    }
  }
  v15 = [(AVMetadataItem *)self extendedLanguageTag];
  if (v15) {
    [v7 setValue:v15 forKey:*MEMORY[0x1E4F33010]];
  }
  CGPoint v16 = [(AVMetadataItem *)self locale];
  if (v16) {
    [v7 setValue:v16 forKey:*MEMORY[0x1E4F33038]];
  }
  memset(&v28[1], 0, sizeof(CMTime));
  if (self)
  {
    [(AVMetadataItem *)self time];
    if (v28[1].flags)
    {
      v28[0] = v28[1];
      [v7 setValue:AVDictionaryWithTime(v28) forKey:*MEMORY[0x1E4F33050]];
    }
    memset(v28, 0, 24);
    [(AVMetadataItem *)self duration];
    if (v28[0].flags)
    {
      CMTime v27 = v28[0];
      [v7 setValue:AVDictionaryWithTime(&v27) forKey:*MEMORY[0x1E4F33008]];
    }
  }
  else
  {
    memset(v28, 0, 24);
  }
  CGPoint v17 = [(AVMetadataItem *)self startDate];
  if (v17) {
    [v7 setValue:v17 forKey:*MEMORY[0x1E4F33048]];
  }
  id v18 = [(AVMetadataItem *)self discoveryTimestamp];
  if (v18) {
    [v7 setValue:v18 forKey:*MEMORY[0x1E4F33000]];
  }
  if (v4)
  {
    [(AVMetadataItem *)self value];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v19 = [(AVMetadataItem *)self dataType];
      long long v20 = (void *)MEMORY[0x1E4F32FC8];
      if (v19)
      {
        v27.CMTimeValue value = 0;
        CMTimeValue value = 0;
        if (FigMetadataGetDataTypeWithNamespaceForCoreMediaDataType() && v27.value)
        {
          unint64_t v22 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:");
          if ([v22 conformsToType:*MEMORY[0x1E4F44400]]) {
            CMTimeValue value = v27.value;
          }
          else {
            CMTimeValue value = 0;
          }
        }
        if (!value) {
          goto LABEL_37;
        }
      }
      else
      {
        v23 = CGImageSourceCreateWithData((CFDataRef)[(AVMetadataItem *)self value], 0);
        if (!v23) {
          goto LABEL_37;
        }
        uint64_t v24 = v23;
        CMTimeValue value = (CMTimeValue)CGImageSourceGetType(v23);
        CFRelease(v24);
        if (!value) {
          goto LABEL_37;
        }
      }
      [v7 setValue:value forKey:*MEMORY[0x1E4F32FF0]];
      [v7 setValue:*v20 forKey:*MEMORY[0x1E4F32FF8]];
    }
  }
LABEL_37:
  id v25 = [(AVMetadataItem *)self preferredStorageLocation];
  if (v25) {
    [v7 setValue:v25 forKey:*MEMORY[0x1E4F33040]];
  }
  objc_msgSend(v7, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVMetadataItem _preferredStorageLocationWasSet](self, "_preferredStorageLocationWasSet")), @"storageLocationWasSetKey");
  return v7;
}

- (id)discoveryTimestamp
{
  return self->_priv->discoveryTimestamp;
}

- (id)preferredStorageLocation
{
  return self->_priv->preferredStorageLocation;
}

- (void)_makePropertiesReady
{
  CFTypeRef cf = 0;
  priv = self->_priv;
  reader = priv->reader;
  if (reader && !priv->extras)
  {
    int64_t itemIndex = priv->itemIndex;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v7 = v6 ? v6 : 0;
    v8 = *(unsigned int (**)(OpaqueFigMetadataReader *, void, void, int64_t, void, void, CFTypeRef *))(v7 + 48);
    if (v8)
    {
      if (v8(reader, 0, 0, itemIndex, *MEMORY[0x1E4F1CF80], 0, &cf)) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = cf == 0;
      }
      if (!v9)
      {
        -[AVMetadataItem _extractPropertiesFromDictionary:](self, "_extractPropertiesFromDictionary:");
        if (cf) {
          CFRelease(cf);
        }
      }
    }
  }
}

- (BOOL)_preferredStorageLocationWasSet
{
  return self->_priv->preferredStorageLocationWasSet;
}

- (id)_initWithFigMetadataDictionary:(id)a3
{
  BOOL v4 = [(AVMetadataItem *)self init];
  BOOL v5 = v4;
  if (v4) {
    [(AVMetadataItem *)v4 _extractPropertiesFromDictionary:a3];
  }
  return v5;
}

- (AVMetadataItem)init
{
  v9.receiver = self;
  v9.super_class = (Class)AVMetadataItem;
  v2 = [(AVMetadataItem *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVMetadataItemInternal);
    v2->_priv = v3;
    if (v3)
    {
      uint64_t v4 = MEMORY[0x1E4F1F9F8];
      long long v5 = *MEMORY[0x1E4F1F9F8];
      *(_OWORD *)&v3->time.CMTimeValue value = *MEMORY[0x1E4F1F9F8];
      int64_t v6 = *(void *)(v4 + 16);
      v3->time.epoch = v6;
      priv = v2->_priv;
      *(_OWORD *)&priv->duration.CMTimeValue value = v5;
      priv->duration.epoch = v6;
      v2->_priv->preferredStorageLocation = (NSString *)[@"default" copy];
      CFRetain(v2->_priv);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)_extractPropertiesFromDictionary:(id)a3
{
  if (!a3 || self->_priv->extras) {
    return;
  }
  uint64_t v40 = *MEMORY[0x1E4F33028];
  uint64_t v5 = objc_msgSend(a3, "objectForKey:");
  uint64_t v58 = *MEMORY[0x1E4F33020];
  int64_t v6 = objc_msgSend(a3, "objectForKey:");
  uint64_t v41 = *MEMORY[0x1E4F33038];
  uint64_t v7 = objc_msgSend(a3, "objectForKey:");
  uint64_t v57 = *MEMORY[0x1E4F33010];
  v8 = objc_msgSend(a3, "objectForKey:");
  uint64_t v56 = *MEMORY[0x1E4F33030];
  objc_super v9 = (__CFString *)objc_msgSend(a3, "objectForKey:");
  uint64_t v59 = *MEMORY[0x1E4F33060];
  id v10 = objc_msgSend(a3, "objectForKey:");
  uint64_t v55 = *MEMORY[0x1E4F33050];
  CFTypeRef cf = (CFTypeRef)objc_msgSend(a3, "objectForKey:");
  uint64_t v54 = *MEMORY[0x1E4F33008];
  CFTypeRef v47 = (CFTypeRef)objc_msgSend(a3, "objectForKey:");
  uint64_t v53 = *MEMORY[0x1E4F33048];
  uint64_t v60 = objc_msgSend(a3, "objectForKey:");
  uint64_t v50 = [a3 objectForKey:*MEMORY[0x1E4F32FF0]];
  uint64_t v11 = [a3 objectForKey:*MEMORY[0x1E4F32FF8]];
  uint64_t v42 = [a3 objectForKey:*MEMORY[0x1E4F32FE0]];
  uint64_t v12 = [a3 objectForKey:*MEMORY[0x1E4F32FE8]];
  uint64_t v52 = *MEMORY[0x1E4F33000];
  uint64_t v49 = objc_msgSend(a3, "objectForKey:");
  v43 = +[AVMetadataItem identifierForKey:v6 keySpace:v5];
  uint64_t v51 = *MEMORY[0x1E4F33040];
  uint64_t v39 = objc_msgSend(a3, "objectForKey:");
  v65 = (void *)[a3 objectForKey:@"storageLocationWasSetKey"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = (void *)v5;
    }
    else {
      uint64_t v13 = 0;
    }
    v64 = v13;
  }
  else
  {
    v64 = 0;
  }
  v14 = v10;
  if (v6
    && (![v6 conformsToProtocol:&unk_1EE5E2580]
     || ([v6 conformsToProtocol:&unk_1EE5E4C90] & 1) == 0))
  {
    int64_t v6 = 0;
  }
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v15 = v7;
    }
    else {
      uint64_t v15 = 0;
    }
    v62 = (void *)v15;
    if (!v8) {
      goto LABEL_20;
    }
  }
  else
  {
    v62 = 0;
    if (!v8) {
      goto LABEL_20;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    v8 = 0;
  }
LABEL_20:
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_super v9 = (__CFString *)AVLanguageCodeFromPackedLanguageCode(v9);
      }
      else {
        objc_super v9 = 0;
      }
    }
  }
  if (v10)
  {
    CFTypeID v16 = CFGetTypeID(v10);
    if (v16 == FigBoxedMetadataGetTypeID())
    {
      v14 = v10;
    }
    else
    {
      v14 = v10;
      if (![v10 conformsToProtocol:&unk_1EE5E2580]
        || ([v10 conformsToProtocol:&unk_1EE5E4C90] & 1) == 0)
      {
        v14 = 0;
      }
    }
  }
  if (v11)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  CGPoint v17 = v43;
  if (v42)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = (void *)v12;
    }
    else {
      id v18 = 0;
    }
    v44 = v18;
  }
  else
  {
    v44 = 0;
  }
  long long v19 = (void *)v60;
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v20 = v17;
    }
    else {
      long long v20 = 0;
    }
    v61 = v20;
  }
  else
  {
    v61 = 0;
  }
  long long v21 = v6;
  if (cf)
  {
    unint64_t v22 = v62;
    CFTypeID v23 = CFGetTypeID(cf);
    if (v23 == CFDictionaryGetTypeID()) {
      CFDictionaryRef v24 = (const __CFDictionary *)cf;
    }
    else {
      CFDictionaryRef v24 = 0;
    }
  }
  else
  {
    unint64_t v22 = v62;
    CFDictionaryRef v24 = 0;
  }
  CFDictionaryRef v63 = v24;
  if (v47)
  {
    CFTypeID v25 = CFGetTypeID(v47);
    if (v25 == CFDictionaryGetTypeID()) {
      CFDictionaryRef v26 = (const __CFDictionary *)v47;
    }
    else {
      CFDictionaryRef v26 = 0;
    }
  }
  else
  {
    CFDictionaryRef v26 = 0;
  }
  CMTime v27 = v22;
  CFTypeRef cfa = v14;
  CFDictionaryRef v48 = v26;
  if (v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v28 = v19;
    }
    else {
      v28 = 0;
    }
  }
  else
  {
    v28 = 0;
  }
  v29 = (void *)v49;
  if (v49)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      v29 = 0;
    }
  }
  v30 = 0;
  if ([v65 BOOLValue])
  {
    if (v39)
    {
      v30 = (__CFString *)v39;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        v30 = 0;
      }
    }
  }
  self->_priv->keySpace = (NSString *)[v64 copy];
  self->_priv->key = objc_msgSend(v21, "copyWithZone:", -[AVMetadataItem zone](self, "zone"));
  self->_priv->identifier = (NSString *)[(NSString *)v61 copy];
  if (v9)
  {
    uint64_t v32 = v40;
    uint64_t v31 = v41;
    if (!v8)
    {
      uint64_t ISO639_1FromISO639_2T = FigMetadataGetISO639_1FromISO639_2T();
      if (ISO639_1FromISO639_2T) {
        v8 = (void *)ISO639_1FromISO639_2T;
      }
      else {
        v8 = v9;
      }
    }
    if (!v27) {
      goto LABEL_81;
    }
    goto LABEL_79;
  }
  uint64_t v32 = v40;
  uint64_t v31 = v41;
  if (v27)
  {
LABEL_79:
    if (!v8) {
      v8 = (void *)AVExtendedLanguageTagFromLocale(v27);
    }
  }
LABEL_81:
  if (v8 && !v9) {
    objc_super v9 = (__CFString *)AVLanguageCodeFromExtendedLanguageTag(v8);
  }
  if (v8 && !v27) {
    CMTime v27 = (void *)[MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v8];
  }
  self->_priv->extendedLanguageTag = (NSString *)[v8 copy];
  self->_priv->locale = (NSLocale *)[v27 copy];
  self->_priv->languageCode = (NSString *)[(__CFString *)v9 copy];
  if (v50)
  {
    [v44 longValue];
    CoreMediaDataType = (void *)FigMetadataGetCoreMediaDataType();
  }
  else
  {
    CoreMediaDataType = 0;
  }
  self->_priv->dataType = (NSString *)[CoreMediaDataType copy];
  if (!self->_priv->value) {
    self->_priv->CMTimeValue value = [(AVMetadataItem *)self _valueFromCFType:cfa];
  }
  [(AVMetadataItem *)self _updateCommonKey];
  if (v63)
  {
    priv = self->_priv;
    CMTimeMakeFromDictionary(&v66, v63);
    priv->time = ($95D729B680665BEAEFA1D6FCA8238556)v66;
  }
  if (v48)
  {
    v36 = self->_priv;
    CMTimeMakeFromDictionary(&v66, v48);
    v36->duration = ($95D729B680665BEAEFA1D6FCA8238556)v66;
  }
  if (v28) {
    self->_priv->startDate = (NSDate *)[v28 copy];
  }
  if (v29) {
    self->_priv->discoveryTimestamp = (NSDate *)[v29 copy];
  }
  if (v30) {
    v37 = v30;
  }
  else {
    v37 = @"default";
  }
  self->_priv->preferredStorageLocation = (NSString *)[(__CFString *)v37 copy];
  self->_priv->preferredStorageLocationWasSet = [v65 BOOLValue];
  v38 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:a3];
  [v38 removeObjectForKey:v32];
  [v38 removeObjectForKey:v58];
  [v38 removeObjectForKey:v57];
  [v38 removeObjectForKey:v56];
  [v38 removeObjectForKey:v31];
  [v38 removeObjectForKey:v55];
  [v38 removeObjectForKey:v54];
  [v38 removeObjectForKey:v53];
  [v38 removeObjectForKey:v59];
  [v38 removeObjectForKey:v52];
  [v38 removeObjectForKey:v51];
  [v38 removeObjectForKey:@"storageLocationWasSetKey"];
  self->_priv->extras = (NSDictionary *)[v38 copy];
}

- (void)_updateIdentifier
{
  v3 = +[AVMetadataItem identifierForKey:self->_priv->key keySpace:self->_priv->keySpace];
  identifier = self->_priv->identifier;
  if (identifier != v3)
  {
    uint64_t v5 = v3;

    self->_priv->identifier = (NSString *)[(NSString *)v5 copy];
  }
}

+ (AVMetadataIdentifier)identifierForKey:(id)key keySpace:(AVMetadataKeySpace)keySpace
{
  AVMetadataIdentifier result = 0;
  if (key && keySpace)
  {
    CFStringRef identifierOut = 0;
    if (CMMetadataCreateIdentifierForKeyAndKeySpace((CFAllocatorRef)*MEMORY[0x1E4F1CF80], key, (CFStringRef)keySpace, &identifierOut))
    {
      return 0;
    }
    else
    {
      return (AVMetadataIdentifier)(id)identifierOut;
    }
  }
  return result;
}

- (void)_updateCommonKey
{
  priv = self->_priv;
  uint64_t keySpace = (uint64_t)priv->keySpace;
  if (keySpace)
  {
    if (priv->key)
    {
      self->_priv->commonKey = (NSString *)FigMetadataGetCommonKey();
      if (self->_priv->commonKey) {
        return;
      }
      if (AVMetadataGetCommonKeyForIdentifier_commonKeysForMetadataIdentifiersOnce != -1) {
        dispatch_once(&AVMetadataGetCommonKeyForIdentifier_commonKeysForMetadataIdentifiersOnce, &__block_literal_global_431);
      }
      uint64_t keySpace = objc_msgSend((id)AVMetadataGetCommonKeyForIdentifier_commonKeysForMetadataIdentifiers, "objectForKeyedSubscript:");
      priv = self->_priv;
    }
    else
    {
      uint64_t keySpace = 0;
    }
  }
  priv->commonKey = (NSString *)keySpace;
}

- (id)_valueFromCFType:(void *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    MetadataObjectFromBoxedMetadata = 0;
    goto LABEL_30;
  }
  CFTypeID v5 = CFGetTypeID(a3);
  if (v5 == FigBoxedMetadataGetTypeID())
  {
    dataType = self->_priv->dataType;
    [(AVMetadataItem *)self time];
    [(AVMetadataItem *)self duration];
    point.origin = v30;
    point.size.width = v31;
    long long v32 = v28;
    uint64_t v33 = v29;
    MetadataObjectFromBoxedMetadata = (void *)softLinkAVMetadataMakeMetadataObjectFromBoxedMetadata((uint64_t)a3, (uint64_t)dataType, (long long *)&point, &v32);
    if (!MetadataObjectFromBoxedMetadata)
    {
      BlockBuffer = (OpaqueCMBlockBuffer *)FigBoxedMetadataGetBlockBuffer();
      size_t DataLength = CMBlockBufferGetDataLength(BlockBuffer);
      MetadataObjectFromBoxedMetadata = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:DataLength];
      id v10 = (void *)[MetadataObjectFromBoxedMetadata mutableBytes];
      if (v10) {
        CMBlockBufferCopyDataBytes(BlockBuffer, 0, DataLength, v10);
      }
      else {
        FigSignalErrorAt();
      }
    }
    goto LABEL_30;
  }
  CFTypeID v11 = CFGetTypeID(a3);
  if (v11 == CFDataGetTypeID()
    && CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E4F1EFF0]))
  {
    uint64_t v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:0];
LABEL_28:
    MetadataObjectFromBoxedMetadata = (void *)v12;
    goto LABEL_30;
  }
  CFTypeID v13 = CFGetTypeID(a3);
  if (v13 == CFDictionaryGetTypeID())
  {
    if (CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E4F1F008]))
    {
      point.origin = (CGPoint)*MEMORY[0x1E4F1DAD8];
      CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)a3, &point.origin);
      uint64_t v12 = AVNSValueWithCGPoint(point.origin.x, point.origin.y);
      goto LABEL_28;
    }
    if (CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E4F1F028]))
    {
      CGSize v20 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      point.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      point.size = v20;
      CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)a3, &point);
      uint64_t v12 = AVNSValueWithCGRect(point.origin.x, point.origin.y, point.size.width, point.size.height);
      goto LABEL_28;
    }
    if (CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E4F1EFC8]))
    {
      point.origin = (CGPoint)*MEMORY[0x1E4F1DB30];
      CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)a3, (CGSize *)&point);
      uint64_t v12 = AVNSValueWithCGSize(point.origin.x, point.origin.y);
      goto LABEL_28;
    }
LABEL_29:
    MetadataObjectFromBoxedMetadata = a3;
    goto LABEL_30;
  }
  CFTypeID v14 = CFGetTypeID(a3);
  if (v14 != CFArrayGetTypeID()
    || !CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E4F1F010])&& !CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E4F1F018]))
  {
    goto LABEL_29;
  }
  MetadataObjectFromBoxedMetadata = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v15 = [a3 countByEnumeratingWithState:&v23 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    CGPoint v22 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(a3);
        }
        CFDictionaryRef v19 = *(const __CFDictionary **)(*((void *)&v23 + 1) + 8 * i);
        point.origin = v22;
        CGPointMakeWithDictionaryRepresentation(v19, &point.origin);
        objc_msgSend(MetadataObjectFromBoxedMetadata, "addObject:", AVNSValueWithCGPoint(point.origin.x, point.origin.y));
      }
      uint64_t v16 = [a3 countByEnumeratingWithState:&v23 objects:v34 count:16];
    }
    while (v16);
  }
LABEL_30:
  if (objc_msgSend(MetadataObjectFromBoxedMetadata, "conformsToProtocol:", &unk_1EE5E2580, v22)
    && [MetadataObjectFromBoxedMetadata conformsToProtocol:&unk_1EE5E4C90])
  {
    return (id)objc_msgSend(MetadataObjectFromBoxedMetadata, "copyWithZone:", -[AVMetadataItem zone](self, "zone"));
  }
  else
  {
    return 0;
  }
}

- (void)dealloc
{
  priv = self->_priv;
  if (priv)
  {
    reader = priv->reader;
    if (reader)
    {
      CFRelease(reader);
      priv = self->_priv;
    }

    CFRelease(self->_priv);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVMetadataItem;
  [(AVMetadataItem *)&v5 dealloc];
}

+ (AVMetadataKeySpace)keySpaceForIdentifier:(AVMetadataIdentifier)identifier
{
  if (!identifier) {
    return 0;
  }
  CFStringRef keySpaceOut = 0;
  if (CMMetadataCreateKeySpaceFromIdentifier((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)identifier, &keySpaceOut))
  {
    return 0;
  }
  else
  {
    return (AVMetadataKeySpace)(id)keySpaceOut;
  }
}

+ (id)keyForIdentifier:(AVMetadataIdentifier)identifier
{
  if (!identifier) {
    return 0;
  }
  CFTypeRef keyOut = 0;
  if (CMMetadataCreateKeyFromIdentifier((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)identifier, &keyOut)) {
    return 0;
  }
  else {
    return (id)(id)keyOut;
  }
}

+ (void)initialize
{
}

- (void)_makeValueReady
{
  CFTypeRef cf = 0;
  CFTypeRef v12 = 0;
  priv = self->_priv;
  reader = priv->reader;
  if (reader && !priv->value)
  {
    int64_t itemIndex = priv->itemIndex;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    v8 = *(uint64_t (**)(OpaqueFigMetadataReader *, void, void, int64_t, void, CFTypeRef *, CFTypeRef *))(v7 + 48);
    if (v8)
    {
      int v9 = v8(reader, 0, 0, itemIndex, *MEMORY[0x1E4F1CF80], &v12, &cf);
      CFTypeRef v10 = cf;
      if (!v9)
      {
        [(AVMetadataItem *)self _extractPropertiesFromDictionary:cf];
        self->_priv->CMTimeValue value = [(AVMetadataItem *)self _valueFromCFType:v12];
        CFTypeRef v10 = cf;
      }
      if (v10) {
        CFRelease(v10);
      }
    }
    if (v12) {
      CFRelease(v12);
    }
  }
}

- (void)_updateLanguageInformationFromLocale:(id)a3
{
  uint64_t v4 = (NSString *)[(id)AVExtendedLanguageTagFromLocale(a3) copy];

  self->_priv->extendedLanguageTag = v4;
  if (v4) {
    objc_super v5 = (NSString *)[(id)AVLanguageCodeFromExtendedLanguageTag(v4) copy];
  }
  else {
    objc_super v5 = 0;
  }
  self->_priv->languageCode = v5;
}

- (void)_updateLanguageInformationFromExtendedLanguageTag:(id)a3
{
  if (a3) {
    objc_super v5 = (NSLocale *)[MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:a3];
  }
  else {
    objc_super v5 = 0;
  }
  priv = self->_priv;
  locale = priv->locale;
  if (locale != v5)
  {

    self->_priv->locale = (NSLocale *)[(NSLocale *)v5 copy];
    priv = self->_priv;
  }

  if (a3) {
    v8 = (NSString *)[(id)AVLanguageCodeFromExtendedLanguageTag(a3) copy];
  }
  else {
    v8 = 0;
  }
  self->_priv->languageCode = v8;
}

- (id)_keyAsString
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return self->_priv->key;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  key = self->_priv->key;
  if (isKindOfClass)
  {
    unsigned int v6 = [key intValue];
    return (id)AVStringForOSType(v6);
  }
  else
  {
    return (id)[key description];
  }
}

- (NSString)stringValue
{
  v2 = [(AVMetadataItem *)self value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return (NSString *)[(NSString *)v2 stringValue];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      return (NSString *)[(NSString *)v2 absoluteString];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) == 0 || (dyld_program_sdk_at_least()) {
        return 0;
      }
      return [(NSString *)v2 description];
    }
  }
}

- (NSNumber)numberValue
{
  v3 = [(AVMetadataItem *)self value];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      objc_super v5 = [(AVMetadataItem *)self locale];
      if (v5) {
        [v4 setLocale:v5];
      }
      v3 = (NSNumber *)[v4 numberFromString:v3];
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (NSDate)dateValue
{
  v2 = [(AVMetadataItem *)self value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v3 = (void *)FigCFDateCreateFromString();
  return (NSDate *)v3;
}

- (NSData)dataValue
{
  v2 = [(AVMetadataItem *)self value];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || !v2) {
    return v2;
  }
  if (dyld_program_sdk_at_least()) {
    return 0;
  }
  id v4 = (void *)MEMORY[0x1E4F28F98];
  return (NSData *)[v4 dataWithPropertyList:v2 format:200 options:0 error:0];
}

- (CGImage)imageValue
{
  return 0;
}

+ (NSArray)metadataItemsFromArray:(NSArray *)metadataItems withLocale:(NSLocale *)locale
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = [(NSLocale *)locale localeIdentifier];
  return (NSArray *)objc_msgSend(a1, "metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:", metadataItems, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v7, 1));
}

+ (NSArray)metadataItemsFromArray:(NSArray *)metadataItems filteredAndSortedAccordingToPreferredLanguages:(NSArray *)preferredLanguages
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  AVAllAvailableNSBundleCompatibleLanguageTagsForObjects(metadataItems);
  unsigned int v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](preferredLanguages, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = [(NSArray *)preferredLanguages countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(preferredLanguages);
        }
        uint64_t v11 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifierFromString:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        if (v11) {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [(NSArray *)preferredLanguages countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v8);
  }
  id v12 = (id)FigCopyRankedLanguagesAccordingToPreferredLanguages();
  CFTypeID v13 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  CFTypeID v14 = (void *)[MEMORY[0x1E4F28E60] indexSet];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v15 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * j);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __88__AVMetadataItem_metadataItemsFromArray_filteredAndSortedAccordingToPreferredLanguages___block_invoke;
        v23[3] = &unk_1E57B2CB8;
        v23[4] = v19;
        CGSize v20 = [(NSArray *)metadataItems indexesOfObjectsPassingTest:v23];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __88__AVMetadataItem_metadataItemsFromArray_filteredAndSortedAccordingToPreferredLanguages___block_invoke_2;
        v22[3] = &unk_1E57B2CE0;
        v22[4] = v14;
        v22[5] = v13;
        v22[6] = metadataItems;
        [(NSIndexSet *)v20 enumerateIndexesUsingBlock:v22];
        [v14 addIndexes:v20];
      }
      uint64_t v16 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v16);
  }
  return v13;
}

uint64_t __88__AVMetadataItem_metadataItemsFromArray_filteredAndSortedAccordingToPreferredLanguages___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = [a2 unicodeLanguageIdentifier];
  if (!v4)
  {
    uint64_t v4 = [a2 unicodeLanguageCode];
    if (!v4) {
      return 0;
    }
  }
  objc_super v5 = *(void **)(a1 + 32);
  return [v5 isEqualToString:v4];
}

uint64_t __88__AVMetadataItem_metadataItemsFromArray_filteredAndSortedAccordingToPreferredLanguages___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) containsIndex:a2];
  if ((result & 1) == 0)
  {
    objc_super v5 = *(void **)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 48) objectAtIndex:a2];
    return [v5 addObject:v6];
  }
  return result;
}

+ (NSArray)metadataItemsFromArray:(NSArray *)metadataItems filteredByIdentifier:(AVMetadataIdentifier)identifier
{
  if ([(NSString *)+[AVMetadataItem keySpaceForIdentifier:identifier] isEqualToString:@"comn"])
  {
    id v7 = +[AVMetadataItem keyForIdentifier:identifier];
    return (NSArray *)[a1 metadataItemsFromArray:metadataItems withKey:v7 keySpace:@"comn"];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__AVMetadataItem_metadataItemsFromArray_filteredByIdentifier___block_invoke;
    v9[3] = &unk_1E57B2CB8;
    v9[4] = identifier;
    return [(NSArray *)metadataItems objectsAtIndexes:[(NSArray *)metadataItems indexesOfObjectsPassingTest:v9]];
  }
}

uint64_t __62__AVMetadataItem_metadataItemsFromArray_filteredByIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = *(void **)(a1 + 32);
  if (!v4) {
    return 1;
  }
  uint64_t v5 = [a2 identifier];
  return [v4 isEqualToString:v5];
}

+ (NSArray)metadataItemsFromArray:(NSArray *)metadataItems withKey:(id)key keySpace:(AVMetadataKeySpace)keySpace
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__AVMetadataItem_metadataItemsFromArray_withKey_keySpace___block_invoke;
  v6[3] = &unk_1E57B2D08;
  v6[4] = keySpace;
  v6[5] = key;
  return [(NSArray *)metadataItems objectsAtIndexes:[(NSArray *)metadataItems indexesOfObjectsPassingTest:v6]];
}

uint64_t __58__AVMetadataItem_metadataItemsFromArray_withKey_keySpace___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 keySpace];
  if ([*(id *)(a1 + 32) isEqualToString:@"comn"])
  {
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = [a2 commonKey];
    id v7 = (void *)v6;
    if (!v5) {
      return v6 != 0;
    }
    uint64_t v8 = v5;
    goto LABEL_5;
  }
  CFTypeRef v10 = *(void **)(a1 + 32);
  if (v10)
  {
    uint64_t result = [v10 isEqualToString:v4];
    if (!result) {
      return result;
    }
  }
  uint64_t v11 = (void *)[a2 key];
  id v12 = *(const void **)(a1 + 40);
  if (!v12) {
    return 1;
  }
  if (!v11) {
    return 0;
  }
  CFTypeID v13 = CFGetTypeID(v12);
  CFTypeID v14 = CFGetTypeID(v11);
  CFTypeID v15 = CFGetTypeID(*(CFTypeRef *)(a1 + 40));
  if (v13 != v14)
  {
    if (v15 == CFStringGetTypeID())
    {
      CFTypeID v17 = CFGetTypeID(v11);
      if (v17 == CFNumberGetTypeID())
      {
        uint64_t result = FigMetadataStringKeyToOSTypeKeyWithKeySpace();
        if (!result) {
          return result;
        }
        int v16 = 0;
        return v16 == [v11 intValue];
      }
    }
    return 0;
  }
  if (v15 == CFNumberGetTypeID()
    && (([v4 isEqualToString:@"udta"] & 1) != 0
     || [v4 isEqualToString:@"itsk"]))
  {
    int v16 = [*(id *)(a1 + 40) intValue];
    return v16 == [v11 intValue];
  }
  uint64_t v8 = *(void **)(a1 + 40);
  id v7 = v11;
LABEL_5:
  return [v8 isEqual:v7];
}

+ (id)metadataItemsFromArray:(id)a3 withStringValue:(id)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__AVMetadataItem_metadataItemsFromArray_withStringValue___block_invoke;
  v5[3] = &unk_1E57B2CB8;
  v5[4] = a4;
  return (id)objc_msgSend(a3, "objectsAtIndexes:", objc_msgSend(a3, "indexesOfObjectsPassingTest:", v5));
}

uint64_t __57__AVMetadataItem_metadataItemsFromArray_withStringValue___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 stringValue];
  return [v2 isEqualToString:v3];
}

+ (NSArray)metadataItemsFromArray:(NSArray *)metadataItems filteredByMetadataItemFilter:(AVMetadataItemFilter *)metadataItemFilter
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AVMetadataItemFilter *)metadataItemFilter whitelist];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](metadataItems, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v8 = [(NSArray *)metadataItems countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(metadataItems);
          }
          id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v13 = -[NSDictionary valueForKey:](v6, "valueForKey:", [v12 keySpace]);
          if (v13)
          {
            CFTypeID v14 = (void *)v13;
            CFTypeID v15 = (void *)[v12 key];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              CFTypeID v15 = (void *)AVStringForOSType([v15 unsignedIntValue]);
            }
            if ([v14 containsObject:v15]) {
              [v7 addObject:v12];
            }
          }
        }
        uint64_t v9 = [(NSArray *)metadataItems countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
    return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:v7];
  }
  else
  {
    CFTypeID v17 = (void *)MEMORY[0x1E4F1C978];
    return (NSArray *)[v17 array];
  }
}

- (id)_initWithReader:(OpaqueFigMetadataReader *)a3 itemIndex:(int64_t)a4
{
  uint64_t v6 = [(AVMetadataItem *)self init];
  id v7 = v6;
  if (v6)
  {
    v6->_priv->int64_t itemIndex = a4;
    v6->_priv->reader = (OpaqueFigMetadataReader *)CFRetain(a3);
    v7->_priv->preferredStorageLocation = (NSString *)[@"default" copy];
  }
  return v7;
}

+ (id)_metadataItemWithFigMetadataDictionary:(id)a3
{
  return (id)[a1 _metadataItemWithFigMetadataDictionary:a3 containerURL:0 securityOptions:0];
}

+ (id)_metadataItemWithFigMetadataDictionary:(id)a3 containerURL:(id)a4 securityOptions:(unsigned int)a5
{
  if (a4
    && ![a3 objectForKey:*MEMORY[0x1E4F33060]]
    && [a3 objectForKey:*MEMORY[0x1E4F33058]])
  {
    uint64_t v11 = [AVLazyValueLoadingMetadataItem alloc];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __86__AVMetadataItem__metadataItemWithFigMetadataDictionary_containerURL_securityOptions___block_invoke;
    v12[3] = &unk_1E57B2D30;
    v12[4] = a4;
    unsigned int v13 = a5;
    return [(AVLazyValueLoadingMetadataItem *)v11 _initWithFigMetadataDictionary:a3 valueLoadingHandler:v12];
  }
  else
  {
    uint64_t v9 = (void *)[objc_alloc((Class)a1) _initWithFigMetadataDictionary:a3];
    return v9;
  }
}

uint64_t __86__AVMetadataItem__metadataItemWithFigMetadataDictionary_containerURL_securityOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "metadataItem"), "extraAttributes"), "objectForKey:", @"URL");
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "metadataItem"), "extraAttributes"), "objectForKey:", @"baseURL");
  if (v3
    && ((uint64_t v5 = (void *)MEMORY[0x1E4F1CB10], !v4)
      ? (uint64_t v6 = 0)
      : (uint64_t v6 = [MEMORY[0x1E4F1CB10] URLWithString:v4]),
        (uint64_t v7 = [v5 URLWithString:v3 relativeToURL:v6]) != 0))
  {
    uint64_t v8 = v7;
    if (FigIsReferenceAllowedBySecurityPolicy())
    {
      uint64_t v9 = (void *)[MEMORY[0x1E4F18DC0] sharedSession];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __AVMetadataItemLoadValueFromURI_block_invoke;
      v13[3] = &unk_1E57B2DC8;
      v13[4] = a2;
      v13[5] = v8;
      return objc_msgSend((id)objc_msgSend(v9, "dataTaskWithURL:completionHandler:", v8, v13), "resume");
    }
    uint64_t v11 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:v8 forKey:*MEMORY[0x1E4F289D0]];
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = AVLocalizedError(@"AVFoundationErrorDomain", -11842, v11);
  return [a2 respondWithError:v12];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  [(AVMetadataItem *)self _makeValueReady];
  [(AVMetadataItem *)self _makePropertiesReady];
  uint64_t v5 = +[AVMutableMetadataItem allocWithZone:a3];
  id v6 = [(AVMetadataItem *)self _figMetadataDictionary];
  return [(AVMetadataItem *)v5 _initWithFigMetadataDictionary:v6];
}

- (id)description
{
  [(AVMetadataItem *)self _makeValueReady];
  [(AVMetadataItem *)self _makePropertiesReady];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  priv = self->_priv;
  if (isKindOfClass) {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @" length=%lu", -[NSObject length](priv->value, "length"));
  }
  else {
    uint64_t v5 = [NSString stringWithFormat:@"=%@", priv->value];
  }
  uint64_t v26 = v5;
  long long v27 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  long long v25 = NSStringFromClass(v6);
  uint64_t v7 = [(AVMetadataItem *)self identifier];
  uint64_t keySpace = self->_priv->keySpace;
  long long v24 = v7;
  [(AVMetadataItem *)self key];
  uint64_t v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  id v10 = [(AVMetadataItem *)self _keyAsString];
  uint64_t v11 = self->_priv;
  commonKey = v11->commonKey;
  extendedLanguageTag = v11->extendedLanguageTag;
  dataType = v11->dataType;
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime time = (CMTime)v11->time;
  CFStringRef v16 = (id)CMTimeCopyDescription(v15, &time);
  CMTime time = (CMTime)self->_priv->duration;
  CFStringRef v17 = (id)CMTimeCopyDescription(v15, &time);
  long long v18 = self->_priv;
  startDate = v18->startDate;
  extras = v18->extras;
  long long v21 = (objc_class *)objc_opt_class();
  return (id)[v27 stringWithFormat:@"<%@: %p, identifier=%@, keySpace=%@, key class = %@, key=%@, commonKey=%@, extendedLanguageTag=%@, dataType=%@, time=%@, duration=%@, startDate=%@, extras=%@, value class=%@, value%@>", v25, self, v24, keySpace, v9, v10, commonKey, extendedLanguageTag, dataType, v16, v17, startDate, extras, NSStringFromClass(v21), v26];
}

- (id)intrinsicAttributesOfExtraAttributes:(id)a3
{
  id v3 = (id)[a3 mutableCopy];
  [v3 removeObjectForKey:*MEMORY[0x1E4F32FF0]];
  [v3 removeObjectForKey:*MEMORY[0x1E4F32FF8]];
  [v3 removeObjectForKey:*MEMORY[0x1E4F32FE0]];
  [v3 removeObjectForKey:*MEMORY[0x1E4F32FE8]];
  return v3;
}

- (BOOL)_areExtraAttributesOf:(id)a3 comparableToExtraAttributesOf:(id)a4
{
  id v6 = [(AVMetadataItem *)self intrinsicAttributesOfExtraAttributes:a3];
  id v7 = [(AVMetadataItem *)self intrinsicAttributesOfExtraAttributes:a4];
  if (![v6 count] && !objc_msgSend(v7, "count")) {
    return 1;
  }
  return [v6 isEqualToDictionary:v7];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    uint64_t v28 = v3;
    uint64_t v29 = v4;
    if (!a3) {
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    id v7 = [(AVMetadataItem *)self key];
    uint64_t v8 = [a3 key];
    uint64_t v9 = [(AVMetadataItem *)self keySpace];
    uint64_t v10 = [a3 keySpace];
    uint64_t v11 = [(AVMetadataItem *)self locale];
    uint64_t v12 = [a3 locale];
    memset(&v27[1], 0, sizeof(CMTime));
    if (self)
    {
      [(AVMetadataItem *)self time];
      memset(v27, 0, 24);
      [a3 time];
      memset(&v26, 0, sizeof(v26));
      [(AVMetadataItem *)self duration];
    }
    else
    {
      memset(v27, 0, 24);
      [a3 time];
      memset(&v26, 0, sizeof(v26));
    }
    memset(&v25, 0, sizeof(v25));
    [a3 duration];
    CGPoint v22 = [(AVMetadataItem *)self startDate];
    uint64_t v14 = [a3 startDate];
    id v21 = [(AVMetadataItem *)self value];
    uint64_t v20 = [a3 value];
    long long v18 = [(AVMetadataItem *)self extraAttributes];
    uint64_t v17 = [a3 extraAttributes];
    id v19 = [(AVMetadataItem *)self preferredStorageLocation];
    uint64_t v15 = [a3 preferredStorageLocation];
    if (((v7 == (id)v8 || [v7 isEqual:v8])
       && (v9 == (NSString *)v10 || ([(NSString *)v9 isEqual:v10] & 1) != 0)
       || (int v13 = -[NSString isEqualToString:](-[AVMetadataItem identifier](self, "identifier"), "isEqualToString:", [a3 identifier])) != 0)&& (v11 == (NSLocale *)v12 || (int v13 = -[NSLocale isEqual:](v11, "isEqual:", v12)) != 0))
    {
      CMTime time1 = v27[1];
      CMTime time2 = v27[0];
      if (CMTimeCompare(&time1, &time2) || (time1 = v26, CMTime time2 = v25, CMTimeCompare(&time1, &time2)))
      {
LABEL_17:
        LOBYTE(v13) = 0;
        return v13;
      }
      if ((v22 == (NSDate *)v14 || (int v13 = [(NSDate *)v22 isEqual:v14]) != 0)
        && (v21 == (id)v20 || (int v13 = objc_msgSend(v21, "isEqual:")) != 0)
        && (v19 == (id)v15 || (int v13 = [v19 isEqualToString:v15]) != 0))
      {
        LOBYTE(v13) = v18 == (NSDictionary *)v17
                   || -[AVMetadataItem _areExtraAttributesOf:comparableToExtraAttributesOf:](self, "_areExtraAttributesOf:comparableToExtraAttributesOf:");
      }
    }
  }
  return v13;
}

- (unint64_t)hash
{
  if ([(AVMetadataItem *)self identifier])
  {
    NSUInteger v3 = [(NSString *)[(AVMetadataItem *)self identifier] hash];
  }
  else
  {
    uint64_t v4 = objc_msgSend(-[AVMetadataItem key](self, "key"), "hash");
    NSUInteger v3 = [(NSString *)[(AVMetadataItem *)self keySpace] hash] ^ v4;
  }
  uint64_t v5 = [(NSLocale *)[(AVMetadataItem *)self locale] hash];
  if (self) {
    [(AVMetadataItem *)self time];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v7 = [(__CFDictionary *)CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]) hash];
  if (self) {
    [(AVMetadataItem *)self duration];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  NSUInteger v8 = v5 ^ v3 ^ v7;
  uint64_t v9 = [(__CFDictionary *)CMTimeCopyAsDictionary(&v13, v6) hash];
  uint64_t v10 = v8 ^ v9 ^ [(NSDate *)[(AVMetadataItem *)self startDate] hash];
  uint64_t v11 = objc_msgSend(-[AVMetadataItem value](self, "value"), "hash");
  return v10 ^ v11 ^ objc_msgSend(-[AVMetadataItem intrinsicAttributesOfExtraAttributes:](self, "intrinsicAttributesOfExtraAttributes:", -[AVMetadataItem extraAttributes](self, "extraAttributes")), "hash");
}

+ (id)_metadataArrayWithSmartDeferredLoadingForMetataArray:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v7) {
    return v6;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v17;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(a3);
      }
      uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      if (-[NSString isEqualToString:](+[AVMetadataItem identifierForKey:keySpace:](AVMetadataItem, "identifierForKey:keySpace:", [v11 key], objc_msgSend(v11, "keySpace")), "isEqualToString:", @"mdta/com.apple.quicktime.aime-data"))
      {
        id v12 = (id)[v11 mutableCopy];
        if ([v12 _preferredStorageLocationWasSet])
        {
          if (objc_msgSend((id)objc_msgSend(v11, "preferredStorageLocation"), "isEqualToString:", @"default"))
          {
            CMTime v13 = @"Invalid metadata key specified for default storage location.";
LABEL_16:
            uint64_t v14 = (void *)AVErrorForClientProgrammingError([MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0]);
            if (v14)
            {
              CFAllocatorRef v6 = 0;
              if (a4) {
                *a4 = v14;
              }
            }
            return v6;
          }
        }
        else
        {
          [v12 setPreferredStorageLocation:@"forDeferredLoading"];
        }
      }
      else
      {
        id v12 = v11;
        if (objc_msgSend((id)objc_msgSend(v11, "preferredStorageLocation"), "isEqualToString:", @"forDeferredLoading"))
        {
          CMTime v13 = @"Invalid metadata key specified for deferred loading.";
          goto LABEL_16;
        }
      }
      [v6 addObject:v12];
    }
    uint64_t v8 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8) {
      continue;
    }
    return v6;
  }
}

- (id)_figMetadataFormat
{
  if ([(NSString *)self->_priv->keySpace isEqualToString:@"mdta"])
  {
    NSUInteger v3 = (id *)&AVMetadataFormatQuickTimeMetadata;
    return *v3;
  }
  if ([(NSString *)self->_priv->keySpace isEqualToString:@"udta"])
  {
    NSUInteger v3 = (id *)&AVMetadataFormatQuickTimeUserData;
    return *v3;
  }
  if ([(NSString *)self->_priv->keySpace isEqualToString:@"uiso"])
  {
    NSUInteger v3 = (id *)&AVMetadataFormatISOUserData;
    return *v3;
  }
  if ([(NSString *)self->_priv->keySpace isEqualToString:@"itsk"]
    || [(NSString *)self->_priv->keySpace isEqualToString:@"itlk"])
  {
    NSUInteger v3 = (id *)&AVMetadataFormatiTunesMetadata;
    return *v3;
  }
  if ([(NSString *)self->_priv->keySpace isEqualToString:@"org.id3"]) {
    return @"org.id3";
  }
  else {
    return 0;
  }
}

- (id)_figMetadataSpecificationReturningError:(id *)a3
{
  uint64_t v5 = [(AVMetadataItem *)self identifier];
  id v6 = [(AVMetadataItem *)self _serializationDataType];
  id v7 = [(AVMetadataItem *)self _conformingDataTypes];
  uint64_t v8 = [(AVMetadataItem *)self extendedLanguageTag];
  if (!v6)
  {
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"Metadata item %p has no data type", self, v19, v20);
LABEL_11:
    CMTime v13 = (void *)AVErrorForClientProgrammingError([MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v14 userInfo:0]);
    id v12 = 0;
    goto LABEL_12;
  }
  if (!v5)
  {
    uint64_t v15 = NSString;
    long long v16 = (objc_class *)objc_opt_class();
    long long v17 = NSStringFromClass(v16);
    uint64_t v14 = [v15 stringWithFormat:@"Metadata item %p has no identifier.  If the item was given a key and key space, use +[%@ %@] to check whether an identifier can be made from that key and key space", self, v17, NSStringFromSelector(sel_identifierForKey_keySpace_)];
    goto LABEL_11;
  }
  uint64_t v9 = v8;
  id v10 = [(AVMetadataItem *)self value];
  DependentSpecificationsForValue = (void *)softLinkAVMetadataMakeDependentSpecificationsForValue((uint64_t)v10);
  id v12 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v12 setObject:v5 forKey:*MEMORY[0x1E4F1F108]];
  [v12 setObject:v6 forKey:*MEMORY[0x1E4F1F0F8]];
  if ([v7 count]) {
    [v12 setObject:v7 forKey:*MEMORY[0x1E4F217B0]];
  }
  if (v9) {
    [v12 setObject:v9 forKey:*MEMORY[0x1E4F1F100]];
  }
  CMTime v13 = (void *)[DependentSpecificationsForValue count];
  if (v13)
  {
    [v12 setObject:DependentSpecificationsForValue forKey:*MEMORY[0x1E4F217B8]];
    CMTime v13 = 0;
  }
LABEL_12:
  if (a3 && !v12) {
    *a3 = v13;
  }
  return v12;
}

- (id)_createJSONEncodedDataFromValue:(id)a3 error:(id *)a4
{
  if (objc_msgSend(MEMORY[0x1E4F28D90], "isValidJSONObject:"))
  {
    id v6 = (void *)MEMORY[0x1E4F28D90];
    return (id)[v6 dataWithJSONObject:a3 options:0 error:a4];
  }
  else
  {
    if (a4) {
      *a4 = (id)AVErrorForClientProgrammingError([MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"+[NSJSONSerialization isValidJSONObject:] returned NO for the AVMetadataItem's value" userInfo:0]);
    }
    return 0;
  }
}

+ (BOOL)_clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace
{
  return dyld_program_sdk_at_least() ^ 1;
}

+ (id)_isoUserDataKeysRequiringKeySpaceConversion
{
  if (_isoUserDataKeysRequiringKeySpaceConversion_onceToken != -1) {
    dispatch_once(&_isoUserDataKeysRequiringKeySpaceConversion_onceToken, &__block_literal_global_1);
  }
  return (id)_isoUserDataKeysRequiringKeySpaceConversion_conversionList;
}

uint64_t __61__AVMetadataItem__isoUserDataKeysRequiringKeySpaceConversion__block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"cprt", @"auth", @"perf", @"gnre", @"yrrc", @"loci", @"titl", @"dscp", 0);
  _isoUserDataKeysRequiringKeySpaceConversion_conversionList = result;
  return result;
}

+ (id)_replaceQuickTimeUserDataKeySpaceWithISOUserDataKeySpaceIfRequired:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (+[AVMetadataItem _clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace])
  {
    id v4 = +[AVMetadataItem _isoUserDataKeysRequiringKeySpaceConversion];
  }
  else
  {
    id v4 = (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"cprt"];
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(a3);
        }
        id v11 = *(id *)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v11, "keySpace"), "isEqualToString:", @"udta"))
        {
          [v11 key];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          uint64_t v13 = [v11 key];
          if (isKindOfClass)
          {
            if ([v5 containsObject:v13]) {
              goto LABEL_15;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && objc_msgSend(v5, "containsObject:", AVStringForOSType(objc_msgSend((id)objc_msgSend(v11, "key"), "intValue"))))
            {
LABEL_15:
              id v11 = (id)[v11 mutableCopy];
              [v11 setKeySpace:@"uiso"];
            }
          }
        }
        [v6 addObject:v11];
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  return v6;
}

+ (id)_figMetadataPropertyFromMetadataItems:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  id v6 = +[AVMetadataItem _replaceQuickTimeUserDataKeySpaceWithISOUserDataKeySpaceIfRequired:a3];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v12 = [v11 _figMetadataFormat];
        uint64_t v13 = [v11 _figMetadataDictionaryWithValue:1 diviningValueDataType:1];
        uint64_t v14 = (void *)v4;
        if (v12)
        {
          uint64_t v14 = (void *)[v5 valueForKey:v12];
          if (!v14)
          {
            uint64_t v14 = (void *)[MEMORY[0x1E4F1CA48] array];
            [v5 setValue:v14 forKey:v12];
          }
        }
        [v14 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v8);
  }
  long long v24 = (void *)v4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v15 = (void *)[v5 allKeys];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    uint64_t v19 = *MEMORY[0x1E4F33070];
    uint64_t v20 = *MEMORY[0x1E4F33068];
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(v23, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(v5, "valueForKey:", *(void *)(*((void *)&v25 + 1) + 8 * j)), v19, *(void *)(*((void *)&v25 + 1) + 8 * j), v20, 0));
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v17);
  }
  if ([v24 count]) {
    objc_msgSend(v23, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v24, *MEMORY[0x1E4F33070], 0));
  }
  if ([v23 count]) {
    return v23;
  }
  else {
    return 0;
  }
}

- (id)key
{
  return self->_priv->key;
}

- (AVMetadataKey)commonKey
{
  return self->_priv->commonKey;
}

- (AVMetadataKeySpace)keySpace
{
  return self->_priv->keySpace;
}

- (AVMetadataIdentifier)identifier
{
  return self->_priv->identifier;
}

- (NSLocale)locale
{
  return self->_priv->locale;
}

- (NSString)extendedLanguageTag
{
  return self->_priv->extendedLanguageTag;
}

- (id)unicodeLanguageIdentifier
{
  id result = [(AVMetadataItem *)self extendedLanguageTag];
  if (result)
  {
    id v3 = result;
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA20];
    return (id)[v4 canonicalLocaleIdentifierFromString:v3];
  }
  return result;
}

- (id)languageCode
{
  return self->_priv->languageCode;
}

- (id)unicodeLanguageCode
{
  id result = [(AVMetadataItem *)self languageCode];
  if (result)
  {
    id v3 = result;
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA20];
    return (id)[v4 canonicalLocaleIdentifierFromString:v3];
  }
  return result;
}

- (CMTime)time
{
  uint64_t v4 = *(void *)&self->timescale;
  if ((*(unsigned char *)(v4 + 100) & 1) == 0)
  {
    uint64_t v5 = self;
    self = (CMTime *)[(CMTime *)self _makePropertiesReady];
    uint64_t v4 = *(void *)&v5->timescale;
  }
  *(_OWORD *)&retstr->CMTimeValue value = *(_OWORD *)(v4 + 88);
  retstr->epoch = *(void *)(v4 + 104);
  return self;
}

- (CMTime)duration
{
  uint64_t v4 = *(void *)&self->timescale;
  if ((*(unsigned char *)(v4 + 124) & 1) == 0)
  {
    uint64_t v5 = self;
    self = (CMTime *)[(CMTime *)self _makePropertiesReady];
    uint64_t v4 = *(void *)&v5->timescale;
  }
  *(_OWORD *)&retstr->CMTimeValue value = *(_OWORD *)(v4 + 112);
  retstr->epoch = *(void *)(v4 + 128);
  return self;
}

- (NSDate)startDate
{
  return self->_priv->startDate;
}

- (id)value
{
  [(AVMetadataItem *)self _makeValueReady];
  id v3 = self->_priv->value;
  return v3;
}

- (NSString)dataType
{
  return self->_priv->dataType;
}

+ (id)dataTypeForValue:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    switch(CFNumberGetType((CFNumberRef)a3))
    {
      case kCFNumberSInt8Type:
LABEL_4:
        id v6 = (id *)MEMORY[0x1E4F1F048];
        return *v6;
      case kCFNumberSInt16Type:
LABEL_19:
        id v6 = (id *)MEMORY[0x1E4F1F030];
        return *v6;
      case kCFNumberSInt32Type:
LABEL_20:
        id v6 = (id *)MEMORY[0x1E4F1F038];
        return *v6;
      case kCFNumberSInt64Type:
LABEL_21:
        id v6 = (id *)MEMORY[0x1E4F1F040];
        return *v6;
      case kCFNumberFloat32Type:
        goto LABEL_17;
      case kCFNumberFloat64Type:
        goto LABEL_23;
      case kCFNumberCharType:
      case kCFNumberShortType:
      case kCFNumberIntType:
      case kCFNumberLongType:
      case kCFNumberLongLongType:
      case kCFNumberCFIndexType:
      case kCFNumberNSIntegerType:
        CFIndex ByteSize = CFNumberGetByteSize((CFNumberRef)a3);
        id result = 0;
        switch(ByteSize)
        {
          case 1:
            goto LABEL_4;
          case 2:
            goto LABEL_19;
          case 4:
            goto LABEL_20;
          case 8:
            goto LABEL_21;
          default:
            return result;
        }
        return result;
      case kCFNumberFloatType:
      case kCFNumberDoubleType:
      case kCFNumberCGFloatType:
        CFIndex v8 = CFNumberGetByteSize((CFNumberRef)a3);
        if (v8 == 8)
        {
LABEL_23:
          id v6 = (id *)MEMORY[0x1E4F1EFD8];
        }
        else
        {
          if (v8 != 4) {
            return 0;
          }
LABEL_17:
          id v6 = (id *)MEMORY[0x1E4F1EFD0];
        }
        break;
      default:
        return 0;
    }
    return *v6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [a3 fastestEncoding];
    if (v7 == 10 || v7 == 2483028224 || v7 == 2415919360) {
      id v6 = (id *)MEMORY[0x1E4F1F070];
    }
    else {
      id v6 = (id *)MEMORY[0x1E4F1F078];
    }
    return *v6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (id *)MEMORY[0x1E4F1F020];
    return *v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (AVCGPointFromNSValue(a3, 0))
  {
    id v6 = (id *)MEMORY[0x1E4F1F008];
    return *v6;
  }
  if (AVCGRectFromNSValue(a3, 0))
  {
    id v6 = (id *)MEMORY[0x1E4F1F028];
    return *v6;
  }
  if (AVCGSizeFromNSValue(a3, 0)) {
    return (id)*MEMORY[0x1E4F1EFC8];
  }
  else {
    return 0;
  }
}

- (id)_serializationDataType
{
  id result = [(AVMetadataItem *)self dataType];
  if (!result)
  {
    uint64_t v4 = objc_opt_class();
    id v5 = [(AVMetadataItem *)self value];
    return (id)[v4 dataTypeForValue:v5];
  }
  return result;
}

- (NSDictionary)extraAttributes
{
  return self->_priv->extras;
}

- (id)_conformingDataTypes
{
  v2 = [(AVMetadataItem *)self extraAttributes];
  uint64_t v3 = *MEMORY[0x1E4F32FE0];
  return [(NSDictionary *)v2 objectForKey:v3];
}

- (AVKeyValueStatus)statusOfValueForKey:(NSString *)key error:(NSError *)outError
{
  return 2;
}

- (void)loadValuesAsynchronouslyForKeys:(NSArray *)keys completionHandler:(void *)handler
{
  if (handler) {
    (*((void (**)(void *))handler + 2))(handler);
  }
}

+ (AVMetadataItem)metadataItemWithPropertiesOfMetadataItem:(AVMetadataItem *)metadataItem valueLoadingHandler:(void *)handler
{
  return (AVMetadataItem *)+[AVLazyValueLoadingMetadataItem metadataItemWithPropertiesOfMetadataItem:metadataItem valueLoadingHandler:handler];
}

+ (id)metadataItemsFromArray:(id)a3 filteredByIdentifiers:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(a3);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 identifier]
          && objc_msgSend(a4, "containsObject:", objc_msgSend(v11, "identifier")))
        {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return (id)[v6 copy];
}

@end