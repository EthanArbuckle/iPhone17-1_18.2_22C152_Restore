@interface _PSLogging
+ (id)contactEmbeddingChannel;
+ (id)coreBehaviorChannel;
+ (id)familyRecommenderChannel;
+ (id)featureGenerationChannel;
+ (id)feedbackChannel;
+ (id)generalChannel;
+ (id)heuristicsChannel;
+ (id)knnChannel;
+ (id)mediaAnalysisChannel;
+ (id)messagePinningChannel;
+ (id)rewriteChannel;
+ (id)shareExtensionChannel;
+ (id)suggestionSignpost;
@end

@implementation _PSLogging

+ (id)generalChannel
{
  if (qword_1DE90 != -1) {
    dispatch_once(&qword_1DE90, &stru_183B8);
  }
  v2 = (void *)qword_1DE98;

  return v2;
}

+ (id)messagePinningChannel
{
  if (qword_1DEA0 != -1) {
    dispatch_once(&qword_1DEA0, &stru_183D8);
  }
  v2 = (void *)qword_1DEA8;

  return v2;
}

+ (id)familyRecommenderChannel
{
  if (qword_1DEB0 != -1) {
    dispatch_once(&qword_1DEB0, &stru_183F8);
  }
  v2 = (void *)qword_1DEB8;

  return v2;
}

+ (id)heuristicsChannel
{
  if (qword_1DEC0 != -1) {
    dispatch_once(&qword_1DEC0, &stru_18418);
  }
  v2 = (void *)qword_1DEC8;

  return v2;
}

+ (id)coreBehaviorChannel
{
  if (qword_1DED0 != -1) {
    dispatch_once(&qword_1DED0, &stru_18438);
  }
  v2 = (void *)qword_1DED8;

  return v2;
}

+ (id)knnChannel
{
  if (qword_1DEE0 != -1) {
    dispatch_once(&qword_1DEE0, &stru_18458);
  }
  v2 = (void *)qword_1DEE8;

  return v2;
}

+ (id)feedbackChannel
{
  if (qword_1DEF0 != -1) {
    dispatch_once(&qword_1DEF0, &stru_18478);
  }
  v2 = (void *)qword_1DEF8;

  return v2;
}

+ (id)shareExtensionChannel
{
  if (qword_1DF00 != -1) {
    dispatch_once(&qword_1DF00, &stru_18498);
  }
  v2 = (void *)qword_1DF08;

  return v2;
}

+ (id)mediaAnalysisChannel
{
  if (qword_1DF18 != -1) {
    dispatch_once(&qword_1DF18, &stru_184B8);
  }
  v2 = (void *)qword_1DF10;

  return v2;
}

+ (id)contactEmbeddingChannel
{
  if (qword_1DF20 != -1) {
    dispatch_once(&qword_1DF20, &stru_184D8);
  }
  v2 = (void *)qword_1DF28;

  return v2;
}

+ (id)featureGenerationChannel
{
  if (qword_1DF30 != -1) {
    dispatch_once(&qword_1DF30, &stru_184F8);
  }
  v2 = (void *)qword_1DF38;

  return v2;
}

+ (id)rewriteChannel
{
  if (qword_1DF40 != -1) {
    dispatch_once(&qword_1DF40, &stru_18518);
  }
  v2 = (void *)qword_1DF48;

  return v2;
}

+ (id)suggestionSignpost
{
  if (qword_1DF50 != -1) {
    dispatch_once(&qword_1DF50, &stru_18538);
  }
  v2 = (void *)qword_1DF58;

  return v2;
}

@end