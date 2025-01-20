@interface HKLegendPointAnnotationStyle
+ (HKLegendPointAnnotationStyle)annotationStyleWithLabelStyle:(id)a3 localizedLabelKey:(id)a4 leftOfSeries:(BOOL)a5;
- (BOOL)leftOfSeries;
- (HKAxisLabelStyle)labelStyle;
- (NSString)localizedLabelKey;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLabelStyle:(id)a3;
- (void)setLeftOfSeries:(BOOL)a3;
- (void)setLocalizedLabelKey:(id)a3;
@end

@implementation HKLegendPointAnnotationStyle

+ (HKLegendPointAnnotationStyle)annotationStyleWithLabelStyle:(id)a3 localizedLabelKey:(id)a4 leftOfSeries:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = objc_opt_new();
  [v9 setLabelStyle:v8];

  [v9 setLeftOfSeries:v5];
  [v9 setLocalizedLabelKey:v7];

  return (HKLegendPointAnnotationStyle *)v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(HKAxisLabelStyle *)self->_labelStyle copy];
  v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  *(unsigned char *)(v4 + 8) = self->_leftOfSeries;
  uint64_t v7 = [(NSString *)self->_localizedLabelKey copy];
  id v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  return (id)v4;
}

- (HKAxisLabelStyle)labelStyle
{
  return self->_labelStyle;
}

- (void)setLabelStyle:(id)a3
{
}

- (NSString)localizedLabelKey
{
  return self->_localizedLabelKey;
}

- (void)setLocalizedLabelKey:(id)a3
{
}

- (BOOL)leftOfSeries
{
  return self->_leftOfSeries;
}

- (void)setLeftOfSeries:(BOOL)a3
{
  self->_leftOfSeries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedLabelKey, 0);
  objc_storeStrong((id *)&self->_labelStyle, 0);
}

@end