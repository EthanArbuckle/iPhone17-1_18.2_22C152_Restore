@interface _CNACDPeopleSuggesterFacadeTestDouble
- (NSString)description;
- (_CNACDPeopleSuggesterFacadeTestDouble)init;
- (_CNACDPeopleSuggesterFacadeTestDouble)initWithDelegate:(id)a3;
- (_CNACDPeopleSuggesterFacadeTestDoubleDelegate)delegate;
- (id)addPersonWithDisplayName:(id)a3 handle:(id)a4 contactIdentifier:(id)a5;
- (id)suggestPeopleWithContext:(id)a3 settings:(id)a4 error:(id *)a5;
- (unint64_t)typeOfHandle:(id)a3;
@end

@implementation _CNACDPeopleSuggesterFacadeTestDouble

- (_CNACDPeopleSuggesterFacadeTestDouble)init
{
  return [(_CNACDPeopleSuggesterFacadeTestDouble *)self initWithDelegate:0];
}

- (_CNACDPeopleSuggesterFacadeTestDouble)initWithDelegate:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CNACDPeopleSuggesterFacadeTestDouble;
  v6 = [(_CNACDPeopleSuggesterFacadeTestDouble *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    uint64_t v8 = objc_opt_new();
    suggestions = v7->_suggestions;
    v7->_suggestions = (NSMutableArray *)v8;

    v10 = v7;
  }

  return v7;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"delegate" object:self->_delegate];
  id v5 = (id)[v3 appendName:@"suggestions" object:self->_suggestions];
  v6 = [v3 build];

  return (NSString *)v6;
}

- (id)addPersonWithDisplayName:(id)a3 handle:(id)a4 contactIdentifier:(id)a5
{
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F5B3A0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v8);
  [v12 setDisplayName:v11];

  [v12 setIdentifier:v10];
  [v12 setPersonId:v9];

  [v12 setPersonIdType:3];
  unint64_t v13 = [(_CNACDPeopleSuggesterFacadeTestDouble *)self typeOfHandle:v10];

  [v12 setType:v13];
  id v14 = objc_alloc_init(MEMORY[0x1E4F5B460]);
  [v14 setContact:v12];
  [(NSMutableArray *)self->_suggestions addObject:v14];

  return v14;
}

- (unint64_t)typeOfHandle:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    unint64_t v4 = 0;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F5A410];
    v13[0] = v3;
    unint64_t v4 = 1;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v7 = [v5 classificationOfHandleStrings:v6];

    uint64_t v8 = [v7 phoneNumbers];
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      id v10 = [v7 emailAddresses];
      BOOL v11 = [v10 count] != 0;

      unint64_t v4 = 2 * v11;
    }
  }
  return v4;
}

- (id)suggestPeopleWithContext:(id)a3 settings:(id)a4 error:(id *)a5
{
  -[_CNACDPeopleSuggesterFacadeTestDoubleDelegate didQueryCDPeopleSuggesterWithContext:settings:](self->_delegate, "didQueryCDPeopleSuggesterWithContext:settings:", a3, a4, a5);
  v6 = (void *)[(NSMutableArray *)self->_suggestions copy];
  return v6;
}

- (_CNACDPeopleSuggesterFacadeTestDoubleDelegate)delegate
{
  return (_CNACDPeopleSuggesterFacadeTestDoubleDelegate *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end