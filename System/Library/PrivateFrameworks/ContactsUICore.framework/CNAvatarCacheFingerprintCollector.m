@interface CNAvatarCacheFingerprintCollector
- (CNAvatarCacheFingerprintCollector)init;
- (NSArray)fingerprintsOfAffectedContacts;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitUpdateContactEvent:(id)a3;
@end

@implementation CNAvatarCacheFingerprintCollector

- (CNAvatarCacheFingerprintCollector)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNAvatarCacheFingerprintCollector;
  v2 = [(CNAvatarCacheFingerprintCollector *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    fingerprints = v2->_fingerprints;
    v2->_fingerprints = v3;

    v5 = v2;
  }

  return v2;
}

- (NSArray)fingerprintsOfAffectedContacts
{
  v2 = [(NSMutableOrderedSet *)self->_fingerprints array];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)visitUpdateContactEvent:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 contact];
  int v6 = [v5 isUnified];

  if (v6)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    objc_super v7 = objc_msgSend(v4, "contact", 0);
    v8 = [v7 linkedContacts];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = +[CNUILikenessFingerprint fingerprintForContact:*(void *)(*((void *)&v16 + 1) + 8 * v12)];
          [(NSMutableOrderedSet *)self->_fingerprints addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  v14 = [v4 contact];
  v15 = +[CNUILikenessFingerprint fingerprintForContact:v14];

  [(NSMutableOrderedSet *)self->_fingerprints addObject:v15];
}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4 = [a3 contactIdentifier];
  id v5 = +[CNUILikenessFingerprint fingerprintForContactIdentifier:v4];

  [(NSMutableOrderedSet *)self->_fingerprints addObject:v5];
}

- (void).cxx_destruct
{
}

@end