@interface SCNAnimationReference
- (BOOL)_isAReference;
- (NSString)referenceName;
- (SCNAnimationReference)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setReferenceName:(id)a3;
@end

@implementation SCNAnimationReference

- (void)dealloc
{
  [(SCNAnimationReference *)self setReferenceName:0];
  v3.receiver = self;
  v3.super_class = (Class)SCNAnimationReference;
  [(SCNAnimationReference *)&v3 dealloc];
}

- (BOOL)_isAReference
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNAnimationReference;
  id v4 = [(SCNAnimationReference *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setReferenceName:", -[SCNAnimationReference referenceName](self, "referenceName"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNAnimationReference referenceName](self, "referenceName"), @"referenceName");
  [(SCNAnimationReference *)self repeatCount];
  objc_msgSend(a3, "encodeFloat:forKey:", @"repeatCount");
  [(SCNAnimationReference *)self repeatDuration];
  *(float *)&double v5 = v5;
  [a3 encodeFloat:@"repeatDuration" forKey:v5];
  objc_msgSend(a3, "encodeBool:forKey:", -[CAAnimation usesSceneTimeBase](self, "usesSceneTimeBase"), @"usesSceneTimeBase");
  v6.receiver = self;
  v6.super_class = (Class)SCNAnimationReference;
  [(SCNAnimationReference *)&v6 encodeWithCoder:a3];
}

- (SCNAnimationReference)initWithCoder:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)SCNAnimationReference;
  id v4 = [(SCNAnimationReference *)&v10 init];
  if (v4)
  {
    -[SCNAnimationReference setReferenceName:](v4, "setReferenceName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"referenceName"]);
    [a3 decodeFloatForKey:@"repeatCount"];
    -[SCNAnimationReference setRepeatCount:](v4, "setRepeatCount:");
    [a3 decodeFloatForKey:@"repeatDuration"];
    [(SCNAnimationReference *)v4 setRepeatDuration:v5];
    -[CAAnimation setUsesSceneTimeBase:](v4, "setUsesSceneTimeBase:", [a3 decodeBoolForKey:@"usesSceneTimeBase"]);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v6 = objc_msgSend((id)objc_msgSend(a3, "assetCatalog"), "animationNamed:", -[SCNAnimationReference referenceName](v4, "referenceName"));
      if (v6)
      {
        v7 = v6;
        [v6 duration];
        -[SCNAnimationReference setDuration:](v4, "setDuration:");
        v11[0] = v7;
        -[SCNAnimationReference setAnimations:](v4, "setAnimations:", [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1]);
      }
    }
    else
    {
      v8 = scn_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SCNAnimationReference initWithCoder:]();
      }
    }
  }
  return v4;
}

- (NSString)referenceName
{
  return self->referenceName;
}

- (void)setReferenceName:(id)a3
{
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: referenced animations can't be resolved without a SCNAssetCatalog", v2, v3, v4, v5, v6);
}

@end