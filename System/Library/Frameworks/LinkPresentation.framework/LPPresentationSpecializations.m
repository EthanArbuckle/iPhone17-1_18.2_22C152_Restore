@interface LPPresentationSpecializations
+ (BOOL)isAppStoreStoryURL:(id)a3;
+ (BOOL)isAppleBookSeriesURL:(id)a3;
+ (BOOL)isAppleFitnessURL:(id)a3;
+ (BOOL)isAppleHealthURL:(id)a3;
+ (BOOL)isAppleMapsCollectionURL:(id)a3;
+ (BOOL)isAppleMapsURL:(id)a3;
+ (BOOL)isAppleMusicClassicalURL:(id)a3;
+ (BOOL)isAppleNewsURL:(id)a3;
+ (BOOL)isApplePhotosSharedLibraryInvitationURL:(id)a3;
+ (BOOL)isAppleTVURL:(id)a3;
+ (BOOL)isArticle:(id)a3;
+ (BOOL)isArticleWithActivityPub:(id)a3;
+ (BOOL)isFacebookURL:(id)a3;
+ (BOOL)isGoogleMapsURL:(id)a3;
+ (BOOL)isGoogleSearchURL:(id)a3;
+ (BOOL)isGoogleURL:(id)a3;
+ (BOOL)isInstagramURL:(id)a3;
+ (BOOL)isKnownBlankImageURL:(id)a3;
+ (BOOL)isMicroblogPost:(id)a3;
+ (BOOL)isMuninURL:(id)a3;
+ (BOOL)isRedditStaticImage:(id)a3;
+ (BOOL)isRedditURL:(id)a3;
+ (BOOL)isSharedPasswordsInviteURL:(id)a3;
+ (BOOL)isSinaWeiboURL:(id)a3;
+ (BOOL)isStockSymbolURL:(id)a3;
+ (BOOL)isStocksNewsURL:(id)a3;
+ (BOOL)isTikTokURL:(id)a3;
+ (BOOL)isTweetURL:(id)a3;
+ (BOOL)isTwitterProfileImageURL:(id)a3;
+ (BOOL)isTwitterShortenerURL:(id)a3;
+ (BOOL)isTwitterSummaryCardMetadata:(id)a3;
+ (BOOL)isTwitterSummaryLargeImageCardMetadata:(id)a3;
+ (BOOL)isWebexSiteURL:(id)a3;
+ (BOOL)isWikipediaURL:(id)a3;
+ (BOOL)isYouTubeEmbedURL:(id)a3;
+ (BOOL)isYouTubeURL:(id)a3;
+ (BOOL)isiCloudPhotoShareURL:(id)a3;
+ (BOOL)isiCloudSharingURL:(id)a3;
+ (BOOL)isiCloudURL:(id)a3;
+ (BOOL)isiTunesStoreOrAdjacentURL:(id)a3;
+ (BOOL)isiTunesStoreURLThatUsesWebMetadata:(id)a3;
+ (BOOL)shouldAllowHoistingContentImagesForURL:(id)a3;
+ (BOOL)shouldAllowMultipleImagesForURL:(id)a3;
+ (BOOL)shouldLoadInsteadOfUsingExistingWebViewForURL:(id)a3;
+ (id)URLToOpenForURL:(id)a3;
+ (id)articleTitleFromTitle:(id)a3 withURL:(id)a4;
+ (id)businessChatURLToOpenForURL:(id)a3;
+ (id)canonicalMetadataURLForURL:(id)a3;
+ (id)destinationForGoogleRedirectURL:(id)a3;
+ (id)nonDirectURLForImgurURL:(id)a3;
+ (id)nonMobileRedditURLForRedditURL:(id)a3;
+ (id)nonMobileTweetURLForTweetURL:(id)a3;
+ (id)nonMobileYouTubeURLForURL:(id)a3;
+ (id)searchQueryForURL:(id)a3;
+ (id)userAgentForURL:(id)a3;
+ (id)youTubeVideoComponentsForEmbedURL:(id)a3;
+ (id)youTubeVideoComponentsForVideoURL:(id)a3;
+ (id)youTubeVideoURLForEmbedURL:(id)a3;
@end

@implementation LPPresentationSpecializations

+ (BOOL)isGoogleURL:(id)a3
{
  id v3 = a3;
  v4 = googleSuffixChecker();
  v5 = [v3 host];
  char v6 = [v4 hasSuffix:v5];

  return v6;
}

+ (BOOL)isGoogleSearchURL:(id)a3
{
  id v3 = a3;
  v4 = googleSuffixChecker();
  v5 = [v3 host];
  id v12 = 0;
  char v6 = [v4 hasSuffix:v5 remainingPrefix:&v12];
  id v7 = v12;

  if ((v6 & 1) != 0
    && (![v7 length] || objc_msgSend(v7, "_lp_isEqualIgnoringCase:", @"www.")))
  {
    v8 = [v3 pathComponents];
    if ((unint64_t)[v8 count] < 2)
    {
      char v10 = 1;
    }
    else
    {
      v9 = objc_msgSend(v3, "_lp_pathComponentAtIndex:", 1);
      char v10 = objc_msgSend(v9, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712A50);
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (BOOL)isGoogleMapsURL:(id)a3
{
  id v3 = a3;
  v4 = googleSuffixChecker();
  v5 = [v3 host];
  id v12 = 0;
  char v6 = [v4 hasSuffix:v5 remainingPrefix:&v12];
  id v7 = v12;

  if (v6)
  {
    if (objc_msgSend(v7, "_lp_isEqualIgnoringCase:", @"maps."))
    {
      char v8 = 1;
    }
    else
    {
      v9 = [v3 pathComponents];
      if ((unint64_t)[v9 count] < 2)
      {
        char v8 = 0;
      }
      else
      {
        char v10 = objc_msgSend(v3, "_lp_pathComponentAtIndex:", 1);
        char v8 = objc_msgSend(v10, "_lp_isEqualIgnoringCase:", @"maps");
      }
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (id)searchQueryForURL:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v13 = 0;
    goto LABEL_26;
  }
  char v6 = [v4 host];
  if ([a1 isGoogleSearchURL:v5])
  {
    id v7 = v5;
    char v8 = objc_msgSend(v7, "_lp_valueForQueryKey:", @"q");
    if (!v8)
    {
      v9 = objc_msgSend(v7, "_lp_components");
      char v10 = [v9 fragment];
      [v9 setQuery:v10];

      v11 = [v9 URL];
      char v8 = objc_msgSend(v11, "_lp_valueForQueryKey:", @"q");
    }
    uint64_t v12 = [v8 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    goto LABEL_22;
  }
  if (yahooSuffixChecker_onceToken != -1) {
    dispatch_once(&yahooSuffixChecker_onceToken, &__block_literal_global_481);
  }
  if ([(id)yahooSuffixChecker_checker hasSuffix:v6])
  {
    id v14 = v5;
    v15 = objc_msgSend(v14, "_lp_pathComponentAtIndex:", 1);
    char v16 = objc_msgSend(v15, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712A98);

    if ((v16 & 1) == 0)
    {
      char v8 = [v14 pathComponents];
      if ((unint64_t)[v8 count] < 2)
      {
        v13 = 0;
        goto LABEL_23;
      }
      v24 = [v8 objectAtIndexedSubscript:1];
      char v25 = objc_msgSend(v24, "_lp_hasCaseInsensitivePrefix:", @"search;");

      if ((v25 & 1) == 0)
      {
LABEL_31:
        v13 = 0;
        goto LABEL_24;
      }
    }
    char v8 = objc_msgSend(v14, "_lp_valueForQueryKey:", @"p");
    uint64_t v12 = [v8 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
LABEL_22:
    v13 = (void *)v12;
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  if (yandexSuffixChecker_onceToken != -1) {
    dispatch_once(&yandexSuffixChecker_onceToken, &__block_literal_global_504);
  }
  if ([(id)yandexSuffixChecker_checker hasSuffix:v6])
  {
    id v17 = v5;
    v18 = objc_msgSend(v17, "_lp_pathComponentAtIndex:", 1);
    char v19 = objc_msgSend(v18, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712AC8);

    if ((v19 & 1) == 0) {
      goto LABEL_31;
    }
    char v8 = objc_msgSend(v17, "_lp_valueForQueryKey:", @"text");
    uint64_t v12 = [v8 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    goto LABEL_22;
  }
  if (bingSuffixChecker_onceToken != -1) {
    dispatch_once(&bingSuffixChecker_onceToken, &__block_literal_global_539);
  }
  if ([(id)bingSuffixChecker_checker hasSuffix:v6])
  {
    id v20 = v5;
    v21 = objc_msgSend(v20, "_lp_pathComponentAtIndex:", 1);
    char v22 = objc_msgSend(v21, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712AF8);

    if ((v22 & 1) == 0) {
      goto LABEL_31;
    }
    char v8 = objc_msgSend(v20, "_lp_valueForQueryKey:", @"q");
    uint64_t v12 = [v8 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    goto LABEL_22;
  }
  if (duckDuckGoSuffixChecker_onceToken != -1) {
    dispatch_once(&duckDuckGoSuffixChecker_onceToken, &__block_literal_global_556);
  }
  if ([(id)duckDuckGoSuffixChecker_checker hasSuffix:v6])
  {
    uint64_t v26 = searchQueryForDuckDuckGoURL(v5);
  }
  else
  {
    v27 = baiduSuffixChecker();
    int v28 = [v27 hasSuffix:v6];

    if (!v28)
    {
      v13 = 0;
      goto LABEL_25;
    }
    uint64_t v26 = searchQueryForBaiduURL(v5);
  }
  v13 = (void *)v26;
LABEL_25:

LABEL_26:

  return v13;
}

+ (BOOL)isArticleWithActivityPub:(id)a3
{
  id v4 = a3;
  if ([a1 isArticle:v4]) {
    char v5 = [v4 usesActivityPub];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isMicroblogPost:(id)a3
{
  id v4 = a3;
  if (([a1 isTwitterSummaryCardMetadata:v4] & 1) != 0
    || [a1 isTwitterSummaryLargeImageCardMetadata:v4])
  {
    char v5 = [a1 isArticleWithActivityPub:v4];
  }
  else
  {
    char v5 = 0;
  }
  char v6 = [v4 URL];
  if ([a1 isTweetURL:v6]) {
    goto LABEL_8;
  }
  id v7 = [v4 URL];
  if ([a1 isSinaWeiboURL:v7])
  {

LABEL_8:
    goto LABEL_9;
  }
  uint64_t v12 = [v4 URL];
  char v13 = [a1 isTikTokURL:v12] | v5;

  if ((v13 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  char v8 = [v4 summary];
  if (v8)
  {
    v9 = [v4 summary];
    unint64_t v10 = [v9 length];

    if (v10 >= 3)
    {
      char v8 = [v4 selectedText];
      uint64_t v11 = [v8 length];

      LOBYTE(v8) = v11 == 0;
      goto LABEL_14;
    }
LABEL_13:
    LOBYTE(v8) = 0;
  }
LABEL_14:

  return (char)v8;
}

+ (BOOL)isTweetURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];
  char v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712B70);

  if (v5)
  {
    char v6 = objc_msgSend(v3, "_lp_pathComponentAtIndex:", 2);
    char v7 = objc_msgSend(v6, "_lp_isEqualIgnoringCase:", @"status");
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isSinaWeiboURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];
  char v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712B88);

  if (v5)
  {
    char v6 = [v3 pathComponents];
    if ([v6 count] == 3)
    {
      char v7 = [v6 objectAtIndexedSubscript:1];
      char v8 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
      v9 = [v8 invertedSet];
      BOOL v10 = [v7 rangeOfCharacterFromSet:v9] == 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)isTwitterProfileImageURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];
  char v5 = objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"pbs.twimg.com");

  if (v5)
  {
    char v6 = [v3 pathComponents];
    if ((unint64_t)[v6 count] >= 3)
    {
      char v8 = objc_msgSend(v3, "_lp_pathComponentAtIndex:", 1);
      char v7 = objc_msgSend(v8, "_lp_isEqualIgnoringCase:", @"profile_images");
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isTwitterSummaryCardMetadata:(id)a3
{
  id v3 = [a3 twitterCard];
  char v4 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", @"summary");

  return v4;
}

+ (BOOL)isTwitterSummaryLargeImageCardMetadata:(id)a3
{
  id v3 = [a3 twitterCard];
  char v4 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", @"summary_large_image");

  return v4;
}

+ (BOOL)isArticle:(id)a3
{
  id v3 = [a3 itemType];
  char v4 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", @"article");

  return v4;
}

+ (BOOL)isRedditURL:(id)a3
{
  id v3 = a3;
  char v4 = [v3 host];
  if (objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"reddit.com"))
  {
    char v5 = 1;
  }
  else
  {
    char v6 = [v3 host];
    char v5 = objc_msgSend(v6, "_lp_hasCaseInsensitiveSuffix:", @".reddit.com");
  }
  return v5;
}

+ (BOOL)isRedditStaticImage:(id)a3
{
  id v3 = [a3 host];
  char v4 = objc_msgSend(v3, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712BA0);

  return v4;
}

+ (BOOL)isTwitterShortenerURL:(id)a3
{
  id v3 = [a3 host];
  char v4 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", @"t.co");

  return v4;
}

+ (BOOL)isTikTokURL:(id)a3
{
  id v3 = a3;
  char v4 = [v3 host];
  if (objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"tiktok.com"))
  {
    char v5 = 1;
  }
  else
  {
    char v6 = [v3 host];
    char v5 = objc_msgSend(v6, "_lp_hasCaseInsensitiveSuffix:", @".tiktok.com");
  }
  return v5;
}

+ (BOOL)isInstagramURL:(id)a3
{
  id v3 = a3;
  char v4 = [v3 host];
  if (objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"instagram.com"))
  {
    char v5 = 1;
  }
  else
  {
    char v6 = [v3 host];
    char v5 = objc_msgSend(v6, "_lp_hasCaseInsensitiveSuffix:", @".instagram.com");
  }
  return v5;
}

+ (BOOL)isFacebookURL:(id)a3
{
  id v3 = a3;
  char v4 = [v3 host];
  if (objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"facebook.com"))
  {
    char v5 = 1;
  }
  else
  {
    char v6 = [v3 host];
    char v5 = objc_msgSend(v6, "_lp_hasCaseInsensitiveSuffix:", @".facebook.com");
  }
  return v5;
}

+ (BOOL)isMuninURL:(id)a3
{
  id v3 = a3;
  char v4 = [v3 host];
  char v5 = objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"maps.apple.com");

  if (v5)
  {
    char v6 = objc_msgSend(v3, "_lp_components");
    char v7 = [v6 queryItems];

    if (v7 && [v7 indexOfObjectPassingTest:&__block_literal_global_23] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = 0;
      v15 = &v14;
      uint64_t v16 = 0x2050000000;
      v9 = (void *)getGEOResourceManifestManagerClass_softClass;
      uint64_t v17 = getGEOResourceManifestManagerClass_softClass;
      if (!getGEOResourceManifestManagerClass_softClass)
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __getGEOResourceManifestManagerClass_block_invoke;
        v13[3] = &unk_1E5B04EB8;
        v13[4] = &v14;
        __getGEOResourceManifestManagerClass_block_invoke((uint64_t)v13);
        v9 = (void *)v15[3];
      }
      id v10 = v9;
      _Block_object_dispose(&v14, 8);
      uint64_t v11 = [v10 modernManager];
      char v8 = [v11 isMuninEnabled];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

uint64_t __44__LPPresentationSpecializations_isMuninURL___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  uint64_t v3 = objc_msgSend(v2, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712BB8);

  return v3;
}

+ (id)nonMobileTweetURLForTweetURL:(id)a3
{
  id v4 = a3;
  char v5 = [v4 host];
  char v6 = objc_msgSend(v5, "_lp_isEqualIgnoringCase:", @"mobile.twitter.com");

  if ((v6 & 1) != 0 && [a1 isTweetURL:v4])
  {
    char v7 = objc_msgSend(v4, "_lp_components");
    [v7 setHost:@"twitter.com"];
    char v8 = [v7 URL];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (id)nonMobileRedditURLForRedditURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];
  char v5 = objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"m.reddit.com");

  if (v5)
  {
    char v6 = objc_msgSend(v3, "_lp_components");
    [v6 setHost:@"reddit.com"];
    char v7 = [v6 URL];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)youTubeVideoComponentsForVideoURL:(id)a3
{
  id v4 = a3;
  if ([a1 isYouTubeURL:v4])
  {
    char v5 = objc_alloc_init(LPYouTubeURLComponents);
    char v6 = objc_msgSend(v4, "_lp_valueForQueryKey:", @"v");
    [(LPYouTubeURLComponents *)v5 setVideoID:v6];

    double v10 = 0.0;
    char v7 = objc_msgSend(v4, "_lp_valueForQueryKey:", @"t");
    BOOL v8 = +[LPYouTubeURLComponents parseYouTubeTimeFormat:v7 outTime:&v10];

    if (v8) {
      [(LPYouTubeURLComponents *)v5 setStartTime:v10];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)youTubeVideoComponentsForEmbedURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];
  char v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712BD0);

  if (v5)
  {
    char v6 = [v3 pathComponents];
    if ((unint64_t)[v6 count] >= 3
      && (objc_msgSend(v3, "_lp_pathComponentAtIndex:", 1),
          char v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = objc_msgSend(v7, "_lp_isEqualIgnoringCase:", @"embed"),
          v7,
          (v8 & 1) != 0))
    {
      v9 = objc_alloc_init(LPYouTubeURLComponents);
      double v10 = [v6 objectAtIndexedSubscript:2];
      [(LPYouTubeURLComponents *)v9 setVideoID:v10];

      uint64_t v11 = objc_msgSend(v3, "_lp_valueForQueryKey:", @"start");
      -[LPYouTubeURLComponents setStartTime:](v9, "setStartTime:", (double)[v11 integerValue]);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)isYouTubeEmbedURL:(id)a3
{
  id v3 = [a1 youTubeVideoComponentsForEmbedURL:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (BOOL)isYouTubeURL:(id)a3
{
  id v3 = [a3 host];
  char v4 = objc_msgSend(v3, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712BE8);

  return v4;
}

+ (BOOL)isAppleTVURL:(id)a3
{
  id v3 = [a3 host];
  char v4 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", @"tv.apple.com");

  return v4;
}

+ (BOOL)isAppleNewsURL:(id)a3
{
  id v3 = [a3 host];
  char v4 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", @"apple.news");

  return v4;
}

+ (BOOL)isiCloudSharingURL:(id)a3
{
  id v3 = a3;
  if (+[LPPresentationSpecializations isiCloudURL:v3])
  {
    char v4 = [v3 pathComponents];
    if ((unint64_t)[v4 count] >= 2)
    {
      char v6 = [v4 objectAtIndexedSubscript:1];
      char v5 = objc_msgSend(v6, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712C00);
    }
    else
    {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isiCloudURL:(id)a3
{
  id v3 = [a3 host];
  char v4 = objc_msgSend(v3, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712C18);

  return v4;
}

+ (BOOL)isiCloudPhotoShareURL:(id)a3
{
  id v3 = a3;
  if ((objc_msgSend(v3, "_lp_isHTTPFamilyURL") & 1) != 0
    && ([v3 host],
        char v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isEqualToString:@"share.icloud.com"],
        v4,
        (v5 & 1) != 0))
  {
    char v6 = [v3 pathComponents];
    if ((unint64_t)[v6 count] >= 2)
    {
      char v8 = [v6 objectAtIndexedSubscript:1];
      char v7 = objc_msgSend(v8, "_lp_isEqualIgnoringCase:", @"photos");
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isApplePhotosSharedLibraryInvitationURL:(id)a3
{
  id v3 = a3;
  if ((objc_msgSend(v3, "_lp_isHTTPFamilyURL") & 1) != 0
    && ([v3 host],
        char v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712C30),
        v4,
        (v5 & 1) != 0))
  {
    char v6 = [v3 pathComponents];
    if ((unint64_t)[v6 count] >= 2)
    {
      char v8 = [v6 objectAtIndexedSubscript:1];
      char v7 = objc_msgSend(v8, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712C48);
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isSharedPasswordsInviteURL:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() isiCloudURL:v3])
  {
    char v4 = objc_msgSend(v3, "_lp_pathComponentAtIndex:", 1);
    char v5 = [v4 isEqualToString:@"unavailable_shared_passwords"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isStockSymbolURL:(id)a3
{
  id v3 = a3;
  char v4 = [v3 host];
  char v5 = objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"stocks.apple.com");

  if ((v5 & 1) != 0
    && ([v3 pathComponents],
        char v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 count],
        v6,
        v7 >= 3))
  {
    v9 = objc_msgSend(v3, "_lp_pathComponentAtIndex:", 1);
    char v8 = objc_msgSend(v9, "_lp_isEqualIgnoringCase:", @"symbol");
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)isStocksNewsURL:(id)a3
{
  id v4 = a3;
  char v5 = [v4 host];
  if (objc_msgSend(v5, "_lp_isEqualIgnoringCase:", @"stocks.apple.com")) {
    int v6 = [a1 isStockSymbolURL:v4] ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)isiTunesStoreOrAdjacentURL:(id)a3
{
  id v3 = [a3 host];
  char v4 = objc_msgSend(v3, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712C60);

  return v4;
}

+ (BOOL)isAppleBookSeriesURL:(id)a3
{
  id v3 = a3;
  char v4 = [v3 host];
  char v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712C78);

  if (v5)
  {
    int v6 = [v3 pathComponents];
    if ((unint64_t)[v6 count] >= 3)
    {
      char v8 = objc_msgSend(v3, "_lp_pathComponentAtIndex:", 2);
      if (objc_msgSend(v8, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712C90))
      {
        char v7 = 1;
      }
      else
      {
        v9 = objc_msgSend(v3, "_lp_pathComponentAtIndex:", 1);
        char v7 = objc_msgSend(v9, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712C90);
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isAppleMusicClassicalURL:(id)a3
{
  id v3 = [a3 host];
  char v4 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", @"classical.music.apple.com");

  return v4;
}

+ (BOOL)isAppStoreStoryURL:(id)a3
{
  id v3 = a3;
  char v4 = [v3 host];
  char v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712CA8);

  if (v5)
  {
    int v6 = [v3 pathComponents];
    if ((unint64_t)[v6 count] >= 3)
    {
      char v8 = objc_msgSend(v3, "_lp_pathComponentAtIndex:", 2);
      if (objc_msgSend(v8, "_lp_isEqualIgnoringCase:", @"story"))
      {
        char v7 = 1;
      }
      else
      {
        v9 = objc_msgSend(v3, "_lp_pathComponentAtIndex:", 1);
        char v7 = objc_msgSend(v9, "_lp_isEqualIgnoringCase:", @"story");
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isiTunesStoreURLThatUsesWebMetadata:(id)a3
{
  id v4 = a3;
  if ([a1 isAppStoreStoryURL:v4] & 1) != 0 || (objc_msgSend(a1, "isAppleTVURL:", v4)) {
    char v5 = 1;
  }
  else {
    char v5 = [a1 isAppleBookSeriesURL:v4];
  }

  return v5;
}

+ (BOOL)isAppleMapsURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 scheme];
  char v5 = objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"maps");

  if (v5)
  {
    char v6 = 1;
  }
  else if (objc_msgSend(v3, "_lp_isHTTPFamilyURL"))
  {
    char v7 = [v3 host];
    char v6 = objc_msgSend(v7, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712CC0);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)isAppleFitnessURL:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "_lp_isHTTPFamilyURL"))
  {
    id v4 = [v3 host];
    char v5 = objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"fitness.apple.com");
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isAppleMapsCollectionURL:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "_lp_isHTTPFamilyURL"))
  {
    id v4 = [v3 host];
    char v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712CD8);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isAppleHealthURL:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "_lp_isHTTPFamilyURL"))
  {
    id v4 = [v3 host];
    char v5 = objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"health.apple.com");
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isWikipediaURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];
  if (objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"wikipedia.org"))
  {
    char v5 = 1;
  }
  else
  {
    char v6 = [v3 host];
    char v5 = objc_msgSend(v6, "_lp_hasCaseInsensitiveSuffix:", @".wikipedia.org");
  }
  return v5;
}

+ (BOOL)isWebexSiteURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];
  char v5 = objc_msgSend(v4, "_lp_hasCaseInsensitiveSuffix:", @".webex.com");

  if ((v5 & 1) == 0) {
    goto LABEL_5;
  }
  char v6 = [v3 host];
  if (objc_msgSend(v6, "_lp_isEqualIgnoringCase:", @"www.webex.com")) {
    goto LABEL_3;
  }
  char v7 = [v3 host];
  char v8 = objc_msgSend(v7, "_lp_hasCaseInsensitiveSuffix:", @".www.webex.com");

  if (v8) {
    goto LABEL_5;
  }
  char v6 = [v3 host];
  if (objc_msgSend(v6, "_lp_isEqualIgnoringCase:", @"help.webex.com"))
  {
LABEL_3:
  }
  else
  {
    uint64_t v11 = [v3 host];
    int v12 = objc_msgSend(v11, "_lp_hasCaseInsensitiveSuffix:", @".help.webex.com");

    if (!v12)
    {
      BOOL v9 = 1;
      goto LABEL_6;
    }
  }
LABEL_5:
  BOOL v9 = 0;
LABEL_6:

  return v9;
}

+ (id)nonMobileYouTubeURLForURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];
  char v5 = objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"m.youtube.com");

  if (v5)
  {
    char v6 = objc_msgSend(v3, "_lp_components");
    [v6 setHost:@"youtube.com"];
    char v7 = [v6 fragment];
    int v8 = [v7 hasPrefix:@"/"];

    if (v8)
    {
      BOOL v9 = [v6 fragment];
      uint64_t v10 = [v9 rangeOfString:@"?"];
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v11 = [v9 substringToIndex:v10];
        [v6 setPath:v11];

        if ([v9 length] > (unint64_t)(v10 + 1))
        {
          int v12 = objc_msgSend(v9, "substringFromIndex:");
          [v6 setQuery:v12];
        }
        [v6 setFragment:0];
      }
    }
    char v13 = [v6 URL];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

+ (id)youTubeVideoURLForEmbedURL:(id)a3
{
  id v4 = a3;
  char v5 = [a1 youTubeVideoComponentsForEmbedURL:v4];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F29088]);
    char v7 = [v4 scheme];
    [v6 setScheme:v7];

    [v6 setHost:@"youtube.com"];
    [v6 setPath:@"/watch"];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v9 = objc_alloc(MEMORY[0x1E4F290C8]);
    uint64_t v10 = [v5 videoID];
    uint64_t v11 = (void *)[v9 initWithName:@"v" value:v10];
    [v8 addObject:v11];

    [v5 startTime];
    if (v12 != 0.0)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F290C8]);
      [v5 startTime];
      uint64_t v14 = +[LPYouTubeURLComponents formatAsYouTubeTime:](LPYouTubeURLComponents, "formatAsYouTubeTime:");
      v15 = (void *)[v13 initWithName:@"t" value:v14];
      [v8 addObject:v15];
    }
    [v6 setQueryItems:v8];
    uint64_t v16 = [v6 URL];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)nonDirectURLForImgurURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];
  char v5 = objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"i.imgur.com");

  if (v5)
  {
    id v6 = objc_msgSend(v3, "_lp_components");
    [v6 setHost:@"imgur.com"];
    char v7 = [v6 path];
    id v8 = [v7 stringByDeletingPathExtension];
    [v6 setPath:v8];

    id v9 = [v6 URL];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)destinationForGoogleRedirectURL:(id)a3
{
  id v4 = a3;
  if (([a1 isGoogleURL:v4] & 1) != 0
    && (objc_msgSend(v4, "_lp_pathComponentAtIndex:", 1),
        char v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_msgSend(v5, "_lp_isEqualIgnoringCase:", @"url"),
        v5,
        (v6 & 1) != 0))
  {
    char v7 = objc_msgSend(v4, "_lp_valueForQueryKey:", @"url");
    if (v7)
    {
      id v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)canonicalMetadataURLForURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [a1 nonMobileTweetURLForTweetURL:v4];
    if (!v5)
    {
      id v5 = [a1 nonMobileRedditURLForRedditURL:v4];
      if (!v5)
      {
        id v5 = [a1 nonDirectURLForImgurURL:v4];
        if (!v5)
        {
          id v5 = [a1 nonMobileYouTubeURLForURL:v4];
          if (!v5)
          {
            id v5 = [a1 youTubeVideoURLForEmbedURL:v4];
            if (!v5)
            {
              id v5 = [a1 destinationForGoogleRedirectURL:v4];
              if (!v5) {
                id v5 = v4;
              }
            }
          }
        }
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldLoadInsteadOfUsingExistingWebViewForURL:(id)a3
{
  id v4 = a3;
  if (([a1 isYouTubeURL:v4] & 1) != 0
    || ([a1 isTweetURL:v4] & 1) != 0
    || ([a1 isTikTokURL:v4] & 1) != 0
    || ([a1 isGoogleMapsURL:v4] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    char v7 = [a1 canonicalMetadataURLForURL:v4];
    id v8 = v7;
    BOOL v5 = v7 && ([v7 isEqual:v4] & 1) == 0;
  }
  return v5;
}

+ (BOOL)shouldAllowMultipleImagesForURL:(id)a3
{
  return [a1 isWikipediaURL:a3] ^ 1;
}

+ (BOOL)shouldAllowHoistingContentImagesForURL:(id)a3
{
  id v4 = a3;
  if ([a1 isRedditURL:v4]) {
    LOBYTE(v5) = 0;
  }
  else {
    int v5 = [a1 isFacebookURL:v4] ^ 1;
  }

  return v5;
}

+ (BOOL)isKnownBlankImageURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];
  if (objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"s0.wp.com"))
  {
    int v5 = [v3 path];
    char v6 = objc_msgSend(v5, "_lp_isEqualIgnoringCase:", @"/i/blank.jpg");
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (id)userAgentForURL:(id)a3
{
  id v4 = a3;
  if ([a1 isTwitterShortenerURL:v4])
  {
    int v5 = @"curl/7.54.0";
  }
  else if ([a1 isTikTokURL:v4])
  {
    int v5 = @"facebookexternalhit/1.1";
  }
  else if ([a1 isInstagramURL:v4])
  {
    int v5 = @"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.4";
  }
  else
  {
    int v5 = +[LPMetadataProvider _defaultUserAgent];
  }

  return v5;
}

+ (id)articleTitleFromTitle:(id)a3 withURL:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v5 = a4;
  v35 = v5;
  char v6 = objc_msgSend(v5, "_lp_highLevelDomain");
  char v7 = v6;
  if (!v6)
  {
    char v7 = objc_msgSend(v5, "_lp_simplifiedStringForDisplayOnly:", 0);
  }
  v38 = [v7 lowercaseString];
  if (!v6) {

  }
  v36 = objc_msgSend(v38, "_lp_hostByStrippingTopLevelDomain");
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v8 = 0;
  uint64_t v9 = [&unk_1EF712CF0 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v9) {
    goto LABEL_31;
  }
  uint64_t v10 = *(void *)v40;
  float v11 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v40 != v10) {
        objc_enumerationMutation(&unk_1EF712CF0);
      }
      id v13 = [v37 componentsSeparatedByString:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      if ([v13 count] == 2)
      {
        uint64_t v14 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        v15 = [v13 objectAtIndexedSubscript:0];
        uint64_t v16 = [v15 stringByTrimmingCharactersInSet:v14];

        uint64_t v17 = [v13 objectAtIndexedSubscript:1];
        v18 = [v17 stringByTrimmingCharactersInSet:v14];

        char v19 = [v16 lowercaseString];
        id v20 = [v18 lowercaseString];
        objc_msgSend(v19, "_lp_similarityToString:", v38);
        float v22 = v21;
        objc_msgSend(v19, "_lp_similarityToString:", v36);
        if (v22 >= v23) {
          float v24 = v22;
        }
        else {
          float v24 = v23;
        }
        objc_msgSend(v20, "_lp_similarityToString:", v38);
        float v26 = v25;
        objc_msgSend(v20, "_lp_similarityToString:", v36);
        if (v26 >= v27) {
          float v27 = v26;
        }
        if (v24 >= v27) {
          float v28 = v24;
        }
        else {
          float v28 = v27;
        }
        if (v28 <= v11)
        {
          float v28 = v11;
        }
        else
        {
          if (v24 <= v27) {
            v29 = v16;
          }
          else {
            v29 = v18;
          }
          id v30 = v29;
          v31 = v8;
          id v8 = v30;
        }
        float v11 = v28;
      }
    }
    uint64_t v9 = [&unk_1EF712CF0 countByEnumeratingWithState:&v39 objects:v43 count:16];
  }
  while (v9);
  if (v8 && v11 >= 0.6)
  {
    objc_msgSend(v8, "_lp_stringByTrimmingWhitespace");
    id v32 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_31:
    id v32 = v37;
  }
  v33 = v32;

  return v33;
}

+ (id)businessChatURLToOpenForURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 pathComponents];
  if ((unint64_t)[v4 count] >= 2)
  {
    char v6 = objc_msgSend(v3, "_lp_components");
    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v8 = [MEMORY[0x1E4F29088] componentsWithString:@"sms://open"];
      uint64_t v9 = [MEMORY[0x1E4F290C8] queryItemWithName:@"service" value:@"iMessage"];
      [v7 addObject:v9];
      uint64_t v10 = [v4 objectAtIndexedSubscript:1];
      float v11 = [MEMORY[0x1E4F290C8] queryItemWithName:@"recipient" value:v10];
      [v7 addObject:v11];
      double v12 = [v6 queryItems];
      [v7 addObjectsFromArray:v12];

      [v8 setQueryItems:v7];
      id v5 = [v8 URL];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)URLToOpenForURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 host];
  int v6 = objc_msgSend(v5, "_lp_isEqualIgnoringCase:", @"bcrw.apple.com");

  id v7 = v4;
  if (v6)
  {
    uint64_t v8 = [a1 businessChatURLToOpenForURL:v4];
    uint64_t v9 = (void *)v8;
    if (v8) {
      uint64_t v10 = (void *)v8;
    }
    else {
      uint64_t v10 = v4;
    }
    id v7 = v10;
  }
  float v11 = urlByRemovingTrackingInformation(v7);

  return v11;
}

@end