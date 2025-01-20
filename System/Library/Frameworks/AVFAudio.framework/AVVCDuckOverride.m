@interface AVVCDuckOverride
- (AVVCDuckOverride)init;
- (AVVCDuckOverride)initWithDuckOthers:(id)a3 duckToLevel:(id)a4 mixWithOthers:(id)a5;
- (BOOL)isBlur;
- (NSNumber)duckOthers;
- (NSNumber)duckToLevel;
- (NSNumber)mixWithOthers;
- (id)description;
- (void)setDuckOthers:(id)a3;
- (void)setDuckToLevel:(id)a3;
- (void)setIsBlur:(BOOL)a3;
- (void)setMixWithOthers:(id)a3;
@end

@implementation AVVCDuckOverride

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixWithOthers, 0);
  objc_storeStrong((id *)&self->_duckToLevel, 0);

  objc_storeStrong((id *)&self->_duckOthers, 0);
}

- (void)setMixWithOthers:(id)a3
{
}

- (NSNumber)mixWithOthers
{
  return self->_mixWithOthers;
}

- (void)setIsBlur:(BOOL)a3
{
  self->_isBlur = a3;
}

- (BOOL)isBlur
{
  return self->_isBlur;
}

- (void)setDuckToLevel:(id)a3
{
}

- (NSNumber)duckToLevel
{
  return self->_duckToLevel;
}

- (void)setDuckOthers:(id)a3
{
}

- (NSNumber)duckOthers
{
  return self->_duckOthers;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<duckOthers(%@), duckToLevel(%@), isBlur(%d) mixWithOthers(%@)>", self->_duckOthers, self->_duckToLevel, self->_isBlur, self->_mixWithOthers];
}

- (AVVCDuckOverride)init
{
  v8.receiver = self;
  v8.super_class = (Class)AVVCDuckOverride;
  v2 = [(AVVCDuckOverride *)&v8 init];
  v3 = v2;
  if (v2)
  {
    duckOthers = v2->_duckOthers;
    v2->_duckOthers = 0;

    mixWithOthers = v3->_mixWithOthers;
    v3->_mixWithOthers = 0;

    duckToLevel = v3->_duckToLevel;
    v3->_duckToLevel = 0;

    v3->_isBlur = 0;
  }
  return v3;
}

- (AVVCDuckOverride)initWithDuckOthers:(id)a3 duckToLevel:(id)a4 mixWithOthers:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVVCDuckOverride;
  v12 = [(AVVCDuckOverride *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_duckOthers, a3);
    objc_storeStrong((id *)&v13->_duckToLevel, a4);
    v13->_isBlur = 0;
    objc_storeStrong((id *)&v13->_mixWithOthers, a5);
  }

  return v13;
}

@end