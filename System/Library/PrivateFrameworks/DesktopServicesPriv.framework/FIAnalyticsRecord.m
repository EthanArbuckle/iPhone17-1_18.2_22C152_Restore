@interface FIAnalyticsRecord
- (BOOL)validate;
- (FIAnalyticsRecord)initWithEventName:(id)a3;
- (NSMutableDictionary)eventDict;
- (NSString)eventName;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation FIAnalyticsRecord

- (FIAnalyticsRecord)initWithEventName:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FIAnalyticsRecord;
  v6 = [(FIAnalyticsRecord *)&v10 init];
  objc_storeStrong((id *)&v6->_eventName, a3);
  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  eventDict = v6->_eventDict;
  v6->_eventDict = v7;

  return v6;
}

- (BOOL)validate
{
  return self->_eventName != 0;
}

- (id)objectForKeyedSubscript:(id)a3
{
  v3 = [(FIAnalyticsRecord *)self objectForKey:a3];
  return v3;
}

- (id)objectForKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_eventDict objectForKeyedSubscript:a3];
  return v3;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  v6 = [NSNumber numberWithBool:v4];
  [(NSMutableDictionary *)self->_eventDict setObject:v6 forKeyedSubscript:v7];
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSMutableDictionary)eventDict
{
  return self->_eventDict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDict, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end