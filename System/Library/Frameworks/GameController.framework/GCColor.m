@interface GCColor
+ (BOOL)supportsSecureCoding;
- (GCColor)initWithCoder:(id)a3;
- (GCColor)initWithColorPreset:(int64_t)a3;
- (GCColor)initWithRed:(float)red green:(float)green blue:(float)blue;
- (float)blue;
- (float)green;
- (float)red;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCColor

- (GCColor)initWithRed:(float)red green:(float)green blue:(float)blue
{
  v9.receiver = self;
  v9.super_class = (Class)GCColor;
  result = [(GCColor *)&v9 init];
  if (result)
  {
    result->_red = red;
    result->_green = green;
    result->_blue = blue;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  float red = self->_red;
  id v8 = a3;
  *(float *)&double v5 = red;
  [v8 encodeFloat:@"red" forKey:v5];
  *(float *)&double v6 = self->_green;
  [v8 encodeFloat:@"green" forKey:v6];
  *(float *)&double v7 = self->_blue;
  [v8 encodeFloat:@"blue" forKey:v7];
}

- (GCColor)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GCColor;
  double v5 = [(GCColor *)&v10 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"red"];
    v5->_float red = v6;
    [v4 decodeFloatForKey:@"green"];
    v5->_green = v7;
    [v4 decodeFloatForKey:@"blue"];
    v5->_blue = v8;
  }

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ r=%f g=%f b=%f>", objc_opt_class(), self->_red, self->_green, self->_blue];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
  {
    *((_DWORD *)result + 2) = LODWORD(self->_red);
    *((_DWORD *)result + 3) = LODWORD(self->_green);
    *((_DWORD *)result + 4) = LODWORD(self->_blue);
  }
  return result;
}

- (float)red
{
  return self->_red;
}

- (float)green
{
  return self->_green;
}

- (float)blue
{
  return self->_blue;
}

- (GCColor)initWithColorPreset:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      LODWORD(v3) = 1056997505;
      LODWORD(v4) = 1017159841;
      LODWORD(v5) = 1017159841;
      break;
    case 3:
      LODWORD(v4) = 1056997505;
      LODWORD(v3) = 1017159841;
      goto LABEL_7;
    case 4:
      LODWORD(v3) = 1017159841;
      LODWORD(v5) = 1056997505;
      goto LABEL_9;
    case 5:
      LODWORD(v4) = 1017159841;
      LODWORD(v3) = 1056997505;
LABEL_7:
      LODWORD(v5) = LODWORD(v3);
      break;
    case 6:
      LODWORD(v3) = 1056997505;
      LODWORD(v5) = 1017159841;
LABEL_9:
      LODWORD(v4) = LODWORD(v3);
      break;
    default:
      LODWORD(v3) = 1056997505;
      LODWORD(v4) = 1040220289;
      LODWORD(v5) = 1017159841;
      break;
  }
  float v6 = [(GCColor *)self initWithRed:v3 green:v4 blue:v5];

  return v6;
}

@end