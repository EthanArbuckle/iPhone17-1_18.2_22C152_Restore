@interface _AMUISwitcherVisibleItemRecord
+ (id)recordWithItem:(uint64_t)a3 index:(void *)a4 forSwitcher:;
- (BOOL)isUnsettled;
- (_AMUISwitcherVisibleItemRecord)initWithItem:(id)a3 index:(int64_t)a4 forSwitcher:(id)a5;
- (double)presentationProgress;
- (id)item;
- (id)itemView;
- (id)switcher;
- (id)viewController;
- (int64_t)_computeEffectiveAppearState;
- (uint64_t)appearState;
- (uint64_t)itemIndex;
- (void)_updateAppearState;
- (void)sendCallbackForState:(uint64_t)a3 animated:;
- (void)setAppearState:(void *)a1;
- (void)setPresentationProgress:(uint64_t)a1;
- (void)setUnsettled:(void *)a1;
@end

@implementation _AMUISwitcherVisibleItemRecord

- (id)item
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 6);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

+ (id)recordWithItem:(uint64_t)a3 index:(void *)a4 forSwitcher:
{
  id v6 = a4;
  id v7 = a2;
  v8 = (void *)[objc_alloc((Class)self) initWithItem:v7 index:a3 forSwitcher:v6];

  return v8;
}

- (id)viewController
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 8);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (id)itemView
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 7);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)setUnsettled:(void *)a1
{
  if (a1)
  {
    *((unsigned char *)a1 + 16) = (_BYTE)a2;
    return (void *)[a1 _updateAppearState];
  }
  return a1;
}

- (void)setPresentationProgress:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  *(double *)(a1 + 24) = a2;
  if (BSFloatIsZero())
  {
    uint64_t v4 = 0;
  }
  else
  {
    if ((BSFloatIsOne() & 1) == 0)
    {
      switch(*(void *)(a1 + 32))
      {
        case 0:
          if (BSFloatGreaterThanFloat()) {
            goto LABEL_16;
          }
          break;
        case 1:
          if (BSFloatGreaterThanFloat())
          {
LABEL_16:
            uint64_t v4 = 2;
            goto LABEL_6;
          }
          break;
        case 2:
        case 3:
          if (BSFloatLessThanFloat())
          {
            uint64_t v4 = 1;
            goto LABEL_6;
          }
          break;
        default:
          goto LABEL_7;
      }
      goto LABEL_7;
    }
    uint64_t v4 = 3;
  }
LABEL_6:
  *(void *)(a1 + 8) = v4;
  [(id)a1 _updateAppearState];
LABEL_7:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_opt_respondsToSelector())
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained switcher:v5 updateItemForPresentationProgress:a2];
  }
}

- (uint64_t)appearState
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (void)sendCallbackForState:(uint64_t)a3 animated:
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    id v6 = objc_loadWeakRetained(a1 + 5);
    id v7 = objc_loadWeakRetained(a1 + 8);
    switch(a2)
    {
      case 0:
        if (objc_opt_respondsToSelector()) {
          [WeakRetained switcherItemDidDisappear:v6];
        }
        if (v7)
        {
          v8 = v6;
          id v9 = v7;
          uint64_t v10 = 0;
          goto LABEL_20;
        }
        break;
      case 1:
        if (objc_opt_respondsToSelector()) {
          [WeakRetained switcherItemWillDisappear:v6];
        }
        if (v7)
        {
          v11 = v6;
          id v12 = v7;
          uint64_t v13 = 0;
          goto LABEL_15;
        }
        break;
      case 2:
        if (objc_opt_respondsToSelector()) {
          [WeakRetained switcherItemWillAppear:v6];
        }
        if (v7)
        {
          v11 = v6;
          id v12 = v7;
          uint64_t v13 = 1;
LABEL_15:
          objc_msgSend(v11, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", v12, v13, a3);
        }
        break;
      case 3:
        if (objc_opt_respondsToSelector()) {
          [WeakRetained switcherItemDidAppear:v6];
        }
        if (v7)
        {
          v8 = v6;
          id v9 = v7;
          uint64_t v10 = 1;
LABEL_20:
          objc_msgSend(v8, "bs_endAppearanceTransitionForChildViewController:toVisible:", v9, v10);
        }
        break;
      default:
        break;
    }
  }
}

- (double)presentationProgress
{
  if (a1) {
    return *(double *)(a1 + 24);
  }
  else {
    return 0.0;
  }
}

- (void)setAppearState:(void *)a1
{
  if (a1)
  {
    *((void *)a1 + 1) = a2;
    return (void *)[a1 _updateAppearState];
  }
  return a1;
}

- (_AMUISwitcherVisibleItemRecord)initWithItem:(id)a3 index:(int64_t)a4 forSwitcher:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_AMUISwitcherVisibleItemRecord;
  uint64_t v10 = [(_AMUISwitcherVisibleItemRecord *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_item, v8);
    id v12 = [v8 itemView];
    objc_storeWeak((id *)&v11->_itemView, v12);

    v11->_itemIndex = a4;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = [v8 itemViewController];
      objc_storeWeak((id *)&v11->_viewController, v13);
    }
    objc_storeWeak((id *)&v11->_switcher, v9);
    v11->_presentationProgress = 0.0;
    v11->_appearState = 0;
  }

  return v11;
}

- (id)switcher
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 5);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (int64_t)_computeEffectiveAppearState
{
  int64_t nominalAppearState = 2;
  if (self->_nominalAppearState != 3) {
    int64_t nominalAppearState = self->_nominalAppearState;
  }
  if (self->_unsettled) {
    return nominalAppearState;
  }
  else {
    return self->_nominalAppearState;
  }
}

- (void)_updateAppearState
{
  int64_t v3 = [(_AMUISwitcherVisibleItemRecord *)self _computeEffectiveAppearState];
  unint64_t appearState = self->_appearState;
  if (appearState == v3) {
    return;
  }
  self->_unint64_t appearState = v3;
  BOOL v5 = appearState >= 2;
  unint64_t v6 = appearState - 2;
  if (v5)
  {
    if (v6 > 1 || v3 != 0) {
      goto LABEL_13;
    }
    uint64_t v8 = 1;
    goto LABEL_12;
  }
  if (v3 == 3)
  {
    uint64_t v8 = 2;
LABEL_12:
    -[_AMUISwitcherVisibleItemRecord sendCallbackForState:animated:]((id *)&self->super.isa, v8, 1);
  }
LABEL_13:
  int64_t v9 = self->_appearState;

  -[_AMUISwitcherVisibleItemRecord sendCallbackForState:animated:]((id *)&self->super.isa, v9, 1);
}

- (BOOL)isUnsettled
{
  if (result) {
    return *(unsigned char *)(result + 16) != 0;
  }
  return result;
}

- (uint64_t)itemIndex
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_itemView);
  objc_destroyWeak((id *)&self->_item);

  objc_destroyWeak((id *)&self->_switcher);
}

@end