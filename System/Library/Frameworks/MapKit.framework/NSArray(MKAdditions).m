@interface NSArray(MKAdditions)
- (CFIndex)_mapkit_indexForObject:()MKAdditions usingSortFunction:context:;
- (id)_mapkit_arrayByRemovingObject:()MKAdditions;
- (id)_mapkit_componentsJoinedInCommaDelimitedList;
- (id)_mapkit_joinedAddressComponents;
@end

@implementation NSArray(MKAdditions)

- (id)_mapkit_arrayByRemovingObject:()MKAdditions
{
  id v4 = a3;
  if (v4 && (uint64_t v5 = [a1 indexOfObject:v4], v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v8 = v5;
    if ([a1 count] == 1)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = (id)[a1 mutableCopy];
      [v6 removeObjectAtIndex:v8];
    }
  }
  else
  {
    id v6 = a1;
  }

  return v6;
}

- (CFIndex)_mapkit_indexForObject:()MKAdditions usingSortFunction:context:
{
  v9.length = [a1 count];
  v9.location = 0;

  return CFArrayBSearchValues((CFArrayRef)a1, v9, a3, a4, a5);
}

- (id)_mapkit_componentsJoinedInCommaDelimitedList
{
  v2 = objc_msgSend(NSString, "_mapkit_commaListDelimiter");
  v3 = [a1 componentsJoinedByString:v2];

  return v3;
}

- (id)_mapkit_joinedAddressComponents
{
  v2 = _MKLocalizedStringFromThisBundle(@"Address component delimiter");
  v3 = [a1 componentsJoinedByString:v2];

  return v3;
}

@end