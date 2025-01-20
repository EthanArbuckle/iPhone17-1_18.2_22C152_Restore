@interface IUIRTISystemDelegateMultiplexer
- (BOOL)respondsToSelector:(SEL)a3;
- (IUIStagingRTISystemDelegate)contextDelegate;
- (RTIInputSystemDelegate)primaryDelegate;
- (void)inputSystemService:(id)a3 prepareForInputSession:(id)a4 options:(id)a5;
- (void)setContextDelegate:(id)a3;
- (void)setPrimaryDelegate:(id)a3;
@end

@implementation IUIRTISystemDelegateMultiplexer

- (void)inputSystemService:(id)a3 prepareForInputSession:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(IUIRTISystemDelegateMultiplexer *)self contextDelegate];
  [v11 inputSystemService:v10 prepareForInputSession:v9 options:v8];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v3 = [(IUIRTISystemDelegateMultiplexer *)self primaryDelegate];
  char v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (RTIInputSystemDelegate)primaryDelegate
{
  return self->_primaryDelegate;
}

- (void)setPrimaryDelegate:(id)a3
{
}

- (IUIStagingRTISystemDelegate)contextDelegate
{
  return self->_contextDelegate;
}

- (void)setContextDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextDelegate, 0);

  objc_storeStrong((id *)&self->_primaryDelegate, 0);
}

@end