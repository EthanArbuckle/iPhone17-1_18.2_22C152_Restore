@interface MTFVoice
- (NSDictionary)pitchCoeff;
- (WrappedMTVoice)wrapped;
- (void)_pcmData;
- (void)dealloc;
- (void)privateData;
- (void)setPitchCoeff:(id)a3;
- (void)setVoiceData:(void *)a3;
- (void)setWrapped:(WrappedMTVoice *)a3;
- (void)set_pcmData:(void *)a3;
- (void)voiceData;
@end

@implementation MTFVoice

- (void)privateData
{
  return [(MTFVoice *)self voiceData] + 362;
}

- (void)dealloc
{
  int v3 = (int)[(MTFVoice *)self description][4];
  if (*(void *)[(MTFVoice *)self wrapped])
  {
    if (v3 == 1734437985)
    {
      v5 = *(PROWReader **)[(MTFVoice *)self wrapped];
      if (!v5) {
        goto LABEL_9;
      }
      PROWReader::~PROWReader(v5);
      goto LABEL_8;
    }
    if (v3 == 1835364215)
    {
      v4 = *(MEOWReader **)[(MTFVoice *)self wrapped];
      if (v4)
      {
        MEOWReader::~MEOWReader(v4);
LABEL_8:
        MEMORY[0x1E016FF00]();
      }
    }
  }
LABEL_9:
  if ([(MTFVoice *)self _pcmData])
  {
    v6 = [(MTFVoice *)self _pcmData];
    SLMMapCache::Unmap(v6, v7);
  }
  if ([(MTFVoice *)self voiceData]) {
    free([(MTFVoice *)self voiceData]);
  }
  v8.receiver = self;
  v8.super_class = (Class)MTFVoice;
  [(MTFVoice *)&v8 dealloc];
}

- (NSDictionary)pitchCoeff
{
  return self->_pitchCoeff;
}

- (void)setPitchCoeff:(id)a3
{
}

- (void)voiceData
{
  return self->_voiceData;
}

- (void)setVoiceData:(void *)a3
{
  self->_voiceData = a3;
}

- (void)_pcmData
{
  return self->__pcmData;
}

- (void)set_pcmData:(void *)a3
{
  self->__pcmData = a3;
}

- (WrappedMTVoice)wrapped
{
  return self->_wrapped;
}

- (void)setWrapped:(WrappedMTVoice *)a3
{
  self->_wrapped = a3;
}

- (void).cxx_destruct
{
}

@end