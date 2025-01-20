@interface SKAudioNode
+ (BOOL)supportsSecureCoding;
+ (id)_audioURLWithName:(id)a3 bundle:(id)a4;
- (AVAudioNode)avAudioNode;
- (BOOL)autoplayLooped;
- (BOOL)isEqualToNode:(id)a3;
- (BOOL)isPositional;
- (SKAudioNode)init;
- (SKAudioNode)initWithAVAudioNode:(AVAudioNode *)node;
- (SKAudioNode)initWithCoder:(NSCoder *)aDecoder;
- (SKAudioNode)initWithFileNamed:(NSString *)name;
- (SKAudioNode)initWithFileNamed:(id)a3 bundle:(id)a4;
- (SKAudioNode)initWithURL:(NSURL *)url;
- (id)audioFile;
- (id)audioFileName;
- (id)audioURL;
- (void)_connectToScene:(id)a3;
- (void)_didMakeBackingNode;
- (void)_makeBackingNode;
- (void)_playLooped;
- (void)_setAudioName:(id)a3 bundle:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioFileName:(id)a3;
- (void)setAudioURL:(id)a3;
- (void)setAutoplayLooped:(BOOL)autoplayLooped;
- (void)setAvAudioNode:(AVAudioNode *)avAudioNode;
- (void)setPositional:(BOOL)positional;
@end

@implementation SKAudioNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_makeBackingNode
{
}

- (void)_didMakeBackingNode
{
  self->_skcAudioNode = [(SKNode *)self _backingNode];
}

- (SKAudioNode)init
{
  return [(SKAudioNode *)self initWithAVAudioNode:0];
}

- (SKAudioNode)initWithAVAudioNode:(AVAudioNode *)node
{
  v5 = node;
  v9.receiver = self;
  v9.super_class = (Class)SKAudioNode;
  v6 = [(SKNode *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(SKAudioNode *)v6 setAutoplayLooped:1];
    [(SKAudioNode *)v7 setPositional:1];
    objc_storeStrong((id *)v7->_skcAudioNode + 73, node);
    [(SKAudioNode *)v7 commonInit];
  }

  return v7;
}

- (SKAudioNode)initWithCoder:(NSCoder *)aDecoder
{
  v4 = aDecoder;
  v20.receiver = self;
  v20.super_class = (Class)SKAudioNode;
  v5 = [(SKNode *)&v20 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    [(SKAudioNode *)v5 commonInit];
    [(SKAudioNode *)v6 setAutoplayLooped:[(NSCoder *)v4 decodeBoolForKey:@"_autoplayLooped"]];
    v7 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_audioName"];
    [(SKAudioNode *)v6 setAudioFileName:v7];

    v8 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_audioURL"];
    [(SKAudioNode *)v6 setAudioURL:v8];

    objc_super v9 = [(SKAudioNode *)v6 audioFileName];

    if (v9)
    {
      id v10 = [(SKAudioNode *)v6 audioFileName];
      SKGetResourceBundle();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      [(SKAudioNode *)v6 _setAudioName:v10 bundle:v11];
LABEL_6:

      goto LABEL_7;
    }
    v12 = [(SKAudioNode *)v6 audioURL];

    if (v12)
    {
      id v13 = objc_alloc(MEMORY[0x263EF9380]);
      v14 = [(SKAudioNode *)v6 audioURL];
      id v19 = 0;
      uint64_t v15 = [v13 initForReading:v14 error:&v19];
      id v10 = v19;
      skcAudioNode = v6->_skcAudioNode;
      v17 = (void *)skcAudioNode[70];
      skcAudioNode[70] = v15;

      id v11 = objc_alloc_init(MEMORY[0x263EF93C8]);
      [(SKAudioNode *)v6 setAvAudioNode:v11];
      goto LABEL_6;
    }
  }
LABEL_7:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKAudioNode;
  [(SKNode *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[SKAudioNode autoplayLooped](self, "autoplayLooped"), @"_autoplayLooped");
  v5 = [(SKAudioNode *)self audioFileName];
  [v4 encodeObject:v5 forKey:@"_audioName"];

  v6 = [(SKAudioNode *)self audioURL];
  [v4 encodeObject:v6 forKey:@"_audioURL"];
}

- (BOOL)isEqualToNode:(id)a3
{
  id v4 = (SKAudioNode *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v18.receiver = self;
      v18.super_class = (Class)SKAudioNode;
      if (![(SKNode *)&v18 isEqualToNode:v5] || self->_autoplayLooped != v5[152]) {
        goto LABEL_16;
      }
      v6 = [(SKAudioNode *)self audioFileName];
      if (v6)
      {
      }
      else
      {
        v8 = [v5 audioFileName];

        if (!v8)
        {
LABEL_11:
          v12 = [(SKAudioNode *)self audioURL];
          if (v12)
          {
          }
          else
          {
            id v13 = [v5 audioURL];

            if (!v13)
            {
LABEL_15:
              BOOL v7 = 1;
LABEL_17:

              goto LABEL_18;
            }
          }
          v14 = [(SKAudioNode *)self audioURL];
          uint64_t v15 = [v5 audioURL];
          char v16 = [v14 isEqual:v15];

          if (v16) {
            goto LABEL_15;
          }
LABEL_16:
          BOOL v7 = 0;
          goto LABEL_17;
        }
      }
      objc_super v9 = [(SKAudioNode *)self audioFileName];
      id v10 = [v5 audioFileName];
      char v11 = [v9 isEqualToString:v10];

      if ((v11 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_11;
    }
    BOOL v7 = 0;
  }
LABEL_18:

  return v7;
}

- (SKAudioNode)initWithFileNamed:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() _audioURLWithName:v6 bundle:v7];
  if (v8)
  {
    uint64_t v14 = 0;
    objc_super v9 = (void *)[objc_alloc(MEMORY[0x263EF9380]) initForReading:v8 error:&v14];
  }
  else
  {
    objc_super v9 = 0;
  }
  id v10 = objc_alloc_init(MEMORY[0x263EF93C8]);
  char v11 = [(SKAudioNode *)self initWithAVAudioNode:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)v11->_skcAudioNode + 70, v9);
    [(SKAudioNode *)v12 setAudioFileName:v6];
  }

  return v12;
}

- (SKAudioNode)initWithFileNamed:(NSString *)name
{
  id v4 = name;
  v5 = SKGetResourceBundle();
  id v6 = [(SKAudioNode *)self initWithFileNamed:v4 bundle:v5];

  return v6;
}

- (SKAudioNode)initWithURL:(NSURL *)url
{
  id v4 = url;
  if (v4)
  {
    uint64_t v10 = 0;
    v5 = (void *)[objc_alloc(MEMORY[0x263EF9380]) initForReading:v4 error:&v10];
  }
  else
  {
    v5 = 0;
  }
  id v6 = objc_alloc_init(MEMORY[0x263EF93C8]);
  id v7 = [(SKAudioNode *)self initWithAVAudioNode:v6];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)v7->_skcAudioNode + 70, v5);
    [(SKAudioNode *)v8 setAudioURL:v4];
  }

  return v8;
}

- (id)audioFile
{
  return *((id *)self->_skcAudioNode + 70);
}

- (id)audioFileName
{
  return *((id *)self->_skcAudioNode + 72);
}

- (void)setAudioFileName:(id)a3
{
}

- (id)audioURL
{
  return *((id *)self->_skcAudioNode + 71);
}

- (void)setAudioURL:(id)a3
{
}

- (AVAudioNode)avAudioNode
{
  return (AVAudioNode *)*((id *)self->_skcAudioNode + 73);
}

- (void)setAvAudioNode:(AVAudioNode *)avAudioNode
{
}

- (void)_playLooped
{
  objc_initWeak(&location, self);
  id v3 = *((id *)self->_skcAudioNode + 70);
  uint64_t v4 = [(SKAudioNode *)self avAudioNode];
  v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v7 = objc_loadWeakRetained(&location);
    v8 = [v7 scene];

    if (v8)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __26__SKAudioNode__playLooped__block_invoke;
      v9[3] = &unk_263FE9D70;
      objc_copyWeak(&v10, &location);
      [v5 scheduleFile:v3 atTime:0 completionHandler:v9];
      objc_destroyWeak(&v10);
    }
  }

  objc_destroyWeak(&location);
}

void __26__SKAudioNode__playLooped__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__SKAudioNode__playLooped__block_invoke_2;
  block[3] = &unk_263FE9D70;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __26__SKAudioNode__playLooped__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _playLooped];
}

+ (id)_audioURLWithName:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 URLForResource:v5 withExtension:0];
  if (!v7)
  {
    id v7 = [v6 URLForResource:v5 withExtension:@"caf"];
    if (!v7)
    {
      id v7 = [v6 URLForResource:v5 withExtension:@"wav"];
      if (!v7)
      {
        id v7 = [v6 URLForResource:v5 withExtension:@"caff"];
        if (!v7)
        {
          id v7 = [v6 URLForResource:v5 withExtension:@"aiff"];
          if (!v7)
          {
            id v7 = [v6 URLForResource:v5 withExtension:@"mp3"];
          }
        }
      }
    }
  }

  return v7;
}

- (void)_setAudioName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SKAudioNode *)self setAudioFileName:v6];
  if (v6)
  {
    v8 = [(id)objc_opt_class() _audioURLWithName:v6 bundle:v7];
    if (v8)
    {
      id v21 = 0;
      uint64_t v9 = [objc_alloc(MEMORY[0x263EF9380]) initForReading:v8 error:&v21];
      id v10 = v21;
      skcAudioNode = self->_skcAudioNode;
      v12 = (void *)skcAudioNode[70];
      skcAudioNode[70] = v9;
    }
    id v13 = self->_skcAudioNode;
    uint64_t v14 = (void *)v13[73];
    if (v14 || !v13[70])
    {
      v13[73] = 0;
    }
    else
    {
      id v15 = objc_alloc_init(MEMORY[0x263EF93C8]);
      char v16 = self->_skcAudioNode;
      v17 = (void *)v16[73];
      v16[73] = v15;

      objc_super v18 = [(SKNode *)self parent];
      id v19 = [v18 scene];

      if (!v19) {
        goto LABEL_7;
      }
      uint64_t v14 = [(SKNode *)self parent];
      objc_super v20 = [v14 scene];
      [(SKAudioNode *)self _connectToScene:v20];
    }
LABEL_7:
  }
}

- (void)_connectToScene:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [(SKAudioNode *)self audioFile];
  id v5 = [(SKAudioNode *)self avAudioNode];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 engine];
    v8 = v7;
    if (v7) {
      [v7 detachNode:v6];
    }
    uint64_t v9 = [v14 audioEngine];
    if (v9)
    {
      [v6 setRenderingAlgorithm:1];
      [v9 attachNode:v6];
      id v10 = [v4 processingFormat];
      if ([v10 channelCount] >= 2)
      {
        id v11 = objc_alloc(MEMORY[0x263EF9388]);
        [v10 sampleRate];
        uint64_t v12 = objc_msgSend(v11, "initStandardFormatWithSampleRate:channels:", 1);

        id v10 = (void *)v12;
      }
      id v13 = [v14 avAudioEnvironmentNode];
      [v9 connect:v6 to:v13 format:v10];

      if (self->_autoplayLooped)
      {
        [(SKAudioNode *)self _playLooped];
        if ([v9 isRunning]) {
          [v6 play];
        }
      }
    }
  }
}

- (BOOL)autoplayLooped
{
  return self->_autoplayLooped;
}

- (void)setAutoplayLooped:(BOOL)autoplayLooped
{
  self->_autoplayLooped = autoplayLooped;
}

- (BOOL)isPositional
{
  return self->_positional;
}

- (void)setPositional:(BOOL)positional
{
  self->_positional = positional;
}

@end