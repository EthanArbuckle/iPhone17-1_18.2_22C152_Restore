@interface SKCropNode
+ (BOOL)supportsSecureCoding;
- (BOOL)invertMask;
- (BOOL)isEqualToNode:(id)a3;
- (BOOL)prefersAlphaMask;
- (SKCropNode)initWithCoder:(id)a3;
- (SKNode)maskNode;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_didMakeBackingNode;
- (void)_makeBackingNode;
- (void)encodeWithCoder:(id)a3;
- (void)setInvertMask:(BOOL)a3;
- (void)setMaskNode:(SKNode *)maskNode;
- (void)setPrefersAlphaMask:(BOOL)a3;
@end

@implementation SKCropNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_makeBackingNode
{
}

- (void)_didMakeBackingNode
{
  v3.receiver = self;
  v3.super_class = (Class)SKCropNode;
  [(SKNode *)&v3 _didMakeBackingNode];
  self->_skcCropNode = [(SKNode *)self _backingNode];
}

- (SKCropNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKCropNode;
  v5 = [(SKNode *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_mask"];
    [(SKCropNode *)v5 setMaskNode:v6];

    -[SKCropNode setPrefersAlphaMask:](v5, "setPrefersAlphaMask:", [v4 decodeBoolForKey:@"_prefersAlphaMask"]);
    -[SKCropNode setInvertMask:](v5, "setInvertMask:", [v4 decodeBoolForKey:@"_invertMask"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKCropNode;
  [(SKNode *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_mask forKey:@"_mask"];
  objc_msgSend(v4, "encodeBool:forKey:", -[SKCropNode prefersAlphaMask](self, "prefersAlphaMask"), @"_prefersAlphaMask");
  objc_msgSend(v4, "encodeBool:forKey:", -[SKCropNode invertMask](self, "invertMask"), @"_invertMask");
}

- (void)setMaskNode:(SKNode *)maskNode
{
  objc_super v5 = maskNode;
  objc_storeStrong((id *)&self->_mask, maskNode);
  SKCCropNode::setMaskNode((SKCNode *)self->_skcCropNode, (SKCNode *)[(SKNode *)v5 _backingNode]);
}

- (SKNode)maskNode
{
  return self->_mask;
}

- (BOOL)isEqualToNode:(id)a3
{
  id v4 = (SKCropNode *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      v12.receiver = self;
      v12.super_class = (Class)SKCropNode;
      if ([(SKNode *)&v12 isEqualToNode:v5])
      {
        v6 = [(SKCropNode *)self maskNode];
        if (v6)
        {
        }
        else
        {
          objc_super v8 = [(SKCropNode *)v5 maskNode];

          if (!v8)
          {
            char v7 = 1;
            goto LABEL_11;
          }
        }
        v9 = [(SKCropNode *)self maskNode];
        v10 = [(SKCropNode *)v5 maskNode];
        char v7 = [v9 isEqualToNode:v10];
      }
      else
      {
        char v7 = 0;
      }
LABEL_11:

      goto LABEL_12;
    }
    char v7 = 0;
  }
LABEL_12:

  return v7;
}

- (BOOL)prefersAlphaMask
{
  return *((unsigned char *)self->_skcCropNode + 688);
}

- (void)setPrefersAlphaMask:(BOOL)a3
{
}

- (BOOL)invertMask
{
  return *((unsigned char *)self->_skcCropNode + 689);
}

- (void)setInvertMask:(BOOL)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SKCropNode;
  id v4 = [(SKNode *)&v8 copyWithZone:a3];
  objc_msgSend(v4, "setPrefersAlphaMask:", -[SKCropNode prefersAlphaMask](self, "prefersAlphaMask"));
  objc_msgSend(v4, "setInvertMask:", -[SKCropNode invertMask](self, "invertMask"));
  objc_super v5 = [(SKCropNode *)self maskNode];
  v6 = (void *)[v5 copy];
  [v4 setMaskNode:v6];

  return v4;
}

- (void).cxx_destruct
{
}

@end