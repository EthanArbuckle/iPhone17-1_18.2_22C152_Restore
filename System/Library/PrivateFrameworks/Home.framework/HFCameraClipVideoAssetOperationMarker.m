@interface HFCameraClipVideoAssetOperationMarker
+ (id)sentinelWithKey:(id)a3;
- (HFCameraClipVideoAssetOperationMarker)initWithCameraClip:(id)a3 operation:(id)a4 key:(id)a5;
- (HFCameraClipVideoAssetOperationMarker)next;
- (HFCameraClipVideoAssetOperationMarker)previous;
- (HMCameraClip)clip;
- (HMCameraClipFetchVideoAssetContextOperation)operation;
- (NSString)key;
- (void)setClip:(id)a3;
- (void)setKey:(id)a3;
- (void)setNext:(id)a3;
- (void)setOperation:(id)a3;
- (void)setPrevious:(id)a3;
@end

@implementation HFCameraClipVideoAssetOperationMarker

+ (id)sentinelWithKey:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(HFCameraClipVideoAssetOperationMarker);
  [(HFCameraClipVideoAssetOperationMarker *)v4 setKey:v3];

  return v4;
}

- (HFCameraClipVideoAssetOperationMarker)initWithCameraClip:(id)a3 operation:(id)a4 key:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFCameraClipVideoAssetOperationMarker;
  v12 = [(HFCameraClipVideoAssetOperationMarker *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_key, a5);
    objc_storeStrong((id *)&v13->_clip, a3);
    objc_storeWeak((id *)&v13->_operation, v10);
  }

  return v13;
}

- (HFCameraClipVideoAssetOperationMarker)previous
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previous);
  return (HFCameraClipVideoAssetOperationMarker *)WeakRetained;
}

- (void)setPrevious:(id)a3
{
}

- (HFCameraClipVideoAssetOperationMarker)next
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_next);
  return (HFCameraClipVideoAssetOperationMarker *)WeakRetained;
}

- (void)setNext:(id)a3
{
}

- (HMCameraClipFetchVideoAssetContextOperation)operation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  return (HMCameraClipFetchVideoAssetContextOperation *)WeakRetained;
}

- (void)setOperation:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (HMCameraClip)clip
{
  return self->_clip;
}

- (void)setClip:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clip, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_operation);
  objc_destroyWeak((id *)&self->_next);
  objc_destroyWeak((id *)&self->_previous);
}

@end