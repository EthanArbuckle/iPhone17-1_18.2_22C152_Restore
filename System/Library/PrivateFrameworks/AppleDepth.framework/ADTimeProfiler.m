@interface ADTimeProfiler
- (ADTimeProfiler)init;
- (NSMutableArray)logArray;
- (id)log;
- (id)stringLog;
- (id)valueDictForOperationName:(id)a3;
- (void)printLog;
- (void)reset;
- (void)setLogArray:(id)a3;
- (void)startForOperationWithName:(id)a3;
- (void)startWithUTFString:(const char *)a3;
- (void)stopForOperationWithName:(id)a3;
- (void)stopWithUTFString:(const char *)a3;
@end

@implementation ADTimeProfiler

- (void).cxx_destruct
{
}

- (void)setLogArray:(id)a3
{
}

- (NSMutableArray)logArray
{
  return self->_logArray;
}

- (id)stringLog
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v15 = [(ADTimeProfiler *)self log];
  v2 = [MEMORY[0x263F089D8] string];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = v15;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v8 = [v7 allKeys];
        if ([v8 count])
        {
          v9 = [v7 allKeys];
          v10 = [v9 objectAtIndexedSubscript:0];

          v11 = [v7 valueForKey:v10];
          [v11 doubleValue];
          [v2 appendFormat:@"%@: %.02fms\n", v10, v12];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  v13 = (void *)[v2 copy];
  return v13;
}

- (void)printLog
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(ADTimeProfiler *)self log];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v7 = [v6 allKeys];
        if ([v7 count])
        {
          v8 = [v6 allKeys];
          v9 = [v8 objectAtIndexedSubscript:0];

          v10 = [v6 valueForKey:v9];
          [v10 doubleValue];
          NSLog(&cfstr_F_0.isa, v9, v11, (void)v12);
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

- (id)valueDictForOperationName:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [(ADTimeProfiler *)self logArray];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v6)
  {
LABEL_11:

LABEL_13:
    long long v15 = [MEMORY[0x263EFF9A0] dictionary];
    long long v16 = [(ADTimeProfiler *)self logArray];
    [v16 addObject:v15];
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)v19;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v19 != v7) {
      objc_enumerationMutation(v5);
    }
    v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
    v10 = [v9 allKeys];
    if (![v10 count]) {
      goto LABEL_9;
    }
    uint64_t v11 = [v9 allKeys];
    long long v12 = [v11 objectAtIndexedSubscript:0];

    if ([v12 isEqualToString:v4]) {
      break;
    }

LABEL_9:
    if (v6 == ++v8)
    {
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        goto LABEL_3;
      }
      goto LABEL_11;
    }
  }
  long long v13 = [(ADTimeProfiler *)self logArray];
  uint64_t v14 = [v13 indexOfObject:v9];

  if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_13;
  }
  long long v16 = [(ADTimeProfiler *)self logArray];
  long long v15 = [v16 objectAtIndex:v14];
LABEL_15:

  return v15;
}

- (void)stopForOperationWithName:(id)a3
{
  id v9 = a3;
  unint64_t v4 = +[ADTimeProfiler currentTimeUsec];
  uint64_t v5 = [(ADTimeProfiler *)self valueDictForOperationName:v9];
  uint64_t v6 = [v5 valueForKey:v9];
  uint64_t v7 = [v6 longValue];
  uint64_t v8 = [NSNumber numberWithDouble:(double)(v4 - v7) / 1000.0];
  [v5 setObject:v8 forKey:v9];
}

- (void)startForOperationWithName:(id)a3
{
  id v7 = a3;
  unint64_t v4 = +[ADTimeProfiler currentTimeUsec];
  uint64_t v5 = [NSNumber numberWithLong:v4];
  uint64_t v6 = [(ADTimeProfiler *)self valueDictForOperationName:v7];
  [v6 setObject:v5 forKey:v7];
}

- (id)log
{
  id v2 = [(ADTimeProfiler *)self logArray];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (void)stopWithUTFString:(const char *)a3
{
  id v4 = [NSString stringWithUTF8String:a3];
  -[ADTimeProfiler stopForOperationWithName:](self, "stopForOperationWithName:");
}

- (void)startWithUTFString:(const char *)a3
{
  id v4 = [NSString stringWithUTF8String:a3];
  -[ADTimeProfiler startForOperationWithName:](self, "startForOperationWithName:");
}

- (void)reset
{
  id v3 = [MEMORY[0x263EFF980] array];
  -[ADTimeProfiler setLogArray:](self, "setLogArray:");
}

- (ADTimeProfiler)init
{
  v5.receiver = self;
  v5.super_class = (Class)ADTimeProfiler;
  id v2 = [(ADTimeProfiler *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(ADTimeProfiler *)v2 reset];
  }
  return v3;
}

@end