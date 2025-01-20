@interface ECAccountFactory
+ (id)accountWithSystemAccount:(id)a3;
@end

@implementation ECAccountFactory

+ (id)accountWithSystemAccount:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 accountType];
    v6 = [v5 identifier];

    if ([v6 isEqualToString:*MEMORY[0x1E4F177E8]])
    {
      v7 = off_1E63EDD18;
    }
    else if ([v6 isEqualToString:*MEMORY[0x1E4F17798]])
    {
      v7 = off_1E63EDCC0;
    }
    else if ([v6 isEqualToString:*MEMORY[0x1E4F17830]])
    {
      v7 = off_1E63EDD88;
    }
    else
    {
      int v9 = [v6 isEqualToString:*MEMORY[0x1E4F17850]];
      v7 = off_1E63EDC10;
      if (v9) {
        v7 = off_1E63EDDB0;
      }
    }
    v8 = (void *)[objc_alloc(*v7) initWithSystemAccount:v4];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end