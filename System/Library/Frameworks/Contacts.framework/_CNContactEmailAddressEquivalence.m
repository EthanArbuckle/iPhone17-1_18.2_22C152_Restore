@interface _CNContactEmailAddressEquivalence
+ (id)indexKeyForString:(id)a3;
- (BOOL)isEquivalentToString:(id)a3 strict:(BOOL *)a4;
- (_CNContactEmailAddressEquivalence)initWithEmailAddress:(id)a3;
@end

@implementation _CNContactEmailAddressEquivalence

+ (id)indexKeyForString:(id)a3
{
  return (id)[a3 lowercaseString];
}

- (_CNContactEmailAddressEquivalence)initWithEmailAddress:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNContactEmailAddressEquivalence;
  v5 = [(_CNContactEmailAddressEquivalence *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    rawString = v5->_rawString;
    v5->_rawString = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)isEquivalentToString:(id)a3 strict:(BOOL *)a4
{
  int v5 = [(NSString *)self->_rawString _cn_caseInsensitiveIsEqual:a3];
  if (v5) {
    *a4 = 1;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end