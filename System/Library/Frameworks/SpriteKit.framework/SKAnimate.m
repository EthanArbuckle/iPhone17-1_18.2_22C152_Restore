@interface SKAnimate
+ (BOOL)supportsSecureCoding;
+ (id)animateWithNormalTextures:(id)a3 timePerFrame:(double)a4 resize:(BOOL)a5 restore:(BOOL)a6;
+ (id)animateWithTextures:(id)a3 timePerFrame:(double)a4 resize:(BOOL)a5 restore:(BOOL)a6;
- (SKAnimate)init;
- (SKAnimate)initWithCoder:(id)a3;
- (double)timePerFrame;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(double)a3;
- (void)setTimePerFrame:(double)a3;
@end

@implementation SKAnimate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKAnimate)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKAnimate;
  if ([(SKAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SKAnimate)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKAnimate;
  if ([(SKAction *)&v6 initWithCoder:v4]) {
    operator new();
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKAnimate;
  [(SKAction *)&v6 encodeWithCoder:v4];
  v5 = [NSNumber numberWithDouble:*((double *)self->_mycaction + 17)];
  [v4 encodeObject:v5 forKey:@"_timePerFrame"];

  [v4 encodeObject:self->_textures forKey:@"_textures"];
  [v4 encodeBool:*((unsigned __int8 *)self->_mycaction + 161) forKey:@"_resize"];
  [v4 encodeBool:*((unsigned __int8 *)self->_mycaction + 160) forKey:@"_restore"];
}

+ (id)animateWithTextures:(id)a3 timePerFrame:(double)a4 resize:(BOOL)a5 restore:(BOOL)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (![v9 count]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"SKAction animateWithTextures: textures array cannot be empty"];
  }
  v10 = objc_alloc_init(SKAnimate);
  uint64_t v11 = [v9 copy];
  textures = v10->_textures;
  v10->_textures = (NSArray *)v11;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v13 = v10->_textures;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        id v23 = *(id *)(*((void *)&v19 + 1) + 8 * i);
        std::vector<UITouch * {__strong}>::push_back[abi:ne180100]((char **)v10->_mycaction + 14, &v23);
      }
      uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v14);
  }

  *((double *)v10->_mycaction + 17) = a4;
  -[SKAnimate setDuration:](v10, "setDuration:", (double)(unint64_t)objc_msgSend(v9, "count", (void)v19) * a4);
  mycaction = v10->_mycaction;
  mycaction[160] = a6;
  mycaction[161] = a5;

  return v10;
}

+ (id)animateWithNormalTextures:(id)a3 timePerFrame:(double)a4 resize:(BOOL)a5 restore:(BOOL)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (![v9 count]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"SKAction animateWithNormalTextures: textures array cannot be empty"];
  }
  v10 = objc_alloc_init(SKAnimate);
  uint64_t v11 = [v9 copy];
  textures = v10->_textures;
  v10->_textures = (NSArray *)v11;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v13 = v10->_textures;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        id v23 = *(id *)(*((void *)&v19 + 1) + 8 * i);
        std::vector<UITouch * {__strong}>::push_back[abi:ne180100]((char **)v10->_mycaction + 14, &v23);
      }
      uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v14);
  }

  *((double *)v10->_mycaction + 17) = a4;
  -[SKAnimate setDuration:](v10, "setDuration:", (double)(unint64_t)objc_msgSend(v9, "count", (void)v19) * a4);
  mycaction = v10->_mycaction;
  mycaction[160] = a6;
  mycaction[161] = a5;
  mycaction[162] = 1;

  return v10;
}

- (void)setDuration:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKAnimate;
  -[SKAction setDuration:](&v5, sel_setDuration_);
  *((double *)self->_mycaction + 17) = a3 / (double)[(NSArray *)self->_textures count];
}

- (void)setTimePerFrame:(double)a3
{
  *((double *)self->_mycaction + 17) = a3;
  double v4 = (double)[(NSArray *)self->_textures count] * a3;

  [(SKAnimate *)self setDuration:v4];
}

- (double)timePerFrame
{
  return *((double *)self->_mycaction + 17);
}

- (id)copyWithZone:(_NSZone *)a3
{
  textures = self->_textures;
  [(SKAnimate *)self timePerFrame];
  objc_super v5 = +[SKAnimate animateWithTextures:timePerFrame:resize:restore:](SKAnimate, "animateWithTextures:timePerFrame:resize:restore:", textures, *((unsigned __int8 *)self->_mycaction + 161), *((unsigned __int8 *)self->_mycaction + 160));
  objc_msgSend(v5, "setTimingMode:", -[SKAction timingMode](self, "timingMode"));
  *(unsigned char *)(v5[2] + 162) = *((unsigned char *)self->_mycaction + 162);
  return v5;
}

- (id)reversedAction
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  p_textures = &self->_textures;
  double v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_textures, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v5 = *p_textures;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "insertObject:atIndex:", *(void *)(*((void *)&v13 + 1) + 8 * i), 0, (void)v13);
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v9 = +[SKAnimate animateWithTextures:v4 timePerFrame:*((unsigned __int8 *)self->_mycaction + 161) resize:*((unsigned __int8 *)self->_mycaction + 160) restore:*((double *)self->_mycaction + 17)];
  mycaction = self->_mycaction;
  uint64_t v11 = v9[2];
  *(_DWORD *)(v11 + 60) = mycaction[15];
  *(unsigned char *)(v11 + 162) = *((unsigned char *)mycaction + 162);

  return v9;
}

- (void).cxx_destruct
{
}

@end