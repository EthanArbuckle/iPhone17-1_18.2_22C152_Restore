@interface SKRepeat
+ (BOOL)supportsSecureCoding;
+ (id)repeatAction:(id)a3 count:(unint64_t)a4;
+ (id)repeatActionForever:(id)a3;
- (SKRepeat)init;
- (SKRepeat)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (id)subactions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKRepeat

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKRepeat)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKRepeat;
  if ([(SKAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SKRepeat)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKRepeat;
  if ([(SKAction *)&v7 initWithCoder:v4]) {
    operator new();
  }
  v5 = (SKRepeat *)0;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKRepeat;
  [(SKAction *)&v8 encodeWithCoder:v4];
  v5 = [NSNumber numberWithUnsignedInteger:self->_mycaction->var21];
  [v4 encodeObject:v5 forKey:@"_timesToRepeat"];

  v6 = [NSNumber numberWithUnsignedInteger:self->_mycaction->var20];
  [v4 encodeObject:v6 forKey:@"_timesRepeated"];

  [v4 encodeObject:self->_repeatedAction forKey:@"_repeatedAction"];
  objc_super v7 = [NSNumber numberWithBool:self->_mycaction->var22];
  [v4 encodeObject:v7 forKey:@"_forever"];
}

+ (id)repeatAction:(id)a3 count:(unint64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(SKRepeat);
    uint64_t v7 = [v5 copy];
    repeatedAction = v6->_repeatedAction;
    v6->_repeatedAction = (SKAction *)v7;

    SKCReferencedAction::setReferencedCAction((SKCReferencedAction *)v6->_mycaction, [(SKAction *)v6->_repeatedAction caction]);
    v6->_mycaction->var21 = a4;
    [v5 duration];
    [(SKAction *)v6 setDuration:v9 * (double)a4];
  }
  else
  {
    [MEMORY[0x263EFF940] raise:@"Nil Action" format:@"Action to be repeated must be non-nil"];
    v6 = 0;
  }

  return v6;
}

+ (id)repeatActionForever:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(SKRepeat);
    uint64_t v5 = [v3 copy];
    repeatedAction = v4->_repeatedAction;
    v4->_repeatedAction = (SKAction *)v5;

    SKCReferencedAction::setReferencedCAction((SKCReferencedAction *)v4->_mycaction, [(SKAction *)v4->_repeatedAction caction]);
    v4->_mycaction->var22 = 1;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:@"Nil Action" format:@"Action to be repeated must be non-nil"];
    id v4 = 0;
  }

  return v4;
}

- (id)subactions
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self->_repeatedAction;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  mycaction = self->_mycaction;
  repeatedAction = self->_repeatedAction;
  if (mycaction->var22) {
    +[SKRepeat repeatActionForever:repeatedAction];
  }
  else {
  v6 = +[SKRepeat repeatAction:repeatedAction count:mycaction->var21];
  }
  objc_msgSend(v6, "setTimingMode:", -[SKAction timingMode](self, "timingMode"));
  return v6;
}

- (id)reversedAction
{
  id v3 = [(SKAction *)self->_repeatedAction reversedAction];
  id v4 = +[SKRepeat repeatAction:v3 count:self->_mycaction->var21];

  *(unsigned char *)(v4[2] + 136) = self->_mycaction->var22;

  return v4;
}

- (void).cxx_destruct
{
}

@end