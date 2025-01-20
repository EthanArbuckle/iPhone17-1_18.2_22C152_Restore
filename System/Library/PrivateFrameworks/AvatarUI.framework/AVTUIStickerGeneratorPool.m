@interface AVTUIStickerGeneratorPool
+ (id)cacheKeyForAvatarRecord:(id)a3;
- (AVTUILogger)logger;
- (AVTUIStickerGeneratorPool)initWithMaxStickerGeneratorCount:(int64_t)a3;
- (AVTUIStickerGeneratorPool)initWithMaxStickerGeneratorCount:(int64_t)a3 logger:(id)a4;
- (NSMutableDictionary)availableStickerGenerators;
- (NSMutableDictionary)inUseStickerGenerators;
- (id)avatarForRecord:(id)a3;
- (id)dequeueStickerGeneratorForAvatarRecord:(id)a3;
- (id)dequeueStickerGeneratorForAvatarRecord:(id)a3 needAvatar:(BOOL)a4;
- (id)generatorForAvatarRecord:(id)a3 inGenerators:(id)a4;
- (id)stealGeneratorForAvatarRecord:(id)a3 inGenerators:(id)a4 needAvatar:(BOOL)a5;
- (int64_t)maxCount;
- (void)didStopUsingStickerGeneratorForRecord:(id)a3;
- (void)flush;
- (void)flushGeneratorForKey:(id)a3;
- (void)flushGeneratorForRecord:(id)a3;
@end

@implementation AVTUIStickerGeneratorPool

+ (id)cacheKeyForAvatarRecord:(id)a3
{
  id v3 = a3;
  v4 = [v3 identifier];
  if ([v3 isEditable])
  {
    v5 = [v3 avatarData];
    v6 = objc_msgSend(v5, "avt_SHA256");
    uint64_t v7 = [v4 stringByAppendingFormat:@"_%@", v6];

    v4 = (void *)v7;
  }

  return v4;
}

- (AVTUIStickerGeneratorPool)initWithMaxStickerGeneratorCount:(int64_t)a3
{
  v5 = +[AVTUIEnvironment defaultEnvironment];
  v6 = [v5 logger];
  uint64_t v7 = [(AVTUIStickerGeneratorPool *)self initWithMaxStickerGeneratorCount:a3 logger:v6];

  return v7;
}

- (AVTUIStickerGeneratorPool)initWithMaxStickerGeneratorCount:(int64_t)a3 logger:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AVTUIStickerGeneratorPool;
  v8 = [(AVTUIStickerGeneratorPool *)&v15 init];
  v9 = v8;
  if (v8)
  {
    if (a3 <= 0) {
      a3 = 5;
    }
    v8->_maxCount = a3;
    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:a3];
    availableStickerGenerators = v9->_availableStickerGenerators;
    v9->_availableStickerGenerators = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:a3];
    inUseStickerGenerators = v9->_inUseStickerGenerators;
    v9->_inUseStickerGenerators = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v9->_logger, a4);
  }

  return v9;
}

- (id)avatarForRecord:(id)a3
{
  return (id)[MEMORY[0x263F29730] avatarForRecord:a3];
}

- (id)generatorForAvatarRecord:(id)a3 inGenerators:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() cacheKeyForAvatarRecord:v6];

  v8 = [v5 objectForKey:v7];

  return v8;
}

- (id)stealGeneratorForAvatarRecord:(id)a3 inGenerators:(id)a4 needAvatar:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(AVTUIStickerGeneratorPool *)self generatorForAvatarRecord:v8 inGenerators:v9];
  if (v10 || ![v9 count])
  {
    v11 = [(id)objc_opt_class() cacheKeyForAvatarRecord:v8];
    [v9 removeObjectForKey:v11];

    id v12 = v10;
  }
  else
  {
    v13 = [v9 allKeys];
    v14 = [v13 firstObject];

    objc_super v15 = [v9 objectForKey:v14];
    v16 = v15;
    if (a5)
    {
      v17 = [(AVTUIStickerGeneratorPool *)self avatarForRecord:v8];
      [v16 setAvatar:v17];
    }
    else
    {
      [v15 setAvatar:0];
    }
    [v9 removeObjectForKey:v14];
    id v12 = v16;
  }
  return v12;
}

- (id)dequeueStickerGeneratorForAvatarRecord:(id)a3
{
  return [(AVTUIStickerGeneratorPool *)self dequeueStickerGeneratorForAvatarRecord:a3 needAvatar:1];
}

- (id)dequeueStickerGeneratorForAvatarRecord:(id)a3 needAvatar:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(AVTUIStickerGeneratorPool *)self inUseStickerGenerators];
  id v8 = [(AVTUIStickerGeneratorPool *)self generatorForAvatarRecord:v6 inGenerators:v7];

  if (!v8)
  {
    id v9 = [(AVTUIStickerGeneratorPool *)self availableStickerGenerators];
    id v8 = [(AVTUIStickerGeneratorPool *)self stealGeneratorForAvatarRecord:v6 inGenerators:v9 needAvatar:v4];

    if (!v8)
    {
      uint64_t v10 = [(AVTUIStickerGeneratorPool *)self inUseStickerGenerators];
      uint64_t v11 = [v10 count];
      id v12 = [(AVTUIStickerGeneratorPool *)self availableStickerGenerators];
      unint64_t v13 = [v12 count] + v11;
      unint64_t v14 = [(AVTUIStickerGeneratorPool *)self maxCount];

      if (v13 >= v14)
      {
        objc_super v15 = (void *)MEMORY[0x21052FFD0]();
        v16 = [(AVTUIStickerGeneratorPool *)self inUseStickerGenerators];
        v17 = [v16 allKeys];
        v18 = [v17 firstObject];

        [(AVTUIStickerGeneratorPool *)self flushGeneratorForKey:v18];
      }
      v19 = [(AVTUIStickerGeneratorPool *)self inUseStickerGenerators];
      uint64_t v20 = [v19 count];
      v21 = [(AVTUIStickerGeneratorPool *)self availableStickerGenerators];
      unint64_t v22 = [v21 count] + v20;
      unint64_t v23 = [(AVTUIStickerGeneratorPool *)self maxCount];

      if (v22 >= v23
        || (!v4
          ? (v24 = 0)
          : ([(AVTUIStickerGeneratorPool *)self avatarForRecord:v6],
             v24 = objc_claimAutoreleasedReturnValue()),
            id v8 = (void *)[objc_alloc(MEMORY[0x263F296D0]) initWithAvatar:v24],
            v24,
            !v8))
      {
        v25 = [(AVTUIStickerGeneratorPool *)self inUseStickerGenerators];
        id v8 = [(AVTUIStickerGeneratorPool *)self stealGeneratorForAvatarRecord:v6 inGenerators:v25 needAvatar:v4];

        v26 = [(AVTUIStickerGeneratorPool *)self logger];
        v27 = [(AVTUIStickerGeneratorPool *)self inUseStickerGenerators];
        objc_msgSend(v26, "logStickerGeneratorPoolDidntHaveAvailableGenerator:maxCount:", objc_msgSend(v27, "count"), -[AVTUIStickerGeneratorPool maxCount](self, "maxCount"));
      }
    }
  }
  v28 = [(AVTUIStickerGeneratorPool *)self inUseStickerGenerators];
  v29 = [(id)objc_opt_class() cacheKeyForAvatarRecord:v6];
  [v28 setObject:v8 forKey:v29];

  return v8;
}

- (void)didStopUsingStickerGeneratorForRecord:(id)a3
{
  id v4 = a3;
  id v9 = [(id)objc_opt_class() cacheKeyForAvatarRecord:v4];

  id v5 = [(AVTUIStickerGeneratorPool *)self inUseStickerGenerators];
  id v6 = [v5 objectForKey:v9];

  if (v6)
  {
    id v7 = [(AVTUIStickerGeneratorPool *)self inUseStickerGenerators];
    [v7 removeObjectForKey:v9];

    id v8 = [(AVTUIStickerGeneratorPool *)self availableStickerGenerators];
    [v8 setObject:v6 forKey:v9];
  }
}

- (void)flushGeneratorForKey:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(AVTUIStickerGeneratorPool *)self inUseStickerGenerators];
    [v5 removeObjectForKey:v4];

    id v6 = [(AVTUIStickerGeneratorPool *)self availableStickerGenerators];
    [v6 removeObjectForKey:v4];
  }
}

- (void)flushGeneratorForRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() cacheKeyForAvatarRecord:v4];

  [(AVTUIStickerGeneratorPool *)self flushGeneratorForKey:v5];
}

- (void)flush
{
  id v3 = [(AVTUIStickerGeneratorPool *)self inUseStickerGenerators];
  [v3 removeAllObjects];

  id v4 = [(AVTUIStickerGeneratorPool *)self availableStickerGenerators];
  [v4 removeAllObjects];
}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (NSMutableDictionary)availableStickerGenerators
{
  return self->_availableStickerGenerators;
}

- (NSMutableDictionary)inUseStickerGenerators
{
  return self->_inUseStickerGenerators;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_inUseStickerGenerators, 0);
  objc_storeStrong((id *)&self->_availableStickerGenerators, 0);
}

@end