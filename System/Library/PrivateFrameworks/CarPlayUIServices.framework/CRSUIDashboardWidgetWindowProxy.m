@interface CRSUIDashboardWidgetWindowProxy
- (CRSUIDashboardWidgetWindowClient)delegate;
- (CRSUIDashboardWidgetWindowProxy)initWithDelegate:(id)a3;
- (void)hostFocusableItem:(id)a3 focused:(BOOL)a4;
- (void)hostFocusableItem:(id)a3 pressed:(BOOL)a4;
- (void)hostSelectedFocusableItem:(id)a3;
- (void)hostSetUseSystemPrimaryFocusColor:(BOOL)a3;
- (void)hostSetWidgetSizes:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CRSUIDashboardWidgetWindowProxy

- (CRSUIDashboardWidgetWindowProxy)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRSUIDashboardWidgetWindowProxy;
  v5 = [(CRSUIDashboardWidgetWindowProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)hostFocusableItem:(id)a3 pressed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CRSUIDashboardWidgetWindowProxy *)self delegate];
  [v7 hostFocusableItem:v6 pressed:v4];
}

- (void)hostSelectedFocusableItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSUIDashboardWidgetWindowProxy *)self delegate];
  [v5 hostSelectedFocusableItem:v4];
}

- (void)hostFocusableItem:(id)a3 focused:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CRSUIDashboardWidgetWindowProxy *)self delegate];
  [v7 hostFocusableItem:v6 focused:v4];
}

- (void)hostSetWidgetSizes:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSUIDashboardWidgetWindowProxy *)self delegate];
  [v5 hostSetWidgetSizes:v4];
}

- (void)hostSetUseSystemPrimaryFocusColor:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CRSUIDashboardWidgetWindowProxy *)self delegate];
  [v4 hostSetUseSystemPrimaryFocusColor:v3];
}

- (CRSUIDashboardWidgetWindowClient)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CRSUIDashboardWidgetWindowClient *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end