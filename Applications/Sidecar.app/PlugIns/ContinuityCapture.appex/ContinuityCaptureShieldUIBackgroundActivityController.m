@interface ContinuityCaptureShieldUIBackgroundActivityController
- (BOOL)isBackgroundActivityActive;
- (ContinuityCaptureShieldUIBackgroundActivityController)initWithBackgroundActivityIdentifier:(id)a3;
- (NSString)backgroundActivityIdentifier;
- (STBackgroundActivitiesStatusDomainBackgroundActivityAttribution)currentAttribution;
- (STBackgroundActivitiesStatusDomainPublisher)publisher;
- (void)activateBackgroundActivityWithUserInteractionHandler:(id)a3;
- (void)deactivateBackgroundActivity;
- (void)publishNewDataWithUserInteractionHandler:(id)a3;
- (void)setCurrentAttribution:(id)a3;
- (void)setPublisher:(id)a3;
@end

@implementation ContinuityCaptureShieldUIBackgroundActivityController

- (ContinuityCaptureShieldUIBackgroundActivityController)initWithBackgroundActivityIdentifier:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ContinuityCaptureShieldUIBackgroundActivityController;
  v6 = [(ContinuityCaptureShieldUIBackgroundActivityController *)&v14 init];
  v7 = v6;
  if (!v5)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, v7, @"ContinuityCaptureShieldUIBackgroundActivityController.m", 31, @"Invalid parameter not satisfying: %@", @"backgroundActivityIdentifier" object file lineNumber description];

    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    v8 = (NSString *)[v5 copy];
    backgroundActivityIdentifier = v7->_backgroundActivityIdentifier;
    v7->_backgroundActivityIdentifier = v8;

    v10 = (STBackgroundActivitiesStatusDomainPublisher *)objc_alloc_init((Class)STBackgroundActivitiesStatusDomainPublisher);
    publisher = v7->_publisher;
    v7->_publisher = v10;
  }
LABEL_4:

  return v7;
}

- (void)activateBackgroundActivityWithUserInteractionHandler:(id)a3
{
  if (!self->_backgroundActivityActive)
  {
    self->_backgroundActivityActive = 1;
    [(ContinuityCaptureShieldUIBackgroundActivityController *)self publishNewDataWithUserInteractionHandler:a3];
  }
}

- (void)deactivateBackgroundActivity
{
  if (self->_backgroundActivityActive)
  {
    self->_backgroundActivityActive = 0;
    [(ContinuityCaptureShieldUIBackgroundActivityController *)self publishNewDataWithUserInteractionHandler:0];
  }
}

- (void)publishNewDataWithUserInteractionHandler:(id)a3
{
  id v4 = a3;
  id v5 = self->_currentAttribution;
  if (self->_backgroundActivityActive)
  {
    BSAuditTokenForCurrentProcess();
    v6 = +[STActivityAttribution attributionWithAuditToken:v21];
    id v7 = [objc_alloc((Class)STBackgroundActivitiesStatusDomainBackgroundActivityAttribution) initWithBackgroundActivityIdentifier:self->_backgroundActivityIdentifier activityAttribution:v6];
  }
  else
  {
    id v7 = 0;
  }
  objc_initWeak(&location, self);
  publisher = self->_publisher;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000C26C;
  v17[3] = &unk_1000147D0;
  v9 = v5;
  v18 = v9;
  id v10 = v7;
  id v19 = v10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000C2EC;
  v13[3] = &unk_100014820;
  objc_copyWeak(&v16, &location);
  id v11 = v10;
  id v14 = v11;
  id v12 = v4;
  id v15 = v12;
  [(STBackgroundActivitiesStatusDomainPublisher *)publisher updateVolatileData:v17 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (NSString)backgroundActivityIdentifier
{
  return self->_backgroundActivityIdentifier;
}

- (BOOL)isBackgroundActivityActive
{
  return self->_backgroundActivityActive;
}

- (STBackgroundActivitiesStatusDomainBackgroundActivityAttribution)currentAttribution
{
  return self->_currentAttribution;
}

- (void)setCurrentAttribution:(id)a3
{
}

- (STBackgroundActivitiesStatusDomainPublisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_currentAttribution, 0);

  objc_storeStrong((id *)&self->_backgroundActivityIdentifier, 0);
}

@end