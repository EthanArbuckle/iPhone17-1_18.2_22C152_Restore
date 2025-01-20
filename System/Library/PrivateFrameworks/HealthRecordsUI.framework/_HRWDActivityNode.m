@interface _HRWDActivityNode
- (HRWDUserActivityResponder)nextResponder;
- (HRWDUserActivityResponder)responder;
- (_HRWDActivityNode)initWithResponder:(id)a3;
- (id)_nextNode;
- (id)changeActivityForResponder:(id)a3 activityDictionary:(id)a4;
- (id)description;
- (id)transitionActivityForResponder:(id)a3 newResponder:(id)a4 transitionDictionary:(id)a5;
- (void)addActivitiesToArray:(id)a3 currentNode:(id)a4;
- (void)setNextResponder:(id)a3;
- (void)setResponder:(id)a3;
@end

@implementation _HRWDActivityNode

- (id)description
{
  v3 = NSString;
  v4 = [(_HRWDActivityNode *)self responder];
  v5 = [(_HRWDActivityNode *)self nextResponder];
  v6 = [v3 stringWithFormat:@"Responder: %@ Next Responder: %@ \n", v4, v5];

  return v6;
}

- (_HRWDActivityNode)initWithResponder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HRWDActivityNode;
  v5 = [(_HRWDActivityNode *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(_HRWDActivityNode *)v5 setResponder:v4];
    [(_HRWDActivityNode *)v6 setNextResponder:0];
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
    responderActivity = v6->_responderActivity;
    v6->_responderActivity = (NSMutableDictionary *)v7;

    nextResponderActivity = v6->_nextResponderActivity;
    v6->_nextResponderActivity = 0;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:0 capacity:4];
    responderTable = v6->_responderTable;
    v6->_responderTable = (NSMapTable *)v10;
  }
  return v6;
}

- (id)changeActivityForResponder:(id)a3 activityDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_HRWDActivityNode *)self responder];

  if (v8 == v6)
  {
    if (v7) {
      [(NSMutableDictionary *)self->_responderActivity addEntriesFromDictionary:v7];
    }
    v11 = self;
  }
  else
  {
    v9 = [(_HRWDActivityNode *)self _nextNode];
    uint64_t v10 = v9;
    if (v9)
    {
      v11 = [v9 changeActivityForResponder:v6 activityDictionary:v7];
    }
    else
    {
      v11 = 0;
    }
  }
  return v11;
}

- (id)transitionActivityForResponder:(id)a3 newResponder:(id)a4 transitionDictionary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_HRWDActivityNode *)self responder];

  if (v11 == v8)
  {
    v14 = [(NSMapTable *)self->_responderTable objectForKey:v9];
    if (!v14)
    {
      v14 = [[_HRWDActivityNode alloc] initWithResponder:v9];
      [(NSMapTable *)self->_responderTable setObject:v14 forKey:v9];
    }
    objc_storeStrong((id *)&self->_nextResponderActivity, a5);
    [(_HRWDActivityNode *)self setNextResponder:v9];
  }
  else
  {
    v12 = [(_HRWDActivityNode *)self _nextNode];
    objc_super v13 = v12;
    if (v12)
    {
      v14 = [v12 transitionActivityForResponder:v8 newResponder:v9 transitionDictionary:v10];
    }
    else
    {
      v14 = 0;
    }
  }
  return v14;
}

- (void)addActivitiesToArray:(id)a3 currentNode:(id)a4
{
  id v9 = a3;
  id v6 = (_HRWDActivityNode *)a4;
  [v9 addObject:self->_responderActivity];
  uint64_t v7 = [(_HRWDActivityNode *)self _nextNode];
  id v8 = (void *)v7;
  if (self != v6 && v7)
  {
    [v9 addObject:self->_nextResponderActivity];
    [v8 addActivitiesToArray:v9 currentNode:v6];
  }
}

- (id)_nextNode
{
  v3 = [(_HRWDActivityNode *)self nextResponder];

  if (v3)
  {
    responderTable = self->_responderTable;
    v5 = [(_HRWDActivityNode *)self nextResponder];
    id v6 = [(NSMapTable *)responderTable objectForKey:v5];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (HRWDUserActivityResponder)responder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responder);
  return (HRWDUserActivityResponder *)WeakRetained;
}

- (void)setResponder:(id)a3
{
}

- (HRWDUserActivityResponder)nextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextResponder);
  return (HRWDUserActivityResponder *)WeakRetained;
}

- (void)setNextResponder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nextResponder);
  objc_destroyWeak((id *)&self->_responder);
  objc_storeStrong((id *)&self->_responderTable, 0);
  objc_storeStrong((id *)&self->_nextResponderActivity, 0);
  objc_storeStrong((id *)&self->_responderActivity, 0);
}

@end