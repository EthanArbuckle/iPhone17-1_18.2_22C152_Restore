@interface HKClinicalNoteSorter
+ (int)sortOrderForType:(id)a3;
@end

@implementation HKClinicalNoteSorter

+ (int)sortOrderForType:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if ((id)*MEMORY[0x263F1DBF0] == v3)
  {
    int v5 = 0;
  }
  else if ((id)*MEMORY[0x263F1DB00] == v3)
  {
    int v5 = 1;
  }
  else if ((id)*MEMORY[0x263F1DC68] == v3)
  {
    int v5 = 2;
  }
  else if ((id)*MEMORY[0x263F1DC20] == v3)
  {
    int v5 = 3;
  }
  else if ([v3 conformsToType:*MEMORY[0x263F1DB18]])
  {
    int v5 = 4;
  }
  else
  {
    int v5 = 5;
  }

  return v5;
}

@end