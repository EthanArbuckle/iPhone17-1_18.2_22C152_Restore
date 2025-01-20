@interface BMDSL(BMDSLStreamPublisher)
- (id)rootStreamIdentifiers;
- (id)streamPublishers;
@end

@implementation BMDSL(BMDSLStreamPublisher)

- (id)rootStreamIdentifiers
{
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a1, 0);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  while ([v1 count])
  {
    v3 = [v1 firstObject];
    [v1 removeObjectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [v3 identifier];
      if (v4) {
        [v2 addObject:v4];
      }
    }
    v5 = [v3 upstreams];
    [v1 addObjectsFromArray:v5];
  }
  v6 = (void *)[v2 copy];

  return v6;
}

- (id)streamPublishers
{
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a1, 0);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  while ([v1 count])
  {
    v3 = [v1 firstObject];
    [v1 removeObjectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v2 addObject:v3];
    }
    v4 = [v3 upstreams];
    [v1 addObjectsFromArray:v4];
  }
  v5 = (void *)[v2 copy];

  return v5;
}

@end