@interface IMServiceReachabilityFinalUnreachableResultPrecondition
+ (id)preconditionWithDictionary:(id)a3;
- (NSString)serviceName;
- (unint64_t)evaluateWithLatestResults:(id)a3 requestedServices:(id)a4;
- (void)setServiceName:(id)a3;
@end

@implementation IMServiceReachabilityFinalUnreachableResultPrecondition

+ (id)preconditionWithDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"FinalUnreachableResult"];
  if (v3)
  {
    v4 = objc_alloc_init(IMServiceReachabilityFinalUnreachableResultPrecondition);
    [(IMServiceReachabilityFinalUnreachableResultPrecondition *)v4 setServiceName:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)evaluateWithLatestResults:(id)a3 requestedServices:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(IMServiceReachabilityFinalUnreachableResultPrecondition *)self serviceName];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    v10 = [(IMServiceReachabilityFinalUnreachableResultPrecondition *)self serviceName];
    v11 = [(IMServiceReachabilityPrecondition *)self _latestResultsForServiceName:v10 fromLatestResults:v6];

    if ([v11 count])
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        int v15 = 0;
        uint64_t v16 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v12);
            }
            v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if (objc_msgSend(v18, "isFinal", (void)v21))
            {
              if ([v18 allAreReachable] && !objc_msgSend(v18, "error"))
              {

                unint64_t v19 = 2;
                goto LABEL_19;
              }
            }
            else
            {
              int v15 = 1;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v14);

        unint64_t v19 = ~v15 & 1;
      }
      else
      {

        unint64_t v19 = 1;
      }
    }
    else
    {
      unint64_t v19 = 0;
    }
LABEL_19:
  }
  else
  {
    unint64_t v19 = 1;
  }

  return v19;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end