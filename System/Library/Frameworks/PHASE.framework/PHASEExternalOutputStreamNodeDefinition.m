@interface PHASEExternalOutputStreamNodeDefinition
+ (id)new;
- (BOOL)normalize;
- (NSNumber)targetLKFS;
- (NSUUID)uuid;
- (PHASEExternalOutputStreamNodeDefinition)init;
- (PHASEExternalOutputStreamNodeDefinition)initWithExternalOutputStreamUUID:(id)a3 mixerDefinition:(id)a4 channelLayoutTag:(unsigned int)a5 uid:(id)a6;
- (unsigned)channelLayoutTag;
- (void)setNormalize:(BOOL)a3;
- (void)setTargetLKFS:(id)a3;
@end

@implementation PHASEExternalOutputStreamNodeDefinition

- (PHASEExternalOutputStreamNodeDefinition)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PHASEExternalOutputStreamNodeDefinition)initWithExternalOutputStreamUUID:(id)a3 mixerDefinition:(id)a4 channelLayoutTag:(unsigned int)a5 uid:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PHASEExternalOutputStreamNodeDefinition;
  v14 = [(PHASEGeneratorNodeDefinition *)&v19 initInternal:v12];
  v15 = (PHASEExternalOutputStreamNodeDefinition *)v14;
  if (v14)
  {
    objc_storeStrong(v14 + 11, a3);
    v15->_channelLayoutTag = a5;
    uint64_t v16 = [NSNumber numberWithDouble:-12.0];
    targetLKFS = v15->_targetLKFS;
    v15->_targetLKFS = (NSNumber *)v16;

    [(PHASEDefinition *)v15 setIdentifier:v13];
  }

  return v15;
}

- (void)setTargetLKFS:(id)a3
{
  id v12 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v12 doubleValue];
  double v9 = PHASEGetPropertyBounded<double>(v6, v7, v8, -100.0, 0.0);

  v10 = [NSNumber numberWithDouble:v9];
  targetLKFS = self->_targetLKFS;
  self->_targetLKFS = v10;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unsigned)channelLayoutTag
{
  return self->_channelLayoutTag;
}

- (BOOL)normalize
{
  return self->_normalize;
}

- (void)setNormalize:(BOOL)a3
{
  self->_normalize = a3;
}

- (NSNumber)targetLKFS
{
  return self->_targetLKFS;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLKFS, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end