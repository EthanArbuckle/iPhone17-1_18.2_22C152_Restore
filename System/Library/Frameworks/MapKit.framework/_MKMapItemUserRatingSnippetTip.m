@interface _MKMapItemUserRatingSnippetTip
- (GEOMapItemReview)_geoReview;
- (GEOMapItemTip)_geoMapItemTIp;
- (NSDate)_date;
- (NSString)_localizedSnippet;
- (NSString)_localizedSnippetLocale;
- (NSString)_reviewerName;
- (NSURL)_reviewerImageURL;
- (_MKMapItemUserRatingSnippetTip)initWithMapItem:(id)a3 review:(id)a4;
- (double)_maxScore;
- (double)_normalizedScore;
- (double)_score;
@end

@implementation _MKMapItemUserRatingSnippetTip

- (_MKMapItemUserRatingSnippetTip)initWithMapItem:(id)a3 review:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_MKMapItemUserRatingSnippetTip;
  v9 = [(_MKMapItemUserRatingSnippetTip *)&v11 self];

  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapItem, a3);
    objc_storeStrong((id *)&v9->_tip, a4);
  }

  return v9;
}

- (double)_normalizedScore
{
  return 0.0;
}

- (double)_maxScore
{
  return 0.0;
}

- (double)_score
{
  return 0.0;
}

- (GEOMapItemReview)_geoReview
{
  return 0;
}

- (NSString)_reviewerName
{
  return (NSString *)[(GEOMapItemTip *)self->_tip name];
}

- (NSString)_localizedSnippet
{
  return (NSString *)[(GEOMapItemTip *)self->_tip localizedSnippet];
}

- (NSString)_localizedSnippetLocale
{
  return 0;
}

- (NSURL)_reviewerImageURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = [(GEOMapItemTip *)self->_tip bestImageURL];
  v4 = [v2 URLWithString:v3];

  return (NSURL *)v4;
}

- (GEOMapItemTip)_geoMapItemTIp
{
  return self->_tip;
}

- (NSDate)_date
{
  tip = self->_tip;
  if (tip)
  {
    [tip tipTime];
    if (v4 <= 0.0)
    {
      tip = 0;
    }
    else
    {
      v5 = (void *)MEMORY[0x1E4F1C9C8];
      [(GEOMapItemTip *)self->_tip tipTime];
      tip = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
    }
  }

  return (NSDate *)tip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tip, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end