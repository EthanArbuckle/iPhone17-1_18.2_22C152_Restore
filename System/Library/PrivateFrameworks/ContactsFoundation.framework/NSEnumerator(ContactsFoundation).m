@interface NSEnumerator(ContactsFoundation)
- (_CNCompactMapEnumerator)_cn_compactMap:()ContactsFoundation;
- (_CNFlatMapEnumerator)_cn_flatMap:()ContactsFoundation;
- (id)_cn_filter:()ContactsFoundation;
@end

@implementation NSEnumerator(ContactsFoundation)

- (_CNCompactMapEnumerator)_cn_compactMap:()ContactsFoundation
{
  id v4 = a3;
  v5 = [[_CNCompactMapEnumerator alloc] initWithEnumerator:a1 transform:v4];

  return v5;
}

- (id)_cn_filter:()ContactsFoundation
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__NSEnumerator_ContactsFoundation___cn_filter___block_invoke;
  v8[3] = &unk_1E56A1268;
  id v9 = v4;
  id v5 = v4;
  v6 = objc_msgSend(a1, "_cn_compactMap:", v8);

  return v6;
}

- (_CNFlatMapEnumerator)_cn_flatMap:()ContactsFoundation
{
  id v4 = a3;
  id v5 = [[_CNFlatMapEnumerator alloc] initWithEnumerator:a1 transform:v4];

  return v5;
}

@end