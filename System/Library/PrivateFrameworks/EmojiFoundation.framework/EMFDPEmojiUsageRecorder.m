@interface EMFDPEmojiUsageRecorder
+ (id)_defaultUsageModeIdentifier;
- (BOOL)report;
- (EMFDPEmojiUsageRecorder)initWithEmoji:(id)a3;
- (EMFDPEmojiUsageRecorder)initWithEmoji:(id)a3 usageModeIdentifier:(id)a4;
- (NSLocale)locale;
- (NSString)usageModeIdentifier;
- (id)delegate;
- (id)recordingKey;
- (void)report;
@end

@implementation EMFDPEmojiUsageRecorder

- (EMFDPEmojiUsageRecorder)initWithEmoji:(id)a3
{
  return [(EMFDPEmojiUsageRecorder *)self initWithEmoji:a3 usageModeIdentifier:0];
}

- (EMFDPEmojiUsageRecorder)initWithEmoji:(id)a3 usageModeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)EMFDPEmojiUsageRecorder;
  v8 = [(EMFDPRecorder *)&v18 initWithEmoji:v6];
  if (v8)
  {
    v9 = [v6 localeData];
    v10 = [v9 localeIdentifier];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v6 localeIdentifier];
    }
    v13 = v12;

    v14 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v13];
    objc_storeStrong((id *)&v8->_locale, v14);
    if (v7)
    {
      v15 = (void *)[v7 copy];
    }
    else
    {
      v15 = [(id)objc_opt_class() _defaultUsageModeIdentifier];
    }
    v16 = v15;
    objc_storeStrong((id *)&v8->_usageModeIdentifier, v15);
  }
  return v8;
}

- (id)recordingKey
{
  v3 = NSString;
  v4 = [(EMFDPEmojiUsageRecorder *)self locale];
  v5 = [v4 localeIdentifier];
  id v6 = [(EMFDPEmojiUsageRecorder *)self usageModeIdentifier];
  id v7 = [v3 stringWithFormat:@"com.apple.keyboard.Emoji.%@.%@", v5, v6];

  return v7;
}

- (id)delegate
{
  v11.receiver = self;
  v11.super_class = (Class)EMFDPEmojiUsageRecorder;
  v3 = [(EMFDPRecorder *)&v11 delegate];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5F488]);
    v5 = [(EMFDPEmojiUsageRecorder *)self recordingKey];
    id v6 = (void *)[v4 initWithKey:v5];

    v10.receiver = self;
    v10.super_class = (Class)EMFDPEmojiUsageRecorder;
    [(EMFDPRecorder *)&v10 setDelegate:v6];
  }
  v9.receiver = self;
  v9.super_class = (Class)EMFDPEmojiUsageRecorder;
  id v7 = [(EMFDPRecorder *)&v9 delegate];
  return v7;
}

- (BOOL)report
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [(EMFDPRecorder *)self emoji];
  id v4 = [v3 string];

  v5 = emf_logging_get_default_log();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(EMFDPEmojiUsageRecorder *)(uint64_t)v4 report];
    }

    id v6 = [(EMFDPEmojiUsageRecorder *)self delegate];
    v10[0] = v4;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    char v8 = [v6 record:v7];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(EMFDPEmojiUsageRecorder *)self report];
    }
    char v8 = 0;
  }

  return v8;
}

+ (id)_defaultUsageModeIdentifier
{
  if (_defaultUsageModeIdentifier_onceToken != -1) {
    dispatch_once(&_defaultUsageModeIdentifier_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)_defaultUsageModeIdentifier__kDefaultUsageModeIdentifier;
  return v2;
}

void __54__EMFDPEmojiUsageRecorder__defaultUsageModeIdentifier__block_invoke()
{
  v0 = (void *)_defaultUsageModeIdentifier__kDefaultUsageModeIdentifier;
  _defaultUsageModeIdentifier__kDefaultUsageModeIdentifier = @"Keyboard";
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)usageModeIdentifier
{
  return self->_usageModeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageModeIdentifier, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)report
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B8C45000, a2, OS_LOG_TYPE_DEBUG, "Donating emoji to dprivacyd: '%{public}@'", (uint8_t *)&v2, 0xCu);
}

@end