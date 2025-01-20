@interface UIViewController
+ (void)as_activatePresentationHack;
- (CGSize)pageContainerSize;
- (_TtP18ASMessagesProvider20PageTraitEnvironment_)snapshotPageTraitEnvironment;
- (id)as_viewControllersForVisibilityCallbackForwarding;
- (void)as_dismissalTransitionDidEnd:(id)a3;
- (void)as_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)as_viewDidBecomeFullyVisible;
- (void)as_viewDidBecomePartiallyVisible;
- (void)as_viewWillBecomeFullyVisible;
- (void)as_viewWillBecomePartiallyVisible;
@end

@implementation UIViewController

+ (void)as_activatePresentationHack
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7C00;
  block[3] = &unk_88AE80;
  block[4] = a1;
  if (qword_979630 != -1) {
    dispatch_once(&qword_979630, block);
  }
}

- (void)as_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0) {
    [(UIViewController *)self as_viewWillBecomePartiallyVisible];
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_7E60;
  v14[3] = &unk_88AEA8;
  BOOL v16 = (isKindOfClass & 1) == 0;
  v14[4] = self;
  id v15 = v9;
  id v11 = v9;
  [(UIViewController *)self as_presentViewController:v8 animated:v6 completion:v14];
  v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"as_dismissalTransitionWillBegin:" name:UIPresentationControllerDismissalTransitionWillBeginNotification object:v8];

  v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"as_dismissalTransitionDidEnd:" name:UIPresentationControllerDismissalTransitionDidEndNotification object:v8];
}

- (void)as_dismissalTransitionDidEnd:(id)a3
{
  id v13 = a3;
  v4 = [v13 userInfo];
  v5 = [v4 objectForKeyedSubscript:UIPresentationControllerDismissalTransitionDidEndCompletedKey];
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    [(UIViewController *)self as_viewDidBecomeFullyVisible];
    v7 = +[NSNotificationCenter defaultCenter];
    uint64_t v8 = UIPresentationControllerDismissalTransitionWillBeginNotification;
    id v9 = [v13 object];
    [v7 removeObserver:self name:v8 object:v9];

    v10 = +[NSNotificationCenter defaultCenter];
    uint64_t v11 = UIPresentationControllerDismissalTransitionDidEndNotification;
    v12 = [v13 object];
    [v10 removeObserver:self name:v11 object:v12];
  }
  else
  {
    [(UIViewController *)self as_viewDidBecomePartiallyVisible];
  }
}

- (id)as_viewControllersForVisibilityCallbackForwarding
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(UIViewController *)self selectedViewController];
    if (v3)
    {
      v4 = [(UIViewController *)self selectedViewController];
      id v9 = v4;
      v5 = &v9;
LABEL_7:
      unsigned int v6 = +[NSArray arrayWithObjects:v5 count:1];

LABEL_9:
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(UIViewController *)self topViewController];
    if (v3)
    {
      v4 = [(UIViewController *)self topViewController];
      uint64_t v8 = v4;
      v5 = &v8;
      goto LABEL_7;
    }
LABEL_8:
    unsigned int v6 = &__NSArray0__struct;
    goto LABEL_9;
  }
  unsigned int v6 = [(UIViewController *)self childViewControllers];
LABEL_11:

  return v6;
}

- (void)as_viewWillBecomeFullyVisible
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(UIViewController *)self as_viewControllersForVisibilityCallbackForwarding];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      unsigned int v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "as_viewWillBecomeFullyVisible");
        unsigned int v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)as_viewDidBecomeFullyVisible
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(UIViewController *)self as_viewControllersForVisibilityCallbackForwarding];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      unsigned int v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "as_viewDidBecomeFullyVisible");
        unsigned int v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)as_viewWillBecomePartiallyVisible
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(UIViewController *)self as_viewControllersForVisibilityCallbackForwarding];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      unsigned int v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "as_viewWillBecomePartiallyVisible");
        unsigned int v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)as_viewDidBecomePartiallyVisible
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(UIViewController *)self as_viewControllersForVisibilityCallbackForwarding];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      unsigned int v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "as_viewDidBecomePartiallyVisible");
        unsigned int v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (CGSize)pageContainerSize
{
  v2 = self;
  id v3 = [(UIViewController *)v2 view];
  if (v3)
  {
    unsigned int v6 = v3;
    [(UIView *)v3 bounds];
    double v8 = v7;
    double v10 = v9;

    double v4 = v8;
    double v5 = v10;
  }
  else
  {
    __break(1u);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (_TtP18ASMessagesProvider20PageTraitEnvironment_)snapshotPageTraitEnvironment
{
  v2 = self;
  [(UIViewController *)v2 pageContainerSize];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  id v7 = [(UIViewController *)v2 traitCollection];
  double v8 = (objc_class *)type metadata accessor for SnapshotPageTraitEnvironment();
  double v9 = (char *)objc_allocWithZone(v8);
  double v10 = &v9[OBJC_IVAR____TtC18ASMessagesProvider28SnapshotPageTraitEnvironment_pageContainerSize];
  *(void *)double v10 = v4;
  *((void *)v10 + 1) = v6;
  *(void *)&v9[OBJC_IVAR____TtC18ASMessagesProvider28SnapshotPageTraitEnvironment_traitCollection] = v7;
  v13.receiver = v9;
  v13.super_class = v8;
  uint64_t v11 = [(UIViewController *)&v13 init];

  return (_TtP18ASMessagesProvider20PageTraitEnvironment_ *)v11;
}

@end