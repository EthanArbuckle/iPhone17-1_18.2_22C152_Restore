@interface SCNAudioSource
+ (BOOL)supportsSecureCoding;
+ (SCNAudioSource)audioSourceNamed:(NSString *)fileName;
+ (SCNAudioSource)audioSourceWithAVAudioPCMBuffer:(id)a3;
- (BOOL)isPositional;
- (BOOL)loops;
- (BOOL)shouldStream;
- (SCNAudioSource)initWithAVAudioPCMBuffer:(id)a3;
- (SCNAudioSource)initWithCoder:(id)a3;
- (SCNAudioSource)initWithFileNamed:(NSString *)name;
- (SCNAudioSource)initWithFileNamed:(id)a3 inBundle:(id)a4;
- (SCNAudioSource)initWithURL:(NSURL *)url;
- (double)duration;
- (float)rate;
- (float)reverbBlend;
- (float)volume;
- (id)audioBuffer;
- (id)audioBufferFormat;
- (id)audioFile;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fileName;
- (int64_t)renderingAlgorithm;
- (void)_customDecodingOfSCNAudioSource:(id)a3;
- (void)_customEncodingOfSCNAudioSource:(id)a3;
- (void)_load;
- (void)_loadURLWithBundle:(id)a3;
- (void)dealloc;
- (void)load;
- (void)loadIfNeeded;
- (void)setLoops:(BOOL)loops;
- (void)setPositional:(BOOL)positional;
- (void)setRate:(float)rate;
- (void)setReverbBlend:(float)reverbBlend;
- (void)setShouldStream:(BOOL)shouldStream;
- (void)setVolume:(float)volume;
@end

@implementation SCNAudioSource

+ (SCNAudioSource)audioSourceWithAVAudioPCMBuffer:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithAVAudioPCMBuffer:a3];

  return (SCNAudioSource *)v3;
}

- (SCNAudioSource)initWithAVAudioPCMBuffer:(id)a3
{
  v4 = [(SCNAudioSource *)self init];
  if (v4)
  {
    v4->_audioBuffer = (AVAudioPCMBuffer *)a3;
    [(SCNAudioSource *)v4 setPositional:1];
    LODWORD(v5) = 1.0;
    [(SCNAudioSource *)v4 setVolume:v5];
    LODWORD(v6) = 1.0;
    [(SCNAudioSource *)v4 setRate:v6];
  }
  return v4;
}

- (int64_t)renderingAlgorithm
{
  if ([(SCNAudioSource *)self isPositional]) {
    return 0;
  }
  else {
    return 5;
  }
}

- (void)_loadURLWithBundle:(id)a3
{
  p_audioName = &self->_audioName;
  audioName = self->_audioName;
  if (audioName)
  {
    v7 = [(NSString *)audioName pathExtension];
    if (v7 && (v8 = (__CFString *)v7, [(NSString *)v7 length]))
    {
      v9 = [(NSString *)*p_audioName stringByDeletingPathExtension];
      id v10 = a3;
      v11 = v8;
    }
    else
    {
      v12 = (void *)[a3 URLForResource:*p_audioName withExtension:@"caf"];
      if (v12 || (v12 = (void *)[a3 URLForResource:*p_audioName withExtension:@"caff"]) != 0)
      {
LABEL_11:
        self->_audioURL = (NSURL *)v12;
        return;
      }
      v9 = *p_audioName;
      v11 = @"aiff";
      id v10 = a3;
    }
    v12 = (void *)[v10 URLForResource:v9 withExtension:v11];
    if (!v12)
    {
      v13 = scn_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SCNAudioSource _loadURLWithBundle:]((uint64_t *)p_audioName, v13);
      }
      v12 = 0;
    }
    goto LABEL_11;
  }
}

- (SCNAudioSource)initWithFileNamed:(id)a3 inBundle:(id)a4
{
  double v6 = [(SCNAudioSource *)self init];
  if (v6)
  {
    v6->_audioName = (NSString *)a3;
    [(SCNAudioSource *)v6 setPositional:1];
    LODWORD(v7) = 1.0;
    [(SCNAudioSource *)v6 setVolume:v7];
    LODWORD(v8) = 1.0;
    [(SCNAudioSource *)v6 setRate:v8];
    [(SCNAudioSource *)v6 _loadURLWithBundle:a4];
  }
  return v6;
}

- (id)fileName
{
  return self->_audioName;
}

- (SCNAudioSource)initWithFileNamed:(NSString *)name
{
  uint64_t v5 = [MEMORY[0x263F086E0] mainBundle];

  return [(SCNAudioSource *)self initWithFileNamed:name inBundle:v5];
}

- (SCNAudioSource)initWithURL:(NSURL *)url
{
  v8.receiver = self;
  v8.super_class = (Class)SCNAudioSource;
  v4 = [(SCNAudioSource *)&v8 init];
  if (v4)
  {
    v4->_audioURL = url;
    [(SCNAudioSource *)v4 setPositional:1];
    LODWORD(v5) = 1.0;
    [(SCNAudioSource *)v4 setVolume:v5];
    LODWORD(v6) = 1.0;
    [(SCNAudioSource *)v4 setRate:v6];
  }
  return v4;
}

+ (SCNAudioSource)audioSourceNamed:(NSString *)fileName
{
  if (audioSourceNamed__onceToken != -1) {
    dispatch_once(&audioSourceNamed__onceToken, &__block_literal_global_8);
  }
  result = (SCNAudioSource *)[(id)audioSourceNamed__gAudioSources objectForKey:fileName];
  if (!result)
  {
    double v5 = [[SCNAudioSource alloc] initWithFileNamed:fileName];
    double v6 = v5;
    if (fileName && v5) {
      [(id)audioSourceNamed__gAudioSources setObject:v5 forKey:fileName];
    }
    return v6;
  }
  return result;
}

id __35__SCNAudioSource_audioSourceNamed___block_invoke()
{
  v0 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  audioSourceNamed__gAudioSources = (uint64_t)v0;

  return v0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNAudioSource;
  [(SCNAudioSource *)&v3 dealloc];
}

- (void)load
{
  if (!self->_loaded) {
    [(SCNAudioSource *)self _load];
  }
}

- (void)_load
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Error reading file into buffer: %@", (uint8_t *)&v4, 0xCu);
}

- (void)loadIfNeeded
{
  if (!self->_loaded) {
    [(SCNAudioSource *)self load];
  }
}

- (id)audioBufferFormat
{
  [(SCNAudioSource *)self loadIfNeeded];
  audioBuffer = self->_audioBuffer;

  return (id)[(AVAudioPCMBuffer *)audioBuffer format];
}

- (id)audioBuffer
{
  return self->_audioBuffer;
}

- (id)audioFile
{
  return self->_audioFile;
}

- (double)duration
{
  if ([(SCNAudioSource *)self loops]) {
    return 1.79769313e308;
  }
  [(SCNAudioSource *)self loadIfNeeded];
  audioFile = self->_audioFile;
  if (!audioFile) {
    return 0.0;
  }
  if (self->_audioBuffer) {
    double v5 = (float)[(AVAudioPCMBuffer *)self->_audioBuffer frameLength];
  }
  else {
    double v5 = (double)[(AVAudioFile *)audioFile length];
  }
  [(AVAudioFormat *)[(AVAudioFile *)self->_audioFile fileFormat] sampleRate];
  return v5 / v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_audioName)
  {
    int v4 = +[SCNAudioSource audioSourceNamed:](SCNAudioSource, "audioSourceNamed:");
  }
  else
  {
    if (self->_audioURL)
    {
      double v5 = [[SCNAudioSource alloc] initWithURL:self->_audioURL];
      goto LABEL_6;
    }
    if (!self->_audioBuffer)
    {
      double v6 = 0;
      goto LABEL_7;
    }
    int v4 = +[SCNAudioSource audioSourceWithAVAudioPCMBuffer:](SCNAudioSource, "audioSourceWithAVAudioPCMBuffer:");
  }
  double v5 = v4;
LABEL_6:
  double v6 = v5;
LABEL_7:
  [(SCNAudioSource *)v6 setPositional:[(SCNAudioSource *)self isPositional]];
  [(SCNAudioSource *)self volume];
  -[SCNAudioSource setVolume:](v6, "setVolume:");
  [(SCNAudioSource *)self rate];
  -[SCNAudioSource setRate:](v6, "setRate:");
  [(SCNAudioSource *)v6 setLoops:[(SCNAudioSource *)self loops]];
  [(SCNAudioSource *)v6 setShouldStream:[(SCNAudioSource *)self shouldStream]];
  return v6;
}

- (id)copy
{
  return [(SCNAudioSource *)self copyWithZone:0];
}

- (void)_customEncodingOfSCNAudioSource:(id)a3
{
  audioName = self->_audioName;
  if (audioName)
  {
    double v6 = @"name";
    id v7 = a3;
LABEL_5:
    [v7 encodeObject:audioName forKey:v6];
    goto LABEL_6;
  }
  if (self->_audioURL)
  {
    double v6 = @"url";
    id v7 = a3;
    audioName = 0;
    goto LABEL_5;
  }
  objc_super v8 = scn_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[SCNAudioSource _customEncodingOfSCNAudioSource:](v8);
  }
LABEL_6:
  [(SCNAudioSource *)self volume];
  objc_msgSend(a3, "encodeFloat:forKey:", @"volume");
  [(SCNAudioSource *)self rate];
  objc_msgSend(a3, "encodeFloat:forKey:", @"rate");
  [(SCNAudioSource *)self reverbBlend];
  objc_msgSend(a3, "encodeFloat:forKey:", @"reverbBlend");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAudioSource isPositional](self, "isPositional"), @"positional");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAudioSource loops](self, "loops"), @"loops");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNAudioSource shouldStream](self, "shouldStream"), @"shouldStream");
}

- (void)_customDecodingOfSCNAudioSource:(id)a3
{
  p_audioName = &self->_audioName;
  if (self->_audioName)
  {
    double v6 = @"name";
  }
  else
  {
    p_audioName = &self->_audioURL;
    if (!self->_audioURL) {
      goto LABEL_6;
    }
    double v6 = @"url";
  }
  void *p_audioName = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:v6];
LABEL_6:
  [a3 decodeFloatForKey:@"volume"];
  -[SCNAudioSource setVolume:](self, "setVolume:");
  [a3 decodeFloatForKey:@"rate"];
  -[SCNAudioSource setRate:](self, "setRate:");
  [a3 decodeFloatForKey:@"reverbBlend"];
  -[SCNAudioSource setReverbBlend:](self, "setReverbBlend:");
  -[SCNAudioSource setPositional:](self, "setPositional:", [a3 decodeBoolForKey:@"positional"]);
  -[SCNAudioSource setLoops:](self, "setLoops:", [a3 decodeBoolForKey:@"loops"]);
  -[SCNAudioSource setShouldStream:](self, "setShouldStream:", [a3 decodeBoolForKey:@"shouldStream"]);

  [(SCNAudioSource *)self loadIfNeeded];
}

- (SCNAudioSource)initWithCoder:(id)a3
{
  int v4 = [(SCNAudioSource *)self init];
  double v5 = v4;
  if (v4) {
    [(SCNAudioSource *)v4 _customDecodingOfSCNAudioSource:a3];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)volume
{
  return self->volume;
}

- (void)setVolume:(float)volume
{
  self->volume = volume;
}

- (BOOL)isPositional
{
  return self->positional;
}

- (void)setPositional:(BOOL)positional
{
  self->positional = positional;
}

- (float)rate
{
  return self->rate;
}

- (void)setRate:(float)rate
{
  self->rate = rate;
}

- (float)reverbBlend
{
  return self->reverbBlend;
}

- (void)setReverbBlend:(float)reverbBlend
{
  self->reverbBlend = reverbBlend;
}

- (BOOL)loops
{
  return self->_loops;
}

- (void)setLoops:(BOOL)loops
{
  self->_loops = loops;
}

- (BOOL)shouldStream
{
  return self->_shouldStream;
}

- (void)setShouldStream:(BOOL)shouldStream
{
  self->_shouldStream = shouldStream;
}

- (void)_loadURLWithBundle:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: failed to load audio source at %@", (uint8_t *)&v3, 0xCu);
}

- (void)_customEncodingOfSCNAudioSource:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: can't archive audio data directly", v1, 2u);
}

@end