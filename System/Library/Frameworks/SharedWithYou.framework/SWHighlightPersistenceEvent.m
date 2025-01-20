@interface SWHighlightPersistenceEvent
+ (BOOL)supportsSecureCoding;
- (NSURL)highlightURL;
- (SWHighlightPersistenceEvent)initWithCoder:(id)a3;
- (SWHighlightPersistenceEvent)initWithHighlight:(SWHighlight *)highlight trigger:(SWHighlightPersistenceEventTrigger)trigger;
- (SWHighlightPersistenceEvent)initWithHighlight:(id)a3 type:(int64_t)a4;
- (SWHighlightPersistenceEvent)initWithHighlightURL:(id)a3 type:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)persistenceEventType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SWHighlightPersistenceEvent

- (SWHighlightPersistenceEvent)initWithHighlightURL:(id)a3 type:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SWHighlightPersistenceEvent;
  v8 = [(SWHighlightPersistenceEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_highlightURL, a3);
    v9->_persistenceEventType = a4;
  }

  return v9;
}

- (SWHighlightPersistenceEvent)initWithHighlight:(id)a3 type:(int64_t)a4
{
  v6 = [a3 URL];
  id v7 = [(SWHighlightPersistenceEvent *)self initWithHighlightURL:v6 type:a4];

  return v7;
}

- (SWHighlightPersistenceEvent)initWithHighlight:(SWHighlight *)highlight trigger:(SWHighlightPersistenceEventTrigger)trigger
{
  v6 = [(SWHighlight *)highlight URL];
  id v7 = [(SWHighlightPersistenceEvent *)self initWithHighlightURL:v6 type:trigger];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SWHighlightPersistenceEvent *)self highlightURL];
  v6 = NSStringFromSelector(sel_highlightURL);
  [v4 encodeObject:v5 forKey:v6];

  int64_t v7 = [(SWHighlightPersistenceEvent *)self persistenceEventType];
  NSStringFromSelector(sel_persistenceEventType);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInteger:v7 forKey:v8];
}

- (SWHighlightPersistenceEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_highlightURL);
  int64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  id v8 = NSStringFromSelector(sel_persistenceEventType);
  uint64_t v9 = [v4 decodeIntegerForKey:v8];

  if (v7)
  {
    self = [(SWHighlightPersistenceEvent *)self initWithHighlightURL:v7 type:v9];
    v10 = self;
  }
  else
  {
    objc_super v11 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SWHighlightPersistenceEvent initWithCoder:](v11);
    }

    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [(SWHighlightPersistenceEvent *)self highlightURL];
  v6 = objc_msgSend(v4, "initWithHighlightURL:type:", v5, -[SWHighlightPersistenceEvent persistenceEventType](self, "persistenceEventType"));

  return v6;
}

- (NSURL)highlightURL
{
  return self->_highlightURL;
}

- (int64_t)persistenceEventType
{
  return self->_persistenceEventType;
}

- (void).cxx_destruct
{
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FB18000, log, OS_LOG_TYPE_ERROR, "SWHighlightPersistenceEvent failed to decode highlightURL", v1, 2u);
}

@end