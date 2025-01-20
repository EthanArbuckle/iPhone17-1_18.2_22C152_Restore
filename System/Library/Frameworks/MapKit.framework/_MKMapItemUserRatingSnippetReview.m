@interface _MKMapItemUserRatingSnippetReview
- (GEOMapItemReview)_geoReview;
- (GEOMapItemTip)_geoMapItemTIp;
- (NSDate)_date;
- (NSString)_localizedSnippet;
- (NSString)_localizedSnippetLocale;
- (NSString)_reviewerName;
- (NSURL)_reviewerImageURL;
- (_MKMapItemUserRatingSnippetReview)initWithMapItem:(id)a3 review:(id)a4;
- (double)_maxScore;
- (double)_normalizedScore;
- (double)_score;
- (void)showWithCompletionHandler:(id)a3;
@end

@implementation _MKMapItemUserRatingSnippetReview

- (_MKMapItemUserRatingSnippetReview)initWithMapItem:(id)a3 review:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_MKMapItemUserRatingSnippetReview;
  v9 = [(_MKMapItemUserRatingSnippetReview *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapItem, a3);
    objc_storeStrong((id *)&v10->_review, a4);
    v11 = v10;
  }

  return v10;
}

- (double)_score
{
  [(GEOMapItemReview *)self->_review _score];
  return result;
}

- (double)_maxScore
{
  [(GEOMapItemReview *)self->_review _maxScore];
  return result;
}

- (double)_normalizedScore
{
  [(GEOMapItemReview *)self->_review _normalizedScore];
  return result;
}

- (NSString)_localizedSnippet
{
  return (NSString *)[(GEOMapItemReview *)self->_review _localizedSnippet];
}

- (NSString)_localizedSnippetLocale
{
  return (NSString *)[(GEOMapItemReview *)self->_review _localizedSnippetLocale];
}

- (NSDate)_date
{
  return (NSDate *)[(GEOMapItemReview *)self->_review _date];
}

- (NSString)_reviewerName
{
  return (NSString *)[(GEOMapItemReview *)self->_review _reviewerName];
}

- (NSURL)_reviewerImageURL
{
  v2 = [(GEOMapItemReview *)self->_review _reviewerImageURLString];
  if ([v2 length])
  {
    v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (GEOMapItemReview)_geoReview
{
  return self->_review;
}

- (GEOMapItemTip)_geoMapItemTIp
{
  return 0;
}

- (void)showWithCompletionHandler:(id)a3
{
  id v5 = [(MKMapItem *)self->_mapItem _reviewsAttribution];
  v4 = [v5 urlsForReview:self];
  if ([v4 count]) {
    +[MKAppLaunchController launchAttributionURLs:v4 withAttribution:v5 completionHandler:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_review, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end