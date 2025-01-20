@interface TDDeviceTraits
- (NSArray)graphicsFeatureSetFallbackValues;
- (NSArray)graphicsFeatureSetFallbacks;
- (NSArray)hostedIdiomValues;
- (NSArray)hostedIdioms;
- (NSArray)subtypeFallbackValues;
- (NSString)deploymentTarget;
- (NSString)displayGamut;
- (NSString)dynamicDisplayMode;
- (NSString)graphicsFeatureSetClass;
- (NSString)idiom;
- (TDDeviceTraits)init;
- (TDDeviceTraits)initWithPlatform:(int64_t)a3;
- (double)scale;
- (id)_deploymentTargetToTraitString:(int64_t)a3;
- (id)_displayGamutToTraitString:(int64_t)a3;
- (id)_dynamicDisplayModeToTraitString:(int64_t)a3;
- (id)_graphicsFeatureSetClassToTraitString:(int64_t)a3;
- (id)_idiomToTraitString:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)_deploymentTargetFromTraitString:(id)a3;
- (int64_t)_displayGamutFromTraitString:(id)a3;
- (int64_t)_dynamicDisplayModeFromTraitString:(id)a3;
- (int64_t)_graphicsFeatureSetClassFromTraitString:(id)a3;
- (int64_t)_idiomFromTraitString:(id)a3;
- (int64_t)deploymentTargetValue;
- (int64_t)displayGamutValue;
- (int64_t)dynamicDisplayModeValue;
- (int64_t)graphicsFeatureSetClassValue;
- (int64_t)graphicsPerformanceClass;
- (int64_t)idiomValue;
- (int64_t)memoryPerformanceClass;
- (int64_t)subtype;
- (void)dealloc;
- (void)setDeploymentTarget:(id)a3;
- (void)setDeploymentTargetValue:(int64_t)a3;
- (void)setDisplayGamut:(id)a3;
- (void)setDisplayGamutValue:(int64_t)a3;
- (void)setDynamicDisplayMode:(id)a3;
- (void)setDynamicDisplayModeValue:(int64_t)a3;
- (void)setGraphicsFeatureSetClass:(id)a3;
- (void)setGraphicsFeatureSetClassValue:(int64_t)a3;
- (void)setGraphicsFeatureSetFallbackValues:(id)a3;
- (void)setGraphicsFeatureSetFallbacks:(id)a3;
- (void)setGraphicsPerformanceClass:(int64_t)a3;
- (void)setHostedIdiomValues:(id)a3;
- (void)setHostedIdioms:(id)a3;
- (void)setIdiom:(id)a3;
- (void)setIdiomValue:(int64_t)a3;
- (void)setMemoryPerformanceClass:(int64_t)a3;
- (void)setScale:(double)a3;
- (void)setSubtype:(int64_t)a3;
- (void)setSubtypeFallbackValues:(id)a3;
@end

@implementation TDDeviceTraits

- (TDDeviceTraits)initWithPlatform:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TDDeviceTraits;
  result = [(TDDeviceTraits *)&v4 init];
  if (result) {
    result->_deploymentTargetValue = 11;
  }
  return result;
}

- (TDDeviceTraits)init
{
  uint64_t v3 = CUICurrentPlatform();

  return [(TDDeviceTraits *)self initWithPlatform:v3];
}

- (void)dealloc
{
  [(TDDeviceTraits *)self setHostedIdiomValues:0];
  [(TDDeviceTraits *)self setGraphicsFeatureSetFallbackValues:0];
  [(TDDeviceTraits *)self setSubtypeFallbackValues:0];
  v3.receiver = self;
  v3.super_class = (Class)TDDeviceTraits;
  [(TDDeviceTraits *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(TDDeviceTraits *)self scale];
  objc_msgSend(v4, "setScale:");
  objc_msgSend(v4, "setIdiomValue:", -[TDDeviceTraits idiomValue](self, "idiomValue"));
  objc_msgSend(v4, "setHostedIdiomValues:", -[TDDeviceTraits hostedIdiomValues](self, "hostedIdiomValues"));
  objc_msgSend(v4, "setSubtype:", -[TDDeviceTraits subtype](self, "subtype"));
  objc_msgSend(v4, "setDisplayGamutValue:", -[TDDeviceTraits displayGamutValue](self, "displayGamutValue"));
  objc_msgSend(v4, "setDeploymentTargetValue:", -[TDDeviceTraits deploymentTargetValue](self, "deploymentTargetValue"));
  objc_msgSend(v4, "setMemoryPerformanceClass:", -[TDDeviceTraits memoryPerformanceClass](self, "memoryPerformanceClass"));
  objc_msgSend(v4, "setGraphicsFeatureSetClassValue:", -[TDDeviceTraits graphicsFeatureSetClassValue](self, "graphicsFeatureSetClassValue"));
  objc_msgSend(v4, "setGraphicsFeatureSetFallbackValues:", -[TDDeviceTraits graphicsFeatureSetFallbackValues](self, "graphicsFeatureSetFallbackValues"));
  objc_msgSend(v4, "setSubtypeFallbackValues:", -[TDDeviceTraits subtypeFallbackValues](self, "subtypeFallbackValues"));
  objc_msgSend(v4, "setDynamicDisplayModeValue:", -[TDDeviceTraits dynamicDisplayModeValue](self, "dynamicDisplayModeValue"));
  return v4;
}

- (id)description
{
  v7 = NSString;
  objc_super v3 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v3);
  [(TDDeviceTraits *)self scale];
  return (id)[v7 stringWithFormat:@"<%@ %p scale:%f idiom:%d subtype:%d gamut:%d target:%d memPerclass:%d graphicsFeature:%d graphicsfallbackValues:%@ subtypefallbackValues:%@ displayMode:%d hostedIdioms:%@>", v6, self, v4, -[TDDeviceTraits idiomValue](self, "idiomValue"), -[TDDeviceTraits subtype](self, "subtype"), -[TDDeviceTraits displayGamutValue](self, "displayGamutValue"), -[TDDeviceTraits deploymentTargetValue](self, "deploymentTargetValue"), -[TDDeviceTraits memoryPerformanceClass](self, "memoryPerformanceClass"), -[TDDeviceTraits graphicsFeatureSetClassValue](self, "graphicsFeatureSetClassValue"), -[TDDeviceTraits graphicsFeatureSetFallbackValues](self, "graphicsFeatureSetFallbackValues"), -[TDDeviceTraits subtypeFallbackValues](self, "subtypeFallbackValues"), -[TDDeviceTraits dynamicDisplayModeValue](self, "dynamicDisplayModeValue"), -[TDDeviceTraits hostedIdioms](self, "hostedIdioms")];
}

- (id)_idiomToTraitString:(int64_t)a3
{
  uint64_t v3 = *(void *)(MEMORY[0x263F384A0] + 16);
  if (v3)
  {
    if (*MEMORY[0x263F384A0] == a3) {
      return (id)[NSString stringWithUTF8String:v3];
    }
    for (i = (uint64_t *)(MEMORY[0x263F384A0] + 40); ; i += 3)
    {
      uint64_t v3 = *i;
      if (!*i) {
        break;
      }
      uint64_t v5 = *(i - 2);
      if (v5 == a3) {
        return (id)[NSString stringWithUTF8String:v3];
      }
    }
  }
  return 0;
}

- (int64_t)_idiomFromTraitString:(id)a3
{
  uint64_t v3 = [a3 UTF8String];
  if (!v3) {
    return -1;
  }
  uint64_t v4 = (const char *)v3;
  uint64_t v5 = *(const char **)(MEMORY[0x263F384A0] + 16);
  if (!v5)
  {
LABEL_6:
    if (!strcasecmp("reality", v4)) {
      return 8;
    }
    return -1;
  }
  v6 = (int64_t *)MEMORY[0x263F384A0];
  while (strcasecmp(v5, v4))
  {
    uint64_t v5 = (const char *)v6[5];
    v6 += 3;
    if (!v5) {
      goto LABEL_6;
    }
  }
  return *v6;
}

- (void)setIdiom:(id)a3
{
  int64_t v4 = [(TDDeviceTraits *)self _idiomFromTraitString:a3];

  [(TDDeviceTraits *)self setIdiomValue:v4];
}

- (NSString)idiom
{
  uint64_t v3 = [(TDDeviceTraits *)self idiom];

  return (NSString *)[(TDDeviceTraits *)self _idiomToTraitString:v3];
}

- (void)setHostedIdioms:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", -[TDDeviceTraits _idiomFromTraitString:](self, "_idiomFromTraitString:", *(void *)(*((void *)&v10 + 1) + 8 * v9++))));
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  [(TDDeviceTraits *)self setHostedIdiomValues:v5];
}

- (NSArray)hostedIdioms
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v4 = [(TDDeviceTraits *)self hostedIdiomValues];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", -[TDDeviceTraits _idiomToTraitString:](self, "_idiomToTraitString:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "integerValue")));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return (NSArray *)v3;
}

- (id)_graphicsFeatureSetClassToTraitString:(int64_t)a3
{
  uint64_t v3 = *(void *)(MEMORY[0x263F38490] + 16);
  if (v3)
  {
    if (*MEMORY[0x263F38490] == a3) {
      return (id)[NSString stringWithUTF8String:v3];
    }
    for (i = (uint64_t *)(MEMORY[0x263F38490] + 40); ; i += 3)
    {
      uint64_t v3 = *i;
      if (!*i) {
        break;
      }
      uint64_t v5 = *(i - 2);
      if (v5 == a3) {
        return (id)[NSString stringWithUTF8String:v3];
      }
    }
  }
  return 0;
}

- (int64_t)_graphicsFeatureSetClassFromTraitString:(id)a3
{
  uint64_t v3 = [a3 UTF8String];
  if (!v3) {
    return -1;
  }
  int64_t v4 = (const char *)v3;
  uint64_t v5 = *(const char **)(MEMORY[0x263F38498] + 16);
  if (v5)
  {
    uint64_t v6 = (int64_t *)MEMORY[0x263F38498];
    while (strcasecmp(v5, v4))
    {
      uint64_t v5 = (const char *)v6[5];
      v6 += 3;
      if (!v5) {
        goto LABEL_6;
      }
    }
    return *v6;
  }
LABEL_6:
  uint64_t v7 = *(const char **)(MEMORY[0x263F38490] + 16);
  if (!v7) {
    return -1;
  }
  uint64_t v6 = (int64_t *)MEMORY[0x263F38490];
  while (strcasecmp(v7, v4))
  {
    uint64_t v7 = (const char *)v6[5];
    v6 += 3;
    if (!v7) {
      return -1;
    }
  }
  return *v6;
}

- (void)setGraphicsFeatureSetClass:(id)a3
{
  int64_t v4 = [(TDDeviceTraits *)self _graphicsFeatureSetClassFromTraitString:a3];

  [(TDDeviceTraits *)self setGraphicsFeatureSetClassValue:v4];
}

- (NSString)graphicsFeatureSetClass
{
  int64_t v3 = [(TDDeviceTraits *)self graphicsFeatureSetClassValue];

  return (NSString *)[(TDDeviceTraits *)self _graphicsFeatureSetClassToTraitString:v3];
}

- (void)setGraphicsFeatureSetFallbacks:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", -[TDDeviceTraits _graphicsFeatureSetClassFromTraitString:](self, "_graphicsFeatureSetClassFromTraitString:", *(void *)(*((void *)&v10 + 1) + 8 * v9++))));
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  [(TDDeviceTraits *)self setGraphicsFeatureSetFallbackValues:v5];
}

- (NSArray)graphicsFeatureSetFallbacks
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v4 = [(TDDeviceTraits *)self graphicsFeatureSetFallbackValues];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", -[TDDeviceTraits _graphicsFeatureSetClassToTraitString:](self, "_graphicsFeatureSetClassToTraitString:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "integerValue")));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return (NSArray *)v3;
}

- (id)_displayGamutToTraitString:(int64_t)a3
{
  uint64_t v3 = *(void *)(MEMORY[0x263F38470] + 16);
  if (v3)
  {
    if (*MEMORY[0x263F38470] == a3) {
      return (id)[NSString stringWithUTF8String:v3];
    }
    for (i = (uint64_t *)(MEMORY[0x263F38470] + 40); ; i += 3)
    {
      uint64_t v3 = *i;
      if (!*i) {
        break;
      }
      uint64_t v5 = *(i - 2);
      if (v5 == a3) {
        return (id)[NSString stringWithUTF8String:v3];
      }
    }
  }
  return 0;
}

- (int64_t)_displayGamutFromTraitString:(id)a3
{
  uint64_t v3 = [a3 UTF8String];
  if (!v3) {
    return -1;
  }
  int64_t v4 = (const char *)v3;
  uint64_t v5 = *(const char **)(MEMORY[0x263F38470] + 16);
  if (!v5) {
    return -1;
  }
  uint64_t v6 = (int64_t *)MEMORY[0x263F38470];
  while (strcasecmp(v5, v4))
  {
    uint64_t v5 = (const char *)v6[5];
    v6 += 3;
    if (!v5) {
      return -1;
    }
  }
  return *v6;
}

- (void)setDisplayGamut:(id)a3
{
  int64_t v4 = [(TDDeviceTraits *)self _displayGamutFromTraitString:a3];

  [(TDDeviceTraits *)self setDisplayGamutValue:v4];
}

- (NSString)displayGamut
{
  int64_t v3 = [(TDDeviceTraits *)self displayGamutValue];

  return (NSString *)[(TDDeviceTraits *)self _displayGamutToTraitString:v3];
}

- (id)_deploymentTargetToTraitString:(int64_t)a3
{
  uint64_t v3 = *(void *)(MEMORY[0x263F38460] + 16);
  if (v3)
  {
    if (*MEMORY[0x263F38460] == a3) {
      return (id)[NSString stringWithUTF8String:v3];
    }
    for (i = (uint64_t *)(MEMORY[0x263F38460] + 40); ; i += 3)
    {
      uint64_t v3 = *i;
      if (!*i) {
        break;
      }
      uint64_t v5 = *(i - 2);
      if (v5 == a3) {
        return (id)[NSString stringWithUTF8String:v3];
      }
    }
  }
  return 0;
}

- (int64_t)_deploymentTargetFromTraitString:(id)a3
{
  if ([(TDDeviceTraits *)self idiomValue] && [(TDDeviceTraits *)self idiomValue] != 6)
  {
    [(TDDeviceTraits *)self idiomValue];
  }
  else if (self->_platform == -1)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDDeviceTraits.m", 302, @"Invalid parameter not satisfying: %@", @"_platform != kCUIThemeSchemaPlatformUnknown");
  }
  [a3 UTF8String];
  return (int)CUIParseDeploymentTarget();
}

- (void)setDeploymentTarget:(id)a3
{
  int64_t v4 = [(TDDeviceTraits *)self _deploymentTargetFromTraitString:a3];
  if ((v4 & 0x8000000000000000) == 0)
  {
    [(TDDeviceTraits *)self setDeploymentTargetValue:v4];
  }
}

- (NSString)deploymentTarget
{
  int64_t v3 = [(TDDeviceTraits *)self deploymentTargetValue];

  return (NSString *)[(TDDeviceTraits *)self _deploymentTargetToTraitString:v3];
}

- (id)_dynamicDisplayModeToTraitString:(int64_t)a3
{
  uint64_t v3 = *(void *)(MEMORY[0x263F38480] + 16);
  if (v3)
  {
    if (*MEMORY[0x263F38480] == a3) {
      return (id)[NSString stringWithUTF8String:v3];
    }
    for (i = (uint64_t *)(MEMORY[0x263F38480] + 40); ; i += 3)
    {
      uint64_t v3 = *i;
      if (!*i) {
        break;
      }
      uint64_t v5 = *(i - 2);
      if (v5 == a3) {
        return (id)[NSString stringWithUTF8String:v3];
      }
    }
  }
  return 0;
}

- (int64_t)_dynamicDisplayModeFromTraitString:(id)a3
{
  uint64_t v3 = [a3 UTF8String];
  if (!v3) {
    return -1;
  }
  int64_t v4 = (const char *)v3;
  uint64_t v5 = *(const char **)(MEMORY[0x263F38480] + 16);
  if (!v5) {
    return -1;
  }
  uint64_t v6 = (int64_t *)MEMORY[0x263F38480];
  while (strcasecmp(v5, v4))
  {
    uint64_t v5 = (const char *)v6[5];
    v6 += 3;
    if (!v5) {
      return -1;
    }
  }
  return *v6;
}

- (NSString)dynamicDisplayMode
{
  int64_t v3 = [(TDDeviceTraits *)self dynamicDisplayModeValue];

  return (NSString *)[(TDDeviceTraits *)self _dynamicDisplayModeFromTraitString:v3];
}

- (void)setDynamicDisplayMode:(id)a3
{
  int64_t v4 = [(TDDeviceTraits *)self _dynamicDisplayModeFromTraitString:a3];
  if ((v4 & 0x8000000000000000) == 0)
  {
    [(TDDeviceTraits *)self setDynamicDisplayModeValue:v4];
  }
}

- (NSArray)subtypeFallbackValues
{
  if ([(NSArray *)self->_subtypeFallbackValues count]) {
    return self->_subtypeFallbackValues;
  }
  int64_t v3 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(TDDeviceTraits *)self idiomValue] == 5)
  {
    [(TDDeviceTraits *)self subtype];
    CUIWatchSubTypeFallbackOrder();
  }
  -[NSArray addObject:](v3, "addObject:", [NSNumber numberWithInteger:0]);

  self->_subtypeFallbackValues = v3;
  return v3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (int64_t)idiomValue
{
  return self->_idiomValue;
}

- (void)setIdiomValue:(int64_t)a3
{
  self->_idiomValue = a3;
}

- (NSArray)hostedIdiomValues
{
  return self->_hostedIdiomValues;
}

- (void)setHostedIdiomValues:(id)a3
{
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(int64_t)a3
{
  self->_subtype = a3;
}

- (int64_t)displayGamutValue
{
  return self->_displayGamutValue;
}

- (void)setDisplayGamutValue:(int64_t)a3
{
  self->_displayGamutValue = a3;
}

- (int64_t)deploymentTargetValue
{
  return self->_deploymentTargetValue;
}

- (void)setDeploymentTargetValue:(int64_t)a3
{
  self->_deploymentTargetValue = a3;
}

- (int64_t)memoryPerformanceClass
{
  return self->_memoryPerformanceClass;
}

- (void)setMemoryPerformanceClass:(int64_t)a3
{
  self->_memoryPerformanceClass = a3;
}

- (int64_t)graphicsPerformanceClass
{
  return self->_graphicsPerformanceClass;
}

- (void)setGraphicsPerformanceClass:(int64_t)a3
{
  self->_graphicsPerformanceClass = a3;
}

- (int64_t)graphicsFeatureSetClassValue
{
  return self->_graphicsFeatureSetClassValue;
}

- (void)setGraphicsFeatureSetClassValue:(int64_t)a3
{
  self->_graphicsFeatureSetClassValue = a3;
}

- (NSArray)graphicsFeatureSetFallbackValues
{
  return self->_graphicsFeatureSetFallbackValues;
}

- (void)setGraphicsFeatureSetFallbackValues:(id)a3
{
}

- (void)setSubtypeFallbackValues:(id)a3
{
}

- (int64_t)dynamicDisplayModeValue
{
  return self->_dynamicDisplayModeValue;
}

- (void)setDynamicDisplayModeValue:(int64_t)a3
{
  self->_dynamicDisplayModeValue = a3;
}

@end