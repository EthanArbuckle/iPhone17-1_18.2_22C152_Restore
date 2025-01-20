@interface AXDisplayLinkManagerTargetAction
- (AXDisplayLinkManagerTargetAction)initWithTarget:(id)a3 actionSelector:(SEL)a4;
- (BOOL)isEqual:(id)a3;
- (SEL)actionSelector;
- (id)target;
- (unint64_t)displayDidRefreshCount;
- (unint64_t)hash;
- (void)displayDidRefresh:(id)a3;
- (void)setActionSelector:(SEL)a3;
- (void)setDisplayDidRefreshCount:(unint64_t)a3;
- (void)setTarget:(id)a3;
@end

@implementation AXDisplayLinkManagerTargetAction

- (AXDisplayLinkManagerTargetAction)initWithTarget:(id)a3 actionSelector:(SEL)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXDisplayLinkManagerTargetAction;
  v7 = [(AXDisplayLinkManagerTargetAction *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(AXDisplayLinkManagerTargetAction *)v7 setTarget:v6];
    [(AXDisplayLinkManagerTargetAction *)v8 setActionSelector:a4];
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(AXDisplayLinkManagerTargetAction *)self actionSelector];
    if (v6 == (const char *)[v5 actionSelector])
    {
      v8 = [(AXDisplayLinkManagerTargetAction *)self target];
      v9 = [v5 target];
      char v7 = [v8 isEqual:v9];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [(AXDisplayLinkManagerTargetAction *)self target];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = (unint64_t)sel_getName([(AXDisplayLinkManagerTargetAction *)self actionSelector])
     % 0x2710
     + v4;

  return v5;
}

- (void)displayDidRefresh:(id)a3
{
  id v10 = a3;
  unint64_t v4 = [(AXDisplayLinkManagerTargetAction *)self displayDidRefreshCount];
  unint64_t v5 = [(AXDisplayLinkManagerTargetAction *)self target];
  [(AXDisplayLinkManagerTargetAction *)self actionSelector];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(AXDisplayLinkManagerTargetAction *)self target];
    v8 = (void (*)(void *, SEL, id))objc_msgSend(v7, "methodForSelector:", -[AXDisplayLinkManagerTargetAction actionSelector](self, "actionSelector"));

    v9 = [(AXDisplayLinkManagerTargetAction *)self target];
    v8(v9, [(AXDisplayLinkManagerTargetAction *)self actionSelector], v10);

    [(AXDisplayLinkManagerTargetAction *)self setDisplayDidRefreshCount:v4 + 1];
  }
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (SEL)actionSelector
{
  if (self->_actionSelector) {
    return self->_actionSelector;
  }
  else {
    return 0;
  }
}

- (void)setActionSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_actionSelector = v3;
}

- (unint64_t)displayDidRefreshCount
{
  return self->_displayDidRefreshCount;
}

- (void)setDisplayDidRefreshCount:(unint64_t)a3
{
  self->_displayDidRefreshCount = a3;
}

- (void).cxx_destruct
{
}

@end