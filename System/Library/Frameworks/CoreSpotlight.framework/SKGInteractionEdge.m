@interface SKGInteractionEdge
+ (id)filter;
+ (id)filterWithDomainIdentifier:(id)a3;
- (NSString)domainIdentifier;
- (NSString)relationship;
- (SKGInteractionEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (SKGInteractionEdge)initWithSourceNode:(id)a3 targetNode:(id)a4 domainIdentifier:(id)a5 relationship:(id)a6 score:(id)a7;
- (id)label;
- (id)propertyDictionary;
- (id)score;
@end

@implementation SKGInteractionEdge

+ (id)filter
{
  id v2 = [objc_alloc((Class)MAEdgeFilter) initWithLabel:@"relationship" domain:100];

  return v2;
}

+ (id)filterWithDomainIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)MAEdgeFilter);
  CFStringRef v8 = @"domainIdentifier";
  id v9 = v3;
  v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v6 = [v4 initWithLabel:@"relationship" domain:100 properties:v5];

  return v6;
}

- (SKGInteractionEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a8;
  v14 = [v13 objectForKeyedSubscript:@"domainIdentifier"];
  if (v14)
  {
    v15 = [v13 objectForKeyedSubscript:@"relationship"];
    if (v15)
    {
      v16 = [v13 objectForKeyedSubscript:@"score"];
      if (v16)
      {
        self = [(SKGInteractionEdge *)self initWithSourceNode:v11 targetNode:v12 domainIdentifier:v14 relationship:v15 score:v16];
        v17 = self;
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (SKGInteractionEdge)initWithSourceNode:(id)a3 targetNode:(id)a4 domainIdentifier:(id)a5 relationship:(id)a6 score:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)SKGInteractionEdge;
  v16 = [(SKGEdge *)&v19 initWithSourceNode:a3 targetNode:a4];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_domainIdentifier, a5);
    objc_storeStrong((id *)&v17->_relationship, a6);
    objc_storeStrong((id *)&v17->_score, a7);
  }

  return v17;
}

- (id)propertyDictionary
{
  v8[0] = @"relationship";
  id v3 = [(SKGInteractionEdge *)self relationship];
  v9[0] = v3;
  v8[1] = @"domainIdentifier";
  id v4 = [(SKGInteractionEdge *)self domainIdentifier];
  v9[1] = v4;
  v8[2] = @"score";
  v5 = [(SKGInteractionEdge *)self score];
  v9[2] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)label
{
  return @"relationship";
}

- (id)score
{
  return self->_score;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)relationship
{
  return self->_relationship;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);

  objc_storeStrong((id *)&self->_score, 0);
}

@end