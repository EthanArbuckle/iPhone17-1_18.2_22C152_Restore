@interface CNContactChangesObserverProxy
- (void)setContactSnapshot:(uint64_t)a1;
@end

@implementation CNContactChangesObserverProxy

- (void)setContactSnapshot:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactSnapshot, 0);
  objc_storeStrong((id *)&self->_keysToFetch, 0);

  objc_destroyWeak((id *)&self->_observer);
}

@end