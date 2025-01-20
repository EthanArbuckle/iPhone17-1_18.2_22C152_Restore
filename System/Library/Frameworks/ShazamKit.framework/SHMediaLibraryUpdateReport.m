@interface SHMediaLibraryUpdateReport
- (NSMutableArray)locallyFoundGroups;
- (NSMutableArray)locallyFoundTracks;
- (NSMutableArray)missingFromLocalStoreGroups;
- (NSMutableArray)missingFromLocalStoreTracks;
- (SHMediaLibraryUpdateReport)init;
@end

@implementation SHMediaLibraryUpdateReport

- (SHMediaLibraryUpdateReport)init
{
  v12.receiver = self;
  v12.super_class = (Class)SHMediaLibraryUpdateReport;
  v2 = [(SHMediaLibraryUpdateReport *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    locallyFoundTracks = v2->_locallyFoundTracks;
    v2->_locallyFoundTracks = (NSMutableArray *)v3;

    uint64_t v5 = +[NSMutableArray array];
    missingFromLocalStoreTracks = v2->_missingFromLocalStoreTracks;
    v2->_missingFromLocalStoreTracks = (NSMutableArray *)v5;

    uint64_t v7 = +[NSMutableArray array];
    locallyFoundGroups = v2->_locallyFoundGroups;
    v2->_locallyFoundGroups = (NSMutableArray *)v7;

    uint64_t v9 = +[NSMutableArray array];
    missingFromLocalStoreGroups = v2->_missingFromLocalStoreGroups;
    v2->_missingFromLocalStoreGroups = (NSMutableArray *)v9;
  }
  return v2;
}

- (NSMutableArray)locallyFoundTracks
{
  return self->_locallyFoundTracks;
}

- (NSMutableArray)missingFromLocalStoreTracks
{
  return self->_missingFromLocalStoreTracks;
}

- (NSMutableArray)locallyFoundGroups
{
  return self->_locallyFoundGroups;
}

- (NSMutableArray)missingFromLocalStoreGroups
{
  return self->_missingFromLocalStoreGroups;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missingFromLocalStoreGroups, 0);
  objc_storeStrong((id *)&self->_locallyFoundGroups, 0);
  objc_storeStrong((id *)&self->_missingFromLocalStoreTracks, 0);

  objc_storeStrong((id *)&self->_locallyFoundTracks, 0);
}

@end