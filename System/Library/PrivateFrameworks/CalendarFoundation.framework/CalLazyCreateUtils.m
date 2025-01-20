@interface CalLazyCreateUtils
+ (void)addArray:(id)a3 toArray:(id *)a4;
+ (void)addArray:(id)a3 withKey:(id)a4 toDictionaryOfArrays:(id *)a5;
+ (void)addArray:(id)a3 withKey:(id)a4 toDictionaryOfSets:(id *)a5;
+ (void)addArray:(id)a3 withKey:(id)a4 toStrongTableOfArrays:(id *)a5;
+ (void)addItem:(id)a3 withKey:(id)a4 toDictionaryOfArrays:(id *)a5;
+ (void)addItem:(id)a3 withKey:(id)a4 toDictionaryOfSets:(id *)a5;
+ (void)addItem:(id)a3 withKey:(id)a4 toStrongTableOfArrays:(id *)a5;
+ (void)addObject:(id)a3 toArray:(id *)a4;
+ (void)addObject:(id)a3 toSet:(id *)a4;
+ (void)addSet:(id)a3 toSet:(id *)a4;
+ (void)addSet:(id)a3 withKey:(id)a4 toDictionaryOfSets:(id *)a5;
+ (void)setValue:(id)a3 withKey:(id)a4 inDictionary:(id *)a5;
@end

@implementation CalLazyCreateUtils

+ (void)addArray:(id)a3 toArray:(id *)a4
{
  id v8 = a3;
  if ([v8 count])
  {
    id v5 = *a4;
    if (!*a4)
    {
      v6 = [MEMORY[0x1E4F1CA48] array];
      id v7 = *a4;
      *a4 = v6;

      id v5 = *a4;
    }
    [v5 addObjectsFromArray:v8];
  }
}

+ (void)addObject:(id)a3 toArray:(id *)a4
{
  id v5 = a3;
  id v6 = *a4;
  id v9 = v5;
  if (!*a4)
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    id v8 = *a4;
    *a4 = v7;

    id v5 = v9;
    id v6 = *a4;
  }
  [v6 addObject:v5];
}

+ (void)setValue:(id)a3 withKey:(id)a4 inDictionary:(id *)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = *a5;
  if (!*a5)
  {
    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
    id v10 = *a5;
    *a5 = v9;

    id v8 = *a5;
  }
  [v8 setObject:v11 forKeyedSubscript:v7];
}

+ (void)addObject:(id)a3 toSet:(id *)a4
{
  id v5 = a3;
  id v6 = *a4;
  id v9 = v5;
  if (!*a4)
  {
    id v7 = [MEMORY[0x1E4F1CA80] set];
    id v8 = *a4;
    *a4 = v7;

    id v5 = v9;
    id v6 = *a4;
  }
  [v6 addObject:v5];
}

+ (void)addSet:(id)a3 toSet:(id *)a4
{
  id v8 = a3;
  if ([v8 count])
  {
    id v5 = *a4;
    if (!*a4)
    {
      id v6 = [MEMORY[0x1E4F1CA80] set];
      id v7 = *a4;
      *a4 = v6;

      id v5 = *a4;
    }
    [v5 unionSet:v8];
  }
}

+ (void)addArray:(id)a3 withKey:(id)a4 toDictionaryOfArrays:(id *)a5
{
  id v9 = a3;
  id v7 = a4;
  if ([v9 count])
  {
    id v8 = _acquireArrayFromDictionary(a5, v7);
    [v8 addObjectsFromArray:v9];
  }
}

+ (void)addItem:(id)a3 withKey:(id)a4 toDictionaryOfArrays:(id *)a5
{
  id v7 = a3;
  _acquireArrayFromDictionary(a5, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 addObject:v7];
}

+ (void)addArray:(id)a3 withKey:(id)a4 toDictionaryOfSets:(id *)a5
{
  id v9 = a3;
  id v7 = a4;
  if ([v9 count])
  {
    id v8 = _acquireSetFromDictionary(a5, v7);
    [v8 addObjectsFromArray:v9];
  }
}

+ (void)addItem:(id)a3 withKey:(id)a4 toDictionaryOfSets:(id *)a5
{
  id v7 = a3;
  _acquireSetFromDictionary(a5, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 addObject:v7];
}

+ (void)addSet:(id)a3 withKey:(id)a4 toDictionaryOfSets:(id *)a5
{
  id v9 = a3;
  id v7 = a4;
  if ([v9 count])
  {
    id v8 = _acquireSetFromDictionary(a5, v7);
    [v8 unionSet:v9];
  }
}

+ (void)addArray:(id)a3 withKey:(id)a4 toStrongTableOfArrays:(id *)a5
{
  id v9 = a3;
  id v7 = a4;
  if ([v9 count])
  {
    id v8 = _acquireArrayFromTable(a5, v7);
    [v8 addObjectsFromArray:v9];
  }
}

+ (void)addItem:(id)a3 withKey:(id)a4 toStrongTableOfArrays:(id *)a5
{
  id v7 = a3;
  _acquireArrayFromTable(a5, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 addObject:v7];
}

@end