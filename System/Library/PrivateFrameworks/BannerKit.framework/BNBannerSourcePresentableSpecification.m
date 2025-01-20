@interface BNBannerSourcePresentableSpecification
- (BNBannerSourcePresentableSpecification)initWithBSXPCCoder:(id)a3;
- (CGSize)preferredContentSize;
- (NSString)description;
- (UIEdgeInsets)contentOutsets;
- (int64_t)contentBehavior;
- (int64_t)presentableBehavior;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setContentBehavior:(int64_t)a3;
- (void)setContentOutsets:(UIEdgeInsets)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setPresentableBehavior:(int64_t)a3;
@end

@implementation BNBannerSourcePresentableSpecification

- (void)encodeWithBSXPCCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BNBannerSourcePresentableSpecification;
  id v4 = a3;
  [(BNPresentableIdentification *)&v8 encodeWithBSXPCCoder:v4];
  [v4 encodeInt64:self->_contentBehavior forKey:@"contentBehavior"];
  [v4 encodeInt64:self->_presentableBehavior forKey:@"presentableBehavior"];
  objc_msgSend(v4, "encodeCGSize:forKey:", @"preferredContentSize", self->_preferredContentSize.width, self->_preferredContentSize.height);
  long long v5 = *(_OWORD *)&self->_contentOutsets.bottom;
  v7[0] = *(_OWORD *)&self->_contentOutsets.top;
  v7[1] = v5;
  v6 = [MEMORY[0x1E4F29238] valueWithBytes:v7 objCType:"{UIEdgeInsets=dddd}"];
  [v4 encodeObject:v6 forKey:@"contentOutsets"];
}

- (BNBannerSourcePresentableSpecification)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BNBannerSourcePresentableSpecification;
  long long v5 = [(BNPresentableIdentification *)&v17 initWithBSXPCCoder:v4];
  if (v5)
  {
    *((void *)v5 + 4) = [v4 decodeInt64ForKey:@"contentBehavior"];
    *((void *)v5 + 5) = [v4 decodeInt64ForKey:@"presentableBehavior"];
    [v4 decodeCGSizeForKey:@"preferredContentSize"];
    *((void *)v5 + 6) = v6;
    *((void *)v5 + 7) = v7;
    objc_super v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentOutsets"];
    v9 = v8;
    v10 = v5 + 64;
    if (v8)
    {
      [v8 UIEdgeInsetsValue];
      void *v10 = v11;
      *((void *)v5 + 9) = v12;
      *((void *)v5 + 10) = v13;
      *((void *)v5 + 11) = v14;
    }
    else
    {
      long long v15 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
      *(_OWORD *)v10 = *MEMORY[0x1E4F437F8];
      *((_OWORD *)v5 + 5) = v15;
    }
  }
  return (BNBannerSourcePresentableSpecification *)v5;
}

- (NSString)description
{
  v13.receiver = self;
  v13.super_class = (Class)BNBannerSourcePresentableSpecification;
  v3 = [(BNPresentableIdentification *)&v13 description];
  id v4 = (void *)[v3 mutableCopy];

  long long v5 = NSString;
  unint64_t contentBehavior = self->_contentBehavior;
  if (contentBehavior > 2) {
    uint64_t v7 = @"[invalid]";
  }
  else {
    uint64_t v7 = off_1E63B9E58[contentBehavior];
  }
  objc_super v8 = BNStringFromBNPresentableBehavior(self->_presentableBehavior);
  v9 = NSStringFromCGSize(self->_preferredContentSize);
  v10 = NSStringFromUIEdgeInsets(self->_contentOutsets);
  objc_msgSend(v5, "stringWithFormat:", @"; contentBehavior: %@; presentableType: %@; preferredContentSize: %@; contentOutsets: %@>",
    v7,
    v8,
    v9,
  uint64_t v11 = v10);
  objc_msgSend(v4, "insertString:atIndex:", v11, objc_msgSend(v4, "rangeOfString:options:", @">", 12));

  return (NSString *)v4;
}

- (int64_t)contentBehavior
{
  return self->_contentBehavior;
}

- (void)setContentBehavior:(int64_t)a3
{
  self->_unint64_t contentBehavior = a3;
}

- (int64_t)presentableBehavior
{
  return self->_presentableBehavior;
}

- (void)setPresentableBehavior:(int64_t)a3
{
  self->_presentableBehavior = a3;
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (UIEdgeInsets)contentOutsets
{
  double top = self->_contentOutsets.top;
  double left = self->_contentOutsets.left;
  double bottom = self->_contentOutsets.bottom;
  double right = self->_contentOutsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentOutsets:(UIEdgeInsets)a3
{
  self->_contentOutsets = a3;
}

@end