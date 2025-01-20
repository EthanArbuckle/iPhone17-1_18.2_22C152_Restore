@interface SKAnimateWarp
+ (BOOL)supportsSecureCoding;
+ (id)animateWithWarps:(id)a3 times:(id)a4;
+ (id)animateWithWarps:(id)a3 times:(id)a4 restore:(BOOL)a5;
+ (id)warpTo:(id)a3 duration:(double)a4;
- (SKAnimateWarp)init;
- (SKAnimateWarp)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKAnimateWarp

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKAnimateWarp)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKAnimateWarp;
  if ([(SKAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

+ (id)warpTo:(id)a3 duration:(double)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v12[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  v7 = [NSNumber numberWithDouble:a4];
  v11 = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  v9 = +[SKAnimateWarp animateWithWarps:v6 times:v8];

  return v9;
}

+ (id)animateWithWarps:(id)a3 times:(id)a4
{
  v4 = +[SKAnimateWarp animateWithWarps:a3 times:a4 restore:0];

  return v4;
}

+ (id)animateWithWarps:(id)a3 times:(id)a4 restore:(BOOL)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v9 = [v7 count];
  if (v9 >= 1 && (uint64_t v10 = [v8 count], v10 == v9))
  {
    v11 = [v7 objectAtIndexedSubscript:0];
    v34 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v33 = a5;
      id v12 = v11;
      obuint64_t j = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v10];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v13 = v7;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v41;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v41 != v15) {
              objc_enumerationMutation(v13);
            }
            v17 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"SKAction: 'warps' must be of type SKWarpGeometryGrid"];
              goto LABEL_29;
            }
            id v18 = v17;
            uint64_t v19 = [v18 numberOfRows];
            if (v19 != [v12 numberOfRows]
              || (uint64_t v20 = [v18 numberOfColumns], v20 != objc_msgSend(v12, "numberOfColumns")))
            {
              [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"SKAction: 'warps' must all have the same number of rows and columns"];

LABEL_29:
              v27 = 0;
              goto LABEL_30;
            }
            v21 = (void *)[v18 copy];
            [obj addObject:v21];
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v45 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v13 = v8;
      uint64_t v22 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v37;
        while (2)
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v37 != v23) {
              objc_enumerationMutation(v13);
            }
            v25 = *(void **)(*((void *)&v36 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v25 floatValue];
              if (v26 >= 0.0) {
                continue;
              }
            }
            [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"SKAction: 'times' must all be increasing floating point values"];
            goto LABEL_29;
          }
          uint64_t v22 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }

      v27 = objc_alloc_init(SKAnimateWarp);
      objc_storeStrong(&v27->_mycaction->var19, obj);
      uint64_t v28 = [v13 copy];
      mycaction = v27->_mycaction;
      id var20 = mycaction->var20;
      mycaction->id var20 = (id)v28;

      v27->_mycaction->var22 = v33;
      id v13 = [v13 lastObject];
      [v13 floatValue];
      [(SKAction *)v27 setDuration:v31];
LABEL_30:
    }
    else
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"SKAction: 'warps' must be of type SKWarpGeometryGrid"];
      v27 = 0;
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"SKAction: 'warps' and 'times' arrays must have non-zero and equal counts"];
    v27 = 0;
  }

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKAnimateWarp;
  [(SKAction *)&v5 encodeWithCoder:v4];
  [v4 encodeBool:self->_mycaction->var22 forKey:@"_restore"];
  [v4 encodeObject:self->_mycaction->var19 forKey:@"_grids"];
  [v4 encodeObject:self->_mycaction->var20 forKey:@"_times"];
}

- (SKAnimateWarp)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKAnimateWarp;
  if ([(SKAction *)&v6 initWithCoder:v4]) {
    operator new();
  }

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SKAnimateWarp;
  id v4 = [(SKAction *)&v6 copyWithZone:a3];
  objc_storeStrong((id *)(v4[2] + 120), self->_mycaction->var20);
  objc_storeStrong((id *)(v4[2] + 112), self->_mycaction->var19);
  *(unsigned char *)(v4[2] + 136) = self->_mycaction->var22;
  return v4;
}

@end