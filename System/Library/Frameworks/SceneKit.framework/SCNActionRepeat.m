@interface SCNActionRepeat
+ (BOOL)supportsSecureCoding;
+ (id)repeatAction:(id)a3 count:(unint64_t)a4;
+ (id)repeatActionForever:(id)a3;
- (BOOL)isCustom;
- (SCNActionRepeat)init;
- (SCNActionRepeat)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCNActionRepeat

- (SCNActionRepeat)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNActionRepeat;
  if ([(SCNAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SCNActionRepeat)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNActionRepeat;
  if (-[SCNAction initWithCoder:](&v4, sel_initWithCoder_)) {
    operator new();
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNActionRepeat;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_mycaction->var21), @"_timesToRepeat");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_mycaction->var20), @"_timesRepeated");
  [a3 encodeObject:self->_repeatedAction forKey:@"_repeatedAction"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_mycaction->var23), @"_forever");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isCustom
{
  return [(SCNAction *)self->_repeatedAction isCustom];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNActionRepeat;
  [(SCNAction *)&v3 dealloc];
}

+ (id)repeatAction:(id)a3 count:(unint64_t)a4
{
  if (a3)
  {
    v6 = objc_alloc_init(SCNActionRepeat);
    v7 = (SCNAction *)[a3 copy];
    v6->_repeatedAction = v7;
    v6->_mycaction->var19 = [(SCNAction *)v7 caction];
    v6->_mycaction->var21 = a4;
    [a3 duration];
    [(SCNAction *)v6 setDuration:v8 * (double)a4];
  }
  else
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[SCNActionRepeat repeatAction:count:](v9);
    }
    return +[SCNActionRepeat repeatAction:count:](SCNActionRepeat, "repeatAction:count:", +[SCNAction waitForDuration:1.0], a4);
  }
  return v6;
}

+ (id)repeatActionForever:(id)a3
{
  if (a3)
  {
    objc_super v4 = objc_alloc_init(SCNActionRepeat);
    objc_super v5 = (SCNAction *)[a3 copy];
    v4->_repeatedAction = v5;
    v4->_mycaction->var19 = [(SCNAction *)v5 caction];
    v4->_mycaction->var23 = 1;
  }
  else
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[SCNActionRepeat repeatActionForever:](v6);
    }
    return +[SCNActionRepeat repeatActionForever:](SCNActionRepeat, "repeatActionForever:", +[SCNAction waitForDuration:1.0]);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  mycaction = self->_mycaction;
  repeatedAction = self->_repeatedAction;
  if (mycaction->var23) {
    id v6 = +[SCNActionRepeat repeatActionForever:repeatedAction];
  }
  else {
    id v6 = +[SCNActionRepeat repeatAction:repeatedAction count:mycaction->var21];
  }
  id v8 = v6;
  objc_msgSend(v6, "setTimingMode:", -[SCNAction timingMode](self, "timingMode"));

  return v8;
}

- (id)reversedAction
{
  id result = +[SCNActionRepeat repeatAction:count:](SCNActionRepeat, "repeatAction:count:", [self->_mycaction->var19->var3 reversedAction], self->_mycaction->var21);
  *(unsigned char *)(*((void *)result + 2) + 176) = self->_mycaction->var23;
  return result;
}

+ (void)repeatAction:(os_log_t)log count:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: repeatAction: invoked with a nil action", v1, 2u);
}

+ (void)repeatActionForever:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: repeatActionForever: invoked with a nil action", v1, 2u);
}

@end