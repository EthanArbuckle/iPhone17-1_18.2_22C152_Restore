@interface CLKComplicationBackgroundDescriptor
- (CLKComplicationBackgroundDescriptor)initWithBackgroundColor:(id)a3;
- (CLKComplicationBackgroundDescriptor)initWithClearBackground;
- (CLKComplicationBackgroundDescriptor)initWithGradientBackgroundColors:(id)a3;
- (CLKComplicationBackgroundDescriptor)initWithGradientBackgroundColors:(id)a3 locations:(id)a4;
- (CLKComplicationBackgroundDescriptor)initWithMaterialBackground;
- (NSArray)backgroundColors;
- (NSArray)backgroundLocations;
- (int64_t)style;
@end

@implementation CLKComplicationBackgroundDescriptor

- (CLKComplicationBackgroundDescriptor)initWithClearBackground
{
  v7.receiver = self;
  v7.super_class = (Class)CLKComplicationBackgroundDescriptor;
  v2 = [(CLKComplicationBackgroundDescriptor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    backgroundColors = v2->_backgroundColors;
    v2->_backgroundColors = 0;

    backgroundLocations = v3->_backgroundLocations;
    v3->_backgroundLocations = 0;

    v3->_style = 1;
  }
  return v3;
}

- (CLKComplicationBackgroundDescriptor)initWithMaterialBackground
{
  v7.receiver = self;
  v7.super_class = (Class)CLKComplicationBackgroundDescriptor;
  v2 = [(CLKComplicationBackgroundDescriptor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    backgroundColors = v2->_backgroundColors;
    v2->_backgroundColors = 0;

    backgroundLocations = v3->_backgroundLocations;
    v3->_backgroundLocations = 0;

    v3->_style = 0;
  }
  return v3;
}

- (CLKComplicationBackgroundDescriptor)initWithGradientBackgroundColors:(id)a3 locations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLKComplicationBackgroundDescriptor;
  v8 = [(CLKComplicationBackgroundDescriptor *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    backgroundColors = v8->_backgroundColors;
    v8->_backgroundColors = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    backgroundLocations = v8->_backgroundLocations;
    v8->_backgroundLocations = (NSArray *)v11;

    v8->_style = 2;
  }

  return v8;
}

- (CLKComplicationBackgroundDescriptor)initWithGradientBackgroundColors:(id)a3
{
  return [(CLKComplicationBackgroundDescriptor *)self initWithGradientBackgroundColors:a3 locations:0];
}

- (CLKComplicationBackgroundDescriptor)initWithBackgroundColor:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  v9[0] = a3;
  v9[1] = a3;
  v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v9 count:2];

  id v7 = [(CLKComplicationBackgroundDescriptor *)self initWithGradientBackgroundColors:v6];
  return v7;
}

- (NSArray)backgroundColors
{
  return self->_backgroundColors;
}

- (NSArray)backgroundLocations
{
  return self->_backgroundLocations;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundLocations, 0);

  objc_storeStrong((id *)&self->_backgroundColors, 0);
}

@end