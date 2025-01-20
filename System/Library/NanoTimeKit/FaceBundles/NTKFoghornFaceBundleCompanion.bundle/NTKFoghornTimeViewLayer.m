@interface NTKFoghornTimeViewLayer
- (NTKFoghornTimeViewLayer)initWithTimeView:(id)a3;
- (unint64_t)needsDisplayElementMask;
- (void)drawInContext:(CGContext *)a3;
- (void)setNeedsDisplayElementMask:(unint64_t)a3;
@end

@implementation NTKFoghornTimeViewLayer

- (NTKFoghornTimeViewLayer)initWithTimeView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKFoghornTimeViewLayer;
  v5 = [(NTKFoghornTimeViewLayer *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_timeView, v4);
  }

  return v6;
}

- (void)drawInContext:(CGContext *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timeView);
  uint64_t v9 = objc_msgSend_needsDisplayElementMask(self, v6, v7, v8);
  objc_msgSend__drawInContext_needsDisplayElementMask_(WeakRetained, v10, (uint64_t)a3, v9);

  MEMORY[0x270F9A6D0](self, sel_setNeedsDisplayElementMask_, 0, v11);
}

- (unint64_t)needsDisplayElementMask
{
  return self->_needsDisplayElementMask;
}

- (void)setNeedsDisplayElementMask:(unint64_t)a3
{
  self->_needsDisplayElementMask = a3;
}

- (void).cxx_destruct
{
}

@end