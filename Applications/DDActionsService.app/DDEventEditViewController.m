@interface DDEventEditViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (DDAction)action;
- (void)adaptForPresentationInPopover:(BOOL)a3;
- (void)dealloc;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)prepareForAction:(id)a3;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)setAction:(id)a3;
- (void)setCancellable:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DDEventEditViewController

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DDRemoteActionPresenter, a2, a1);
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DDRemoteActionViewService, a2, a1);
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  if (self->_eventEditViewController)
  {
    -[EKEventEditViewController dismissViewControllerAnimated:completion:](v4->_eventEditViewController, "dismissViewControllerAnimated:completion:", 0);
    objc_storeStrong((id *)&v4->_eventEditViewController, 0);
  }
  v2.receiver = v4;
  v2.super_class = (Class)DDEventEditViewController;
  [(DDEventEditViewController *)&v2 dealloc];
}

- (void)prepareForAction:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = objc_alloc_init((Class)EKEventStore);
  id v3 = v12;
  v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_100013A58;
  v8 = &unk_100020858;
  id v9 = location[0];
  id v10 = v12;
  v11 = v14;
  [v3 requestFullAccessToEventsWithCompletion:];
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)setCancellable:(BOOL)a3
{
  BOOL v4 = a3;
  id v3 = [(DDEventEditViewController *)self _remoteViewControllerProxy];
  [v3 actionCanBeCancelledExternally:v4];
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v27 = a4;
  char v26 = 0;
  uint64_t v25 = 2;
  if (a4 == 1)
  {
    uint64_t v25 = 0;
    char v26 = 1;
  }
  else if (!v27)
  {
    uint64_t v25 = 1;
    char v26 = 1;
  }
  id v18 = [location[0] event];
  id v19 = [v18 timeZone];
  char v23 = 0;
  BOOL v20 = 0;
  if (v19)
  {
    id v24 = [(EKEvent *)v29->_proposedEvent timeZone];
    char v23 = 1;
    BOOL v20 = v24 == 0;
  }
  if (v23) {

  }
  if (v20)
  {
    v17 = +[NSTimeZone defaultTimeZone];
    -[EKEvent setTimeZone:](v29->_proposedEvent, "setTimeZone:");
  }
  if (v29->_shouldTrackEventCreation && (v26 & 1) != 0)
  {
    id v22 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t prefillMode = v29->_prefillMode;
      uint64_t eventTypeClassification = (uint64_t)v29->_eventTypeClassification;
      uint64_t proposedEvent = (uint64_t)v29->_proposedEvent;
      id v16 = [location[0] event];
      sub_100014DAC((uint64_t)v30, v25, prefillMode, eventTypeClassification, proposedEvent, (uint64_t)v16);
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v22, OS_LOG_TYPE_DEBUG, "Will record user interaction %ld with prefill mode %ld and event type classification %@. Proposed event: %@, final event: %@ #DDUINLEventMetrics", v30, 0x34u);
    }
    objc_storeStrong(&v22, 0);
    unsigned int v4 = [(DDAction *)v29->_action hostApplication];
    uint64_t v5 = 2;
    if (v4 != 1) {
      uint64_t v5 = 3;
    }
    uint64_t v7 = v25;
    uint64_t v8 = v5;
    unint64_t v9 = v29->_prefillMode;
    id v10 = v29->_eventTypeClassification;
    v11 = v29->_proposedEvent;
    id v12 = [location[0] event];
    +[SGNLEventSuggestionsMetrics recordUserInteraction:withLinkInApplication:eventPrefillMode:eventTypeClassification:proposedEvent:confirmedEvent:](SGNLEventSuggestionsMetrics, "recordUserInteraction:withLinkInApplication:eventPrefillMode:eventTypeClassification:proposedEvent:confirmedEvent:", v7, v8, v9, v10, v11);
  }
  [(DDEventEditViewController *)v29 setCancellable:1];
  [location[0] setEditViewDelegate:];
  [location[0] dismissViewControllerAnimated:0 completion:0];
  objc_storeStrong((id *)&v29->_eventEditViewController, 0);
  id v6 = [(DDEventEditViewController *)v29 _remoteViewControllerProxy];
  [v6 actionDidFinishShouldDismiss:1];

  objc_storeStrong(location, 0);
}

- (void)adaptForPresentationInPopover:(BOOL)a3
{
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v19 = self;
  location[1]  = (id)a2;
  location[0]  = 0;
  objc_storeStrong(location, a3);
  v17  = 0;
  objc_storeStrong(&v17, a4);
  v16.receiver  = v19;
  v16.super_class  = (Class)DDEventEditViewController;
  [(DDEventEditViewController *)&v16 willTransitionToTraitCollection:location[0] withTransitionCoordinator:v17];
  id v6 = [location[0] verticalSizeClass];
  id v7 = [(DDEventEditViewController *)v19 traitCollection];
  BOOL v8 = v6 == [v7 verticalSizeClass];

  if (!v8)
  {
    id v4 = v17;
    unint64_t v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    v11  = 0;
    id v12 = sub_100015004;
    v13  = &unk_100020880;
    v14  = location[0];
    v15  = v17;
    [v4 animateAlongsideTransition:&v9];
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4 = self;
  location[1]  = (id)a2;
  location[0]  = 0;
  objc_storeStrong(location, a3);
  [(EKEventEditViewController *)v4->_eventEditViewController cancelEditing];
  objc_storeStrong(location, 0);
}

- (DDAction)action
{
  return (DDAction *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end