@interface CAStateElement
+ (BOOL)supportsSecureCoding;
+ (void)CAMLParserStartElement:(id)a3;
- (BOOL)CAMLTypeSupportedForKey:(id)a3;
- (BOOL)matches:(id)a3;
- (CALayer)target;
- (CAStateElement)initWithCoder:(id)a3;
- (CAStateElement)source;
- (NSString)keyPath;
- (id)CAMLTypeForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)save;
- (id)targetName;
- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5;
- (void)dealloc;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSource:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation CAStateElement

- (void)setTarget:(id)a3
{
}

- (void)setSource:(id)a3
{
}

- (id)CAMLTypeForKey:(id)a3
{
  if ([a3 isEqualToString:@"target"]) {
    return @"CALayer";
  }
  if ([a3 isEqualToString:@"targetId"]) {
    return @"string";
  }
  return 0;
}

- (BOOL)CAMLTypeSupportedForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (([a3 isEqualToString:@"target"] & 1) != 0
    || ([a3 isEqualToString:@"source"] & 1) != 0)
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAStateElement;
  return [&v6 CAMLTypeSupportedForKey:a3];
}

+ (void)CAMLParserStartElement:(id)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [a3 setElementValue:v4];
}

- (CAStateElement)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CAStateElement;
  id v4 = [(CAStateElement *)&v8 init];
  if (v4)
  {
    v5 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E4F28B90], "CA_supportedClasses"), @"target");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeWeak((id *)&v4->_target, v5);
    }
    objc_super v6 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E4F28B90], "CA_supportedClasses"), @"source");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_source = (CAStateElement *)v6;
    }
  }
  return v4;
}

- (void).cxx_destruct
{
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  v5 = (__CFString *)a5;
  if ([a5 isEqualToString:@"targetId"])
  {
    a4 = (id)[a3 objectById:a4];
    v5 = @"target";
  }

  [(CAStateElement *)self setValue:a4 forKey:v5];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CAStateElement;
  [(CAStateElement *)&v3 dealloc];
}

- (CAStateElement)source
{
  return self->_source;
}

- (CALayer)target
{
  return (CALayer *)objc_loadWeak((id *)&self->_target);
}

- (void)encodeWithCoder:(id)a3
{
  p_target = &self->_target;
  if (objc_loadWeak((id *)&self->_target)) {
    [a3 encodeConditionalObject:objc_loadWeak((id *)p_target) forKey:@"target"];
  }
  if (self->_source)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

- (void)encodeWithCAMLWriter:(id)a3
{
  p_target = &self->_target;
  if (objc_loadWeak((id *)&self->_target))
  {
    [a3 beginPropertyElement:@"target"];
    [a3 encodeObject:objc_loadWeak((id *)p_target)];
    [a3 endElement];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)save
{
  return 0;
}

- (BOOL)matches:(id)a3
{
  return 0;
}

- (NSString)keyPath
{
  return 0;
}

- (id)targetName
{
  id Weak = objc_loadWeak((id *)&self->_target);

  return (id)[Weak name];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end