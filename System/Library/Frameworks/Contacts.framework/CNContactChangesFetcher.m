@interface CNContactChangesFetcher
- (void)setIdentifiers:(uint64_t)a1;
@end

@implementation CNContactChangesFetcher

- (void)setIdentifiers:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToFetch, 0);

  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end