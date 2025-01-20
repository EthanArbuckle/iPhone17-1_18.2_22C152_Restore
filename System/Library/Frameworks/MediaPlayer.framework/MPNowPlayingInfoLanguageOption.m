@interface MPNowPlayingInfoLanguageOption
- (BOOL)isAutomaticAudibleLanguageOption;
- (BOOL)isAutomaticLegibleLanguageOption;
- (BOOL)isEqualToLanguageOption:(id)a3;
- (MPNowPlayingInfoLanguageOption)initWithMRLanguageOption:(void *)a3;
- (MPNowPlayingInfoLanguageOption)initWithType:(MPNowPlayingInfoLanguageOptionType)languageOptionType languageTag:(NSString *)languageTag characteristics:(NSArray *)languageOptionCharacteristics displayName:(NSString *)displayName identifier:(NSString *)identifier;
- (MPNowPlayingInfoLanguageOptionType)languageOptionType;
- (NSArray)languageOptionCharacteristics;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)languageTag;
- (id)copyExternalRepresentation;
- (void)dealloc;
- (void)mrLanguageOption;
@end

@implementation MPNowPlayingInfoLanguageOption

- (void)mrLanguageOption
{
  return self->_mrLanguageOption;
}

- (BOOL)isEqualToLanguageOption:(id)a3
{
  mrLanguageOption = self->_mrLanguageOption;
  uint64_t v4 = [a3 mrLanguageOption];

  return MEMORY[0x1F412E418](mrLanguageOption, v4);
}

- (id)copyExternalRepresentation
{
  return (id)MEMORY[0x1F412E3C0](self->_mrLanguageOption, a2);
}

- (NSString)identifier
{
  v2 = (void *)MRLanguageOptionCopyIdentifier();

  return (NSString *)v2;
}

- (NSString)displayName
{
  v2 = (void *)MRLanguageOptionCopyDisplayName();

  return (NSString *)v2;
}

- (NSArray)languageOptionCharacteristics
{
  v2 = (void *)MRLanguageOptionCopyCharacteristics();

  return (NSArray *)v2;
}

- (NSString)languageTag
{
  v2 = (void *)MRLanguageOptionCopyLanguageTag();

  return (NSString *)v2;
}

- (MPNowPlayingInfoLanguageOptionType)languageOptionType
{
  return (unint64_t)(MEMORY[0x19971ACC0](self->_mrLanguageOption, a2) == 1);
}

- (BOOL)isAutomaticAudibleLanguageOption
{
  return MEMORY[0x1F412E410](self->_mrLanguageOption, 0);
}

- (BOOL)isAutomaticLegibleLanguageOption
{
  return MEMORY[0x1F412E410](self->_mrLanguageOption, 1);
}

- (MPNowPlayingInfoLanguageOption)initWithMRLanguageOption:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPNowPlayingInfoLanguageOption;
  uint64_t v4 = [(MPNowPlayingInfoLanguageOption *)&v7 init];
  v5 = v4;
  if (a3 && v4) {
    v4->_mrLanguageOption = (void *)CFRetain(a3);
  }
  return v5;
}

- (void)dealloc
{
  mrLanguageOption = self->_mrLanguageOption;
  if (mrLanguageOption) {
    CFRelease(mrLanguageOption);
  }
  v4.receiver = self;
  v4.super_class = (Class)MPNowPlayingInfoLanguageOption;
  [(MPNowPlayingInfoLanguageOption *)&v4 dealloc];
}

- (MPNowPlayingInfoLanguageOption)initWithType:(MPNowPlayingInfoLanguageOptionType)languageOptionType languageTag:(NSString *)languageTag characteristics:(NSArray *)languageOptionCharacteristics displayName:(NSString *)displayName identifier:(NSString *)identifier
{
  v11 = languageTag;
  v12 = languageOptionCharacteristics;
  v13 = displayName;
  v14 = identifier;
  v17.receiver = self;
  v17.super_class = (Class)MPNowPlayingInfoLanguageOption;
  v15 = [(MPNowPlayingInfoLanguageOption *)&v17 init];
  if (v15) {
    v15->_mrLanguageOption = (void *)MRLanguageOptionCreate();
  }

  return v15;
}

@end