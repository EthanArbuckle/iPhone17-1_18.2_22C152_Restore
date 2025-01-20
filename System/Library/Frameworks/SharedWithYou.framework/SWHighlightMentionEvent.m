@interface SWHighlightMentionEvent
+ (BOOL)supportsSecureCoding;
- (NSString)mentionedPersonHandle;
- (NSURL)highlightURL;
- (SWHighlightMentionEvent)initWithCoder:(id)a3;
- (SWHighlightMentionEvent)initWithHighlight:(SWHighlight *)highlight mentionedPersonCloudKitShareHandle:(NSString *)handle;
- (SWHighlightMentionEvent)initWithHighlight:(SWHighlight *)highlight mentionedPersonIdentity:(SWPersonIdentity *)identity;
- (SWHighlightMentionEvent)initWithHighlightURL:(id)a3 mentionedPersonHandle:(id)a4 mentionedPersonIdentity:(id)a5;
- (_SWPersonIdentity)mentionedPersonIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SWHighlightMentionEvent

- (SWHighlightMentionEvent)initWithHighlightURL:(id)a3 mentionedPersonHandle:(id)a4 mentionedPersonIdentity:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SWHighlightMentionEvent;
  v12 = [(SWHighlightMentionEvent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_highlightURL, a3);
    objc_storeStrong((id *)&v13->_mentionedPersonHandle, a4);
    objc_storeStrong((id *)&v13->_mentionedPersonIdentity, a5);
  }

  return v13;
}

- (SWHighlightMentionEvent)initWithHighlight:(SWHighlight *)highlight mentionedPersonCloudKitShareHandle:(NSString *)handle
{
  v6 = handle;
  v7 = [(SWHighlight *)highlight URL];
  v8 = [(SWHighlightMentionEvent *)self initWithHighlightURL:v7 mentionedPersonHandle:v6 mentionedPersonIdentity:0];

  return v8;
}

- (SWHighlightMentionEvent)initWithHighlight:(SWHighlight *)highlight mentionedPersonIdentity:(SWPersonIdentity *)identity
{
  v6 = identity;
  v7 = [(SWHighlight *)highlight URL];
  v8 = [(SWHighlightMentionEvent *)self initWithHighlightURL:v7 mentionedPersonHandle:&stru_1EDF19D18 mentionedPersonIdentity:v6];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SWHighlightMentionEvent *)self highlightURL];
  v6 = NSStringFromSelector(sel_highlightURL);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(SWHighlightMentionEvent *)self mentionedPersonHandle];
  v8 = NSStringFromSelector(sel_mentionedPersonHandle);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(SWHighlightMentionEvent *)self mentionedPersonIdentity];
  id v9 = NSStringFromSelector(sel_mentionedPersonIdentity);
  [v4 encodeObject:v10 forKey:v9];
}

- (SWHighlightMentionEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_highlightURL);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_mentionedPersonHandle);
  id v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  v12 = NSStringFromSelector(sel_mentionedPersonIdentity);
  v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  if (v7)
  {
    self = [(SWHighlightMentionEvent *)self initWithHighlightURL:v7 mentionedPersonHandle:v10 mentionedPersonIdentity:v13];
    v14 = self;
  }
  else
  {
    objc_super v15 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SWHighlightMentionEvent initWithCoder:](v15);
    }

    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [(SWHighlightMentionEvent *)self highlightURL];
  v6 = [(SWHighlightMentionEvent *)self mentionedPersonHandle];
  v7 = [(SWHighlightMentionEvent *)self mentionedPersonIdentity];
  uint64_t v8 = (void *)[v4 initWithHighlightURL:v5 mentionedPersonHandle:v6 mentionedPersonIdentity:v7];

  return v8;
}

- (NSURL)highlightURL
{
  return self->_highlightURL;
}

- (NSString)mentionedPersonHandle
{
  return self->_mentionedPersonHandle;
}

- (_SWPersonIdentity)mentionedPersonIdentity
{
  return self->_mentionedPersonIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionedPersonIdentity, 0);
  objc_storeStrong((id *)&self->_mentionedPersonHandle, 0);

  objc_storeStrong((id *)&self->_highlightURL, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FB18000, log, OS_LOG_TYPE_ERROR, "SWHighlightMentionEvent failed to decode highlight", v1, 2u);
}

@end