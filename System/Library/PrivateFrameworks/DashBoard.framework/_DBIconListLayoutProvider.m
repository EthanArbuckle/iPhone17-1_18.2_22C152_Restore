@interface _DBIconListLayoutProvider
- (SBIconListFlowLayout)layout;
- (_DBIconListLayoutProvider)initWithEnvironment:(id)a3;
- (void)setLayout:(id)a3;
@end

@implementation _DBIconListLayoutProvider

- (_DBIconListLayoutProvider)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_DBIconListLayoutProvider;
  v5 = [(_DBIconListLayoutProvider *)&v17 init];
  if (v5)
  {
    v6 = [v4 environmentConfiguration];
    v7 = v6;
    if (v6)
    {
      [v6 screenScale];
      uint64_t v8 = [v7 iconRowCount];
      uint64_t v9 = [v7 iconColumnCount];
    }
    else
    {
      v10 = [MEMORY[0x263F82B60] mainScreen];
      [v10 scale];

      uint64_t v8 = 2;
      uint64_t v9 = 4;
    }
    id v11 = objc_alloc_init(MEMORY[0x263F79290]);
    v12 = [v11 iconAccessoryVisualConfiguration];
    objc_msgSend(v12, "setSize:", 26.0, 26.0);

    v13 = [v11 iconAccessoryVisualConfiguration];
    objc_msgSend(v13, "setOffset:", 11.0, 11.0);

    [v11 setNumberOfPortraitColumns:v9];
    [v11 setNumberOfPortraitRows:v8];
    [v11 setIconImageInfo:DBIconImageInfoForScale()];
    uint64_t v14 = [objc_alloc(MEMORY[0x263F79288]) initWithLayoutConfiguration:v11];
    layout = v5->_layout;
    v5->_layout = (SBIconListFlowLayout *)v14;
  }
  return v5;
}

- (SBIconListFlowLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end