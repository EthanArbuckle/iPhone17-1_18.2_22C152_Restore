@interface AVAudioUnitComponent
- (AVAudioUnitComponent)initWithComponentDescription:(AudioComponentDescription *)a3;
- (AVAudioUnitComponent)initWithComponentDescription:(AudioComponentDescription *)a3 withAVAUManagerImpl:(AVAudioUnitComponentManagerImpl *)a4;
- (AudioComponent)audioComponent;
- (AudioComponentDescription)audioComponentDescription;
- (BOOL)hasCustomView;
- (BOOL)hasMIDIInput;
- (BOOL)hasMIDIOutput;
- (BOOL)isComponentDescriptionMatch:(AudioComponentDescription *)a3;
- (BOOL)isSandboxSafe;
- (BOOL)passesAUVal;
- (BOOL)supportsNumberInputChannels:(NSInteger)numInputChannels outputChannels:(NSInteger)numOutputChannels;
- (BOOL)validateWithResults:(id)a3 inCompletionHandler:(id)a4;
- (NSArray)allTagNames;
- (NSArray)availableArchitectures;
- (NSArray)userTagNames;
- (NSDictionary)configurationDictionary;
- (NSString)localizedTypeName;
- (NSString)manufacturerName;
- (NSString)name;
- (NSString)typeName;
- (NSString)versionString;
- (NSUInteger)version;
- (NSURL)componentURL;
- (NSURL)iconURL;
- (UIImage)icon;
- (id)GetTypeName:(unsigned int)a3;
- (void)dealloc;
- (void)localeChanged;
- (void)setUserTagNames:(NSArray *)userTagNames;
@end

@implementation AVAudioUnitComponent

- (BOOL)isComponentDescriptionMatch:(AudioComponentDescription *)a3
{
  if (self) {
    [(AVAudioUnitComponent *)self audioComponentDescription];
  }
  return !a3->componentType && !a3->componentSubType && a3->componentManufacturer == 0;
}

- (id)GetTypeName:(unsigned int)a3
{
  if ((int)a3 > 1635086187)
  {
    if ((int)a3 <= 1635086950)
    {
      switch(a3)
      {
        case 0x61756F6Cu:
          return @"Offline Effect";
        case 0x61756F75u:
          return @"Output";
        case 0x6175706Eu:
          return @"Panner";
      }
    }
    else if ((int)a3 > 1635086956)
    {
      if (a3 == 1635086957) {
        return @"Remote Music Effect";
      }
      if (a3 == 1635086968) {
        return @"Remote Effect";
      }
    }
    else
    {
      if (a3 == 1635086951) {
        return @"Remote Generator";
      }
      if (a3 == 1635086953) {
        return @"Remote Instrument";
      }
    }
  }
  else if ((int)a3 <= 1635085669)
  {
    switch(a3)
    {
      case 0x61756663u:
        return @"Format Converter";
      case 0x61756678u:
        return @"Effect";
      case 0x6175676Eu:
        return @"Generator";
    }
  }
  else if ((int)a3 > 1635085684)
  {
    if (a3 == 1635085685) {
      return @"Music Device";
    }
    if (a3 == 1635085688) {
      return @"Mixer";
    }
  }
  else
  {
    if (a3 == 1635085670) {
      return @"Music Effect";
    }
    if (a3 == 1635085673) {
      return @"MIDI Processor";
    }
  }
  return @"Unknown";
}

- (BOOL)supportsNumberInputChannels:(NSInteger)numInputChannels outputChannels:(NSInteger)numOutputChannels
{
  uint64_t v6 = [NSNumber numberWithInteger:numInputChannels];
  uint64_t v7 = [NSNumber numberWithInteger:numOutputChannels];
  v8 = [(AVAudioUnitComponent *)self configurationDictionary];
  if (!v8) {
    return 0;
  }
  v9 = v8;
  id v10 = [(NSDictionary *)v8 objectForKey:@"InitialInputs"];
  uint64_t v11 = [(NSDictionary *)v9 objectForKey:@"InitialOutputs"];
  if (!v10) {
    return 0;
  }
  v12 = (void *)v11;
  if (!v11 || ![v10 containsObject:v6]) {
    return 0;
  }

  return [v12 containsObject:v7];
}

- (AudioComponentDescription)audioComponentDescription
{
  *retstr = *(AudioComponentDescription *)(*(void *)&self->componentManufacturer + 16);
  return self;
}

- (BOOL)validateWithResults:(id)a3 inCompletionHandler:(id)a4
{
  v4 = (OpaqueAudioComponent *)*((void *)self->_impl + 1);
  inCompletionHandler[0] = MEMORY[0x1E4F143A8];
  inCompletionHandler[1] = 3221225472;
  inCompletionHandler[2] = __64__AVAudioUnitComponent_validateWithResults_inCompletionHandler___block_invoke;
  inCompletionHandler[3] = &unk_1E59647F0;
  inCompletionHandler[4] = a4;
  return AudioComponentValidateWithResults(v4, (CFDictionaryRef)a3, inCompletionHandler) == 0;
}

uint64_t __64__AVAudioUnitComponent_validateWithResults_inCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSDictionary)configurationDictionary
{
  impl = self->_impl;
  if (!impl[132]) {
    AVAudioUnitComponentImpl::FetchConfigurationDictionary((AudioComponent *)self->_impl);
  }
  if (*((void *)impl + 17))
  {
    v4 = self->_impl;
    if (!*((unsigned char *)v4 + 132)) {
      AVAudioUnitComponentImpl::FetchConfigurationDictionary((AudioComponent *)v4);
    }
    return (NSDictionary *)*((void *)v4 + 17);
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
    return (NSDictionary *)[v6 dictionary];
  }
}

- (BOOL)hasMIDIOutput
{
  unsigned int v2 = *((_DWORD *)self->_impl + 4) - 1635085670;
  return (v2 < 0x10) & (0x8009u >> v2);
}

- (BOOL)hasMIDIInput
{
  unsigned int v2 = *((_DWORD *)self->_impl + 4) - 1635085670;
  return (v2 < 0x10) & (0x8009u >> v2);
}

- (BOOL)isSandboxSafe
{
  return *((unsigned char *)self->_impl + 72);
}

- (BOOL)passesAUVal
{
  impl = self->_impl;
  if (*((_DWORD *)impl + 32) == 1) {
    return 1;
  }
  AudioComponentValidate(*((AudioComponent *)impl + 1), 0, (AudioComponentValidationResult *)impl + 32);
  return *((_DWORD *)impl + 32) == 1;
}

- (BOOL)hasCustomView
{
  return *((unsigned char *)self->_impl + 144);
}

- (NSUInteger)version
{
  return *((unsigned int *)self->_impl + 9);
}

- (NSArray)availableArchitectures
{
  impl = self->_impl;
  if (*((void *)impl + 13)
    || (CFURLRef v6 = (const __CFURL *)*((void *)impl + 12)) != 0
    && (*((void *)self->_impl + 13) = CFBundleCopyExecutableArchitecturesForURL(v6)) != 0)
  {
    v3 = (void *)MEMORY[0x1E4F1C978];
    return (NSArray *)objc_msgSend(v3, "arrayWithArray:");
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
    return (NSArray *)[v7 array];
  }
}

- (NSURL)componentURL
{
  result = (NSURL *)*((void *)self->_impl + 12);
  if (!result) {
    return (NSURL *)[MEMORY[0x1E4F1CB10] URLWithString:&stru_1EEFA9548];
  }
  return result;
}

- (NSArray)allTagNames
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:*((void *)self->_impl + 10)];
}

- (void)setUserTagNames:(NSArray *)userTagNames
{
  v3 = userTagNames;
  if (userTagNames)
  {
    if ([(NSArray *)userTagNames count])
    {
      v3 = (NSArray *)[MEMORY[0x1E4F1CAD0] setWithArray:v3];
      if (-[NSArray isSubsetOfSet:](v3, "isSubsetOfSet:", [MEMORY[0x1E4F1CAD0] setWithArray:*((void *)self->_impl + 11)]))return; {
      if (v3)
      }
        v3 = (NSArray *)[(NSArray *)v3 allObjects];
    }
    else
    {
      v3 = 0;
    }
  }
  impl = self->_impl;
  CFURLRef v6 = (NSArray *)*((void *)impl + 11);
  if (v6 != v3)
  {
    if (!v6)
    {
      CFURLRef v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *((void *)impl + 11) = v6;
    }
    [(NSArray *)v6 removeAllObjects];
    if ([(NSArray *)v3 count]) {
      [*((id *)impl + 11) addObjectsFromArray:v3];
    }
    operator new();
  }
  uint64_t v7 = *((void *)impl + 15);
  v8 = v3;
  if (v8)
  {
    v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    id v10 = [MEMORY[0x1E4F1CA80] setWithArray:*(void *)(v7 + 16)];
    if ([v9 isSubsetOfSet:v10])
    {
      NSLog(&cfstr_NoChanges.isa);
    }
    else
    {
      NSLog(&cfstr_NewTagsFoundAd.isa);
      [v10 unionSet:v9];
      [*(id *)(v7 + 16) removeAllObjects];
      uint64_t v11 = *(void **)(v7 + 16);
      v12 = [v10 allObjects];
      [v11 addObjectsFromArray:v12];
    }
  }

  v13 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];

  [v13 postNotificationName:@"AVAudioUnitComponentTagsDidChangeNotification" object:self];
}

- (NSArray)userTagNames
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:*((void *)self->_impl + 11)];
}

- (UIImage)icon
{
  unsigned int v2 = AudioComponentCopyIcon(*((AudioComponent *)self->_impl + 1));

  return v2;
}

- (NSURL)iconURL
{
  result = (NSURL *)*((void *)self->_impl + 19);
  if (!result) {
    return (NSURL *)[MEMORY[0x1E4F1CB10] URLWithString:&stru_1EEFA9548];
  }
  return result;
}

- (NSString)versionString
{
  result = (NSString *)*((void *)self->_impl + 5);
  if (!result) {
    return (NSString *)[NSString stringWithFormat:@"-"];
  }
  return result;
}

- (NSString)manufacturerName
{
  return (NSString *)*((void *)self->_impl + 7);
}

- (NSString)localizedTypeName
{
  impl = self->_impl;
  CFStringRef v3 = [(AVAudioUnitComponent *)self typeName];
  result = (NSString *)*((void *)impl + 8);
  if (v3 && !result)
  {
    BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.audio.units.Components");
    if (BundleWithIdentifier)
    {
      result = (NSString *)CFBundleCopyLocalizedString(BundleWithIdentifier, v3, v3, @"AudioUnitTypes");
      *((void *)impl + 8) = result;
    }
    else
    {
      return (NSString *)*((void *)impl + 8);
    }
  }
  return result;
}

- (NSString)typeName
{
  return (NSString *)[(AVAudioUnitComponent *)self GetTypeName:*((unsigned int *)self->_impl + 4)];
}

- (NSString)name
{
  return (NSString *)*((void *)self->_impl + 6);
}

- (AudioComponent)audioComponent
{
  return (AudioComponent)*((void *)self->_impl + 1);
}

- (void)localeChanged
{
}

- (void)dealloc
{
  impl = self->_impl;
  if (impl) {
    (*(void (**)(void *, SEL))(*(void *)impl + 8))(impl, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAudioUnitComponent;
  [(AVAudioUnitComponent *)&v4 dealloc];
}

- (AVAudioUnitComponent)initWithComponentDescription:(AudioComponentDescription *)a3 withAVAUManagerImpl:(AVAudioUnitComponentManagerImpl *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AVAudioUnitComponent;
  if ([(AVAudioUnitComponent *)&v5 init]) {
    operator new();
  }
  MEMORY[8] = 0;
  return 0;
}

- (AVAudioUnitComponent)initWithComponentDescription:(AudioComponentDescription *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVAudioUnitComponent;
  if ([(AVAudioUnitComponent *)&v4 init]) {
    operator new();
  }
  MEMORY[8] = 0;
  return 0;
}

@end