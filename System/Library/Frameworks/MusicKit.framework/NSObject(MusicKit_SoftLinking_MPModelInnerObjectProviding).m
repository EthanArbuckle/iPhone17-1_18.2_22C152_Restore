@interface NSObject(MusicKit_SoftLinking_MPModelInnerObjectProviding)
- (id)_musicKit_innerModelObject;
@end

@implementation NSObject(MusicKit_SoftLinking_MPModelInnerObjectProviding)

- (id)_musicKit_innerModelObject
{
  getMPModelObjectClass();
  if (objc_opt_isKindOfClass())
  {
    id v2 = a1;
    id v3 = [v2 relativeModelObjectForStoreLibraryPersonalization];
    getMPModelGenericObjectClass();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v2;
      if ([v4 type] == 5)
      {
        uint64_t v5 = [v4 playlistEntry];

        id v3 = (id)v5;
      }
      if (!v3)
      {
        id v3 = [v4 anyObject];
      }
    }
    if (!v3) {
      id v3 = v2;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

@end