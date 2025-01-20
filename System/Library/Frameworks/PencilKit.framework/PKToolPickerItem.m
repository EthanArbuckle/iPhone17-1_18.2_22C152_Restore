@interface PKToolPickerItem
- (BOOL)_toolShouldBeSetOnCanvasView;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)_dictionaryRepresentation;
- (NSString)identifier;
- (PKTool)_tool;
- (PKToolPickerItem)initWithTool:(id)a3;
- (PKToolPickerItem)initWithTool:(id)a3 identifier:(id)a4;
- (UIColor)color;
- (double)width;
- (id)_toolCopyWithColor:(id)a3;
- (id)_toolCopyWithWidth:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_reloadImage;
- (void)_setColor:(id)a3 shouldCallObserver:(BOOL)a4;
- (void)_setWidth:(double)a3 shouldCallObserver:(BOOL)a4;
- (void)_updateTool:(id)a3 shouldCallObserver:(BOOL)a4;
- (void)setColor:(id)a3;
- (void)setWidth:(double)a3;
- (void)set_tool:(id)a3;
@end

@implementation PKToolPickerItem

- (PKToolPickerItem)initWithTool:(id)a3
{
  return [(PKToolPickerItem *)self initWithTool:a3 identifier:0];
}

- (PKToolPickerItem)initWithTool:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKToolPickerItem;
  v9 = [(PKToolPickerItem *)&v13 init];
  if (v9)
  {
    if (v8) {
      [v7 _setToolPickerItemIdentifier:v8];
    }
    objc_storeStrong((id *)&v9->__tool, a3);
    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v10;
  }
  return v9;
}

- (NSString)identifier
{
  return [(PKTool *)self->__tool _toolPickerItemIdentifier];
}

- (UIColor)color
{
  v3 = [(PKTool *)self->__tool _configuration];
  char v4 = [v3 supportsColor];

  if (v4)
  {
    v5 = [(PKTool *)self->__tool _color];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x1E4FB1618] blackColor];
    }
    id v8 = v7;
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB1618] blackColor];
  }

  return (UIColor *)v8;
}

- (void)setColor:(id)a3
{
}

- (void)_setColor:(id)a3 shouldCallObserver:(BOOL)a4
{
  BOOL v4 = a4;
  id v16 = a3;
  v6 = [(PKTool *)self->__tool _configuration];
  int v7 = [v6 supportsColor];

  if (v7)
  {
    id v8 = [(PKToolPickerItem *)self color];
    id v9 = v16;
    ConvertedToSRGB = DKUCGColorCreateConvertedToSRGB([v8 CGColor]);
    id v11 = v9;
    uint64_t v12 = [v11 CGColor];

    objc_super v13 = DKUCGColorCreateConvertedToSRGB(v12);
    BOOL IsEqualToColorIgnoringOpacity = DKUColorIsEqualToColorIgnoringOpacity(ConvertedToSRGB, v13, 0);
    CGColorRelease(ConvertedToSRGB);
    CGColorRelease(v13);

    if (!IsEqualToColorIgnoringOpacity)
    {
      v15 = [(PKToolPickerItem *)self _toolCopyWithColor:v11];
      [(PKToolPickerItem *)self _updateTool:v15 shouldCallObserver:v4];
    }
  }
}

- (double)width
{
  v3 = [(PKTool *)self->__tool _configuration];
  int v4 = [v3 supportsStrokeWeight];

  if (!v4) {
    return 0.0;
  }
  tool = self->__tool;

  [(PKTool *)tool _width];
  return result;
}

- (void)setWidth:(double)a3
{
}

- (void)_setWidth:(double)a3 shouldCallObserver:(BOOL)a4
{
  BOOL v4 = a4;
  int v7 = [(PKTool *)self->__tool _configuration];
  int v8 = [v7 supportsStrokeWeight];

  if (v8)
  {
    [(PKToolPickerItem *)self width];
    if (vabdd_f64(v9, a3) >= 0.01)
    {
      id v10 = [(PKToolPickerItem *)self _toolCopyWithWidth:a3];
      [(PKToolPickerItem *)self _updateTool:v10 shouldCallObserver:v4];
    }
  }
}

- (BOOL)_toolShouldBeSetOnCanvasView
{
  return 0;
}

- (NSDictionary)_dictionaryRepresentation
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int v7 = @"identifier";
  v2 = [(PKToolPickerItem *)self _tool];
  v3 = [v2 ink];
  BOOL v4 = [v3 identifier];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return (NSDictionary *)v5;
}

- (id)_toolCopyWithWidth:(double)a3
{
  return 0;
}

- (id)_toolCopyWithColor:(id)a3
{
  return 0;
}

- (void)_reloadImage
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "toolPickerItemReloadImage:", self, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_updateTool:(id)a3 shouldCallObserver:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)&self->__tool, a3);
    if (v4)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v8 = self->_observers;
      uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "toolPickerItemDidChange:", self, (void)v13);
          }
          while (v10 != v12);
          uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  tool = self->__tool;

  return (id)[v4 initWithTool:tool];
}

- (unint64_t)hash
{
  v2 = [(PKToolPickerItem *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(PKToolPickerItem *)self _tool];
    uint64_t v6 = [v4 _tool];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (PKTool)_tool
{
  return self->__tool;
}

- (void)set_tool:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tool, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end