@interface SGMeCardDissector
- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5;
@end

@implementation SGMeCardDissector

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v17 = a3;
  id v6 = a4;
  if (([v17 isSent] & 1) == 0)
  {
    v7 = [v17 author];
    uint64_t v8 = [v6 authorNickname];
    uint64_t v9 = [v6 authorPhotoPath];
    if (v8 | v9)
    {
      v10 = +[SGIdentityKey keyForPersonHandle:v7];
      if (v10)
      {
        if (v8)
        {
          v11 = [[SGPipelineEnrichment alloc] initWithPseudoContactWithKey:v10 parent:v6 name:v8];
          v12 = [MEMORY[0x1E4F5DA20] extractionInfoWithExtractionType:64 modelVersion:0 confidence:0];
          [(SGEntity *)v11 setExtractionInfo:v12];

          [v6 setContactInformationExtracted:1];
          [v6 addOrReplacePreferredEnrichment:v11];
        }
        if (v9)
        {
          v13 = [[SGContactDetailKey alloc] initWithIdentityKey:v10 label:@"from_messages" normalizedValue:v9];
          v14 = [SGPipelineEnrichment alloc];
          v15 = [MEMORY[0x1E4F5DA20] extractionInfoWithExtractionType:64 modelVersion:0 confidence:0];
          v16 = -[SGPipelineEnrichment initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:](v14, "initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:", v13, 5, v15, 0, v6, v9, &stru_1F24EEF20, 0, 0);

          [v6 setContactInformationExtracted:1];
          [v6 addEnrichment:v16];
        }
      }
    }
  }
}

@end