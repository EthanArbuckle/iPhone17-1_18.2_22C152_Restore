@interface _GreenTeaPostalAddressLocalizer
- (id)localizedStringForPostalAddressString:(id)a3 returningNilIfNotFound:(BOOL)a4;
@end

@implementation _GreenTeaPostalAddressLocalizer

- (id)localizedStringForPostalAddressString:(id)a3 returningNilIfNotFound:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (GetBundle_cn_once_token_1 != -1) {
    dispatch_once(&GetBundle_cn_once_token_1, &__block_literal_global_56);
  }
  id v6 = +[CNLocalization localizedStringForString:v5 bundle:GetBundle_cn_once_object_1 table:@"CNPostalAddressValues_cn" returningNilIfNotFound:1];
  v7 = v6;
  if (!v6)
  {
    if (GetBundle_cn_once_token_1 != -1) {
      dispatch_once(&GetBundle_cn_once_token_1, &__block_literal_global_56);
    }
    v7 = +[CNLocalization localizedStringForString:v5 bundle:GetBundle_cn_once_object_1 table:@"CNPostalAddressValues" returningNilIfNotFound:v4];
  }

  return v7;
}

@end