@interface _StandardPostalAddressLocalizer
- (id)localizedStringForPostalAddressString:(id)a3 returningNilIfNotFound:(BOOL)a4;
@end

@implementation _StandardPostalAddressLocalizer

- (id)localizedStringForPostalAddressString:(id)a3 returningNilIfNotFound:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = GetBundle_cn_once_token_1;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&GetBundle_cn_once_token_1, &__block_literal_global_56);
  }
  id v7 = (id)GetBundle_cn_once_object_1;
  v8 = +[CNLocalization localizedStringForString:v6 bundle:v7 table:@"CNPostalAddressValues" returningNilIfNotFound:v4];

  return v8;
}

@end