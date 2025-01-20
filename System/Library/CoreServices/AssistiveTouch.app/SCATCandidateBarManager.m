@interface SCATCandidateBarManager
- (BOOL)canBeActiveElementManager;
- (BOOL)handleInputAction:(id)a3 withElement:(id)a4;
- (NSArray)typingCandidates;
- (SCATCandidateBarManagerDelegate)delegate;
- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6;
- (void)driver:(id)a3 willFocusOnContext:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setTypingCandidates:(id)a3;
@end

@implementation SCATCandidateBarManager

- (BOOL)canBeActiveElementManager
{
  v2 = [(SCATCandidateBarManager *)self typingCandidates];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)driver:(id)a3 willFocusOnContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 element];
  if (v8)
  {
    v9 = [(SCATCandidateBarManager *)self typingCandidates];
    unsigned __int8 v10 = [v9 containsObject:v8];

    if ((v10 & 1) == 0)
    {
      v11 = v8;
      _AXAssert();
    }
    if (objc_msgSend(v8, "scatIsAXElement", v11)) {
      [v8 scrollToVisible];
    }
    else {
      _AXAssert();
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)SCATCandidateBarManager;
  [(SCATElementManager *)&v12 driver:v6 willFocusOnContext:v7];
}

- (BOOL)handleInputAction:(id)a3 withElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 action] == (id)100
    || [v6 action] == (id)103
    || [v6 action] == (id)109)
  {
    [(SCATCandidateBarManager *)self setTypingCandidates:0];
  }
  v10.receiver = self;
  v10.super_class = (Class)SCATCandidateBarManager;
  BOOL v8 = [(SCATElementManager *)&v10 handleInputAction:v6 withElement:v7];

  return v8;
}

- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6
{
  BOOL v6 = a4;
  id v8 = a3;
  if (v6)
  {
    id v12 = v8;
    v9 = [(SCATCandidateBarManager *)self delegate];
    objc_super v10 = [(SCATCandidateBarManager *)self typingCandidates];
    unsigned __int8 v11 = [v9 candidateBarManager:self hasValidTypingCandidates:v10];

    id v8 = v12;
    if ((v11 & 1) == 0)
    {
      [(SCATCandidateBarManager *)self setTypingCandidates:0];
      if ([v12 isActive]) {
        [v12 beginScanningWithFocusContext:0];
      }
      else {
        [v12 useFocusContextOnResume:0];
      }
      id v8 = v12;
    }
  }
}

- (SCATCandidateBarManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATCandidateBarManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)typingCandidates
{
  return self->_typingCandidates;
}

- (void)setTypingCandidates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingCandidates, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end