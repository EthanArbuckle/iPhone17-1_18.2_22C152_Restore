@interface DESDediscoKey
- (DESDediscoKey)initWithPrivacyID:(id)a3 environment:(id)a4 recipeID:(id)a5;
- (NSString)environment;
- (NSString)privacyID;
- (NSString)recipeID;
- (id)metadataEncodedMetricsKeyString;
- (id)metadataKeyString;
- (id)metricsKeyString;
- (id)resultsKeyString;
- (id)resultsKeyStringForChunk:(id)a3;
@end

@implementation DESDediscoKey

- (DESDediscoKey)initWithPrivacyID:(id)a3 environment:(id)a4 recipeID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DESDediscoKey;
  v12 = [(DESDediscoKey *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_privacyID, a3);
    objc_storeStrong((id *)&v13->_environment, a4);
    objc_storeStrong((id *)&v13->_recipeID, a5);
  }

  return v13;
}

- (id)resultsKeyString
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v3 = [(DESDediscoKey *)self privacyID];
  v9[1] = v3;
  v9[2] = @"results";
  v4 = [(DESDediscoKey *)self environment];
  v9[3] = v4;
  v5 = [(DESDediscoKey *)self recipeID];
  v9[4] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  v7 = [v6 componentsJoinedByString:@":"];

  return v7;
}

- (id)resultsKeyStringForChunk:(id)a3
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v11[0] = @"pfl";
  id v4 = a3;
  v5 = [(DESDediscoKey *)self privacyID];
  v11[1] = v5;
  v11[2] = @"results";
  v11[3] = v4;
  v6 = [(DESDediscoKey *)self environment];
  v11[4] = v6;
  v7 = [(DESDediscoKey *)self recipeID];
  v11[5] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:6];

  id v9 = [v8 componentsJoinedByString:@":"];

  return v9;
}

- (id)metricsKeyString
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v3 = [(DESDediscoKey *)self privacyID];
  v9[1] = v3;
  v9[2] = @"metrics";
  id v4 = [(DESDediscoKey *)self environment];
  v9[3] = v4;
  v5 = [(DESDediscoKey *)self recipeID];
  v9[4] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  v7 = [v6 componentsJoinedByString:@":"];

  return v7;
}

- (id)metadataKeyString
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v3 = [(DESDediscoKey *)self privacyID];
  v9[1] = v3;
  v9[2] = @"metadata";
  id v4 = [(DESDediscoKey *)self environment];
  v9[3] = v4;
  v5 = [(DESDediscoKey *)self recipeID];
  v9[4] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  v7 = [v6 componentsJoinedByString:@":"];

  return v7;
}

- (id)metadataEncodedMetricsKeyString
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v3 = [(DESDediscoKey *)self privacyID];
  v9[1] = v3;
  v9[2] = @"encoded-metrics";
  id v4 = [(DESDediscoKey *)self environment];
  v9[3] = v4;
  v5 = [(DESDediscoKey *)self recipeID];
  v9[4] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  v7 = [v6 componentsJoinedByString:@":"];

  return v7;
}

- (NSString)environment
{
  return self->_environment;
}

- (NSString)privacyID
{
  return self->_privacyID;
}

- (NSString)recipeID
{
  return self->_recipeID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipeID, 0);
  objc_storeStrong((id *)&self->_privacyID, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

@end