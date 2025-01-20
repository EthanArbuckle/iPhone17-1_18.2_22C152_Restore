@interface MTTintingMaterialSettings
- (CGColor)tintColor;
- (MTTintingMaterialSettings)initWithTintingDescription:(id)a3 andDescendantDescriptions:(id)a4;
- (NSDictionary)tintColorDescription;
- (NSString)tintColorName;
- (double)tintAlpha;
- (int64_t)tintColorUIStyle;
- (void)_processTintingDescription:(id)a3 defaultingToIdentity:(BOOL)a4;
- (void)dealloc;
@end

@implementation MTTintingMaterialSettings

- (double)tintAlpha
{
  return self->_tintAlpha;
}

- (MTTintingMaterialSettings)initWithTintingDescription:(id)a3 andDescendantDescriptions:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)MTTintingMaterialSettings;
  v8 = [(MTTintingMaterialSettings *)&v22 init];
  v9 = v8;
  if (v8)
  {
    [(MTTintingMaterialSettings *)v8 _processTintingDescription:v6 defaultingToIdentity:1];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
          v16 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", (void)v18);

          if (v15 != v16) {
            [(MTTintingMaterialSettings *)v9 _processTintingDescription:v15 defaultingToIdentity:0];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }
  }
  return v9;
}

- (void)_processTintingDescription:(id)a3 defaultingToIdentity:(BOOL)a4
{
  id v21 = a3;
  id v6 = [v21 objectForKey:@"tintColor"];
  tintColorDescription = self->_tintColorDescription;
  self->_tintColorDescription = v6;

  if (self->_tintColorDescription)
  {
    +[MTColor colorWithDescription:](MTColor, "colorWithDescription:");
    id v8 = objc_claimAutoreleasedReturnValue();
    CGColorRef v9 = CGColorRetain((CGColorRef)[v8 CGColor]);

    p_tintColor = &self->_tintColor;
    tintColor = self->_tintColor;
    if (v9 != tintColor)
    {
      if (!tintColor) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else
  {
    p_tintColor = &self->_tintColor;
    tintColor = self->_tintColor;
    if (a4)
    {
      if (!tintColor) {
        goto LABEL_12;
      }
      CGColorRef v9 = 0;
LABEL_8:
      CGColorRelease(tintColor);
LABEL_9:
      *p_tintColor = v9;
      goto LABEL_12;
    }
  }
  if (tintColor) {
    CGColorRelease(tintColor);
  }
LABEL_12:
  uint64_t v12 = [v21 objectForKey:@"tintAlpha"];
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 floatValue];
    double tintAlpha = v14;
  }
  else
  {
    double tintAlpha = 0.0;
    if (!a4) {
      double tintAlpha = self->_tintAlpha;
    }
  }
  self->_double tintAlpha = tintAlpha;
  v16 = [v21 objectForKey:@"tintColorName"];
  tintColorName = v16;
  if (!v16)
  {
    tintColorName = 0;
    if (!a4) {
      tintColorName = self->_tintColorName;
    }
  }
  objc_storeStrong((id *)&self->_tintColorName, tintColorName);

  long long v18 = [v21 objectForKey:@"tintColorUIStyle"];
  long long v19 = v18;
  if (v18)
  {
    uint64_t tintColorUIStyle = [v18 integerValue];
  }
  else if (a4)
  {
    uint64_t tintColorUIStyle = 0;
  }
  else
  {
    uint64_t tintColorUIStyle = self->_tintColorUIStyle;
  }
  self->_uint64_t tintColorUIStyle = tintColorUIStyle;
}

- (CGColor)tintColor
{
  return self->_tintColor;
}

- (void)dealloc
{
  tintColor = self->_tintColor;
  if (tintColor) {
    CGColorRelease(tintColor);
  }
  v4.receiver = self;
  v4.super_class = (Class)MTTintingMaterialSettings;
  [(MTTintingMaterialSettings *)&v4 dealloc];
}

- (NSDictionary)tintColorDescription
{
  return self->_tintColorDescription;
}

- (NSString)tintColorName
{
  return self->_tintColorName;
}

- (int64_t)tintColorUIStyle
{
  return self->_tintColorUIStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColorName, 0);
  objc_storeStrong((id *)&self->_tintColorDescription, 0);
}

@end