@interface DIAttributeImage
+ (BOOL)supportsSecureCoding;
- (DIAttributeImage)init;
- (DIAttributeImage)initWithCoder:(id)a3;
- (NSData)getCurrentValue;
- (NSString)encoding;
- (id)defaultValue;
- (id)description;
- (unint64_t)format;
- (unint64_t)height;
- (unint64_t)width;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentValue:(id)a3;
- (void)setEncoding:(id)a3;
- (void)setFormat:(unint64_t)a3;
- (void)setHeight:(unint64_t)a3;
- (void)setWidth:(unint64_t)a3;
@end

@implementation DIAttributeImage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DIAttributeImage;
  id v4 = a3;
  [(DIAttribute *)&v5 encodeWithCoder:v4];
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v4, "encodeObject:forKey:", self->_encoding, @"encoding", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_format forKey:@"format"];
  [v4 encodeInteger:self->_height forKey:@"height"];
  [v4 encodeInteger:self->_width forKey:@"width"];

  os_unfair_lock_unlock(&self->super._lock);
}

- (DIAttributeImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIAttributeImage;
  objc_super v5 = [(DIAttribute *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encoding"];
    encoding = v5->_encoding;
    v5->_encoding = (NSString *)v6;

    v5->_format = [v4 decodeIntegerForKey:@"format"];
    v5->_height = [v4 decodeIntegerForKey:@"height"];
    v5->_width = [v4 decodeIntegerForKey:@"width"];
  }

  return v5;
}

- (DIAttributeImage)init
{
  v6.receiver = self;
  v6.super_class = (Class)DIAttributeImage;
  v2 = [(DIAttribute *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(DIAttribute *)v2 setAttributeType:3];
    encoding = v3->_encoding;
    v3->_encoding = (NSString *)@"unknown";

    v3->_format = 0;
    v3->_height = 0;
    v3->_width = 0;
  }
  return v3;
}

- (void)setCurrentValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DIAttributeImage;
  [(DIAttribute *)&v3 setCurrentValue:a3];
}

- (void)setEncoding:(id)a3
{
  objc_super v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_encoding != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    encoding = self->_encoding;
    self->_encoding = v4;
  }
  os_unfair_lock_unlock(&self->super._lock);
}

- (void)setFormat:(unint64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_format = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setHeight:(unint64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_height = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setWidth:(unint64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_width = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSData)getCurrentValue
{
  v4.receiver = self;
  v4.super_class = (Class)DIAttributeImage;
  v2 = [(DIAttribute *)&v4 getCurrentValue];
  return (NSData *)v2;
}

- (id)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)DIAttributeImage;
  v2 = [(DIAttribute *)&v4 defaultValue];
  return v2;
}

- (NSString)encoding
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  objc_super v4 = self->_encoding;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)format
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  unint64_t format = self->_format;
  os_unfair_lock_unlock(p_lock);
  return format;
}

- (unint64_t)height
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  unint64_t height = self->_height;
  os_unfair_lock_unlock(p_lock);
  return height;
}

- (unint64_t)width
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  unint64_t width = self->_width;
  os_unfair_lock_unlock(p_lock);
  return width;
}

- (id)description
{
  objc_super v3 = [MEMORY[0x263F089D8] stringWithFormat:&stru_26C5761E0];
  v7.receiver = self;
  v7.super_class = (Class)DIAttributeImage;
  objc_super v4 = [(DIAttribute *)&v7 description];
  [v3 appendFormat:@"%@", v4];

  os_unfair_lock_lock(&self->super._lock);
  [v3 appendFormat:@"encoding: '%@'; ", self->_encoding];
  os_unfair_lock_unlock(&self->super._lock);
  objc_super v5 = [(DIAttributeImage *)self getCurrentValue];
  [v3 appendFormat:@"currentValue: '%@'; ", v5];

  [v3 appendFormat:@">"];
  return v3;
}

- (void).cxx_destruct
{
}

@end