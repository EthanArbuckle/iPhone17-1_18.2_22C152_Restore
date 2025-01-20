@interface MKSearchFoundationBusinessReviewRichText
- (BOOL)isReviewResolved;
- (void)resolveReviewStringWithProviderNameByMapItem:(id)a3 lines:(id)a4 temporaryReviewString:(id)a5;
- (void)resolveReviewStringWithProviderNameNotFoundByMapItem:(id)a3 lines:(id)a4 temporaryReviewString:(id)a5;
- (void)setReviewResolved:(BOOL)a3;
@end

@implementation MKSearchFoundationBusinessReviewRichText

- (void)resolveReviewStringWithProviderNameByMapItem:(id)a3 lines:(id)a4 temporaryReviewString:(id)a5
{
  id v16 = a4;
  id v8 = a5;
  v9 = NSString;
  id v10 = a3;
  v11 = _MKLocalizedStringFromThisBundle(@"Place_Reviews_On_Provider");
  uint64_t v12 = [v10 _sampleSizeForUserRatingScore];
  v13 = [v10 _reviewsDisplayName];

  v14 = objc_msgSend(v9, "localizedStringWithFormat:", v11, v12, v13);

  if ([v16 count])
  {
    [v16 insertObject:v14 atIndex:0];
    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  [v16 addObject:v14];
  if (v8) {
LABEL_3:
  }
    [v16 removeObject:v8];
LABEL_4:
  [(MKSearchFoundationBusinessReviewRichText *)self setReviewResolved:1];
  v15 = +[MKSearchFoundationResult styledStringFromStringArray:v16];
  [(MKSearchFoundationRichText *)self setText:v15];
}

- (void)resolveReviewStringWithProviderNameNotFoundByMapItem:(id)a3 lines:(id)a4 temporaryReviewString:(id)a5
{
  id v8 = a4;
  if (a5) {
    [v8 removeObject:a5];
  }
  [(MKSearchFoundationBusinessReviewRichText *)self setReviewResolved:1];
  v7 = +[MKSearchFoundationResult styledStringFromStringArray:v8];
  [(MKSearchFoundationRichText *)self setText:v7];
}

- (BOOL)isReviewResolved
{
  return self->_reviewResolved;
}

- (void)setReviewResolved:(BOOL)a3
{
  self->_reviewResolved = a3;
}

@end