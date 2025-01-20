@interface TTKSimpleKeyboardPlane
+ (float)keyplaneHeightForKeys:(id)a3;
+ (float)keyplaneWidthForKeys:(id)a3;
- (NSArray)keys;
- (NSString)name;
- (TTKSimpleKeyboardPlane)initWithJsonDictionary:(id)a3;
- (TTKSimpleKeyboardPlane)initWithName:(id)a3 keys:(id)a4;
- (TTKSimpleKeyboardPlane)initWithTIKeyboardLayout:(id)a3;
- (float)keyboardWidth;
- (id)keyboardOrientation;
- (id)toJsonDictionary;
@end

@implementation TTKSimpleKeyboardPlane

- (TTKSimpleKeyboardPlane)initWithTIKeyboardLayout:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_2AF48;
  v21 = sub_2AF58;
  id v22 = +[NSMutableArray array];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_2AF60;
  v16[3] = &unk_8D2F8;
  v16[4] = &v17;
  [v4 enumerateKeysUsingBlock:v16];
  v15.receiver = self;
  v15.super_class = (Class)TTKSimpleKeyboardPlane;
  v5 = [(TTKSimpleKeyboardPlane *)&v15 init];
  v6 = v5;
  if (v5)
  {
    p_keys = &v5->_keys;
    objc_storeStrong((id *)&v5->_keys, (id)v18[5]);
    v8 = [(TTKSimpleKeyboardPlane *)v6 keyboardOrientation];
    [(id)objc_opt_class() keyplaneWidthForKeys:*p_keys];
    v9 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [(id)objc_opt_class() keyplaneHeightForKeys:*p_keys];
    v10 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    uint64_t v11 = +[NSString stringWithFormat:@"%@_%@_%@", v8, v9, v10];
    name = v6->_name;
    v6->_name = (NSString *)v11;
  }
  v13 = v6;
  _Block_object_dispose(&v17, 8);

  return v13;
}

- (TTKSimpleKeyboardPlane)initWithName:(id)a3 keys:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TTKSimpleKeyboardPlane;
  v9 = [(TTKSimpleKeyboardPlane *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_keys, a4);
  }

  return v10;
}

- (TTKSimpleKeyboardPlane)initWithJsonDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TTKSimpleKeyboardPlane;
  v5 = [(TTKSimpleKeyboardPlane *)&v20 init];
  v6 = +[NSMutableArray array];
  if (v5)
  {
    uint64_t v7 = [v4 objectForKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v7;

    v9 = [v4 objectForKey:@"keys"];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [[TTKSimpleKey alloc] initWithJsonDictionary:*(void *)(*((void *)&v16 + 1) + 8 * (void)v13)];
          [v6 addObject:v14];

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v11);
    }
    objc_storeStrong((id *)&v5->_keys, v6);
  }
  return v5;
}

- (id)toJsonDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:self->_name forKeyedSubscript:@"name"];
  id v4 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_keys;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "toJsonDictionary", (void)v12);
        [v4 addObject:v10];
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v3 setObject:v4 forKeyedSubscript:@"keys"];

  return v3;
}

+ (float)keyplaneWidthForKeys:(id)a3
{
  id v3 = a3;
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * (void)v11) frame];
        v26.origin.CGFloat x = v12;
        v26.origin.CGFloat y = v13;
        v26.size.CGFloat width = v14;
        v26.size.CGFloat height = v15;
        v23.origin.CGFloat x = x;
        v23.origin.CGFloat y = y;
        v23.size.CGFloat width = width;
        v23.size.CGFloat height = height;
        CGRect v24 = CGRectUnion(v23, v26);
        CGFloat x = v24.origin.x;
        CGFloat y = v24.origin.y;
        CGFloat width = v24.size.width;
        CGFloat height = v24.size.height;
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double v16 = CGRectGetWidth(v25);

  return v16;
}

+ (float)keyplaneHeightForKeys:(id)a3
{
  id v3 = a3;
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * (void)v11) frame];
        v26.origin.CGFloat x = v12;
        v26.origin.CGFloat y = v13;
        v26.size.CGFloat width = v14;
        v26.size.CGFloat height = v15;
        v23.origin.CGFloat x = x;
        v23.origin.CGFloat y = y;
        v23.size.CGFloat width = width;
        v23.size.CGFloat height = height;
        CGRect v24 = CGRectUnion(v23, v26);
        CGFloat x = v24.origin.x;
        CGFloat y = v24.origin.y;
        CGFloat width = v24.size.width;
        CGFloat height = v24.size.height;
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double v16 = CGRectGetHeight(v25);

  return v16;
}

- (float)keyboardWidth
{
  id v3 = objc_opt_class();
  id v4 = [(TTKSimpleKeyboardPlane *)self keys];
  [v3 keyplaneWidthForKeys:v4];
  float v6 = v5;

  if (v6 <= 317.0 || v6 >= 323.0)
  {
    unint64_t v9 = 0;
    float result = 320.0;
    do
    {
      unint64_t v10 = v9;
      if (v9 == 11) {
        break;
      }
      float result = flt_862CC[++v9];
    }
    while ((float)(result + -3.0) >= v6 || v6 >= (float)(result + 3.0));
    BOOL v7 = v10 > 0xA;
  }
  else
  {
    BOOL v7 = 0;
    float result = 320.0;
  }
  float v12 = roundf(v6);
  if (v7) {
    return v12;
  }
  return result;
}

- (id)keyboardOrientation
{
  id v3 = objc_opt_class();
  id v4 = [(TTKSimpleKeyboardPlane *)self keys];
  [v3 keyplaneWidthForKeys:v4];
  float v6 = v5;

  BOOL v7 = objc_opt_class();
  id v8 = [(TTKSimpleKeyboardPlane *)self keys];
  [v7 keyplaneHeightForKeys:v8];
  float v10 = v9;

  uint64_t v11 = 0;
  id result = @"Portrait";
  while (1)
  {
    float v13 = *(float *)&dword_862FC[v11];
    float v14 = v13 + -2.0;
    float v15 = v13 + 2.0;
    if (v14 < v6 && v6 < v15) {
      break;
    }
    if (++v11 == 7) {
      return result;
    }
  }
  if (v11 != 4) {
    return @"Landscape";
  }
  float v17 = v6 / v10;
  if (v10 <= 0.0) {
    float v17 = 2.923;
  }
  if (v17 > 3.0) {
    return @"Portrait";
  }
  else {
    return @"Landscape";
  }
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end