@interface ESContextualData
- (BOOL)containsEntity;
- (ESContextualData)initWithConfiguration:(id)a3 taskName:(id)a4 applicationName:(id)a5;
- (NSString)applicationName;
- (NSString)taskName;
- (_EARContextualData)contextualData;
- (id)metrics;
- (void)fetchNamedEntitiesWithTimeInterval:(double)a3;
@end

@implementation ESContextualData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);

  objc_storeStrong((id *)&self->_contextualData, 0);
}

- (NSString)taskName
{
  return self->_taskName;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (_EARContextualData)contextualData
{
  return self->_contextualData;
}

- (void)fetchNamedEntitiesWithTimeInterval:(double)a3
{
  if (self->_contextualData)
  {
    if ([(NSString *)self->_applicationName length])
    {
      contextualData = self->_contextualData;
      applicationName = self->_applicationName;
      taskName = self->_taskName;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000EC1C;
      v17[3] = &unk_100050C48;
      *(double *)&v17[5] = a3;
      v17[4] = self;
      [(_EARContextualData *)contextualData iterNamedEntitySourceWithApplication:applicationName task:taskName block:v17];
    }
    if (self->_contextualData)
    {
      if ([(NSString *)self->_applicationName length])
      {
        id v8 = objc_alloc_init((Class)_PSSuggester);
        v9 = self->_contextualData;
        v10 = self->_applicationName;
        v11 = self->_taskName;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10000EEA4;
        v13[3] = &unk_100050C98;
        double v16 = a3;
        id v14 = v8;
        v15 = self;
        id v12 = v8;
        [(_EARContextualData *)v9 iterRankedContactSourceWithApplication:v10 task:v11 block:v13];
      }
    }
  }
}

- (BOOL)containsEntity
{
  return [(_EARContextualData *)self->_contextualData containsEntity];
}

- (id)metrics
{
  return [(_EARContextualData *)self->_contextualData metrics];
}

- (ESContextualData)initWithConfiguration:(id)a3 taskName:(id)a4 applicationName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ESContextualData;
  v11 = [(ESContextualData *)&v20 init];
  if (v11)
  {
    if (([v9 isEqualToString:@"Dictation"] & 1) == 0
      && ![v9 isEqualToString:@"WebSearch"]
      || ![v10 length]
      || (id v12 = (_EARContextualData *)[objc_alloc((Class)_EARContextualData) initWithConfiguration:v8], contextualData = v11->_contextualData, v11->_contextualData = v12, contextualData, !v11->_contextualData))
    {
      v18 = 0;
      goto LABEL_9;
    }
    id v14 = (NSString *)[v10 copy];
    applicationName = v11->_applicationName;
    v11->_applicationName = v14;

    double v16 = (NSString *)[v9 copy];
    taskName = v11->_taskName;
    v11->_taskName = v16;
  }
  v18 = v11;
LABEL_9:

  return v18;
}

@end