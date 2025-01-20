@interface CLKTextProvider
+ (BOOL)supportsSecureCoding;
+ (CLKTextProvider)localizableTextProviderWithStringsFileFormatKey:(NSString *)formatKey textProviders:(NSArray *)textProviders;
+ (CLKTextProvider)localizableTextProviderWithStringsFileTextKey:(NSString *)textKey;
+ (CLKTextProvider)localizableTextProviderWithStringsFileTextKey:(NSString *)textKey shortTextKey:(NSString *)shortTextKey;
+ (CLKTextProvider)new;
+ (CLKTextProvider)providerWithJSONObjectRepresentation:(id)a3;
+ (CLKTextProvider)textProviderWithFormat:(NSString *)format;
+ (CLKTextProvider)textProviderWithFormat:(id)a3 arguments:(char *)a4;
- (BOOL)_validate;
- (BOOL)ignoreUppercaseStyle;
- (BOOL)isEqual:(id)a3;
- (BOOL)italicized;
- (BOOL)monospacedNumbers;
- (BOOL)paused;
- (CGSize)minimumSizeWithStyle:(id)a3 now:(id)a4;
- (CLKTextProvider)initWithCoder:(id)a3;
- (NSArray)fontFeatures;
- (NSNumber)trackingAttribute;
- (NSString)accessibilityLabel;
- (UIColor)tintColor;
- (id)JSONObjectRepresentation;
- (id)_addTrackingAttribute:(id)a3 tracking:(id)a4;
- (id)_cacheForKey:(id)a3;
- (id)_defaultCache;
- (id)_description;
- (id)_initWithJSONObjectRepresentation:(id)a3;
- (id)_italicize:(id)a3;
- (id)_monospacedNumbers:(id)a3;
- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4;
- (id)_sessionCacheKey;
- (id)_timeFormatByRemovingDesignatorOfTimeFormat:(id)a3;
- (id)_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:(id)a3 andRemovingDesignator:(BOOL)a4 designatorExists:(BOOL *)a5;
- (id)_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:(id)a3 designatorExists:(BOOL *)a4;
- (id)attributedString;
- (id)attributedTextAndSize:(CGSize *)a3 forMaxWidth:(double)a4 withStyle:(id)a5 now:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)finalizedCopy;
- (id)initPrivate;
- (id)sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4;
- (id)startUpdatesWithHandler:(id)a3;
- (int64_t)_updateFrequency;
- (int64_t)shrinkTextPreference;
- (int64_t)timeTravelUpdateFrequency;
- (unint64_t)hash;
- (void)_commonInit;
- (void)_localeChanged;
- (void)_maybeStartOrStopUpdates;
- (void)_pruneCacheKeysIfNecessary;
- (void)_update;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)finalize;
- (void)setAccessibilityLabel:(NSString *)accessibilityLabel;
- (void)setFontFeatures:(id)a3;
- (void)setIgnoreUppercaseStyle:(BOOL)a3;
- (void)setItalicized:(BOOL)a3;
- (void)setMonospacedNumbers:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setShrinkTextPreference:(int64_t)a3;
- (void)setTimeTravelUpdateFrequency:(int64_t)a3;
- (void)setTintColor:(UIColor *)tintColor;
- (void)setTrackingAttribute:(id)a3;
- (void)stopUpdatesForToken:(id)a3;
@end

@implementation CLKTextProvider

+ (CLKTextProvider)localizableTextProviderWithStringsFileTextKey:(NSString *)textKey
{
  return (CLKTextProvider *)[a1 localizableTextProviderWithStringsFileTextKey:textKey shortTextKey:0];
}

+ (CLKTextProvider)localizableTextProviderWithStringsFileTextKey:(NSString *)textKey shortTextKey:(NSString *)shortTextKey
{
  v5 = shortTextKey;
  v6 = textKey;
  v7 = [[CLKLocalizableSimpleTextProvider alloc] initWithTextKey:v6 shortTextKey:v5];

  return (CLKTextProvider *)v7;
}

+ (CLKTextProvider)localizableTextProviderWithStringsFileFormatKey:(NSString *)formatKey textProviders:(NSArray *)textProviders
{
  v5 = textProviders;
  v6 = formatKey;
  v7 = [[CLKLocalizableCompoundTextProvider alloc] initWithFormatKey:v6 textProviders:v5];

  return (CLKTextProvider *)v7;
}

+ (CLKTextProvider)textProviderWithFormat:(NSString *)format
{
  va_start(va, format);
  v3 = [a1 textProviderWithFormat:format arguments:va];

  return (CLKTextProvider *)v3;
}

+ (CLKTextProvider)textProviderWithFormat:(id)a3 arguments:(char *)a4
{
  id v5 = a3;
  v6 = [[CLKCompoundTextProvider alloc] initWithFormat:v5 arguments:a4];

  return (CLKTextProvider *)v6;
}

- (id)initPrivate
{
  v5.receiver = self;
  v5.super_class = (Class)CLKTextProvider;
  v2 = [(CLKTextProvider *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CLKTextProvider *)v2 _commonInit];
  }
  return v3;
}

+ (CLKTextProvider)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CLKTextProvider;
  return (CLKTextProvider *)objc_msgSendSuper2(&v3, "new");
}

- (void)_commonInit
{
  self->_paused = 1;
  objc_super v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  updateHandlersByToken = self->_updateHandlersByToken;
  self->_updateHandlersByToken = v3;

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__localeChanged name:*MEMORY[0x263EFF458] object:0];
}

- (void)dealloc
{
  __26__CLKTextProvider_dealloc__block_invoke((uint64_t)self, self->_secondTimerToken);
  __26__CLKTextProvider_dealloc__block_invoke(v3, self->_minuteTimerToken);
  __26__CLKTextProvider_dealloc__block_invoke(v4, self->_30fpsTimerToken);
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263EFF458] object:0];

  v6.receiver = self;
  v6.super_class = (Class)CLKTextProvider;
  [(CLKTextProvider *)&v6 dealloc];
}

void __26__CLKTextProvider_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (v2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __26__CLKTextProvider_dealloc__block_invoke_2;
    v5[3] = &unk_26440E580;
    id v6 = v2;
    uint64_t v4 = (void (**)(void))MEMORY[0x21D4AACC0](v5);
    if ([MEMORY[0x263F08B88] isMainThread]) {
      v4[2](v4);
    }
    else {
      dispatch_async(MEMORY[0x263EF83A0], v4);
    }
  }
}

void __26__CLKTextProvider_dealloc__block_invoke_2(uint64_t a1)
{
  id v2 = +[CLKClockTimer sharedInstance];
  [v2 stopUpdatesForToken:*(void *)(a1 + 32)];
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    [(CLKTextProvider *)self _maybeStartOrStopUpdates];
  }
}

- (id)attributedString
{
  id v2 = objc_opt_new();

  return v2;
}

- (id)attributedTextAndSize:(CGSize *)a3 forMaxWidth:(double)a4 withStyle:(id)a5 now:(id)a6
{
  id v10 = a5;
  if (a4 >= 0.00000011920929)
  {
    [(CLKTextProvider *)self _startSessionWithDate:a6];
    v12 = [(CLKTextProvider *)self _sessionCacheKey];
    v13 = [(CLKTextProvider *)self _cacheForKey:v12];

    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __67__CLKTextProvider_attributedTextAndSize_forMaxWidth_withStyle_now___block_invoke;
    v18 = &unk_26440EC68;
    v19 = self;
    id v20 = v10;
    v11 = [v13 attributedStringAndSize:a3 forMaxWidth:v20 withStyle:&v15 generator:a4];
    [(CLKTextProvider *)self _endSession];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __67__CLKTextProvider_attributedTextAndSize_forMaxWidth_withStyle_now___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _sessionAttributedTextForIndex:a2 withStyle:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 75))
  {
    uint64_t v5 = [(id)v4 _italicize:v3];
  }
  else if (*(unsigned char *)(v4 + 76))
  {
    uint64_t v5 = [(id)v4 _monospacedNumbers:v3];
  }
  else
  {
    if (!*(void *)(v4 + 96)) {
      goto LABEL_8;
    }
    uint64_t v5 = objc_msgSend((id)v4, "_addTrackingAttribute:tracking:", v3);
  }
  id v6 = (void *)v5;

  uint64_t v3 = v6;
LABEL_8:

  return v3;
}

- (CGSize)minimumSizeWithStyle:(id)a3 now:(id)a4
{
  double v7 = 0.0;
  double v8 = 0.0;
  id v4 = [(CLKTextProvider *)self attributedTextAndSize:&v7 forMaxWidth:a3 withStyle:a4 now:0.00000011920929];
  double v5 = v7;
  double v6 = v8;
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  id v6 = a4;
  double v7 = [(CLKTextProvider *)self _sessionCacheKey];
  double v8 = [(CLKTextProvider *)self _cacheForKey:v7];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__CLKTextProvider_sessionAttributedTextForIndex_withStyle___block_invoke;
  v12[3] = &unk_26440EC68;
  v12[4] = self;
  id v13 = v6;
  id v9 = v6;
  id v10 = [v8 attributedStringForIndex:a3 withStyle:v9 generator:v12];

  return v10;
}

uint64_t __59__CLKTextProvider_sessionAttributedTextForIndex_withStyle___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _sessionAttributedTextForIndex:a2 withStyle:*(void *)(a1 + 40)];
}

- (void)finalize
{
  self->_finalized = 1;
}

- (id)finalizedCopy
{
  if (self->_finalized)
  {
    id v2 = self;
  }
  else
  {
    id v2 = (CLKTextProvider *)[(CLKTextProvider *)self copy];
    [(CLKTextProvider *)v2 finalize];
  }

  return v2;
}

- (id)startUpdatesWithHandler:(id)a3
{
  id v4 = NSNumber;
  unint64_t nextUpdateToken = self->_nextUpdateToken;
  id v6 = a3;
  double v7 = [v4 numberWithUnsignedInteger:nextUpdateToken];
  updateHandlersByToken = self->_updateHandlersByToken;
  ++self->_nextUpdateToken;
  id v9 = (void *)[v6 copy];

  [(NSMutableDictionary *)updateHandlersByToken setObject:v9 forKey:v7];
  [(CLKTextProvider *)self _maybeStartOrStopUpdates];

  return v7;
}

- (void)stopUpdatesForToken:(id)a3
{
  [(NSMutableDictionary *)self->_updateHandlersByToken removeObjectForKey:a3];

  [(CLKTextProvider *)self _maybeStartOrStopUpdates];
}

- (id)description
{
  uint64_t v3 = +[CLKCompoundTextProvider compoundTextProviderCurrentlyFormattingOnThisThread];
  id v4 = v3;
  if (v3)
  {
    id v8 = 0;
    [v3 addTextProvider:self andGetPlaceholderString:&v8];
    id v5 = v8;
  }
  else
  {
    id v5 = [(CLKTextProvider *)self _description];
  }
  id v6 = v5;

  return v6;
}

- (id)_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:(id)a3 designatorExists:(BOOL *)a4
{
  return [(CLKTextProvider *)self _timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:a3 andRemovingDesignator:0 designatorExists:a4];
}

- (id)_timeFormatByRemovingDesignatorOfTimeFormat:(id)a3
{
  return [(CLKTextProvider *)self _timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:a3 andRemovingDesignator:1 designatorExists:0];
}

- (id)_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:(id)a3 andRemovingDesignator:(BOOL)a4 designatorExists:(BOOL *)a5
{
  BOOL v6 = a4;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  unint64_t v8 = 0x263F08000uLL;
  [MEMORY[0x263F08790] _componentsFromFormatString:v7];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    v40 = a5;
    id v41 = v7;
    uint64_t v12 = *(void *)v45;
    uint64_t v13 = *MEMORY[0x263EFF468];
    uint64_t v14 = *MEMORY[0x263EFF470];
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v17 = [v16 objectForKeyedSubscript:v13];
        if (([v17 BOOLValue] & 1) == 0)
        {
          v18 = [v16 objectForKeyedSubscript:v14];
          if ([v18 hasPrefix:@"a"])
          {
            unint64_t v19 = [v9 indexOfObject:v16];

            goto LABEL_13;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
    a5 = v40;
    id v7 = v41;
    unint64_t v8 = 0x263F08000;
  }
  else
  {
    unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (a5) {
    *a5 = v19 != 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_41;
  }
  if (!CLKDesignatorRequiresWhitespace() || v6)
  {
    if (v19)
    {
      v21 = [v9 objectAtIndexedSubscript:v19 - 1];
      v22 = [v21 objectForKeyedSubscript:*MEMORY[0x263EFF468]];
      if ([v22 BOOLValue])
      {
        v23 = [v21 objectForKeyedSubscript:*MEMORY[0x263EFF470]];
        [MEMORY[0x263F08708] whitespaceCharacterSet];
        v25 = id v24 = v7;
        [v23 stringByTrimmingCharactersInSet:v25];
        v26 = BOOL v42 = v6;

        id v7 = v24;
        BOOL v20 = [v26 length] == 0;

        BOOL v6 = v42;
      }
      else
      {
        BOOL v20 = 0;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
    if (v19 < [v9 count] - 1)
    {
      v27 = [v9 objectAtIndexedSubscript:v19 + 1];
      v28 = [v27 objectForKeyedSubscript:*MEMORY[0x263EFF468]];
      if ([v28 BOOLValue])
      {
        v29 = [v27 objectForKeyedSubscript:*MEMORY[0x263EFF470]];
        [MEMORY[0x263F08708] whitespaceCharacterSet];
        v31 = id v30 = v7;
        [v29 stringByTrimmingCharactersInSet:v31];
        v32 = BOOL v43 = v6;

        id v7 = v30;
        BOOL v33 = [v32 length] == 0;

        BOOL v6 = v43;
      }
      else
      {
        BOOL v33 = 0;
      }

      if (v20)
      {
LABEL_36:
        v34 = (void *)[v9 mutableCopy];
        v35 = v34;
        if (v33)
        {
          [v34 removeObjectAtIndex:v19 + 1];
          if (!v6)
          {
LABEL_38:
            if (!v20)
            {
LABEL_40:
              id v36 = v35;

              uint64_t v37 = [*(id *)(v8 + 1936) _formatStringFromComponents:v36];

              id v7 = (id)v37;
              id v9 = v36;
              goto LABEL_41;
            }
LABEL_39:
            [v35 removeObjectAtIndex:v19 - 1];
            goto LABEL_40;
          }
        }
        else if (!v6)
        {
          goto LABEL_38;
        }
        [v35 removeObjectAtIndex:v19];
        if (!v20) {
          goto LABEL_40;
        }
        goto LABEL_39;
      }
      goto LABEL_34;
    }
  }
  else
  {
    BOOL v20 = 0;
  }
  BOOL v33 = 0;
  if (v20) {
    goto LABEL_36;
  }
LABEL_34:
  if (v33 || v6) {
    goto LABEL_36;
  }
LABEL_41:
  id v38 = v7;

  return v38;
}

- (id)_sessionCacheKey
{
  return 0;
}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  return 0;
}

- (BOOL)_validate
{
  return 1;
}

- (id)_description
{
  v4.receiver = self;
  v4.super_class = (Class)CLKTextProvider;
  id v2 = [(CLKTextProvider *)&v4 description];

  return v2;
}

- (int64_t)_updateFrequency
{
  return 0;
}

- (id)_italicize:(id)a3
{
  uint64_t v3 = (void *)[a3 mutableCopy];
  uint64_t v4 = *MEMORY[0x263F82270];
  id v5 = [v3 attribute:*MEMORY[0x263F82270] atIndex:0 effectiveRange:0];
  BOOL v6 = [v5 fontDescriptor];
  id v7 = [v6 fontDescriptorWithSymbolicTraits:1];
  [v5 pointSize];
  unint64_t v8 = +[CLKFont fontWithDescriptor:size:](CLKFont, "fontWithDescriptor:size:", v7);

  objc_msgSend(v3, "addAttribute:value:range:", v4, v8, 0, objc_msgSend(v3, "length"));

  return v3;
}

- (id)_monospacedNumbers:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[a3 mutableCopy];
  uint64_t v4 = *MEMORY[0x263F82270];
  id v5 = [v3 attribute:*MEMORY[0x263F82270] atIndex:0 effectiveRange:0];
  BOOL v6 = [v5 fontDescriptor];
  uint64_t v17 = *MEMORY[0x263F83518];
  uint64_t v7 = *MEMORY[0x263F83530];
  v14[0] = *MEMORY[0x263F83548];
  v14[1] = v7;
  v15[0] = &unk_26CCDC0B8;
  v15[1] = &unk_26CCDC0D0;
  unint64_t v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  uint64_t v16 = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  v18[0] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  uint64_t v11 = [v6 fontDescriptorByAddingAttributes:v10];

  [v5 pointSize];
  uint64_t v12 = +[CLKFont fontWithDescriptor:size:](CLKFont, "fontWithDescriptor:size:", v11);
  objc_msgSend(v3, "addAttribute:value:range:", v4, v12, 0, objc_msgSend(v3, "length"));

  return v3;
}

- (id)_addTrackingAttribute:(id)a3 tracking:(id)a4
{
  id v5 = a4;
  BOOL v6 = (void *)[a3 mutableCopy];
  uint64_t v7 = [v6 length];
  objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x263F822C8], v5, 0, v7);

  unint64_t v8 = (void *)[v6 copy];

  return v8;
}

- (id)_defaultCache
{
  defaultCache = self->_defaultCache;
  if (!defaultCache)
  {
    uint64_t v4 = objc_alloc_init(CLKTextProviderCache);
    id v5 = self->_defaultCache;
    self->_defaultCache = v4;

    defaultCache = self->_defaultCache;
  }

  return defaultCache;
}

- (id)_cacheForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (!self->_cachesByKey)
    {
      id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      cachesByKey = self->_cachesByKey;
      self->_cachesByKey = v5;
    }
    recentCacheKeys = self->_recentCacheKeys;
    if (!recentCacheKeys)
    {
      unint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      id v9 = self->_recentCacheKeys;
      self->_recentCacheKeys = v8;

      recentCacheKeys = self->_recentCacheKeys;
    }
    [(NSMutableArray *)recentCacheKeys removeObject:v4];
    [(NSMutableArray *)self->_recentCacheKeys insertObject:v4 atIndex:0];
    [(CLKTextProvider *)self _pruneCacheKeysIfNecessary];
    uint64_t v10 = [(NSMutableDictionary *)self->_cachesByKey objectForKey:v4];
    if (!v10)
    {
      uint64_t v10 = objc_alloc_init(CLKTextProviderCache);
      [(NSMutableDictionary *)self->_cachesByKey setObject:v10 forKey:v4];
    }
  }
  else
  {
    uint64_t v10 = [(CLKTextProvider *)self _defaultCache];
  }

  return v10;
}

- (void)_pruneCacheKeysIfNecessary
{
  unint64_t v3 = [(NSMutableArray *)self->_recentCacheKeys count];
  if (v3 >= 0xB)
  {
    unint64_t v4 = v3;
    for (uint64_t i = 10; i != v4; ++i)
    {
      BOOL v6 = [(NSMutableArray *)self->_recentCacheKeys objectAtIndex:i];
      [(NSMutableDictionary *)self->_cachesByKey removeObjectForKey:v6];
    }
    recentCacheKeys = self->_recentCacheKeys;
    -[NSMutableArray removeObjectsInRange:](recentCacheKeys, "removeObjectsInRange:", 10, v4 - 10);
  }
}

- (void)_localeChanged
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__CLKTextProvider__localeChanged__block_invoke;
  block[3] = &unk_26440E580;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __33__CLKTextProvider__localeChanged__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;
}

- (void)_maybeStartOrStopUpdates
{
  if (![(NSMutableDictionary *)self->_updateHandlersByToken count] || self->_paused)
  {
    BOOL v3 = 0;
    BOOL v4 = 0;
    goto LABEL_4;
  }
  int64_t v10 = [(CLKTextProvider *)self _updateFrequency];
  BOOL v4 = v10 == 2;
  BOOL v3 = v10 == 3;
  if (v10 != 1)
  {
LABEL_4:
    if (self->_minuteTimerToken)
    {
      id v5 = +[CLKClockTimer sharedInstance];
      [v5 stopUpdatesForToken:self->_minuteTimerToken];

      minuteTimerToken = self->_minuteTimerToken;
      self->_minuteTimerToken = 0;

      if (!v4)
      {
        LOBYTE(v4) = 0;
        goto LABEL_15;
      }
    }
    else if (!v4)
    {
      goto LABEL_15;
    }
    if (self->_secondTimerToken)
    {
      if (!v3) {
        goto LABEL_20;
      }
    }
    else
    {
      objc_initWeak(&location, self);
      v18 = +[CLKClockTimer sharedInstance];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_2;
      v27[3] = &unk_26440E3C0;
      objc_copyWeak(&v28, &location);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_3;
      v25[3] = &unk_26440E3E8;
      objc_copyWeak(&v26, &location);
      unint64_t v19 = [v18 startUpdatesWithUpdateFrequency:1 withHandler:v27 identificationLog:v25];
      secondTimerToken = self->_secondTimerToken;
      self->_secondTimerToken = v19;

      objc_destroyWeak(&v26);
      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
      if (!v3) {
        goto LABEL_20;
      }
    }
    goto LABEL_10;
  }
  if (!self->_minuteTimerToken)
  {
    objc_initWeak(&location, self);
    uint64_t v11 = +[CLKClockTimer sharedInstance];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke;
    v31[3] = &unk_26440E3C0;
    objc_copyWeak(&v32, &location);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_36;
    v29[3] = &unk_26440E3E8;
    objc_copyWeak(&v30, &location);
    uint64_t v12 = [v11 startUpdatesWithUpdateFrequency:0 withHandler:v31 identificationLog:v29];
    uint64_t v13 = self->_minuteTimerToken;
    self->_minuteTimerToken = v12;

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
LABEL_15:
  if (v4 || !self->_secondTimerToken)
  {
    if (!v3) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v14 = +[CLKClockTimer sharedInstance];
    [v14 stopUpdatesForToken:self->_secondTimerToken];

    uint64_t v15 = self->_secondTimerToken;
    self->_secondTimerToken = 0;

    if (!v3)
    {
LABEL_20:
      if (self->_30fpsTimerToken)
      {
        uint64_t v16 = +[CLKClockTimer sharedInstance];
        [v16 stopUpdatesForToken:self->_30fpsTimerToken];

        _30fpsTimerToken = self->_30fpsTimerToken;
        self->_30fpsTimerToken = 0;
      }
      return;
    }
  }
LABEL_10:
  if (!self->_30fpsTimerToken)
  {
    objc_initWeak(&location, self);
    uint64_t v7 = +[CLKClockTimer sharedInstance];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_4;
    v23[3] = &unk_26440E3C0;
    objc_copyWeak(&v24, &location);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_5;
    v21[3] = &unk_26440E3E8;
    objc_copyWeak(&v22, &location);
    unint64_t v8 = [v7 startUpdatesWithUpdateFrequency:3 withHandler:v23 identificationLog:v21];
    id v9 = self->_30fpsTimerToken;
    self->_30fpsTimerToken = v8;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

void __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _update];
}

id __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_36(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained description];

  return v2;
}

void __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_2(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _update];
}

id __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained description];

  return v2;
}

void __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_4(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _update];
}

id __43__CLKTextProvider__maybeStartOrStopUpdates__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained description];

  return v2;
}

- (void)_update
{
  [(NSMutableDictionary *)self->_updateHandlersByToken enumerateKeysAndObjectsUsingBlock:&__block_literal_global_40];

  [(CLKTextProvider *)self _maybeStartOrStopUpdates];
}

uint64_t __26__CLKTextProvider__update__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_finalized)
  {
    return self;
  }
  else
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
    *(void *)(v4 + 120) = self->_timeTravelUpdateFrequency;
    objc_storeStrong((id *)(v4 + 80), self->_tintColor);
    *(void *)(v4 + 104) = self->_shrinkTextPreference;
    *(unsigned char *)(v4 + 75) = self->_italicized;
    *(unsigned char *)(v4 + 76) = self->_monospacedNumbers;
    objc_storeStrong((id *)(v4 + 96), self->_trackingAttribute);
    *(unsigned char *)(v4 + 73) = self->_ignoreUppercaseStyle;
    objc_storeStrong((id *)(v4 + 88), self->_accessibilityLabel);
    objc_storeStrong((id *)(v4 + 112), self->_fontFeatures);
    return (id)v4;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t timeTravelUpdateFrequency = self->_timeTravelUpdateFrequency;
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __27__CLKTextProvider_isEqual___block_invoke;
  v50[3] = &unk_26440EC90;
  id v7 = v4;
  id v51 = v7;
  id v8 = (id)[v5 appendInteger:timeTravelUpdateFrequency counterpart:v50];
  tintColor = self->_tintColor;
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __27__CLKTextProvider_isEqual___block_invoke_2;
  v48[3] = &unk_26440E508;
  id v10 = v7;
  id v49 = v10;
  id v11 = (id)[v5 appendObject:tintColor counterpart:v48];
  int64_t shrinkTextPreference = self->_shrinkTextPreference;
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __27__CLKTextProvider_isEqual___block_invoke_3;
  v46[3] = &unk_26440EC90;
  id v13 = v10;
  id v47 = v13;
  id v14 = (id)[v5 appendInteger:shrinkTextPreference counterpart:v46];
  BOOL italicized = self->_italicized;
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __27__CLKTextProvider_isEqual___block_invoke_4;
  v44[3] = &unk_26440ECB8;
  id v16 = v13;
  id v45 = v16;
  id v17 = (id)[v5 appendBool:italicized counterpart:v44];
  BOOL ignoreUppercaseStyle = self->_ignoreUppercaseStyle;
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __27__CLKTextProvider_isEqual___block_invoke_5;
  v42[3] = &unk_26440ECB8;
  id v19 = v16;
  id v43 = v19;
  id v20 = (id)[v5 appendBool:ignoreUppercaseStyle counterpart:v42];
  accessibilityLabel = self->_accessibilityLabel;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __27__CLKTextProvider_isEqual___block_invoke_6;
  v40[3] = &unk_26440E4E0;
  id v22 = v19;
  id v41 = v22;
  id v23 = (id)[v5 appendString:accessibilityLabel counterpart:v40];
  BOOL monospacedNumbers = self->_monospacedNumbers;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __27__CLKTextProvider_isEqual___block_invoke_7;
  v38[3] = &unk_26440ECB8;
  id v25 = v22;
  id v39 = v25;
  id v26 = (id)[v5 appendBool:monospacedNumbers counterpart:v38];
  fontFeatures = self->_fontFeatures;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __27__CLKTextProvider_isEqual___block_invoke_8;
  v36[3] = &unk_26440E508;
  id v28 = v25;
  id v37 = v28;
  id v29 = (id)[v5 appendObject:fontFeatures counterpart:v36];
  trackingAttribute = self->_trackingAttribute;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __27__CLKTextProvider_isEqual___block_invoke_9;
  v34[3] = &unk_26440E508;
  id v35 = v28;
  id v31 = v28;
  id v32 = (id)[v5 appendObject:trackingAttribute counterpart:v34];
  LOBYTE(v28) = [v5 isEqual];

  return (char)v28;
}

uint64_t __27__CLKTextProvider_isEqual___block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 120);
}

id __27__CLKTextProvider_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 80);
}

uint64_t __27__CLKTextProvider_isEqual___block_invoke_3(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 104);
}

uint64_t __27__CLKTextProvider_isEqual___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 75);
}

uint64_t __27__CLKTextProvider_isEqual___block_invoke_5(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 73);
}

id __27__CLKTextProvider_isEqual___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 88);
}

uint64_t __27__CLKTextProvider_isEqual___block_invoke_7(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 76);
}

id __27__CLKTextProvider_isEqual___block_invoke_8(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 112);
}

id __27__CLKTextProvider_isEqual___block_invoke_9(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 96);
}

- (unint64_t)hash
{
  BOOL v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendInteger:self->_timeTravelUpdateFrequency];
  id v5 = (id)[v3 appendObject:self->_tintColor];
  id v6 = (id)[v3 appendInteger:self->_shrinkTextPreference];
  id v7 = (id)[v3 appendBool:self->_italicized];
  id v8 = (id)[v3 appendBool:self->_ignoreUppercaseStyle];
  id v9 = (id)[v3 appendString:self->_accessibilityLabel];
  id v10 = (id)[v3 appendBool:self->_monospacedNumbers];
  id v11 = (id)[v3 appendObject:self->_fontFeatures];
  id v12 = (id)[v3 appendObject:self->_trackingAttribute];
  unint64_t v13 = [v3 hash];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t timeTravelUpdateFrequency = self->_timeTravelUpdateFrequency;
  id v5 = a3;
  [v5 encodeInteger:timeTravelUpdateFrequency forKey:@"updateFrequency"];
  [v5 encodeObject:self->_tintColor forKey:@"tintColor"];
  [v5 encodeBool:self->_shrinkTextPreference != 0 forKey:@"shrinkTextPreference"];
  [v5 encodeBool:self->_finalized forKey:@"finalized"];
  [v5 encodeBool:self->_italicized forKey:@"italicized"];
  [v5 encodeBool:self->_monospacedNumbers forKey:@"monospacedNumbers"];
  [v5 encodeBool:self->_ignoreUppercaseStyle forKey:@"ignoreUppercaseStyle"];
  [v5 encodeObject:self->_accessibilityLabel forKey:@"_accessibility"];
  [v5 encodeObject:self->_fontFeatures forKey:@"fontFeatures"];
}

- (CLKTextProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CLKTextProvider;
  id v5 = [(CLKTextProvider *)&v21 init];
  id v6 = v5;
  if (v5)
  {
    [(CLKTextProvider *)v5 _commonInit];
    v6->_int64_t timeTravelUpdateFrequency = [v4 decodeIntegerForKey:@"updateFrequency"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tintColor"];
    tintColor = v6->_tintColor;
    v6->_tintColor = (UIColor *)v7;

    v6->_int64_t shrinkTextPreference = [v4 decodeBoolForKey:@"shrinkTextPreference"];
    v6->_finalized = [v4 decodeBoolForKey:@"finalized"];
    v6->_BOOL italicized = [v4 decodeBoolForKey:@"italicized"];
    v6->_BOOL monospacedNumbers = [v4 decodeBoolForKey:@"monospacedNumbers"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:v6->_trackingAttribute];
    trackingAttribute = v6->_trackingAttribute;
    v6->_trackingAttribute = (NSNumber *)v9;

    v6->_BOOL ignoreUppercaseStyle = [v4 decodeBoolForKey:@"ignoreUppercaseStyle"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_accessibility"];
    accessibilityLabel = v6->_accessibilityLabel;
    v6->_accessibilityLabel = (NSString *)v11;

    unint64_t v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    id v17 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"fontFeatures"];
    fontFeatures = v6->_fontFeatures;
    v6->_fontFeatures = (NSArray *)v18;
  }
  return v6;
}

+ (CLKTextProvider)providerWithJSONObjectRepresentation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"must be a dictionary. Invalid value: %@", v3 format];
  }
  id v4 = [v3 objectForKeyedSubscript:@"class"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a string - invalid value: %@", @"class", v4 format];
  }
  Class v5 = NSClassFromString(v4);
  if (([(objc_class *)v5 isSubclassOfClass:objc_opt_class()] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"class: %@ must be a CLKTextProvider class", v4 format];
  }
  id v6 = (void *)[[v5 alloc] _initWithJSONObjectRepresentation:v3];
  if (v6)
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:@"tintColor"];
    if (v7)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x263F825C8]) initWithJSONObjectRepresentation:v7];
      [v6 setTintColor:v8];
    }
  }

  return (CLKTextProvider *)v6;
}

- (id)_initWithJSONObjectRepresentation:(id)a3
{
  id v4 = a3;
  Class v5 = [(CLKTextProvider *)self initPrivate];
  id v6 = [v4 objectForKeyedSubscript:@"accessibilityLabel"];

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a string - invalid value: %@", @"accessibilityLabel", v6 format];
    }
    objc_storeStrong(v5 + 11, v6);
  }

  return v5;
}

- (id)JSONObjectRepresentation
{
  id v3 = objc_opt_new();
  id v4 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v3];

  Class v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 setObject:v6 forKeyedSubscript:@"class"];

  uint64_t v7 = [(UIColor *)self->_tintColor JSONObjectRepresentation];
  [v4 setObject:v7 forKeyedSubscript:@"tintColor"];

  [v4 setObject:self->_accessibilityLabel forKeyedSubscript:@"accessibilityLabel"];

  return v4;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(UIColor *)tintColor
{
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(NSString *)accessibilityLabel
{
}

- (BOOL)ignoreUppercaseStyle
{
  return self->_ignoreUppercaseStyle;
}

- (void)setIgnoreUppercaseStyle:(BOOL)a3
{
  self->_BOOL ignoreUppercaseStyle = a3;
}

- (BOOL)paused
{
  return self->_paused;
}

- (BOOL)italicized
{
  return self->_italicized;
}

- (void)setItalicized:(BOOL)a3
{
  self->_BOOL italicized = a3;
}

- (BOOL)monospacedNumbers
{
  return self->_monospacedNumbers;
}

- (void)setMonospacedNumbers:(BOOL)a3
{
  self->_BOOL monospacedNumbers = a3;
}

- (NSNumber)trackingAttribute
{
  return self->_trackingAttribute;
}

- (void)setTrackingAttribute:(id)a3
{
}

- (int64_t)shrinkTextPreference
{
  return self->_shrinkTextPreference;
}

- (void)setShrinkTextPreference:(int64_t)a3
{
  self->_int64_t shrinkTextPreference = a3;
}

- (NSArray)fontFeatures
{
  return self->_fontFeatures;
}

- (void)setFontFeatures:(id)a3
{
}

- (int64_t)timeTravelUpdateFrequency
{
  return self->_timeTravelUpdateFrequency;
}

- (void)setTimeTravelUpdateFrequency:(int64_t)a3
{
  self->_int64_t timeTravelUpdateFrequency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontFeatures, 0);
  objc_storeStrong((id *)&self->_trackingAttribute, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_30fpsTimerToken, 0);
  objc_storeStrong((id *)&self->_minuteTimerToken, 0);
  objc_storeStrong((id *)&self->_secondTimerToken, 0);
  objc_storeStrong((id *)&self->_updateHandlersByToken, 0);
  objc_storeStrong((id *)&self->_recentCacheKeys, 0);
  objc_storeStrong((id *)&self->_cachesByKey, 0);

  objc_storeStrong((id *)&self->_defaultCache, 0);
}

@end