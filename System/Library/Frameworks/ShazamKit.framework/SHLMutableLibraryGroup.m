@interface SHLMutableLibraryGroup
- (id)copyWithZone:(_NSZone *)a3;
- (void)addTracks:(id)a3;
- (void)removeTracks:(id)a3;
@end

@implementation SHLMutableLibraryGroup

- (void)addTracks:(id)a3
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v10 = [v9 associatedGroupIdentifier];

        if (v10)
        {
          v14 = [v9 identifier];
          v15 = [v9 associatedGroupIdentifier];
          v16 = +[NSString stringWithFormat:@"Track with identifier %@ is already associated to a group (%@), try removing it before.", v14, v15, (void)v18];
          id v17 = +[NSException shl_exceptionWithName:NSInvalidArgumentException reason:v16];

          objc_exception_throw(v17);
        }
        v11 = [(SHLLibraryGroup *)self identifier];
        [v9 setAssociatedGroupIdentifier:v11];

        v12 = [(SHLLibraryGroup *)self tracksToSave];
        id v13 = [v9 copy];
        [v12 addObject:v13];
      }
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
}

- (void)removeTracks:(id)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = [v9 associatedGroupIdentifier];

        if (!v10)
        {
          id v13 = [v9 identifier];
          v14 = +[NSString stringWithFormat:@"Track with identifier %@ cannot be removed, try adding it before.", v13];
          id v15 = +[NSException shl_exceptionWithName:NSInvalidArgumentException reason:v14];

          objc_exception_throw(v15);
        }
        [v9 setAssociatedGroupIdentifier:0];
        v11 = [(SHLLibraryGroup *)self tracksToSave];
        id v12 = [v9 copy];
        [v11 addObject:v12];
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SHLLibraryGroup allocWithZone:a3];

  return [(SHLLibraryGroup *)v4 initWithLibraryGroup:self];
}

@end