@interface TTKKeyboardPlane
- (CGRect)frame;
- (TTKKeyboardPlane)initWithUIKBTree:(id)a3 layoutUtils:(id)a4;
- (TTKKeyboardPlane)initWithUIKBTree:(id)a3 locale:(id)a4;
- (id)findKey:(id)a3;
- (id)jsonFrameArrayForWord:(id)a3;
@end

@implementation TTKKeyboardPlane

- (TTKKeyboardPlane)initWithUIKBTree:(id)a3 layoutUtils:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TTKKeyboardPlane;
  v9 = [(TTKKeyboardPlane *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyplane, a3);
    objc_storeStrong((id *)&v10->_layoutUtils, a4);
  }

  return v10;
}

- (TTKKeyboardPlane)initWithUIKBTree:(id)a3 locale:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TTKKeyboardPlane;
  v9 = [(TTKKeyboardPlane *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyplane, a3);
    v11 = [[ACTKeyboardLayoutUtils alloc] initWithLocale:v8];
    layoutUtils = v10->_layoutUtils;
    v10->_layoutUtils = v11;
  }
  return v10;
}

- (id)findKey:(id)a3
{
  LOBYTE(v7) = 1;
  v4 = [(ACTKeyboardLayoutUtils *)self->_layoutUtils anyKeyForString:a3 keyplane:self->_keyplane wantSecondaryString:0 isRetyping:0 preferBaseKeyVariants:1 preferManualShift:0 substituteUpperCaseForLowerCase:v7];
  if (v4) {
    v5 = [[TTKKey alloc] initWithUIKBTree:v4 layoutUtils:self->_layoutUtils];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (id)jsonFrameArrayForWord:(id)a3
{
  id v3 = a3;
  id v18 = +[NSMutableArray array];
  if ([v3 length])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = objc_msgSend(v3, "substringWithRange:", v4, 1);
      v6 = [(TTKKeyboardPlane *)self findKey:v5];
      uint64_t v7 = v6;
      if (v6)
      {
        v21[0] = v5;
        v20[0] = @"k";
        v20[1] = @"x";
        [v6 frame];
        v9 = +[NSNumber numberWithInteger:(uint64_t)v8];
        v21[1] = v9;
        v20[2] = @"y";
        [v7 frame];
        v11 = +[NSNumber numberWithInteger:(uint64_t)v10];
        v21[2] = v11;
        v20[3] = @"w";
        [v7 frame];
        v13 = +[NSNumber numberWithInteger:(uint64_t)v12];
        v21[3] = v13;
        v20[4] = @"h";
        [v7 frame];
        v15 = +[NSNumber numberWithInteger:(uint64_t)v14];
        v21[4] = v15;
        v16 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:5];
        [v18 addObject:v16];
      }
      ++v4;
    }
    while ((unint64_t)[v3 length] > v4);
  }

  return v18;
}

- (CGRect)frame
{
  [(UIKBTree *)self->_keyplane frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutUtils, 0);

  objc_storeStrong((id *)&self->_keyplane, 0);
}

@end