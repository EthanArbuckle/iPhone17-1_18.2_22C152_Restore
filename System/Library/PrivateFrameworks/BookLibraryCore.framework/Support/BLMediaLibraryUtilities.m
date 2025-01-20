@interface BLMediaLibraryUtilities
+ (id)pathOfAudiobookTrackWithStoreIdentifier:(id)a3;
+ (void)_enumerateTracksMatchingPredicate:(id)a3 usingBlock:(id)a4;
+ (void)enumerateTracksWithStorePlaylistIdentifier:(id)a3 usingBlock:(id)a4;
@end

@implementation BLMediaLibraryUtilities

+ (id)pathOfAudiobookTrackWithStoreIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100043BA0;
  v16 = sub_100043BB0;
  id v17 = 0;
  v5 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyMediaType equalToValue:&off_1001AF7F0];
  v6 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyStoreItemID equalToValue:v4];
  v18[0] = v5;
  v18[1] = v6;
  v7 = +[NSArray arrayWithObjects:v18 count:2];
  v8 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100043BB8;
  v11[3] = &unk_1001A2598;
  v11[4] = &v12;
  [a1 _enumerateTracksMatchingPredicate:v8 usingBlock:v11];
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v9;
}

+ (void)enumerateTracksWithStorePlaylistIdentifier:(id)a3 usingBlock:(id)a4
{
  uint64_t v6 = ML3TrackPropertyMediaType;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[ML3ComparisonPredicate predicateWithProperty:v6 equalToValue:&off_1001AF7F0];
  v10 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyStorePlaylistID equalToValue:v8];

  v13[0] = v9;
  v13[1] = v10;
  v11 = +[NSArray arrayWithObjects:v13 count:2];
  uint64_t v12 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v11];

  [a1 _enumerateTracksMatchingPredicate:v12 usingBlock:v7];
}

+ (void)_enumerateTracksMatchingPredicate:(id)a3 usingBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ML3MusicLibrary autoupdatingSharedLibrary];
  id v8 = +[ML3Track queryWithLibrary:v7 predicate:v6];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100043E30;
  v11[3] = &unk_1001A25C0;
  id v12 = v7;
  id v13 = v5;
  id v9 = v5;
  id v10 = v7;
  [v8 enumeratePersistentIDsUsingBlock:v11];
}

@end