@interface _BlastDoorLPPlatformColor
- (BOOL)isEqual:(id)a3;
- (double)a;
- (double)b;
- (double)g;
- (double)r;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setA:(double)a3;
- (void)setB:(double)a3;
- (void)setG:(double)a3;
- (void)setR:(double)a3;
@end

@implementation _BlastDoorLPPlatformColor

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_BlastDoorLPPlatformColor allocWithZone:a3];
  if (v4)
  {
    [(_BlastDoorLPPlatformColor *)self r];
    -[_BlastDoorLPPlatformColor setR:](v4, "setR:");
    [(_BlastDoorLPPlatformColor *)self g];
    -[_BlastDoorLPPlatformColor setG:](v4, "setG:");
    [(_BlastDoorLPPlatformColor *)self b];
    -[_BlastDoorLPPlatformColor setB:](v4, "setB:");
    [(_BlastDoorLPPlatformColor *)self a];
    -[_BlastDoorLPPlatformColor setA:](v4, "setA:");
    v5 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_BlastDoorLPPlatformColor;
  if ([(_BlastDoorLPPlatformColor *)&v20 isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      [(_BlastDoorLPPlatformColor *)self r];
      double v8 = v7;
      [v6 r];
      if (v8 != v9) {
        goto LABEL_8;
      }
      [(_BlastDoorLPPlatformColor *)self g];
      double v11 = v10;
      [v6 g];
      if (v11 != v12) {
        goto LABEL_8;
      }
      [(_BlastDoorLPPlatformColor *)self b];
      double v14 = v13;
      [v6 b];
      if (v14 == v15 && (-[_BlastDoorLPPlatformColor a](self, "a"), double v17 = v16, [v6 a], v17 == v18)) {
        BOOL v5 = 1;
      }
      else {
LABEL_8:
      }
        BOOL v5 = 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = NSNumber;
  [(_BlastDoorLPPlatformColor *)self r];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v5 = [v4 hash];
  id v6 = NSNumber;
  [(_BlastDoorLPPlatformColor *)self g];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v8 = [v7 hash] ^ v5;
  double v9 = NSNumber;
  [(_BlastDoorLPPlatformColor *)self b];
  double v10 = objc_msgSend(v9, "numberWithDouble:");
  uint64_t v11 = [v10 hash];
  double v12 = NSNumber;
  [(_BlastDoorLPPlatformColor *)self a];
  double v13 = objc_msgSend(v12, "numberWithDouble:");
  unint64_t v14 = v8 ^ v11 ^ [v13 hash];

  return v14;
}

- (double)r
{
  return self->_r;
}

- (void)setR:(double)a3
{
  self->_r = a3;
}

- (double)g
{
  return self->_g;
}

- (void)setG:(double)a3
{
  self->_g = a3;
}

- (double)b
{
  return self->_b;
}

- (void)setB:(double)a3
{
  self->_b = a3;
}

- (double)a
{
  return self->_a;
}

- (void)setA:(double)a3
{
  self->_a = a3;
}

@end