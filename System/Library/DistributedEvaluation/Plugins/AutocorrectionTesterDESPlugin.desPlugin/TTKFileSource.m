@interface TTKFileSource
- (BOOL)parseData:(id)a3;
- (NSDictionary)layouts;
- (NSString)inputMode;
- (float)fileVersion;
- (id)getNextTestCase;
- (id)init:(id)a3 inputMode:(id)a4 layouts:(id)a5;
- (id)onNewLayoutsFound;
- (int)majorVersion;
- (int)minorVersion;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)parseLayouts:(id)a3;
- (void)reset;
- (void)setOnNewLayoutsFound:(id)a3;
@end

@implementation TTKFileSource

- (void)parseLayouts:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  v6 = [v4 objectForKey:@"layouts"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [[TTKSimpleKeyboardPlane alloc] initWithJsonDictionary:*(void *)(*((void *)&v14 + 1) + 8 * (void)v10)];
        v12 = [(TTKSimpleKeyboardPlane *)v11 name];
        [(NSDictionary *)v5 setObject:v11 forKey:v12];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  layouts = self->_layouts;
  self->_layouts = v5;
}

- (BOOL)parseData:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"version"];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    id v7 = [v4 objectForKey:@"major_version"];
    self->_int majorVersion = [v7 intValue];

    int majorVersion = self->_majorVersion;
    BOOL v6 = majorVersion == 2;
    if (majorVersion == 2)
    {
      uint64_t v9 = [v4 objectForKey:@"minor_version"];
      self->_minorVersion = [v9 intValue];

      self->_fileVersion = (float)((float)self->_minorVersion / 10.0) + (float)self->_majorVersion;
      if (!self->_inputMode)
      {
        v10 = [v4 objectForKey:@"input_mode"];
        inputMode = self->_inputMode;
        self->_inputMode = v10;
      }
      if (!self->_layouts) {
        [(TTKFileSource *)self parseLayouts:v4];
      }
      v12 = +[NSMutableArray array];
      test_cases = self->_test_cases;
      self->_test_cases = v12;

      v19 = [v4 objectForKey:@"test_cases"];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v14 = [v19 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v23;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v19);
            }
            v18 = [[TTKTestCase alloc] initWithDictionary:*(void *)(*((void *)&v22 + 1) + 8 * i)];
            [(NSMutableArray *)self->_test_cases addObject:v18];
          }
          id v15 = [v19 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v15);
      }
    }
    else
    {
      v19 = sub_4038();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_591A0(&self->_majorVersion, v19);
      }
    }
  }
  return v6;
}

- (id)init:(id)a3 inputMode:(id)a4 layouts:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TTKFileSource;
  v11 = [(TTKFileSource *)&v16 init];
  p_isa = (id *)&v11->super.isa;
  if (!v11) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v11->_inputMode, a4);
  objc_storeStrong(p_isa + 3, a5);
  if ([p_isa parseData:v8])
  {
    [p_isa reset];
LABEL_4:
    v13 = p_isa;
    goto LABEL_8;
  }
  id v14 = sub_4038();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_5922C(v14);
  }

  v13 = 0;
LABEL_8:

  return v13;
}

- (void)reset
{
  self->_test_case_index = 0;
}

- (id)getNextTestCase
{
  unint64_t test_case_index = self->_test_case_index;
  if ((unint64_t)[(NSMutableArray *)self->_test_cases count] <= test_case_index)
  {
    v5 = 0;
  }
  else
  {
    test_cases = self->_test_cases;
    ++self->_test_case_index;
    v5 = -[NSMutableArray objectAtIndex:](test_cases, "objectAtIndex:");
  }

  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (!a3->var0) {
    a3->var2 = a3->var3;
  }
  a3->var0 = 0;
  if (a5)
  {
    do
    {
      id v9 = [(TTKFileSource *)self getNextTestCase];
      unint64_t result = a3->var0;
      if (!v9) {
        break;
      }
      a3->var0 = result + 1;
      a4[result] = v9;
      unint64_t result = a3->var0;
    }
    while (a3->var0 < a5);
  }
  else
  {
    unint64_t result = 0;
  }
  a3->var1 = a4;
  return result;
}

- (NSDictionary)layouts
{
  return self->_layouts;
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (float)fileVersion
{
  return self->_fileVersion;
}

- (int)majorVersion
{
  return self->_majorVersion;
}

- (int)minorVersion
{
  return self->_minorVersion;
}

- (id)onNewLayoutsFound
{
  return self->_onNewLayoutsFound;
}

- (void)setOnNewLayoutsFound:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onNewLayoutsFound, 0);
  objc_storeStrong((id *)&self->_test_cases, 0);
  objc_storeStrong((id *)&self->_layouts, 0);

  objc_storeStrong((id *)&self->_inputMode, 0);
}

@end