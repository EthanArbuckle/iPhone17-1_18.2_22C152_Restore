@interface BNBannerSourceLayoutDescription
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)bannerSourceLayoutDescriptionWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
+ (id)bannerSourceLayoutDescriptionWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4 offsetFromPresentationEdge:(double)a5;
- (BNBannerSourceLayoutDescription)initWithBSXPCCoder:(id)a3;
- (CGSize)containerSize;
- (CGSize)presentationSize;
- (NSString)description;
- (double)offsetFromPresentationEdge;
- (id)_initWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4 offsetFromPresentationEdge:(double)a5;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation BNBannerSourceLayoutDescription

+ (id)bannerSourceLayoutDescriptionWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  return (id)objc_msgSend(a1, "bannerSourceLayoutDescriptionWithPresentationSize:containerSize:offsetFromPresentationEdge:", a3.width, a3.height, a4.width, a4.height, 8.0);
}

+ (id)bannerSourceLayoutDescriptionWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4 offsetFromPresentationEdge:(double)a5
{
  id v5 = -[BNBannerSourceLayoutDescription _initWithPresentationSize:containerSize:offsetFromPresentationEdge:]([BNBannerSourceLayoutDescription alloc], "_initWithPresentationSize:containerSize:offsetFromPresentationEdge:", a3.width, a3.height, a4.width, a4.height, a5);
  return v5;
}

- (id)_initWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4 offsetFromPresentationEdge:(double)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat v8 = a3.height;
  CGFloat v9 = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)BNBannerSourceLayoutDescription;
  id result = [(BNBannerSourceLayoutDescription *)&v11 init];
  if (result)
  {
    *((CGFloat *)result + 4) = v9;
    *((CGFloat *)result + 5) = v8;
    *((CGFloat *)result + 2) = width;
    *((CGFloat *)result + 3) = height;
    *((double *)result + 1) = a5;
  }
  return result;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = NSStringFromCGSize(self->_presentationSize);
  v6 = NSStringFromCGSize(self->_containerSize);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; presentationSize: %@; containerSize: %@; offsetFromPresentationEdge: %f>",
    v4,
    self,
    v5,
    v6,
  v7 = *(void *)&self->_offsetFromPresentationEdge);

  return (NSString *)v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  double width = self->_presentationSize.width;
  double height = self->_presentationSize.height;
  id v6 = a3;
  objc_msgSend(v6, "encodeCGSize:forKey:", @"presentationSize", width, height);
  objc_msgSend(v6, "encodeCGSize:forKey:", @"containerSize", self->_containerSize.width, self->_containerSize.height);
  [v6 encodeDouble:@"offsetFromPresentationEdge" forKey:self->_offsetFromPresentationEdge];
}

- (BNBannerSourceLayoutDescription)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BNBannerSourceLayoutDescription;
  id v5 = [(BNBannerSourceLayoutDescription *)&v12 init];
  if (v5)
  {
    [v4 decodeCGSizeForKey:@"presentationSize"];
    v5->_presentationSize.double width = v6;
    v5->_presentationSize.double height = v7;
    [v4 decodeCGSizeForKey:@"containerSize"];
    v5->_containerSize.double width = v8;
    v5->_containerSize.double height = v9;
    [v4 decodeDoubleForKey:@"offsetFromPresentationEdge"];
    v5->_offsetFromPresentationEdge = v10;
  }

  return v5;
}

- (CGSize)containerSize
{
  double width = self->_containerSize.width;
  double height = self->_containerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)presentationSize
{
  double width = self->_presentationSize.width;
  double height = self->_presentationSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)offsetFromPresentationEdge
{
  return self->_offsetFromPresentationEdge;
}

@end