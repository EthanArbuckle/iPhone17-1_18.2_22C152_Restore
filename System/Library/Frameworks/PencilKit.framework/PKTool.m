@interface PKTool
+ (BOOL)_inkIsInkingTool:(id)a3;
+ (id)_toolWithInk:(id)a3;
+ (id)_toolWithInk:(id)a3 configuration:(id)a4;
+ (id)_toolWithTool:(id)a3 color:(id)a4 ignoringOpacity:(BOOL)a5;
- (BOOL)_isEraserTool;
- (BOOL)_isHandwritingTool;
- (BOOL)_isLassoTool;
- (BOOL)_isRulerTool;
- (BOOL)isEqual:(id)a3;
- (Class)_toolPickerItemClass;
- (NSString)_toolPickerItemIdentifier;
- (PKInk)ink;
- (PKToolConfiguration)_configuration;
- (double)_strokeWeight;
- (double)_width;
- (id)_barButtonItemsProvider;
- (id)_color;
- (id)_copyWithColor:(id)a3;
- (id)_copyWithStrokeWeight:(double)a3;
- (id)_defaultItemIdentifier;
- (id)_initWithInk:(id)a3;
- (id)_initWithInk:(id)a3 configuration:(id)a4;
- (id)_toolPickerItem;
- (unint64_t)hash;
- (void)_setBarButtonItemsProvider:(id)a3;
- (void)_setToolPickerItemIdentifier:(id)a3;
@end

@implementation PKTool

- (id)_initWithInk:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKTool;
  v6 = [(PKTool *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ink, a3);
    if ([v5 _isMonolineInk])
    {
      v8 = PKInkIdentifierMonoline;
    }
    else
    {
      v10 = [v5 identifier];
      v11 = @"com.apple.ink.fountainpen";
      int v12 = [v10 isEqualToString:@"com.apple.ink.fountainpen"];

      if (v12) {
        goto LABEL_8;
      }
      v13 = [v5 identifier];
      v11 = @"com.apple.ink.watercolor";
      int v14 = [v13 isEqualToString:@"com.apple.ink.watercolor"];

      if (v14
        || ([v5 identifier],
            v15 = objc_claimAutoreleasedReturnValue(),
            v11 = @"com.apple.ink.crayon",
            int v16 = [v15 isEqualToString:@"com.apple.ink.crayon"],
            v15,
            v16))
      {
LABEL_8:
        v9 = v11;
        goto LABEL_9;
      }
      if ([v5 _isPencilInk])
      {
        v8 = PKInkIdentifierPencil;
      }
      else
      {
        if ([v5 _isEraserInk])
        {
          p_super = [v5 identifier];
          uint64_t v20 = +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:p_super];
          configuration = v7->_configuration;
          v7->_configuration = (PKToolConfiguration *)v20;

          goto LABEL_10;
        }
        if ([v5 _isMarkerInk])
        {
          v8 = PKInkIdentifierMarker;
        }
        else if ([v5 _isPenInk])
        {
          v8 = PKInkIdentifierPen;
        }
        else if ([v5 _isHandwritingInk])
        {
          v8 = PKInkIdentifierHandwriting;
        }
        else
        {
          if (![v5 _isLassoInk])
          {
            p_super = os_log_create("com.apple.pencilkit", "");
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
            {
              v22 = [v5 identifier];
              *(_DWORD *)buf = 138477827;
              v25 = v22;
              _os_log_error_impl(&dword_1C44F8000, p_super, OS_LOG_TYPE_ERROR, "Unable to create configuration for ink with id: %{private}@", buf, 0xCu);
            }
            goto LABEL_10;
          }
          v8 = PKInkIdentifierLasso;
        }
      }
    }
    v9 = *v8;
LABEL_9:
    uint64_t v17 = +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:v9];
    p_super = &v7->_configuration->super;
    v7->_configuration = (PKToolConfiguration *)v17;
LABEL_10:
  }
  return v7;
}

- (id)_initWithInk:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKTool;
  v9 = [(PKTool *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ink, a3);
    uint64_t v11 = [v8 copy];
    configuration = v10->_configuration;
    v10->_configuration = (PKToolConfiguration *)v11;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(PKTool *)self ink];
    v6 = [v4 ink];
    int v7 = [v5 isEqual:v6];

    id v8 = v4;
    v9 = [v8 _configuration];
    if (v9)
    {

      if ((v7 & 1) == 0)
      {
        char v10 = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v11 = [(PKTool *)self _configuration];

      if (v11) {
        char v10 = 0;
      }
      else {
        char v10 = v7;
      }
      if (!v11 || ((v7 ^ 1) & 1) != 0) {
        goto LABEL_12;
      }
    }
    int v12 = [(PKTool *)self _configuration];
    v13 = [v8 _configuration];
    char v10 = [v12 isEqual:v13];

    goto LABEL_12;
  }
  char v10 = 0;
LABEL_13:

  return v10;
}

- (unint64_t)hash
{
  v2 = [(PKTool *)self ink];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)_inkIsInkingTool:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  if ([v4 isEqualToString:@"com.apple.ink.lasso"])
  {
    char v5 = 1;
  }
  else
  {
    v6 = [v3 identifier];
    if ([v6 isEqualToString:@"com.apple.ink.objectEraser"])
    {
      char v5 = 1;
    }
    else
    {
      int v7 = [v3 identifier];
      if ([v7 isEqualToString:@"com.apple.ink.eraser"])
      {
        char v5 = 1;
      }
      else
      {
        id v8 = [v3 identifier];
        char v5 = [v8 isEqualToString:@"com.apple.ink.generationtool"];
      }
    }
  }
  return v5 ^ 1;
}

+ (id)_toolWithInk:(id)a3
{
  return +[PKTool _toolWithInk:a3 configuration:0];
}

+ (id)_toolWithInk:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 identifier];
  int v8 = [v7 isEqualToString:@"com.apple.ink.lasso"];

  if (v8)
  {
    v9 = PKLassoTool;
LABEL_9:
    int v12 = (PKHandwritingTool *)[[v9 alloc] _initWithInk:v5];
    goto LABEL_10;
  }
  char v10 = [v5 identifier];
  int v11 = [v10 isEqualToString:@"com.apple.ink.handwriting"];

  if (v11)
  {
    int v12 = objc_alloc_init(PKHandwritingTool);
    goto LABEL_10;
  }
  v13 = [v5 identifier];
  if ([v13 isEqualToString:@"com.apple.ink.eraser"])
  {

LABEL_8:
    v9 = PKEraserTool;
    goto LABEL_9;
  }
  objc_super v14 = [v5 identifier];
  int v15 = [v14 isEqualToString:@"com.apple.ink.objectEraser"];

  if (v15) {
    goto LABEL_8;
  }
  v18 = [v5 identifier];
  int v19 = [v18 isEqualToString:@"com.apple.ink.generationtool"];

  if (v19)
  {
    v9 = PKGenerationTool;
    goto LABEL_9;
  }
  uint64_t v20 = [v5 identifier];
  int v21 = [v20 isEqualToString:@"com.apple.ink.custom"];

  if (v21)
  {
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Unable to create a custom tool using the -_toolWithInk: method." userInfo:0];
    objc_exception_throw(v22);
  }
  int v12 = [(PKTool *)[PKInkingTool alloc] _initWithInk:v5 configuration:v6];
LABEL_10:
  int v16 = v12;

  return v16;
}

+ (id)_toolWithTool:(id)a3 color:(id)a4 ignoringOpacity:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 ink];
  id v10 = [v9 color];
  long long v19 = __const_DKUColorGetAlpha_rgba;
  long long v20 = unk_1C482B398;
  DKUColorGetRGBAComponents((CGColor *)[v10 CGColor], &v19);
  double v11 = *((double *)&v20 + 1);

  double v12 = 1.0;
  if (!v5) {
    double v12 = v11;
  }
  v13 = [v7 colorWithAlphaComponent:v12];

  objc_super v14 = [v8 ink];
  int v15 = +[PKInk inkFromInk:v14 color:v13];

  int v16 = [v8 _configuration];

  uint64_t v17 = +[PKTool _toolWithInk:v15 configuration:v16];

  return v17;
}

- (BOOL)_isHandwritingTool
{
  return 0;
}

- (BOOL)_isLassoTool
{
  v2 = [(PKTool *)self _configuration];
  if (v2) {
    BOOL v3 = v2[20] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)_isEraserTool
{
  return 0;
}

- (BOOL)_isRulerTool
{
  return 0;
}

- (double)_width
{
  return 0.0;
}

- (double)_strokeWeight
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = self;
    id v4 = [(PKTool *)v3 customConfigurationCopy];
    if ([v4 supportsStrokeWeight])
    {
      [(PKTool *)v3 weight];
      double v6 = v5;
    }
    else
    {

      double v6 = 2.22507386e-308;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 2.22507386e-308;
    }
    id v7 = self;
    [(PKTool *)v7 width];
    double v9 = v8;
    BOOL v3 = [(PKTool *)v7 inkType];

    +[PKInkingTool _weightForWidth:v3 type:v9];
    double v6 = v10;
  }

  return v6;
}

- (id)_color
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    BOOL v3 = [(PKTool *)self color];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_setToolPickerItemIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  toolPickerItemIdentifier = self->_toolPickerItemIdentifier;
  self->_toolPickerItemIdentifier = v4;
}

- (NSString)_toolPickerItemIdentifier
{
  toolPickerItemIdentifier = self->_toolPickerItemIdentifier;
  if (toolPickerItemIdentifier)
  {
    BOOL v3 = toolPickerItemIdentifier;
  }
  else
  {
    BOOL v3 = [(PKTool *)self _defaultItemIdentifier];
  }

  return v3;
}

- (id)_defaultItemIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (Class)_toolPickerItemClass
{
  return 0;
}

- (id)_toolPickerItem
{
  BOOL v3 = [(PKTool *)self _toolPickerItemClass];
  if (v3) {
    BOOL v3 = (objc_class *)[[v3 alloc] initWithTool:self];
  }

  return v3;
}

- (id)_copyWithStrokeWeight:(double)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = self;
    double v6 = [(PKTool *)v5 customConfigurationCopy];
    if ([v6 supportsStrokeWeight])
    {
      id v7 = (void *)[(PKTool *)v5 copyWithWeight:a3];
    }
    else
    {

      id v7 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    double v8 = self;
    double v9 = [(PKTool *)v8 ink];
    double v5 = +[PKInk inkFromInk:v9 weight:a3];

    double v10 = [(PKTool *)v8 _configuration];
    id v7 = +[PKTool _toolWithInk:v5 configuration:v10];

    toolPickerItemIdentifier = v8->_toolPickerItemIdentifier;
    [v7 _setToolPickerItemIdentifier:toolPickerItemIdentifier];
  }

  return v7;
}

- (id)_copyWithColor:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = self;
    double v6 = [(PKTool *)v5 customConfigurationCopy];
    if ([v6 supportsColor])
    {
      id v7 = (void *)[(PKTool *)v5 copyWithColor:v4];
    }
    else
    {

      id v7 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = 0;
      goto LABEL_9;
    }
    double v8 = self;
    double v9 = [(PKTool *)v8 ink];
    double v5 = +[PKInk inkFromInk:v9 color:v4];

    double v10 = [(PKTool *)v8 _configuration];
    id v7 = +[PKTool _toolWithInk:v5 configuration:v10];

    toolPickerItemIdentifier = v8->_toolPickerItemIdentifier;
    [v7 _setToolPickerItemIdentifier:toolPickerItemIdentifier];
  }

LABEL_9:
  return v7;
}

- (PKToolConfiguration)_configuration
{
  return self->_configuration;
}

- (PKInk)ink
{
  return self->_ink;
}

- (id)_barButtonItemsProvider
{
  return self->__barButtonItemsProvider;
}

- (void)_setBarButtonItemsProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__barButtonItemsProvider, 0);
  objc_storeStrong((id *)&self->_ink, 0);
  objc_storeStrong((id *)&self->_toolPickerItemIdentifier, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end