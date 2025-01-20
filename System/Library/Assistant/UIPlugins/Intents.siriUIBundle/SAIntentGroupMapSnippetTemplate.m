@interface SAIntentGroupMapSnippetTemplate
- (Class)templateViewControllerClass;
- (id)CLLocation;
- (id)commandIdentifier;
- (id)footnote;
- (id)footnoteDescriptor;
- (id)pinColor;
- (unint64_t)mapSizeValue;
- (void)setColor:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMapSizeValue:(unint64_t)a3;
@end

@implementation SAIntentGroupMapSnippetTemplate

- (Class)templateViewControllerClass
{
  return (Class)objc_opt_class();
}

- (id)CLLocation
{
  v3 = NSStringFromSelector("CLLocation");
  v4 = [(SAIntentGroupMapSnippetTemplate *)self dictionary];
  v5 = [v4 objectForKey:v3];

  if (!v5)
  {
    v6 = [(SAIntentGroupMapSnippetTemplate *)self dictionary];
    id v7 = objc_alloc((Class)CLLocation);
    v8 = [(SAIntentGroupMapSnippetTemplate *)self location];
    v9 = [v8 latitude];
    [v9 doubleValue];
    double v11 = v10;
    v12 = [(SAIntentGroupMapSnippetTemplate *)self location];
    v13 = [v12 longitude];
    [v13 doubleValue];
    id v15 = [v7 initWithLatitude:v11 longitude:v14];
    [v6 setObject:v15 forKey:v3];
  }
  v16 = [(SAIntentGroupMapSnippetTemplate *)self dictionary];
  v17 = [v16 objectForKey:v3];

  return v17;
}

- (void)setLocation:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector("location");
  AceObjectSetAceObjectForProperty();

  NSStringFromSelector("CLLocation");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [(SAIntentGroupMapSnippetTemplate *)self dictionary];
  [v6 removeObjectForKey:v7];
}

- (id)pinColor
{
  v3 = NSStringFromSelector("pinColor");
  id v4 = [(SAIntentGroupMapSnippetTemplate *)self dictionary];
  v5 = [v4 objectForKey:v3];

  if (!v5)
  {
    v6 = [(SAIntentGroupMapSnippetTemplate *)self color];
    id v7 = [(SAIntentGroupMapSnippetTemplate *)self dictionary];
    double v8 = (double)(uint64_t)[v6 redValue] / 255.0;
    double v9 = (double)(uint64_t)[v6 greenValue] / 255.0;
    double v10 = (double)(uint64_t)[v6 blueValue] / 255.0;
    double v11 = [v6 alpha];
    [v11 doubleValue];
    v13 = +[UIColor colorWithRed:v8 green:v9 blue:v10 alpha:v12];
    [v7 setObject:v13 forKey:v3];
  }
  double v14 = [(SAIntentGroupMapSnippetTemplate *)self dictionary];
  id v15 = [v14 objectForKey:v3];

  return v15;
}

- (void)setColor:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector("color");
  AceObjectSetAceObjectForProperty();

  NSStringFromSelector("pinColor");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [(SAIntentGroupMapSnippetTemplate *)self dictionary];
  [v6 removeObjectForKey:v7];
}

- (id)footnoteDescriptor
{
  v2 = [(SAIntentGroupMapSnippetTemplate *)self detailLabelComponent];
  v3 = [v2 text];

  return v3;
}

- (id)footnote
{
  v2 = [(SAIntentGroupMapSnippetTemplate *)self detailLabelComponent];
  v3 = [v2 detailText];

  return v3;
}

- (id)commandIdentifier
{
  v2 = [(SAIntentGroupMapSnippetTemplate *)self updateLocationCommand];
  v3 = [v2 aceId];

  return v3;
}

- (unint64_t)mapSizeValue
{
  v2 = [(SAIntentGroupMapSnippetTemplate *)self mapSize];
  unint64_t v3 = +[SiriIntentsTemplateModelEnumMapper mapSizeFromString:v2];

  return v3;
}

- (void)setMapSizeValue:(unint64_t)a3
{
  id v4 = +[SiriIntentsTemplateModelEnumMapper stringFromMapSize:a3];
  [(SAIntentGroupMapSnippetTemplate *)self setMapSize:v4];
}

@end