@interface ACUISActivityAlertClient
- (ACUISActivityAlertClient)init;
- (ACUISActivityAlertClientDelegate)delegate;
- (_TtC18ActivityUIServices19ActivityAlertClient)alertClient;
- (void)activityWithAlertClient:(id)a3 dismissAlertProvider:(id)a4;
- (void)activityWithAlertClient:(id)a3 presentAlertProvider:(id)a4 completion:(id)a5;
- (void)setAlertClient:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ACUISActivityAlertClient

- (ACUISActivityAlertClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACUISActivityAlertClient;
  v2 = [(ACUISActivityAlertClient *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    alertClient = v2->_alertClient;
    v2->_alertClient = (_TtC18ActivityUIServices19ActivityAlertClient *)v3;

    [(ActivityAlertClient *)v2->_alertClient setDelegate:v2];
  }
  return v2;
}

- (void)activityWithAlertClient:(id)a3 presentAlertProvider:(id)a4 completion:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  v8 = [(ACUISActivityAlertClient *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [[ACUISActivityAlertProvider alloc] initWithActivityAlertProviding:v12];
    v11 = [(ACUISActivityAlertClient *)self delegate];
    [v11 activityAlertClient:self presentAlertProvider:v10 completion:v7];
  }
}

- (void)activityWithAlertClient:(id)a3 dismissAlertProvider:(id)a4
{
  id v9 = a4;
  v5 = [(ACUISActivityAlertClient *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [[ACUISActivityAlertProvider alloc] initWithActivityAlertProviding:v9];
    v8 = [(ACUISActivityAlertClient *)self delegate];
    [v8 activityAlertClient:self dismissAlertProvider:v7];
  }
}

- (ACUISActivityAlertClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACUISActivityAlertClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC18ActivityUIServices19ActivityAlertClient)alertClient
{
  return self->_alertClient;
}

- (void)setAlertClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end