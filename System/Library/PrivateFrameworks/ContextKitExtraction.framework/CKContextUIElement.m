@interface CKContextUIElement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnScreen;
- (CGPoint)absoluteOriginOnScreen;
- (CGRect)frameInWindow;
- (CKContextUIElement)initWithCoder:(id)a3;
- (CKContextUIElement)initWithText:(id)a3 className:(id)a4;
- (NSArray)superviewClassNames;
- (NSString)className;
- (NSString)sceneIdentifier;
- (NSString)text;
- (float)density;
- (float)fontSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)toJSONSerializableDictionary;
- (int64_t)compareByPosition:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAbsoluteOriginOnScreen:(CGPoint)a3;
- (void)setClassName:(id)a3;
- (void)setDensity:(float)a3;
- (void)setFontSize:(float)a3;
- (void)setFrameInWindow:(CGRect)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setSuperviewClassNames:(id)a3;
- (void)setText:(id)a3;
@end

@implementation CKContextUIElement

- (CKContextUIElement)initWithText:(id)a3 className:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKContextUIElement;
  v9 = [(CKContextUIElement *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_text, a3);
    objc_storeStrong((id *)&v10->_className, a4);
  }

  return v10;
}

- (CKContextUIElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKContextUIElement;
  v5 = [(CKContextUIElement *)&v21 init];
  if (!v5)
  {
LABEL_7:
    v6 = v5;
    goto LABEL_8;
  }
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
  if (v6)
  {
    objc_storeStrong((id *)v5 + 3, v6);
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"className"];
    id v8 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v7;

    uint64_t v9 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"superviewClassNames"];
    v10 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneIdentifier"];
    objc_super v12 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v11;

    [v4 decodeFloatForKey:@"fontSize"];
    *((_DWORD *)v5 + 3) = v13;
    [v4 decodeFloatForKey:@"density"];
    *((_DWORD *)v5 + 4) = v14;
    v5[8] = [v4 decodeBoolForKey:@"onScreen"];
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"frameInWindow"];
    if ([(NSString *)v15 length])
    {
      *(CGRect *)(v5 + 72) = CGRectFromString(v15);
    }
    else
    {
      long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      *(_OWORD *)(v5 + 72) = *MEMORY[0x1E4F1DB28];
      *(_OWORD *)(v5 + 88) = v16;
    }
    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"absoluteOriginOnScreen"];
    [v17 CGPointValue];
    *((void *)v5 + 7) = v18;
    *((void *)v5 + 8) = v19;

    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"text"];
  [v5 encodeObject:self->_className forKey:@"className"];
  [v5 encodeObject:self->_superviewClassNames forKey:@"superviewClassNames"];
  [v5 encodeObject:self->_sceneIdentifier forKey:@"sceneIdentifier"];
  *(float *)&double v6 = self->_fontSize;
  [v5 encodeFloat:@"fontSize" forKey:v6];
  *(float *)&double v7 = self->_density;
  [v5 encodeFloat:@"density" forKey:v7];
  [v5 encodeBool:self->_onScreen forKey:@"onScreen"];
  id v8 = NSStringFromCGRect(self->_frameInWindow);
  [v5 encodeObject:v8 forKey:@"frameInWindow"];

  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", self->_absoluteOriginOnScreen.x, self->_absoluteOriginOnScreen.y);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v9 forKey:@"absoluteOriginOnScreen"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)[(NSString *)self->_text copy];
  [v4 setText:v5];

  double v6 = (void *)[(NSString *)self->_className copy];
  [v4 setClassName:v6];

  double v7 = (void *)[(NSArray *)self->_superviewClassNames copy];
  [v4 setSuperviewClassNames:v7];

  id v8 = (void *)[(NSString *)self->_sceneIdentifier copy];
  [v4 setSceneIdentifier:v8];

  *(float *)&double v9 = self->_fontSize;
  [v4 setFontSize:v9];
  *(float *)&double v10 = self->_density;
  [v4 setDensity:v10];
  objc_msgSend(v4, "setFrameInWindow:", self->_frameInWindow.origin.x, self->_frameInWindow.origin.y, self->_frameInWindow.size.width, self->_frameInWindow.size.height);
  objc_msgSend(v4, "setAbsoluteOriginOnScreen:", self->_absoluteOriginOnScreen.x, self->_absoluteOriginOnScreen.y);
  [v4 setOnScreen:self->_onScreen];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKContextUIElement *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(CKContextUIElement *)self hash];
      BOOL v6 = v5 == [(CKContextUIElement *)v4 hash];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_text hash];
  NSUInteger v4 = [(NSString *)self->_className hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSArray *)self->_superviewClassNames hash] - v4 + 32 * v4;
  unint64_t v6 = (unint64_t)(self->_absoluteOriginOnScreen.y
                        + (double)(31
                                 * (unint64_t)(self->_absoluteOriginOnScreen.x
                                                    + (double)(31
                                                             * (unint64_t)(self->_frameInWindow.size.height
                                                                                + (double)(31
                                                                                         * (unint64_t)(self->_frameInWindow.size.width + (double)(31 * (unint64_t)(self->_frameInWindow.origin.y + (double)(31 * (unint64_t)(self->_frameInWindow.origin.x + (double)(31 * (unint64_t)(float)(self->_density + (float)(31 * (unint64_t)(float)(self->_fontSize + (float)(31 * ([(NSString *)self->_sceneIdentifier hash] - v5 + 32 * v5) + 28629151))))))))))))))));
  return self->_onScreen - v6 + 32 * v6;
}

- (int64_t)compareByPosition:(id)a3
{
  [a3 frameInWindow];
  double y = self->_frameInWindow.origin.y;
  if (y < v5) {
    return -1;
  }
  if (y > v5) {
    return 1;
  }
  double x = self->_frameInWindow.origin.x;
  if (x >= v4) {
    return x > v4;
  }
  else {
    return -1;
  }
}

- (id)description
{
  NSUInteger v3 = NSString;
  double fontSize = self->_fontSize;
  CGPoint origin = self->_frameInWindow.origin;
  CGPoint absoluteOriginOnScreen = self->_absoluteOriginOnScreen;
  CGFloat width = self->_frameInWindow.size.width;
  CGFloat height = self->_frameInWindow.size.height;
  if (self->_onScreen) {
    double v7 = @"YES";
  }
  else {
    double v7 = @"NO";
  }
  className = self->_className;
  sceneIdentifier = self->_sceneIdentifier;
  double v10 = [(NSArray *)self->_superviewClassNames componentsJoinedByString:@", "];
  uint64_t v11 = [v3 stringWithFormat:@"Class: %@, FontSize: %.f, Origin:(%.f, %.f), AbsoluteOriginOnScreen:(%.f, %.f), Size:(%.f, %.f), SceneIdentifier: %@, On Screen:%@\nSuperViews:%@\nContent: %@\n", className, *(void *)&fontSize, origin, absoluteOriginOnScreen, *(void *)&width, *(void *)&height, sceneIdentifier, v7, v10, self->_text];

  return v11;
}

- (id)toJSONSerializableDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_text forKeyedSubscript:@"text"];
  [v3 setObject:self->_className forKeyedSubscript:@"className"];
  [v3 setObject:self->_superviewClassNames forKeyedSubscript:@"superviewClassNames"];
  [v3 setObject:self->_sceneIdentifier forKeyedSubscript:@"sceneIdentifier"];
  *(float *)&double v4 = self->_fontSize;
  double v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKeyedSubscript:@"fontSize"];

  *(float *)&double v6 = self->_density;
  double v7 = [NSNumber numberWithFloat:v6];
  [v3 setObject:v7 forKeyedSubscript:@"density"];

  id v8 = [NSNumber numberWithDouble:self->_frameInWindow.origin.x];
  [v3 setObject:v8 forKeyedSubscript:@"x"];

  double v9 = [NSNumber numberWithDouble:self->_frameInWindow.origin.y];
  [v3 setObject:v9 forKeyedSubscript:@"y"];

  double v10 = [NSNumber numberWithDouble:self->_absoluteOriginOnScreen.x];
  [v3 setObject:v10 forKeyedSubscript:@"absoluteOriginX"];

  uint64_t v11 = [NSNumber numberWithDouble:self->_absoluteOriginOnScreen.y];
  [v3 setObject:v11 forKeyedSubscript:@"abosluteOriginY"];

  objc_super v12 = [NSNumber numberWithDouble:self->_frameInWindow.size.width];
  [v3 setObject:v12 forKeyedSubscript:@"width"];

  int v13 = [NSNumber numberWithDouble:self->_frameInWindow.size.height];
  [v3 setObject:v13 forKeyedSubscript:@"height"];

  int v14 = [NSNumber numberWithBool:self->_onScreen];
  [v3 setObject:v14 forKeyedSubscript:@"onScreen"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)className
{
  return self->_className;
}

- (void)setClassName:(id)a3
{
}

- (NSArray)superviewClassNames
{
  return self->_superviewClassNames;
}

- (void)setSuperviewClassNames:(id)a3
{
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
}

- (float)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(float)a3
{
  self->_double fontSize = a3;
}

- (float)density
{
  return self->_density;
}

- (void)setDensity:(float)a3
{
  self->_densitdouble y = a3;
}

- (CGRect)frameInWindow
{
  double x = self->_frameInWindow.origin.x;
  double y = self->_frameInWindow.origin.y;
  double width = self->_frameInWindow.size.width;
  double height = self->_frameInWindow.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrameInWindow:(CGRect)a3
{
  self->_frameInWindow = a3;
}

- (CGPoint)absoluteOriginOnScreen
{
  double x = self->_absoluteOriginOnScreen.x;
  double y = self->_absoluteOriginOnScreen.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAbsoluteOriginOnScreen:(CGPoint)a3
{
  self->_CGPoint absoluteOriginOnScreen = a3;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (void)setOnScreen:(BOOL)a3
{
  self->_onScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_superviewClassNames, 0);
  objc_storeStrong((id *)&self->_className, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end