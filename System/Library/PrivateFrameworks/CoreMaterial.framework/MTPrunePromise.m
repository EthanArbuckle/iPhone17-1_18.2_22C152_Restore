@interface MTPrunePromise
- (BOOL)isPromiseFulfilled;
- (MTPrunePromise)initWithMaterialLayer:(id)a3;
- (double)timeIntervalSincePromise;
- (void)dealloc;
- (void)fulfillPromise;
- (void)setPromiseFulfilled:(BOOL)a3;
@end

@implementation MTPrunePromise

- (MTPrunePromise)initWithMaterialLayer:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTPrunePromise;
  v5 = [(MTPrunePromise *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_materialLayer, v4);
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    timeStamp = v6->_timeStamp;
    v6->_timeStamp = (NSDate *)v7;
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!self->_promiseFulfilled)
  {
    v3 = MTLogMaterials;
    if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v6 = self;
      _os_log_impl(&dword_1AE9D6000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: deallocating with unfulfilled promise", buf, 0xCu);
    }
    [(MTPrunePromise *)self fulfillPromise];
  }
  v4.receiver = self;
  v4.super_class = (Class)MTPrunePromise;
  [(MTPrunePromise *)&v4 dealloc];
}

- (void)fulfillPromise
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_promiseFulfilled)
  {
    self->_promiseFulfilled = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_materialLayer);
    objc_super v4 = MTLogMaterials;
    if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543618;
      v6 = self;
      __int16 v7 = 2114;
      id v8 = WeakRetained;
      _os_log_impl(&dword_1AE9D6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: pruning layer: %{public}@", (uint8_t *)&v5, 0x16u);
    }
    [WeakRetained prune];
  }
}

- (double)timeIntervalSincePromise
{
  [(NSDate *)self->_timeStamp timeIntervalSinceNow];
  return result;
}

- (BOOL)isPromiseFulfilled
{
  return self->_promiseFulfilled;
}

- (void)setPromiseFulfilled:(BOOL)a3
{
  self->_promiseFulfilled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_destroyWeak((id *)&self->_materialLayer);
}

@end