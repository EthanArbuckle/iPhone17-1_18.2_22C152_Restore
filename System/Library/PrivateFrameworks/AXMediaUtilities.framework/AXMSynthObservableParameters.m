@interface AXMSynthObservableParameters
+ (id)defaultParameters;
- (AXMSynthObservableParameters)init;
- (BOOL)isParameterSupported:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSMutableDictionary)parameterValues;
- (NSMutableOrderedSet)supportedParameters;
- (NSPointerArray)parameterObservers;
- (id)getValueForParameter:(id)a3;
- (void)addParameterObserver:(id)a3;
- (void)addSupportedParameter:(id)a3;
- (void)addSupportedParameters:(id)a3;
- (void)notifyObserversOfValueChange:(id)a3 forParameter:(id)a4;
- (void)removeParameterObserver:(id)a3;
- (void)setParameterObservers:(id)a3;
- (void)setParameterValues:(id)a3;
- (void)setSupportedParameters:(id)a3;
- (void)setValue:(id)a3 forParameter:(id)a4;
@end

@implementation AXMSynthObservableParameters

- (AXMSynthObservableParameters)init
{
  v10.receiver = self;
  v10.super_class = (Class)AXMSynthObservableParameters;
  v2 = [(AXMSynthObservableParameters *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    supportedParameters = v2->_supportedParameters;
    v2->_supportedParameters = v3;

    uint64_t v5 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    parameterObservers = v2->_parameterObservers;
    v2->_parameterObservers = (NSPointerArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    parameterValues = v2->_parameterValues;
    v2->_parameterValues = (NSMutableDictionary *)v7;

    [(AXMSynthObservableParameters *)v2 addSupportedParameters];
  }
  return v2;
}

- (void)addSupportedParameter:(id)a3
{
}

- (void)addSupportedParameters:(id)a3
{
}

- (BOOL)isParameterSupported:(id)a3
{
  return [(NSMutableOrderedSet *)self->_supportedParameters containsObject:a3];
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [(AXMSynthObservableParameters *)self supportedParameters];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v9 = -[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", v8, (void)v12);
        [v3 setObject:v9 forKeyedSubscript:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  objc_super v10 = (void *)[v3 copy];

  return (NSDictionary *)v10;
}

- (void)addParameterObserver:(id)a3
{
}

- (void)removeParameterObserver:(id)a3
{
  id v5 = a3;
  for (unint64_t i = 0; i < [(NSPointerArray *)self->_parameterObservers count]; ++i)
  {
    if ([(NSPointerArray *)self->_parameterObservers pointerAtIndex:i] == v5)
    {
      if (i != 0x7FFFFFFFFFFFFFFFLL) {
        [(NSPointerArray *)self->_parameterObservers removePointerAtIndex:i];
      }
      break;
    }
  }
}

- (void)notifyObserversOfValueChange:(id)a3 forParameter:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = self->_parameterObservers;
  uint64_t v9 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "parameterValueDidChange:forParameter:", v6, v7, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)setValue:(id)a3 forParameter:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(AXMSynthObservableParameters *)self assertParameterIsSupported:v6])
  {
    [(NSMutableDictionary *)self->_parameterValues setObject:v7 forKeyedSubscript:v6];
    [(AXMSynthObservableParameters *)self notifyObserversOfValueChange:v7 forParameter:v6];
  }
}

- (id)getValueForParameter:(id)a3
{
  id v4 = a3;
  if ([(AXMSynthObservableParameters *)self isParameterSupported:v4])
  {
    id v5 = [(NSMutableDictionary *)self->_parameterValues objectForKeyedSubscript:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)defaultParameters
{
  v2 = objc_alloc_init(AXMSynthObservableParameters);

  return v2;
}

- (NSPointerArray)parameterObservers
{
  return self->_parameterObservers;
}

- (void)setParameterObservers:(id)a3
{
}

- (NSMutableDictionary)parameterValues
{
  return self->_parameterValues;
}

- (void)setParameterValues:(id)a3
{
}

- (NSMutableOrderedSet)supportedParameters
{
  return self->_supportedParameters;
}

- (void)setSupportedParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedParameters, 0);
  objc_storeStrong((id *)&self->_parameterValues, 0);

  objc_storeStrong((id *)&self->_parameterObservers, 0);
}

@end