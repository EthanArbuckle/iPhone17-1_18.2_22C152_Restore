@interface DMCManagedBookPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (DMCManagedBookPayload)initWithBook:(id)a3;
- (MDMBook)book;
- (id)title;
- (void)setBook:(id)a3;
@end

@implementation DMCManagedBookPayload

+ (id)typeStrings
{
  return &unk_26D44B0B0;
}

+ (id)localizedSingularForm
{
  return DMCEnrollmentLocalizedString(@"DMC_MANAGED_BOOKS_SINGULAR");
}

+ (id)localizedPluralForm
{
  return DMCEnrollmentLocalizedString(@"DMC_MANAGED_BOOKS_PLURAL");
}

- (DMCManagedBookPayload)initWithBook:(id)a3
{
  id v5 = a3;
  v6 = [(DMCManagedBookPayload *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_book, a3);
  }

  return v7;
}

- (id)title
{
  v2 = [(DMCManagedBookPayload *)self book];
  v3 = [v2 friendlyName];

  return v3;
}

- (MDMBook)book
{
  return self->_book;
}

- (void)setBook:(id)a3
{
}

- (void).cxx_destruct
{
}

@end