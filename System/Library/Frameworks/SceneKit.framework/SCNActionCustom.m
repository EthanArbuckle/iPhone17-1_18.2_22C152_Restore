@interface SCNActionCustom
+ (BOOL)supportsSecureCoding;
+ (id)customActionWithDuration:(double)a3 actionBlock:(id)a4;
- (BOOL)isCustom;
- (SCNActionCustom)init;
- (SCNActionCustom)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCNActionCustom

- (SCNActionCustom)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNActionCustom;
  if ([(SCNAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SCNActionCustom;
  [(SCNAction *)&v2 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNActionCustom;
  [(SCNAction *)&v4 encodeWithCoder:a3];
  objc_super v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[SCNActionCustom encodeWithCoder:](v3);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isCustom
{
  return 1;
}

- (SCNActionCustom)initWithCoder:(id)a3
{
  objc_super v4 = scn_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[SCNActionCustom initWithCoder:](v4);
  }
  return [(SCNActionCustom *)self init];
}

+ (id)customActionWithDuration:(double)a3 actionBlock:(id)a4
{
  v6 = objc_alloc_init(SCNActionCustom);
  uint64_t v7 = [(SCNAction *)v6 caction];
  *(void *)(v7 + 144) = _Block_copy(a4);
  double v8 = 1.79769313e308;
  if (fabs(a3) != INFINITY) {
    double v8 = a3;
  }
  [(SCNAction *)v6 setDuration:v8];
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SCNActionCustom;
  id v4 = [(SCNAction *)&v8 copyWithZone:a3];
  v5 = [(SCNAction *)self caction];
  uint64_t v6 = [v4 caction];
  *(void *)(v6 + 144) = _Block_copy(v5[1].var0);
  return v4;
}

- (id)reversedAction
{
  id v2 = [(SCNAction *)self copy];

  return v2;
}

- (void)encodeWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: SCNAction: Custom actions can not be properly encoded, Objective-C blocks do not support NSSecureCoding.", v1, 2u);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: SCNAction: Custom actions can not be properly decoded, Objective-C blocks do not support NSCoding.", v1, 2u);
}

@end