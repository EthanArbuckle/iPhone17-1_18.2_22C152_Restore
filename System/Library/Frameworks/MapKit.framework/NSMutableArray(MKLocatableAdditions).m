@interface NSMutableArray(MKLocatableAdditions)
- (id)_mapkit_popLastObject;
- (uint64_t)_mapkit_insertObject:()MKLocatableAdditions sortedUsingSelector:;
- (uint64_t)_mapkit_sortUsingDistanceFromCoordinate:()MKLocatableAdditions;
- (uint64_t)_mapkit_sortUsingDistanceFromCoordinate:()MKLocatableAdditions ascending:;
- (uint64_t)_mapkit_sortUsingLatitude;
- (uint64_t)_mapkit_sortUsingLatitudeAscending:()MKLocatableAdditions;
- (uint64_t)_mapkit_sortUsingLongitude;
- (uint64_t)_mapkit_sortUsingLongitudeAscending:()MKLocatableAdditions;
@end

@implementation NSMutableArray(MKLocatableAdditions)

- (id)_mapkit_popLastObject
{
  v2 = [a1 lastObject];
  [a1 removeLastObject];

  return v2;
}

- (uint64_t)_mapkit_sortUsingLatitude
{
  return objc_msgSend(a1, "_mapkit_sortUsingLatitudeAscending:", 1);
}

- (uint64_t)_mapkit_sortUsingLatitudeAscending:()MKLocatableAdditions
{
  uint64_t v4 = 0;
  memset(v6, 0, sizeof(v6));
  uint64_t v7 = 0;
  long long v5 = MKCoordinateInvalid;
  *(_OWORD *)v6 = *MEMORY[0x1E4F1DAD8];
  *(_OWORD *)&v6[16] = *(_OWORD *)v6;
  uint64_t v7 = a3 ^ 1u;
  return [a1 sortUsingFunction:MKCompareLocatableObjects context:&v4];
}

- (uint64_t)_mapkit_sortUsingLongitude
{
  return objc_msgSend(a1, "_mapkit_sortUsingLongitudeAscending:", 1);
}

- (uint64_t)_mapkit_sortUsingLongitudeAscending:()MKLocatableAdditions
{
  uint64_t v4 = 1;
  long long v5 = MKCoordinateInvalid;
  long long v6 = *MEMORY[0x1E4F1DAD8];
  long long v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = a3 ^ 1u;
  return [a1 sortUsingFunction:MKCompareLocatableObjects context:&v4];
}

- (uint64_t)_mapkit_sortUsingDistanceFromCoordinate:()MKLocatableAdditions
{
  return objc_msgSend(a1, "_mapkit_sortUsingDistanceFromCoordinate:ascending:", 1);
}

- (uint64_t)_mapkit_sortUsingDistanceFromCoordinate:()MKLocatableAdditions ascending:
{
  v6[0] = 2;
  *(double *)&v6[1] = a2;
  *(double *)&v6[2] = a3;
  long long v7 = *MEMORY[0x1E4F1DAD8];
  long long v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = a5 ^ 1u;
  return [a1 sortUsingFunction:MKCompareLocatableObjects context:v6];
}

- (uint64_t)_mapkit_insertObject:()MKLocatableAdditions sortedUsingSelector:
{
  uint64_t v7 = [a1 count];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__NSMutableArray_MKLocatableAdditions___mapkit_insertObject_sortedUsingSelector___block_invoke;
  v9[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v9[4] = a4;
  return objc_msgSend(a1, "insertObject:atIndex:", a3, objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", a3, 0, v7, 1024, v9));
}

@end