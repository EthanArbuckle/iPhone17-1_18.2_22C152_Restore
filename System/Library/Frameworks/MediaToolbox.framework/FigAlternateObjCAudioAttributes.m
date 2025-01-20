@interface FigAlternateObjCAudioAttributes
- (FigAlternateObjCAudioAttributes)initWithFigAlternate:(OpaqueFigAlternate *)a3;
- (NSArray)formatIDs;
- (id)channelCountForMediaOption:(id)a3;
- (id)isBinauralMediaOption:(id)a3;
- (id)isDownmixMediaOption:(id)a3;
- (id)isImmersiveMediaOption:(id)a3;
- (id)sampleRateForMediaOption:(id)a3;
- (void)dealloc;
@end

@implementation FigAlternateObjCAudioAttributes

- (FigAlternateObjCAudioAttributes)initWithFigAlternate:(OpaqueFigAlternate *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FigAlternateObjCAudioAttributes;
  v4 = [(FigAlternateObjCAudioAttributes *)&v7 init];
  if (v4)
  {
    if (a3) {
      v5 = (OpaqueFigAlternate *)CFRetain(a3);
    }
    else {
      v5 = 0;
    }
    v4->_alternate = v5;
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v4;
}

- (NSArray)formatIDs
{
  MEMORY[0x19970E910](self->_mutex, a2);
  if (!self->_formatIDs)
  {
    AudioFormatIDs = (NSArray *)FigAlternateGetAudioFormatIDs((uint64_t)self->_alternate);
    self->_formatIDs = AudioFormatIDs;
    if (!AudioFormatIDs)
    {
      AudioFormatIDs = (NSArray *)[MEMORY[0x1E4F1C978] array];
      self->_formatIDs = AudioFormatIDs;
    }
    v4 = AudioFormatIDs;
  }
  MEMORY[0x19970E930](self->_mutex);
  v5 = self->_formatIDs;

  return v5;
}

- (id)channelCountForMediaOption:(id)a3
{
  v4 = (const void *)[a3 objectForKeyedSubscript:@"MediaSelectionOptionsPersistentID"];
  if (!v4) {
    return &unk_1EE58E018;
  }
  v5 = NSNumber;
  uint64_t DeclaredAudioChannelCount = FigAlternateGetDeclaredAudioChannelCount(self->_alternate, v4, 0);

  return (id)[v5 numberWithInt:DeclaredAudioChannelCount];
}

- (id)isBinauralMediaOption:(id)a3
{
  v4 = (const void *)[a3 objectForKeyedSubscript:@"MediaSelectionOptionsPersistentID"];
  if (!v4) {
    return (id)MEMORY[0x1E4F1CC28];
  }
  unsigned int v7 = 0;
  if (FigAlternateGetDeclaredAudioChannelCount(self->_alternate, v4, &v7) == 2) {
    uint64_t v5 = (v7 >> 1) & 1;
  }
  else {
    uint64_t v5 = 0;
  }
  return (id)[NSNumber numberWithInt:v5];
}

- (id)isImmersiveMediaOption:(id)a3
{
  v4 = (const void *)[a3 objectForKeyedSubscript:@"MediaSelectionOptionsPersistentID"];
  if (!v4) {
    return (id)MEMORY[0x1E4F1CC28];
  }
  unsigned int v7 = 0;
  if (FigAlternateGetDeclaredAudioChannelCount(self->_alternate, v4, &v7) == 2) {
    uint64_t v5 = (v7 >> 3) & 1;
  }
  else {
    uint64_t v5 = 0;
  }
  return (id)[NSNumber numberWithInt:v5];
}

- (id)isDownmixMediaOption:(id)a3
{
  v4 = (const void *)[a3 objectForKeyedSubscript:@"MediaSelectionOptionsPersistentID"];
  if (!v4) {
    return (id)MEMORY[0x1E4F1CC28];
  }
  unsigned int v6 = 0;
  FigAlternateGetDeclaredAudioChannelCount(self->_alternate, v4, &v6);
  return (id)[NSNumber numberWithInt:(v6 >> 2) & 1];
}

- (id)sampleRateForMediaOption:(id)a3
{
  v4 = (const void *)[a3 objectForKeyedSubscript:@"MediaSelectionOptionsPersistentID"];
  if (!v4) {
    return &unk_1EE58E048;
  }
  uint64_t v5 = NSNumber;
  double AudioSampleRate = FigAlternateGetAudioSampleRate((uint64_t)self->_alternate, v4);

  return (id)[v5 numberWithDouble:AudioSampleRate];
}

- (void)dealloc
{
  alternate = self->_alternate;
  if (alternate) {
    CFRelease(alternate);
  }

  FigSimpleMutexDestroy();
  v4.receiver = self;
  v4.super_class = (Class)FigAlternateObjCAudioAttributes;
  [(FigAlternateObjCAudioAttributes *)&v4 dealloc];
}

@end