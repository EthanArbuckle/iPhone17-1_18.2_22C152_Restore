@interface WLAGetWatchListPlayables
- (void)performWithCompletion:(id)a3;
@end

@implementation WLAGetWatchListPlayables

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(WLAGetWatchListPlayables *)self statsId];
  NSLog(@"WLAGetWatchListPlayables: Got request for playables for stats ID %@.", v5);
  id v6 = [objc_alloc((Class)WLKCanonicalPlayablesRequest) initWithStatsID:v5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __50__WLAGetWatchListPlayables_performWithCompletion___block_invoke;
  v8[3] = &unk_8328;
  id v9 = v4;
  id v7 = v4;
  [v6 makeRequestWithCompletion:v8];
}

void __50__WLAGetWatchListPlayables_performWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (v5)
  {
    uint64_t v36 = a1;
    NSLog(@"WLAGetWatchListPlayables: Got response: %@", v5);
    id v45 = objc_alloc_init((Class)NSMutableArray);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v37 = v6;
    id obj = [v6 playables];
    id v46 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v46)
    {
      uint64_t v44 = *(void *)v51;
      uint64_t v43 = WLKPlayablePunchoutUrlKeyPlay;
      uint64_t v42 = SFPropertyEntryKeyFormat;
      uint64_t v41 = SFPropertyEntryValueFormatJPEG;
      uint64_t v40 = SFPropertyEntryValueFormatPNG;
      uint64_t v38 = SFPropertyEntryValueFormatLCR;
      do
      {
        for (i = 0; i != v46; i = (char *)i + 1)
        {
          if (*(void *)v51 != v44) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          id v9 = objc_alloc_init((Class)SAWLWatchListPlayable);
          objc_msgSend(v9, "setEntitled:", objc_msgSend(v8, "isEntitled"));
          objc_msgSend(v9, "setInstalled:", objc_msgSend(v8, "isAppInstalled"));
          v10 = [v8 punchoutUrls];
          uint64_t v11 = [v10 objectForKey:v43];

          v49 = (void *)v11;
          v12 = +[NSURL URLWithString:v11];
          [v9 setPlayURL:v12];

          v13 = [v8 channelDetails];
          id v14 = objc_alloc_init((Class)SAWLWatchListChannelDetails);
          v15 = [v13 name];
          [v14 setAppName:v15];

          v16 = [v13 appStoreURL];
          [v14 setAppStoreURL:v16];

          v48 = [v13 images];
          v17 = objc_msgSend(v48, "bestArtworkVariantOfType:forSize:", 10, 1.79769313e308, 1.79769313e308);
          uint64_t v18 = [v17 artworkURLString];
          [v17 artworkSize];
          double v20 = v19;
          double v22 = v21;
          id v23 = objc_alloc_init((Class)SFDynamicURLImageResource);
          [v23 setPixelHeight:v22];
          [v23 setPixelWidth:v20];
          v47 = (void *)v18;
          [v23 setFormatURL:v18];
          [v23 setSupportsResizing:1];
          id v24 = objc_alloc_init((Class)SFImageOption);
          [v24 setName:v42];
          v25 = [v17 format];
          [v24 setDefaultValue:v25];

          id v26 = objc_alloc_init((Class)NSMutableDictionary);
          [v26 setObject:@"jpg" forKey:v41];
          [v26 setObject:@"png" forKey:v40];
          if ([v17 supportsLayeredImage]) {
            [v26 setObject:@"lcr" forKey:v38];
          }
          [v24 setOptions:v26];
          id v54 = v24;
          v27 = +[NSArray arrayWithObjects:&v54 count:1];
          [v23 setImageOptions:v27];

          id v28 = [objc_alloc((Class)_SFPBDynamicURLImageResource) initWithFacade:v23];
          v29 = [v28 data];
          [v14 setAppIconDynamicImage:v29];
          [v9 setChannelDetails:v14];
          [v45 addObject:v9];
        }
        id v46 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v46);
    }

    id v30 = objc_alloc_init((Class)SAWLWatchListPlayableResults);
    [v30 setPlayables:v45];
    uint64_t v31 = *(void *)(v36 + 32);
    if (v31)
    {
      v32 = [v30 dictionary];
      (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v32);
    }
    id v6 = v37;
  }
  else
  {
    NSLog(@"WLAGetWatchListPlayables: Error requesting playables: %@", a3);
    uint64_t v33 = *(void *)(a1 + 32);
    if (v33)
    {
      id v34 = objc_alloc_init((Class)SACommandFailed);
      v35 = [v34 dictionary];
      (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v35);
    }
  }
}

@end