@interface _IKJSInspectorNetworkRequestRecord
- (void)_dispatchEvent:(int64_t)a3 block:(id)a4;
@end

@implementation _IKJSInspectorNetworkRequestRecord

- (void)_dispatchEvent:(int64_t)a3 block:(id)a4
{
  id v6 = a4;
  [(_IKJSInspectorSynchronousNetworkRequestRecord *)self _processEventType:a3];
  id v7 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self loader];
  [v7 dispatchEventWithBlock:v6];
}

@end