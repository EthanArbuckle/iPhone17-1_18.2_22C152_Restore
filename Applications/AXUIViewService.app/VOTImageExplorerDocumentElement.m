@interface VOTImageExplorerDocumentElement
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)description;
- (int64_t)accessibilityContainerType;
@end

@implementation VOTImageExplorerDocumentElement

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(VOTImageExplorerDocumentElement *)self accessibilityLabel];
  [(VOTImageExplorerElement *)self accessibilityFrame];
  v6 = NSStringFromCGRect(v10);
  v7 = +[NSString stringWithFormat:@"%@, Label: %@, Frame: %@", v4, v5, v6];

  return v7;
}

- (id)accessibilityLabel
{
  v2 = [(VOTImageExplorerElement *)self feature];
  v3 = +[AXMVisionFeature nameForOCRType:](AXMVisionFeature, "nameForOCRType:", [v2 ocrFeatureType]);

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityIdentifier
{
  return @"VOTImageExplorerDocumentElement";
}

@end