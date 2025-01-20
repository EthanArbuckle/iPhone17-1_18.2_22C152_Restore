@interface BlendedRankerModelInput
- (BlendedRankerModelInput)initWithPOPULARITY:(double)a3 DISTANCE:(double)a4 SCORE:(double)a5 NORMALIZED_RATING_SCORE:(double)a6 COUNTRY_CODE:(double)a7 ADDRESS_ACCURACY:(double)a8 ADDRESS_FEATURE_TYPE:(double)a9 NUM_TOKENS_MATCH_QUERY_RESULT:(double)a10 TYPE_OF_QUERY_RESULT_MATCH:(double)a11 IS_CATEGORY_QUERY:(double)a12 CATEGORY_TRIGGER_POPULARITY:(double)a13 JACCARD_SIMILARITY_UNION:(double)a14 JACCARD_SIMILARITY_RESULT:(double)a15 IS_NEGATIVE_CATEGORY:(double)a16 IS_PREFERRED_LANGUAGE:(double)a17 DEVICE_LOCALE:(double)a18 SUBSTRING_SIMILARITY:(double)a19 PREFIX_SIMILARITY:(double)a20 DIST_USER_TO_VIEWPORT:(double)a21 IS_USER_IN_VIEWPORT:(double)a22 IS_DEVICELOCATION_IN_VIEWPORT:(double)a23 DIST_RESULT_TO_VIEWPORT:(double)a24 IS_RESULT_IN_VIEWPORT:(double)a25 TIME_SINCE_VIEWPORT_CHANGED:(double)a26 IS_VIEWPORT_FRESH:(double)a27 CATEGORY_MATCH_NORMALIZED_SCORE:(double)a28;
- (NSSet)featureNames;
- (double)ADDRESS_ACCURACY;
- (double)ADDRESS_FEATURE_TYPE;
- (double)CATEGORY_MATCH_NORMALIZED_SCORE;
- (double)CATEGORY_TRIGGER_POPULARITY;
- (double)COUNTRY_CODE;
- (double)DEVICE_LOCALE;
- (double)DISTANCE;
- (double)DIST_RESULT_TO_VIEWPORT;
- (double)DIST_USER_TO_VIEWPORT;
- (double)IS_CATEGORY_QUERY;
- (double)IS_DEVICELOCATION_IN_VIEWPORT;
- (double)IS_NEGATIVE_CATEGORY;
- (double)IS_PREFERRED_LANGUAGE;
- (double)IS_RESULT_IN_VIEWPORT;
- (double)IS_USER_IN_VIEWPORT;
- (double)IS_VIEWPORT_FRESH;
- (double)JACCARD_SIMILARITY_RESULT;
- (double)JACCARD_SIMILARITY_UNION;
- (double)NORMALIZED_RATING_SCORE;
- (double)NUM_TOKENS_MATCH_QUERY_RESULT;
- (double)POPULARITY;
- (double)PREFIX_SIMILARITY;
- (double)SCORE;
- (double)SUBSTRING_SIMILARITY;
- (double)TIME_SINCE_VIEWPORT_CHANGED;
- (double)TYPE_OF_QUERY_RESULT_MATCH;
- (id)featureValueForName:(id)a3;
- (void)setADDRESS_ACCURACY:(double)a3;
- (void)setADDRESS_FEATURE_TYPE:(double)a3;
- (void)setCATEGORY_MATCH_NORMALIZED_SCORE:(double)a3;
- (void)setCATEGORY_TRIGGER_POPULARITY:(double)a3;
- (void)setCOUNTRY_CODE:(double)a3;
- (void)setDEVICE_LOCALE:(double)a3;
- (void)setDISTANCE:(double)a3;
- (void)setDIST_RESULT_TO_VIEWPORT:(double)a3;
- (void)setDIST_USER_TO_VIEWPORT:(double)a3;
- (void)setIS_CATEGORY_QUERY:(double)a3;
- (void)setIS_DEVICELOCATION_IN_VIEWPORT:(double)a3;
- (void)setIS_NEGATIVE_CATEGORY:(double)a3;
- (void)setIS_PREFERRED_LANGUAGE:(double)a3;
- (void)setIS_RESULT_IN_VIEWPORT:(double)a3;
- (void)setIS_USER_IN_VIEWPORT:(double)a3;
- (void)setIS_VIEWPORT_FRESH:(double)a3;
- (void)setJACCARD_SIMILARITY_RESULT:(double)a3;
- (void)setJACCARD_SIMILARITY_UNION:(double)a3;
- (void)setNORMALIZED_RATING_SCORE:(double)a3;
- (void)setNUM_TOKENS_MATCH_QUERY_RESULT:(double)a3;
- (void)setPOPULARITY:(double)a3;
- (void)setPREFIX_SIMILARITY:(double)a3;
- (void)setSCORE:(double)a3;
- (void)setSUBSTRING_SIMILARITY:(double)a3;
- (void)setTIME_SINCE_VIEWPORT_CHANGED:(double)a3;
- (void)setTYPE_OF_QUERY_RESULT_MATCH:(double)a3;
@end

@implementation BlendedRankerModelInput

- (BlendedRankerModelInput)initWithPOPULARITY:(double)a3 DISTANCE:(double)a4 SCORE:(double)a5 NORMALIZED_RATING_SCORE:(double)a6 COUNTRY_CODE:(double)a7 ADDRESS_ACCURACY:(double)a8 ADDRESS_FEATURE_TYPE:(double)a9 NUM_TOKENS_MATCH_QUERY_RESULT:(double)a10 TYPE_OF_QUERY_RESULT_MATCH:(double)a11 IS_CATEGORY_QUERY:(double)a12 CATEGORY_TRIGGER_POPULARITY:(double)a13 JACCARD_SIMILARITY_UNION:(double)a14 JACCARD_SIMILARITY_RESULT:(double)a15 IS_NEGATIVE_CATEGORY:(double)a16 IS_PREFERRED_LANGUAGE:(double)a17 DEVICE_LOCALE:(double)a18 SUBSTRING_SIMILARITY:(double)a19 PREFIX_SIMILARITY:(double)a20 DIST_USER_TO_VIEWPORT:(double)a21 IS_USER_IN_VIEWPORT:(double)a22 IS_DEVICELOCATION_IN_VIEWPORT:(double)a23 DIST_RESULT_TO_VIEWPORT:(double)a24 IS_RESULT_IN_VIEWPORT:(double)a25 TIME_SINCE_VIEWPORT_CHANGED:(double)a26 IS_VIEWPORT_FRESH:(double)a27 CATEGORY_MATCH_NORMALIZED_SCORE:(double)a28
{
  v37.receiver = self;
  v37.super_class = (Class)BlendedRankerModelInput;
  result = [(BlendedRankerModelInput *)&v37 init];
  if (result)
  {
    result->_POPULARITY = a3;
    result->_DISTANCE = a4;
    result->_SCORE = a5;
    result->_NORMALIZED_RATING_SCORE = a6;
    result->_COUNTRY_CODE = a7;
    result->_ADDRESS_ACCURACY = a8;
    result->_ADDRESS_FEATURE_TYPE = a9;
    result->_NUM_TOKENS_MATCH_QUERY_RESULT = a10;
    result->_TYPE_OF_QUERY_RESULT_MATCH = a11;
    result->_IS_CATEGORY_QUERY = a12;
    result->_CATEGORY_TRIGGER_POPULARITY = a13;
    result->_JACCARD_SIMILARITY_UNION = a14;
    result->_JACCARD_SIMILARITY_RESULT = a15;
    result->_IS_NEGATIVE_CATEGORY = a16;
    result->_IS_PREFERRED_LANGUAGE = a17;
    result->_DEVICE_LOCALE = a18;
    result->_SUBSTRING_SIMILARITY = a19;
    result->_PREFIX_SIMILARITY = a20;
    result->_DIST_USER_TO_VIEWPORT = a21;
    result->_IS_USER_IN_VIEWPORT = a22;
    result->_IS_DEVICELOCATION_IN_VIEWPORT = a23;
    result->_DIST_RESULT_TO_VIEWPORT = a24;
    result->_IS_RESULT_IN_VIEWPORT = a25;
    result->_TIME_SINCE_VIEWPORT_CHANGED = a26;
    result->_IS_VIEWPORT_FRESH = a27;
    result->_CATEGORY_MATCH_NORMALIZED_SCORE = a28;
  }
  return result;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_24F1408];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"POPULARITY"])
  {
    [(BlendedRankerModelInput *)self POPULARITY];
LABEL_53:
    v5 = +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:");
    goto LABEL_54;
  }
  if ([v4 isEqualToString:@"DISTANCE"])
  {
    [(BlendedRankerModelInput *)self DISTANCE];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"SCORE"])
  {
    [(BlendedRankerModelInput *)self SCORE];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"NORMALIZED_RATING_SCORE"])
  {
    [(BlendedRankerModelInput *)self NORMALIZED_RATING_SCORE];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"COUNTRY_CODE"])
  {
    [(BlendedRankerModelInput *)self COUNTRY_CODE];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"ADDRESS_ACCURACY"])
  {
    [(BlendedRankerModelInput *)self ADDRESS_ACCURACY];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"ADDRESS_FEATURE_TYPE"])
  {
    [(BlendedRankerModelInput *)self ADDRESS_FEATURE_TYPE];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"NUM_TOKENS_MATCH_QUERY_RESULT"])
  {
    [(BlendedRankerModelInput *)self NUM_TOKENS_MATCH_QUERY_RESULT];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"TYPE_OF_QUERY_RESULT_MATCH"])
  {
    [(BlendedRankerModelInput *)self TYPE_OF_QUERY_RESULT_MATCH];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"IS_CATEGORY_QUERY"])
  {
    [(BlendedRankerModelInput *)self IS_CATEGORY_QUERY];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"CATEGORY_TRIGGER_POPULARITY"])
  {
    [(BlendedRankerModelInput *)self CATEGORY_TRIGGER_POPULARITY];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"JACCARD_SIMILARITY_UNION"])
  {
    [(BlendedRankerModelInput *)self JACCARD_SIMILARITY_UNION];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"JACCARD_SIMILARITY_RESULT"])
  {
    [(BlendedRankerModelInput *)self JACCARD_SIMILARITY_RESULT];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"IS_NEGATIVE_CATEGORY"])
  {
    [(BlendedRankerModelInput *)self IS_NEGATIVE_CATEGORY];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"IS_PREFERRED_LANGUAGE"])
  {
    [(BlendedRankerModelInput *)self IS_PREFERRED_LANGUAGE];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"DEVICE_LOCALE"])
  {
    [(BlendedRankerModelInput *)self DEVICE_LOCALE];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"SUBSTRING_SIMILARITY"])
  {
    [(BlendedRankerModelInput *)self SUBSTRING_SIMILARITY];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PREFIX_SIMILARITY"])
  {
    [(BlendedRankerModelInput *)self PREFIX_SIMILARITY];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"DIST_USER_TO_VIEWPORT"])
  {
    [(BlendedRankerModelInput *)self DIST_USER_TO_VIEWPORT];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"IS_USER_IN_VIEWPORT"])
  {
    [(BlendedRankerModelInput *)self IS_USER_IN_VIEWPORT];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"IS_DEVICELOCATION_IN_VIEWPORT"])
  {
    [(BlendedRankerModelInput *)self IS_DEVICELOCATION_IN_VIEWPORT];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"DIST_RESULT_TO_VIEWPORT"])
  {
    [(BlendedRankerModelInput *)self DIST_RESULT_TO_VIEWPORT];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"IS_RESULT_IN_VIEWPORT"])
  {
    [(BlendedRankerModelInput *)self IS_RESULT_IN_VIEWPORT];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"TIME_SINCE_VIEWPORT_CHANGED"])
  {
    [(BlendedRankerModelInput *)self TIME_SINCE_VIEWPORT_CHANGED];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"IS_VIEWPORT_FRESH"])
  {
    [(BlendedRankerModelInput *)self IS_VIEWPORT_FRESH];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"CATEGORY_MATCH_NORMALIZED_SCORE"])
  {
    [(BlendedRankerModelInput *)self CATEGORY_MATCH_NORMALIZED_SCORE];
    goto LABEL_53;
  }
  v5 = 0;
LABEL_54:

  return v5;
}

- (double)POPULARITY
{
  return self->_POPULARITY;
}

- (void)setPOPULARITY:(double)a3
{
  self->_POPULARITY = a3;
}

- (double)DISTANCE
{
  return self->_DISTANCE;
}

- (void)setDISTANCE:(double)a3
{
  self->_DISTANCE = a3;
}

- (double)SCORE
{
  return self->_SCORE;
}

- (void)setSCORE:(double)a3
{
  self->_SCORE = a3;
}

- (double)NORMALIZED_RATING_SCORE
{
  return self->_NORMALIZED_RATING_SCORE;
}

- (void)setNORMALIZED_RATING_SCORE:(double)a3
{
  self->_NORMALIZED_RATING_SCORE = a3;
}

- (double)COUNTRY_CODE
{
  return self->_COUNTRY_CODE;
}

- (void)setCOUNTRY_CODE:(double)a3
{
  self->_COUNTRY_CODE = a3;
}

- (double)ADDRESS_ACCURACY
{
  return self->_ADDRESS_ACCURACY;
}

- (void)setADDRESS_ACCURACY:(double)a3
{
  self->_ADDRESS_ACCURACY = a3;
}

- (double)ADDRESS_FEATURE_TYPE
{
  return self->_ADDRESS_FEATURE_TYPE;
}

- (void)setADDRESS_FEATURE_TYPE:(double)a3
{
  self->_ADDRESS_FEATURE_TYPE = a3;
}

- (double)NUM_TOKENS_MATCH_QUERY_RESULT
{
  return self->_NUM_TOKENS_MATCH_QUERY_RESULT;
}

- (void)setNUM_TOKENS_MATCH_QUERY_RESULT:(double)a3
{
  self->_NUM_TOKENS_MATCH_QUERY_RESULT = a3;
}

- (double)TYPE_OF_QUERY_RESULT_MATCH
{
  return self->_TYPE_OF_QUERY_RESULT_MATCH;
}

- (void)setTYPE_OF_QUERY_RESULT_MATCH:(double)a3
{
  self->_TYPE_OF_QUERY_RESULT_MATCH = a3;
}

- (double)IS_CATEGORY_QUERY
{
  return self->_IS_CATEGORY_QUERY;
}

- (void)setIS_CATEGORY_QUERY:(double)a3
{
  self->_IS_CATEGORY_QUERY = a3;
}

- (double)CATEGORY_TRIGGER_POPULARITY
{
  return self->_CATEGORY_TRIGGER_POPULARITY;
}

- (void)setCATEGORY_TRIGGER_POPULARITY:(double)a3
{
  self->_CATEGORY_TRIGGER_POPULARITY = a3;
}

- (double)JACCARD_SIMILARITY_UNION
{
  return self->_JACCARD_SIMILARITY_UNION;
}

- (void)setJACCARD_SIMILARITY_UNION:(double)a3
{
  self->_JACCARD_SIMILARITY_UNION = a3;
}

- (double)JACCARD_SIMILARITY_RESULT
{
  return self->_JACCARD_SIMILARITY_RESULT;
}

- (void)setJACCARD_SIMILARITY_RESULT:(double)a3
{
  self->_JACCARD_SIMILARITY_RESULT = a3;
}

- (double)IS_NEGATIVE_CATEGORY
{
  return self->_IS_NEGATIVE_CATEGORY;
}

- (void)setIS_NEGATIVE_CATEGORY:(double)a3
{
  self->_IS_NEGATIVE_CATEGORY = a3;
}

- (double)IS_PREFERRED_LANGUAGE
{
  return self->_IS_PREFERRED_LANGUAGE;
}

- (void)setIS_PREFERRED_LANGUAGE:(double)a3
{
  self->_IS_PREFERRED_LANGUAGE = a3;
}

- (double)DEVICE_LOCALE
{
  return self->_DEVICE_LOCALE;
}

- (void)setDEVICE_LOCALE:(double)a3
{
  self->_DEVICE_LOCALE = a3;
}

- (double)SUBSTRING_SIMILARITY
{
  return self->_SUBSTRING_SIMILARITY;
}

- (void)setSUBSTRING_SIMILARITY:(double)a3
{
  self->_SUBSTRING_SIMILARITY = a3;
}

- (double)PREFIX_SIMILARITY
{
  return self->_PREFIX_SIMILARITY;
}

- (void)setPREFIX_SIMILARITY:(double)a3
{
  self->_PREFIX_SIMILARITY = a3;
}

- (double)DIST_USER_TO_VIEWPORT
{
  return self->_DIST_USER_TO_VIEWPORT;
}

- (void)setDIST_USER_TO_VIEWPORT:(double)a3
{
  self->_DIST_USER_TO_VIEWPORT = a3;
}

- (double)IS_USER_IN_VIEWPORT
{
  return self->_IS_USER_IN_VIEWPORT;
}

- (void)setIS_USER_IN_VIEWPORT:(double)a3
{
  self->_IS_USER_IN_VIEWPORT = a3;
}

- (double)IS_DEVICELOCATION_IN_VIEWPORT
{
  return self->_IS_DEVICELOCATION_IN_VIEWPORT;
}

- (void)setIS_DEVICELOCATION_IN_VIEWPORT:(double)a3
{
  self->_IS_DEVICELOCATION_IN_VIEWPORT = a3;
}

- (double)DIST_RESULT_TO_VIEWPORT
{
  return self->_DIST_RESULT_TO_VIEWPORT;
}

- (void)setDIST_RESULT_TO_VIEWPORT:(double)a3
{
  self->_DIST_RESULT_TO_VIEWPORT = a3;
}

- (double)IS_RESULT_IN_VIEWPORT
{
  return self->_IS_RESULT_IN_VIEWPORT;
}

- (void)setIS_RESULT_IN_VIEWPORT:(double)a3
{
  self->_IS_RESULT_IN_VIEWPORT = a3;
}

- (double)TIME_SINCE_VIEWPORT_CHANGED
{
  return self->_TIME_SINCE_VIEWPORT_CHANGED;
}

- (void)setTIME_SINCE_VIEWPORT_CHANGED:(double)a3
{
  self->_TIME_SINCE_VIEWPORT_CHANGED = a3;
}

- (double)IS_VIEWPORT_FRESH
{
  return self->_IS_VIEWPORT_FRESH;
}

- (void)setIS_VIEWPORT_FRESH:(double)a3
{
  self->_IS_VIEWPORT_FRESH = a3;
}

- (double)CATEGORY_MATCH_NORMALIZED_SCORE
{
  return self->_CATEGORY_MATCH_NORMALIZED_SCORE;
}

- (void)setCATEGORY_MATCH_NORMALIZED_SCORE:(double)a3
{
  self->_CATEGORY_MATCH_NORMALIZED_SCORE = a3;
}

@end