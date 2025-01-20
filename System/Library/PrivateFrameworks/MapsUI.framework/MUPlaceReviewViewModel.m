@interface MUPlaceReviewViewModel
- (MUPlaceReviewViewModel)initWithRatingSnippet:(id)a3 avatarGenerator:(id)a4;
- (NSDate)reviewDate;
- (NSString)authorText;
- (NSString)reviewText;
- (double)normalizedScore;
- (void)loadUserIconWithPointSize:(CGSize)a3 completion:(id)a4;
@end

@implementation MUPlaceReviewViewModel

- (MUPlaceReviewViewModel)initWithRatingSnippet:(id)a3 avatarGenerator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MUPlaceReviewViewModel;
  v9 = [(MUPlaceReviewViewModel *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ratingSnippet, a3);
    objc_storeStrong((id *)&v10->_avatarGenerator, a4);
  }

  return v10;
}

- (double)normalizedScore
{
  [(MKMapItemProviderRatingSnippet *)self->_ratingSnippet _normalizedScore];
  return result;
}

- (NSString)authorText
{
  return (NSString *)[(MKMapItemProviderRatingSnippet *)self->_ratingSnippet _reviewerName];
}

- (NSDate)reviewDate
{
  return (NSDate *)[(MKMapItemProviderRatingSnippet *)self->_ratingSnippet _date];
}

- (NSString)reviewText
{
  return (NSString *)[(MKMapItemProviderRatingSnippet *)self->_ratingSnippet _localizedSnippet];
}

- (void)loadUserIconWithPointSize:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  p_ratingSnippet = &self->_ratingSnippet;
  ratingSnippet = self->_ratingSnippet;
  v9 = p_ratingSnippet[1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__MUPlaceReviewViewModel_loadUserIconWithPointSize_completion___block_invoke;
  v12[3] = &unk_1E5750CA0;
  id v13 = v7;
  id v11 = v7;
  -[MKMapItemProviderRatingSnippet avatarForReview:pointSize:completion:](v9, "avatarForReview:pointSize:completion:", ratingSnippet, v12, width, height);
}

void __63__MUPlaceReviewViewModel_loadUserIconWithPointSize_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__MUPlaceReviewViewModel_loadUserIconWithPointSize_completion___block_invoke_2;
  v6[3] = &unk_1E57502D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __63__MUPlaceReviewViewModel_loadUserIconWithPointSize_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_storeStrong((id *)&self->_ratingSnippet, 0);
}

@end