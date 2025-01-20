@interface CSSearchableItemAttributeSet
- (BOOL)hasLocationData;
@end

@implementation CSSearchableItemAttributeSet

- (BOOL)hasLocationData
{
  v3 = [(CSSearchableItemAttributeSet *)self latitude];
  if (v3)
  {
    v4 = [(CSSearchableItemAttributeSet *)self longitude];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end