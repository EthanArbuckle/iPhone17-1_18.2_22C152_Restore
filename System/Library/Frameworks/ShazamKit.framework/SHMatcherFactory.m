@interface SHMatcherFactory
- (SHAudioTapProvider)audioTapProvider;
- (SHMatcherFactory)initWithAudioTapProvider:(id)a3;
- (id)buildConcurrentMatcherWithInitialBuffers:(id)a3 callback:(id)a4;
- (id)matcherForRequest:(id)a3 catalog:(id)a4;
- (id)matcherForRequest:(id)a3 catalog:(id)a4 initialBuffers:(id)a5;
@end

@implementation SHMatcherFactory

- (SHMatcherFactory)initWithAudioTapProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHMatcherFactory;
  v6 = [(SHMatcherFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_audioTapProvider, a3);
  }

  return v7;
}

- (id)matcherForRequest:(id)a3 catalog:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSMutableArray array];
  if ([v6 type] == (id)1 || objc_msgSend(v6, "type") == (id)2)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_super v9 = [(SHMatcherFactory *)self audioTapProvider];
    v10 = [v9 tapsForAvailableSources];

    id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [[SHRecordingBuffer alloc] initWithTap:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          [v8 addObject:v15];
        }
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }
  }
  id v16 = [v8 copy];
  v17 = [(SHMatcherFactory *)self matcherForRequest:v6 catalog:v7 initialBuffers:v16];

  return v17;
}

- (id)matcherForRequest:(id)a3 catalog:(id)a4 initialBuffers:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  switch((unint64_t)[a3 type])
  {
    case 0uLL:
      v10 = [v8 _createMatcher];
      break;
    case 1uLL:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000273B0;
      v18[3] = &unk_100075880;
      id v19 = v8;
      long long v20 = self;
      v10 = [(SHMatcherFactory *)self buildConcurrentMatcherWithInitialBuffers:v9 callback:v18];
      id v11 = v19;
      goto LABEL_8;
    case 2uLL:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10002718C;
      v21[3] = &unk_100075880;
      id v22 = v8;
      v23 = self;
      v10 = [(SHMatcherFactory *)self buildConcurrentMatcherWithInitialBuffers:v9 callback:v21];
      id v11 = v22;
LABEL_8:

      break;
    case 3uLL:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [v8 clientIdentifier];
        unsigned int v13 = [v12 isEqualToString:@"com.apple.assistant_service"];

        uint64_t v14 = v13;
      }
      else
      {
        uint64_t v14 = 0;
      }
      v15 = [SHAppIntentMatcher alloc];
      id v16 = [[SHAppIntentRunnerMatcher alloc] initWithSource:v14];
      v10 = [(SHAppIntentMatcher *)v15 initWithRunnerMatcher:v16];

      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

- (id)buildConcurrentMatcherWithInitialBuffers:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = v7[2](v7, *(void *)(*((void *)&v21 + 1) + 8 * i));
        objc_msgSend(v8, "addObject:", v14, (void)v21);
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  if ((unint64_t)[v8 count] > 1)
  {
    id v16 = [SHMultipleConcurrentMatcher alloc];
    id v17 = [v8 copy];
    v18 = [(SHMatcherFactory *)self audioTapProvider];
    id v19 = [v18 audioRecordingManager];
    v15 = [(SHMultipleConcurrentMatcher *)v16 initWithMatchers:v17 audioRecordingManager:v19];
  }
  else
  {
    v15 = [v8 firstObject];
  }

  return v15;
}

- (SHAudioTapProvider)audioTapProvider
{
  return self->_audioTapProvider;
}

- (void).cxx_destruct
{
}

@end