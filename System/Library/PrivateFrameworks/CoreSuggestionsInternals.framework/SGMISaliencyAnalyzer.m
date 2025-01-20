@interface SGMISaliencyAnalyzer
+ (id)analyzeSimpleMailMessage:(id)a3 senderConnectionScore:(id)a4 store:(id)a5 logOrStageSaliency:(BOOL)a6 commitSaliency:(BOOL)a7 error:(id *)a8;
@end

@implementation SGMISaliencyAnalyzer

+ (id)analyzeSimpleMailMessage:(id)a3 senderConnectionScore:(id)a4 store:(id)a5 logOrStageSaliency:(BOOL)a6 commitSaliency:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [SGMIFeatureVector alloc];
  v17 = [v15 messageId];
  v18 = [(SGMIFeatureVector *)v16 initWithMessageId:v17 hasHashedMessageId:0 simpleMailMessage:v15 senderConnectionScore:v14 biomeMessageSummary:0 store:v13 preLoadedFeatureNames:MEMORY[0x1E4F1CBF0]];

  v19 = +[SGMISaliencyModelConfig defaultConfig];
  v20 = +[SGMISaliencyInference evaluate:v18 enablePreFiltering:1 config:v19 error:a8];

  if (!*a8)
  {
    if (v10) {
      [(SGMIFeatureVector *)v18 logOrStageWithSaliency:v20];
    }
    if (v9) {
      [v13 commitSaliency:v20];
    }
  }

  return v20;
}

@end