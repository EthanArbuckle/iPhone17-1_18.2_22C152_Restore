@interface _MTLFXEffect
- (MTLFXEffectTracingDelegate)tracingDelegate;
- (_MTLFXEffect)init;
- (unint64_t)effectID;
- (void)_beginEncode;
- (void)_didCreateBlitCommandEncoder:(id)a3 forEncode:(unint64_t)a4;
- (void)_didCreateComputeCommandEncoder:(id)a3 forEncode:(unint64_t)a4;
- (void)_didCreateRenderCommandEncoder:(id)a3 forEncode:(unint64_t)a4;
- (void)setTracingDelegate:(id)a3;
@end

@implementation _MTLFXEffect

- (_MTLFXEffect)init
{
  v3.receiver = self;
  v3.super_class = (Class)_MTLFXEffect;
  result = [(_MTLFXEffect *)&v3 init];
  result->_effectID = atomic_fetch_add_explicit(&_MTLFXNextScalerID, 1uLL, memory_order_relaxed) + 1;
  return result;
}

- (void)_beginEncode
{
}

- (void)_didCreateRenderCommandEncoder:(id)a3 forEncode:(unint64_t)a4
{
  p_tracingDelegate = &self->_tracingDelegate;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_tracingDelegate);
  [WeakRetained scaler:self didCreateRenderCommandEncoder:v7 forEncode:a4];
}

- (void)_didCreateBlitCommandEncoder:(id)a3 forEncode:(unint64_t)a4
{
  p_tracingDelegate = &self->_tracingDelegate;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_tracingDelegate);
  [WeakRetained scaler:self didCreateBlitCommandEncoder:v7 forEncode:a4];
}

- (void)_didCreateComputeCommandEncoder:(id)a3 forEncode:(unint64_t)a4
{
  p_tracingDelegate = &self->_tracingDelegate;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_tracingDelegate);
  [WeakRetained scaler:self didCreateComputeCommandEncoder:v7 forEncode:a4];
}

- (unint64_t)effectID
{
  return self->_effectID;
}

- (MTLFXEffectTracingDelegate)tracingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tracingDelegate);

  return (MTLFXEffectTracingDelegate *)WeakRetained;
}

- (void)setTracingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end