@interface HFLiteralLocalizableStringKey
- (HFLiteralLocalizableStringKey)initWithLocalizedString:(id)a3;
- (NSString)localizedString;
@end

@implementation HFLiteralLocalizableStringKey

- (HFLiteralLocalizableStringKey)initWithLocalizedString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFLiteralLocalizableStringKey;
  v6 = [(HFLocalizableStringKey *)&v9 initWithKey:&stru_26C081158 argumentKeys:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_localizedString, a3);
  }

  return v7;
}

- (NSString)localizedString
{
  return self->_localizedString;
}

- (void).cxx_destruct
{
}

@end