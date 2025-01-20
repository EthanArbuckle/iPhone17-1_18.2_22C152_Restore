@interface HUCAPackageLayer
+ (id)_allTags;
+ (id)_tagsForName:(id)a3;
- (CALayer)layer;
- (HUCAPackageLayer)initWithName:(id)a3 layer:(id)a4;
- (NSSet)tags;
- (NSString)name;
- (void)_applyPrimaryColorWithModifiers:(id)a3;
- (void)applyModifiers:(id)a3;
@end

@implementation HUCAPackageLayer

- (void)applyModifiers:(id)a3
{
  id v6 = a3;
  v4 = [(HUCAPackageLayer *)self tags];
  int v5 = [v4 containsObject:@"color"];

  if (v5) {
    [(HUCAPackageLayer *)self _applyPrimaryColorWithModifiers:v6];
  }
}

- (NSSet)tags
{
  return self->_tags;
}

- (HUCAPackageLayer)initWithName:(id)a3 layer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUCAPackageLayer;
  v9 = [(HUCAPackageLayer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_layer, a4);
    uint64_t v11 = [(id)objc_opt_class() _tagsForName:v7];
    tags = v10->_tags;
    v10->_tags = (NSSet *)v11;
  }
  return v10;
}

+ (id)_tagsForName:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  id v6 = [v4 componentsSeparatedByString:@"_"];
  if ((unint64_t)[v6 count] >= 2)
  {
    unint64_t v7 = 1;
    do
    {
      id v8 = [v6 objectAtIndexedSubscript:v7];
      v9 = [a1 _allTags];
      int v10 = [v9 containsObject:v8];

      if (v10) {
        [v5 addObject:v8];
      }

      ++v7;
    }
    while (v7 < [v6 count]);
  }

  return v5;
}

+ (id)_allTags
{
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_7);
  }
  v2 = (void *)qword_26B22BA40;
  return v2;
}

void __28__HUCAPackageLayer__allTags__block_invoke_2()
{
  v4[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"color";
  v4[1] = @"secondaryColor";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)qword_26B22BA40;
  qword_26B22BA40 = v2;
}

- (void)_applyPrimaryColorWithModifiers:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  int v5 = [(HUCAPackageLayer *)self layer];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v21 = [(HUCAPackageLayer *)self name];
      v22 = [(HUCAPackageLayer *)self layer];
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      int v25 = 138412546;
      v26 = v21;
      __int16 v27 = 2112;
      v28 = v24;
      _os_log_error_impl(&dword_25275A000, v8, OS_LOG_TYPE_ERROR, "Package layer (%@) of type '%@' requested to modify primary color but isn't a valid CAShapeLayer", (uint8_t *)&v25, 0x16u);
    }
  }
  v9 = [v4 objectForKeyedSubscript:*MEMORY[0x263F47938]];
  int v10 = [v4 objectForKeyedSubscript:*MEMORY[0x263F47940]];
  uint64_t v11 = [v4 objectForKeyedSubscript:*MEMORY[0x263F47930]];

  if (v9) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = v10 == 0;
  }
  if (!v12 || v11 != 0)
  {
    double v14 = 1.0;
    double v15 = 1.0;
    if (v9)
    {
      [v9 doubleValue];
      double v15 = v16;
    }
    if (v10)
    {
      [v10 doubleValue];
      double v14 = v17;
    }
    if (v11)
    {
      [v11 doubleValue];
      double v19 = v18;
    }
    else
    {
      double v19 = 1.0;
    }
    id v20 = [MEMORY[0x263F1C550] colorWithHue:v15 saturation:v14 brightness:1.0 alpha:v19];
    objc_msgSend(v7, "setFillColor:", objc_msgSend(v20, "CGColor"));
  }
}

- (NSString)name
{
  return self->_name;
}

- (CALayer)layer
{
  return self->_layer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end