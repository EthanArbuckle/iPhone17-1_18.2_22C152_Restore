@interface WDDetailRowData
- (NSString)key;
- (NSString)value;
- (WDDetailRowData)initWithKey:(id)a3 value:(id)a4;
@end

@implementation WDDetailRowData

- (WDDetailRowData)initWithKey:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WDDetailRowData;
  v9 = [(WDDetailRowData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end