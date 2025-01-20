@interface DACLifecycleManagerMediator
- (void)activatedAssertionForActivity:(id)a3 withChangeMarker:(id)a4;
- (void)activityListChanged:(id)a3;
- (void)roleChanged:(id)a3;
@end

@implementation DACLifecycleManagerMediator

- (void)activityListChanged:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained activityListChanged:v6];
  }
}

- (void)activatedAssertionForActivity:(id)a3 withChangeMarker:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained activatedAssertionForActivity:v9 withChangeMarker:v6];
  }
}

- (void)roleChanged:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained roleChanged:v6];
  }
}

- (void).cxx_destruct
{
}

@end