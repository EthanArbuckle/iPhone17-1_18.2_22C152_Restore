@interface VOTUpdateFocusContext
+ (id)context:(int64_t)a3;
- (BOOL)senderIsAppExtension;
- (BOOL)shouldIgnorePreviousFocusedElement;
- (NSString)senderBundleID;
- (VOTAppTransitionContext)appTransition;
- (VOTElement)focusElement;
- (VOTUpdateFocusContext)init;
- (id)description;
- (id)updateFocusComplete;
- (int)senderPID;
- (int64_t)reason;
- (void)setAppTransition:(id)a3;
- (void)setFocusElement:(id)a3;
- (void)setReason:(int64_t)a3;
- (void)setSenderBundleID:(id)a3;
- (void)setSenderIsAppExtension:(BOOL)a3;
- (void)setSenderPID:(int)a3;
- (void)setShouldIgnorePreviousFocusedElement:(BOOL)a3;
- (void)setUpdateFocusComplete:(id)a3;
@end

@implementation VOTUpdateFocusContext

+ (id)context:(int64_t)a3
{
  v4 = objc_alloc_init(VOTUpdateFocusContext);
  [(VOTUpdateFocusContext *)v4 setReason:a3];

  return v4;
}

- (VOTUpdateFocusContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)VOTUpdateFocusContext;
  result = [(VOTUpdateFocusContext *)&v3 init];
  if (result) {
    result->_senderPID = -1;
  }
  return result;
}

- (id)description
{
  objc_super v3 = +[NSNumber numberWithBool:[(VOTUpdateFocusContext *)self shouldIgnorePreviousFocusedElement]];
  v4 = [(VOTUpdateFocusContext *)self focusElement];
  v5 = +[NSNumber numberWithInt:[(VOTUpdateFocusContext *)self senderPID]];
  v6 = [(VOTUpdateFocusContext *)self senderBundleID];
  v7 = +[NSNumber numberWithBool:[(VOTUpdateFocusContext *)self senderIsAppExtension]];
  v8 = +[NSString stringWithFormat:@"VOTUpdateFocusContext <%p>.\n\tReason:%@\n\tIgnorePrevious:%@\n\tFocus:%@\n\tSender PID: %@ BundleID: %@. Is Extension:%@", self, 0, v3, v4, v5, v6, v7];

  return v8;
}

- (BOOL)shouldIgnorePreviousFocusedElement
{
  return self->_shouldIgnorePreviousFocusedElement;
}

- (void)setShouldIgnorePreviousFocusedElement:(BOOL)a3
{
  self->_shouldIgnorePreviousFocusedElement = a3;
}

- (VOTElement)focusElement
{
  return self->_focusElement;
}

- (void)setFocusElement:(id)a3
{
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (VOTAppTransitionContext)appTransition
{
  return self->_appTransition;
}

- (void)setAppTransition:(id)a3
{
}

- (id)updateFocusComplete
{
  return self->_updateFocusComplete;
}

- (void)setUpdateFocusComplete:(id)a3
{
}

- (int)senderPID
{
  return self->_senderPID;
}

- (void)setSenderPID:(int)a3
{
  self->_senderPID = a3;
}

- (NSString)senderBundleID
{
  return self->_senderBundleID;
}

- (void)setSenderBundleID:(id)a3
{
}

- (BOOL)senderIsAppExtension
{
  return self->_senderIsAppExtension;
}

- (void)setSenderIsAppExtension:(BOOL)a3
{
  self->_senderIsAppExtension = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderBundleID, 0);
  objc_storeStrong(&self->_updateFocusComplete, 0);
  objc_storeStrong((id *)&self->_appTransition, 0);

  objc_storeStrong((id *)&self->_focusElement, 0);
}

@end