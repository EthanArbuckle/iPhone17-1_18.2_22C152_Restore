@interface CSAdjunctListItem
- (BOOL)animateDismissal;
- (BOOL)animatePresentation;
- (BOOL)isValid;
- (CSAdjunctItemHosting)contentHost;
- (CSAdjunctListItem)initWithIdentifier:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (SBSLockScreenContentAction)action;
- (UIView)itemView;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)addAction:(id)a3;
- (void)removeAction:(id)a3;
- (void)setAnimateDismissal:(BOOL)a3;
- (void)setAnimatePresentation:(BOOL)a3;
- (void)setContentHost:(id)a3;
- (void)setItemView:(id)a3;
@end

@implementation CSAdjunctListItem

- (CSAdjunctListItem)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSAdjunctListItem;
  v5 = [(CSAdjunctListItem *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    actions = v5->_actions;
    v5->_actions = (NSMutableSet *)v6;

    uint64_t v8 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    *(_WORD *)&v5->_animatePresentation = 257;
  }

  return v5;
}

- (SBSLockScreenContentAction)action
{
  return (SBSLockScreenContentAction *)[(NSMutableSet *)self->_actions anyObject];
}

- (void)addAction:(id)a3
{
}

- (void)removeAction:(id)a3
{
}

- (BOOL)isValid
{
  return [(NSMutableSet *)self->_actions count] != 0;
}

- (NSString)description
{
  return (NSString *)[(CSAdjunctListItem *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(CSAdjunctListItem *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CSAdjunctListItem *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(CSAdjunctListItem *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_identifier withName:@"identifier"];
  id v6 = (id)[v4 appendObject:self->_actions withName:@"actions"];
  id v7 = (id)[v4 appendBool:self->_animatePresentation withName:@"animatePresentation"];
  id v8 = (id)[v4 appendBool:self->_animateDismissal withName:@"animateDismissal"];
  v9 = [(CSAdjunctListItem *)self itemView];
  id v10 = (id)[v4 appendObject:v9 withName:@"itemView"];

  objc_super v11 = [(CSAdjunctListItem *)self contentHost];
  id v12 = (id)[v4 appendObject:v11 withName:@"contentHost"];

  return v4;
}

- (UIView)itemView
{
  return self->itemView;
}

- (void)setItemView:(id)a3
{
}

- (CSAdjunctItemHosting)contentHost
{
  return self->contentHost;
}

- (void)setContentHost:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)animatePresentation
{
  return self->_animatePresentation;
}

- (void)setAnimatePresentation:(BOOL)a3
{
  self->_animatePresentation = a3;
}

- (BOOL)animateDismissal
{
  return self->_animateDismissal;
}

- (void)setAnimateDismissal:(BOOL)a3
{
  self->_animateDismissal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->contentHost, 0);
  objc_storeStrong((id *)&self->itemView, 0);

  objc_storeStrong((id *)&self->_actions, 0);
}

@end