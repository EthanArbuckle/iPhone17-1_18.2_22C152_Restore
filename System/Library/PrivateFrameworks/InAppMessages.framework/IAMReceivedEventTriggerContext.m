@interface IAMReceivedEventTriggerContext
- (BOOL)satisfiesPresentationTrigger:(id)a3;
- (IAMEventProtocol)event;
- (IAMReceivedEventTriggerContext)initWithEvent:(id)a3 bundleIdentifier:(id)a4;
- (NSString)bundleIdentifier;
@end

@implementation IAMReceivedEventTriggerContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (IAMReceivedEventTriggerContext)initWithEvent:(id)a3 bundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IAMReceivedEventTriggerContext;
  v9 = [(IAMReceivedEventTriggerContext *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_event, a3);
    uint64_t v11 = [v8 copy];
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;
  }
  return v10;
}

- (IAMEventProtocol)event
{
  return self->_event;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)satisfiesPresentationTrigger:(id)a3
{
  id v4 = a3;
  if ([v4 hasKind] && objc_msgSend(v4, "kind")) {
    goto LABEL_6;
  }
  uint64_t v5 = [v4 bundleIdentifier];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = (void *)v5;
  id v7 = [v4 bundleIdentifier];
  int v8 = [v7 isEqualToString:self->_bundleIdentifier];

  if (!v8)
  {
LABEL_6:
    char v11 = 0;
  }
  else
  {
LABEL_5:
    event = self->_event;
    v10 = [v4 triggerName];
    char v11 = [(IAMEventProtocol *)event matchesWithKey:v10];
  }
  return v11;
}

@end