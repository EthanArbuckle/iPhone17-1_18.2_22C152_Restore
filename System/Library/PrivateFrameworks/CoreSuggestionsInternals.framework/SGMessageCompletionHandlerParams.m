@interface SGMessageCompletionHandlerParams
- (NSError)error;
- (SGMessageCompletionHandlerParams)initWithError:(id)a3 foundContacts:(id)a4 foundEvents:(id)a5 invalidatedMessageIdentifiers:(id)a6;
- (SGRealtimeSuggestionsTuple)tuple;
- (void)setError:(id)a3;
- (void)setTuple:(id)a3;
@end

@implementation SGMessageCompletionHandlerParams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuple, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setTuple:(id)a3
{
}

- (SGRealtimeSuggestionsTuple)tuple
{
  return self->_tuple;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (SGMessageCompletionHandlerParams)initWithError:(id)a3 foundContacts:(id)a4 foundEvents:(id)a5 invalidatedMessageIdentifiers:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SGMessageCompletionHandlerParams;
  v15 = [(SGMessageCompletionHandlerParams *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_error, a3);
    uint64_t v17 = objc_opt_new();
    tuple = v16->_tuple;
    v16->_tuple = (SGRealtimeSuggestionsTuple *)v17;

    [(SGRealtimeSuggestionsTuple *)v16->_tuple setContacts:v12];
    [(SGRealtimeSuggestionsTuple *)v16->_tuple setEvents:v13];
    [(SGRealtimeSuggestionsTuple *)v16->_tuple setInvalidatedIdentifiers:v14];
  }

  return v16;
}

@end