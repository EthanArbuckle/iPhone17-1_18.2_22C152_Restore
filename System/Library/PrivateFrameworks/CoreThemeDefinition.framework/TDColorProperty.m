@interface TDColorProperty
- (float)alpha;
- (float)blue;
- (float)green;
- (float)red;
- (void)addToDictionary:(id)a3;
- (void)dealloc;
- (void)setAlpha:(float)a3;
- (void)setBlue:(float)a3;
- (void)setGreen:(float)a3;
- (void)setRed:(float)a3;
@end

@implementation TDColorProperty

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TDColorProperty;
  [(TDProperty *)&v2 dealloc];
}

- (float)red
{
  [(TDColorProperty *)self willAccessValueForKey:@"red"];
  float red = self->_red;
  [(TDColorProperty *)self didAccessValueForKey:@"red"];
  return red;
}

- (void)setRed:(float)a3
{
  [(TDColorProperty *)self willChangeValueForKey:@"red"];
  self->_float red = a3;

  [(TDColorProperty *)self didChangeValueForKey:@"red"];
}

- (float)green
{
  [(TDColorProperty *)self willAccessValueForKey:@"green"];
  float green = self->_green;
  [(TDColorProperty *)self didAccessValueForKey:@"green"];
  return green;
}

- (void)setGreen:(float)a3
{
  [(TDColorProperty *)self willChangeValueForKey:@"green"];
  self->_float green = a3;

  [(TDColorProperty *)self didChangeValueForKey:@"green"];
}

- (float)blue
{
  [(TDColorProperty *)self willAccessValueForKey:@"blue"];
  float blue = self->_blue;
  [(TDColorProperty *)self didAccessValueForKey:@"blue"];
  return blue;
}

- (void)setBlue:(float)a3
{
  [(TDColorProperty *)self willChangeValueForKey:@"blue"];
  self->_float blue = a3;

  [(TDColorProperty *)self didChangeValueForKey:@"blue"];
}

- (float)alpha
{
  [(TDColorProperty *)self willAccessValueForKey:@"alpha"];
  float alpha = self->_alpha;
  [(TDColorProperty *)self didAccessValueForKey:@"alpha"];
  return alpha;
}

- (void)setAlpha:(float)a3
{
  [(TDColorProperty *)self willChangeValueForKey:@"alpha"];
  self->_float alpha = a3;

  [(TDColorProperty *)self didChangeValueForKey:@"alpha"];
}

- (void)addToDictionary:(id)a3
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  [(TDColorProperty *)self red];
  components[0] = v5;
  [(TDColorProperty *)self green];
  components[1] = v6;
  [(TDColorProperty *)self blue];
  components[2] = v7;
  [(TDColorProperty *)self alpha];
  components[3] = v8;
  v9 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
  v10 = CGColorCreate(v9, components);
  CGColorSpaceRelease(v9);
  objc_msgSend(a3, "setObject:forKey:", v10, -[TDProperty name](self, "name"));
  CGColorRelease(v10);
}

@end