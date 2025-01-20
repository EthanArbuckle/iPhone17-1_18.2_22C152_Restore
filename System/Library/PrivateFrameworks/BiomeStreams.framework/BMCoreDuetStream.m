@interface BMCoreDuetStream
- (BMCoreDuetStream)initWithKnowledgeStore:(id)a3 clientContext:(id)a4 identifier:(id)a5;
- (NSString)identifier;
- (_CDUserContext)context;
- (_DKEventQuery)query;
- (_DKKnowledgeQuerying)store;
- (id)publisherForQuery:(id)a3;
@end

@implementation BMCoreDuetStream

- (BMCoreDuetStream)initWithKnowledgeStore:(id)a3 clientContext:(id)a4 identifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMCoreDuetStream;
  v12 = [(BMCoreDuetStream *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    objc_storeStrong((id *)&v13->_identifier, a5);
  }

  return v13;
}

- (id)publisherForQuery:(id)a3
{
  id v4 = a3;
  v5 = [BMKnowledgeContextPublisher alloc];
  v6 = [(BMCoreDuetStream *)self store];
  v7 = [(BMCoreDuetStream *)self context];
  v8 = [(BMKnowledgeContextPublisher *)v5 initWithQuery:v4 store:v6 context:v7 includeLiveEvents:0];

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_DKEventQuery)query
{
  return self->_query;
}

- (_DKKnowledgeQuerying)store
{
  return self->_store;
}

- (_CDUserContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_query, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end