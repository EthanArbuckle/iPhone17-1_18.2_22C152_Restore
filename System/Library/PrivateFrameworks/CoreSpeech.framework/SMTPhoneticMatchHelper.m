@interface SMTPhoneticMatchHelper
+ (id)fetchContentsWithConfiguration:(id)a3 feedTypeString:(id)a4 rankingMethod:(id)a5 shouldStopBlock:(id)a6;
@end

@implementation SMTPhoneticMatchHelper

+ (id)fetchContentsWithConfiguration:(id)a3 feedTypeString:(id)a4 rankingMethod:(id)a5 shouldStopBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (unsigned int (**)(void))a6;
  unsigned int v73 = [v10 isEqualToString:EARPhoneticMatchFeedTypeArtistsKey];
  if (v73)
  {
    id v13 = [objc_alloc((Class)sub_100028368()) init];
    [v13 setGroupingType:2];
    int v14 = 0;
    int v70 = 0;
    uint64_t v71 = 0;
    int v69 = 0;
    int v64 = 0;
    int v62 = 0;
    uint64_t v15 = 1;
  }
  else if ([v10 isEqualToString:EARPhoneticMatchFeedTypeSongsKey])
  {
    id v13 = [objc_alloc((Class)sub_100028368()) init];
    [v13 setGroupingType:0];
    int v14 = 0;
    int v69 = 0;
    int v70 = 0;
    int v64 = 0;
    int v62 = 0;
    uint64_t v71 = 0x100000000;
    uint64_t v15 = 3;
  }
  else if ([v10 isEqualToString:EARPhoneticMatchFeedTypeSongsArtistsKey])
  {
    id v13 = [objc_alloc((Class)sub_100028368()) init];
    [v13 setGroupingType:0];
    int v14 = 0;
    int v69 = 0;
    int v70 = 0;
    int v64 = 0;
    int v62 = 0;
    uint64_t v71 = 1;
    uint64_t v15 = 4;
  }
  else if ([v10 isEqualToString:EARPhoneticMatchFeedTypeAlbumsKey])
  {
    id v13 = [objc_alloc((Class)sub_100028368()) init];
    int v70 = 1;
    [v13 setGroupingType:1];
    int v14 = 0;
    uint64_t v71 = 0;
    int v69 = 0;
    int v64 = 0;
    int v62 = 0;
    uint64_t v15 = 2;
  }
  else if ([v10 isEqualToString:EARPhoneticMatchFeedTypeAlbumsArtistsKey])
  {
    id v13 = [objc_alloc((Class)sub_100028368()) init];
    int v69 = 1;
    [v13 setGroupingType:1];
    int v14 = 0;
    int v70 = 0;
    uint64_t v71 = 0;
    int v64 = 0;
    int v62 = 0;
    uint64_t v15 = 5;
  }
  else if ([v10 isEqualToString:EARPhoneticMatchFeedTypePodcastsKey])
  {
    id v13 = [sub_100028368() podcastsQuery];
    int v14 = 0;
    int v70 = 0;
    uint64_t v71 = 0;
    int v69 = 0;
    int v62 = 0;
    int v64 = 1;
    uint64_t v15 = 9;
  }
  else if ([v10 isEqualToString:EARPhoneticMatchFeedTypePlaylistsKey])
  {
    id v13 = [sub_100028368() playlistsQuery];
    int v70 = 0;
    uint64_t v71 = 0;
    int v69 = 0;
    int v64 = 0;
    int v62 = 0;
    int v14 = 1;
    uint64_t v15 = 8;
  }
  else
  {
    if (![v10 isEqualToString:EARPhoneticMatchFeedTypeComposersKey])
    {
      id v60 = 0;
      goto LABEL_70;
    }
    id v13 = [sub_100028368() composersQuery];
    int v14 = 0;
    int v70 = 0;
    uint64_t v71 = 0;
    int v69 = 0;
    int v64 = 0;
    int v62 = 1;
    uint64_t v15 = 6;
  }
  [v13 setShouldIncludeNonLibraryEntities:1];
  [v13 setSortItems:1];
  id v16 = [objc_alloc((Class)_EARPhoneticMatchData) initWithFeedType:v15 jsonConfigFile:v9];
  int v17 = [v16 getLimit];
  if (v17 >= 2000) {
    int v18 = 2000;
  }
  else {
    int v18 = v17;
  }
  [v13 setEntityLimit:v18 & ~(v18 >> 31)];
  if ((v14 & 1) == 0)
  {
    if ([v11 isEqualToString:EARPhoneticMatchRankingMethodPlayCount])
    {
      v19 = sub_10002844C();
      v93 = v19;
      v20 = +[NSArray arrayWithObjects:&v93 count:1];
      [v13 _setOrderingProperties:v20];

      v21 = sub_10002844C();
      v91 = v21;
      v92 = &off_10003F280;
      v22 = &v92;
      v23 = &v91;
LABEL_25:
      v26 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v23 count:1];
      [v13 _setOrderingDirectionMappings:v26];

      goto LABEL_26;
    }
    if ([v11 isEqualToString:EARPhoneticMatchRankingMethodMostRecentlyPlayed])
    {
      v24 = sub_1000285B4();
      v90 = v24;
      v25 = +[NSArray arrayWithObjects:&v90 count:1];
      [v13 _setOrderingProperties:v25];

      v21 = sub_1000285B4();
      v88 = v21;
      v89 = &off_10003F280;
      v22 = &v89;
      v23 = &v88;
      goto LABEL_25;
    }
  }
LABEL_26:
  int v63 = v14;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = [v13 collections];
  id v27 = [obj countByEnumeratingWithState:&v75 objects:v87 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v74 = *(void *)v76;
    id v67 = v10;
    id v68 = v9;
    id v65 = v13;
    id v66 = v11;
LABEL_28:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v76 != v74) {
        objc_enumerationMutation(obj);
      }
      v30 = *(void **)(*((void *)&v75 + 1) + 8 * v29);
      if (v12[2](v12))
      {

        id v60 = 0;
        id v10 = v67;
        id v9 = v68;
        id v13 = v65;
        id v11 = v66;
        goto LABEL_69;
      }
      if (![v16 roomForMoreData])
      {
        id v10 = v67;
        id v9 = v68;
        id v13 = v65;
        id v11 = v66;
        break;
      }
      if (v73)
      {
        v32 = [v30 representativeItem];
        v33 = [v32 artist];

        if (v33)
        {
          id v34 = [v30 representativeItem];
          v35 = [v34 artist];
          v86 = v35;
          v36 = &v86;
          goto LABEL_60;
        }
      }
      else if (HIDWORD(v71))
      {
        v37 = [v30 representativeItem];
        v38 = [v37 title];

        if (v38)
        {
          id v34 = [v30 representativeItem];
          v35 = [v34 title];
          v85 = v35;
          v36 = &v85;
          goto LABEL_60;
        }
      }
      else if (v71)
      {
        id v34 = [v30 representativeItem];
        uint64_t v39 = [v34 title];
        if (!v39) {
          goto LABEL_62;
        }
        v40 = (void *)v39;
        v41 = [v30 representativeItem];
        v42 = [v41 artist];

        if (v42)
        {
          id v34 = [v30 representativeItem];
          v35 = [v34 title];
          v84[0] = v35;
          v43 = [v30 representativeItem];
          v44 = [v43 artist];
          v84[1] = v44;
          v45 = v84;
          goto LABEL_50;
        }
      }
      else if (v70)
      {
        v46 = [v30 representativeItem];
        v47 = [v46 albumTitle];

        if (v47)
        {
          id v34 = [v30 representativeItem];
          v35 = [v34 albumTitle];
          v83 = v35;
          v36 = &v83;
          goto LABEL_60;
        }
      }
      else if (v69)
      {
        id v34 = [v30 representativeItem];
        uint64_t v48 = [v34 albumTitle];
        if (!v48) {
          goto LABEL_62;
        }
        v49 = (void *)v48;
        v50 = [v30 representativeItem];
        v51 = [v50 albumArtist];

        if (v51)
        {
          id v34 = [v30 representativeItem];
          v35 = [v34 albumTitle];
          v82[0] = v35;
          v43 = [v30 representativeItem];
          v44 = [v43 albumArtist];
          v82[1] = v44;
          v45 = v82;
LABEL_50:
          v52 = +[NSArray arrayWithObjects:v45 count:2];
          LODWORD(v53) = 1.0;
          [v16 appendData:v52 prior:v53];

LABEL_61:
LABEL_62:
        }
      }
      else
      {
        if (!v64)
        {
          if (v63)
          {
            id v34 = v30;
            v56 = [v34 name];

            if (!v56) {
              goto LABEL_62;
            }
            v35 = [v34 name];
            v80 = v35;
            v36 = &v80;
          }
          else
          {
            if (!v62) {
              goto LABEL_63;
            }
            v57 = [v30 representativeItem];
            v58 = [v57 composer];

            if (!v58) {
              goto LABEL_63;
            }
            id v34 = [v30 representativeItem];
            v35 = [v34 composer];
            v79 = v35;
            v36 = &v79;
          }
LABEL_60:
          v43 = +[NSArray arrayWithObjects:v36 count:1];
          LODWORD(v59) = 1.0;
          [v16 appendData:v43 prior:v59];
          goto LABEL_61;
        }
        v54 = [v30 representativeItem];
        v55 = [v54 podcastTitle];

        if (v55)
        {
          id v34 = [v30 representativeItem];
          v35 = [v34 podcastTitle];
          v81 = v35;
          v36 = &v81;
          goto LABEL_60;
        }
      }
LABEL_63:
      if (v28 == (id)++v29)
      {
        id v28 = [obj countByEnumeratingWithState:&v75 objects:v87 count:16];
        id v10 = v67;
        id v9 = v68;
        id v13 = v65;
        id v11 = v66;
        if (v28) {
          goto LABEL_28;
        }
        break;
      }
    }
  }

  id v60 = v16;
LABEL_69:

LABEL_70:
  return v60;
}

@end