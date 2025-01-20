@interface HKAxisLabel
- (BOOL)isEqual:(id)a3;
- (NSString)text;
- (id)description;
- (id)location;
- (int64_t)labelType;
- (unint64_t)hash;
- (void)setLabelType:(int64_t)a3;
- (void)setLocation:(id)a3;
- (void)setText:(id)a3;
@end

@implementation HKAxisLabel

- (id)description
{
  unint64_t v3 = [(HKAxisLabel *)self labelType];
  if (v3 > 2) {
    v4 = 0;
  }
  else {
    v4 = off_1E6D55970[v3];
  }
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)HKAxisLabel;
  v6 = [(HKAxisLabel *)&v11 description];
  v7 = [(HKAxisLabel *)self text];
  v8 = [(HKAxisLabel *)self location];
  v9 = [v5 stringWithFormat:@"%@ text=%@ location=%@ type=%@", v6, v7, v8, v4];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKAxisLabel *)a3;
  if ([(HKAxisLabel *)v4 isMemberOfClass:objc_opt_class()])
  {
    if (self == v4)
    {
      char v9 = 1;
    }
    else
    {
      v5 = [(HKAxisLabel *)self location];
      v6 = [(HKAxisLabel *)v4 location];
      if (HKUIObjectsAreEqual(v5, v6))
      {
        v7 = [(HKAxisLabel *)self text];
        v8 = [(HKAxisLabel *)v4 text];
        char v9 = HKUIObjectsAreEqual(v7, v8);
      }
      else
      {
        char v9 = 0;
      }
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKAxisLabel *)self location];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v5 = [(HKAxisLabel *)self text];
  uint64_t v6 = [v5 hash];
  if (isKindOfClass)
  {
    v7 = [(HKAxisLabel *)self location];
    uint64_t v8 = [v7 hash];
  }
  else
  {
    char v9 = (void *)MEMORY[0x1E4F29238];
    v7 = [(HKAxisLabel *)self location];
    v10 = [v9 valueWithPointer:v7];
    uint64_t v8 = [v10 hash];
  }
  return v8 ^ v6;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (id)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int64_t)labelType
{
  return self->_labelType;
}

- (void)setLabelType:(int64_t)a3
{
  self->_labelType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_location, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end