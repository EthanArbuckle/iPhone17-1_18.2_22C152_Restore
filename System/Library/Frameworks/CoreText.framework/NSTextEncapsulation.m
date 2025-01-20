@interface NSTextEncapsulation
+ (BOOL)supportsSecureCoding;
- (NSTextEncapsulation)init;
- (NSTextEncapsulation)initWithCoder:(id)a3;
- (NSTextEncapsulation)initWithShape:(unint64_t)a3;
- (UIColor)color;
- (double)lineWeight;
- (double)minimumWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)platterSize;
- (unint64_t)scale;
- (unint64_t)shape;
- (unint64_t)style;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setColor:(id)a3;
- (void)setLineWeight:(double)a3;
- (void)setMinimumWidth:(double)a3;
- (void)setPlatterSize:(unint64_t)a3;
- (void)setScale:(unint64_t)a3;
- (void)setShape:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation NSTextEncapsulation

- (void)setStyle:(unint64_t)a3
{
  self->style = a3;
}

- (void)setShape:(unint64_t)a3
{
  self->shape = a3;
}

- (void)setScale:(unint64_t)a3
{
  self->scale = a3;
}

- (void)setPlatterSize:(unint64_t)a3
{
  self->platterSize = a3;
}

- (void)setColor:(id)a3
{
}

- (NSTextEncapsulation)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSTextEncapsulation;
  return [(NSTextEncapsulation *)&v3 init];
}

- (NSTextEncapsulation)initWithShape:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSTextEncapsulation;
  v4 = [(NSTextEncapsulation *)&v7 init];
  v5 = v4;
  if (v4) {
    [(NSTextEncapsulation *)v4 setShape:a3];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[NSTextEncapsulation allocWithZone:a3] initWithShape:self->shape];
  [(NSTextEncapsulation *)v4 setScale:self->scale];
  [(NSTextEncapsulation *)v4 setPlatterSize:self->platterSize];
  [(NSTextEncapsulation *)v4 setStyle:self->style];
  [(NSTextEncapsulation *)v4 setLineWeight:self->lineWeight];
  [(NSTextEncapsulation *)v4 setMinimumWidth:self->minimumWidth];
  [(NSTextEncapsulation *)v4 setColor:self->color];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSTextEncapsulation.mm", 59, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]");
  }
  [a3 encodeInteger:self->scale forKey:@"Scale"];
  [a3 encodeInteger:self->platterSize forKey:@"PlatterSize"];
  [a3 encodeInteger:self->shape forKey:@"Shape"];
  [a3 encodeInteger:self->style forKey:@"Style"];
  [a3 encodeDouble:@"LineWeight" forKey:self->lineWeight];
  [a3 encodeDouble:@"MinimumWidth" forKey:self->minimumWidth];
  color = self->color;

  [a3 encodeObject:color forKey:@"Color"];
}

- (NSTextEncapsulation)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSTextEncapsulation.mm", 71, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]");
  }
  if (_MergedGlobals_37 != -1) {
    dispatch_once(&_MergedGlobals_37, &__block_literal_global_9);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSTextEncapsulation;
  v6 = [(NSTextEncapsulation *)&v8 init];
  if (v6)
  {
    -[NSTextEncapsulation setScale:](v6, "setScale:", [a3 decodeIntegerForKey:@"Scale"]);
    -[NSTextEncapsulation setPlatterSize:](v6, "setPlatterSize:", [a3 decodeIntegerForKey:@"PlatterSize"]);
    -[NSTextEncapsulation setShape:](v6, "setShape:", [a3 decodeIntegerForKey:@"Shape"]);
    -[NSTextEncapsulation setStyle:](v6, "setStyle:", [a3 decodeIntegerForKey:@"Style"]);
    [a3 decodeDoubleForKey:@"LineWeight"];
    -[NSTextEncapsulation setLineWeight:](v6, "setLineWeight:");
    [a3 decodeDoubleForKey:@"MinimumWidth"];
    -[NSTextEncapsulation setMinimumWidth:](v6, "setMinimumWidth:");
    -[NSTextEncapsulation setColor:](v6, "setColor:", [a3 decodeObjectOfClass:qword_1EB2CE920 forKey:@"Color"]);
  }
  return v6;
}

Class __37__NSTextEncapsulation_initWithCoder___block_invoke()
{
  Class result = NSClassFromString(&cfstr_Uicolor.isa);
  qword_1EB2CE920 = (uint64_t)result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSTextEncapsulation;
  [(NSTextEncapsulation *)&v3 dealloc];
}

- (unint64_t)scale
{
  return self->scale;
}

- (unint64_t)platterSize
{
  return self->platterSize;
}

- (unint64_t)shape
{
  return self->shape;
}

- (unint64_t)style
{
  return self->style;
}

- (double)lineWeight
{
  return self->lineWeight;
}

- (void)setLineWeight:(double)a3
{
  self->lineWeight = a3;
}

- (double)minimumWidth
{
  return self->minimumWidth;
}

- (void)setMinimumWidth:(double)a3
{
  self->minimumWidth = a3;
}

- (UIColor)color
{
  return (UIColor *)objc_getProperty(self, a2, 56, 1);
}

@end