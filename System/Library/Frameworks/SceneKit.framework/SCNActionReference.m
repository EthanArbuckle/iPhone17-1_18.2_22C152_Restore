@interface SCNActionReference
- (BOOL)_isAReference;
- (NSString)referenceName;
- (SCNActionReference)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setReferenceName:(id)a3;
@end

@implementation SCNActionReference

- (void)dealloc
{
  [(SCNActionReference *)self setReferenceName:0];
  v3.receiver = self;
  v3.super_class = (Class)SCNActionReference;
  [(SCNActionGroup *)&v3 dealloc];
}

- (BOOL)_isAReference
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNActionReference;
  id v4 = [(SCNActionGroup *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setReferenceName:", -[SCNActionReference referenceName](self, "referenceName"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNActionReference referenceName](self, "referenceName"), @"referenceName");
  v5.receiver = self;
  v5.super_class = (Class)SCNActionReference;
  [(SCNActionGroup *)&v5 encodeWithCoder:a3];
}

- (SCNActionReference)initWithCoder:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)SCNActionReference;
  id v4 = [(SCNActionGroup *)&v8 init];
  if (!v4) {
    goto LABEL_7;
  }
  -[SCNActionReference setReferenceName:](v4, "setReferenceName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"referenceName"]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNActionReference initWithCoder:]();
    }
    goto LABEL_7;
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "assetCatalog"), "actionNamed:", -[SCNActionReference referenceName](v4, "referenceName"));
  if (!v5)
  {
LABEL_7:

    return 0;
  }
  v9[0] = v5;
  -[SCNActionGroup setupWithActions:](v4, "setupWithActions:", [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1]);
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
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: referenced actions can't be resolved without a SCNAssetCatalog", v2, v3, v4, v5, v6);
}

@end