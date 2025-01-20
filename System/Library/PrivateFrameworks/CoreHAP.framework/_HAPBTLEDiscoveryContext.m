@interface _HAPBTLEDiscoveryContext
- (BOOL)isComplete;
- (BOOL)isDiscovering;
- (NSMapTable)characteristicSignatures;
- (NSMapTable)serviceSignatures;
- (NSMutableArray)discoveringCharacteristics;
- (NSMutableArray)discoveringDescriptors;
- (NSMutableArray)discoveringServices;
- (NSMutableArray)readingCharacteristics;
- (NSMutableArray)readingDescriptors;
- (NSMutableArray)readingSignatureCharacteristics;
- (NSMutableArray)readingSignatureServices;
- (_HAPBTLEDiscoveryContext)init;
- (_HAPBTLEDiscoveryContext)initWithDiscoveryType:(int64_t)a3;
- (id)completionHandler;
- (int64_t)discoveryType;
- (void)reset;
- (void)setCompletionHandler:(id)a3;
- (void)setDiscovering:(BOOL)a3;
@end

@implementation _HAPBTLEDiscoveryContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_serviceSignatures, 0);
  objc_storeStrong((id *)&self->_characteristicSignatures, 0);
  objc_storeStrong((id *)&self->_readingSignatureServices, 0);
  objc_storeStrong((id *)&self->_readingSignatureCharacteristics, 0);
  objc_storeStrong((id *)&self->_readingDescriptors, 0);
  objc_storeStrong((id *)&self->_discoveringDescriptors, 0);
  objc_storeStrong((id *)&self->_readingCharacteristics, 0);
  objc_storeStrong((id *)&self->_discoveringCharacteristics, 0);

  objc_storeStrong((id *)&self->_discoveringServices, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setDiscovering:(BOOL)a3
{
  self->_discovering = a3;
}

- (BOOL)isDiscovering
{
  return self->_discovering;
}

- (NSMapTable)serviceSignatures
{
  return self->_serviceSignatures;
}

- (NSMapTable)characteristicSignatures
{
  return self->_characteristicSignatures;
}

- (NSMutableArray)readingSignatureServices
{
  return self->_readingSignatureServices;
}

- (NSMutableArray)readingSignatureCharacteristics
{
  return self->_readingSignatureCharacteristics;
}

- (NSMutableArray)readingDescriptors
{
  return self->_readingDescriptors;
}

- (NSMutableArray)discoveringDescriptors
{
  return self->_discoveringDescriptors;
}

- (NSMutableArray)readingCharacteristics
{
  return self->_readingCharacteristics;
}

- (NSMutableArray)discoveringCharacteristics
{
  return self->_discoveringCharacteristics;
}

- (NSMutableArray)discoveringServices
{
  return self->_discoveringServices;
}

- (int64_t)discoveryType
{
  return self->_discoveryType;
}

- (BOOL)isComplete
{
  v3 = [(_HAPBTLEDiscoveryContext *)self discoveringServices];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(_HAPBTLEDiscoveryContext *)self discoveringCharacteristics];
    if ([v5 count])
    {
      BOOL v4 = 0;
    }
    else
    {
      v6 = [(_HAPBTLEDiscoveryContext *)self readingCharacteristics];
      if ([v6 count])
      {
        BOOL v4 = 0;
      }
      else
      {
        v7 = [(_HAPBTLEDiscoveryContext *)self discoveringDescriptors];
        if ([v7 count])
        {
          BOOL v4 = 0;
        }
        else
        {
          v8 = [(_HAPBTLEDiscoveryContext *)self readingDescriptors];
          if ([v8 count])
          {
            BOOL v4 = 0;
          }
          else
          {
            v9 = [(_HAPBTLEDiscoveryContext *)self readingSignatureCharacteristics];
            if ([v9 count])
            {
              BOOL v4 = 0;
            }
            else
            {
              v10 = [(_HAPBTLEDiscoveryContext *)self readingSignatureServices];
              BOOL v4 = [v10 count] == 0;
            }
          }
        }
      }
    }
  }

  return v4;
}

- (void)reset
{
  [(_HAPBTLEDiscoveryContext *)self setDiscovering:0];
  v3 = [(_HAPBTLEDiscoveryContext *)self discoveringServices];
  [v3 removeAllObjects];

  BOOL v4 = [(_HAPBTLEDiscoveryContext *)self discoveringCharacteristics];
  [v4 removeAllObjects];

  v5 = [(_HAPBTLEDiscoveryContext *)self readingCharacteristics];
  [v5 removeAllObjects];

  v6 = [(_HAPBTLEDiscoveryContext *)self discoveringDescriptors];
  [v6 removeAllObjects];

  v7 = [(_HAPBTLEDiscoveryContext *)self readingDescriptors];
  [v7 removeAllObjects];

  v8 = [(_HAPBTLEDiscoveryContext *)self readingSignatureCharacteristics];
  [v8 removeAllObjects];

  v9 = [(_HAPBTLEDiscoveryContext *)self readingSignatureServices];
  [v9 removeAllObjects];

  v10 = [(_HAPBTLEDiscoveryContext *)self characteristicSignatures];
  [v10 removeAllObjects];

  id v11 = [(_HAPBTLEDiscoveryContext *)self serviceSignatures];
  [v11 removeAllObjects];
}

- (_HAPBTLEDiscoveryContext)initWithDiscoveryType:(int64_t)a3
{
  v25.receiver = self;
  v25.super_class = (Class)_HAPBTLEDiscoveryContext;
  BOOL v4 = [(_HAPBTLEDiscoveryContext *)&v25 init];
  v5 = v4;
  if (v4)
  {
    v4->_discoveryType = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    discoveringServices = v5->_discoveringServices;
    v5->_discoveringServices = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    discoveringCharacteristics = v5->_discoveringCharacteristics;
    v5->_discoveringCharacteristics = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    readingCharacteristics = v5->_readingCharacteristics;
    v5->_readingCharacteristics = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    discoveringDescriptors = v5->_discoveringDescriptors;
    v5->_discoveringDescriptors = (NSMutableArray *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    readingDescriptors = v5->_readingDescriptors;
    v5->_readingDescriptors = (NSMutableArray *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    readingSignatureCharacteristics = v5->_readingSignatureCharacteristics;
    v5->_readingSignatureCharacteristics = (NSMutableArray *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    readingSignatureServices = v5->_readingSignatureServices;
    v5->_readingSignatureServices = (NSMutableArray *)v18;

    uint64_t v20 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    characteristicSignatures = v5->_characteristicSignatures;
    v5->_characteristicSignatures = (NSMapTable *)v20;

    uint64_t v22 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    serviceSignatures = v5->_serviceSignatures;
    v5->_serviceSignatures = (NSMapTable *)v22;
  }
  return v5;
}

- (_HAPBTLEDiscoveryContext)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  BOOL v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end