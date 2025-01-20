@interface HRMonogrammer
- (CGSize)monogramSize;
- (HRMonogrammer)initWithDiameter:(double)a3;
- (id)_monogramSymbolNameWith:(id)a3;
- (id)_monogramWith:(id)a3;
- (void)setMonogramSize:(CGSize)a3;
@end

@implementation HRMonogrammer

- (HRMonogrammer)initWithDiameter:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HRMonogrammer;
  result = [(HRMonogrammer *)&v5 init];
  if (result)
  {
    result->_monogramSize.width = a3;
    result->_monogramSize.height = a3;
  }
  return result;
}

- (id)_monogramSymbolNameWith:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  objc_super v5 = [v3 alphanumericCharacterSet];
  v6 = [v5 invertedSet];
  v7 = [v4 componentsSeparatedByCharactersInSet:v6];

  v8 = [v7 componentsJoinedByString:&stru_1F1D9FF30];

  v9 = (__CFString *)[v8 mutableCopy];
  CFStringTransform(v9, 0, (CFStringRef)*MEMORY[0x1E4F1D4F8], 0);
  CFStringTransform(v9, 0, (CFStringRef)*MEMORY[0x1E4F1D4F0], 0);
  v10 = [(__CFString *)v9 lowercaseString];
  if ([v10 length])
  {
    id v11 = [NSString alloc];
    v12 = [v10 substringToIndex:1];
    v13 = (__CFString *)[v11 initWithFormat:@"%@.circle.fill", v12];
  }
  else
  {
    v13 = @"number.circle.fill";
  }

  return v13;
}

- (id)_monogramWith:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(HRMonogrammer *)self _monogramSymbolNameWith:a3];
  objc_super v5 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:self->_monogramSize.width];
  v6 = (void *)MEMORY[0x1E4FB1830];
  v7 = [MEMORY[0x1E4FB1618] whiteColor];
  v17[0] = v7;
  v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.65 alpha:1.0];
  v17[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v10 = [v6 configurationWithPaletteColors:v9];

  id v11 = [v10 configurationByApplyingConfiguration:v5];
  v12 = [MEMORY[0x1E4FB1818] systemImageNamed:v4 withConfiguration:v11];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 imageWithoutBaseline];
  }
  else
  {
    v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"number.circle.fill" withConfiguration:v11];
    v14 = [v15 imageWithoutBaseline];
  }
  return v14;
}

- (CGSize)monogramSize
{
  double width = self->_monogramSize.width;
  double height = self->_monogramSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMonogramSize:(CGSize)a3
{
  self->_monogramSize = a3;
}

@end