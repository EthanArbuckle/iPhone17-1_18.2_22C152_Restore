@interface SKEffectNode
+ (BOOL)supportsSecureCoding;
+ (id)debugHierarchyPropertyDescriptions;
+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
- (BOOL)isEqualToNode:(id)a3;
- (BOOL)shouldCenterFilter;
- (BOOL)shouldEnableEffects;
- (BOOL)shouldRasterize;
- (CIFilter)filter;
- (NSString)description;
- (SKAttributeValue)valueForAttributeNamed:(NSString *)key;
- (SKBlendMode)blendMode;
- (SKEffectNode)init;
- (SKEffectNode)initWithCoder:(id)a3;
- (SKShader)shader;
- (SKWarpGeometry)warpGeometry;
- (int64_t)subdivisionLevels;
- (void)_didMakeBackingNode;
- (void)_flippedChangedFrom:(BOOL)a3 to:(BOOL)a4;
- (void)_makeBackingNode;
- (void)_scaleFactorChangedFrom:(float)a3 to:(float)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setBlendMode:(SKBlendMode)blendMode;
- (void)setFilter:(CIFilter *)filter;
- (void)setShader:(SKShader *)shader;
- (void)setShouldCenterFilter:(BOOL)shouldCenterFilter;
- (void)setShouldEnableEffects:(BOOL)shouldEnableEffects;
- (void)setShouldRasterize:(BOOL)shouldRasterize;
- (void)setSubdivisionLevels:(int64_t)a3;
- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key;
- (void)setWarpGeometry:(id)a3;
@end

@implementation SKEffectNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKEffectNode)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKEffectNode;
  v2 = [(SKNode *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SKEffectNode *)v2 setShouldEnableEffects:1];
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKEffectNode;
  [(SKNode *)&v11 encodeWithCoder:v4];
  objc_super v5 = [(SKEffectNode *)self filter];
  [v4 encodeObject:v5 forKey:@"_filter"];

  v6 = [(SKEffectNode *)self shader];
  [v4 encodeObject:v6 forKey:@"_shader"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[SKEffectNode shouldRasterize](self, "shouldRasterize"));
  [v4 encodeObject:v7 forKey:@"_shouldRasterize"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SKEffectNode shouldEnableEffects](self, "shouldEnableEffects"));
  [v4 encodeObject:v8 forKey:@"_shouldEnableEffects"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[SKEffectNode shouldCenterFilter](self, "shouldCenterFilter"));
  [v4 encodeObject:v9 forKey:@"_shouldCenterFilter"];

  v10 = objc_msgSend(NSNumber, "numberWithLong:", -[SKEffectNode blendMode](self, "blendMode"));
  [v4 encodeObject:v10 forKey:@"_blendMode"];
}

- (SKEffectNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKEffectNode;
  objc_super v5 = [(SKNode *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_blendMode"];
    -[SKEffectNode setBlendMode:](v5, "setBlendMode:", (int)[v6 intValue]);

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_filter"];
    [(SKEffectNode *)v5 setFilter:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shouldCenterFilter"];
    -[SKEffectNode setShouldCenterFilter:](v5, "setShouldCenterFilter:", [v8 BOOLValue]);

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shouldEnableEffects"];
    -[SKEffectNode setShouldEnableEffects:](v5, "setShouldEnableEffects:", [v9 BOOLValue]);

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shouldRasterize"];
    -[SKEffectNode setShouldRasterize:](v5, "setShouldRasterize:", [v10 BOOLValue]);

    objc_super v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shader"];
    [(SKEffectNode *)v5 setShader:v11];
  }
  return v5;
}

- (void)_makeBackingNode
{
}

- (void)_didMakeBackingNode
{
  v3.receiver = self;
  v3.super_class = (Class)SKEffectNode;
  [(SKNode *)&v3 _didMakeBackingNode];
  self->_skcEffectNode = [(SKNode *)self _backingNode];
}

- (NSString)description
{
  id v4 = NSString;
  objc_super v5 = [(SKNode *)self name];
  if ([(SKEffectNode *)self shouldEnableEffects]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = [(SKEffectNode *)self filter];
  if (v7)
  {
    v2 = [(SKEffectNode *)self filter];
    v8 = [v2 name];
  }
  else
  {
    v8 = @"nil";
  }
  [(SKNode *)self position];
  v9 = NSStringFromCGPoint(v14);
  [(SKNode *)self calculateAccumulatedFrame];
  v10 = NSStringFromCGRect(v15);
  objc_super v11 = [v4 stringWithFormat:@"<SKEffectNode> name:'%@' shouldEnableEffects:'%@' filter:'%@' position:%@ accumulatedFrame:%@", v5, v6, v8, v9, v10];

  if (v7)
  {
  }

  return (NSString *)v11;
}

- (BOOL)isEqualToNode:(id)a3
{
  id v4 = (SKEffectNode *)a3;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      v14.receiver = self;
      v14.super_class = (Class)SKEffectNode;
      if ([(SKNode *)&v14 isEqualToNode:v5]
        && (BOOL v6 = [(SKEffectNode *)self shouldEnableEffects],
            v6 == [(SKEffectNode *)v5 shouldEnableEffects]))
      {
        v8 = [(SKEffectNode *)self filter];
        v9 = [(SKEffectNode *)v5 filter];
        if (v8 == v9
          && (BOOL v10 = [(SKEffectNode *)self shouldCenterFilter],
              v10 == [(SKEffectNode *)v5 shouldCenterFilter])
          && (SKBlendMode v11 = [(SKEffectNode *)self blendMode], v11 == [(SKEffectNode *)v5 blendMode]))
        {
          BOOL v12 = [(SKEffectNode *)self shouldRasterize];
          BOOL v7 = v12 ^ [(SKEffectNode *)v5 shouldRasterize] ^ 1;
        }
        else
        {
          LOBYTE(v7) = 0;
        }
      }
      else
      {
        LOBYTE(v7) = 0;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (void)setWarpGeometry:(id)a3
{
}

- (SKWarpGeometry)warpGeometry
{
  return (SKWarpGeometry *)*((id *)self->_skcEffectNode + 89);
}

- (void)setSubdivisionLevels:(int64_t)a3
{
}

- (int64_t)subdivisionLevels
{
  return *((unsigned int *)self->_skcEffectNode + 180);
}

- (void)setFilter:(CIFilter *)filter
{
  objc_storeStrong((id *)self->_skcEffectNode + 70, filter);
  objc_super v5 = filter;
  SKCNode::setDirty((SKCNode *)self->_skcEffectNode);
}

- (CIFilter)filter
{
  return (CIFilter *)*((id *)self->_skcEffectNode + 70);
}

- (BOOL)shouldEnableEffects
{
  return SKCEffectNode::getEnableEffects((SKCEffectNode *)self->_skcEffectNode);
}

- (void)setShouldEnableEffects:(BOOL)shouldEnableEffects
{
}

- (void)setShouldRasterize:(BOOL)shouldRasterize
{
}

- (BOOL)shouldRasterize
{
  return SKCEffectNode::getShouldRasterize((SKCEffectNode *)self->_skcEffectNode);
}

- (SKBlendMode)blendMode
{
  return *((void *)self->super._skcNode + 36);
}

- (void)setBlendMode:(SKBlendMode)blendMode
{
}

- (void)_scaleFactorChangedFrom:(float)a3 to:(float)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SKEffectNode;
  -[SKNode _scaleFactorChangedFrom:to:](&v4, sel__scaleFactorChangedFrom_to_);
}

- (void)_flippedChangedFrom:(BOOL)a3 to:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SKEffectNode;
  [(SKNode *)&v4 _flippedChangedFrom:a3 to:a4];
}

- (BOOL)shouldCenterFilter
{
  return *((unsigned char *)self->_skcEffectNode + 568);
}

- (void)setShouldCenterFilter:(BOOL)shouldCenterFilter
{
  *((unsigned char *)self->_skcEffectNode + 568) = shouldCenterFilter;
}

- (void)setShader:(SKShader *)shader
{
  objc_super v5 = shader;
  objc_storeStrong((id *)self->_skcEffectNode + 72, shader);
  SKCNode::setDirty((SKCNode *)self->_skcEffectNode);
  SKCNode::recomputeFlags((SKCNode *)self->_skcEffectNode, 1);
  [(SKShader *)v5 _addTargetNode:self];
}

- (SKShader)shader
{
  return (SKShader *)*((id *)self->_skcEffectNode + 72);
}

- (SKAttributeValue)valueForAttributeNamed:(NSString *)key
{
  v5.receiver = self;
  v5.super_class = (Class)SKEffectNode;
  objc_super v3 = [(SKNode *)&v5 valueForAttributeNamed:key];

  return (SKAttributeValue *)v3;
}

- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key
{
  v4.receiver = self;
  v4.super_class = (Class)SKEffectNode;
  [(SKNode *)&v4 setValue:value forAttributeNamed:key];
}

+ (id)debugHierarchyPropertyDescriptions
{
  v13[7] = *MEMORY[0x263EF8340];
  v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFB78];
  objc_super v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, @"propertyName", @"attributeValues");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"objectInfo");
  v13[0] = Mutable;
  objc_super v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, @"propertyName", @"filter");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v5, @"propertyFormat", @"objectInfo");
  v13[1] = v5;
  BOOL v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v6, @"propertyName", @"shouldCenterFilter");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v6, @"propertyFormat", @"b");
  v13[2] = v6;
  BOOL v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v7, @"propertyName", @"shouldEnableEffects");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v7, @"propertyFormat", @"b");
  v13[3] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v8, @"propertyName", @"shouldRasterize");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v8, @"propertyFormat", @"b");
  v13[4] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v9, @"propertyName", @"shader");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v9, @"propertyFormat", @"objectInfo");
  v13[5] = v9;
  BOOL v10 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v10, @"propertyName", @"blendMode");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"SKBlendMode");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v10, @"propertyFormat", @"uinteger");
  v13[6] = v10;
  SKBlendMode v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:7];

  return v11;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  v27[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  if (![v10 length]) {
    goto LABEL_12;
  }
  NSSelectorFromString((NSString *)v10);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((unint64_t)[v10 length] < 2)
    {
      CGRect v15 = [v10 uppercaseString];
    }
    else
    {
      BOOL v12 = [v10 substringToIndex:1];
      objc_super v13 = [v12 uppercaseString];
      objc_super v14 = [v10 substringFromIndex:1];
      CGRect v15 = [v13 stringByAppendingString:v14];
    }
    v16 = [@"is" stringByAppendingString:v15];
    NSSelectorFromString(v16);
    if (objc_opt_respondsToSelector()) {
      SKBlendMode v11 = v16;
    }
    else {
      SKBlendMode v11 = 0;
    }

    if (v11) {
      goto LABEL_4;
    }
LABEL_12:
    if (a6)
    {
      id v17 = v9;
      v18 = (__CFString *)v10;
      if (v17)
      {
        v19 = [NSString stringWithFormat:@"%@", v17];
      }
      else
      {
        v19 = &stru_26BEEFD10;
      }
      if (v18) {
        v20 = v18;
      }
      else {
        v20 = &stru_26BEEFD10;
      }
      v21 = v20;
      v26[0] = @"propertyName";
      v26[1] = @"objectDescription";
      v27[0] = v21;
      v27[1] = v19;
      v26[2] = @"errorDescription";
      v27[2] = &stru_26BEEFD10;
      v22 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
      v23 = [MEMORY[0x263F087E8] errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v22];

      id v24 = v23;
      *a6 = v24;

      SKBlendMode v11 = 0;
      a6 = 0;
    }
    else
    {
      SKBlendMode v11 = 0;
    }
    goto LABEL_21;
  }
  SKBlendMode v11 = (NSString *)v10;
  if (!v11) {
    goto LABEL_12;
  }
LABEL_4:
  a6 = [v9 valueForKey:v11];
LABEL_21:

  return a6;
}

@end