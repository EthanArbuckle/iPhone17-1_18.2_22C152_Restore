@interface SGOutput
- (NSArray)exceptionTemplates;
- (NSArray)outputItems;
- (NSDictionary)jsMessageLogs;
- (NSDictionary)sourceMetadata;
- (SGOutput)initWithOutputItems:(id)a3 exeptionTemplates:(id)a4 jsMessageLogs:(id)a5;
- (SGOutput)initWithOutputItems:(id)a3 sourceMetadata:(id)a4 exeptionTemplates:(id)a5 jsMessageLogs:(id)a6;
@end

@implementation SGOutput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsMessageLogs, 0);
  objc_storeStrong((id *)&self->_exceptionTemplates, 0);
  objc_storeStrong((id *)&self->_sourceMetadata, 0);
  objc_storeStrong((id *)&self->_outputItems, 0);
}

- (NSDictionary)jsMessageLogs
{
  return self->_jsMessageLogs;
}

- (NSArray)exceptionTemplates
{
  return self->_exceptionTemplates;
}

- (NSDictionary)sourceMetadata
{
  return self->_sourceMetadata;
}

- (NSArray)outputItems
{
  return self->_outputItems;
}

- (SGOutput)initWithOutputItems:(id)a3 exeptionTemplates:(id)a4 jsMessageLogs:(id)a5
{
  return [(SGOutput *)self initWithOutputItems:a3 sourceMetadata:0 exeptionTemplates:a4 jsMessageLogs:a5];
}

- (SGOutput)initWithOutputItems:(id)a3 sourceMetadata:(id)a4 exeptionTemplates:(id)a5 jsMessageLogs:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SGOutput;
  v15 = [(SGOutput *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_outputItems, a3);
    objc_storeStrong((id *)&v16->_sourceMetadata, a4);
    objc_storeStrong((id *)&v16->_exceptionTemplates, a5);
    objc_storeStrong((id *)&v16->_jsMessageLogs, a6);
  }

  return v16;
}

@end