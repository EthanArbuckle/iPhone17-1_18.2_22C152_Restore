@interface CENativeModalRecommendationAction
+ (BOOL)supportsSecureCoding;
- (CENativeModalRecommendationAction)initWithCoder:(id)a3;
- (CENativeModalRecommendationAction)initWithIdentifier:(id)a3 title:(id)a4 detailControllerClass:(Class)a5;
- (Class)detailControllerClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDetailControllerClass:(Class)a3;
@end

@implementation CENativeModalRecommendationAction

- (CENativeModalRecommendationAction)initWithIdentifier:(id)a3 title:(id)a4 detailControllerClass:(Class)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CENativeModalRecommendationAction;
  v6 = [(CERecommendationAction *)&v9 initWithIdentifier:a3 actionTitle:a4 actionType:@"NativeModal"];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_detailControllerClass, a5);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CENativeModalRecommendationAction;
  id v4 = a3;
  [(CERecommendationAction *)&v6 encodeWithCoder:v4];
  v5 = NSStringFromClass(self->_detailControllerClass);
  objc_msgSend(v4, "encodeObject:forKey:", v5, @"viewControllerClass", v6.receiver, v6.super_class);
}

- (CENativeModalRecommendationAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CENativeModalRecommendationAction;
  v5 = [(CERecommendationAction *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"viewControllerClass"];
    uint64_t v7 = NSClassFromString(v6);
    Class detailControllerClass = v5->_detailControllerClass;
    v5->_Class detailControllerClass = (Class)v7;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CENativeModalRecommendationAction;
  id v4 = [(CERecommendationAction *)&v6 copyWithZone:a3];
  [v4 setDetailControllerClass:self->_detailControllerClass];
  return v4;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CENativeModalRecommendationAction;
  v3 = [(CERecommendationAction *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" detailControllerClass: %@", self->_detailControllerClass];

  return v4;
}

- (Class)detailControllerClass
{
  return self->_detailControllerClass;
}

- (void)setDetailControllerClass:(Class)a3
{
}

- (void).cxx_destruct
{
}

@end