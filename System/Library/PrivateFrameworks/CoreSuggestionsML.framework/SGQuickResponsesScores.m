@interface SGQuickResponsesScores
+ (id)quickResponsesScoresWithModelScores:(id)a3 normalizedModelScores:(id)a4;
- (NSArray)modelScores;
- (NSArray)normalizedModelScores;
- (SGQuickResponsesScores)initWithModelScores:(id)a3 normalizedModelScores:(id)a4;
@end

@implementation SGQuickResponsesScores

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedModelScores, 0);
  objc_storeStrong((id *)&self->_modelScores, 0);
}

- (NSArray)normalizedModelScores
{
  return self->_normalizedModelScores;
}

- (NSArray)modelScores
{
  return self->_modelScores;
}

- (SGQuickResponsesScores)initWithModelScores:(id)a3 normalizedModelScores:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGQuickResponsesInference.m", 61, @"Invalid parameter not satisfying: %@", @"modelScores != nil" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)SGQuickResponsesScores;
  v10 = [(SGQuickResponsesScores *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_modelScores, a3);
    objc_storeStrong((id *)&v11->_normalizedModelScores, a4);
  }

  return v11;
}

+ (id)quickResponsesScoresWithModelScores:(id)a3 normalizedModelScores:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithModelScores:v7 normalizedModelScores:v6];

  return v8;
}

@end