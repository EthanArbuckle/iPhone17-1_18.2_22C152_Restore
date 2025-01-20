@interface _CNAPeopleSuggesterFacade
- (NSString)description;
- (_CNAPeopleSuggesterFacade)init;
- (_CNAPeopleSuggesterFacade)initWithPeopleSuggester:(id)a3;
- (_PSSuggester)suggester;
- (id)autocompleteSearchResultsWithPredictionContext:(id)a3;
@end

@implementation _CNAPeopleSuggesterFacade

- (_CNAPeopleSuggesterFacade)init
{
  id v3 = objc_alloc_init(get_PSSuggesterClass());
  v4 = [(_CNAPeopleSuggesterFacade *)self initWithPeopleSuggester:v3];

  return v4;
}

- (_CNAPeopleSuggesterFacade)initWithPeopleSuggester:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNAPeopleSuggesterFacade;
  v6 = [(_CNAPeopleSuggesterFacade *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggester, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"suggester" object:self->_suggester];
  id v5 = [v3 build];

  return (NSString *)v5;
}

- (id)autocompleteSearchResultsWithPredictionContext:(id)a3
{
  id v4 = a3;
  id v5 = self->_suggester;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  v6 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v7 = [v6 schedulerProvider];
  v8 = [v7 immediateScheduler];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76___CNAPeopleSuggesterFacade_autocompleteSearchResultsWithPredictionContext___block_invoke;
  v14[3] = &unk_1E63DD8A0;
  v9 = v5;
  v15 = v9;
  v17 = &v18;
  id v10 = v4;
  id v16 = v10;
  [v8 performBlock:v14 qualityOfService:4];

  v11 = (void *)v19[5];
  if (!v11) {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v12 = v11;

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (_PSSuggester)suggester
{
  return (_PSSuggester *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end