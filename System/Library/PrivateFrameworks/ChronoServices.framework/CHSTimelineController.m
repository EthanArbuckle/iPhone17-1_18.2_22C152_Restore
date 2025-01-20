@interface CHSTimelineController
- (CHSTimelineController)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4;
- (NSString)avocadoIdentifier;
- (NSString)extensionBundleIdentifier;
- (NSString)kind;
- (id)initForAvocadoIdentifier:(id)a3 inBundleIdentifier:(id)a4;
- (id)reloadTimeline;
- (id)reloadTimelineBudgeted;
- (id)reloadTimelineBudgetedWithReason:(id)a3;
- (id)reloadTimelineWithReason:(id)a3;
@end

@implementation CHSTimelineController

- (CHSTimelineController)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CHSTimelineController;
  v8 = [(CHSTimelineController *)&v16 init];
  if (v8)
  {
    uint64_t v9 = +[CHSChronoServicesConnection sharedInstance];
    connection = v8->_connection;
    v8->_connection = (CHSChronoServicesConnection *)v9;

    uint64_t v11 = [v6 copy];
    extensionBundleIdentifier = v8->_extensionBundleIdentifier;
    v8->_extensionBundleIdentifier = (NSString *)v11;

    uint64_t v13 = [v7 copy];
    kind = v8->_kind;
    v8->_kind = (NSString *)v13;
  }
  return v8;
}

- (id)reloadTimelineWithReason:(id)a3
{
  id v4 = a3;
  v5 = [[CHSTimelineReloadRequest alloc] initWithKind:self->_kind extensionBundleIdentifier:self->_extensionBundleIdentifier reason:v4 allowCostOverride:1];
  connection = self->_connection;
  id v9 = 0;
  [(CHSChronoServicesConnection *)connection reloadTimeline:v5 error:&v9];
  id v7 = v9;

  return v7;
}

- (id)reloadTimelineBudgetedWithReason:(id)a3
{
  id v4 = a3;
  v5 = [[CHSTimelineReloadRequest alloc] initWithKind:self->_kind extensionBundleIdentifier:self->_extensionBundleIdentifier reason:v4 allowCostOverride:0];
  connection = self->_connection;
  id v9 = 0;
  [(CHSChronoServicesConnection *)connection reloadTimeline:v5 error:&v9];
  id v7 = v9;

  return v7;
}

- (id)initForAvocadoIdentifier:(id)a3 inBundleIdentifier:(id)a4
{
  return [(CHSTimelineController *)self initWithExtensionBundleIdentifier:a4 kind:a3];
}

- (NSString)avocadoIdentifier
{
  return self->_kind;
}

- (id)reloadTimeline
{
  return [(CHSTimelineController *)self reloadTimelineWithReason:@"unknown"];
}

- (id)reloadTimelineBudgeted
{
  return [(CHSTimelineController *)self reloadTimelineBudgetedWithReason:@"unknown"];
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end