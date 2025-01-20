@interface BPSBookmarkableEnumerator
- (id)bookmark;
- (id)bpsPublisher;
- (id)nextObject;
- (id)validateBookmark:(id)a3;
- (void)applyBookmark:(id)a3;
- (void)reset;
@end

@implementation BPSBookmarkableEnumerator

- (id)nextObject
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Must override method %@ in a subclass", v4 format];

  return 0;
}

- (id)bookmark
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Must override method %@ in a subclass", v4 format];

  return 0;
}

- (id)validateBookmark:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Must override method %@ in a subclass", v5 format];

  return 0;
}

- (void)applyBookmark:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"Must override method %@ in a subclass", v5 format];
}

- (void)reset
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 raise:v3, @"Must override method %@ in a subclass", v4 format];
}

- (id)bpsPublisher
{
  v2 = [[BPSSequence alloc] initWithBookmarkableEnumerator:self];
  return v2;
}

@end