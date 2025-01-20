@interface SCNActionJavaScript
+ (BOOL)supportsSecureCoding;
+ (id)javaScriptActionWithDuration:(double)a3 script:(id)a4;
- (BOOL)isCustom;
- (SCNActionJavaScript)initWithCoder:(id)a3;
- (SCNActionJavaScript)initWithString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)parameters;
- (id)reversedAction;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCNActionJavaScript

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCNActionJavaScript)initWithString:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNActionJavaScript;
  v4 = [(SCNAction *)&v6 init];
  if (v4)
  {
    v4->_script = (NSString *)[a3 copy];
    operator new();
  }
  return 0;
}

+ (id)javaScriptActionWithDuration:(double)a3 script:(id)a4
{
  v5 = [[SCNActionJavaScript alloc] initWithString:a4];
  [(SCNAction *)v5 setDuration:a3];
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNActionJavaScript;
  [(SCNAction *)&v3 dealloc];
}

- (BOOL)isCustom
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[SCNActionJavaScript alloc] initWithString:self->_script];
  v5 = [(SCNAction *)self caction];
  uint64_t v6 = [(SCNAction *)v4 caction];
  *(_OWORD *)(v6 + 56) = *(_OWORD *)&v5->var7;
  *(void *)(v6 + 104) = v5->var14;
  *(_OWORD *)(v6 + 120) = *(_OWORD *)&v5->var16;
  *(_WORD *)(v6 + 80) = 0;
  return v4;
}

- (id)reversedAction
{
  id v2 = [(SCNAction *)self copy];

  return v2;
}

- (SCNActionJavaScript)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNActionJavaScript;
  v4 = -[SCNAction initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_script = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"script"), "copy");
    operator new();
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNActionJavaScript;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_script forKey:@"script"];
}

- (id)parameters
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = self->_script;
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
}

@end