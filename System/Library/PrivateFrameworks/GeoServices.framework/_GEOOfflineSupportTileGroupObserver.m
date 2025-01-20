@interface _GEOOfflineSupportTileGroupObserver
- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5;
@end

@implementation _GEOOfflineSupportTileGroupObserver

- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5
{
  id v6 = a4;
  v7 = [a5 urlInfoSet];
  int v8 = [v7 hasOfflineDataDownloadBaseURL];

  v9 = [v6 urlInfoSet];

  LODWORD(v6) = [v9 hasOfflineDataDownloadBaseURL];
  if (v8 != v6)
  {
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"GEOSupportsOfflineMapsDidChangeNotificationName" object:0];
  }
}

@end