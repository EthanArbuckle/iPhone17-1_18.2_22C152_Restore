@interface IRServicePackageAdapterClassification
- (BOOL)isValid;
- (IRServicePackageAdapterClassification)init;
- (NSString)detailedDesc;
- (void)setDetailedDesc:(id)a3;
- (void)setIsValid:(BOOL)a3;
@end

@implementation IRServicePackageAdapterClassification

- (IRServicePackageAdapterClassification)init
{
  v5.receiver = self;
  v5.super_class = (Class)IRServicePackageAdapterClassification;
  v2 = [(IRServicePackageAdapterClassification *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(IRServicePackageAdapterClassification *)v2 setIsValid:0];
    [(IRServicePackageAdapterClassification *)v3 setDetailedDesc:&stru_27039A840];
  }
  return v3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (NSString)detailedDesc
{
  return self->_detailedDesc;
}

- (void)setDetailedDesc:(id)a3
{
}

- (void).cxx_destruct
{
}

@end