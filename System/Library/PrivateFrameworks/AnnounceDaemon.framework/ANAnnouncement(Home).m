@interface ANAnnouncement(Home)
+ (id)uniqueAnnouncersInAnnouncements:()Home;
- (id)announcerNameInHome:()Home;
@end

@implementation ANAnnouncement(Home)

- (id)announcerNameInHome:()Home
{
  id v4 = a3;
  v5 = [a1 announcer];
  v6 = [v5 nameInHome:v4];

  return v6;
}

+ (id)uniqueAnnouncersInAnnouncements:()Home
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_opt_new();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "announcer", (void)v13);
          if ([v4 containsObject:v10]) {
            [v4 removeObject:v10];
          }
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    v11 = [v4 array];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

@end