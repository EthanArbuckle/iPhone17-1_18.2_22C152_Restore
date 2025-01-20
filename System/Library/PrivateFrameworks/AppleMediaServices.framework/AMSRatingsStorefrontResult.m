@interface AMSRatingsStorefrontResult
- (AMSRatingsStorefrontResult)initWithData:(id)a3 mediaType:(unint64_t)a4;
- (AMSRatingsStorefrontResult)initWithDictionaries:(id)a3 mediaType:(unint64_t)a4;
- (AMSRatingsStorefrontResult)initWithURLResult:(id)a3 mediaType:(unint64_t)a4;
- (NSArray)ratingsStoreFronts;
- (id)_mapRatingsDictionaries:(id)a3 withMediaType:(unint64_t)a4;
- (unint64_t)_ratingInfoMediaTypeForTaskMediaType:(unint64_t)a3;
@end

@implementation AMSRatingsStorefrontResult

- (AMSRatingsStorefrontResult)initWithURLResult:(id)a3 mediaType:(unint64_t)a4
{
  v6 = [a3 object];
  v7 = [v6 objectForKeyedSubscript:@"data"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v8 = 0;
    goto LABEL_5;
  }
  id v8 = v7;

  if (!v8)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  self = [(AMSRatingsStorefrontResult *)self initWithDictionaries:v8 mediaType:a4];
  v9 = self;
LABEL_6:

  return v9;
}

- (AMSRatingsStorefrontResult)initWithData:(id)a3 mediaType:(unint64_t)a4
{
  uint64_t v11 = 0;
  v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v11];
  v7 = v6;
  if (v11) {
    goto LABEL_2;
  }
  id v9 = [v6 objectForKeyedSubscript:@"data"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = 0;
    goto LABEL_7;
  }
  id v9 = v9;

  if (v9)
  {
    self = [(AMSRatingsStorefrontResult *)self initWithDictionaries:v9 mediaType:a4];
    id v8 = self;
LABEL_7:

    goto LABEL_8;
  }
LABEL_2:
  id v8 = 0;
LABEL_8:

  return v8;
}

- (AMSRatingsStorefrontResult)initWithDictionaries:(id)a3 mediaType:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSRatingsStorefrontResult;
  v7 = [(AMSRatingsStorefrontResult *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(AMSRatingsStorefrontResult *)v7 _mapRatingsDictionaries:v6 withMediaType:a4];
    ratingsStoreFronts = v8->_ratingsStoreFronts;
    v8->_ratingsStoreFronts = (NSArray *)v9;
  }
  return v8;
}

- (id)_mapRatingsDictionaries:(id)a3 withMediaType:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(AMSRatingsStorefrontResult *)self _ratingInfoMediaTypeForTaskMediaType:a4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__AMSRatingsStorefrontResult__mapRatingsDictionaries_withMediaType___block_invoke;
  v10[3] = &__block_descriptor_40_e44___AMSRatingsStoreFront_16__0__NSDictionary_8l;
  v10[4] = v7;
  id v8 = objc_msgSend(v6, "ams_mapWithTransformIgnoresNil:", v10);

  return v8;
}

AMSRatingsStoreFront *__68__AMSRatingsStorefrontResult__mapRatingsDictionaries_withMediaType___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AMSRatingsStoreFront storeFrontWithDictionary:a2 mediaType:*(void *)(a1 + 32)];
}

- (unint64_t)_ratingInfoMediaTypeForTaskMediaType:(unint64_t)a3
{
  return a3 == 1;
}

- (NSArray)ratingsStoreFronts
{
  return self->_ratingsStoreFronts;
}

- (void).cxx_destruct
{
}

@end