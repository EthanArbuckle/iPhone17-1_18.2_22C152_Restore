@interface MADVIVisualSearchGatingDomainInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)hasFocalPoint;
- (CGPoint)focalPoint;
- (MADVIVisualSearchGatingDomainInfo)initWithCoder:(id)a3;
- (MADVIVisualSearchGatingDomainInfo)initWithDomain:(id)a3 label:(id)a4 glyphName:(id)a5 hasFocalPoint:(BOOL)a6 focalPoint:(CGPoint)a7 displayLabel:(id)a8 displayMessage:(id)a9;
- (NSString)displayLabel;
- (NSString)displayMessage;
- (NSString)domain;
- (NSString)glyphName;
- (NSString)label;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVIVisualSearchGatingDomainInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIVisualSearchGatingDomainInfo)initWithDomain:(id)a3 label:(id)a4 glyphName:(id)a5 hasFocalPoint:(BOOL)a6 focalPoint:(CGPoint)a7 displayLabel:(id)a8 displayMessage:(id)a9
{
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  id v25 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MADVIVisualSearchGatingDomainInfo;
  v21 = [(MADVIVisualSearchGatingDomainInfo *)&v26 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_domain, a3);
    objc_storeStrong((id *)&v22->_label, a4);
    objc_storeStrong((id *)&v22->_glyphName, a5);
    v22->_hasFocalPoint = a6;
    v22->_focalPoint.CGFloat x = x;
    v22->_focalPoint.CGFloat y = y;
    objc_storeStrong((id *)&v22->_displayLabel, a8);
    objc_storeStrong((id *)&v22->_displayMessage, a9);
  }

  return v22;
}

- (MADVIVisualSearchGatingDomainInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MADVIVisualSearchGatingDomainInfo;
  v5 = [(MADVIVisualSearchGatingDomainInfo *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Domain"];
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Label"];
    label = v5->_label;
    v5->_label = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GlyphName"];
    glyphName = v5->_glyphName;
    v5->_glyphName = (NSString *)v10;

    v5->_hasFocalPoint = [v4 decodeBoolForKey:@"HasFocalPoint"];
    [v4 decodePointForKey:@"FocalPoint"];
    v5->_focalPoint.CGFloat x = v12;
    v5->_focalPoint.CGFloat y = v13;
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DisplayLabel"];
    displayLabel = v5->_displayLabel;
    v5->_displayLabel = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DisplayMessage"];
    displayMessage = v5->_displayMessage;
    v5->_displayMessage = (NSString *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  domain = self->_domain;
  id v5 = a3;
  [v5 encodeObject:domain forKey:@"Domain"];
  [v5 encodeObject:self->_label forKey:@"Label"];
  [v5 encodeObject:self->_glyphName forKey:@"GlyphName"];
  [v5 encodeBool:self->_hasFocalPoint forKey:@"HasFocalPoint"];
  objc_msgSend(v5, "encodePoint:forKey:", @"FocalPoint", self->_focalPoint.x, self->_focalPoint.y);
  [v5 encodeObject:self->_displayLabel forKey:@"DisplayLabel"];
  [v5 encodeObject:self->_displayMessage forKey:@"DisplayMessage"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"domain: %@, ", self->_domain];
  [v3 appendFormat:@"label: %@, ", self->_label];
  [v3 appendFormat:@"glyphName: %@, ", self->_glyphName];
  [v3 appendFormat:@"hasFocalPoint: %d, ", self->_hasFocalPoint];
  [v3 appendFormat:@"focalPoint: (%0.2f, %0.2f), ", *(void *)&self->_focalPoint.x, *(void *)&self->_focalPoint.y];
  [v3 appendFormat:@"displayLabel: %@, ", self->_displayLabel];
  [v3 appendFormat:@"displayMessage: %@>", self->_displayMessage];
  return v3;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)glyphName
{
  return self->_glyphName;
}

- (BOOL)hasFocalPoint
{
  return self->_hasFocalPoint;
}

- (CGPoint)focalPoint
{
  double x = self->_focalPoint.x;
  double y = self->_focalPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (NSString)displayMessage
{
  return self->_displayMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMessage, 0);
  objc_storeStrong((id *)&self->_displayLabel, 0);
  objc_storeStrong((id *)&self->_glyphName, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end