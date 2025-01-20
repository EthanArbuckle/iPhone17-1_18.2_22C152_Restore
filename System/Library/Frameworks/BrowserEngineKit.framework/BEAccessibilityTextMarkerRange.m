@interface BEAccessibilityTextMarkerRange
+ (BOOL)supportsSecureCoding;
- (BEAccessibilityTextMarker)endMarker;
- (BEAccessibilityTextMarker)startMarker;
- (BEAccessibilityTextMarkerRange)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEndMarker:(id)a3;
- (void)setStartMarker:(id)a3;
@end

@implementation BEAccessibilityTextMarkerRange

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[BEAccessibilityTextMarkerRange allocWithZone:](BEAccessibilityTextMarkerRange, "allocWithZone:") init];
  v6 = [(BEAccessibilityTextMarkerRange *)self startMarker];
  v7 = (void *)[v6 copyWithZone:a3];
  [(BEAccessibilityTextMarkerRange *)v5 setStartMarker:v7];

  v8 = [(BEAccessibilityTextMarkerRange *)self endMarker];
  v9 = (void *)[v8 copyWithZone:a3];
  [(BEAccessibilityTextMarkerRange *)v5 setEndMarker:v9];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BEAccessibilityTextMarkerRange *)self startMarker];
  [v4 encodeObject:v5 forKey:@"startMarker"];

  id v6 = [(BEAccessibilityTextMarkerRange *)self endMarker];
  [v4 encodeObject:v6 forKey:@"endMarker"];
}

- (BEAccessibilityTextMarkerRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(BEAccessibilityTextMarkerRange);
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startMarker"];
  [(BEAccessibilityTextMarkerRange *)v5 setStartMarker:v6];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endMarker"];

  [(BEAccessibilityTextMarkerRange *)v5 setEndMarker:v7];
  return v5;
}

- (BEAccessibilityTextMarker)startMarker
{
  return self->startMarker;
}

- (void)setStartMarker:(id)a3
{
}

- (BEAccessibilityTextMarker)endMarker
{
  return self->endMarker;
}

- (void)setEndMarker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->endMarker, 0);

  objc_storeStrong((id *)&self->startMarker, 0);
}

@end