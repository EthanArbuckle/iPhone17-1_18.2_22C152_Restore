@interface SCATFocusContext
+ (SCATFocusContext)focusContextWithElement:(id)a3 elementManager:(id)a4 selectBehavior:(int)a5 options:(int)a6;
+ (id)adHocFocusContext:(id)a3;
+ (id)focusContextAutomatic;
+ (id)focusContextSelf;
+ (id)menuOnlyFocusContext:(id)a3;
+ (int)_behaviorForElement:(id)a3 manager:(id)a4;
- (AXElementGroup)parentGroup;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)isFirstInSequence;
- (BOOL)isGroup;
- (BOOL)shouldBeTrackedByZoom;
- (BOOL)shouldDeferFocusToNativeFocusElement;
- (BOOL)shouldPlayMenuSoundOnFocus;
- (BOOL)shouldResumeFromMenuDismissal;
- (BOOL)shouldSuppressAudioOutput;
- (BOOL)waitsForSelectAction;
- (SCATElement)element;
- (SCATElement)menuElement;
- (SCATElementManager)elementManager;
- (SCATFocusContext)initWithElement:(id)a3 elementManager:(id)a4 selectBehavior:(int)a5;
- (id)_descriptionForSelectBehavior:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)elemLog;
- (int)selectBehavior;
- (unsigned)displayID;
- (void)setElement:(id)a3;
- (void)setElementManager:(id)a3;
- (void)setFirstInSequence:(BOOL)a3;
- (void)setMenuElement:(id)a3;
- (void)setSelectBehavior:(int)a3;
- (void)setShouldBeTrackedByZoom:(BOOL)a3;
- (void)setShouldDeferFocusToNativeFocusElement:(BOOL)a3;
- (void)setShouldPlayMenuSoundOnFocus:(BOOL)a3;
- (void)setShouldResumeFromMenuDismissal:(BOOL)a3;
- (void)suppressAudioOutput;
@end

@implementation SCATFocusContext

- (id)elemLog
{
  v3 = [(SCATFocusContext *)self element];
  char v4 = objc_opt_respondsToSelector();
  v5 = [(SCATFocusContext *)self element];
  v6 = v5;
  if (v4) {
    [v5 elemLog];
  }
  else {
  v7 = [v5 description];
  }
  v8 = sub_1000D325C([(SCATFocusContext *)self selectBehavior]);
  v9 = +[NSString stringWithFormat:@"%@ [%@]", v7, v8];

  return v9;
}

+ (id)focusContextSelf
{
  if (qword_1001F0C18 != -1) {
    dispatch_once(&qword_1001F0C18, &stru_1001AE6B8);
  }
  v2 = (void *)qword_1001F0C10;

  return v2;
}

+ (id)focusContextAutomatic
{
  if (qword_1001F0C28 != -1) {
    dispatch_once(&qword_1001F0C28, &stru_1001AE6D8);
  }
  v2 = (void *)qword_1001F0C20;

  return v2;
}

+ (SCATFocusContext)focusContextWithElement:(id)a3 elementManager:(id)a4 selectBehavior:(int)a5 options:(int)a6
{
  char v6 = a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [objc_alloc((Class)a1) initWithElement:v11 elementManager:v10 selectBehavior:v7];

  if ((v6 & 4) != 0) {
    [v12 setShouldResumeFromMenuDismissal:1];
  }
  if (v6) {
    [v12 setSelectBehavior:1];
  }

  return (SCATFocusContext *)v12;
}

+ (int)_behaviorForElement:(id)a3 manager:(id)a4
{
  id v4 = a3;
  if ([v4 isGroup])
  {
    int v5 = 3;
  }
  else
  {
    int v5 = 1;
    if (([v4 scatShouldActivateDirectly] & 1) == 0)
    {
      char v6 = +[SCATScannerManager sharedManager];
      unsigned int v7 = [v6 shouldBypassShowingMenuForElement:v4];

      if (v7) {
        int v5 = 1;
      }
      else {
        int v5 = 2;
      }
    }
  }

  return v5;
}

+ (id)menuOnlyFocusContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(SCATFocusContext);
  [(SCATFocusContext *)v4 setMenuElement:v3];

  return v4;
}

+ (id)adHocFocusContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(SCATFocusContext);
  [(SCATFocusContext *)v4 setElement:v3];

  [(SCATFocusContext *)v4 setShouldBeTrackedByZoom:0];
  [(SCATFocusContext *)v4 setSelectBehavior:2];

  return v4;
}

- (SCATFocusContext)initWithElement:(id)a3 elementManager:(id)a4 selectBehavior:(int)a5
{
  id v9 = a3;
  id v10 = (SCATElementManager *)a4;
  v15.receiver = self;
  v15.super_class = (Class)SCATFocusContext;
  id v11 = [(SCATFocusContext *)&v15 init];
  id v12 = v11;
  if (v11)
  {
    if (v9 && v10)
    {
      v11->_shouldBeTrackedByZoom = 1;
      objc_storeStrong((id *)&v11->_element, a3);
      if (!a5) {
        a5 = [(id)objc_opt_class() _behaviorForElement:v12->_element manager:v12->_elementManager];
      }
      v12->_selectBehavior = a5;
      v12->_elementManager = v10;
    }
    else
    {
      v14 = +[NSThread callStackSymbols];
      _AXLogWithFacility();

      id v12 = 0;
    }
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SCATFocusContext);
  int v5 = [(SCATFocusContext *)self element];
  [(SCATFocusContext *)v4 setElement:v5];

  char v6 = [(SCATFocusContext *)self menuElement];
  [(SCATFocusContext *)v4 setMenuElement:v6];

  unsigned int v7 = [(SCATFocusContext *)self elementManager];
  [(SCATFocusContext *)v4 setElementManager:v7];

  [(SCATFocusContext *)v4 setSelectBehavior:[(SCATFocusContext *)self selectBehavior]];
  [(SCATFocusContext *)v4 setFirstInSequence:[(SCATFocusContext *)self isFirstInSequence]];
  [(SCATFocusContext *)v4 setShouldResumeFromMenuDismissal:[(SCATFocusContext *)self shouldResumeFromMenuDismissal]];
  [(SCATFocusContext *)v4 setShouldBeTrackedByZoom:[(SCATFocusContext *)self shouldBeTrackedByZoom]];
  return v4;
}

- (id)description
{
  id v3 = +[SCATFocusContext focusContextSelf];
  unsigned int v4 = [(SCATFocusContext *)self isEqual:v3];

  if (v4)
  {
    int v5 = [(SCATFocusContext *)self element];
    char v6 = [(SCATFocusContext *)self elementManager];
    unsigned int v7 = [(SCATFocusContext *)self _descriptionForSelectBehavior:[(SCATFocusContext *)self selectBehavior]];
    v8 = +[NSNumber numberWithBool:[(SCATFocusContext *)self isFirstInSequence]];
    id v9 = [(SCATFocusContext *)self menuElement];
    +[NSString stringWithFormat:@"SCATFocusContext<%p>. SELF-SENTINAL. element:%@ manager:%@ selectBehavior:%@ isFirstInSequence:%@ menuElement:%@", self, v5, v6, v7, v8, v9];
    v13 = LABEL_5:;
    goto LABEL_7;
  }
  id v10 = +[SCATFocusContext focusContextAutomatic];
  unsigned int v11 = [(SCATFocusContext *)self isEqual:v10];

  int v5 = [(SCATFocusContext *)self element];
  char v6 = [(SCATFocusContext *)self elementManager];
  unsigned int v7 = [(SCATFocusContext *)self _descriptionForSelectBehavior:[(SCATFocusContext *)self selectBehavior]];
  v8 = +[NSNumber numberWithBool:[(SCATFocusContext *)self isFirstInSequence]];
  uint64_t v12 = [(SCATFocusContext *)self menuElement];
  id v9 = (void *)v12;
  if (v11)
  {
    +[NSString stringWithFormat:@"SCATFocusContext<%p>. AUTOMATIC-SENTINAL. element:%@ manager:%@ selectBehavior:%@ isFirstInSequence:%@ menuElement:%@", self, v5, v6, v7, v8, v12];
    goto LABEL_5;
  }
  v14 = +[NSNumber numberWithBool:[(SCATFocusContext *)self shouldResumeFromMenuDismissal]];
  v13 = +[NSString stringWithFormat:@"SCATFocusContext<%p>. element:%@ manager:%@ selectBehavior:%@ isFirstInSequence:%@ menuElement:%@ resumesFromMenu:%@", self, v5, v6, v7, v8, v9, v14];

LABEL_7:

  return v13;
}

- (id)_descriptionForSelectBehavior:(int)a3
{
  if ((a3 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return *(&off_1001AE6F8 + a3 - 1);
  }
}

- (BOOL)waitsForSelectAction
{
  id v3 = [(SCATFocusContext *)self element];
  unsigned __int8 v4 = [v3 scatShouldActivateDirectly];

  if (v4) {
    return 0;
  }
  char v6 = [(SCATFocusContext *)self element];
  if ([v6 isGroup]) {
    BOOL v5 = [(SCATFocusContext *)self selectBehavior] == 3;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldSuppressAudioOutput
{
  id v3 = [(SCATFocusContext *)self element];
  unsigned __int8 v4 = [v3 scatShouldSuppressAudioOutput];

  return (v4 & 1) != 0 || self->_shouldSuppressAudioOutput;
}

- (void)suppressAudioOutput
{
  self->_shouldSuppressAudioOutput = 1;
}

- (AXElementGroup)parentGroup
{
  v2 = [(SCATFocusContext *)self element];
  id v3 = [v2 parentGroup];

  return (AXElementGroup *)v3;
}

- (BOOL)isGroup
{
  v2 = [(SCATFocusContext *)self element];
  unsigned __int8 v3 = [v2 isGroup];

  return v3;
}

- (unsigned)displayID
{
  unsigned __int8 v3 = [(SCATFocusContext *)self menuElement];

  if (v3) {
    [(SCATFocusContext *)self menuElement];
  }
  else {
  unsigned __int8 v4 = [(SCATFocusContext *)self element];
  }
  unsigned int v5 = [v4 scatDisplayId];

  return v5;
}

- (BOOL)shouldDeferFocusToNativeFocusElement
{
  v2 = [(SCATFocusContext *)self element];
  unsigned __int8 v3 = [v2 scatShouldAllowDeferFocusToNativeFocusedElement];

  return v3;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  unsigned int v5 = [(SCATFocusContext *)self element];
  [v5 scatFrame];
  v8.CGFloat x = x;
  v8.CGFloat y = y;
  BOOL v6 = CGRectContainsPoint(v9, v8);

  return v6;
}

- (BOOL)isFirstInSequence
{
  return self->_firstInSequence;
}

- (void)setFirstInSequence:(BOOL)a3
{
  self->_firstInSequence = a3;
}

- (SCATElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (int)selectBehavior
{
  return self->_selectBehavior;
}

- (void)setSelectBehavior:(int)a3
{
  self->_selectBehavior = a3;
}

- (SCATElementManager)elementManager
{
  return self->_elementManager;
}

- (void)setElementManager:(id)a3
{
  self->_elementManager = (SCATElementManager *)a3;
}

- (BOOL)shouldResumeFromMenuDismissal
{
  return self->_shouldResumeFromMenuDismissal;
}

- (void)setShouldResumeFromMenuDismissal:(BOOL)a3
{
  self->_shouldResumeFromMenuDismissal = a3;
}

- (SCATElement)menuElement
{
  return self->_menuElement;
}

- (void)setMenuElement:(id)a3
{
}

- (BOOL)shouldBeTrackedByZoom
{
  return self->_shouldBeTrackedByZoom;
}

- (void)setShouldBeTrackedByZoom:(BOOL)a3
{
  self->_shouldBeTrackedByZoom = a3;
}

- (void)setShouldDeferFocusToNativeFocusElement:(BOOL)a3
{
  self->_shouldDeferFocusToNativeFocusElement = a3;
}

- (BOOL)shouldPlayMenuSoundOnFocus
{
  return self->_shouldPlayMenuSoundOnFocus;
}

- (void)setShouldPlayMenuSoundOnFocus:(BOOL)a3
{
  self->_shouldPlayMenuSoundOnFocus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuElement, 0);

  objc_storeStrong((id *)&self->_element, 0);
}

@end