@interface _HMDCameraRemoteStreamTrackerAssertion
- (HMDCameraRemoteStreamTracker)streamTracker;
- (HMDCameraStreamSessionID)streamSessionID;
- (_HMDCameraRemoteStreamTrackerAssertion)initWithStreamTracker:(id)a3 streamIdentifier:(id)a4;
- (void)dealloc;
- (void)setStreamTracker:(id)a3;
@end

@implementation _HMDCameraRemoteStreamTrackerAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamSessionID, 0);
  objc_destroyWeak((id *)&self->_streamTracker);
}

- (HMDCameraStreamSessionID)streamSessionID
{
  return (HMDCameraStreamSessionID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStreamTracker:(id)a3
{
}

- (HMDCameraRemoteStreamTracker)streamTracker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_streamTracker);
  return (HMDCameraRemoteStreamTracker *)WeakRetained;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_streamTracker);
  [WeakRetained stopTrackingStreamWithSessionID:self->_streamSessionID];

  v4.receiver = self;
  v4.super_class = (Class)_HMDCameraRemoteStreamTrackerAssertion;
  [(_HMDCameraRemoteStreamTrackerAssertion *)&v4 dealloc];
}

- (_HMDCameraRemoteStreamTrackerAssertion)initWithStreamTracker:(id)a3 streamIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_HMDCameraRemoteStreamTrackerAssertion;
  v8 = [(_HMDCameraRemoteStreamTrackerAssertion *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_streamTracker, v6);
    objc_storeStrong((id *)&v9->_streamSessionID, a4);
  }

  return v9;
}

@end