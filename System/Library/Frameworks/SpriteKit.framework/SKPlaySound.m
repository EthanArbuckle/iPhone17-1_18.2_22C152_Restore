@interface SKPlaySound
+ (BOOL)supportsSecureCoding;
+ (id)_audioURLWithName:(id)a3 bundle:(id)a4;
+ (id)playSoundFileNamed:(id)a3 atPosition:(CGPoint)a4 waitForCompletion:(BOOL)a5;
- (SKPlaySound)init;
- (SKPlaySound)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKPlaySound

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKPlaySound)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKPlaySound;
  v2 = [(SKAction *)&v5 init];
  if (v2)
  {
    soundSource = v2->_soundSource;
    v2->_soundSource = 0;

    operator new();
  }
  return 0;
}

- (SKPlaySound)initWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKPlaySound;
  if ([(SKAction *)&v6 initWithCoder:v4]) {
    operator new();
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKPlaySound;
  [(SKAction *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_fileName forKey:@"_fileName"];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"_position", self->_position.x, self->_position.y);
  [v4 encodeBool:self->_mycaction->var21 forKey:@"_wait"];
}

+ (id)playSoundFileNamed:(id)a3 atPosition:(CGPoint)a4 waitForCompletion:(BOOL)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v8 = a3;
  v9 = objc_alloc_init(SKPlaySound);
  v9->_position.CGFloat x = x;
  v9->_position.CGFloat y = y;
  uint64_t v10 = [v8 copy];
  fileName = v9->_fileName;
  v9->_fileName = (NSString *)v10;

  v12 = objc_opt_class();
  v13 = v9->_fileName;
  v14 = SKGetResourceBundle();
  v15 = [v12 _audioURLWithName:v13 bundle:v14];
  uint64_t v16 = [v15 path];
  filePath = v9->_filePath;
  v9->_filePath = (NSString *)v16;

  v9->_mycaction->var21 = a5;
  if (v9->_filePath)
  {
    SKCRendererEnsureSoundContext();
    v18 = +[SKSoundBuffer bufferWithFileNamed:v9->_filePath];
    v19 = +[SKSoundSource sourceWithBuffer:v18];
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "setPosition:", v9->_position.x, v9->_position.y);
      objc_storeStrong((id *)&v9->_soundSource, v20);
      objc_storeWeak(&v9->_mycaction->var19, v20);
      if (v9->_mycaction->var21) {
        [v18 duration];
      }
      else {
        double v21 = 0.0;
      }
      [(SKAction *)v9 setDuration:v21];
    }
    else
    {
      NSLog(&cfstr_SkactionErrorL.isa, v8);
    }
  }
  else
  {
    NSLog(&cfstr_SkactionErrorL.isa, v8);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SKPlaySound;
  id v4 = [(SKAction *)&v12 copyWithZone:a3];
  objc_storeStrong((id *)v4 + 3, self->_fileName);
  objc_super v5 = (id *)(v4 + 16);
  objc_storeStrong((id *)v4 + 2, self->_filePath);
  *(CGPoint *)(v4 + 40) = self->_position;
  *(unsigned char *)(*((void *)v4 + 4) + 121) = self->_mycaction->var21;
  if (*((void *)v4 + 2))
  {
    SKCRendererEnsureSoundContext();
    objc_super v6 = +[SKSoundBuffer bufferWithFileNamed:*v5];
    v7 = +[SKSoundSource sourceWithBuffer:v6];
    id v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "setPosition:", *((double *)v4 + 5), *((double *)v4 + 6));
      objc_storeStrong((id *)v4 + 7, v8);
      objc_storeWeak((id *)(*((void *)v4 + 4) + 112), v8);
      if (*(unsigned char *)(*((void *)v4 + 4) + 121)) {
        [v6 duration];
      }
      else {
        double v9 = 0.0;
      }
      [(SKAction *)self setDuration:v9];
    }
    else
    {
      uint64_t v10 = [*v5 lastPathComponent];
      NSLog(&cfstr_SkactionErrorL.isa, v10);
      id v8 = (void *)v10;
    }
  }
  return v4;
}

+ (id)_audioURLWithName:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 URLForResource:v5 withExtension:0];
  if (!v7)
  {
    v7 = [v6 URLForResource:v5 withExtension:@"caf"];
    if (!v7)
    {
      v7 = [v6 URLForResource:v5 withExtension:@"wav"];
      if (!v7)
      {
        v7 = [v6 URLForResource:v5 withExtension:@"caff"];
        if (!v7)
        {
          v7 = [v6 URLForResource:v5 withExtension:@"aiff"];
          if (!v7)
          {
            v7 = [v6 URLForResource:v5 withExtension:@"mp3"];
          }
        }
      }
    }
  }

  return v7;
}

- (id)reversedAction
{
  id v2 = [(SKAction *)self copy];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundSource, 0);
  objc_storeStrong((id *)&self->_fileName, 0);

  objc_storeStrong((id *)&self->_filePath, 0);
}

@end