@interface AVTimeRangeMark
- (AVTimeRangeMark)initWithStartValue:(float)a3 endValue:(float)a4 identifier:(id)a5 markUIProvider:(id)a6;
- (AVTimeRangeMarkUIProvider)markUIProvider;
- (NSString)identifer;
- (float)endValue;
- (float)startValue;
@end

@implementation AVTimeRangeMark

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_markUIProvider);

  objc_storeStrong((id *)&self->_identifer, 0);
}

- (AVTimeRangeMarkUIProvider)markUIProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_markUIProvider);

  return (AVTimeRangeMarkUIProvider *)WeakRetained;
}

- (NSString)identifer
{
  return self->_identifer;
}

- (float)endValue
{
  return self->_endValue;
}

- (float)startValue
{
  return self->_startValue;
}

- (AVTimeRangeMark)initWithStartValue:(float)a3 endValue:(float)a4 identifier:(id)a5 markUIProvider:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)AVTimeRangeMark;
  v13 = [(AVTimeRangeMark *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_startValue = a3;
    v13->_endValue = a4;
    objc_storeStrong((id *)&v13->_identifer, a5);
    objc_storeWeak((id *)&v14->_markUIProvider, v12);
  }

  return v14;
}

@end