@interface AXTeachableItem
+ (BOOL)supportsSecureCoding;
- (AXTeachableItem)initWithCoder:(id)a3;
- (NSString)feature;
- (NSString)itemDescription;
- (NSString)itemTitle;
- (NSString)version;
- (void)encodeWithCoder:(id)a3;
- (void)setFeature:(id)a3;
- (void)setItemDescription:(id)a3;
- (void)setItemTitle:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation AXTeachableItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXTeachableItem *)self itemTitle];
  [v4 encodeObject:v5 forKey:@"itemTitle"];

  v6 = [(AXTeachableItem *)self itemDescription];
  [v4 encodeObject:v6 forKey:@"itemDescription"];

  v7 = [(AXTeachableItem *)self feature];
  [v4 encodeObject:v7 forKey:@"feature"];

  id v8 = [(AXTeachableItem *)self version];
  [v4 encodeObject:v8 forKey:@"version"];
}

- (AXTeachableItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (AXTeachableItem *)objc_opt_new();
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemTitle"];
  [(AXTeachableItem *)v5 setItemTitle:v6];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemDescription"];
  [(AXTeachableItem *)v5 setItemDescription:v7];

  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"feature"];
  [(AXTeachableItem *)v5 setFeature:v8];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];

  [(AXTeachableItem *)v5 setVersion:v9];
  return v5;
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void)setItemTitle:(id)a3
{
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
}

- (NSString)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);

  objc_storeStrong((id *)&self->_itemTitle, 0);
}

@end