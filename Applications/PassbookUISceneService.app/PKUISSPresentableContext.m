@interface PKUISSPresentableContext
- (PKUISSPresentableContext)init;
- (void)bannerHandle:(id)a3 didChangeFromState:(id)a4;
- (void)bannerHandleDidInvalidate:(id)a3;
@end

@implementation PKUISSPresentableContext

- (PKUISSPresentableContext)init
{
  return 0;
}

- (void)bannerHandle:(id)a3 didChangeFromState:(id)a4
{
  if (self->_effectiveHandle == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    v5 = (void *)sub_100005FB8((uint64_t)self);
    [WeakRetained setBannerState:v5];
  }
}

- (void)bannerHandleDidInvalidate:(id)a3
{
  v11 = (PKUISSBannerHandle *)a3;
  [(NSMutableArray *)self->_handles removeObjectIdenticalTo:v11];
  currentHandle = self->_currentHandle;
  if (currentHandle == v11)
  {
    self->_currentHandle = 0;

    if (!self->_currentHandle)
    {
LABEL_5:
      v5 = [(NSMutableArray *)self->_handles firstObject];
      v6 = self->_currentHandle;
      self->_currentHandle = v5;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
      v8 = WeakRetained;
      v9 = self->_currentHandle;
      if (v9)
      {
        objc_storeStrong((id *)&self->_effectiveHandle, v9);
        v10 = (void *)sub_100005FB8((uint64_t)self);
        [v8 setBannerState:v10];
      }
      else
      {
        [WeakRetained setBannerDetached:1];
      }
    }
  }
  else if (!currentHandle)
  {
    goto LABEL_5;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_currentHandle, 0);

  objc_storeStrong((id *)&self->_effectiveHandle, 0);
}

@end